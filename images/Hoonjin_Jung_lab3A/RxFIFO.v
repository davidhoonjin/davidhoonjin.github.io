module RxFIFO (PSEL, PWRITE, RxDATA, CLEAR_B, PCLK, RECV, PRDATA, SSPRXINTR, VALID);

input PSEL, PWRITE, CLEAR_B, PCLK, RECV;
input [7:0] RxDATA;
output [7:0] PRDATA;
output SSPRXINTR, VALID;

reg [1:0] wp;
reg [1:0] rp;
reg [7:0] mcell0, mcell1, mcell2, mcell3;
reg flag0, flag1, flag2, flag3;
reg [7:0] PRDATA;
wire full, empty;
wire wre, rde;


assign full = (flag3 && flag2 && flag1 && flag0);
assign empty = (!flag3 && !flag2 && !flag1 && !flag0);
assign SSPRXINTR = full;
assign rde = (PSEL && !PWRITE && !empty);
assign wre = (RECV && VALID);
assign VALID = !full;


always @ (posedge PCLK)          
begin
if (CLEAR_B == 0)
begin
wp <= 2'b00;
mcell0 <= 'bx;
mcell1 <= 'bx;
mcell2 <= 'bx;
mcell3 <= 'bx;
end
else if (wre)
begin
case (wp)
2'b00:
begin
mcell0 <= RxDATA;
wp <= (wp + 1);
end
2'b01:
begin
mcell1 <= RxDATA;
wp <= (wp + 1);
end
2'b10:
begin
mcell2 <= RxDATA;
wp <= (wp + 1);
end
2'b11:
begin
mcell3 <= RxDATA;
wp <= 0;
end
endcase
end
end


always @ (posedge PCLK)
begin
if (CLEAR_B == 0)
begin
rp <= 2'b00;
PRDATA <= 'bz;
end
else if (PWRITE)
PRDATA <= 'bz;
else if (rde)
begin
case (rp)
2'b00:
begin
PRDATA <= mcell0;
rp <= (rp + 1);
end
2'b01:
begin
PRDATA <= mcell1;
rp <= (rp + 1);
end
2'b10:
begin
PRDATA <= mcell2;
rp <= (rp + 1);
end
2'b11:
begin
PRDATA <= mcell3;
rp <= 0;
end
endcase
end
end


always @ (posedge PCLK)
begin
if (CLEAR_B == 0)
begin
flag0 <= 0;
flag1 <= 0;
flag2 <= 0;
flag3 <= 0;
end
else
begin
if (wre)
begin
case (wp)
2'b00: flag0 <= 1;
2'b01: flag1 <= 1;
2'b10: flag2 <= 1;
2'b11: flag3 <= 1;
endcase
end
if (rde)
begin
case (rp)
2'b00: flag0 <= 0;
2'b01: flag1 <= 0;
2'b10: flag2 <= 0;
2'b11: flag3 <= 0;
endcase
end
end
end
endmodule
