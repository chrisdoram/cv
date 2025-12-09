#import "utils.typ": title-case

#let heading-font = "Libertinus Serif"
#let body-font = "Libertinus Serif"
#let font-size = 10pt
#let linespacing = 6pt
#let page-margin = 1.25cm

#let content = toml("content.toml")

#set page(
    paper: "a4",
    margin: page-margin,
)

#set text(
  lang: "en",
  font: body-font,
  size: font-size,
  hyphenate: false
)

#set list(
  spacing: linespacing,
)

#set par(
  leading: linespacing,
  justify: true
)

#show heading.where(
    level: 1,
): it => block(width: 100%)[
    #set text(font: heading-font, size: 1.5em, weight: "bold")
    #upper(it.body)
    #v(2pt)
]

#show heading.where(
  level: 2
): it => block(width: 100%)[
  #set align(left)
  #set text(font: heading-font, size: 1em, weight: "bold")
  #smallcaps(it.body)
  #v(-0.75em) #line(length: 100%, stroke: 1pt + black)  // solid line
]

#align(center)[
  = #content.legal-name
  #block(width: 100%)[
      *#content.current-title*
      #v(-4pt)
      #content.location.city, #content.location.country
      #v(-4pt)
      #set text(font: body-font, weight: "medium", size: font-size)
      #let contact = (
        box(link("mailto:" + content.contact.mail)),
        box(link("tel:" + content.contact.telephone)),
      )
      #for url in content.contact.social {
        contact.push(
          box(link(url)[#url.split("www.").at(1)])
        )
      }
      #pad(x: 0em)[
        #contact.join([#sym.space.en #sym.diamond.filled #sym.space.en])
      ]
  ]
]

#block[
  == Work Experience
  #for work in content.work {
    block(width: 100%, breakable: true)[
      *#link(work.url)[#work.name]* #h(1fr) *#work.location.join([#sym.space.en #sym.slash #sym.space.en])*
    ]
    block(width: 100%, breakable: true, above: 0.6em)[
      #text(style: "italic")[#work.role] #h(1fr) #work.start-date #sym.dash.en #work.end-date \
      #list(..work.highlights)
    ]
  }
]

#block[
  == Education
  #block(width: 100%, breakable: true)[
    *#link(content.education.url)[#content.education.institution]* #h(1fr) *#content.education.location.city, #content.education.location.country* \
    #text(style: "italic")[#content.education.study-type in #content.education.area] #h(1fr) #content.education.start-date #sym.dash.en #content.education.end-date \
    #for (highlight, description) in content.education.highlights.pairs() [
      - *#title-case(highlight)*: #if type(description) == array { description.join(", ") } else { description }.
    ]
  ]
]

#block[
  == References
  #block(width: 100%, breakable: true)[
    *#content.reference.name #sym.hyph #content.reference.company (#content.reference.role).* \
    #content.reference.description\.
  ]
]
