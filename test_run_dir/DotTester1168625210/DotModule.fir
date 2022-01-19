;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit conv.dotopration.DotModule :
  module conv.dotopration.DotModule :
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inputData : UInt<32>[3], flip weight : UInt<32>[3], output : UInt<32>[3]}
    
    reg outputReg : UInt<32>[3], clock @[conv.dotopration.DotModule.scala 10:22]
    node _T_61 = mul(io.inputData[0], io.weight[0]) @[conv.dotopration.DotModule.scala 12:37]
    outputReg[0] <= _T_61 @[conv.dotopration.DotModule.scala 12:18]
    node _T_62 = mul(io.inputData[1], io.weight[1]) @[conv.dotopration.DotModule.scala 12:37]
    outputReg[1] <= _T_62 @[conv.dotopration.DotModule.scala 12:18]
    node _T_63 = mul(io.inputData[2], io.weight[2]) @[conv.dotopration.DotModule.scala 12:37]
    outputReg[2] <= _T_63 @[conv.dotopration.DotModule.scala 12:18]
    io.output[0] <= outputReg[0] @[conv.dotopration.DotModule.scala 14:13]
    io.output[1] <= outputReg[1] @[conv.dotopration.DotModule.scala 14:13]
    io.output[2] <= outputReg[2] @[conv.dotopration.DotModule.scala 14:13]
    
