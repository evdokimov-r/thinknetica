require_relative 'cargo_train.rb'
require_relative 'cargo_wagon'
require_relative 'pax_train'
require_relative 'pax_wagon'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'wagon'
require_relative 'instance_counter.rb'

class RailGame
  attr_reader :stations, :wagons, :trains, :routes
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end
  
=begin
  def example
    s1 = Station.new('некрасовка')
    @stations.push(s1)
    s2 = Station.new('рязанский проспект')
    @stations.push(s2 )
    s3 = Station.new('текстильщики')
    @stations.push(s3)
    t1 = CargoTrain.new(123)
    @trains.push(t1)
    t2 = PaxTrain.new(345)
    @trains.push(t2)
  end
=end

  def main_menu
    loop do 
      puts 'Главное меню'
      puts '1. Станции'
      puts '2. Поезда'
      puts '3. Маршруты'
      puts '4. Вагоны'
      print 'Ваш выбор:'
      answer = gets.chomp

      case answer
        when '1'
          menu_stations
        when '2'
          menu_trains
        when '3'
          menu_routes
        when '4'
          menu_wagons
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end
  end

  def menu_stations

    loop do 
      puts '1. Создать станцию'
      puts '2. Просмотреть список  станций и поезда на них'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          create_station
        when '2'
          trains_on_stations
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end

  end

  def create_station

    puts 'Введите название станции'
    name = gets.chomp.to_s

    station = Station.new(name)
    @stations.push(station)

    puts "Станция '#{name}' успешно была добавлена!"

    loop do 
      puts '1. Создать еще одну станцию'
      puts '2. Вернуться в меню Станции'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          create_station
        when '2'
          menu_stations
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end

  end

  def trains_on_stations
    @stations.each do |station|
      print station.name
      station.trains.each do |train|
        puts ": #{train.number}"
      end
    end
    
    loop do 
      puts '1. Вернуться в меню Станции'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          menu_stations
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end

  end

  def menu_trains

    loop do 
      puts '1. Создать поезд'
      puts '2. Переместить поезд по маршруту'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          create_train
        when '2'
          go_train
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end

  end

  def create_train
    begin
      puts 'Выберите тип поезда'
      puts '1. Грузовой'
      puts '2. Пассажирский'
      puts '0. Главное меню'
      answer = gets.chomp

      puts 'Введите номер поезда'
      name = gets.chomp.capitalize

      case answer
        when '1'
          train = CargoTrain.new(name)
          @trains.push(train)
        when '2'
          train = PassengerTrain.new(name)
          @trains.push(train)
        when '0'
          main_menu
        #else
          #puts 'Неверный выбор, попробуйте еще раз'
      end
      rescue RuntimeError => e
        puts e.message
      retry
    end

    puts "Поезд '#{name}' успешно был создан!"

    loop do 
      puts '1. Создать еще один поезд'
      puts '2. Вернуться в меню Поезда'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          create_train
        when '2'
          menu_trains
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end

  end

  def go_train
    puts 'Выберите поезд'
    select_train = choise_trains

    if select_train.route.nil? 
      puts 'У поезда нет маршрута' 
      menu_trains
    end

    puts "Действие: 
    \n1.На одну станцию вперед переместить
    \n2.На одну станцию назад переместить"
    answer = gets.chomp
    case answer
      when '1'
        select_train.to_next_station
      when '2'
        select_train.to_prev_station
      else
        puts 'Неверный выбор, попробуйте еще раз'
    end

    main_menu

  end

  def menu_routes
    loop do 
      puts '1. Создать маршрут'
      puts '2. Показать маршруты (добавить, удалить, назначить)'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          create_route
        when '2'
          show_routes
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end
  end

  def create_route

    puts 'Выберите начальную станцию:'
    first_station = choise_stations

    puts 'Выберите конечную станцию:'
    last_station = choise_stations

    @routes << Route.new(first_station, last_station)
    puts "Маршрут #{first_station.name} - #{last_station.name} создан"

    main_menu

  end

  def choise_stations
    @stations.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
    @stations[gets.chomp.to_i]
  end

  def choise_trains
    @trains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
    @trains[gets.chomp.to_i]
  end

  def choise_routes
    @routes.each_with_index do |route, index|
      puts "#{index + 1}: #{route.first_station.name} - #{route.last_station.name}"
    end
    @routes[gets.chomp.to_i]
  end

  def choise_route_station(route)
    route.stations.each_with_index { |station, index| puts "#{index + 1} #{station.name}" }
    route.stations[gets.chomp.to_i]
  end

  def show_routes
    puts 'Выберите маршрут'
    route = choise_routes

    puts '1. Добавить станцию на маршрут'
    puts '2. Удалить станцию на маршруте'
    puts '3. Назначить маршрут поезду'
    puts '0. Главное меню'
    answer = gets.chomp
    case answer
      when '1'
        puts 'Выберите станцию для добавления'
        station = choise_stations
        route.add_station(station)
        puts "Станция #{station.name} добавлена в маршрут"
      when '2'
        puts 'Выберите станцию, которую необходимо удалить'
        station = choise_route_station(route)
        route.delete_station(station)
        puts "Станция #{station.name} удалена из маршрута"
      when '3'
        puts 'Выберите поезд для назначения маршрута'
        train = choise_trains
        train.get_route(route)
        puts "Маршрут назначен поезду - #{train.number} "
      when '0'
        main_menu
      else
        puts 'Неверный выбор, попробуйте еще раз'
        show_routes
    end
    main_menu
  end 

  def choise_route_station(route)
    route.stations.each_with_index { |station, index| puts "#{index + 1} #{station.name}" }
    route.stations[gets.chomp.to_i]
  end

  def menu_wagons
    loop do 
      puts '1. Добавить вагон к поезду'
      puts '2. Отцепить вагон от поезда'
      puts '0. Главное меню'
      answer = gets.chomp

      case answer
        when '1'
          add_wagon
        when '2'
          delete_wagon
        when '0'
          main_menu
        else
          puts 'Неверный выбор, попробуйте еще раз'
          next
      end
      break
    end    
  end

  def add_wagon
    puts 'Выберите поезд для добавления вагона'
    train = choise_trains
    train.add_wagon(PassengerWagon.new)
    train.add_wagon(CargoWagon.new)
    puts "Вагон добавлен"
    main_menu
  end

  def delete_wagon
    puts 'Выберите поезд для удаления вагона'
    train = choise_trains

    if train.wagons.nil?
      puts 'У поезда нет вагонов'
    else
      train.delete_wagon(train.wagons.last)
      puts 'Вагон отцеплен'
    end

 
    main_menu
  end

end

