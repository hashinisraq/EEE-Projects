module elevator (
    input clk,                   // Clock input
    input reset,                 // Reset input
    input emer_stop,             // Emergency stop button input
    input power_supply,           // Power state input (0 for off, 1 for on)
    input peak_hour,             // Peak hour mode input (0 for off, 1 for on)
    input [3:0] current_floor,   // Input current floor number
    input [3:0] request_floor,   // Input requested floor number
    input [9:0] total_weight,    // Input total weight
    input light_sensor,          // Input light sensor (0 for off, 1 for on)
    input alarm_trigger,               // Trigger value for building alarm
    input power_generator,       // Power generator state input
	 
    output reg [3:0] floor_number_out,     // Output current floor number
    output reg [3:0] request_floor_out,   // Output requested floor number
    output reg door_open,        // Output door open signal
    output reg weight_alert,     // Output weight alert
    output reg display_floor,    // Output current floor for display
    output reg display_weight,   // Output total weight for display
    output reg light_on          // Output light status (1 for on, 0 for off)
);

// Define states for the elevator FSM
parameter POWER_SUPPLY = 4'b0000, IDLE = 4'b0001, MOVE_UP = 4'b0010, MOVE_DOWN = 4'b0011, STOPPED = 4'b0100, EMERGENCY_STOPPED = 4'b0101, PEAK_HOUR = 4'b0110, WEIGHT_ALERT = 4'b0111, BUILDING_ALARM = 4'b1000, DISPLAY = 4'b1001, LIGHT = 4'b1010, POWER_GENERATOR = 4'b1011;
reg [3:0] current_floor_reg, request_floor_reg;

// Define state register and next state logic
reg [3:0] state, next_state;
always @ (posedge clk or posedge reset)
begin
    if (reset)
        state <= POWER_SUPPLY;
    else
        state <= next_state;
end

// Define outputs for floor number and request floor
always @ (posedge clk or posedge reset)
begin
    if (reset) begin
        floor_number_out <= 4'b0000;
        request_floor_out <= 4'b0000;
    end
    else begin
        floor_number_out <= current_floor_reg;
        request_floor_out <= request_floor_reg;
    end
end

// Define state transition logic
always @ (*)
begin
    case (state)
        POWER_SUPPLY:
            begin
                if (power_supply)
                    next_state = IDLE;
                else
                    next_state = POWER_SUPPLY;
            end
		  POWER_GENERATOR:
            begin
                if (power_supply)
                    next_state = IDLE;
                else
                    next_state = POWER_GENERATOR;
            end
        IDLE:
            begin
                if (emer_stop)
                    next_state = EMERGENCY_STOPPED;
                else if (!power_supply)
                    next_state = POWER_SUPPLY;
                else if (total_weight >= 1000 && !peak_hour)
                    next_state = WEIGHT_ALERT;
                else if (request_floor_reg != current_floor_reg)
                    next_state = STOPPED;
                else if (request_floor_reg > current_floor_reg)
                    next_state = MOVE_UP;
                else if (request_floor_reg < current_floor_reg)
                    next_state = MOVE_DOWN;
                else
                    next_state = IDLE;
            end
        MOVE_UP:
            begin
                if (current_floor_reg == 9)
                    next_state = STOPPED;
                else if (emer_stop)
                    next_state = EMERGENCY_STOPPED;
                else if (!power_supply)
                    next_state = STOPPED;
                else
                    next_state = MOVE_UP;
            end
        MOVE_DOWN:
            begin
                if (current_floor_reg == 0)
                    next_state = STOPPED;
                else if (emer_stop)
                    next_state = EMERGENCY_STOPPED;
                else if (!power_supply)
                    next_state = STOPPED;
                else
                    next_state = MOVE_DOWN;
            end
        STOPPED:
            begin
                if (emer_stop)
                    next_state = EMERGENCY_STOPPED;
                else if (power_supply)
                    next_state = IDLE;
                else
                    next_state = STOPPED;
            end
        EMERGENCY_STOPPED:
            begin
                if (!emer_stop)
                    next_state = IDLE;
                else
                    next_state = EMERGENCY_STOPPED;
            end
        PEAK_HOUR:
            begin
                if (emer_stop)
                    next_state = EMERGENCY_STOPPED;
                else if (!power_supply)
                    next_state = STOPPED;
                else if (request_floor_reg != current_floor_reg)
                    next_state = STOPPED;
                else if (request_floor_reg > current_floor_reg)
                    next_state = MOVE_UP;
                else if (request_floor_reg < current_floor_reg)
                    next_state = MOVE_DOWN;
                else
                    next_state = PEAK_HOUR;
            end
        WEIGHT_ALERT:
            begin
                if (total_weight < 1000 || peak_hour)
                    next_state = IDLE;
                else
                    next_state = WEIGHT_ALERT;
            end
        BUILDING_ALARM:
            begin
                if (alarm_trigger == 1) // If trigger is 1, turn off elevator supply
                    next_state = POWER_SUPPLY;
                else
                    next_state = BUILDING_ALARM;
            end
        DISPLAY:
            begin
                next_state = IDLE;
            end
        LIGHT:
            begin
                if(light_on)
							next_state = IDLE;
					  else
							next_state = LIGHT;
            end
    endcase
end

// Define state update logic
always @ (posedge clk)
begin
    if (reset)
    begin
        current_floor_reg <= 4'b0000;
        request_floor_reg <= 4'b0000;
        door_open <= 1'b1; // Doors open when the elevator is reset
    end
    else begin
        case (state)
            IDLE:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 0; // Close doors when not in stopped state
                end
            MOVE_UP:
                current_floor_reg <= current_floor_reg + 1;
            MOVE_DOWN:
                current_floor_reg <= current_floor_reg - 1;
            STOPPED:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 1; // Open doors when stopped
                end
            EMERGENCY_STOPPED:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 1; // Open doors in emergency stopped state
                end
            PEAK_HOUR:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 0; // Close doors during peak hours
                end
            WEIGHT_ALERT:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 0; // Close doors during weight alert
                end
            BUILDING_ALARM:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 1; // Open doors in emergency alarm state
                end
            DISPLAY:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 0; // Close doors during display
                end
            LIGHT:
                begin
                    current_floor_reg <= current_floor;
                    request_floor_reg <= request_floor;
                    door_open <= 0; // Close doors during light state
                end
        endcase
    end
end

// Define weight alert logic
always @*
begin
    if (total_weight >= 1000 && !peak_hour)
        weight_alert = 1'b1;
    else
        weight_alert = 1'b0;
end

// Define light logic
always @*
begin
    if (light_sensor)
        light_on = 1'b1;
    else
        light_on = 1'b0;
end


// Define display logic
always @*
begin
    display_floor = current_floor_reg;
    display_weight = total_weight;
end

endmodule
