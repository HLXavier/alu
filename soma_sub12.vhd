--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity soma_sub12 is
	port (A, B: in std_logic_vector(11 downto 0);
	      mode: in std_logic;
	      S: out std_logic_vector(11 downto 0);
	      cout: out std_logic);
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture soma_sub12 of soma_sub12 is
	signal c : std_logic_vector(12 downto 0);
begin

    c(0) <= mode;

	sb1: entity work.soma_sub
		 port map (A => A(0), B => B(0), m => mode, Cin => c(0), Cout => c(1), Soma => S(0));

	sb2: entity work.soma_sub
	 	 port map (A => A(1), B => B(1), m => mode, Cin => c(1), Cout => c(2), Soma => S(1));
		 
	sb3: entity work.soma_sub
		 port map (A => A(2), B => B(2), m => mode, Cin => c(2), Cout => c(3), Soma => S(2));
		 
	sb4: entity work.soma_sub
	 	 port map (A => A(3), B => B(3), m => mode, Cin => c(3), Cout => c(4), Soma => S(3));

	sb5: entity work.soma_sub
	 	 port map (A => A(4), B => B(4), m => mode, Cin => c(4), Cout => c(5), Soma => S(4));

	sb6: entity work.soma_sub
	 	 port map (A => A(5), B => B(5), m => mode, Cin => c(5), Cout => c(6), Soma => S(5));
		 
 	sb7: entity work.soma_sub
 		 port map (A => A(6), B => B(6), m => mode, Cin => c(6), Cout => c(7), Soma => S(6));
		 
 	sb8: entity work.soma_sub
 	 	 port map (A => A(7), B => B(7), m => mode, Cin => c(7), Cout => c(8), Soma => S(7));

 	sb9: entity work.soma_sub
 	 	 port map (A => A(8), B => B(8), m => mode, Cin => c(8), Cout => c(9), Soma => S(8));

 	sb10: entity work.soma_sub
 	 	 port map (A => A(9), B => B(9), m => mode, Cin => c(9), Cout => c(10), Soma => S(9));

 	sb11: entity work.soma_sub
 	 	 port map (A => A(10), B => B(10), m => mode, Cin => c(10), Cout => c(11), Soma => S(10));

 	sb12: entity work.soma_sub
 	 	 port map (A => A(11), B => B(11), m => mode, Cin => c(11), Cout => c(12), Soma => S(11));
 
	cout <= c(12);

end architecture;