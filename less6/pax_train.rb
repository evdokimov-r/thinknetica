require_relative 'train'
class PassengerTrain < Train
  def initialize(number)
    super
    @type = :pax
  end
end