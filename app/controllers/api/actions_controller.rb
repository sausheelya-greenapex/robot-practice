class Api::ActionsController < ApplicationController
	def order
		initial_postion = params[:command]
		@location    = initial_postion[0]
		for i in initial_postion do 
		    when "MOVE"
			    move()
		    when "LEFT"
			    left()
		    when "RIGHT"
			    right()
		    when "REPORT"
			    render json: {"result": @location}
	        else
	    	    puts "Command Invalid"
	        end
	    end  
	end
	private

	def left
		robo_initial_pos = @location.split(',').flatten
		x_axis = robo_initial_pos[0].to_i
		y_axis = robo_initial_pos[1].to_i
		directon = robo_initial_pos[2].strip
		if directon == "EAST"
			new_direction = "NORTH"
		elsif directon == "WEST"
			new_direction = "SOUTH"
		elsif directon == "NORTH"
			new_direction = "WEST"
		elsif directon == "SOUTH"
			new_direction = "EAST"
		end
		@location = [x_axis,y_axis,"#{new_direction}"]
	end


	def right
		robo_initial_pos = @location.split(',').flatten
        x_axis = robo_initial_pos[0].to_i
		y_axis = robo_initial_pos[1].to_i
        directon = robo_initial_pos[2].strip
        if direction == "EAST"
          new_direction = "SOUTH"
        elsif direction == "WEST"
           new_direction = "NORTH"
        elsif direction == "NORTH"
           new_direction = "EAST"
        elsif direction == "SOUTH"
            new_direction = "WEST"
        end
        @location = [x_axis,y_axis,"#{new_direction}"]
    end


    def move
    robo_initial_pos = @place.split(',').flatten
    x_axis = robo_initial_pos[0].to_i
    y_axis = robo_initial_pos[1].to_i
    direction = robo_initial_pos[2].strip
    case direction
    when "EAST"
      x_axis = x_axis + 1
    when "WEST"
      x_axis = x_axis - 1
    when "NORTH"
      y_axis = y_axis + 1
    when "SOUTH"
      y_axis = y_axis -1
    else
      "WRONG COMMAND"
    end
    @location  = [x_axis,y_axis,"#{direction}"]
    end
end
