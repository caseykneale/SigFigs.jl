using SigFigs
using Test

@testset "SigFigs.jl" begin
    # Write your own tests here.
    @test signficantfigures( SigFig(35, 1) ) == 40
    @test signficantfigures( SigFig(330, 1) ) == 300
    @test signficantfigures( SigFig(333, 2) ) == 330
    @test signficantfigures( sqrt(SigFig(144, 1)) ) == 10
    @test signficantfigures( SigFig(10.1, 3) + SigFig(10.5, 2) ) == 21
    @test signficantfigures( SigFig(10.1, 3) + SigFig(10.1, 2) ) == 20
    @test signficantfigures( SigFig(10.1, 3) + 10 ) == 20.1
    @test signficantfigures( 11.0 + SigFig(10.1, 3) ) == 21.1
    #Test basic linear algebra stuff
    actual = [3,3] * Base.transpose([3,3] )
    @test all(vals([SigFig(3,2), SigFig(3,1)] * Base.transpose([ SigFig(3,2), SigFig(3,1) ] )) .== actual)
    @test transpose([ SigFig(3,2), SigFig(3,1) ]) == [ SigFig(3,2) SigFig(3,1)]
    @test (Base.transpose([SigFig(3,2), SigFig(3,1)]) * [ SigFig(3,2), SigFig(3,1) ]) == SigFig(18,1)
end