import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

const intro = "Hi! I'm Umang Surana, a software developer specialising in desktop apps and web apps!
I'm currently studying Applied AI and Analytics at Nanyang Polytechnic, Singapore."

pub fn nav() {
  html.div([], [
    html.nav([attribute.id("navbar")], [
      html.a([attribute.href("/")], [
        html.img([attribute.src("/priv/assets/pfp.jpg"), attribute.class("pfp")]),
      ]),
      html.div([attribute.class("navbar-links")], [
        link("/", "Home"),
        link("/projects", "Projects"),
        link("/contact", "Contact"),
      ]),
      html.a(
        [
          attribute.href("https://github.com/unsecretised/"),
          attribute.target("_blank"),
        ],
        [
          html.img([
            attribute.src(
              "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
            ),
            attribute.class("pfp"),
          ]),
        ],
      ),
    ]),
  ])
}

fn link(href: String, text: String) -> Element(msg) {
  html.a([attribute.href(href), attribute.class("navbar-link")], [
    html.text(text),
  ])
}

// VIEW PAGES ------------------------------------------------------------------

pub fn view_index() -> List(Element(msg)) {
  [
    html.div([attribute.class("hello")], [
      html.img([
        attribute.src("/priv/assets/pfp.jpg"),
        attribute.class("me-image"),
      ]),
      html.div([attribute.class("micro-description")], [
        html.h1([attribute.class("home-title")], [
          html.text("Umang Surana"),
        ]),
        html.p([attribute.class("home-description")], [
          html.text("Backend and Desktop app"),
          html.br([]),
          html.text("Software developer"),
        ]),
        html.div([attribute.class("socials")], [
          html.a(
            [
              attribute.href("https://github.com/unsecretised/"),
              attribute.target("_blank"),
            ],
            [
              html.img([
                attribute.src(
                  "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
                ),
                attribute.class("pfp"),
              ]),
            ],
          ),
          html.a(
            [
              attribute.href("mailto:umang@umangsurana.com"),
              attribute.target("_blank"),
            ],
            [
              html.img([
                attribute.src("/priv/assets/gmail.png"),
                attribute.class("pfp"),
                attribute.id("email-icon"),
              ]),
            ],
          ),
        ]),
      ]),
    ]),
    html.div([attribute.class("detailed-description")], [
      html.p([], [
        html.text(intro),
      ]),
      html.div([attribute.id("my-strengths")], [
        html.div([attribute.class("skills-div")], [
          html.h2([attribute.class("skills-title")], [html.text("My Skills")]),
          html.ul([attribute.class("skills-list")], [
            html.li([attribute.class("skills-item"), attribute.id("rust")], [
              html.img([
                attribute.src(
                  "https://rustacean.net/assets/rustacean-orig-noshadow.svg",
                ),
                attribute.class("skills-icon"),
              ]),
              html.text("Rust"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("gleam")], [
              html.img([
                attribute.src("https://gleam.run/images/lucy/lucy.svg"),
                attribute.class("skills-icon"),
              ]),
              html.text("Gleam"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("python")], [
              html.img([
                attribute.src(
                  "https://www.python.org/static/img/python-logo-large.c36dccadd999.png?1646853871",
                ),
                attribute.class("skills-icon"),
              ]),
              html.text("Python"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("sql")], [
              html.img([
                attribute.src("/priv/assets/psql.png"),
                attribute.class("skills-icon"),
              ]),
              html.text("SQL"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("html")], [
              html.img([
                attribute.src(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/512px-HTML5_logo_and_wordmark.svg.png",
                ),
                attribute.class("skills-icon"),
              ]),
              html.text("HTML"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("css")], [
              html.img([
                attribute.src(
                  "https://upload.wikimedia.org/wikipedia/commons/d/d5/CSS3_logo_and_wordmark.svg",
                ),
                attribute.class("skills-icon"),
              ]),
              html.text("CSS"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("deno")], [
              html.img([
                attribute.src("/priv/assets/deno.png"),
                attribute.class("skills-icon"),
              ]),
              html.text("Deno"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("nodejs")], [
              html.img([
                attribute.src("https://nodejs.org/static/logos/jsIconWhite.svg"),
                attribute.class("skills-icon"),
              ]),
              html.text("NodeJS"),
            ]),
            html.li([attribute.class("skills-item"), attribute.id("golang")], [
              html.img([
                attribute.src("https://go.dev/images/go-logo-white.svg"),
                attribute.class("skills-icon"),
              ]),
              html.text("Go"),
            ]),
            html.li(
              [attribute.class("skills-item"), attribute.id("javascript")],
              [
                html.img([
                  attribute.src(
                    "https://www.svgrepo.com/show/303206/javascript-logo.svg",
                  ),
                  attribute.class("skills-icon"),
                ]),
                html.text("JavaScript"),
              ],
            ),
          ]),
        ]),
        html.div([attribute.class("skills-div experience")], [
          html.h2([attribute.class("skills-title")], [
            html.text("My Best Projects"),
          ]),
          html.ul([attribute.class("skills-list skills-list-exp")], [
            html.li([attribute.class("skills-item skills-list-exp")], [
              html.a(
                [
                  attribute.href("https://github.com/OneLLM-Dev/OneLLM"),
                  attribute.target("_blank"),
                ],
                [
                  html.text("OneLLM"),
                ],
              ),
              html.text(
                "An AI API Aggregator that aggregates and simplifies the APIs of various LLMs",
              ),
            ]),

            html.li([attribute.class("skills-item skills-list-exp")], [
              html.a(
                [
                  attribute.href("https://rustcast.umangsurana.com"),
                  attribute.target("_blank"),
                ],
                [
                  html.text("RustCast"),
                ],
              ),

              html.text(
                "A Open Source alternative to a paid and closed source MacOS Productivity App",
              ),
            ]),
            html.li([attribute.class("skills-item skills-list-exp")], [
              html.a(
                [
                  attribute.href("https://github.com/unsecretised/lion"),
                  attribute.target("_blank"),
                ],
                [
                  html.text("Lion"),
                ],
              ),

              html.text(
                "A CLI tool for unifying the commands for various package managers",
              ),
            ]),
          ]),
        ]),
      ]),
    ]),
  ]
}

pub fn view_projects() -> List(Element(msg)) {
  [
    html.div([attribute.id("projects")], list.map(projects, project_card)),
  ]
}

pub fn view_contact() -> List(Element(msg)) {
  [
    html.div([attribute.class("contact-page")], [
      html.h2([], [html.text("Contact me at:")]),
      html.div([attribute.class("contact-cards")], [
        contact_card(
          "mailto:umang@umangsurana.com",
          "umang@umangsurana.com",
          "priv/assets/gmail.png",
        ),
        contact_card(
          "https://github.com/unsecretised/",
          "@unsecretised",
          "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
        ),
      ]),
    ]),
  ]
}

pub fn contact_card(href: String, text: String, icon: String) -> Element(msg) {
  html.a(
    [
      attribute.href(href),
      attribute.target("_blank"),
      attribute.class("contact-link"),
    ],
    [
      html.img([attribute.src(icon), attribute.class("pfp")]),
      html.text(text),
    ],
  )
}

pub fn view_not_found() -> List(Element(msg)) {
  [
    html.div([attribute.id("not-found")], [
      html.text(
        "You glimpse into the void and see -- nothing?
       Well that was somewhat expected.",
      ),
    ]),
  ]
}

type Project {
  Project(title: String, description: String, image: String, link: String)
}

fn project_card(project: Project) -> Element(msg) {
  html.div([attribute.class("project-card")], [
    html.img([attribute.src(project.image), attribute.class("project-image")]),
    html.div([attribute.class("project-card-content")], [
      html.h2([attribute.class("project-card-title")], [
        html.text(project.title),
      ]),
      html.p([attribute.class("project-card-description")], [
        html.text(project.description),
      ]),
      html.a(
        [
          attribute.href(project.link),
          attribute.class("project-card-link"),
          attribute.target("_blank"),
        ],
        [
          html.text("Read more"),
        ],
      ),
    ]),
  ])
}

const projects = [
  Project(
    title: "RustCast",
    description: "Built from scratch an open source, blazing fast app, reaching 72 stars, 240 downloads, and bringing in a few sponsors",
    image: "priv/assets/rustcast-poster.png",
    link: "https://rustcast.umangsurana.com",
  ),
  Project(
    title: "OneLLM",
    description: "CEO and Founder of OneLLM, which was an AI API Aggregator that aggregates and simplifies the APIs of various LLMs.",
    image: "/priv/assets/OneLLM-Horizontal-2.png",
    link: "https://github.com/OneLLM-Dev/OneLLM",
  ),
  Project(
    title: "Secretised YouTube Channel",
    description: "Research edit, and post videos on Cybersecurity, and Rust",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/1004px-Logo_of_YouTube_%282015-2017%29.svg.png?20200109235614",
    link: "https://youtube.com/@secretised",
  ),
  Project(
    title: "Lion",
    description: "Built Lion, a CLI tool for unifying the commands for various package managers",
    image: "priv/assets/Lion-cli-icon.png",
    link: "https://github.com/unsecretised/lion",
  ),
  Project(
    title: "Docky",
    description: "Developed from scratch a customisable macos dock alternative.",
    image: "priv/assets/docky.png",
    link: "https://github.com/unsecretised/docky",
  ),
  Project(
    title: "Oxid",
    description: "Authored Oxid, a login / signup app that works via the CLI. It uses production grade cryptography, and code from here was used in production.",
    image: "https://portfolio.umangsurana.com/media/Oxid-icon.png",
    link: "https://github.com/unsecretised/oxid",
  ),
]
