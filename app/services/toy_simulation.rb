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
        show_location
        @toy.save
      else
        main_orders command
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

  def final
    @positions
  end

  def show_location
    @positions << "#{@toy.x},#{@toy.y},#{@toy.face}"
  end

  def main_orders command
    case command
    when 'LEFT'
      left
    when 'RIGHT'
      right
    when 'MOVE'
      move_ahead
    end
  end

  def right
    index = DIRECTIONS.index @toy.face
    if index == 3
      index = -1
    else
      index = index
    end
    @toy.face = DIRECTIONS[index + 1]
  end

  def left
    index = DIRECTIONS.index @toy.face
    @toy.face = DIRECTIONS[index - 1]
  end

  def move_ahead
    case @toy.face
    when 'NORTH'
      @toy.y += 1 if @toy.y + 1 < 5
    when 'SOUTH'
      @toy.y -= 1 if @toy.y - 1 > 0
    when 'EAST'
      @toy.x += 1 if @toy.y + 1 < 5
    when 'WEST'
      @toy.x -= 1 if @toy.y - 1 > 0
    end
  end

end