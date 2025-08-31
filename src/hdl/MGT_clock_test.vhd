library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity MGT_clock_test is
    Port ( sysclk : in STD_LOGIC;
           testclk_p : in STD_LOGIC;
           testclk_n : in STD_LOGIC;
           freq_o : out STD_LOGIC_VECTOR (31 downto 0));
end MGT_clock_test;

architecture Behavioral of MGT_clock_test is

signal ibuf_out : std_logic;
signal bufg_out : std_logic;

begin

ibufds_inst : IBUFDS_GTE4
   port map (
      I     => testclk_p,
      IB    => testclk_n,
      CEB   => '0',
      O     => open,
      ODIV2 => ibuf_out
   );

bufg_inst : BUFG_GT   
  port map 
  (
      I       => ibuf_out,
      CE      => '1',
      CEMASK  => '1',
      CLR     => '0',
      CLRMASK => '1',
      DIV     => "000",
      O       => bufg_out
  );
  
refclk_ctr: entity work.freq_counter
    port map(
        reset => '0',
        refclk => sysclk,
        test_clock => bufg_out,
        freq_out => freq_o
        );
     

end Behavioral;
