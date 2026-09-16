"""
Keeps `publications.md` in sync with what the GPU4GEO team publishes.

- `weekly`: scans OpenAlex for recent works by the people in `people.toml`, keeps those
  using the Julia stack listed in `config.toml`, and edits `publications.md`.
- `add_dois`: formats and inserts publications from a list of DOIs.
"""
module PubBot

using Dates, Downloads, JSON, TOML, Unicode
using Poppler_jll: pdftotext

const BOTDIR = dirname(@__DIR__)
const ROOT = dirname(BOTDIR)
const PAGE = joinpath(ROOT, "publications.md")
const SEEN = joinpath(BOTDIR, "seen_dois.txt")

include("util.jl")
include("config.jl")
include("http.jl")
include("page.jl")
include("format.jl")
include("openalex.jl")
include("fulltext.jl")
include("classify.jl")
include("preprints.jl")
include("report.jl")
include("main.jl")

end
