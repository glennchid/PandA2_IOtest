library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.PandA2_IOtest_pkg.all;

library UNISIM;
use UNISIM.VComponents.all;


entity PandA2_IOtest is
Port (
    -- Encoder board 3.3V I/Os
    AENC1       : inout std_logic;
    B_CLKENC1   : inout std_logic;
    Z_DATAENC1  : inout std_logic;
    AENC2       : inout std_logic;
    B_CLKENC2   : inout std_logic;
    Z_DATAENC2  : inout std_logic;
    AENC3       : inout std_logic;
    B_CLKENC3   : inout std_logic;
    Z_DATAENC3  : inout std_logic;
    AENC4       : inout std_logic;
    B_CLKENC4   : inout std_logic;
    Z_DATAENC4  : inout std_logic;
    AENC5       : inout std_logic;
    B_CLKENC5   : inout std_logic;
    Z_DATAENC5  : inout std_logic;
    AENC6       : inout std_logic;
    B_CLKENC6   : inout std_logic;
    Z_DATAENC6  : inout std_logic;
    AENC7       : inout std_logic;
    B_CLKENC7   : inout std_logic;
    Z_DATAENC7  : inout std_logic;
    AENC8       : inout std_logic;
    B_CLKENC8   : inout std_logic;
    Z_DATAENC8  : inout std_logic;
    
    -- DIO board 3.3V I/Os
    PANEL_F_IO_0    : inout std_logic;
    PANEL_F_IO_1    : inout std_logic;
    PANEL_F_IO_2    : inout std_logic;
    PANEL_F_IO_3    : inout std_logic;
    PANEL_F_IO_4    : inout std_logic;
    PANEL_F_IO_5    : inout std_logic;
    PANEL_F_IO_6    : inout std_logic;
    PANEL_F_IO_7    : inout std_logic;
    PANEL_F_I_0     : in    std_logic;
    PANEL_F_I_1     : in    std_logic;
    PANEL_F_O_0     : out   std_logic;
    PANEL_F_O_1     : out   std_logic;
    PANEL_F_RESET   : out   std_logic; -- not driven
    PANEL_F_INT     : in    std_logic; -- not read
    PANEL_F_OE      : out   std_logic; -- not driven (for ST1 test, swap the pin constraint of PANEL_F_OE and PANEL_F_SPARE_0 to read the value of BTN1 on ST1)
    PANEL_F_SPARE_0 : inout std_logic; -- used as TEMP_CTRL on DIO board
    PANEL_F_SPARE_1 : inout std_logic;
    PANEL_F_SPARE_2 : inout std_logic;
    PANEL_F_SPARE_3 : inout std_logic;
    PANEL_F_SPARE_4 : inout std_logic;
    PANEL_F_SPARE_5 : inout std_logic;
    PANEL_F_SPARE_6 : inout std_logic;
    PANEL_F_SPARE_7 : inout std_logic;
    PANEL_F_SPARE_8 : inout std_logic;
    
    -- Test points (1.8V)
    PT46 : inout std_logic;
    PT47 : inout std_logic;
    PT48 : inout std_logic;
    PT49 : inout std_logic;
    PT50 : inout std_logic;
    PT51 : inout std_logic;
    PT52 : inout std_logic;
    PT53 : inout std_logic;
     
    -- MGT reference clock inputs
    CLK_MUX0_SEL        : out std_logic;
    CLK_MUX1_SEL        : out std_logic;
    MGT_WR_IN0_P        : in  std_logic; -- FMC GCLK0 (ST1)
    MGT_WR_IN0_N        : in  std_logic; -- FMC GCLK0 (ST1)
    MGT_REFCLK0_IN1_P   : in  std_logic; -- FMC_HA13 (ST1) x
    MGT_REFCLK0_IN1_N   : in  std_logic; -- FMC_HA13 (ST1) x
    MGT_REFCLK0_IN2_P   : in  std_logic; -- FMC GCLK1 (ST1)
    MGT_REFCLK0_IN2_N   : in  std_logic; -- FMC GCLK1 (ST1)
    MGT_REFCLK0_IN3_P   : in  std_logic; -- SI5338 CLK_REF1 (ST1) ??
    MGT_REFCLK0_IN3_N   : in  std_logic; -- SI5338 CLK_REF1 (ST1) ??
    MGT_REFCLK1_IN0_P   : in  std_logic; -- SI5338 CLK_REF0 (ST1) ??
    MGT_REFCLK1_IN0_N   : in  std_logic; -- SI5338 CLK_REF0 (ST1) ??
    MGT_REFCLK1_IN1_P   : in  std_logic; -- SI5338 CLK_REF2 (ST1) ??
    MGT_REFCLK1_IN1_N   : in  std_logic; -- SI5338 CLK_REF2 (ST1) ??
    MGT_REFCLK1_IN2_P   : in  std_logic; -- SI570 (not-fitted) (ST1) x
    MGT_REFCLK1_IN2_N   : in  std_logic; -- SI570 (not-fitted) (ST1) x
    MGT_REFCLK1_IN3_P   : in  std_logic; -- FMC_HA12 (ST1) x
    MGT_REFCLK1_IN3_N   : in  std_logic; -- FMC_HA12 (ST1) x
    
    -- Other clock inputs
    FMC_CLK0_M2C_P      : in    std_logic; -- FMC CLK 1 (ST1)
    FMC_CLK0_M2C_N      : in    std_logic; -- FMC CLK 1 (ST1)
    FMC_CLK1_M2C_P      : in    std_logic; -- FMC LA00_CC (ST1) x
    FMC_CLK1_M2C_N      : in    std_logic; -- FMC LA00_CC (ST1) x
    FMC_CLK2_BIDIR_P    : inout std_logic; -- FMC_LA12 (ST1) x
    FMC_CLK2_BIDIR_N    : inout std_logic; -- FMC_LA12 (ST1) x
    FMC_CLK3_BIDIR_P    : inout std_logic; -- FMC_LA11 (ST1) x
    FMC_CLK3_BIDIR_N    : inout std_logic; -- FMC_LA11 (ST1) x
    EXT_CLK_P           : in    std_logic; -- FMC_HA04 (ST1) x
    EXT_CLK_N           : in    std_logic; -- FMC_HA04 (ST1) x
    FMC_PRSNT_L         : in    std_logic; -- FMC_HA02 (ST1) x
    FMC_PRSNT_H         : in    std_logic; -- FMC_HA02 (ST1) x
    FMC_CLK_DIR         : in    std_logic; -- IO1_D10 (ST1) x
    CLK20_VCXO          : in    std_logic; -- IO1_CLK_P (ST1) x
    MGT_WR_IN1_P        : in    std_logic; -- MIPI1_CLK (ST1) ?x
    MGT_WR_IN1_N        : in    std_logic; -- MIPI1_CLK (ST1) ?x
    
    -- Fan tacho
    FAN_TACH0 : in std_logic;
    FAN_TACH1 : in std_logic;
    FAN_TACH2 : in std_logic;
    FAN_TACH3 : in std_logic;
    
    -- Shift register control for encoder panel (not implemented for now)
--    PANEL_R_CTRL0 : out std_logic;
--    PANEL_R_CTRL1 : out std_logic;
--    PANEL_R_CTRL2 : out std_logic;
--    PANEL_R_CTRL3 : out std_logic;
--    PANEL_R_CTRL4 : in  std_logic;
--    PANEL_R_CTRL5 : out std_logic;
--    PANEL_R_CTRL6 : out std_logic;
--    PANEL_R_CTRL7 : out std_logic;


    -- 1.8V dedicated IOs
    PANEL_F_DI_P_0 : in  std_logic;
    PANEL_F_DI_N_0 : in  std_logic;
    PANEL_F_DI_P_1 : in  std_logic;
    PANEL_F_DI_N_1 : in  std_logic;
    PANEL_F_DO_P_0 : out std_logic;
    PANEL_F_DO_N_0 : out std_logic;
    PANEL_F_DO_P_1 : out std_logic;
    PANEL_F_DO_N_1 : out std_logic;
    
    -- SFP control/monitoring
--    SFP1_TX_DISABLE : out std_logic;
--    SFP1_RX_LOS     : in  std_logic;
--    SFP2_TX_DISABLE : out std_logic;
--    SFP2_RX_LOS     : in  std_logic;
--    SFP3_TX_DISABLE : out std_logic;
--    SFP3_RX_LOS     : in  std_logic;
--    SFP4_TX_DISABLE : out std_logic;
--    SFP4_RX_LOS     : in  std_logic;
    
    -- White Rabbit clocking control
--    PLL25DAC_SCLK   : out std_logic;
--    PLL25DAC_DIN    : out std_logic;
--    PLL25DAC_2_SYNC : out std_logic;
--    PLL25DAC_1_SYNC : out std_logic;
    
    LVDS0_DIR       : out std_logic;
    LVDS1_DIR       : out std_logic;
    LVDS0_R         : in  std_logic;
    LVDS0_D         : out std_logic;
    LVDS1_R         : in  std_logic; -- LED2 (ST1) -- being read not driven!
    LVDS1_D         : out std_logic; -- LED3 (ST1)
    
    --XU1 internal signals 
    LED2_N_PWR_SYNC : out std_logic;
    --I2C_SCL         : inout std_logic;
    --I2C_SDA         : inout std_logic;
    
    LA_P_33 : out STD_LOGIC := '0'; --CLK_SEL for HTG 4 SFP FMC (incorrectly pulled high?)
    LA_N_33 : out STD_LOGIC := '1'; --OE enable for HTG 4SFP FMC
    );
end PandA2_IOtest;

architecture Behavioral of PandA2_IOtest is

signal sysclk : std_logic;

signal enc_tri_en : std_logic := '1';

signal AENC1_sig        : std_logic;
signal AENC2_sig        : std_logic;
signal AENC3_sig        : std_logic;
signal AENC4_sig        : std_logic;
signal AENC5_sig        : std_logic;
signal AENC6_sig        : std_logic;
signal AENC7_sig        : std_logic;
signal AENC8_sig        : std_logic;
signal B_CLKENC1_sig    : std_logic;
signal B_CLKENC2_sig    : std_logic;
signal B_CLKENC3_sig    : std_logic;
signal B_CLKENC4_sig    : std_logic;
signal B_CLKENC5_sig    : std_logic;
signal B_CLKENC6_sig    : std_logic;
signal B_CLKENC7_sig    : std_logic;
signal B_CLKENC8_sig    : std_logic;
signal Z_DATAENC1_sig   : std_logic;
signal Z_DATAENC2_sig   : std_logic;
signal Z_DATAENC3_sig   : std_logic;
signal Z_DATAENC4_sig   : std_logic;
signal Z_DATAENC5_sig   : std_logic;
signal Z_DATAENC6_sig   : std_logic;
signal Z_DATAENC7_sig   : std_logic;
signal Z_DATAENC8_sig   : std_logic;

signal dio_tri_en : std_logic := '1';

signal PANEL_F_IO_0_sig     : std_logic;
signal PANEL_F_IO_1_sig     : std_logic;
signal PANEL_F_IO_2_sig     : std_logic;
signal PANEL_F_IO_3_sig     : std_logic;
signal PANEL_F_IO_4_sig     : std_logic;
signal PANEL_F_IO_5_sig     : std_logic;
signal PANEL_F_IO_6_sig     : std_logic;
signal PANEL_F_IO_7_sig     : std_logic;
signal PANEL_F_SPARE_0_sig  : std_logic;
signal PANEL_F_SPARE_1_sig  : std_logic;
signal PANEL_F_SPARE_2_sig  : std_logic;
signal PANEL_F_SPARE_3_sig  : std_logic;
signal PANEL_F_SPARE_4_sig  : std_logic;
signal PANEL_F_SPARE_5_sig  : std_logic;
signal PANEL_F_SPARE_6_sig  : std_logic;
signal PANEL_F_SPARE_7_sig  : std_logic;
signal PANEL_F_SPARE_8_sig  : std_logic;

signal tp_tri_en : std_logic := '1';

signal PT46_sig : std_logic;
signal PT47_sig : std_logic;
signal PT48_sig : std_logic;
signal PT49_sig : std_logic;
signal PT50_sig : std_logic;
signal PT51_sig : std_logic;
signal PT52_sig : std_logic;
signal PT53_sig : std_logic;

signal PANEL_F_DI_0 : std_logic;
signal PANEL_F_DI_1 : std_logic;
signal PANEL_F_DO_0 : std_logic;
signal PANEL_F_DO_1 : std_logic;

signal refclk0_freq     : std_logic_vector(31 downto 0);
signal refclk1_freq     : std_logic_vector(31 downto 0);
signal refclk2_freq     : std_logic_vector(31 downto 0);
signal refclk3_freq     : std_logic_vector(31 downto 0);
signal refclk4_freq     : std_logic_vector(31 downto 0);
signal refclk5_freq     : std_logic_vector(31 downto 0);
signal refclk6_freq     : std_logic_vector(31 downto 0);
signal refclk7_freq     : std_logic_vector(31 downto 0);

signal fmc_clk0_freq    : std_logic_vector(31 downto 0);
signal fmc_clk1_freq    : std_logic_vector(31 downto 0);
signal fmc_clk2_freq    : std_logic_vector(31 downto 0);
signal fmc_clk3_freq    : std_logic_vector(31 downto 0);
signal ext_clk_freq     : std_logic_vector(31 downto 0);
signal wr_clk_freq      : std_logic_vector(31 downto 0);
signal clk20_freq       : std_logic_vector(31 downto 0);

begin

-- Bring in 125 MHz fabric clock from the PS
ps_inst: entity work.barePS_wrapper
port map (pl_clk0_0 => sysclk);

----------------------------------------------
-- Encoder Board
----------------------------------------------

-- Tri-state bidir I/Os
AENC1 <= 'Z' when enc_tri_en = '1' else AENC1_sig;
AENC2 <= 'Z' when enc_tri_en = '1' else AENC2_sig;
AENC3 <= 'Z' when enc_tri_en = '1' else AENC3_sig;
AENC4 <= 'Z' when enc_tri_en = '1' else AENC4_sig;
AENC5 <= 'Z' when enc_tri_en = '1' else AENC5_sig;
AENC6 <= 'Z' when enc_tri_en = '1' else AENC6_sig;
AENC7 <= 'Z' when enc_tri_en = '1' else AENC7_sig;
AENC8 <= 'Z' when enc_tri_en = '1' else AENC8_sig;

B_CLKENC1 <= 'Z' when enc_tri_en = '1' else B_CLKENC1_sig;
B_CLKENC2 <= 'Z' when enc_tri_en = '1' else B_CLKENC2_sig;
B_CLKENC3 <= 'Z' when enc_tri_en = '1' else B_CLKENC3_sig;
B_CLKENC4 <= 'Z' when enc_tri_en = '1' else B_CLKENC4_sig;
B_CLKENC5 <= 'Z' when enc_tri_en = '1' else B_CLKENC5_sig;
B_CLKENC6 <= 'Z' when enc_tri_en = '1' else B_CLKENC6_sig;
B_CLKENC7 <= 'Z' when enc_tri_en = '1' else B_CLKENC7_sig;
B_CLKENC8 <= 'Z' when enc_tri_en = '1' else B_CLKENC8_sig;

Z_DATAENC1 <= 'Z' when enc_tri_en = '1' else Z_DATAENC1_sig;
Z_DATAENC2 <= 'Z' when enc_tri_en = '1' else Z_DATAENC2_sig;
Z_DATAENC3 <= 'Z' when enc_tri_en = '1' else Z_DATAENC3_sig;
Z_DATAENC4 <= 'Z' when enc_tri_en = '1' else Z_DATAENC4_sig;
Z_DATAENC5 <= 'Z' when enc_tri_en = '1' else Z_DATAENC5_sig;
Z_DATAENC6 <= 'Z' when enc_tri_en = '1' else Z_DATAENC6_sig;
Z_DATAENC7 <= 'Z' when enc_tri_en = '1' else Z_DATAENC7_sig;
Z_DATAENC8 <= 'Z' when enc_tri_en = '1' else Z_DATAENC8_sig;

encoder_vio : enc_vio
  PORT MAP (
    clk => sysclk,
    probe_in0(0) => AENC1,
    probe_in1(0) => AENC2,
    probe_in2(0) => AENC3,
    probe_in3(0) => AENC4,
    probe_in4(0) => AENC5,
    probe_in5(0) => AENC6,
    probe_in6(0) => AENC7,
    probe_in7(0) => AENC8,
    probe_in8(0) => B_CLKENC1,
    probe_in9(0) => B_CLKENC2,
    probe_in10(0) => B_CLKENC3,
    probe_in11(0) => B_CLKENC4,
    probe_in12(0) => B_CLKENC5,
    probe_in13(0) => B_CLKENC6,
    probe_in14(0) => B_CLKENC7,
    probe_in15(0) => B_CLKENC8,
    probe_in16(0) => Z_DATAENC1,
    probe_in17(0) => Z_DATAENC2,
    probe_in18(0) => Z_DATAENC3,
    probe_in19(0) => Z_DATAENC4,
    probe_in20(0) => Z_DATAENC5,
    probe_in21(0) => Z_DATAENC6,
    probe_in22(0) => Z_DATAENC7,
    probe_in23(0) => Z_DATAENC8,
    probe_out0(0) => enc_tri_en,
    probe_out1(0) => AENC1_sig,
    probe_out2(0) => AENC2_sig,
    probe_out3(0) => AENC3_sig,
    probe_out4(0) => AENC4_sig,
    probe_out5(0) => AENC5_sig,
    probe_out6(0) => AENC6_sig,
    probe_out7(0) => AENC7_sig,
    probe_out8(0) => AENC8_sig,
    probe_out9(0) => B_CLKENC1_sig,
    probe_out10(0) => B_CLKENC2_sig,
    probe_out11(0) => B_CLKENC3_sig,
    probe_out12(0) => B_CLKENC4_sig,
    probe_out13(0) => B_CLKENC5_sig,
    probe_out14(0) => B_CLKENC6_sig,
    probe_out15(0) => B_CLKENC7_sig,
    probe_out16(0) => B_CLKENC8_sig,
    probe_out17(0) => Z_DATAENC1_sig,
    probe_out18(0) => Z_DATAENC2_sig,
    probe_out19(0) => Z_DATAENC3_sig,
    probe_out20(0) => Z_DATAENC4_sig,
    probe_out21(0) => Z_DATAENC5_sig,
    probe_out22(0) => Z_DATAENC6_sig,
    probe_out23(0) => Z_DATAENC7_sig,
    probe_out24(0) => Z_DATAENC8_sig
  );

----------------------------------------------
-- DIO board 
-------------------------------------------------

-- Tri-state bidir I/Os

PANEL_F_IO_0 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_0_sig;
PANEL_F_IO_1 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_1_sig;
PANEL_F_IO_2 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_2_sig;
PANEL_F_IO_3 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_3_sig;
PANEL_F_IO_4 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_4_sig;
PANEL_F_IO_5 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_5_sig;
PANEL_F_IO_6 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_6_sig;
PANEL_F_IO_7 <= 'Z' when dio_tri_en = '1' else PANEL_F_IO_7_sig;

PANEL_F_SPARE_0 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_0_sig;
PANEL_F_SPARE_1 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_1_sig;
PANEL_F_SPARE_2 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_2_sig;
PANEL_F_SPARE_3 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_3_sig;
PANEL_F_SPARE_4 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_4_sig;
PANEL_F_SPARE_5 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_5_sig;
PANEL_F_SPARE_6 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_6_sig;
PANEL_F_SPARE_7 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_7_sig;
PANEL_F_SPARE_8 <= 'Z' when dio_tri_en = '1' else PANEL_F_SPARE_8_sig;

dio_board_vio : dio_vio
  PORT MAP (
    clk => sysclk,
    probe_in0(0) => PANEL_F_IO_0,
    probe_in1(0) => PANEL_F_IO_1,
    probe_in2(0) => PANEL_F_IO_2,
    probe_in3(0) => PANEL_F_IO_3,
    probe_in4(0) => PANEL_F_IO_4,
    probe_in5(0) => PANEL_F_IO_5,
    probe_in6(0) => PANEL_F_IO_6,
    probe_in7(0) => PANEL_F_IO_7,
    probe_in8(0) => PANEL_F_I_0,
    probe_in9(0) => PANEL_F_I_1,
    probe_in10(0) => PANEL_F_SPARE_0,
    probe_in11(0) => PANEL_F_SPARE_1,
    probe_in12(0) => PANEL_F_SPARE_2,
    probe_in13(0) => PANEL_F_SPARE_3,
    probe_in14(0) => PANEL_F_SPARE_4,
    probe_in15(0) => PANEL_F_SPARE_5,
    probe_in16(0) => PANEL_F_SPARE_6,
    probe_in17(0) => PANEL_F_SPARE_7,
    probe_in18(0) => PANEL_F_SPARE_8,
    probe_out0(0) => dio_tri_en,
    probe_out1(0) => PANEL_F_IO_0_sig,
    probe_out2(0) => PANEL_F_IO_1_sig,
    probe_out3(0) => PANEL_F_IO_2_sig,
    probe_out4(0) => PANEL_F_IO_3_sig,
    probe_out5(0) => PANEL_F_IO_4_sig,
    probe_out6(0) => PANEL_F_IO_5_sig,
    probe_out7(0) => PANEL_F_IO_6_sig,
    probe_out8(0) => PANEL_F_IO_7_sig,
    probe_out9(0) => PANEL_F_O_0,
    probe_out10(0) => PANEL_F_O_1,
    probe_out11(0) => PANEL_F_SPARE_0_sig,
    probe_out12(0) => PANEL_F_SPARE_1_sig,
    probe_out13(0) => PANEL_F_SPARE_2_sig,
    probe_out14(0) => PANEL_F_SPARE_3_sig,
    probe_out15(0) => PANEL_F_SPARE_4_sig,
    probe_out16(0) => PANEL_F_SPARE_5_sig,
    probe_out17(0) => PANEL_F_SPARE_6_sig,
    probe_out18(0) => PANEL_F_SPARE_7_sig,
    probe_out19(0) => PANEL_F_SPARE_8_sig
  );
  
----------------------------------------------
-- Test points, Fan Tacho, LED
----------------------------------------------

-- Tri-state bidir I/Os
PT46 <= 'Z' when tp_tri_en = '1' else PT46_sig;
PT47 <= 'Z' when tp_tri_en = '1' else PT47_sig;
PT48 <= 'Z' when tp_tri_en = '1' else PT48_sig;
PT49 <= 'Z' when tp_tri_en = '1' else PT49_sig;
PT50 <= 'Z' when tp_tri_en = '1' else PT50_sig;
PT51 <= 'Z' when tp_tri_en = '1' else PT51_sig;
PT52 <= 'Z' when tp_tri_en = '1' else PT52_sig;
PT53 <= 'Z' when tp_tri_en = '1' else PT53_sig;
  
tp_vio_inst : tp_vio
  PORT MAP (
    clk => sysclk,
    probe_in0(0) => PT46,
    probe_in1(0) => PT47,
    probe_in2(0) => PT48,
    probe_in3(0) => PT49,
    probe_in4(0) => PT50,
    probe_in5(0) => PT51,
    probe_in6(0) => PT52,
    probe_in7(0) => PT53,
    probe_in8(0) => FAN_TACH0,
    probe_in9(0) => FAN_TACH1,
    probe_in10(0) => FAN_TACH2,
    probe_in11(0) => FAN_TACH3,
    probe_out0(0) => tp_tri_en,
    probe_out1(0) => PT46_sig,
    probe_out2(0) => PT47_sig,
    probe_out3(0) => PT48_sig,
    probe_out4(0) => PT49_sig,
    probe_out5(0) => PT50_sig,
    probe_out6(0) => PT51_sig,
    probe_out7(0) => PT52_sig,
    probe_out8(0) => PT53_sig,
    probe_out9(0) => LED2_N_PWR_SYNC
  );
  
----------------------------------------------
-- 1.8V DIO and LVDS
----------------------------------------------

-- Differential input and output buffers

PANEL_F_DI_0_IBUFDS : IBUFDS
   port map (
      O => PANEL_F_DI_0,
      I => PANEL_F_DI_P_0,
      IB => PANEL_F_DI_N_0
   );
   
PANEL_F_DI_1_IBUFDS : IBUFDS
   port map (
      O => PANEL_F_DI_1,
      I => PANEL_F_DI_P_1,
      IB => PANEL_F_DI_N_1
   );
   
PANEL_F_DO_0_OBUFDS : OBUFDS
   port map (
      O => PANEL_F_DO_P_0,
      OB => PANEL_F_DO_N_0,
      I => PANEL_F_DO_0 
   );
 
PANEL_F_DO_1_OBUFDS : OBUFDS
   port map (
      O => PANEL_F_DO_P_1,
      OB => PANEL_F_DO_N_1,
      I => PANEL_F_DO_1 
   ); 

 
io1V8_vio_inst : io1V8_vio
PORT MAP (
    clk => sysclk,
    probe_in0(0) => PANEL_F_DI_0,
    probe_in1(0) => PANEL_F_DI_1,
    probe_in2(0) => LVDS0_R,
    probe_in3(0) => LVDS1_R,
    probe_out0(0) => PANEL_F_DO_0,
    probe_out1(0) => PANEL_F_DO_1,
    probe_out2(0) => LVDS0_DIR,
    probe_out3(0) => LVDS1_DIR,
    probe_out4(0) => LVDS0_D,
    probe_out5(0) => LVDS1_D
);
  
  
----------------------------------------------
--Clock Testing
----------------------------------------------

-- Set bidir clock outputs to high-impedance
FMC_CLK2_BIDIR_P <= 'Z';
FMC_CLK2_BIDIR_N <= 'Z';
FMC_CLK3_BIDIR_P <= 'Z';
FMC_CLK3_BIDIR_N <= 'Z';

refclk0_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_WR_IN0_P,
    testclk_n => MGT_WR_IN0_N,
    freq_o => refclk0_freq
);
    
refclk1_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK0_IN1_P,
    testclk_n => MGT_REFCLK0_IN1_N,
    freq_o => refclk1_freq
);
    
refclk2_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK0_IN2_P,
    testclk_n => MGT_REFCLK0_IN2_N,
    freq_o => refclk2_freq
);

refclk3_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK0_IN3_P,
    testclk_n => MGT_REFCLK0_IN3_N,
    freq_o => refclk3_freq
);

refclk4_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK1_IN0_P,
    testclk_n => MGT_REFCLK1_IN0_N,
    freq_o => refclk4_freq
);

refclk5_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK1_IN1_P,
    testclk_n => MGT_REFCLK1_IN1_N,
    freq_o => refclk5_freq
);

refclk6_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK1_IN2_P,
    testclk_n => MGT_REFCLK1_IN2_N,
    freq_o => refclk6_freq
);        

refclk7_inst : entity work.MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_REFCLK1_IN3_P,
    testclk_n => MGT_REFCLK1_IN3_N,
    freq_o => refclk7_freq
);

fmc_clk0_inst : entity work.non_MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => FMC_CLK0_M2C_P,
    testclk_n => FMC_CLK0_M2C_N,
    freq_o => fmc_clk0_freq
);

fmc_clk1_inst : entity work.non_MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => FMC_CLK1_M2C_P,
    testclk_n => FMC_CLK1_M2C_N,
    freq_o => fmc_clk1_freq
);

fmc_clk2_inst : entity work.non_MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => FMC_CLK2_BIDIR_P,
    testclk_n => FMC_CLK2_BIDIR_N,
    freq_o => fmc_clk2_freq
);

fmc_clk3_inst : entity work.non_MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => FMC_CLK3_BIDIR_P,
    testclk_n => FMC_CLK3_BIDIR_N,
    freq_o => fmc_clk3_freq
);

ext_clk_inst : entity work.non_MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => EXT_CLK_P,
    testclk_n => EXT_CLK_N,
    freq_o => ext_clk_freq
);

wr_clk_inst : entity work.non_MGT_clock_test
port map(
    sysclk => sysclk,
    testclk_p => MGT_WR_IN1_P,
    testclk_n => MGT_WR_IN1_N,
    freq_o => wr_clk_freq
);
    
clk20_ctr: entity work.freq_counter
    port map(
        reset => '0',
        refclk => sysclk,
        test_clock => CLK20_VCXO,
        freq_out => clk20_freq
);
        
 clk_vio_inst : clock_vio
  PORT MAP (
    clk => sysclk,
    probe_in0 => refclk0_freq,
    probe_in1 => refclk1_freq,
    probe_in2 => refclk2_freq,
    probe_in3 => refclk3_freq,
    probe_in4 => refclk4_freq,
    probe_in5 => refclk5_freq,
    probe_in6 => refclk6_freq,
    probe_in7 => refclk7_freq,
    probe_in8 => fmc_clk0_freq,
    probe_in9 => fmc_clk1_freq,
    probe_in10 => fmc_clk2_freq,
    probe_in11 => fmc_clk3_freq,
    probe_in12 => ext_clk_freq,
    probe_in13 => wr_clk_freq,
    probe_in14 => clk20_freq,
    probe_out0(0) => CLK_MUX0_SEL,
    probe_out1(0) => CLK_MUX1_SEL
  );       

end Behavioral;
