// Design 03: Modern One-Pager (revised)
// Single column, Inter, refined teal accent. Polished hierarchy.

#let ink = rgb("#0f172a")     // slate-900
#let muted = rgb("#64748b")   // slate-500
#let faint = rgb("#cbd5e1")   // slate-300
#let accent = rgb("#0d9488")  // teal-600

#set page(
  paper: "us-letter",
  margin: (x: 0.6in, top: 0.5in, bottom: 0.5in),
)

#set text(font: "Inter", size: 9.2pt, fill: ink)
#set par(leading: 0.55em, justify: false)
#set list(spacing: 0.4em, indent: 0.7em, marker: text(fill: muted)[•])

// Section heading: tracked small caps with subtle hairline
#show heading.where(level: 1): it => {
  v(0.7em)
  block[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      align: horizon,
      text(size: 8.5pt, weight: "semibold", tracking: 2.5pt, fill: ink)[#upper(it.body)],
      line(length: 100%, stroke: 0.4pt + faint),
    )
  ]
  v(0.15em)
}

#show link: it => text(fill: accent, it)

// === HEADER ===
#block[
  #text(size: 28pt, weight: "bold", tracking: -0.7pt)[Dongwook Kwon]

  #v(-0.4em)
  #text(size: 10.5pt, fill: accent, weight: "medium")[AI Engineer · Intelligent Agent Technology]

  #v(0.15em)
  #text(size: 9pt, fill: muted)[
    Seoul, Korea
    #h(0.4em)·#h(0.4em)
    +82 10-6612-9246
    #h(0.4em)·#h(0.4em)
    #link("mailto:tomiyadragon@gmail.com")[tomiyadragon\@gmail.com]
    #h(0.4em)·#h(0.4em)
    #link("https://dongwooky.github.io")[dongwooky.github.io]
    #h(0.4em)·#h(0.4em)
    #link("https://github.com/dongwooky")[github.com/dongwooky]
  ]
]

= Experience

#grid(columns: (1fr, auto), gutter: 0.2em,
  [*Suresoft Technologies* — AI Engineer, Intelligent Agent Technology Team],
  text(fill: muted)[Dec 2025 – Present],
)
#text(fill: muted, style: "italic", size: 8.8pt)[Seongnam, Korea]
- Developing an AI validation system based on collaborative AI-agent architectures.
- Designing autonomous and collaborative AI agents to verify and evaluate AI models.
- Building agentic AI for systematic, scalable, reliable AI verification.

#v(0.3em)
#grid(columns: (1fr, auto), gutter: 0.2em,
  [*Bio-Computing & Machine Learning Lab, Kwangwoon University* — Research Assistant],
  text(fill: muted)[Aug 2021 – Dec 2025],
)
#text(fill: muted, style: "italic", size: 8.8pt)[Seoul, Korea]
- Researched deep learning for anomaly detection in time-series data (ECG, Cyber-Physical Systems).
- Co-developed an Active Kill-Switch & Biomarker-Based Defense System for life-threatening IoT medical devices.

#v(0.3em)
#grid(columns: (1fr, auto), gutter: 0.2em,
  [*LG Electronics Canada* — Research Project (with U of Toronto)],
  text(fill: muted)[Jan 2025 – Jul 2025],
)
#text(fill: muted, style: "italic", size: 8.8pt)[Toronto, Canada]
- Built an LLM-driven assessment framework for evaluating agentic AI system performance.

#v(0.3em)
#grid(columns: (1fr, auto), gutter: 0.2em,
  [*Qualcomm Institute, UC San Diego* — AI Development Project (Summer Program)],
  text(fill: muted)[Jul 2022 – Aug 2022],
)
#text(fill: muted, style: "italic", size: 8.8pt)[San Diego, USA]
- Personality-based drug-addiction prediction system using ML; deep-learning seminars.

= Education

#grid(columns: (1fr, auto), gutter: 0.2em,
  [*M.S. Computer Engineering*, Kwangwoon University — GPA 4.33/4.5 (98.1%)],
  text(fill: muted)[Mar 2024 – Feb 2026],
)
#grid(columns: (1fr, auto), gutter: 0.2em,
  [*Graduate Research Program*, University of Toronto — MIE, GPA 3.68/4.0],
  text(fill: muted)[Jan 2025 – Jul 2025],
)
#grid(columns: (1fr, auto), gutter: 0.2em,
  [*B.S. Electronics & Communications Engineering*, Kwangwoon University — GPA 3.41/4.5],
  text(fill: muted)[Mar 2019 – Feb 2024],
)

= Selected Publications

- R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], N. Verma. "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades." _ACL 2026 — Industry Track (Poster)_. #text(fill: muted, size: 8pt)[#super[†]Equal contribution]
- J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, N. Verma. "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems." _EMNLP 2025 Industry Track (Oral)_.
- *D. Kwon*, Y. Kang, et al. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments." Under review at _Data Mining and Knowledge Discovery_, 2025.
- *D. Kwon* et al. "Hybrid neural network with GAT + Transformer for implantable-device anomaly detection." _IBEC 2024_ — *Best Poster Award, Silver*.

= Patents

- *KR 10-2961984* — Method for Implantable Medical Device to Detect Anomaly in Real Time #h(1fr) #text(fill: muted, size: 8.5pt)[issued Apr 2026]
- *KR 10-2848814* — GPT API-Based Network Anomaly Detection #h(1fr) #text(fill: muted, size: 8.5pt)[issued Aug 2025]

= Honors

- *Silver Award*, 23rd Embedded Software Competition (KIISE), 2025
- *Outstanding Student Paper*, IEIE Conference, 2025
- *Achievement Award*, Qualcomm Institute AI Development Project — UC San Diego, 2022
- *Gold Award (Ministerial)*, Smart Maritime Logistics Project — Minister of Oceans & Fisheries, 2021
