;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Pc : 
  module Pc : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc : UInt<32>, pcNext : UInt<32>, clear : UInt<1>}
    
    reg clear : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Pc.scala 11:22]
    reg pcNext : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[Pc.scala 12:23]
    io.clear <= clear @[Pc.scala 14:12]
    pcNext <= io.pc @[Pc.scala 15:10]
    io.pcNext <= pcNext @[Pc.scala 16:13]
    
