entity reg4 is
  port(d0,d1,d2,d3,en,clk: in bit;
       q0,q1,q2,q3: out bit);
end entity reg4;

architecture behave of reg4 is
begin
  storgage: process is
    variable stored_d0, stored_d1, stored_d2, stored_d3: bit;
  begin
    if en='1' and clk='1' then
      stored_d0 := d0;
      stored_d1 := d1;
      stored_d2 := d2;
      stored_d3 := d3;
    end if;

    q0 <= stored_d0 after 5 ns;
    q1 <= stored_d1 after 5 ns;
    q2 <= stored_d2 after 5 ns;
    q3 <= stored_d3 after 5 ns;

    wait on d0,d1,d2,d3,en,clk;
    /* When all of these statements has been processed, the process reach wait
statement and suspend, it become inactive, it stay suspend until one of the
signal is sensitive changes value list in the wait statement (d0 d1 d2 d3 en clk
in this case. When of these value change, process resume, cycle repeat
                                                    
While the process is suspend, value in process's variable are not lost => This
is how the process can represent the state of a system 


*/
    end process storgage;
end architecture behave;
  
