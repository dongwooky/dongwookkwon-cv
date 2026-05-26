// Design 01: Modern Two-Column (revised)
// Refined palette (slate sidebar + warm amber accent), Inter throughout.

#let sidebar-bg = rgb("#1e293b")     // slate-800
#let sidebar-fg = rgb("#f1f5f9")     // slate-100
#let sidebar-faint = rgb("#94a3b8")  // slate-400 (on dark bg)
#let accent = rgb("#f59e0b")         // amber-500

#let ink = rgb("#0f172a")            // slate-900
#let muted = rgb("#64748b")          // slate-500
#let faint = rgb("#cbd5e1")          // slate-300

#set page(
  paper: "us-letter",
  margin: 0pt,
  background: place(left + top, rect(width: 2.5in, height: 100%, fill: sidebar-bg)),
)

#set text(font: "Inter", size: 9.2pt, fill: ink)
#set par(leading: 0.55em, justify: false)
#set list(spacing: 0.4em, indent: 0.7em)

#let main-section(title) = {
  v(0.7em)
  block[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      align: horizon,
      text(size: 9pt, weight: "semibold", tracking: 2.5pt)[#upper(title)],
      line(length: 100%, stroke: 0.5pt + faint),
    )
  ]
  v(0.15em)
}

#let side-section(title) = {
  v(0.7em)
  text(size: 8.8pt, weight: "semibold", tracking: 2.5pt, fill: accent)[#upper(title)]
  v(-0.4em)
  line(length: 100%, stroke: 0.4pt + sidebar-faint.transparentize(40%))
  v(0.1em)
}

#grid(
  columns: (2.5in, 1fr),
  column-gutter: 0pt,

  // ===== SIDEBAR =====
  block(width: 100%, inset: (x: 0.32in, y: 0.5in))[
    #set text(fill: sidebar-fg)

    #text(size: 21pt, weight: "bold", tracking: -0.4pt, fill: white)[Dongwook]
    #v(-1em)
    #text(size: 21pt, weight: "light", tracking: -0.4pt, fill: white)[Kwon]

    #v(0.25em)
    #text(size: 9.5pt, fill: accent, weight: "semibold", tracking: 1pt)[AI ENGINEER]
    #v(-0.6em)
    #text(size: 8.8pt, fill: sidebar-faint, style: "italic")[Intelligent Agent Technology]

    #side-section("Contact")
    #set text(size: 8.5pt, fill: sidebar-fg)
    +82 10-6612-9246 \
    tomiyadragon\@gmail.com \
    dongwooky.github.io \
    github.com/dongwooky \
    linkedin.com/in/dongwooky \
    Seoul, Republic of Korea

    #side-section("Expertise")
    #set text(size: 8.8pt, fill: sidebar-fg)
    Agentic AI Systems \
    Multi-Agent LLM Evaluation \
    Time-Series Anomaly Detection \
    Graph Neural Networks \
    Biomedical Signal Processing \
    Cyber-Physical Systems

    #side-section("Tech")
    #set text(size: 8.8pt, fill: sidebar-fg)
    Python · PyTorch · TensorFlow \
    Transformers · LangChain \
    Docker · Linux · CUDA · Git

    #side-section("Languages")
    #set text(size: 8.8pt, fill: sidebar-fg)
    Korean — Native \
    English — Professional

    #side-section("Selected Awards")
    #set text(size: 8.3pt, fill: sidebar-fg)
    *2025* Silver, KIISE Embedded SW \
    #v(0.1em)
    *2025* Outstanding Student Paper, IEIE \
    #v(0.1em)
    *2024* Best Poster Silver, IBEC \
    #v(0.1em)
    *2022* Achievement, UC San Diego \
    #v(0.1em)
    *2021* Gold (Ministerial), Maritime Logistics
  ],

  // ===== MAIN =====
  block(inset: (x: 0.4in, y: 0.5in))[
    #main-section("Experience")

    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*Suresoft Technologies* — _AI Engineer, Intelligent Agent Tech Team_],
      text(fill: muted)[Dec 2025 – Present],
    )
    #text(fill: muted, style: "italic", size: 8.8pt)[Seongnam, Korea]
    - Developing an AI validation system based on collaborative AI-agent architectures.
    - Designing autonomous and collaborative AI agents to verify and evaluate AI models.
    - Building agentic AI for systematic, scalable, reliable AI verification.

    #v(0.3em)
    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*Bio-Computing & ML Lab, Kwangwoon Univ.* — _Research Assistant_],
      text(fill: muted)[Aug 2021 – Dec 2025],
    )
    #text(fill: muted, style: "italic", size: 8.8pt)[Seoul, Korea]
    - Deep-learning anomaly detection in time-series data (ECG, CPS).
    - Co-developed Active Kill-Switch & Biomarker-Based Defense System for IoT medical devices.

    #v(0.3em)
    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*LG Electronics Canada* — _Research Project (with U of Toronto)_],
      text(fill: muted)[Jan – Jul 2025],
    )
    #text(fill: muted, style: "italic", size: 8.8pt)[Toronto, Canada]
    - LLM-driven assessment framework for evaluating agentic AI performance.

    #v(0.3em)
    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*Qualcomm Institute, UC San Diego* — _AI Summer Program_],
      text(fill: muted)[Jul – Aug 2022],
    )
    #text(fill: muted, style: "italic", size: 8.8pt)[San Diego, USA]
    - Personality-Based Drug Addiction Prediction System using ML.

    #main-section("Education")

    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*M.S. Computer Engineering*, Kwangwoon University — GPA 4.33/4.5],
      text(fill: muted)[2024 – 2026],
    )
    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*Graduate Research Program*, University of Toronto — MIE, GPA 3.68/4.0],
      text(fill: muted)[Jan – Jul 2025],
    )
    #grid(columns: (1fr, auto), gutter: 0.2em,
      [*B.S. Electronics & Communications Eng.*, Kwangwoon University — GPA 3.41/4.5],
      text(fill: muted)[2019 – 2024],
    )

    #main-section("Selected Publications")

    - R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], N. Verma. "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades." _ACL 2026 Industry Track (Poster)_.
    - J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, N. Verma. "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems." _EMNLP 2025 Industry Track (Oral)_.
    - *D. Kwon* et al. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation." Under review, _DMKD_, 2025.
    - *D. Kwon* et al. "Hybrid GAT + Transformer for implantable-device anomaly detection." _IBEC 2024_ — *Best Poster, Silver*.

    #main-section("Patents")
    - *KR 10-2961984* — Method for Implantable Medical Device to Detect Anomaly in Real Time #h(1fr) #text(fill: muted, size: 8.5pt)[Apr 2026]
    - *KR 10-2848814* — GPT API-Based Network Anomaly Detection #h(1fr) #text(fill: muted, size: 8.5pt)[Aug 2025]

    #main-section("Selected Projects")
    - *AI Intrusion Detection for APR1400* — Sejong Univ. (2022–). AI defense for nuclear plant networks.
    - *Quadruped Robot with Vision SLAM* — Ministry of Science & ICT (2022). Depth-camera navigation.
    - *Smart Logistics with Computer Vision* — Ministry of Oceans & Fisheries (2021). Container tracking.
  ],
)
