+++

prepath = "GPU4GEO"

# Layout information

author = "GPU4GEO"
author_blurb = "Frontier GPU multi-physics solvers "
author_short = "GPU4GEO"

meta_descr = "John Doe's personal website"
meta_kw = "blog,developer,personal"

tw_card = "summary"
tw_title = author_short
tw_descr = meta_descr

website_url = "https://github.com/PTsolvers/GPU4GEO/"

footer_notice = """
  © 2022 $author · Powered by
    <a href="https://franklin.jl">Franklin.jl</a> &
    <a href="https://github.com/luizdepra/hugo-coder/">Coder</a>."""

nav_items = [
  "Project" => "/project/",
  "News"  => "/posts/",
  "Team" => "/team/",
  "Publications" => "/publications/"
]

# Social URLs for the home page

social_github   = "https://github.com/PTsolvers/"
rss_link        = "https://github.com/PTsolvers/GPU4GEO/index.xml"

# Layout / Franklin specifics

content_tag = ""
heading_link = false
heading_post = """
  <a class="heading-link" href="#HEADING_ID">
    <i class="fa fa-link" aria-hidden="true"></i>
  </a>
  """
fn_title = ""
+++

\newcommand{\html}[1]{~~~#1~~~}
