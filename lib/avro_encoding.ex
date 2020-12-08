defmodule Avroex.AvroEncoding do
  @spec get_data_template(any) :: [
          {<<_::24, _::_*8>>, :null | true | <<_::24, _::_*8>> | number},
          ...
        ]

  def get_data_template(id) do
    [
      {"vimond_user_id", "#{vimond_id(id)}"},
      {"email", :null},
      {"contact_id", 123_456_789},
      {"csn", "123456789"},
      {"customer_id", "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"},
      {"order_id", "123456789"},
      {"subcontract_id", 123_456_789},
      {"account_id", 123_456_789},
      {"sales_item_code", "779947B441614BE0BD8B"},
      {"sales_item_name", "C More TV4"},
      {"product_type", "SUBSCRIPTION"},
      {"product_price", 139.0},
      {"subcontract_status", "CUSTOMER_CANCELLED"},
      {"start_date", 1_558_051_200_000_000},
      {"end_date", 1_568_678_400_000_000},
      {"earliest_end_date", 1_558_051_200_000_000},
      {"init_charge", 0.0},
      {"init_price", 139.0},
      {"next_payment_date", 1_568_678_400_000_000},
      {"credit_card_expiry_date", 1_619_827_200_000_000},
      {"free_trial", false},
      {"free_trial_days", :null},
      {"currency_code", "SEK"},
      {"referrer_id", :null},
      {"country_code", "SWE"},
      {"country_name", "Sweden"},
      {"discount_name", :null},
      {"discount_repeats", :null},
      {"discount_application_count", :null},
      {"discount_remaining", :null},
      {"discount_monetary_value", :null},
      {"discount_percentage", :null},
      {"campaign_code", :null},
      {"source_code", :null},
      {"promotion_code", :null},
      {"refer_a_friend_code", :null},
      {"cancel_scheduled_date", 1_566_172_800_000_000},
      {"product_category", "Subscription"},
      {"product_country", "Sweden"},
      {"product_group", "C+More+TV4"}
    ]
  end

  def get_data_template(file_id, entry_id) when is_integer(file_id) and is_integer(entry_id) do
    [
      {"vimond_user_id", "#{vimond_id_extra(file_id, entry_id)}"},
      {"email", :null},
      {"contact_id", 123_456_789},
      {"csn", "123456789"},
      {"customer_id", "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"},
      {"order_id", "123456789"},
      {"subcontract_id", 123_456_789},
      {"account_id", 123_456_789},
      {"sales_item_code", "779947B441614BE0BD8B"},
      {"sales_item_name", "C More TV4"},
      {"product_type", "SUBSCRIPTION"},
      {"product_price", 139.0},
      {"subcontract_status", "CUSTOMER_CANCELLED"},
      {"start_date", 1_558_051_200_000_000},
      {"end_date", 1_568_678_400_000_000},
      {"earliest_end_date", 1_558_051_200_000_000},
      {"init_charge", 0.0},
      {"init_price", 139.0},
      {"next_payment_date", 1_568_678_400_000_000},
      {"credit_card_expiry_date", 1_619_827_200_000_000},
      {"free_trial", false},
      {"free_trial_days", :null},
      {"currency_code", "SEK"},
      {"referrer_id", :null},
      {"country_code", "SWE"},
      {"country_name", "Sweden"},
      {"discount_name", :null},
      {"discount_repeats", :null},
      {"discount_application_count", :null},
      {"discount_remaining", :null},
      {"discount_monetary_value", :null},
      {"discount_percentage", :null},
      {"campaign_code", :null},
      {"source_code", :null},
      {"promotion_code", :null},
      {"refer_a_friend_code", :null},
      {"cancel_scheduled_date", 1_566_172_800_000_000},
      {"product_category", "Subscription"},
      {"product_country", "Sweden"},
      {"product_group", "C+More+TV4"}
    ]
  end

  def get_data_template(id, code) do
    [
      {"vimond_user_id", "#{vimond_id(id)}"},
      {"email", :null},
      {"contact_id", 123_456_789},
      {"csn", "123456789"},
      {"customer_id", "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"},
      {"order_id", "123456789"},
      {"subcontract_id", 123_456_789},
      {"account_id", 123_456_789},
      {"sales_item_code", code},
      {"sales_item_name", "C More TV4"},
      {"product_type", "SUBSCRIPTION"},
      {"product_price", 139.0},
      {"subcontract_status", "CUSTOMER_CANCELLED"},
      {"start_date", 1_558_051_200_000_000},
      {"end_date", 1_568_678_400_000_000},
      {"earliest_end_date", 1_558_051_200_000_000},
      {"init_charge", 0.0},
      {"init_price", 139.0},
      {"next_payment_date", 1_568_678_400_000_000},
      {"credit_card_expiry_date", 1_619_827_200_000_000},
      {"free_trial", false},
      {"free_trial_days", :null},
      {"currency_code", "SEK"},
      {"referrer_id", :null},
      {"country_code", "SWE"},
      {"country_name", "Sweden"},
      {"discount_name", :null},
      {"discount_repeats", :null},
      {"discount_application_count", :null},
      {"discount_remaining", :null},
      {"discount_monetary_value", :null},
      {"discount_percentage", :null},
      {"campaign_code", :null},
      {"source_code", :null},
      {"promotion_code", :null},
      {"refer_a_friend_code", :null},
      {"cancel_scheduled_date", 1_566_172_800_000_000},
      {"product_category", "Subscription"},
      {"product_country", "Sweden"},
      {"product_group", "C+More+TV4"}
    ]
  end

  def get_schema(), do: Avroex.read("priv/template.ocf") |> Avroex.extract_schema()

  defp vimond_id(id, size \\ 10)
  defp vimond_id(id, size) when is_integer(id), do: Integer.to_string(id) |> vimond_id(size)
  defp vimond_id(id, size), do: String.pad_trailing(id, size - String.length(id), "0")

  defp vimond_id_extra(file_id, entry_id) do
    "#{file_id}#{entry_id}10101010"
  end
end
