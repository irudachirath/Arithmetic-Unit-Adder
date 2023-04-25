----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 03:07:13 PM
-- Design Name: 
-- Module Name: AU_Sim - Behavioral
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

entity AU_Sim is
--  Port ( );
end AU_Sim;

architecture Behavioral of AU_Sim is

component AU port ( 
    A : in STD_LOGIC_VECTOR (3 downto 0);
    RegSel : in STD_LOGIC;
    Clk : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR (3 downto 0);
    Zero : out STD_LOGIC;
    Carry : out STD_LOGIC);
end component;

signal a, s : STD_LOGIC_VECTOR (3 downto 0);
signal regSel, clk, zero, carry : STD_LOGIC;

begin

UUT : AU port map (
    A => a,
    RegSel => regSel,
    Clk => clk,
    S => s,
    Zero => zero,
    Carry => carry);
    
Clock : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
process
    begin
        regSel <= '1';
        a <= "0110";
        wait for 100 ns;
        
        regSel <= '0';
        a <= "1010";
        wait for 100 ns;
        
        regSel <= '1';
        a <= "0100";
        wait for 100 ns;
        
        regSel <= '0';
        a <= "0011";
        wait for 100 ns;
        
        regSel <= '1';
        a <= "0111";
        wait for 100 ns;
        
        regSel <= '0';
        a <= "1011";
        wait for 100 ns;
        
        regSel <= '1';
        a <= "0000";
        wait for 100 ns;
        
        regSel <= '0';
        a <= "0000";
        wait;
    end process;
end Behavioral;
