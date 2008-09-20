module BucketsHelper
  def week_options
    options_for_select(period_values('week')).gsub("\n", '')
  end
  
  def month_options
    options_for_select(period_values('month')).gsub("\n", '')
  end
  
  def year_options
    options_for_select(period_values('year')).gsub("\n", '')
  end
  
  def period_options(period)
    eval("#{period}_options")
  end
  
  def period_values(period)
    case period
    when 'week'
      (1..7).to_a.map(&:to_s)
    when 'year'
      (1..365).to_a.map(&:to_s)
    else
      (1..28).to_a.map(&:to_s) << "last"
    end
  end
  
  def th(day)
    day ||= '1'
    case true
    when ['11','12','13'].include?(day)
      'th'
    when day.last == '1'
      'st'
    when day == 'last'
      ''
    when day.last == '2'
      'nd'
    when day.last == '3':
      'rd'
    else
      'th'
    end
  end
end
