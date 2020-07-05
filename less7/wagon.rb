class Wagon 
  WAGON_TYPES = %i[passenger cargo].freeze

  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def validate!
    raise ArgumentError, "Неверный тип вагона" unless WAGON_TYPES.include?(type)
  end
end
