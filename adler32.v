// J Barrett Chesebrough
// ece 310-602
// adler32.v

module adler32(
				input clock, rst_n, data_valid,
				input [7:0] data,
				input last_data,
				output reg checksum_valid, 
				output reg [31:0] checksum
			   );
			   
	reg [15:0] A;
	reg [15:0] B; 
	
	integer modulus = 65521;
	
	always @(posedge clock)
	 	begin
	 	
		if(~rst_n || checksum_valid)
			begin
			checksum = 0; 
			checksum_valid = 0; 
			A = 1; 
			B = 0; 
			end 
		
			
		end

	always @*
	begin	
		
		if(data_valid)
			begin
			A = A + data; 
			if(A > modulus)
				 A = A - modulus;
				 	 
			 B = A + B;
			 
			if(B > modulus)
				B = (B - modulus); 
			end 
			
		checksum = {B,A};	
			
		 if(last_data && data_valid)
		 	begin
			checksum_valid <= 1;	
			end
	
	
	end
endmodule
		 