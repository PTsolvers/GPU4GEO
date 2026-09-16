# Publication bot

Keeps [publications.md](../publications.md) up to date. Two GitHub workflows use it:

- **Scan** ([PubScan.yml](../.github/workflows/PubScan.yml)): on the 1st and 15th of each month, finds recent
  papers by the people in [people.toml](people.toml) that use the Julia stack in [config.toml](config.toml),
  and opens a pull request that adds them. A scan is skipped while the previous pull request is open.
- **Add a publication** issue form ([PubAdd.yml](../.github/workflows/PubAdd.yml)): repository
  collaborators paste DOIs, and a pull request with the formatted entries is opened.

## How papers are selected

1. [OpenAlex](https://openalex.org) works published within the last `lookback_months` by anyone in
   `people.toml` (by ORCID), plus works by anyone citing a core package paper.
2. Repository copies, peer-review comments and duplicates are dropped; a preprint and its published
   version are merged. DOIs already on the page or listed in `seen_dois.txt` are skipped.
3. Evidence of stack use is collected from the open-access PDF (Copernicus, arXiv, JOSS/JuliaCon,
   HAL), or from the OpenAlex full-text index when the publisher blocks downloads, from the title and
   abstract, and from citations of package papers.
4. Each paper is classified:
   - ✅ **added**: an author from `people.toml`, and a package of the stack, either a core one or a
     general Julia GPU package (CUDA.jl, Enzyme.jl, …); Trixi.jl only for GPU work;
   - 🟡 **needs review**: weaker evidence, listed in the pull request with a ready-to-paste entry;
   - ❌ **no stack signal**: listed collapsed in the pull request.
   A team paper that thanks the project by name (GPU4GEO, c44) is ✅ on its own, even when it
   names no package. A term that funds many projects (PASC) is only worth 🟡.
   People marked `requires_acknowledgment` in `people.toml` must additionally thank the project
   (`[acknowledgment]` in `config.toml`); otherwise their papers drop to 🟡 (core package, or no
   full text to check) or ❌. Another co-author from `people.toml` lifts that requirement.
5. Preprints on the page whose published version appeared are replaced.

Merging a scan pull request records every evaluated DOI in `seen_dois.txt`, so nothing is proposed
twice. To drop an added entry, delete its line in the pull request before merging.

## Maintenance

- **People join or leave**: edit `people.toml` (`since = "YYYY-MM-DD"` ignores older papers).
- **New package**: add a `[[package]]` to `config.toml`.
- **Someone's papers need an explicit acknowledgment**: `requires_acknowledgment = true` in
  `people.toml`. Terms live in `[acknowledgment]`: `anywhere` for distinctive ones (GPU4GEO),
  `in_section` for generic ones searched only in the acknowledgments/funding section (PASC, c44,
  which would otherwise match a conference series and an elastic constant), and `weak` for terms
  that satisfy the requirement but never promote a paper by themselves (PASC funds many projects).
- **Misspelled author in publisher metadata**: add it to `[author_fixes]` in `config.toml`.
- **Re-evaluate a paper**: delete its DOI from `seen_dois.txt`.

## Running locally

```sh
julia --project=_pubbot -e 'using Pkg; Pkg.instantiate()'
julia --project=_pubbot _pubbot/weekly.jl --dry-run            # print the report only
julia --project=_pubbot _pubbot/add_doi.jl 10.5194/gmd-19-5343-2026
julia --project=_pubbot -e 'using Pkg; Pkg.test()'
```

PDF text is cached in `_pubbot/.cache` (git-ignored).

## OpenAlex quota

OpenAlex meters its API: without a key, 1000 credits per day per IP address, shared with everyone
else on the same GitHub runner. A list request costs 1 credit and a full-text search 10. Each
scan uses a few dozen credits (more on the first run, which checks the whole lookback window).
Get a free API key at <https://openalex.org> and store it as the repository secret `OPENALEX_API_KEY`;
locally, export the same variable.
