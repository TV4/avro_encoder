defmodule Avroex do
  @moduledoc """
  Documentation for `Avroex`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Avroex.hello()
      :world

  """

  def read(path), do: :avro_ocf.decode_file(path)
  def get_data({_headers, _schema, data}), do: data
  def extract_json_schema({{_, _, [{_, schema} | _], _}, _schema, _data}), do: schema
  def extract_schema({_headers, schema, _data}), do: schema
  def extract_headers({headers, _schema, _data}), do: headers
end
