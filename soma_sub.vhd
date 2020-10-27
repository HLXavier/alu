--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------
-- Entidade
--------------------------------------
entity soma_sub is
	port (A, B, m, Cin: in std_logic;
	      Cout, Soma: out std_logic);
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture soma_sub of soma_sub is
	signal bb: std_logic;
begin

    bb <= B xor m;

	Cout <= (A and bb) or (A and Cin) or (bb and Cin);
	
	Soma <= A xor bb xor Cin;
	
end architecture;