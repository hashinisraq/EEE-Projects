//elevator_wpad module
module elevator_wpad(PAD_clk,PAD_reset, PAD_emer_stop, PAD_power_supply, PAD_peak_hour, PAD_current_floor, 
                    PAD_request_floor, PAD_total_weight, PAD_light_sensor, PAD_alarm_trigger,PAD_power_generator, 
                    PAD_floor_number_out, PAD_request_floor_out, PAD_door_open, PAD_weight_alert, PAD_display_floor, 
                    PAD_display_weight, PAD_light_on);

    input PAD_clk;                  // Clock input
    input PAD_reset;                 // Reset input
    input PAD_emer_stop;             // Emergency stop button input
    input PAD_power_supply;          // Power state input (0 for off, 1 for on)
    input PAD_peak_hour;             // Peak hour mode input (0 for off, 1 for on)
    input [3:0] PAD_current_floor;   // Input current floor number
    input [3:0] PAD_request_floor;   // Input requested floor number
    input [9:0] PAD_total_weight;    // Input total weight
    input PAD_light_sensor;          // Input light sensor (0 for off, 1 for on)
    input PAD_alarm_trigger;              // Trigger value for building alarm
    input PAD_power_generator;       // Power generator state input
	 
    output reg [3:0] PAD_floor_number_out;     // Output current floor number
    output reg [3:0] PAD_request_floor_out;   // Output requested floor number
    output reg PAD_door_open;       // Output door open signal
    output reg PAD_weight_alert;     // Output weight alert
    output reg PAD_display_floor;    // Output current floor for display
    output reg PAD_display_weight;  // Output total weight for display
    output reg PAD_light_on;         // Output light status (1 for on, 0 for off)

    wire wire_clk;                   
    wire wire_reset;                 
    wire wire_emer_stop;             
    wire wire_power_supply;          
    wire wire_peak_hour;       
    wire [3:0] wire_current_floor;
    wire [3:0] wire_request_floor;   
    wire [9:0] wire_total_weight;    
    wire wire_light_sensor;       
    wire wire_alarm_trigger;           
    wire wire_power_generator;      
	 
    wire [3:0] wire_floor_number_out;    
    wire [3:0] wire_request_floor_out;   
    wire wire_door_open;      
    wire wire_weight_alert;   
    wire wire_display_floor;   
    wire wire_display_weight; 
    wire wire_light_on;   

elevator elevator_submodule(wire_clk, wire_reset, wire_emer_stop, wire_power_supply, wire_peak_hour, wire_current_floor, 
                             wire_request_floor, wire_total_weight, wire_light_sensor, wire_alarm_trigger,wire_power_generator, 
                             wire_floor_number_out, wire_request_floor_out, wire_door_open, wire_weight_alert, wire_display_floor, 
                             wire_display_weight, wire_light_on);

PADDI pad_clk(.PAD(PAD_clk),.Y(wire_clk));
PADDI pad_reset(.PAD(PAD_reset),.Y(wire_reset));
PADDI pad_emer_stop(.PAD(PAD_emer_stop),.Y(wire_emer_stop));
PADDI pad_power_supply(.PAD(PAD_power_supply),.Y(wire_power_supply));
PADDI pad_peak_hour(.PAD(PAD_peak_hour),.Y(wire_peak_hour));

PADDI pad_current_floor3(.PAD(PAD_current_floor[3]),.Y(wire_current_floor[3]));
PADDI pad_current_floor2(.PAD(PAD_current_floor[2]),.Y(wire_current_floor[2]));
PADDI pad_current_floor1(.PAD(PAD_current_floor[1]),.Y(wire_current_floor[1]));
PADDI pad_current_floor0(.PAD(PAD_current_floor[0]),.Y(wire_current_floor[0]));

PADDI pad_request_floor3(.PAD(PAD_request_floor[3]),.Y(wire_request_floor[3]));
PADDI pad_request_floor2(.PAD(PAD_request_floor[2]),.Y(wire_request_floor[2]));
PADDI pad_request_floor1(.PAD(PAD_request_floor[1]),.Y(wire_request_floor[1]));
PADDI pad_request_floor0(.PAD(PAD_request_floor[0]),.Y(wire_request_floor[0]));

PADDI pad_total_weight9(.PAD(PAD_total_weight[9]),.Y(wire_total_weight[9]));
PADDI pad_total_weight8(.PAD(PAD_total_weight[8]),.Y(wire_total_weight[8]));
PADDI pad_total_weight7(.PAD(PAD_total_weight[7]),.Y(wire_total_weight[7]));
PADDI pad_total_weight6(.PAD(PAD_total_weight[6]),.Y(wire_total_weight[6]));
PADDI pad_total_weight5(.PAD(PAD_total_weight[5]),.Y(wire_total_weight[5]));
PADDI pad_total_weight4(.PAD(PAD_total_weight[4]),.Y(wire_total_weight[4]));
PADDI pad_total_weight3(.PAD(PAD_total_weight[3]),.Y(wire_total_weight[3]));
PADDI pad_total_weight2(.PAD(PAD_total_weight[2]),.Y(wire_total_weight[2]));
PADDI pad_total_weight1(.PAD(PAD_total_weight[1]),.Y(wire_total_weight[1]));
PADDI pad_total_weight0(.PAD(PAD_total_weight[0]),.Y(wire_total_weight[0]));

PADDI pad_light_sensor(.PAD(PAD_light_sensor),.Y(wire_light_sensor));
PADDI pad_alarm_trigger(.PAD(PAD_alarm_trigger),.Y(wire_alarm_trigger));
PADDI pad_power_generator(.PAD(PAD_power_generator),.Y(wire_power_generator));

PADDO pad_floor_number_out3(.PAD(PAD_floor_number_out[3]),.A(wire_floor_number_out[3]));
PADDO pad_floor_number_out2(.PAD(PAD_floor_number_out[2]),.A(wire_floor_number_out[2]));
PADDO pad_floor_number_out1(.PAD(PAD_floor_number_out[1]),.A(wire_floor_number_out[1]));
PADDO pad_floor_number_out0(.PAD(PAD_floor_number_out[0]),.A(wire_floor_number_out[0]));

PADDO pad_request_floor_out3(.PAD(PAD_request_floor_out[3]),.A(wire_request_floor_out[3]));
PADDO pad_request_floor_out2(.PAD(PAD_request_floor_out[2]),.A(wire_request_floor_out[2]));
PADDO pad_request_floor_out1(.PAD(PAD_request_floor_out[1]),.A(wire_request_floor_out[1]));
PADDO pad_request_floor_out0(.PAD(PAD_request_floor_out[0]),.A(wire_request_floor_out[0]));

PADDO pad_door_open(.PAD(PAD_door_open),.A(wire_door_open));
PADDO pad_weight_alert(.PAD(PAD_weight_alert),.A(wire_weight_alert));
PADDO pad_display_floor(.PAD(PAD_display_floor),.A(wire_display_floor));
PADDO pad_display_weight(.PAD(PAD_display_weight),.A(wire_display_weight));
PADDO pad_light_on(.PAD(PAD_light_on),.A(wire_light_on));

endmodule

//elevator module
module elevator(clk,reset,emer_stop,power_supply,peak_hour,current_floor, request_floor,
                    total_weight,light_sensor,alarm_trigger,power_generator, floor_number_out,
                    request_floor_out, door_open, weight_alert, display_floor, display_weight,light_on);

    input clk;            
    input reset;               
    input emer_stop;            
    input power_supply;          
    input peak_hour;             
    input [3:0] current_floor;  
    input [3:0] request_floor;  
    input [9:0] total_weight;    
    input light_sensor;         
    input alarm_trigger;              
    input power_generator;       
	 
    output reg [3:0] floor_number_out;    
    output reg [3:0] request_floor_out;   
    output reg door_open;       
    output reg weight_alert;     
    output reg display_floor;    
    output reg display_weight;  
    output reg light_on;

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
