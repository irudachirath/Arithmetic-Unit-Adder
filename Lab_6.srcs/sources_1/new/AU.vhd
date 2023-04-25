----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 02:08:03 PM
-- Design Name: 
-- Module Name: AU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is

component Reg port (
    D : in STD_LOGIC_VECTOR (3 downto 0);
    En : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_4 port (
     A : in STD_LOGIC_VECTOR (3 downto 0);
     B : in STD_LOGIC_VECTOR (3 downto 0);
     C_in : in STD_LOGIC;
     S : out STD_LOGIC_VECTOR (3 downto 0);
     C_out : out STD_LOGIC);
end component;

component Slow_Clk port (
      Clk_in : in STD_LOGIC;
      Clk_out : out STD_LOGIC);
end component;

SIGNAL Reg_0_Q, Reg_1_Q, RCA_out  : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL not_RegSel, clk_out : STD_LOGIC;

begin

not_RegSel <= NOT(RegSel);

Slow_Clk0 : Slow_Clk port map (
    Clk_in => Clk,
    Clk_out => clk_out);

Reg_0 : Reg port map (
    D => A,
    En => RegSel,
    Clk => clk_out,
    Q => Reg_0_Q);

Reg_1 : Reg port map (
    D => A,
    En => not_RegSel,
    Clk => clk_out,
    Q => Reg_1_Q);

RCA : RCA_4 port map (
    A => Reg_0_Q,
    B => Reg_1_Q,
    C_in => '0',
    S => RCA_out,
    C_out => Carry);

Zero <= NOT(RCA_out(0) OR RCA_out(1) OR RCA_out(2) OR RCA_out(3));
S <= RCA_out;

end Behavioral;
