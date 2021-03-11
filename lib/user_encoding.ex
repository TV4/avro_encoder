defmodule Avroex.UserEncoding do
  @spec get_data_template(any) :: [
          {<<_::24, _::_*8>>, :null | true | <<_::24, _::_*8>> | number},
          ...
        ]

  def get_data_template(id) do
    [
      {"vimond_user_id", "#{vimond_id(id)}"},
      {"email", "test-#{id}@example.test"},
      {"contact_id", 11_111_111_111},
      {"csn", "12345566"},
      {"customer_id", "aaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa"},
      {"date_of_birth", 123_435_687},
      {"postcode", "12345"},
      {"forename", "test"},
      {"surname", "test"},
      {"country_code", "SWE"},
      {"country_name", "Sweden"}
    ]
  end

  def get_data_template(file_id, entry_id) when is_integer(file_id) and is_integer(entry_id) do
    [
      {"vimond_user_id", "#{vimond_id_extra(file_id, entry_id)}"},
      {"email", "test-#{file_id}-#{entry_id}@example.test"},
      {"contact_id", 11_111_111_111},
      {"csn", "12345566"},
      {"customer_id", "aaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa"},
      {"date_of_birth", 123_435_687},
      {"postcode", "12345"},
      {"forename", "test"},
      {"surname", "test"},
      {"country_code", "SWE"},
      {"country_name", "Sweden"}
    ]
  end

  def get_data_template(id, code) do
    [
      {"vimond_user_id", "#{vimond_id(id)}"},
      {"email", "test-#{id}@example.test"},
      {"contact_id", 11_111_111_111},
      {"csn", "12345566"},
      {"customer_id", "aaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa"},
      {"date_of_birth", 123_435_687},
      {"postcode", "12345"},
      {"forename", "test"},
      {"surname", "test"},
      {"country_code", "SWE"},
      {"country_name", "Sweden"}
    ]
  end

  def get_schema(), do: Avroex.read("priv/users_template.ocf") |> Avroex.extract_schema()

  defp vimond_id(id, size \\ 10)
  defp vimond_id(id, size) when is_integer(id), do: Integer.to_string(id) |> vimond_id(size)
  defp vimond_id(id, size), do: String.pad_trailing(id, size - String.length(id), "0")

  defp vimond_id_extra(file_id, entry_id) do
    "#{file_id}#{entry_id}10101010"
  end
end
