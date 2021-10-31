entity d_latch is
  port(d,clk: in bit;
       q: out bit);
end d_latch;

architecture basic of d_latch is
begin
  latch_behavior: process is
  begin
    if clk='1' then
      q <= d after 2 ns;
    end if;

    wait on clk, d;
  end process latch_behavior;
end architecture basic;

entity and2 is
  port (a,b: in bit; y: out bit);
end and2;
architecture basic of and2 is
  and2_behavior: process is
  begin
    y <= a and b after 2 ns;
  end process and2_behavior;

  wait on a,b;
  
end architecture basic;

architecture struct of reg4 is
  signal int_clk: bit;  --internal signal inside architecture
begin
  bit0: entity work.d_latch(basic)
    port map(d0,int_clk,q0);
  bit1: entity work.d_latch(basic)
    port map(d1,int_clk,q1);
  bit2: entity work.d_latch(basic)
    port map(d2,int_clk,q2);
  bit3: entity work.d_latch(basic)
    port map(d3,int_clk,q3);

  gate: entity work.and2(basic)
    port map (clk,en,int_clk);
end architecture struct;

/*The second part of architecture body, the number of component instances are
created, representing the subsystem from which the reg4 entity is composed.
Each component is instance copy of entity representing the subsystems from
which the reg4 entity reg4 is composed. Each correspond to the basic
architecture body. Name work refer to the the current working library

*/
