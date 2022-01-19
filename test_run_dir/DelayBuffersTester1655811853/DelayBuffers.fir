;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit DelayBuffers : 
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
    
  module DelayModule_2 : 
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
    output io : {flip inputData : SInt<32>[3], outputData : SInt<32>[3]}
    
    inst delayBuffers_0 of DelayModule @[DelayBuffers.scala 11:50]
    delayBuffers_0.clock <= clock
    delayBuffers_0.reset <= reset
    inst delayBuffers_1 of DelayModule_1 @[DelayBuffers.scala 11:50]
    delayBuffers_1.clock <= clock
    delayBuffers_1.reset <= reset
    inst delayBuffers_2 of DelayModule_2 @[DelayBuffers.scala 11:50]
    delayBuffers_2.clock <= clock
    delayBuffers_2.reset <= reset
    delayBuffers_1.io.inputData[0] <= delayBuffers_0.io.outputData[0] @[DelayBuffers.scala 13:35]
    delayBuffers_1.io.inputData[1] <= delayBuffers_0.io.outputData[1] @[DelayBuffers.scala 13:35]
    delayBuffers_1.io.inputData[2] <= delayBuffers_0.io.outputData[2] @[DelayBuffers.scala 13:35]
    delayBuffers_2.io.inputData[0] <= delayBuffers_1.io.outputData[0] @[DelayBuffers.scala 13:35]
    delayBuffers_2.io.inputData[1] <= delayBuffers_1.io.outputData[1] @[DelayBuffers.scala 13:35]
    delayBuffers_2.io.inputData[2] <= delayBuffers_1.io.outputData[2] @[DelayBuffers.scala 13:35]
    delayBuffers_0.io.inputData[0] <= io.inputData[0] @[DelayBuffers.scala 16:32]
    delayBuffers_0.io.inputData[1] <= io.inputData[1] @[DelayBuffers.scala 16:32]
    delayBuffers_0.io.inputData[2] <= io.inputData[2] @[DelayBuffers.scala 16:32]
    io.outputData[0] <= delayBuffers_2.io.outputData[0] @[DelayBuffers.scala 17:17]
    io.outputData[1] <= delayBuffers_2.io.outputData[1] @[DelayBuffers.scala 17:17]
    io.outputData[2] <= delayBuffers_2.io.outputData[2] @[DelayBuffers.scala 17:17]
    
