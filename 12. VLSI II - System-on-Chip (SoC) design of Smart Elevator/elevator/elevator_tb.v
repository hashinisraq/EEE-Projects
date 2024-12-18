`timescale 1ns/1ps
module elevator_tb;

    // Define parameters
    parameter CLK_PERIOD = 10; // Clock period in nanoseconds

    // Declare signals
    reg clk;
    reg reset;
    reg emer_stop;
    reg power_supply;
    reg peak_hour;
    reg [3:0] current_floor;
    reg [3:0] request_floor;
    reg [9:0] total_weight;
    reg light_sensor;
    reg alarm_trigger;
    reg power_generator;
    
    wire [3:0] floor_number_out;
    wire [3:0] request_floor_out;
    wire door_open;
    wire weight_alert;
    wire [3:0] display_floor;
    wire [9:0] display_weight;
    wire light_on;
    
    // Instantiate the elevator module
    elevator elevator_inst (
        .clk(clk),
        .reset(reset),
        .emer_stop(emer_stop),
        .power_supply(power_supply),
        .peak_hour(peak_hour),
        .current_floor(current_floor),
        .request_floor(request_floor),
        .total_weight(total_weight),
        .light_sensor(light_sensor),
        .alarm_trigger(alarm_trigger),
        .power_generator(power_generator),
        .floor_number_out(floor_number_out),
        .request_floor_out(request_floor_out),
        .door_open(door_open),
        .weight_alert(weight_alert),
        .display_floor(display_floor),
        .display_weight(display_weight),
        .light_on(light_on)
    );

    // Initial values
    initial begin
        clk = 0;
        reset = 1;
        emer_stop = 0;
        power_supply = 1;
        peak_hour = 0;
        current_floor = 0;
        request_floor = 0;
        total_weight = 0;
        light_sensor = 0;
        alarm_trigger = 0;
        power_generator = 0;

        #100;      // Wait for 100 ns
        reset = 0;
        clk=1;
        request_floor = 5;

        #100;      // Wait for 100 ns
        current_floor = 5;
	total_weight = 600;
        request_floor = 9;

        #100;             // Wait for 100 ns
	current_floor = 9;
        total_weight = 1200;
        request_floor = 0;
    
   
 	#100;            // Wait for 100 ns
	current_floor = 0;
        total_weight = 0;

        #100; // Wait for 100 ns
        request_floor = 7; 

        #100; // Wait for 100 ns
        current_floor = 7;
        total_weight = 400;
        power_supply = 0;
        power_generator = 1;
        request_floor = 0; 

        #100; // Wait for 100 ns
        current_floor = 0;
        total_weight = 0;
        peak_hour = 1;

        #100; // Wait for 100 ns
        peak_hour = 0;
        request_floor = 3;

        #100; // Wait for 100 ns
        current_floor = 3;
        total_weight = 700;
        alarm_trigger = 1;
        emer_stop = 1;
        request_floor = 0;

        #100; // Wait for 100 ns
        #100; // Wait for 100 ns
        current_floor = 0;
        light_sensor = 1;
        #100; // Wait for 100 ns

        $stop; // Stop simulation
    end
    
endmodule

