class Personnummer

  attr_reader :year

  def initialize(min_age:, max_age:, gender:)

    # Variable declaration
    @months_days = { 1 => 31,
                    2 => 28,
                    3 => 31,
                    4 => 30,
                    5 => 31,
                    6 => 30,
                    7 => 31,
                    8 => 31,
                    9 => 30,
                    10 => 31,
                    11 => 30,
                    12 => 31 }

    @year = generate_year(min_age,max_age)
    @month = generate_month
    @day = generate_day(@month)
    @date = date_compiler(@year, @month, @day)
    @birthnumber = generate_birthnumber(gender)
    @birthcontrollnumber = generate_birthcontrollnumber(@date, @birthnumber)

  end

  def generate_year(min, max)

    current_year = Time.new.strftime("%Y").to_i
    age = Kernel.rand(min..max)
    year = current_year - age
    return year

  end

  def generate_month

    current_month = Time.new.strftime("%m").to_i
    random_month = Kernel.rand(0..12)
    month = current_month - random_month
    if month < 1
      month += 12
      year_decrease
    end
    return month

  end

  def generate_day(month)

    current_day = Time.new.strftime("%d").to_i
    random_day = rand(1..@months_days[month])
    day = current_day - random_day
    #available_days = Date.new(year, month, -1).mday

    if day < 1
      day += @months_days[month]
      month_decrease
    end
    return day

  end

  def year_decrease
    @year -= 1
  end

  def month_decrease
    @month -= 1
    if @month < 1
      @year -= 1
      @month += 12
    end
  end

  def date_compiler(year, month, day)
    year = year.to_s
    year = year[2..3]

    month = "0#{month}".to_s if month < 10

    day = "0#{day}".to_s if day < 10

    date = "#{year}#{month}#{day}"
    return date
  end

  def generate_birthnumber(gender)
    random_digits = Kernel.rand(0..99)
    random_digits = "0#{random_digits}" if random_digits < 10
    if gender == :female
      gender_digit = [0,2,4,6,8].sample
    else
      gender_digit = [1,3,5,7,9].sample
    end
    return "#{random_digits}#{gender_digit}"

  end

  def generate_birthcontrollnumber(date, birthnumber)



  end

end