// Resume template function that can be used as a show everything rule

#let title-case(string) = {
  return string.replace(
    regex("[A-Za-z]+('[A-Za-z]+)?"),
    word => upper(word.text.first()) + lower(word.text.slice(1)),
  )
}

#let template(
  ..args
) = [
  #let args = args.named()
  #set page(
    paper: "a4",
    margin: 1.25cm,
  )
  #set text(
    lang: "en",
    font: "Libertinus Serif",
    size: 10pt,
    hyphenate: false
  )
  #set list(
    spacing: 6pt,
  )
  #set par(
    leading: 6pt,
    justify: true
  )

  #show title: set text(fill: blue, size: 1.25em)
  #show title: set align(center)
  #show title: set block(below: 0.6em)

  #show heading.where(level: 1): it => [
    #set align(left)
    #set text(fill: blue, size: 0.9em)
    #smallcaps(it.body)
    #v(-0.75em)
    #line(length: 100%, stroke: 1pt + black)
  ]

  #upper(title())
  #align(center)[
    *#args.current-title* \
    #args.location.city, #args.location.country \
    #let contact = (
      link("mailto:" + args.contact.email),
    )
    #for url in args.contact.social {
      contact.push(
        link(url)[#url.split("www.").at(1)]
      )
    }
    #contact.join([#sym.space.en #sym.diamond.filled #sym.space.en])
  ]

  = Work Experience
  #for work in args.work [
    #for role in work.roles [
      *#link(work.url)[#work.name]* | #text(style: "italic")[#role.title] #h(1fr) #role.start-date #sym.dash.en #role.end-date \
      #v(1pt)
      #list(..role.highlights)
      #v(0.25em)
    ]
  ]

  = Education
  *#link(args.education.url)[#args.education.institution]* #h(1fr) *#args.education.location.city, #args.education.location.country* \
  #text(style: "italic")[#args.education.study-type in #args.education.area] #h(1fr) #args.education.start-date #sym.dash.en #args.education.end-date \
  #for (highlight, description) in args.education.details.pairs() [
    - *#title-case(highlight)*: #description.
  ]
]
