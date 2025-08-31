-----------------------------------------------------------------------------
--  Project      : Diamond SPEC FA Sniffer
--  Filename     : freq_counter.vhd
--  Purpose      : FOFB Fast Acquisition PciE sniffer
--  Author       : Dr. Isa S. Uzun
-----------------------------------------------------------------------------
--  Description  : Frequency counter for 4 clocks against reference clock
--                 input
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_counter is
port (
    reset           : in  std_logic;
    refclk          : in  std_logic;
    test_clock     : in  std_logic;
    freq_out        : out std_logic_vector(31 downto 0)
);
end freq_counter;

architecture rtl of freq_counter is

subtype uint32_t is unsigned(31 downto 0);
type uint32_array is array(natural range <>) of uint32_t;

signal ref_cntr        : integer range 2**13-1 downto 0;
signal ref_trigger     : std_logic;
signal trigger         : std_logic;
signal clk_cntr        : unsigned(31 downto 0);
signal clk_cnt_reg     : unsigned(31 downto 0);
signal clk_cnt_reg_synca, clk_cnt_reg_syncb : std_logic_vector(31 downto 0);

attribute ASYNC_REG : string;
attribute ASYNC_REG of clk_cnt_reg_synca : signal is "TRUE";
attribute ASYNC_REG of clk_cnt_reg_syncb : signal is "TRUE";

begin

--------------------------------------------------------------------------
-- Reference Counter and Trigger
--------------------------------------------------------------------------
process(refclk)
begin
    if rising_edge(refclk) then
        if (reset = '1') then
            ref_cntr    <= 0;
            ref_trigger <= '1';
        else
            if (ref_cntr = 2**13-1) then
                ref_cntr    <= 0;
                ref_trigger <= '1';
            else
                ref_cntr    <= ref_cntr + 1;
                ref_trigger <= '0';
            end if;
        end if;
    end if;
end process;

--------------------------------------------------------------------------
-- Clock counters
-- Counts number of ticks between reference trigger
--------------------------------------------------------------------------

p2p_trigger_inst : entity work.pulse2pulse
port map (
    in_clk      => refclk,
    out_clk     => test_clock,
    rst         => reset,
    pulsein     => ref_trigger,
    inbusy      => open,
    pulseout    => trigger
);

process(test_clock)
begin
    if rising_edge(test_clock) then
        if trigger = '1' then
            clk_cntr    <= (others=>'0');
            clk_cnt_reg <= clk_cntr;
        else
            clk_cntr    <= clk_cntr + 1;
            clk_cnt_reg <= clk_cnt_reg;
        end if;
    end if;
end process;

output_resync: process(refclk)
begin
    if rising_edge(refclk) then
        clk_cnt_reg_synca <= std_logic_vector(clk_cnt_reg);
        clk_cnt_reg_syncb <= clk_cnt_reg_synca;
    end if;
end process;

freq_out <= clk_cnt_reg_syncb;


end rtl;
