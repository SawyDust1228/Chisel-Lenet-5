circuit conv.counter.Counter : @[:@2.0]
  module conv.counter.Counter : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    output io_output : UInt<3> @[:@6.4]
  
    reg reg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg) @[conv.counter.Counter.scala 8:20:@8.4]
    node _T_10 = add(reg, UInt<1>("h1")) @[conv.counter.Counter.scala 10:14:@9.4]
    node _T_11 = tail(_T_10, 1) @[conv.counter.Counter.scala 10:14:@10.4]
    io_output <= reg @[conv.counter.Counter.scala 12:13:@12.4]
    reg <= mux(reset, UInt<3>("h0"), _T_11) @[conv.counter.Counter.scala 10:7:@11.4]
