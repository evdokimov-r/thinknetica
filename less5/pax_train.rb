require_relative 'train'
class PaxTrain < Train
  def initialize(number)
    super
    @type = :cargo
  end
end