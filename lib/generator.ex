defmodule Avroex.Generator do
  def generate(files, entries, fileprefix, type \\ Avroex.OrderEncoding) do
    schema = type.get_schema()
    lkup = fn _ -> :erlang.error("") end

    generator =
      case type do
        Avroex.OrderEncoding ->
          &generate_order_list/2

        Avroex.UserEncoding ->
          &generate_user_list/2
      end

    Enum.each(1..files, fn id ->
      :avro_ocf.write_file(
        "priv/generated/#{fileprefix}#{id}.ocf",
        lkup,
        schema,
        generator.(id, entries)
      )
    end)
  end

  def generate_order_list(file_id, entries) do
    Enum.map(1..entries, fn id ->
      Avroex.OrderEncoding.get_data_template(file_id, id)
    end)
  end

  def generate_user_list(file_id, entries) do
    Enum.map(1..entries, fn id ->
      Avroex.UserEncoding.get_data_template(file_id, id)
    end)
  end
end
