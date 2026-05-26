// Design 02: Compact (revised — typography-driven, no garish color)
// 1-page dense engineering CV. Inspired by Stripe/Linear-style typography.

#let ink = rgb("#0f172a")     // near-black
#let muted = rgb("#64748b")   // slate-500
#let faint = rgb("#94a3b8")   // slate-400
#let accent = rgb("#0f766e")  // teal-700, used only as a hairline cue

#set page(
  paper: "us-letter",
  margin: (x: 0.55in, top: 0.55in, bottom: 0.55in),
)

#set text(font: "Inter", size: 9pt, fill: ink, weight: "regular")
#set par(leading: 0.55em, justify: false)
#set list(spacing: 0.4em, indent: 0.7em, marker: text(fill: faint)[•])

// Section heading: small caps, tracked, with hairline rule
#let section(title) = {
  v(0.7em)
  block[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      align: horizon,
      text(size: 8.5pt, weight: "semibold", tracking: 2.5pt)[#upper(title)],
      line(length: 100%, stroke: 0.4pt + faint),
    )
  ]
  v(0.15em)
}

// Subsection: org bold, role italic muted, date/loc right-aligned
#let entry(org, role, date, location) = {
  block(spacing: 0.5em)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 0.8em,
      row-gutter: 0.15em,
      text(weight: "semibold")[#org],
      text(fill: muted, size: 8.5pt)[#date],
      text(fill: muted, style: "italic")[#role],
      text(fill: muted, size: 8.5pt, style: "italic")[#location],
    )
  ]
}

// === HEADER ===
#block[
  #text(size: 24pt, weight: "bold", tracking: -0.5pt)[Dongwook Kwon]
  #h(0.6em)
  #text(size: 11pt, fill: muted)[— AI Engineer]

  #v(0.2em)
  #text(size: 8.8pt, fill: muted)[
    Seoul, Korea
    #h(0.4em) · #h(0.4em)
    +82 10-6612-9246
    #h(0.4em) · #h(0.4em)
    #link("mailto:tomiyadragon@gmail.com")[tomiyadragon\@gmail.com]
    #h(0.4em) · #h(0.4em)
    #link("https://dongwooky.github.io")[dongwooky.github.io]
    #h(0.4em) · #h(0.4em)
    #link("https://github.com/dongwooky")[github.com/dongwooky]
    #h(0.4em) · #h(0.4em)
    linkedin.com/in/dongwooky
  ]
]

#v(0.1em)

// === TWO COLUMN BODY ===
#grid(
  columns: (0.85fr, 2.0fr),
  column-gutter: 1.6em,

  // ===== LEFT COLUMN (slim) =====
  [
    #section("Education")

    *Kwangwoon University* \
    #text(fill: muted, size: 8.5pt)[M.S. Computer Engineering] \
    #text(fill: muted, size: 8.5pt)[2024 – 2026  ·  *4.33/4.5*]

    #v(0.5em)
    *University of Toronto* \
    #text(fill: muted, size: 8.5pt)[Grad. Research, MIE] \
    #text(fill: muted, size: 8.5pt)[Jan – Jul 2025  ·  *3.68/4.0*]

    #v(0.5em)
    *Kwangwoon University* \
    #text(fill: muted, size: 8.5pt)[B.S. Electronics & Comm. Eng.] \
    #text(fill: muted, size: 8.5pt)[2019 – 2024  ·  *3.41/4.5*]

    #section("Skills")
    #text(fill: muted, size: 8.5pt, weight: "semibold")[LANGUAGES] \
    Python · C/C++ · MATLAB · Bash

    #v(0.4em)
    #text(fill: muted, size: 8.5pt, weight: "semibold")[AI / ML] \
    PyTorch · TensorFlow \
    LangChain · Transformers \
    GNN · Time-series

    #v(0.4em)
    #text(fill: muted, size: 8.5pt, weight: "semibold")[INFRASTRUCTURE] \
    Linux · Docker · Git · CUDA

    #section("Awards")
    #set text(size: 8.5pt)
    #text(fill: muted)[2025] · *Silver*, KIISE Embedded SW Comp. \
    #v(0.15em)
    #text(fill: muted)[2025] · *Outstanding Student Paper*, IEIE \
    #v(0.15em)
    #text(fill: muted)[2024] · *Best Poster Silver*, IBEC \
    #v(0.15em)
    #text(fill: muted)[2023] · *Outstanding Paper*, KOSOMBE \
    #v(0.15em)
    #text(fill: muted)[2022] · *Achievement*, UC San Diego \
    #v(0.15em)
    #text(fill: muted)[2021] · *Gold (Ministerial)*, Smart Logistics \
    #v(0.15em)
    #text(fill: muted)[2021] · *Grand Prize*, MY Capstone

    #section("Languages")
    Korean — native \
    English — professional
  ],

  // ===== RIGHT COLUMN (wide) =====
  [
    #section("Experience")

    #entry(
      "Suresoft Technologies",
      "AI Engineer, Intelligent Agent Tech Team",
      "Dec 2025 – Present",
      "Seongnam, Korea",
    )
    - Developing an AI validation system based on collaborative AI-agent architectures.
    - Designing autonomous and cooperative AI agents that verify and evaluate AI models.
    - Building agentic AI for systematic, scalable, reliable AI verification.

    #entry(
      "Bio-Computing & Machine Learning Lab",
      "Research Assistant — Kwangwoon University",
      "Aug 2021 – Dec 2025",
      "Seoul, Korea",
    )
    - Deep-learning anomaly detection in time-series (ECG, cyber-physical systems).
    - Active Kill-Switch & Biomarker-Based Defense System for IoT medical devices.

    #entry(
      "LG Electronics Canada",
      "Research Project, with University of Toronto",
      "Jan – Jul 2025",
      "Toronto, Canada",
    )
    - LLM-driven evaluation framework for agentic AI systems.

    #entry(
      "Qualcomm Institute, UC San Diego",
      "AI Development Summer Program",
      "Jul – Aug 2022",
      "San Diego, USA",
    )
    - Personality-based drug-addiction prediction using machine learning.

    #section("Selected Publications")
    - R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], N. Verma.
      "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades."
      _ACL 2026 Industry Track (Poster)_.
    - J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, N. Verma.
      "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems."
      _EMNLP 2025 Industry Track (Oral)_.
    - *D. Kwon* et al.
      "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments."
      Under review at _Data Mining and Knowledge Discovery_, 2025.
    - *D. Kwon* et al.
      "Hybrid GAT + Transformer for implantable-device anomaly detection."
      _IBEC 2024_ — *Best Poster, Silver*.

    #section("Patents")
    - *KR 10-2961984* — Method for Implantable Medical Device to Detect Anomaly in Real Time #h(1fr) #text(fill: muted, size: 8.5pt)[Apr 2026]
    - *KR 10-2848814* — GPT API-Based Network Anomaly Detection #h(1fr) #text(fill: muted, size: 8.5pt)[Aug 2025]

    #section("Selected Projects")
    - *Agentic AI Evaluation Framework* — LG Electronics Canada (2025–). LLM-driven evaluation of agentic AI.
    - *AI Intrusion Detection for APR1400* — Sejong University (2022–). AI defense for nuclear plant networks.
    - *Quadruped Robot with Vision SLAM* — Ministry of Science & ICT (2022). Depth-camera autonomous navigation.
    - *Active Kill-Switch for IoT Medical Devices* — Kookmin University (2021–22). Anomaly-detection security for heart implants.
    - *Smart Logistics with Computer Vision* — Ministry of Oceans & Fisheries (2021). Container tracking & stack-layer ID.
  ],
)
