defmodule Avroex.Generator do
  def generate(files \\ 3, entries \\ 15, fileprefix \\ "testdata")

  def generate(files, item_codes, fileprefix) when is_list(item_codes) do
    schema = Avroex.AvroEncoding.get_schema()
    lkup = fn _ -> :erlang.error("") end

    Enum.each(1..files, fn id ->
      :avro_ocf.write_file(
        "priv/generated/#{fileprefix}#{id}.ocf",
        lkup,
        schema,
        generate_order_list(item_codes)
      )
    end)
  end

  def generate(files, entries, fileprefix) do
    schema = Avroex.AvroEncoding.get_schema()
    lkup = fn _ -> :erlang.error("") end

    Enum.each(1..files, fn id ->
      :avro_ocf.write_file(
        "priv/generated/#{fileprefix}#{id}.ocf",
        lkup,
        schema,
        generate_order_list(id, entries)
      )
    end)
  end

  @spec generate_order_list(maybe_improper_list) :: [any]
  def generate_order_list(item_codes) when is_list(item_codes) do
    Enum.map(item_codes, fn item_code ->
      Avroex.AvroEncoding.get_data_template(1, item_code)
    end)
  end

  def generate_order_list(file_id, entries) do
    Enum.map(1..entries, fn id ->
      Avroex.AvroEncoding.get_data_template(file_id, id)
    end)
  end
end
