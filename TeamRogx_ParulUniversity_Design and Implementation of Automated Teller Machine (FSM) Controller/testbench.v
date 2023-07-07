
`define true 1'b1
`define false 1'b0

`define FIND 1'b0
`define AUTHENTICATE 1'b1

`define WAITING               3'b000
`define GET_PIN               3'b001
`define MENU                  3'b010
`define BALANCE               3'b011
`define WITHDRAW              3'b100
`define WITHDRAW_SHOW_BALANCE 3'b101
`define TRANSACTION           3'b110
`define DONE                  3'b111

module atm_tb();
  
  reg clk, exit;
  reg [11:0] accNumber;
  reg [3:0] pin;
  reg [11:0] destinationAccNumber;
  reg [2:0] menuOption;
  reg [10:0] amount;
  wire error;
  wire [10:0] balance;
  
  ATM atmModule(clk, exit, accNumber, pin, destinationAccNumber, menuOption, amount, error, balance);
  
  
  initial begin
    clk = 1'b0;
  end
  
   always @(error) begin
      if(error == `true)
        $display("Error!, action causes an invalid operation.");
   end
  
  initial begin
	


    accNumber = 12'd2278;
    pin = 4'b0100;
    
    #30


    accNumber = 12'd2178;
    pin = 4'b0100;
    
    #30
    

    amount = 100;
	menuOption = `WITHDRAW_SHOW_BALANCE;
    clk = ~clk;#5clk = ~clk;
    #30


	menuOption = `BALANCE;
    clk = ~clk;#5clk = ~clk;
    #30

    amount = 2500;
	menuOption = `WITHDRAW;
    clk = ~clk;#5clk = ~clk;
    #30

	menuOption = `BALANCE;
    clk = ~clk;#5clk = ~clk;
    #30

    amount = 50;
    destinationAccNumber = 2816;
	menuOption = `TRANSACTION;
    clk = ~clk;#5clk = ~clk;
    #30

    amount = 2550;
    destinationAccNumber = 2816;
	menuOption = `TRANSACTION;
    clk = ~clk;#5clk = ~clk;
    #30

    exit = 1;
    #30
    exit = 0;
    #30
    
    //log in using the account with number 2816
    accNumber = 12'd2816;
    pin = 4'b0110;
    #30


    menuOption = `BALANCE;
    clk = ~clk;#5clk = ~clk;
    #30;
    
  end
  
endmodule
