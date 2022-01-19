;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit conv.counter.Counter :
  module conv.counter.Counter :
    input clock : Clock
    input reset : UInt<1>
    output io : {output : UInt<3>}
    
    reg reg : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[conv.counter.Counter.scala 8:20]
    node _T_10 = add(reg, UInt<1>("h01")) @[conv.counter.Counter.scala 10:14]
    node _T_11 = tail(_T_10, 1) @[conv.counter.Counter.scala 10:14]
    reg <= _T_11 @[conv.counter.Counter.scala 10:7]
    io.output <= reg @[conv.counter.Counter.scala 12:13]
    
