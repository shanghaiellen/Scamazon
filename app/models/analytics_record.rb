class AnalyticsRecord < ActiveRecord::Base
  def self.event(name, value)
    begin
      AnalyticsRecord.create(name: name, value: value)
    rescue
    end
  end
end