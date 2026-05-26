// Design 09: Brilliant-CV style (Typst port)
// Inspired by yunanwg/brilliant-CV — distinctive header band, large initials
// avatar, indigo accent. Visual, modern, Asian/EU job-market friendly.

#let accent = rgb("#4F46E5")        // indigo-600
#let accent-light = rgb("#EEF2FF")  // indigo-50
#let ink = rgb("#111827")           // gray-900
#let muted = rgb("#6B7280")         // gray-500
#let faint = rgb("#E5E7EB")         // gray-200

#set page(
  paper: "us-letter",
  margin: 0pt,
  footer: align(center)[
    #set text(size: 8pt, fill: muted, font: "Inter")
    Dongwook Kwon  ·  Page #context counter(page).display()
  ],
)

#set text(font: "Inter", size: 9pt, fill: ink)
#set par(leading: 0.5em, justify: false)
#set list(spacing: 0.3em, indent: 0pt, marker: text(fill: accent, weight: "bold")[›])

// === HEADER BAND ===
#block(width: 100%, fill: accent-light, inset: (x: 0.55in, y: 0.32in))[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,

    // Initials avatar
    box(
      width: 0.85in,
      height: 0.85in,
      radius: 100%,
      fill: accent,
      align(center + horizon)[
        #text(size: 28pt, weight: "bold", fill: white)[DK]
      ],
    ),

    // Name + tagline + contact
    box(inset: (top: 0.05in))[
      #text(size: 24pt, weight: "bold", fill: ink, tracking: -0.5pt)[Dongwook Kwon]

      #v(-0.4em)
      #text(size: 11pt, fill: accent, weight: "semibold")[AI Engineer · Intelligent Agent Technology]

      #v(0.2em)
      #text(size: 8.8pt, fill: muted)[
        Seoul, Korea
        #h(0.5em)·#h(0.5em)
        +82 10-6612-9246
        #h(0.5em)·#h(0.5em)
        tomiyadragon\@gmail.com
        #h(0.5em)·#h(0.5em)
        dongwooky.github.io
      ]
      #v(-0.4em)
      #text(size: 8.8pt, fill: muted)[
        github.com/dongwooky
        #h(0.5em)·#h(0.5em)
        linkedin.com/in/dongwooky
      ]
    ],
  )
]

#v(0.1em)

// === BODY ===
#let section(title) = {
  v(0.5em)
  block[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,
      align: horizon,
      box(width: 6pt, height: 6pt, fill: accent, radius: 100%),
      text(size: 11pt, weight: "bold", fill: ink, tracking: 0.3pt)[#upper(title)],
    )
    #v(-0.3em)
    #line(length: 100%, stroke: 0.4pt + faint)
  ]
  v(0.05em)
}

#let entry(org, role, date, location) = {
  block(spacing: 0.45em)[
    #grid(
      columns: (1fr, auto), column-gutter: 0.8em, row-gutter: 0.15em,
      text(weight: "bold", fill: ink, size: 10.5pt)[#org],
      text(weight: "semibold", fill: accent, size: 9pt)[#date],
      text(style: "italic", fill: muted)[#role],
      text(fill: muted, size: 9pt)[#location],
    )
  ]
}

#block(inset: (x: 0.55in, y: 0pt))[

#section("Experience")

#entry(
  "Suresoft Technologies",
  "AI Engineer, Intelligent Agent Technology Team",
  "Dec 2025 – Present",
  "Seongnam, Korea",
)
- Developing an AI validation system based on collaborative AI-agent architectures.
- Designing autonomous and collaborative AI agents to verify and evaluate AI models.
- Building agentic AI for systematic, scalable, reliable AI verification.

#entry(
  "Bio-Computing & Machine Learning Lab, Kwangwoon University",
  "Research Assistant",
  "Aug 2021 – Dec 2025",
  "Seoul, Korea",
)
- Deep-learning anomaly detection in time-series data (ECG, cyber-physical systems).
- Co-developed Active Kill-Switch & Biomarker-Based Defense System for IoT medical devices.

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

#section("Education")

#grid(
  columns: (1fr, auto),
  row-gutter: 0.5em,
  column-gutter: 1em,
  [*M.S. Computer Engineering* — Kwangwoon University \
   #text(fill: muted, size: 9pt, style: "italic")[GPA 4.33 / 4.5 (98.1%)]],
  text(weight: "semibold", fill: accent, size: 9pt)[2024 – 2026],

  [*Graduate Research Program* — University of Toronto, MIE \
   #text(fill: muted, size: 9pt, style: "italic")[GPA 3.68 / 4.0]],
  text(weight: "semibold", fill: accent, size: 9pt)[Jan – Jul 2025],

  [*B.S. Electronics & Communications Eng.* — Kwangwoon University \
   #text(fill: muted, size: 9pt, style: "italic")[GPA 3.41 / 4.5 (88.1%)]],
  text(weight: "semibold", fill: accent, size: 9pt)[2019 – 2024],
)

#section("Selected Publications")

- R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], N. Verma. "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades." _ACL 2026 — Industry Track (Poster)_.
- J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, N. Verma. "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems." _EMNLP 2025 Industry Track (Oral)_.
- *D. Kwon* et al. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments." Under review at _DMKD_, 2025.
- *D. Kwon* et al. "Hybrid GAT + Transformer for implantable-device anomaly detection." _IBEC 2024_ — *Best Poster, Silver.*

#section("Patents")

- *KR 10-2961984* — Method for Implantable Medical Device to Detect Anomaly in Real Time #h(1fr) #text(fill: accent, weight: "semibold", size: 9pt)[Apr 2026]
- *KR 10-2848814* — GPT API-Based Network Anomaly Detection #h(1fr) #text(fill: accent, weight: "semibold", size: 9pt)[Aug 2025]

#section("Selected Awards")

#grid(
  columns: (auto, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.3em,
  text(weight: "semibold", fill: accent, size: 9pt)[2025], [*Silver Award*, 23rd KIISE Embedded Software Competition],
  text(weight: "semibold", fill: accent, size: 9pt)[2025], [*Outstanding Student Paper Award*, IEIE Conference],
  text(weight: "semibold", fill: accent, size: 9pt)[2024], [*Best Poster Silver*, 10th IBEC],
  text(weight: "semibold", fill: accent, size: 9pt)[2022], [*Achievement Award*, Qualcomm Institute — UC San Diego],
  text(weight: "semibold", fill: accent, size: 9pt)[2021], [*Gold Award (Ministerial)*, Smart Maritime Logistics — Min. of Oceans & Fisheries],
)

#section("Technical Skills")

#grid(
  columns: (auto, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.3em,
  text(weight: "semibold", fill: accent, size: 9pt)[Languages], [Python · C/C++ · MATLAB · Bash],
  text(weight: "semibold", fill: accent, size: 9pt)[AI / ML], [PyTorch · TensorFlow · LangChain · Transformers · GNN · Time-series modeling],
  text(weight: "semibold", fill: accent, size: 9pt)[Infrastructure], [Linux · Docker · Git · CUDA],
  text(weight: "semibold", fill: accent, size: 9pt)[Domains], [Agentic AI · Multi-agent LLM · Biomedical signals · Cyber-physical systems],
)

]
