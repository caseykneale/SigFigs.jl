module SigFigs
    using Base: +, -, /, * , %, transpose, inv
    mutable struct SigFig
        value::Real
        figures::Int
    end

    Base.:(==)( a::SigFig, b::SigFig )::Bool = ( a.value == b.value ) && ( a.figures == b.figures )

    significantfigures(a::SigFig) = round(a.value, sigdigits = a.figures)

    SigFig( values::AbstractArray{Real}, figures::UInt )::AbstractArray{SigFig} = [ SigFig(v, figures) for v in values ]
    vals( sfs::AbstractArray{SigFig} ) = map( sf -> sf.value, sfs )
    figs( sfs::AbstractArray{SigFig} ) = map( sf -> sf.figure, sfs )

    for s in (:+, :-, :/, :*, :^, :%)
        @eval begin
            Base.$s(sf::SigFig, value::Real)::SigFig = SigFig( Base.$s(sf.value, value), sf.figures )
            Base.$s(sf::SigFig, sf2::SigFig)::SigFig = SigFig( Base.$s(sf.value, sf2.value), min( sf.figures, sf2.figures ) )
            Base.$s(value::Real, sf::SigFig)::SigFig = SigFig( Base.$s(value,sf.value), sf.figures )
        end
    end

    #1-1 fns are just 1-1 fns
    for s in (:cos, :sin, :tan, :tanh, :cosh, :sinh, :atan, :acos, :asin, :log, :exp, :log10, :sqrt)
        @eval Base.$s(sf::SigFig)::SigFig = SigFig( Base.$s(sf.value), sf.figures )
    end

    #not optimized but OKAY
    Base.transpose(a::AbstractArray{SigFig})::AbstractArray{SigFig} = permutedims( a )
    Base.transpose(a::SigFig) = a

    #Think this one is true? Should handcheck it...
    #Base.inv(a::AbstractArray{SigFig})::AbstractArray{SigFig} =  ( Base.inv( vals( a ) ), reduce(min, figs( a )) )

    export SigFig, vals, figs, signficantfigures
end # module
