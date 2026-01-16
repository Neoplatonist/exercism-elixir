defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * @billable_days_per_month
    ceil(apply_discount(monthly_rate, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_with_discount = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / daily_rate_with_discount, 1)
  end
end
