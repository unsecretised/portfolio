// IMPORTS ---------------------------------------------------------------------

import components
import gleam/uri.{type Uri}
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html

// Modem is a package providing effects and functionality for routing in SPAs.
// This means instead of links taking you to a new page and reloading everything,
// they are intercepted and your `update` function gets told about the new URL.
import modem

// MAIN ------------------------------------------------------------------------

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

// MODEL -----------------------------------------------------------------------

type Model {
  Model(route: Route)
}

/// In a real application, we'll likely want to show different views depending on
/// which URL we are on:
///
/// - /      - show the home page
/// - /posts - show a list of posts
/// - /about - show an about page
/// - ...
///
/// We could store the `Uri` or perhaps the path as a `String` in our model, but
/// this can be awkward to work with and error prone as our application grows.
///
/// Instead, we _parse_ the URL into a nice Gleam custom type with just the
/// variants we need! This lets us benefit from Gleam's pattern matching,
/// exhaustiveness checks, and LSP features, while also serving as documentation
/// for our app: if you can get to a page, it must be in this type!
///
type Route {
  Index
  Project
  Contact
  /// It's good practice to store whatever `Uri` we failed to match in case we
  /// want to log it or hint to the user that maybe they made a typo.
  NotFound(uri: Uri)
}

fn parse_route(uri: Uri) -> Route {
  case uri.path_segments(uri.path) {
    [] | [""] -> Index

    ["projects"] -> Project

    ["contact"] -> Contact

    _ -> NotFound(uri:)
  }
}

fn init(_) -> #(Model, Effect(Msg)) {
  // The server for a typical SPA will often serve the application to *any*
  // HTTP request, and let the app itself determine what to show. Modem stores
  // the first URL so we can parse it for the app's initial route.
  let route = case modem.initial_uri() {
    Ok(uri) -> parse_route(uri)
    Error(_) -> Index
  }

  let model = Model(route:)

  let effect =
    // We need to initialise modem in order for it to intercept links. To do that
    // we pass in a function that takes the `Uri` of the link that was clicked and
    // turns it into a `Msg`.
    modem.init(fn(uri) {
      uri
      |> parse_route
      |> UserNavigatedTo
    })

  #(model, effect)
}

// UPDATE ----------------------------------------------------------------------

type Msg {
  UserNavigatedTo(route: Route)
}

fn update(_model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    UserNavigatedTo(route:) -> #(Model(route:), effect.none())
  }
}

// VIEW ------------------------------------------------------------------------

// Default view for the app. This is where we render the header and the main
fn view(model: Model) -> Element(Msg) {
  html.div([], [
    components.nav(),
    html.main([], {
      // Just like we would show different HTML based on some other state in the
      // model, we can also pattern match on our Route value to show different
      // views based on the current page!
      case model.route {
        Index -> components.view_index()
        Project -> components.view_projects()
        Contact -> components.view_contact()
        NotFound(_) -> components.view_not_found()
      }
    }),
    html.footer([], [
      html.div([attribute.class("footer-links")], [
        html.a(
          [
            attribute.class("navbar-link"),
            attribute.href("https://github.com/unsecretised/portfolio"),
          ],
          [html.text("Source code")],
        ),
        html.text("Built with Gleam x Lustre - © 2025 Umang Surana"),
      ]),
    ]),
  ])
}
