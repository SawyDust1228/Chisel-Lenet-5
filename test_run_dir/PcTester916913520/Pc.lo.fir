circuit Pc : @[:@2.0]
  module Pc : @[:@3.2]
    input clock : Clock @[:@4.4]
    input reset : UInt<1> @[:@5.4]
    input io_pc : UInt<32> @[:@6.4]
    output io_pcNext : UInt<32> @[:@6.4]
    output io_clear : UInt<1> @[:@6.4]
  
    reg clear : UInt<1>, clock with :
      reset => (UInt<1>("h0"), clear) @[Pc.scala 11:22:@8.4]
    reg pcNext : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pcNext) @[Pc.scala 12:23:@9.4]
    io_pcNext <= pcNext @[Pc.scala 16:13:@12.4]
    io_clear <= clear @[Pc.scala 14:12:@10.4]
    clear <= mux(reset, UInt<1>("h0"), clear)
    pcNext <= mux(reset, UInt<32>("h0"), io_pc) @[Pc.scala 15:10:@11.4]
