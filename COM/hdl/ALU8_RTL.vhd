LIBRARY gates;
  USE gates.gates.all;

ARCHITECTURE RTL OF ALU8 IS

  constant delay: time := gateDelay;

  signal aArith: signed(A'high+1 downto 0);
  signal bArith: signed(A'high+1 downto 0);
  signal cInArith: signed(A'high+1 downto 0);
  signal yArith: signed(Y'high+1 downto 0);

BEGIN

  aArith <= signed(resize(unsigned(A), aArith'length));
  bArith <= signed(resize(unsigned(B), bArith'length));
  cInArith(cInArith'high downto 1) <= (others => '0');
  cInArith(0) <= cIn;

  aluOperation: process(code, A, B, cIn, aArith, bArith, cInArith, yArith)
  begin
    yArith <= (others => '-'); 
    case to_integer(unsigned(code)) is
      when  0 =>                                        -- LOAD sX, kk
        Y       <= B after delay;
        cOut    <= '-' after delay;
      when  2 =>                                        -- INPUT sX, pp
        Y       <= B after delay;
        cOut    <= '-' after delay;
      when  3 =>                                        -- FETCH sX, ss
        Y       <= B after delay;
        cOut    <= '-' after delay;
      when  5 =>                                        -- AND sX, kk
        Y       <= A and B after delay;
        cOut    <= '-' after delay;
      when  6 =>                                        -- OR sX, kk
        Y       <= A or B after delay;
        cOut    <= '-' after delay;
      when  7 =>                                        -- XOR sX, kk
        Y       <= A xor B after delay;
        cOut    <= '-' after delay;
      when  9 =>                                        -- TEST sX, kk
        Y       <= A and B after delay;
        cOut    <= '-' after delay;
      when 10 =>                                        -- COMPARE sX, kk
        yArith  <= aArith - bArith;
        Y       <= yArith(Y'range) after delay;
        cOut    <= yArith(yArith'high) after delay;
      when 12 =>                                        -- ADD sX, kk
        yArith  <= aArith + bArith;
        Y       <= yArith(Y'range) after delay;
        cOut    <= yArith(yArith'high) after delay;
      when 13 =>                                        -- ADDCY sX, kk
        yArith  <= aArith + bArith + cInArith;
        Y       <= yArith(Y'range) after delay;
        cOut    <= yArith(yArith'high) after delay;
      when 14 =>                                        -- SUB sX, kk
        yArith  <= aArith - bArith;
        Y       <= yArith(Y'range) after delay;
        cOut    <= yArith(yArith'high) after delay;
      when 15 =>                                        -- SUBCY sX, kk
        yArith  <= aArith - bArith - cInArith;
        Y       <= yArith(Y'range) after delay;
        cOut    <= yArith(yArith'high) after delay;
      when 16 =>                                        -- SR sX
        yArith  <= shift_right(aArith, 1) + shift_left(cInArith, A'length-1);
        Y       <= yArith(Y'range) after delay;
        cOut    <= aArith(0) after delay;
      when 17 =>                                        -- SL sX
        yArith  <= shift_left(aArith, 1) + cInArith;
        Y       <= yArith(Y'range) after delay;
        cOut    <= yArith(yArith'high) after delay;
      when others =>
        Y       <= (others => '-') after delay;
        cOut    <= '-' after delay;
    end case;
  end process aluOperation;

END ARCHITECTURE RTL;

