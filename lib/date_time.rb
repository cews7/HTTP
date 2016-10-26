class DateTime
  def date_time_response
    Time.now.strftime("%I %M %p on %A, %B %e, %Y")
  end
end
