
#import "lib.typ": generate-report, set-style

#show: doc => set-style(doc)

#generate-report(
  info : (front-matter:(
  "Abstract.typ",
  "ack.typ"
))
)

//#set page(numbering: "1")
= CHAPTER 1
== SubHeading 1
#lorem(100)
=== SubSub Heading

= CHAPTER 2
#lorem(20)

#lorem(20)

== Figure Check
#figure(
  caption: "Gces Logo",
  image("assets/gces-logo.png", height: 10%),
  kind: image
)

#figure(
  table[][A & B \\ 1 & 2],
  caption: "Example table",
  kind: table
  
)
#figure(
  table[][A & B \\ 1 & 2],
  caption: "Example table",
  kind: table
  
)

== Another Heading
#figure(
  table[][A & B \\ 1 & 2],
  caption: "Example table",
  kind: table
  
)
