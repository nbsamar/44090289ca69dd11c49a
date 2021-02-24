class ToySimulation

  DIRECTIONS = %w[NORTH EAST SOUTH WEST]

  def initialize(toy, commands)
    @toy = toy
    @commands = commands
    @positions = []
  end

  def simulation
    @commands.each do |command|
      if command.include? 'PLACE'
        set_initial_position
      elsif command == 'REPORT'
      #
      else
      #
      end
    end
  end

  private
  def set_initial_position
    return unless @commands.first.include? 'PLACE'
    command = @commands.first
    command.split(' ')[1].split(',')
    @toy.x = command[0].to_i
    @toy.y = command[1].to_i
    @toy.face = command[2].to_s
  end

  def show_location
    @positions << "#{@toy.x},#{@toy.y},#{@toy.face}"
  end

end