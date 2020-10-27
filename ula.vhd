--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.p_ula.all;

--------------------------------------
-- Entidade
--------------------------------------
entity alu is
	port(op1, op2 : in std_logic_vector(11 downto 0);
	opmode : in op_alu;
    z, cout: out std_logic;
	outalu : out std_logic_vector(11 downto 0));
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture alu of alu is
	signal aa, bb, soma: std_logic_vector(11 downto 0);
	signal mode: std_logic;
	signal c_out: std_logic;
begin

	----------------------------------
	-- Instancia o SomaSub
	----------------------------------
	z <= '1' when soma = x"000" else '0';

	cout <= c_out;

	mode <= '0' when opmode=uOP2 or opmode=uSOMA or opmode=uMU3_1 or opmode=uSAT else '1';

	aa <= x"000" when opmode=uOP2 or opmode=uNEG2 else
		op1(10 downto 0) & '0' when opmode=uMU3_1 else  
		op1;
	
	bb <= op1 when opmode=uMU3_1 else
	      op2; --- uOP2, uSOMA, uSUB12, uNEG2, uSAT

	sb: entity work.soma_sub12
		port map (a => aa, b => bb, mode => mode,
		          S => soma, cout => c_out);

	----------------------------------
	-- ULA
	----------------------------------
	outalu <= op1 nand op2 when opmode=uNAND else
			op1 nor op2 when opmode=uNOR else
			op1 xnor op2 when opmode=uNXOR else
			not op2 when opmode=uNOP2 else
			op1(9 downto 0) & '0' & '0' when opmode=uMU4 else
			op2(10 downto 0) & op2(11) when opmode=uROL2 else
			x"FFF" when opmode=uSAT and c_out='1' else
			soma; --- uOP2, uSOMA, uSUB12

end architecture;