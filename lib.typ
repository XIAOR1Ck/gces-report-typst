#import "frontpage.typ": front-page
#import "coverpage.typ": cover-page
#import "Approval.typ": approval-certificate
#import "style.typ": style

#show: doc => style(doc)

#let set-style(doc) = {
 return (
  style(doc)
)
}

#let generate-report(
  document-type: "Report",
  project-type: "Major",
  title: "BitMaatDaan",
  students : ("Anim Malla", "Saksham Shrestha", "Suresh Acharya"),
  logo: image("/assets/gces-logo.png", width: 30%),
  date: datetime.today(),
  project-head: "Santosh Panth",
  supervisor: "Ranjan Adhikari",
  front-matter: (:)
) = {

  cover-page(
    document-type: document-type,
    project-type: project-type,
    title: title,
    students: students,
    logo: logo,
    date: date
  )

  front-page(
    document-type: document-type,
    project-type: project-type,
    title: title,
    students: students,
    logo: logo,
    date: date,
    supervisor: supervisor
  )

  set page(numbering: "i") 
  approval-certificate(
  title: title,
  students: students,
  supervisor: supervisor,
  project-head: project-head,
  date: date
  )


  outline(title: "Table Of Contents")
  pagebreak()
  outline(title: "List Of tables", target: figure.where(kind: table))
  pagebreak()
  outline(title: "List Of Figures", target: figure.where(kind: image))
  pagebreak()

  counter(heading).update(0)
  counter(page).update(1)
}


