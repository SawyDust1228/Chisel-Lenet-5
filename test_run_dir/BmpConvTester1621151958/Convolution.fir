;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Convolution : 
  module DelayModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], outputData : SInt<32>[3]}
    
    reg regs : SInt<32>[3], clock @[DelayModule.scala 11:17]
    regs[0] <= io.inputData[0] @[DelayModule.scala 12:8]
    regs[1] <= io.inputData[1] @[DelayModule.scala 12:8]
    regs[2] <= io.inputData[2] @[DelayModule.scala 12:8]
    io.outputData[0] <= regs[0] @[DelayModule.scala 13:17]
    io.outputData[1] <= regs[1] @[DelayModule.scala 13:17]
    io.outputData[2] <= regs[2] @[DelayModule.scala 13:17]
    
  module DelayModule_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], outputData : SInt<32>[3]}
    
    reg regs : SInt<32>[3], clock @[DelayModule.scala 11:17]
    regs[0] <= io.inputData[0] @[DelayModule.scala 12:8]
    regs[1] <= io.inputData[1] @[DelayModule.scala 12:8]
    regs[2] <= io.inputData[2] @[DelayModule.scala 12:8]
    io.outputData[0] <= regs[0] @[DelayModule.scala 13:17]
    io.outputData[1] <= regs[1] @[DelayModule.scala 13:17]
    io.outputData[2] <= regs[2] @[DelayModule.scala 13:17]
    
  module DelayBuffers : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], outputData : SInt<32>[3], outputWires : SInt<32>[3][2]}
    
    inst delayBuffers_0 of DelayModule @[DelayBuffers.scala 12:50]
    delayBuffers_0.clock <= clock
    delayBuffers_0.reset <= reset
    inst delayBuffers_1 of DelayModule_1 @[DelayBuffers.scala 12:50]
    delayBuffers_1.clock <= clock
    delayBuffers_1.reset <= reset
    delayBuffers_1.io.inputData[0] <= delayBuffers_0.io.outputData[0] @[DelayBuffers.scala 14:35]
    delayBuffers_1.io.inputData[1] <= delayBuffers_0.io.outputData[1] @[DelayBuffers.scala 14:35]
    delayBuffers_1.io.inputData[2] <= delayBuffers_0.io.outputData[2] @[DelayBuffers.scala 14:35]
    delayBuffers_0.io.inputData[0] <= io.inputData[0] @[DelayBuffers.scala 17:32]
    delayBuffers_0.io.inputData[1] <= io.inputData[1] @[DelayBuffers.scala 17:32]
    delayBuffers_0.io.inputData[2] <= io.inputData[2] @[DelayBuffers.scala 17:32]
    io.outputData[0] <= delayBuffers_1.io.outputData[0] @[DelayBuffers.scala 18:17]
    io.outputData[1] <= delayBuffers_1.io.outputData[1] @[DelayBuffers.scala 18:17]
    io.outputData[2] <= delayBuffers_1.io.outputData[2] @[DelayBuffers.scala 18:17]
    io.outputWires[0][0] <= delayBuffers_0.io.outputData[0] @[DelayBuffers.scala 21:23]
    io.outputWires[0][1] <= delayBuffers_0.io.outputData[1] @[DelayBuffers.scala 21:23]
    io.outputWires[0][2] <= delayBuffers_0.io.outputData[2] @[DelayBuffers.scala 21:23]
    io.outputWires[1][0] <= delayBuffers_1.io.outputData[0] @[DelayBuffers.scala 21:23]
    io.outputWires[1][1] <= delayBuffers_1.io.outputData[1] @[DelayBuffers.scala 21:23]
    io.outputWires[1][2] <= delayBuffers_1.io.outputData[2] @[DelayBuffers.scala 21:23]
    
  module DotModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], flip weight : SInt<32>[3], output : SInt<32>[3]}
    
    wire outputWire_0 : SInt<32>
    outputWire_0 <= asSInt(UInt<32>("h00"))
    wire outputWire_1 : SInt<32>
    outputWire_1 <= asSInt(UInt<32>("h00"))
    wire outputWire_2 : SInt<32>
    outputWire_2 <= asSInt(UInt<32>("h00"))
    node _T_59 = mul(io.inputData[0], io.weight[0]) @[DotModule.scala 14:38]
    outputWire_0 <= _T_59 @[DotModule.scala 14:19]
    node _T_60 = mul(io.inputData[1], io.weight[1]) @[DotModule.scala 14:38]
    outputWire_1 <= _T_60 @[DotModule.scala 14:19]
    node _T_61 = mul(io.inputData[2], io.weight[2]) @[DotModule.scala 14:38]
    outputWire_2 <= _T_61 @[DotModule.scala 14:19]
    io.output[0] <= outputWire_0 @[DotModule.scala 17:18]
    io.output[1] <= outputWire_1 @[DotModule.scala 17:18]
    io.output[2] <= outputWire_2 @[DotModule.scala 17:18]
    
  module DotModule_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], flip weight : SInt<32>[3], output : SInt<32>[3]}
    
    wire outputWire_0 : SInt<32>
    outputWire_0 <= asSInt(UInt<32>("h00"))
    wire outputWire_1 : SInt<32>
    outputWire_1 <= asSInt(UInt<32>("h00"))
    wire outputWire_2 : SInt<32>
    outputWire_2 <= asSInt(UInt<32>("h00"))
    node _T_59 = mul(io.inputData[0], io.weight[0]) @[DotModule.scala 14:38]
    outputWire_0 <= _T_59 @[DotModule.scala 14:19]
    node _T_60 = mul(io.inputData[1], io.weight[1]) @[DotModule.scala 14:38]
    outputWire_1 <= _T_60 @[DotModule.scala 14:19]
    node _T_61 = mul(io.inputData[2], io.weight[2]) @[DotModule.scala 14:38]
    outputWire_2 <= _T_61 @[DotModule.scala 14:19]
    io.output[0] <= outputWire_0 @[DotModule.scala 17:18]
    io.output[1] <= outputWire_1 @[DotModule.scala 17:18]
    io.output[2] <= outputWire_2 @[DotModule.scala 17:18]
    
  module DotModule_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], flip weight : SInt<32>[3], output : SInt<32>[3]}
    
    wire outputWire_0 : SInt<32>
    outputWire_0 <= asSInt(UInt<32>("h00"))
    wire outputWire_1 : SInt<32>
    outputWire_1 <= asSInt(UInt<32>("h00"))
    wire outputWire_2 : SInt<32>
    outputWire_2 <= asSInt(UInt<32>("h00"))
    node _T_59 = mul(io.inputData[0], io.weight[0]) @[DotModule.scala 14:38]
    outputWire_0 <= _T_59 @[DotModule.scala 14:19]
    node _T_60 = mul(io.inputData[1], io.weight[1]) @[DotModule.scala 14:38]
    outputWire_1 <= _T_60 @[DotModule.scala 14:19]
    node _T_61 = mul(io.inputData[2], io.weight[2]) @[DotModule.scala 14:38]
    outputWire_2 <= _T_61 @[DotModule.scala 14:19]
    io.output[0] <= outputWire_0 @[DotModule.scala 17:18]
    io.output[1] <= outputWire_1 @[DotModule.scala 17:18]
    io.output[2] <= outputWire_2 @[DotModule.scala 17:18]
    
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
    
  module ConvFSM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {output : UInt<1>, finish : UInt<1>, outState : UInt<32>, outcounter : UInt<32>}
    
    reg state : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[ConvFSM.scala 15:22]
    reg count : UInt<32>, clock with : (reset => (reset, UInt<32>("h01"))) @[ConvFSM.scala 16:22]
    reg computeCounter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ConvFSM.scala 17:31]
    reg dontComputeCounter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ConvFSM.scala 18:35]
    reg rowComputeCounter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ConvFSM.scala 19:34]
    node _T_22 = eq(UInt<2>("h00"), state) @[Conditional.scala 37:30]
    when _T_22 : @[Conditional.scala 40:58]
      node _T_25 = sub(UInt<2>("h03"), UInt<1>("h01")) @[ConvFSM.scala 23:37]
      node _T_26 = asUInt(_T_25) @[ConvFSM.scala 23:37]
      node _T_27 = tail(_T_26, 1) @[ConvFSM.scala 23:37]
      node _T_28 = eq(count, _T_27) @[ConvFSM.scala 23:18]
      when _T_28 : @[ConvFSM.scala 23:44]
        state <= UInt<2>("h01") @[ConvFSM.scala 24:15]
        computeCounter <= UInt<1>("h01") @[ConvFSM.scala 25:24]
        skip @[ConvFSM.scala 23:44]
      else : @[ConvFSM.scala 26:19]
        node _T_31 = add(count, UInt<1>("h01")) @[ConvFSM.scala 27:24]
        node _T_32 = tail(_T_31, 1) @[ConvFSM.scala 27:24]
        count <= _T_32 @[ConvFSM.scala 27:15]
        skip @[ConvFSM.scala 26:19]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_33 = eq(UInt<2>("h01"), state) @[Conditional.scala 37:30]
      when _T_33 : @[Conditional.scala 39:67]
        node _T_36 = sub(UInt<9>("h01c2"), UInt<2>("h03")) @[ConvFSM.scala 31:49]
        node _T_37 = asUInt(_T_36) @[ConvFSM.scala 31:49]
        node _T_38 = tail(_T_37, 1) @[ConvFSM.scala 31:49]
        node _T_40 = add(_T_38, UInt<1>("h01")) @[ConvFSM.scala 31:66]
        node _T_41 = tail(_T_40, 1) @[ConvFSM.scala 31:66]
        node _T_42 = eq(computeCounter, _T_41) @[ConvFSM.scala 31:27]
        when _T_42 : @[ConvFSM.scala 31:73]
          state <= UInt<2>("h02") @[ConvFSM.scala 32:15]
          dontComputeCounter <= UInt<1>("h01") @[ConvFSM.scala 33:28]
          node _T_45 = add(rowComputeCounter, UInt<1>("h01")) @[ConvFSM.scala 34:48]
          node _T_46 = tail(_T_45, 1) @[ConvFSM.scala 34:48]
          rowComputeCounter <= _T_46 @[ConvFSM.scala 34:27]
          skip @[ConvFSM.scala 31:73]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_47 = eq(UInt<2>("h02"), state) @[Conditional.scala 37:30]
        when _T_47 : @[Conditional.scala 39:67]
          node _T_50 = sub(UInt<2>("h03"), UInt<1>("h01")) @[ConvFSM.scala 38:51]
          node _T_51 = asUInt(_T_50) @[ConvFSM.scala 38:51]
          node _T_52 = tail(_T_51, 1) @[ConvFSM.scala 38:51]
          node _T_53 = eq(dontComputeCounter, _T_52) @[ConvFSM.scala 38:32]
          node _T_56 = sub(UInt<10>("h0258"), UInt<2>("h03")) @[ConvFSM.scala 39:51]
          node _T_57 = asUInt(_T_56) @[ConvFSM.scala 39:51]
          node _T_58 = tail(_T_57, 1) @[ConvFSM.scala 39:51]
          node _T_60 = add(_T_58, UInt<1>("h01")) @[ConvFSM.scala 39:65]
          node _T_61 = tail(_T_60, 1) @[ConvFSM.scala 39:65]
          node _T_62 = eq(rowComputeCounter, _T_61) @[ConvFSM.scala 39:32]
          node _T_64 = eq(_T_62, UInt<1>("h00")) @[ConvFSM.scala 39:12]
          node _T_65 = and(_T_53, _T_64) @[ConvFSM.scala 39:9]
          when _T_65 : @[ConvFSM.scala 39:73]
            state <= UInt<2>("h01") @[ConvFSM.scala 40:15]
            computeCounter <= UInt<1>("h01") @[ConvFSM.scala 41:24]
            skip @[ConvFSM.scala 39:73]
          else : @[ConvFSM.scala 42:78]
            node _T_69 = sub(UInt<10>("h0258"), UInt<2>("h03")) @[ConvFSM.scala 42:56]
            node _T_70 = asUInt(_T_69) @[ConvFSM.scala 42:56]
            node _T_71 = tail(_T_70, 1) @[ConvFSM.scala 42:56]
            node _T_73 = add(_T_71, UInt<1>("h01")) @[ConvFSM.scala 42:70]
            node _T_74 = tail(_T_73, 1) @[ConvFSM.scala 42:70]
            node _T_75 = eq(rowComputeCounter, _T_74) @[ConvFSM.scala 42:37]
            when _T_75 : @[ConvFSM.scala 42:78]
              state <= UInt<2>("h03") @[ConvFSM.scala 43:15]
              skip @[ConvFSM.scala 42:78]
          skip @[Conditional.scala 39:67]
    node _T_76 = eq(state, UInt<2>("h00")) @[ConvFSM.scala 47:15]
    when _T_76 : @[ConvFSM.scala 47:28]
      io.finish <= UInt<1>("h00") @[ConvFSM.scala 48:15]
      io.output <= UInt<1>("h00") @[ConvFSM.scala 49:15]
      io.outState <= UInt<1>("h00") @[ConvFSM.scala 50:17]
      skip @[ConvFSM.scala 47:28]
    else : @[ConvFSM.scala 51:37]
      node _T_80 = eq(state, UInt<2>("h01")) @[ConvFSM.scala 51:21]
      when _T_80 : @[ConvFSM.scala 51:37]
        node _T_82 = add(computeCounter, UInt<1>("h01")) @[ConvFSM.scala 52:38]
        node _T_83 = tail(_T_82, 1) @[ConvFSM.scala 52:38]
        computeCounter <= _T_83 @[ConvFSM.scala 52:20]
        io.finish <= UInt<1>("h00") @[ConvFSM.scala 53:15]
        io.output <= UInt<1>("h01") @[ConvFSM.scala 54:15]
        io.outState <= UInt<1>("h01") @[ConvFSM.scala 55:17]
        skip @[ConvFSM.scala 51:37]
      else : @[ConvFSM.scala 56:41]
        node _T_87 = eq(state, UInt<2>("h02")) @[ConvFSM.scala 56:21]
        when _T_87 : @[ConvFSM.scala 56:41]
          node _T_89 = add(dontComputeCounter, UInt<1>("h01")) @[ConvFSM.scala 57:46]
          node _T_90 = tail(_T_89, 1) @[ConvFSM.scala 57:46]
          dontComputeCounter <= _T_90 @[ConvFSM.scala 57:24]
          io.finish <= UInt<1>("h00") @[ConvFSM.scala 58:15]
          io.output <= UInt<1>("h00") @[ConvFSM.scala 59:15]
          io.outState <= UInt<2>("h02") @[ConvFSM.scala 60:17]
          skip @[ConvFSM.scala 56:41]
        else : @[ConvFSM.scala 61:15]
          io.finish <= UInt<1>("h01") @[ConvFSM.scala 62:15]
          io.output <= UInt<1>("h00") @[ConvFSM.scala 63:15]
          io.outState <= UInt<2>("h03") @[ConvFSM.scala 64:17]
          skip @[ConvFSM.scala 61:15]
    io.outcounter <= count @[ConvFSM.scala 67:17]
    
  module Convolution : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[3], flip inputWeight : SInt<32>[3][3], finish : UInt<1>, outputData : SInt<32>, valid : UInt<1>}
    
    inst delayBuffer of DelayBuffers @[Convolution.scala 16:27]
    delayBuffer.clock <= clock
    delayBuffer.reset <= reset
    inst dotModules_0 of DotModule @[Convolution.scala 17:50]
    dotModules_0.clock <= clock
    dotModules_0.reset <= reset
    inst dotModules_1 of DotModule_1 @[Convolution.scala 17:50]
    dotModules_1.clock <= clock
    dotModules_1.reset <= reset
    inst dotModules_2 of DotModule_2 @[Convolution.scala 17:50]
    dotModules_2.clock <= clock
    dotModules_2.reset <= reset
    inst adderModule of AdderModule @[Convolution.scala 18:27]
    adderModule.clock <= clock
    adderModule.reset <= reset
    inst fsm of ConvFSM @[Convolution.scala 20:19]
    fsm.clock <= clock
    fsm.reset <= reset
    adderModule.io.en <= fsm.io.output @[Convolution.scala 24:23]
    io.finish <= fsm.io.finish @[Convolution.scala 25:15]
    io.valid <= adderModule.io.valid @[Convolution.scala 26:14]
    io.outputData <= adderModule.io.outputData @[Convolution.scala 27:19]
    delayBuffer.io.inputData[0] <= io.inputData[0] @[Convolution.scala 28:18]
    delayBuffer.io.inputData[1] <= io.inputData[1] @[Convolution.scala 28:18]
    delayBuffer.io.inputData[2] <= io.inputData[2] @[Convolution.scala 28:18]
    adderModule.io.inputData[0][0] <= dotModules_0.io.output[0] @[Convolution.scala 30:35]
    adderModule.io.inputData[0][1] <= dotModules_0.io.output[1] @[Convolution.scala 30:35]
    adderModule.io.inputData[0][2] <= dotModules_0.io.output[2] @[Convolution.scala 30:35]
    dotModules_0.io.weight[0] <= io.inputWeight[0][0] @[Convolution.scala 31:31]
    dotModules_0.io.weight[1] <= io.inputWeight[0][1] @[Convolution.scala 31:31]
    dotModules_0.io.weight[2] <= io.inputWeight[0][2] @[Convolution.scala 31:31]
    dotModules_0.io.inputData[0] <= io.inputData[0] @[Convolution.scala 33:36]
    dotModules_0.io.inputData[1] <= io.inputData[1] @[Convolution.scala 33:36]
    dotModules_0.io.inputData[2] <= io.inputData[2] @[Convolution.scala 33:36]
    adderModule.io.inputData[1][0] <= dotModules_1.io.output[0] @[Convolution.scala 30:35]
    adderModule.io.inputData[1][1] <= dotModules_1.io.output[1] @[Convolution.scala 30:35]
    adderModule.io.inputData[1][2] <= dotModules_1.io.output[2] @[Convolution.scala 30:35]
    dotModules_1.io.weight[0] <= io.inputWeight[1][0] @[Convolution.scala 31:31]
    dotModules_1.io.weight[1] <= io.inputWeight[1][1] @[Convolution.scala 31:31]
    dotModules_1.io.weight[2] <= io.inputWeight[1][2] @[Convolution.scala 31:31]
    dotModules_1.io.inputData[0] <= delayBuffer.io.outputWires[0][0] @[Convolution.scala 35:36]
    dotModules_1.io.inputData[1] <= delayBuffer.io.outputWires[0][1] @[Convolution.scala 35:36]
    dotModules_1.io.inputData[2] <= delayBuffer.io.outputWires[0][2] @[Convolution.scala 35:36]
    adderModule.io.inputData[2][0] <= dotModules_2.io.output[0] @[Convolution.scala 30:35]
    adderModule.io.inputData[2][1] <= dotModules_2.io.output[1] @[Convolution.scala 30:35]
    adderModule.io.inputData[2][2] <= dotModules_2.io.output[2] @[Convolution.scala 30:35]
    dotModules_2.io.weight[0] <= io.inputWeight[2][0] @[Convolution.scala 31:31]
    dotModules_2.io.weight[1] <= io.inputWeight[2][1] @[Convolution.scala 31:31]
    dotModules_2.io.weight[2] <= io.inputWeight[2][2] @[Convolution.scala 31:31]
    dotModules_2.io.inputData[0] <= delayBuffer.io.outputWires[1][0] @[Convolution.scala 35:36]
    dotModules_2.io.inputData[1] <= delayBuffer.io.outputWires[1][1] @[Convolution.scala 35:36]
    dotModules_2.io.inputData[2] <= delayBuffer.io.outputWires[1][2] @[Convolution.scala 35:36]
    
