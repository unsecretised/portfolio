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
  ]
}

pub fn view_projects() -> List(Element(msg)) {
  [
    html.div([attribute.id("projects")], list.map(projects, project_card)),
  ]
}

pub fn view_contact() -> List(Element(msg)) {
  []
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
        [attribute.href(project.link), attribute.class("project-card-link")],
        [
          html.text("Read more"),
        ],
      ),
    ]),
  ])
}

const projects = [
]
