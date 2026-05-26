// Design 05: Minimal Typography (revised, Newsreader)
// Butterick-inspired: centered tracked small caps, generous margins, no rules.

#let ink = rgb("#1a1a1a")
#let muted = rgb("#666666")

#set page(
  paper: "us-letter",
  margin: (left: 1.4in, right: 1.4in, top: 0.95in, bottom: 0.95in),
)

#set text(font: "Newsreader", size: 10.5pt, lang: "en", fill: ink)
#set par(leading: 0.7em, justify: true, first-line-indent: 0em)

#let section(title) = {
  v(1.1em)
  align(center)[
    #text(size: 9.5pt, weight: "regular", tracking: 3pt, fill: muted)[
      #upper(title)
    ]
  ]
  v(0.3em)
}

#let entry(title, org-line, date, body) = {
  block(spacing: 0.8em)[
    #grid(columns: (1fr, auto), column-gutter: 1em,
      strong(title),
      text(style: "italic", fill: muted)[#date],
    )
    #v(-0.35em)
    #text(fill: muted)[#org-line]
    #if body != [] [
      #v(0.1em)
      #body
    ]
  ]
}

// === HEADER ===
#align(center)[
  #text(size: 26pt, weight: "regular", tracking: 0.5pt)[Dongwook Kwon]

  #v(-0.2em)
  #text(size: 10pt, style: "italic", fill: muted)[
    AI Engineer · Seoul, Republic of Korea
  ]

  #v(0.3em)
  #text(size: 9.5pt)[
    +82 10-6612-9246  ·  tomiyadragon\@gmail.com  ·  #link("https://dongwooky.github.io")[dongwooky.github.io]
  ]
]

#v(0.4em)
#align(center)[#line(length: 22%, stroke: 0.4pt + rgb("#999"))]
#v(0.2em)

#align(center)[
  #text(size: 10.5pt, style: "italic")[
    "Working at the intersection of agentic language models, \
     multi-agent verification, and time-series anomaly detection."
  ]
]

#section("Experience")

#entry(
  "AI Engineer · Intelligent Agent Technology Team",
  "Suresoft Technologies — Seongnam, Korea",
  "Dec 2025 – Present",
  [
    Developing an AI validation platform built on collaborative AI-agent
    architectures; designing autonomous agents that verify and evaluate AI
    models; building agentic systems for systematic, scalable, reliable AI
    verification.
  ],
)

#entry(
  "Research Assistant",
  "Bio-Computing & Machine Learning Lab, Kwangwoon University — Seoul",
  "Aug 2021 – Dec 2025",
  [
    Researched deep-learning algorithms for anomaly detection in time-series
    data (ECG, cyber-physical systems). Contributed to an Active Kill-Switch
    and Biomarker-Based Defense System for life-threatening IoT medical
    devices.
  ],
)

#entry(
  "Visiting Researcher",
  "LG Electronics Canada, with the University of Toronto — Toronto",
  "Jan – Jul 2025",
  [Developed an LLM-driven evaluation framework for agentic AI systems.],
)

#entry(
  "Summer Researcher",
  "Qualcomm Institute, UC San Diego — San Diego, USA",
  "Jul – Aug 2022",
  [Personality-based drug-addiction prediction system using machine learning.],
)

#section("Education")

#entry(
  "Master of Science, Computer Engineering",
  "Kwangwoon University, Seoul",
  "2024 – 2026",
  [GPA 4.33 / 4.50 (98.1%).],
)

#entry(
  "Graduate Research Program, Mechanical & Industrial Engineering",
  "University of Toronto",
  "Jan – Jul 2025",
  [GPA 3.68 / 4.00.],
)

#entry(
  "Bachelor of Science, Electronics & Communications Engineering",
  "Kwangwoon University, Seoul",
  "2019 – 2024",
  [GPA 3.41 / 4.50 (88.1%).],
)

#section("Publications")

#entry(
  [R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], N. Verma. "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades."],
  [_Proc. 64th ACL — Industry Track (Poster)_. #super[†]Equal contribution.],
  "2026",
  [],
)

#entry(
  [J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, N. Verma. "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems."],
  [_EMNLP 2025 Industry Track (Oral)_. #super[†]Equal contribution.],
  "2025",
  [],
)

#entry(
  [*D. Kwon*, Y. Kang, J. Lee, et al. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments."],
  [Under review at _Data Mining and Knowledge Discovery_ (Springer Nature).],
  "2025",
  [],
)

#entry(
  [Y. Nam, J. Lee, H. Lee, *D. Kwon*, et al. "Designing a remote photoplethysmography-based heart-rate estimation algorithm during a treadmill exercise."],
  [_Electronics_ 14(5), 890.],
  "2025",
  [],
)

#entry(
  [*D. Kwon*, M. Kim, Y. Kang, J. Lee, C. Park. "Hybrid neural network with GAT and transformers for implantable-device anomaly detection."],
  [_Proc. 10th IBEC_. — _Best Poster Award, Silver_.],
  "2024",
  [],
)

#entry(
  [*D. Kwon*, Y. Kang, C. Park. "Enhancing medical device security with a GNN-GRU anomaly-detection model."],
  [_Proc. 62nd KOSOMBE Autumn Conf._, 204–205. — _Outstanding Paper Award_.],
  "2023",
  [],
)

#section("Patents")

#entry(
  [KR 10-2961984 — "Method for Implantable Medical Device to Detect Anomaly in Real Time."],
  [Issued April 30.],
  "2026",
  [],
)

#entry(
  [KR 10-2848814 — "GPT API-Based Network Anomaly Detection."],
  [Issued August 18.],
  "2025",
  [],
)

#section("Selected Awards")

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.5em,
  emph("2025"), [*Silver Award*, 23rd Embedded Software Competition (KIISE).],
  emph("2025"), [*Outstanding Student Paper Award*, IEIE Conference.],
  emph("2024"), [*Best Poster Silver*, 10th International Biomedical Engineering Conference.],
  emph("2022"), [*Achievement Award*, Qualcomm Institute AI Project — UC San Diego.],
  emph("2021"), [*Gold Award (Ministerial)*, Smart Maritime Logistics — Min. of Oceans & Fisheries.],
  emph("2021"), [*Grand Prize*, MY Capstone Design Competition — Kwangwoon University.],
)

#section("Leadership")

- *President*, Kwangwoon International Student Association.
- *Director of Filming and Editing*, Kwangwoon Broadcasting Center (KWBC).
- *Class Representative*, Department of Electronics and Communications Engineering.
- *Executive Member*, Amateur Radio Club.
