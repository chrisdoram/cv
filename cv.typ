#import "template.typ": template

#set document(title: [Stanley Renner])

#show: template.with(
  current-title: "Senior Software Engineer",
  location: (
    city: "London",
    country: "United Kingdom"
  ),
  contact: (
    email: "redacted@gmail.com",
    social: (
      "https://www.github.com/githubprofile",
      "https://www.linkedin.com/in/myawesomelinkedin"
    ),
  ),
  work: (
    (
      name: "Some Company UK Ltd",
      url: "https://www.some-company-uk-ltd.com/",
      location: ("Remote", "Madrid"),
      roles: (
        (
          title: "Senior Software Engineer",
          start-date: "Sep 2025",
          end-date: "Present",
          highlights: (
            lorem(30),
            lorem(20)
          ),
        ),
        (
          title: "Software Engineer",
          start-date: "May 2023",
          end-date: "Sep 2025",
          highlights: (
            lorem(30),
            lorem(20)
          ),
        )
      )
    ),
    (
      name: "Industry Capital Ltd",
      url: "https://www.industry-capital.com/",
      location: ("Remote", "London"),
      roles: (
        (
          title: "Associate Software Engineer",
          description: "Graduate rotation scheme for 2 years.",
          start-date: "Apr 2021",
          end-date: "May 2023",
          highlights: (
          ),
        ),
      )
    ),
    (
      name: "Social Kangaroo Group Ltd",
      url: "https://www.social-kangaroo-group.com/",
      location: ("Remote", "Milan"),
      roles: (
        (
          title: "Consultant Engineer",
          start-date: "Sep 2020",
          end-date: "May 2023",
          highlights: (
            lorem(10),
          ),
        ),
      )
    )
  ),
  education: (
    institution: "The University of Paris",
    url: "https://www.paris.ac.uk/",
    area: "Computer Science",
    study-type: "Master of Science",
    start-date: "Sep 2016",
    end-date: "Jul 2020",
    location: (
      city: "Paris",
      country: "France"
    ),
    details: (
      honors: "Msc (Hons) Computer Science (First class)",
      thesis: lorem(10),
      awards: lorem(12),
    )
  )
)
