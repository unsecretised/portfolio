import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

fn intro() -> Element(msg) {
  let intro =
    "Hi! I'm Umang Surana, a software developer specialising in desktop web apps!
I'm currently studying Applied AI and Analytics at Nanyang Polytechnic, Singapore."
  html.p([], [
    html.text(intro),
  ])
}

fn social_icon(link: String, icon: String) -> Element(msg) {
  html.a(
    [
      attribute.href(link),
      attribute.target("_blank"),
    ],
    [
      html.img([
        attribute.src(icon),
        attribute.class("pfp"),
      ]),
    ],
  )
}

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

fn skills_item(href: String, title: String, desc: String) -> Element(msg) {
  html.li([attribute.class("skills-item skills-list-exp")], [
    html.a(
      [
        attribute.href(href),
        attribute.target("_blank"),
      ],
      [
        html.text(title),
      ],
    ),
    html.text(
      desc,
      // "An AI API Aggregator that aggregates and simplifies the APIs of various LLMs",
    ),
  ])
}

fn icon_skills_item(image_src: String, text: String, id: String) -> Element(msg) {
  html.li([attribute.class("skills-item"), attribute.id(id)], [
    html.img([
      attribute.src(image_src),
      attribute.class("skills-icon"),
    ]),
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
          html.text("Software developer & Entrepreneur"),
        ]),
        html.div([attribute.class("socials")], [
          social_icon(
            "https://github.com/unsecretised",
            "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
          ),
          social_icon(
            "mailto:umang+pf@umangsurana.com",
            "/priv/assets/gmail.png",
          ),
          social_icon("https://users.rust-lang.org/u/unsecretised/", "https://github.com/rust-lang/rust-artwork/blob/master/logo/rusty/rust-logo-512x512.png?raw=true"),
        ]),
      ]),
    ]),
    html.div([attribute.class("detailed-description")], [
      intro(),
      html.div([attribute.id("my-strengths")], [
        html.div([attribute.class("skills-div")], [
          html.h2([attribute.class("skills-title")], [html.text("My Skills")]),
          html.ul([attribute.class("skills-list")], [
            icon_skills_item(
              "https://rustacean.net/assets/rustacean-orig-noshadow.svg",
              "Rust",
              "rust",
            ),
            icon_skills_item(
              "/priv/assets/docker.svg",
              "Docker",
              "sql",
            ),
            icon_skills_item(
              "https://www.svgrepo.com/show/303206/javascript-logo.svg",
              "",
              "javascript",
            ),
            icon_skills_item(
              "https://logospng.org/download/typescript/typescript-512.png",
              "",
              "typescript",
            ),
            icon_skills_item(
              "https://go.dev/images/go-logo-white.svg",
              "",
              "golang",
            ),
            icon_skills_item(
              "/priv/assets/aws.svg",
              "",
              "rust",
            ),
            icon_skills_item(
              "https://ui.shadcn.com/favicon.ico",
              "ShadCN",
              "shadcn",
            ),
            icon_skills_item(
              "https://git-scm.com/images/logos/downloads/Git-Icon-Black.svg",
              "Git",
              "git",
            ),
            icon_skills_item(
              "/priv/assets/react.svg",
              "React",
              "golang",
            ),
            icon_skills_item("/priv/assets/psql.png", "SQL", "sql"),
            icon_skills_item(
              "https://nodejs.org/static/logos/jsIconWhite.svg",
              "Node",
              "nodejs",
            ),
            icon_skills_item(
              "https://www.python.org/static/img/python-logo-large.c36dccadd999.png?1646853871",
              "Python",
              "python",
            ),
            icon_skills_item(
              "https://gleam.run/images/lucy/lucy.svg",
              "Gleam",
              "gleam",
            ),
          ]),
        ]),
        html.div([attribute.class("skills-div experience")], [
          html.h2([attribute.class("skills-title")], [
            html.text("My Best Projects"),
          ]),
          html.ul([attribute.class("skills-list skills-list-exp")], [
            skills_item(
              "https://onellm.dev",
              "OneLLM",
              "An AI API Aggregator that aggregates and simplifies the APIs of various LLMs",
            ),
            skills_item(
              "https://rustcast.app",
              "RustCast",
              "A blazing fast, 100% free MacOS App Launcher and simple to use",
            ),
            skills_item(
              "https://akitavault.com/",
              "Akitavault",
              "The modern version of digital learning in classrooms",
            ),
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
     html.div([attribute.class("contact-content")], [
      html.h2([attribute.class("socials-header")], [html.text("My socials")]),
      html.div([attribute.class("contact-cards")], [
        contact_card(
          "mailto:umang+portfolio@umangsurana.com",
          "Email",
          "priv/assets/gmail.png",
        ),
        contact_card(
          "https://github.com/unsecretised/",
          "Github",
          "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
        ),
        contact_card(
          "https://users.rust-lang.org/u/unsecretised/",
          "Rust lang forum",
          "https://github.com/rust-lang/rust-artwork/blob/master/logo/rusty/rust-logo-512x512.png?raw=true",
        ),
        contact_card(
          "https://stackoverflow.com/users/23020882/unsecretised",
          "Stack overflow",
          "https://stackoverflow.com/Content/Sites/stackoverflow/Img/favicon.ico",
        )
      ]),
    ])
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
      social_icon(href, icon),
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
    description: "Built from scratch an open source, blazing fast app, reaching 550+ stars, 1.9k+ downloads, and multiple sponsors",
    image: "priv/assets/rustcast-poster.png",
    link: "https://rustcast.app",
  ),
  Project(
    title: "OneLLM",
    description: "CEO and Founder of OneLLM, which was an AI API Aggregator that aggregates and simplifies the APIs of various LLMs.",
    image: "/priv/assets/OneLLM-Horizontal-2.png",
    link: "https://onellm.dev",
  ),
  Project(
    title: "Secretised YouTube Channel",
    description: "Researched, edited, and posted videos on Cybersecurity and Rust",
    image: "priv/assets/ytlogo.png",
    link: "https://youtube.com/@secretised",
  ),
  Project(
    title: "Lion",
    description: "Built Lion, a CLI tool for unifying the commands for various package managers",
    image: "priv/assets/Lion-cli-icon.png",
    link: "https://github.com/unsecretised/lion?tab=readme-ov-file#lion",
  ),
  Project(
    title: "Docky",
    description: "Developed from scratch a customisable macos dock alternative.",
    image: "priv/assets/docky.png",
    link: "https://github.com/unsecretised/docky?tab=readme-ov-file#Docky",
  ),
  Project(
    title: "Oxid",
    description: "Authored Oxid, a login / signup app that works via the CLI. It uses production grade cryptography, and code from here was used in production.",
    image: "https://portfolio.umangsurana.com/media/Oxid-icon.png",
    link: "https://github.com/unsecretised/oxid?tab=readme-ov-file#oxid-is-an-account-manager-made-in-rust-",
  ),
]
