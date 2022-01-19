;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit MaxModule : 
  module Comparator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = geq(io.a, io.b) @[Comparator.scala 12:13]
    when _T_11 : @[Comparator.scala 12:22]
      io.output <= io.a @[Comparator.scala 13:15]
      skip @[Comparator.scala 12:22]
    else : @[Comparator.scala 14:15]
      io.output <= io.b @[Comparator.scala 15:15]
      skip @[Comparator.scala 14:15]
    
  module Comparator_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = geq(io.a, io.b) @[Comparator.scala 12:13]
    when _T_11 : @[Comparator.scala 12:22]
      io.output <= io.a @[Comparator.scala 13:15]
      skip @[Comparator.scala 12:22]
    else : @[Comparator.scala 14:15]
      io.output <= io.b @[Comparator.scala 15:15]
      skip @[Comparator.scala 14:15]
    
  module Comparator_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = geq(io.a, io.b) @[Comparator.scala 12:13]
    when _T_11 : @[Comparator.scala 12:22]
      io.output <= io.a @[Comparator.scala 13:15]
      skip @[Comparator.scala 12:22]
    else : @[Comparator.scala 14:15]
      io.output <= io.b @[Comparator.scala 15:15]
      skip @[Comparator.scala 14:15]
    
  module Comparator_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = geq(io.a, io.b) @[Comparator.scala 12:13]
    when _T_11 : @[Comparator.scala 12:22]
      io.output <= io.a @[Comparator.scala 13:15]
      skip @[Comparator.scala 12:22]
    else : @[Comparator.scala 14:15]
      io.output <= io.b @[Comparator.scala 15:15]
      skip @[Comparator.scala 14:15]
    
  module MaxModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : SInt<32>[2][2], output : SInt<32>, flip en : UInt<1>, valid : UInt<1>}
    
    wire wires_0 : SInt<32> @[MaxModule.scala 14:53]
    wire wires_1 : SInt<32> @[MaxModule.scala 14:53]
    wire wires_2 : SInt<32> @[MaxModule.scala 14:53]
    wire wires_3 : SInt<32> @[MaxModule.scala 14:53]
    inst comparators_0 of Comparator @[MaxModule.scala 15:61]
    comparators_0.clock <= clock
    comparators_0.reset <= reset
    inst comparators_1 of Comparator_1 @[MaxModule.scala 15:61]
    comparators_1.clock <= clock
    comparators_1.reset <= reset
    inst comparators_2 of Comparator_2 @[MaxModule.scala 15:61]
    comparators_2.clock <= clock
    comparators_2.reset <= reset
    inst comparators_3 of Comparator_3 @[MaxModule.scala 15:61]
    comparators_3.clock <= clock
    comparators_3.reset <= reset
    wires_0 <= io.input[0][0] @[MaxModule.scala 18:32]
    wires_1 <= io.input[0][1] @[MaxModule.scala 18:32]
    wires_2 <= io.input[1][0] @[MaxModule.scala 18:32]
    wires_3 <= io.input[1][1] @[MaxModule.scala 18:32]
    comparators_0.io.b <= asSInt(UInt<32>("h00")) @[MaxModule.scala 31:25]
    comparators_1.io.b <= comparators_0.io.output @[MaxModule.scala 33:31]
    comparators_2.io.b <= comparators_1.io.output @[MaxModule.scala 33:31]
    comparators_3.io.b <= comparators_2.io.output @[MaxModule.scala 33:31]
    comparators_0.io.a <= wires_0 @[MaxModule.scala 36:27]
    comparators_1.io.a <= wires_1 @[MaxModule.scala 36:27]
    comparators_2.io.a <= wires_2 @[MaxModule.scala 36:27]
    comparators_3.io.a <= wires_3 @[MaxModule.scala 36:27]
    when io.en : @[MaxModule.scala 22:15]
      io.output <= comparators_3.io.output @[MaxModule.scala 23:15]
      io.valid <= io.en @[MaxModule.scala 24:14]
      skip @[MaxModule.scala 22:15]
    else : @[MaxModule.scala 25:15]
      io.output <= asSInt(UInt<1>("h00")) @[MaxModule.scala 26:15]
      io.valid <= io.en @[MaxModule.scala 27:14]
      skip @[MaxModule.scala 25:15]
    
