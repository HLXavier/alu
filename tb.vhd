--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.p_ula.all;

--------------------------------------
-- Entidade
--------------------------------------
entity tb is
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture tb of tb is
	signal op1, op2, outalu: std_logic_vector(11 downto 0);
	signal z, cout : std_logic;
	signal opmode : op_alu;

	type test_record is record
	    a, b : std_logic_vector(11 downto 0);
	end record;

    type padroes is array(natural range <>) of test_record;

	constant padrao_de_teste : padroes := (
	    (a => x"800", b => x"800"),
		(a => x"F47", b => x"EA1")
	);

begin

	DUT: entity work.alu
	    port map( op1 => op1, op2 => op2, outalu => outalu,
	              z => z, cout => cout, opmode => opmode);

	TEST: process
	begin
		for op in op_alu loop
			opmode <= op;
			
			for i in 0 to padrao_de_teste'high loop
				op1 <= padrao_de_teste(i).a;
				op2 <= padrao_de_teste(i).b;
				wait for 10 ns;
			end loop;
		end loop;
	end process;

end architecture;