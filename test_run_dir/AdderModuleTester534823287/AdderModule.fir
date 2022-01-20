;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit AdderModule : 
  module Adder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module VectorAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], output : SInt<32>}
    
    inst adds_0 of Adder @[VectorAdder.scala 11:36]
    adds_0.clock <= clock
    adds_0.reset <= reset
    inst adds_1 of Adder_1 @[VectorAdder.scala 11:36]
    adds_1.clock <= clock
    adds_1.reset <= reset
    inst adds_2 of Adder_2 @[VectorAdder.scala 11:36]
    adds_2.clock <= clock
    adds_2.reset <= reset
    adds_1.io.a <= adds_0.io.output @[VectorAdder.scala 14:23]
    adds_2.io.a <= adds_1.io.output @[VectorAdder.scala 14:23]
    adds_0.io.a <= asSInt(UInt<32>("h00")) @[VectorAdder.scala 16:16]
    adds_0.io.b <= io.inputData[0] @[VectorAdder.scala 18:18]
    adds_1.io.b <= io.inputData[1] @[VectorAdder.scala 18:18]
    adds_2.io.b <= io.inputData[2] @[VectorAdder.scala 18:18]
    io.output <= adds_2.io.output @[VectorAdder.scala 22:13]
    
  module Adder_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module VectorAdder_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], output : SInt<32>}
    
    inst adds_0 of Adder_3 @[VectorAdder.scala 11:36]
    adds_0.clock <= clock
    adds_0.reset <= reset
    inst adds_1 of Adder_4 @[VectorAdder.scala 11:36]
    adds_1.clock <= clock
    adds_1.reset <= reset
    inst adds_2 of Adder_5 @[VectorAdder.scala 11:36]
    adds_2.clock <= clock
    adds_2.reset <= reset
    adds_1.io.a <= adds_0.io.output @[VectorAdder.scala 14:23]
    adds_2.io.a <= adds_1.io.output @[VectorAdder.scala 14:23]
    adds_0.io.a <= asSInt(UInt<32>("h00")) @[VectorAdder.scala 16:16]
    adds_0.io.b <= io.inputData[0] @[VectorAdder.scala 18:18]
    adds_1.io.b <= io.inputData[1] @[VectorAdder.scala 18:18]
    adds_2.io.b <= io.inputData[2] @[VectorAdder.scala 18:18]
    io.output <= adds_2.io.output @[VectorAdder.scala 22:13]
    
  module Adder_6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module VectorAdder_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], output : SInt<32>}
    
    inst adds_0 of Adder_6 @[VectorAdder.scala 11:36]
    adds_0.clock <= clock
    adds_0.reset <= reset
    inst adds_1 of Adder_7 @[VectorAdder.scala 11:36]
    adds_1.clock <= clock
    adds_1.reset <= reset
    inst adds_2 of Adder_8 @[VectorAdder.scala 11:36]
    adds_2.clock <= clock
    adds_2.reset <= reset
    adds_1.io.a <= adds_0.io.output @[VectorAdder.scala 14:23]
    adds_2.io.a <= adds_1.io.output @[VectorAdder.scala 14:23]
    adds_0.io.a <= asSInt(UInt<32>("h00")) @[VectorAdder.scala 16:16]
    adds_0.io.b <= io.inputData[0] @[VectorAdder.scala 18:18]
    adds_1.io.b <= io.inputData[1] @[VectorAdder.scala 18:18]
    adds_2.io.b <= io.inputData[2] @[VectorAdder.scala 18:18]
    io.output <= adds_2.io.output @[VectorAdder.scala 22:13]
    
  module Adder_9 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_10 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module Adder_11 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<32>, flip b : SInt<32>, output : SInt<32>}
    
    node _T_11 = add(io.a, io.b) @[Adder.scala 11:21]
    node _T_12 = tail(_T_11, 1) @[Adder.scala 11:21]
    node _T_13 = asSInt(_T_12) @[Adder.scala 11:21]
    io.output <= _T_13 @[Adder.scala 11:13]
    
  module AdderModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip en : UInt<1>, flip inputData : SInt<32>[3][3], outputData : SInt<32>, valid : UInt<1>}
    
    wire vecResult_0 : SInt<32>
    vecResult_0 <= asSInt(UInt<32>("h00"))
    wire vecResult_1 : SInt<32>
    vecResult_1 <= asSInt(UInt<32>("h00"))
    wire vecResult_2 : SInt<32>
    vecResult_2 <= asSInt(UInt<32>("h00"))
    when io.en : @[AdderModule.scala 14:15]
      inst VectorAdder of VectorAdder @[AdderModule.scala 16:31]
      VectorAdder.clock <= clock
      VectorAdder.reset <= reset
      VectorAdder.io.inputData[0] <= io.inputData[0][0] @[AdderModule.scala 17:32]
      VectorAdder.io.inputData[1] <= io.inputData[0][1] @[AdderModule.scala 17:32]
      VectorAdder.io.inputData[2] <= io.inputData[0][2] @[AdderModule.scala 17:32]
      vecResult_0 <= VectorAdder.io.output @[AdderModule.scala 18:20]
      inst VectorAdder_1 of VectorAdder_1 @[AdderModule.scala 16:31]
      VectorAdder_1.clock <= clock
      VectorAdder_1.reset <= reset
      VectorAdder_1.io.inputData[0] <= io.inputData[1][0] @[AdderModule.scala 17:32]
      VectorAdder_1.io.inputData[1] <= io.inputData[1][1] @[AdderModule.scala 17:32]
      VectorAdder_1.io.inputData[2] <= io.inputData[1][2] @[AdderModule.scala 17:32]
      vecResult_1 <= VectorAdder_1.io.output @[AdderModule.scala 18:20]
      inst VectorAdder_2 of VectorAdder_2 @[AdderModule.scala 16:31]
      VectorAdder_2.clock <= clock
      VectorAdder_2.reset <= reset
      VectorAdder_2.io.inputData[0] <= io.inputData[2][0] @[AdderModule.scala 17:32]
      VectorAdder_2.io.inputData[1] <= io.inputData[2][1] @[AdderModule.scala 17:32]
      VectorAdder_2.io.inputData[2] <= io.inputData[2][2] @[AdderModule.scala 17:32]
      vecResult_2 <= VectorAdder_2.io.output @[AdderModule.scala 18:20]
      inst Adder of Adder_9 @[AdderModule.scala 20:44]
      Adder.clock <= clock
      Adder.reset <= reset
      inst Adder_1 of Adder_10 @[AdderModule.scala 20:44]
      Adder_1.clock <= clock
      Adder_1.reset <= reset
      inst Adder_2 of Adder_11 @[AdderModule.scala 20:44]
      Adder_2.clock <= clock
      Adder_2.reset <= reset
      Adder_1.io.a <= Adder.io.output @[AdderModule.scala 22:25]
      Adder_2.io.a <= Adder_1.io.output @[AdderModule.scala 22:25]
      Adder.io.a <= asSInt(UInt<32>("h00")) @[AdderModule.scala 24:18]
      Adder.io.b <= vecResult_0 @[AdderModule.scala 26:20]
      Adder_1.io.b <= vecResult_1 @[AdderModule.scala 26:20]
      Adder_2.io.b <= vecResult_2 @[AdderModule.scala 26:20]
      io.outputData <= Adder_2.io.output @[AdderModule.scala 28:19]
      io.valid <= UInt<1>("h01") @[AdderModule.scala 29:14]
      skip @[AdderModule.scala 14:15]
    else : @[AdderModule.scala 30:15]
      io.outputData <= asSInt(UInt<32>("h00")) @[AdderModule.scala 31:19]
      io.valid <= UInt<1>("h00") @[AdderModule.scala 32:14]
      skip @[AdderModule.scala 30:15]
    
