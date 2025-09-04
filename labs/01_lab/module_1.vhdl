LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY basic_gates IS
    PORT (a, b: IN STD_LOGIC;
        y_and, y_or, y_xor, y_not,
        y_nand, y_nor, y_xnor:
            OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE rtl OF basic_gates IS
BEGIN
    y_and <= a AND b;
    y_or <= a OR b;
    y_xor <= a XOR b;
    y_not <= NOT a;
    y_nand <= a NAND b;
    y_nor <= a NOR b;
    y_xnor <= a XNOR b;
END ARCHITECTURE;