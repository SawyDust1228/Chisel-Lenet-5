;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Pool : 
  module PoolFSM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {output : UInt<1>, finish : UInt<1>, outState : UInt<32>, outCounter : UInt<32>}
    
    reg state : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[PoolFSM.scala 15:22]
    reg count : UInt<32>, clock with : (reset => (reset, UInt<32>("h01"))) @[PoolFSM.scala 16:22]
    reg numCounter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[PoolFSM.scala 17:27]
    reg stallCounter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[PoolFSM.scala 18:29]
    node _T_20 = eq(UInt<2>("h00"), state) @[Conditional.scala 37:30]
    when _T_20 : @[Conditional.scala 40:58]
      node _T_23 = sub(UInt<2>("h02"), UInt<1>("h01")) @[PoolFSM.scala 22:35]
      node _T_24 = asUInt(_T_23) @[PoolFSM.scala 22:35]
      node _T_25 = tail(_T_24, 1) @[PoolFSM.scala 22:35]
      node _T_26 = eq(count, _T_25) @[PoolFSM.scala 22:18]
      when _T_26 : @[PoolFSM.scala 22:43]
        state <= UInt<2>("h01") @[PoolFSM.scala 23:15]
        node _T_28 = add(numCounter, UInt<1>("h01")) @[PoolFSM.scala 24:34]
        node _T_29 = tail(_T_28, 1) @[PoolFSM.scala 24:34]
        numCounter <= _T_29 @[PoolFSM.scala 24:20]
        skip @[PoolFSM.scala 22:43]
      else : @[PoolFSM.scala 25:19]
        node _T_31 = add(count, UInt<1>("h01")) @[PoolFSM.scala 26:24]
        node _T_32 = tail(_T_31, 1) @[PoolFSM.scala 26:24]
        count <= _T_32 @[PoolFSM.scala 26:15]
        state <= UInt<2>("h00") @[PoolFSM.scala 27:15]
        skip @[PoolFSM.scala 25:19]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_33 = eq(UInt<2>("h01"), state) @[Conditional.scala 37:30]
      when _T_33 : @[Conditional.scala 39:67]
        node _T_36 = mul(UInt<4>("h08"), UInt<4>("h08")) @[PoolFSM.scala 31:42]
        node _T_39 = mul(UInt<2>("h02"), UInt<2>("h02")) @[PoolFSM.scala 31:72]
        node _T_40 = div(_T_36, _T_39) @[PoolFSM.scala 31:57]
        node _T_41 = eq(numCounter, _T_40) @[PoolFSM.scala 31:23]
        when _T_41 : @[PoolFSM.scala 31:90]
          state <= UInt<2>("h03") @[PoolFSM.scala 32:15]
          skip @[PoolFSM.scala 31:90]
        else : @[PoolFSM.scala 33:19]
          state <= UInt<2>("h02") @[PoolFSM.scala 34:15]
          stallCounter <= UInt<1>("h01") @[PoolFSM.scala 35:22]
          skip @[PoolFSM.scala 33:19]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_43 = eq(UInt<2>("h02"), state) @[Conditional.scala 37:30]
        when _T_43 : @[Conditional.scala 39:67]
          node _T_46 = sub(UInt<2>("h02"), UInt<1>("h01")) @[PoolFSM.scala 39:41]
          node _T_47 = asUInt(_T_46) @[PoolFSM.scala 39:41]
          node _T_48 = tail(_T_47, 1) @[PoolFSM.scala 39:41]
          node _T_49 = eq(stallCounter, _T_48) @[PoolFSM.scala 39:25]
          when _T_49 : @[PoolFSM.scala 39:48]
            state <= UInt<2>("h01") @[PoolFSM.scala 40:15]
            skip @[PoolFSM.scala 39:48]
          else : @[PoolFSM.scala 41:19]
            node _T_51 = add(stallCounter, UInt<1>("h01")) @[PoolFSM.scala 42:38]
            node _T_52 = tail(_T_51, 1) @[PoolFSM.scala 42:38]
            stallCounter <= _T_52 @[PoolFSM.scala 42:22]
            state <= UInt<2>("h02") @[PoolFSM.scala 43:15]
            skip @[PoolFSM.scala 41:19]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_53 = eq(UInt<2>("h03"), state) @[Conditional.scala 37:30]
          when _T_53 : @[Conditional.scala 39:67]
            state <= UInt<2>("h03") @[PoolFSM.scala 47:13]
            skip @[Conditional.scala 39:67]
    node _T_54 = eq(state, UInt<2>("h00")) @[PoolFSM.scala 51:14]
    when _T_54 : @[PoolFSM.scala 51:26]
      io.output <= UInt<1>("h00") @[PoolFSM.scala 52:15]
      io.finish <= UInt<1>("h00") @[PoolFSM.scala 53:15]
      io.outState <= UInt<1>("h01") @[PoolFSM.scala 54:17]
      skip @[PoolFSM.scala 51:26]
    else : @[PoolFSM.scala 55:35]
      node _T_58 = eq(state, UInt<2>("h01")) @[PoolFSM.scala 55:20]
      when _T_58 : @[PoolFSM.scala 55:35]
        io.output <= UInt<1>("h01") @[PoolFSM.scala 56:15]
        io.finish <= UInt<1>("h00") @[PoolFSM.scala 57:15]
        io.outState <= UInt<2>("h02") @[PoolFSM.scala 58:17]
        node _T_63 = add(numCounter, UInt<1>("h01")) @[PoolFSM.scala 59:30]
        node _T_64 = tail(_T_63, 1) @[PoolFSM.scala 59:30]
        numCounter <= _T_64 @[PoolFSM.scala 59:16]
        skip @[PoolFSM.scala 55:35]
      else : @[PoolFSM.scala 60:37]
        node _T_65 = eq(state, UInt<2>("h02")) @[PoolFSM.scala 60:20]
        when _T_65 : @[PoolFSM.scala 60:37]
          io.output <= UInt<1>("h00") @[PoolFSM.scala 61:15]
          io.finish <= UInt<1>("h00") @[PoolFSM.scala 62:15]
          io.outState <= UInt<2>("h03") @[PoolFSM.scala 63:17]
          skip @[PoolFSM.scala 60:37]
        else : @[PoolFSM.scala 64:15]
          io.output <= UInt<1>("h00") @[PoolFSM.scala 65:15]
          io.finish <= UInt<1>("h01") @[PoolFSM.scala 66:15]
          io.outState <= UInt<3>("h04") @[PoolFSM.scala 67:17]
          skip @[PoolFSM.scala 64:15]
    io.outCounter <= count @[PoolFSM.scala 70:17]
    
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
    
  module DelayModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[2], outputData : SInt<32>[2]}
    
    reg regs : SInt<32>[2], clock @[DelayModule.scala 11:17]
    regs[0] <= io.inputData[0] @[DelayModule.scala 12:8]
    regs[1] <= io.inputData[1] @[DelayModule.scala 12:8]
    io.outputData[0] <= regs[0] @[DelayModule.scala 13:17]
    io.outputData[1] <= regs[1] @[DelayModule.scala 13:17]
    
  module DelayBuffers : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[2], outputData : SInt<32>[2], outputWires : SInt<32>[2][1]}
    
    inst delayBuffers_0 of DelayModule @[DelayBuffers.scala 12:50]
    delayBuffers_0.clock <= clock
    delayBuffers_0.reset <= reset
    delayBuffers_0.io.inputData[0] <= io.inputData[0] @[DelayBuffers.scala 17:32]
    delayBuffers_0.io.inputData[1] <= io.inputData[1] @[DelayBuffers.scala 17:32]
    io.outputData[0] <= delayBuffers_0.io.outputData[0] @[DelayBuffers.scala 18:17]
    io.outputData[1] <= delayBuffers_0.io.outputData[1] @[DelayBuffers.scala 18:17]
    io.outputWires[0][0] <= delayBuffers_0.io.outputData[0] @[DelayBuffers.scala 21:23]
    io.outputWires[0][1] <= delayBuffers_0.io.outputData[1] @[DelayBuffers.scala 21:23]
    
  module Pool : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : SInt<32>[2], outData : SInt<32>, valid : UInt<1>, finish : UInt<1>}
    
    inst poolFSM of PoolFSM @[Pool.scala 15:23]
    poolFSM.clock <= clock
    poolFSM.reset <= reset
    inst maxModule of MaxModule @[Pool.scala 16:25]
    maxModule.clock <= clock
    maxModule.reset <= reset
    inst delayBuffers of DelayBuffers @[Pool.scala 17:28]
    delayBuffers.clock <= clock
    delayBuffers.reset <= reset
    io.valid <= poolFSM.io.output @[Pool.scala 21:14]
    io.finish <= poolFSM.io.finish @[Pool.scala 22:15]
    io.outData <= maxModule.io.output @[Pool.scala 23:16]
    maxModule.io.en <= poolFSM.io.output @[Pool.scala 24:21]
    delayBuffers.io.inputData[0] <= io.inputData[0] @[Pool.scala 25:18]
    delayBuffers.io.inputData[1] <= io.inputData[1] @[Pool.scala 25:18]
    maxModule.io.input[0][0] <= io.inputData[0] @[Pool.scala 28:31]
    maxModule.io.input[0][1] <= io.inputData[1] @[Pool.scala 28:31]
    maxModule.io.input[1][0] <= delayBuffers.io.outputWires[0][0] @[Pool.scala 30:31]
    maxModule.io.input[1][1] <= delayBuffers.io.outputWires[0][1] @[Pool.scala 30:31]
    
