require_relative 'wagon'
class PaxWagon < Wagon
  def initialize
    @type = :pax
  end
end
