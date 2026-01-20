#import "/layouts/frontpage.typ": front-page
#import "/layouts/coverpage.typ": cover-page
#import "Approval.typ": approval-certificate
#import "/layouts/style.typ": style

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
  students : ("Student 1", "Student 2", "Student 3"),
  logo: image("/assets/gces-logo.png", width: 30%),
  date: datetime.today(),
  project-head: "Project Head name",
  supervisor: "Supervisor name",
  front-matter: (:)
) = {
  set page(numbering: none)
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
  // Start Page numbering From Start
  counter(page).update(1)
  //Set page numbering style to i,ii...
  set page(numbering: "i") 
  approval-certificate(
  title: title,
  students: students,
  supervisor: supervisor,
  project-head: project-head,
  date: date
  )
  
  // Iterate over front matters like Acknowledgement, Abstract. etc
  for items in front-matter{
    items
}

  //No Page Numbers For Table of contents, list of figures and tables
  set page(numbering: none)


  outline(title: "Table Of Contents")
  pagebreak()
  outline(title: "List Of tables", target: figure.where(kind: table))
  pagebreak()
  outline(title: "List Of Figures", target: figure.where(kind: image))
  pagebreak()

  //Heading Counter resets for the rest of the documents
  counter(heading).update(0)
  // Page Counter resets to 1 for rest of the document
  counter(page).update(1)
}


