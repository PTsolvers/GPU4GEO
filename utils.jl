using Dates
import Hyperscript as HS

node = HS.m

# March 5, 2019
dfmt(d) = Dates.format(d, "U d, yyyy")

function hfun_dfmt(p::Vector{String})
    d = getlvar(Symbol(p[1]))
    return dfmt(d)
end

# ===============================================
# Logic to show the list of tags for a page
# ===============================================

function hfun_page_tags()
    tags = get_page_tags()
    base = globvar(:tags_prefix)
    return join(
        (
            node("span", class="tag",
                node("a", href="/$base/$id/", name)
            )
            for (id, name) in tags
        ),
        node("span", class="separator", "•")
    )
end

# ===============================================
# Logic to show the list of tags for a page
# ===============================================

function hfun_taglist()
    return hfun_list_posts(getlvar(:tag_name))
end

# ===============================================
# Logic to retrieve posts in posts/ and display
# them as a list sorted by anti-chronological
# order.
#
# Assumes that 'date' and 'title' are defined for
# all posts.
# ===============================================

function hfun_list_posts(t::String)
    return string(
        node("ul",
                (
                    node("li",
                        node("span", class="date", Dates.format(p.date, "U d, yyyy")),
                        node("a", class="title", href=p.href, p.title)
                    )
                    for p in get_posts(t)
                )...
            )
        )
end
hfun_list_posts() = hfun_list_posts("")


function get_posts(t::String)
    # find all valid "posts/xxx.md" files, exclude the index which is where
    # the post-list gets placed
    paths = joinpath.(
        "posts",
        filter!(
            p -> endswith(p, ".md") && p != "index.md",
            readdir("posts")
        )
    )
    # for each of those posts, retrieve date and title, both are expected
    # to be there
    posts = [
        (
            date  = getvarfrom(:date, rp),
            title = getvarfrom(:title, rp),
            href  = "/$(splitext(rp)[1])",
            tags  = get_page_tags(rp)
        )
        for rp in paths
    ]
    sort!(posts, by = x -> x.date, rev=true)
    if !isempty(t)
        filter!(
            p -> t in values(p.tags),
            posts
        )
    end
    return posts
end
