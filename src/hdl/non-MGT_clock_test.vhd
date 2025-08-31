library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity non_MGT_clock_test is
    Port ( sysclk : in STD_LOGIC;
           testclk_p : in STD_LOGIC;
           testclk_n : in STD_LOGIC;
           freq_o : out STD_LOGIC_VECTOR (31 downto 0));
end non_MGT_clock_test;

architecture Behavioral of non_MGT_clock_test is

signal ibuf_out : std_logic;

begin

IBUFDS_inst : IBUFDS
   port map (
      O => ibuf_out,
      I => testclk_p,
      IB => testclk_n
   );

  
clk_ctr: entity work.freq_counter
    port map(
        reset => '0',
        refclk => sysclk,
        test_clock => ibuf_out,
        freq_out => freq_o
        );
     

end Behavioral;
