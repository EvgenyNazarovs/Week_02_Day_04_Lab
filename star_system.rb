class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    return @planets.map {|planet| planet.name }
  end

  def get_planet_by_name(name)
    return @planets.find {|planet| name == planet.name}
  end

  def get_largest_planet
      return @planets.max do
      |planet_1, planet_2| planet_1.diameter <=> planet_2.diameter
    end
  end

  def get_smallest_planet
    return @planets.min do
      |planet_1, planet_2| planet_1.diameter <=> planet_2.diameter
    end
  end

  def get_planets_with_no_moons
    return @planets.select {|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(number)
    planets = @planets.select {|planet| planet.number_of_moons > number}
    planets.map {|planet| planet.name}
  end

  def get_number_of_planets_closer_than(number)
    return @planets.count {|planet| planet.distance_from_sun < number}
  end

  def get_total_number_of_moons
    return @planets.reduce(0) {|total, planet| total += planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    planets = @planets.sort {|a, b| a.distance_from_sun <=> b.distance_from_sun}
    return planets.map {|planet| planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing
    planets = @planets.sort {|a,b| b.diameter <=> a.diameter}
    return planets.map {|planet| planet.name}
  end

end
