import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn nav() {
  html.div([], [
    html.nav([attribute.id("navbar")], [
      html.a([attribute.href("/")], [
        html.img([attribute.src("/assets/pfp.jpg"), attribute.class("pfp")]),
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
      html.img([attribute.src("/assets/pfp.jpg"), attribute.class("me-image")]),
      html.div([attribute.class("micro-description")], [
        html.h1([attribute.class("home-title")], [
          html.text("Umang Surana"),
        ]),
        html.p([attribute.class("home-description")], [
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
              attribute.href("mailto:no1umang@gmail.com"),
              attribute.target("_blank"),
            ],
            [
              html.img([
                attribute.src("assets/gmail.png"),
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
        html.text(
          "Hi! I'm Umang Surana, a software developer from Singapore. I'm currently studying Applied AI and Analytics at Nanyang Polytechnic, Singapore.",
        ),
      ]),
      html.div([attribute.id("my-strengths")], [
        html.div([attribute.class("skills-div")], [
          html.h2([attribute.class("skills-title")], [html.text("My Skills")]),
          html.ul([attribute.class("skills-list")], [
            html.li([attribute.class("skills-item")], [html.text("Rust")]),
            html.li([attribute.class("skills-item")], [html.text("Golang")]),
            html.li([attribute.class("skills-item")], [html.text("Gleam")]),
            html.li([attribute.class("skills-item")], [html.text("JavaScript")]),
            html.li([attribute.class("skills-item")], [html.text("NodeJS")]),
            html.li([attribute.class("skills-item")], [html.text("Python")]),
            html.li([attribute.class("skills-item")], [html.text("SQL")]),
            html.li([attribute.class("skills-item")], [html.text("HTML")]),
            html.li([attribute.class("skills-item")], [html.text("CSS")]),
            html.li([attribute.class("skills-item")], [html.text("React")]),
          ]),
        ]),
        html.div([attribute.class("skills-div")], [
          html.h2([attribute.class("skills-title")], [
            html.text("My Experience"),
          ]),
          html.ul([attribute.class("skills-list skills-list-exp")], [
            html.li([attribute.class("skills-item")], [
              html.text("2021 - 2024: Hai Sing Catholic School"),
            ]),
            html.li([attribute.class("skills-item skills-list-exp")], [
              html.text("2021 - 2024: Vex Robotics in Robotics CCA"),
            ]),
            html.li([attribute.class("skills-item skills-list-exp")], [
              html.text(
                "2025: Took part in NYP's Startup Accelerator, called Jumpstart Programme",
              ),
            ]),
            html.li([attribute.class("skills-item skills-list-exp")], [
              html.text(
                "2025 - 2028: Nanyang Polytechnic (NYP) Applied AI and Analytics",
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
          "mailto:no1umang@gmail.com",
          "no1umang@gmail.com",
          "assets/gmail.png",
        ),
        contact_card(
          "https://github.com/unsecretised/",
          "@unsecretised",
          "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png",
        ),
        contact_card(
          "https://discord.com/",
          "@secretised",
          "https://img.icons8.com/?size=96&id=M725CLW4L7wE&format=png",
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
    title: "OneLLM",
    description: "OneLLM was a AI API Aggregator that aggregates and simplifies the APIs of various LLMs.",
    image: "assets/OneLLM-Horizontal-2.png",
    link: "https://github.com/OneLLM-Dev/OneLLM",
  ),
  Project(
    title: "Lion",
    description: "Lion is a CLI tool for unifying the commands for various package managers",
    image: "assets/Lion-cli-icon.png",
    link: "https://github.com/unsecretised/lion",
  ),
  Project(
    title: "Docky",
    description: "A Customisable macos dock alternative.",
    image: "assets/docky.png",
    link: "https://github.com/unsecretised/docky",
  ),
  Project(
    title: "Oreon Project",
    description: "Oreon Project is dedicated to making Enterprise Linux more suitable for desktops and laptops, providing the best user experience right out of the gate.",
    image: "https://oreonproject.org/public/images/oreonlogo.png",
    link: "https://github.com/oreonproject/",
  ),
]
