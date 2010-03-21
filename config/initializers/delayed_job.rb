Delayed::Job.class_eval do
  class << self
    alias :db_time_now_ori :db_time_now
    def db_time_now
      (ActiveRecord::Base.default_timezone == :utc) ? Time.now.utc : Time.zone.now
      rescue NoMethodError
        Time.now 
    end
  end
end
