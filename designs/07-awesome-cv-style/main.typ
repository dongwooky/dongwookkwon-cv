// Design 07: Awesome-CV style (Typst port)
// Reproduces the distinctive Byungjin Park "Awesome-CV" LaTeX template that
// the original _CV__Dongwook_Kwon.pdf was built with: red split section
// titles, small-caps subtitles, right-aligned italic dates/locations.

#let awesome-red = rgb("#CC0000")
#let awesome-red-soft = rgb("#D03F3F")  // lighter red for dates/locations
#let ink = rgb("#222222")
#let muted = rgb("#666666")

#set page(
  paper: "us-letter",
  margin: (x: 0.55in, top: 0.5in, bottom: 0.5in),
  footer: align(center)[
    #set text(size: 8.5pt, fill: muted)
    Dongwook Kwon  ·  Curriculum Vitae  ·  #context counter(page).display()
  ],
)

#set text(font: "Inter", size: 9pt, fill: ink, weight: "regular")
#set par(leading: 0.5em, justify: false)
#set list(spacing: 0.3em, indent: 0pt, marker: text(fill: muted, weight: "bold")[•])

// "Exp**erience**" style — first 3 letters dark, rest in red+bold (matches
// original Awesome-CV "highlighted" effect)
#let section(title) = {
  let head = title.slice(0, 3)
  let tail = if title.len() > 3 { title.slice(3) } else { "" }
  v(0.75em)
  block[
    #text(size: 16pt, weight: "bold")[
      #text(fill: awesome-red)[#head]#text(fill: ink)[#tail]
    ]
    #v(-0.15em)
    #line(length: 100%, stroke: 0.5pt + ink)
  ]
  v(0.15em)
}

// Entry: organization (bold, left) + location (italic red, right);
// subtitle in small caps (left) + date (italic red, right).
#let entry(org, location, subtitle, date) = {
  block(spacing: 0.4em)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 0.5em,
      row-gutter: 0.15em,
      text(weight: "bold", size: 10.5pt)[#org],
      text(style: "italic", fill: awesome-red-soft, size: 9.5pt)[#location],
      text(size: 8.8pt, tracking: 0.5pt)[#smallcaps(subtitle)],
      text(style: "italic", fill: awesome-red-soft, size: 9.5pt)[#date],
    )
  ]
}

// === HEADER ===
#align(center)[
  #text(size: 32pt, weight: "thin", tracking: 0.5pt)[Dongwook ]
  #text(size: 32pt, weight: "bold", tracking: 0.5pt)[Kwon]

  #v(-0.1em)
  #text(size: 9pt, style: "italic", fill: muted)[
    Room 701, Saebit Hall, 20 Gwangun-ro, Nowon-gu, Seoul 01897, Republic of Korea
  ]

  #v(0.15em)
  #text(size: 8.8pt)[
    +82 10-6612-9246
    #h(0.4em)|#h(0.4em)
    #link("mailto:tomiyadragon@gmail.com")[tomiyadragon\@gmail.com]
    #h(0.4em)|#h(0.4em)
    #link("https://dongwooky.github.io")[dongwooky.github.io]
    #h(0.4em)|#h(0.4em)
    #link("https://github.com/dongwooky")[github/dongwooky]
    #h(0.4em)|#h(0.4em)
    #link("https://linkedin.com/in/dongwooky")[in/dongwooky]
  ]
]

#v(0.2em)

#section("Experience")

#entry(
  "Suresoft Technologies",
  "Seongnam, Gyeonggi, Korea",
  "AI Engineer, Intelligent Agent Technology Team",
  "Dec. 2025 – Present",
)
- Developing an AI validation system utilizing AI agent–based architectures.
- Designing and implementing systems to verify and evaluate AI models through autonomous and collaborative AI agents.
- Building agentic AI systems to enable systematic, scalable, and reliable AI verification processes.

#v(0.2em)
#entry(
  "Bio-Computing and Machine Learning Laboratory, Kwangwoon University",
  "Seoul, Korea",
  "Research Assistant",
  "Aug. 2021 – Dec. 2025",
)
- Conducted research on deep learning algorithms, focusing on anomaly detection in time-series data, including Electrocardiogram (ECG) and Cyber-Physical Systems (CPS).
- Participated in the development of an Active Kill-Switch and Biomarker-Based Defense System for life-threatening IoT medical devices.

#v(0.2em)
#entry(
  "LG Electronics Canada",
  "Toronto, ON, Canada",
  "Research Project",
  "Jan. 2025 – Jul. 2025",
)
- Participating in the development of an assessment framework for agentic AI systems utilizing LLMs to evaluate performance.

#v(0.2em)
#entry(
  "Qualcomm Institute, University of California San Diego",
  "San Diego, CA, USA",
  "AI Development Project, Summer Program",
  "Jul. 2022 – Aug. 2022",
)
- Participated in the Personality-Based Drug Addiction Prediction System project.
- Attended seminars on deep learning and machine learning algorithms.

#section("Education")

#entry(
  "Kwangwoon University",
  "Seoul, Korea",
  "Master of Science in Computer Engineering",
  "Mar. 2024 – Feb. 2026",
)
- GPA: 4.33/4.5 (Percentage: 98.1%)

#v(0.2em)
#entry(
  "University of Toronto",
  "Toronto, ON, Canada",
  "Graduate Research Program in Mechanical and Industrial Engineering",
  "Jan. 2025 – Jul. 2025",
)
- GPA: 3.68/4.0

#v(0.2em)
#entry(
  "Kwangwoon University",
  "Seoul, Korea",
  "Bachelor of Science in Electronics and Communications Engineering",
  "Mar. 2019 – Feb. 2024",
)
- GPA: 3.41/4.5 (Percentage: 88.1%)

#section("Honors & Awards")

#text(size: 9pt, tracking: 0.5pt)[#smallcaps("Major Awards")]
#v(-0.3em)
#grid(
  columns: (auto, 1fr, auto),
  column-gutter: 0.8em,
  row-gutter: 0.25em,
  text(style: "italic", fill: awesome-red-soft)[Aug. 2022], [*Achievement Award*, Qualcomm Institute AI Development Project — UC San Diego], text(style: "italic", fill: awesome-red-soft)[United States],
  text(style: "italic", fill: awesome-red-soft)[Dec. 2021], [*Gold Award (Ministerial Award)*, 2021 Smart Maritime Logistics Project – Minister of Oceans and Fisheries], text(style: "italic", fill: awesome-red-soft)[South Korea],
)

#v(0.4em)
#text(size: 9pt, tracking: 0.5pt)[#smallcaps("Academic Recognition")]
#v(-0.3em)
#grid(
  columns: (auto, 1fr, auto),
  column-gutter: 0.8em,
  row-gutter: 0.25em,
  text(style: "italic", fill: awesome-red-soft)[Nov. 2025], [*Outstanding Student Paper Award*, Conference of the Institute of Electronics and Information Engineers], text(style: "italic", fill: awesome-red-soft)[South Korea],
  text(style: "italic", fill: awesome-red-soft)[Nov. 2024], [*Best Poster Award (Silver)*, 10th International Biomedical Engineering Conference (IBEC 2024)], text(style: "italic", fill: awesome-red-soft)[South Korea],
  text(style: "italic", fill: awesome-red-soft)[Nov. 2023], [*Outstanding Paper Award*, Conference of the Korean Society of Medical and Biological Engineering], text(style: "italic", fill: awesome-red-soft)[South Korea],
)

#v(0.4em)
#text(size: 9pt, tracking: 0.5pt)[#smallcaps("Competitions")]
#v(-0.3em)
#grid(
  columns: (auto, 1fr, auto),
  column-gutter: 0.8em,
  row-gutter: 0.25em,
  text(style: "italic", fill: awesome-red-soft)[Dec. 2025], [*Silver Award*, 23rd Embedded Software Competition (KIISE)], text(style: "italic", fill: awesome-red-soft)[South Korea],
  text(style: "italic", fill: awesome-red-soft)[Dec. 2022], [*Bronze Award*, Hanium ICT Mentoring Competition – FKII], text(style: "italic", fill: awesome-red-soft)[South Korea],
  text(style: "italic", fill: awesome-red-soft)[Sep. 2022], [*Excellence Award*, 18th Kwangwoon ICT Exhibition (KWIX) — Kwangwoon University], text(style: "italic", fill: awesome-red-soft)[South Korea],
  text(style: "italic", fill: awesome-red-soft)[Oct. 2021], [*Grand Prize*, MY (Multi-Y) Capstone Design Competition — Kwangwoon University], text(style: "italic", fill: awesome-red-soft)[South Korea],
)

#section("Projects")

#entry(
  "Agentic AI Evaluation Framework",
  "Toronto, ON, Canada",
  "LG Electronics Canada",
  "Jan. 2025 – Present",
)
- Developed an evaluation framework for agentic AI systems using LLMs to assess performance.

#v(0.2em)
#entry(
  "AI-based Intrusion Detection and Attack Packet Crafting Technologies for APR1400",
  "Seoul, Korea",
  "Sejong University",
  "Jul. 2022 – Present",
)
- Developed an AI defense system to protect nuclear power plants from cyber attacks.

#v(0.2em)
#entry(
  "Quadruped Robot Using Vision SLAM with a Depth Camera",
  "Seoul, Korea",
  "Ministry of Science and ICT",
  "Apr. 2022 – Nov. 2022",
)
- Developed an autonomous quadruped robot using a navigation algorithm with SLAM and a depth camera.

#v(0.2em)
#entry(
  "Active Kill-Switch and Biomarker-Based Defense for Life-Threatening IoT Medical Devices",
  "Seoul, Korea",
  "Kookmin University",
  "Sep. 2021 – Dec. 2022",
)
- Developed a security system for heart implant devices using an anomaly detection algorithm.

#v(0.2em)
#entry(
  "Development of a Smart Logistics System Using Computer Vision",
  "Seoul, Korea",
  "Ministry of Oceans and Fisheries",
  "Apr. 2021 – Nov. 2021",
)
- Developed a logistics detection system incorporating location tracking and stack layer identification for containers.

#section("Publications")

#text(size: 9pt, weight: "bold")[Journal Articles]
- Y. Nam, J. Lee, H. Lee, *D. Kwon*, M. Yeo, S. Kim, R. Sohn, and C. Park, "Designing a remote photoplethysmography-based heart rate estimation algorithm during a treadmill exercise," _Electronics_, vol. 14, no. 5, p. 890, 2025.
- *D. Kwon*, Y. Kang, J. Lee, Y. Nam, J. Won, K. K. Kim, D. D. Kim, and C. Park, "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments," under review at _Data Mining and Knowledge Discovery_ (Springer Nature), 2025.

#v(0.3em)
#text(size: 9pt, weight: "bold")[Conference Papers]
- R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], and N. Verma, "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades," in _Proc. 64th Annu. Meeting Assoc. Comput. Linguistics (ACL) – Industry Track (Poster)_, 2026. #super[†]Equal contribution
- J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, and N. Verma, "GEMMAS: Graph-based Evaluation Metrics for Multi Agent Systems," in _Proceedings of the EMNLP 2025 Industry Track (Oral)_, 2025. #super[†]Equal contribution
- *D. Kwon*, M. Kim, Y. Kang, J. Lee, and C. Park, "Hybrid neural network model for anomaly detection in implantable devices using graph attention networks and transformers," in _Proc. 10th Int. Biomed. Eng. Conf. (IBEC)_, 2024. — *Best Poster Award – Silver Winner*
- *D. Kwon*, Y. Kang, and C. Park, "Enhancing medical device security with GNN-GRU anomaly detection model," in _Proc. 62nd KOSOMBE Autumn Conf._, pp. 204–205, 2023. — *Outstanding Paper Award*

#section("Patents")

- *Issued Patent*, "Method for Implantable Medical Device to Detect Anomaly in Real Time," Patent No. KR 10-2961984, Issued on April 30, 2026.
- *Issued Patent*, "GPT API-Based Network Anomaly Detection," Patent No. KR 10-2848814, Issued on August 18, 2025.

#section("Leadership Experience")

- *President*, Kwangwoon International Student Association — Lead intercultural programs and student engagement initiatives.
- *Director of Filming and Editing*, Kwangwoon Broadcasting Center (KWBC) — Oversaw media production and content delivery.
- *Class Representative*, Dept. of Electronics and Communications Engineering — Represented student interests in academic affairs.
- *Executive Member*, Amateur Radio Club — Organized radio workshops and technical exhibitions.
