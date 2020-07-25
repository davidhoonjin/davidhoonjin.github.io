module TxLogic (PCLK, CLEAR_B, VALID, TxDATA, SSPOE_B, SSPTXD, SSPFSSOUT, SSPCLKOUT, SENT);


input PCLK, CLEAR_B, VALID;
input [7:0] TxDATA;
output SSPOE_B, SSPTXD, SSPFSSOUT, SSPCLKOUT, SENT;


reg [3:0] state;
reg  SSPOE_B, SSPTXD, SSPFSSOUT,  SSPCLKOUT, SENT, cnt, state_e, counter;
reg [7:0] TxDATA_temp;



always @ (posedge SSPCLKOUT)
begin
TxDATA_temp <= TxDATA;
end

always @ (posedge PCLK)
begin
if (!CLEAR_B)  SSPCLKOUT <= 0;
else SSPCLKOUT <= ~SSPCLKOUT;
end


always @ (posedge PCLK)
begin
if (!CLEAR_B)
begin
SENT <= 0;
cnt <= 0;
end
else if (state == 7 || state == 8)
begin
if(!cnt)
begin
cnt <= ~cnt;
SENT <= 1;
end
else
begin
cnt <= ~cnt;
SENT <= 0;
end
end
else begin
cnt <= 0;
SENT <= 0;
end
end

always @ (posedge PCLK)
begin
if (!CLEAR_B)
begin
state_e <= 1;
counter <= 0;
end
else if (counter)
begin
state_e <= 0;
counter <= 0;
end
else
counter <= ~counter;
end

always @ (posedge SSPCLKOUT)
begin
if (state_e)
state <= 4'b1000;
else
begin
case(state)
4'b0000:
begin
SSPFSSOUT <= 0;
state <= (state + 1);
SSPTXD <= TxDATA[7];
end
4'b0001:
begin
state <= (state +1);
SSPTXD <= TxDATA[6];
end
4'b0010:
begin
state <= (state +1);
SSPTXD <= TxDATA[5];
end
4'b0011:
begin
state <= (state +1);
SSPTXD <= TxDATA[4];
end
4'b0100:
begin
state <= (state +1);
SSPTXD <= TxDATA[3];
end
4'b0101:
begin
state <= (state +1);
SSPTXD <= TxDATA[2];
end
4'b0110:
begin
state <= (state +1);
SSPTXD <= TxDATA[1];
end
4'b0111:
begin
if (VALID)
begin
state <= 4'b0000;
SSPTXD <= TxDATA_temp[0];
SSPFSSOUT <= 1;
end
else
begin
state <= (state + 1);
SSPTXD <= TxDATA_temp[0];
end
end
4'b1000:
begin
if (VALID)
begin
state <= 4'b0000;

SSPFSSOUT <= 1;
end
else
begin
state <= 4'b1000;
end
end
endcase
end
end

always @ (posedge PCLK)
begin
if (state <= 7 && state >= 0)
SSPOE_B <= 0;
else if (state == 8)
begin
if (VALID)
SSPOE_B <= 1;
end
else
 SSPOE_B <= 1;
end

endmodule
