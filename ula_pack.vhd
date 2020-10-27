--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------
-- Pacote
--------------------------------------
package p_ula is
	type op_alu is
		(uNAND, uNOR, uNXOR, uOP2, uNOP2, uMU4, uROL2, uSOMA, uSUB12, uNEG2, uMU3_1, uSAT);

end package;