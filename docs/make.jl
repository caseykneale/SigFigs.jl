using Documenter, SigFigs

makedocs(;
    modules=[SigFigs],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/caseykneale/SigFigs.jl/blob/{commit}{path}#L{line}",
    sitename="SigFigs.jl",
    authors="Casey Kneale",
    assets=String[],
)

deploydocs(;
    repo="github.com/caseykneale/SigFigs.jl",
)
