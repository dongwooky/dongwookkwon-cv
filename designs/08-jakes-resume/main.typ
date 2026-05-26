// Design 08: Jake's Resume (Typst port)
// Reproduces Jake Gutierrez's iconic LaTeX template — the de facto standard
// for software-engineering resumes on r/cscareerquestions and r/EngineeringResumes.
// Single column, Computer Modern serif, ultra-compact, ATS-optimized.
//
// Source: https://github.com/jakegut/resume (MIT)

#let ink = rgb("#000000")

#set page(
  paper: "us-letter",
  margin: (x: 0.5in, top: 0.4in, bottom: 0.4in),
)

#set text(font: "New Computer Modern", size: 11pt, fill: ink)
#set par(leading: 0.55em, justify: false)
#set list(spacing: 0.25em, indent: 0pt, marker: [•])

// Section: bold caps with hairline rule underneath
#let section(title) = {
  v(0.5em)
  block[
    #text(size: 12pt, weight: "bold")[#upper(title)]
    #v(-0.55em)
    #line(length: 100%, stroke: 0.5pt + ink)
  ]
  v(0.05em)
}

// Two-line subsection: bold left + right; italic left + right
#let twoline(left-bold, right-bold, left-italic, right-italic) = {
  block(spacing: 0.4em)[
    #grid(columns: (1fr, auto), column-gutter: 1em, row-gutter: 0.05em,
      strong(left-bold),
      strong(right-bold),
      emph(left-italic),
      emph(right-italic),
    )
  ]
}

// === HEADER ===
#align(center)[
  #text(size: 22pt, weight: "regular")[Dongwook Kwon]

  #v(-0.3em)
  #text(size: 10.5pt)[
    +82 10-6612-9246 $|$
    #link("mailto:tomiyadragon@gmail.com")[#underline[tomiyadragon\@gmail.com]] $|$
    #link("https://dongwooky.github.io")[#underline[dongwooky.github.io]] $|$
    #link("https://github.com/dongwooky")[#underline[github.com/dongwooky]] $|$
    #link("https://linkedin.com/in/dongwooky")[#underline[linkedin.com/in/dongwooky]]
  ]
]

#section("Education")

#twoline(
  "Kwangwoon University",
  "Seoul, Korea",
  "Master of Science in Computer Engineering, GPA 4.33 / 4.5 (98.1%)",
  "Mar. 2024 – Feb. 2026",
)

#twoline(
  "University of Toronto",
  "Toronto, ON, Canada",
  "Graduate Research Program, Mechanical & Industrial Engineering, GPA 3.68 / 4.0",
  "Jan. 2025 – Jul. 2025",
)

#twoline(
  "Kwangwoon University",
  "Seoul, Korea",
  "B.S. Electronics & Communications Engineering, GPA 3.41 / 4.5 (88.1%)",
  "Mar. 2019 – Feb. 2024",
)

#section("Experience")

#twoline(
  "AI Engineer, Intelligent Agent Technology Team",
  "Dec. 2025 – Present",
  "Suresoft Technologies",
  "Seongnam, Korea",
)
- Developing an AI validation system utilizing AI agent–based architectures for enterprise model verification.
- Designing autonomous and collaborative AI agents that verify and evaluate machine-learning models at scale.
- Building agentic AI systems to enable systematic, scalable, and reliable AI verification processes.

#twoline(
  "Research Assistant",
  "Aug. 2021 – Dec. 2025",
  "Bio-Computing and Machine Learning Laboratory, Kwangwoon University",
  "Seoul, Korea",
)
- Researched deep-learning algorithms for anomaly detection in time-series data (ECG, cyber-physical systems).
- Co-developed an Active Kill-Switch and Biomarker-Based Defense System for life-threatening IoT medical devices.
- Published in EMNLP 2025 (Oral) and ACL 2026; co-author on two granted Republic of Korea patents.

#twoline(
  "Visiting Researcher",
  "Jan. 2025 – Jul. 2025",
  "LG Electronics Canada (with University of Toronto)",
  "Toronto, ON, Canada",
)
- Built an LLM-driven assessment framework for evaluating performance of agentic AI systems.
- Work fed directly into peer-reviewed publications at EMNLP 2025 and ACL 2026.

#twoline(
  "AI Development Project Participant, Summer Program",
  "Jul. 2022 – Aug. 2022",
  "Qualcomm Institute, University of California San Diego",
  "San Diego, CA, USA",
)
- Built a personality-based drug-addiction prediction system using machine-learning models.
- Recognized with the program's Achievement Award.

#section("Projects")

#grid(columns: (1fr, auto), column-gutter: 1em,
  [*Agentic AI Evaluation Framework* $|$ _Python, LLMs, multi-agent systems_],
  emph("2025 – Present"),
)
- Developed an evaluation framework for agentic AI systems leveraging LLMs to assess performance and reliability.

#v(0.2em)
#grid(columns: (1fr, auto), column-gutter: 1em,
  [*AI Intrusion Detection for APR1400 Nuclear Reactors* $|$ _Python, PyTorch, anomaly detection_],
  emph("2022 – Present"),
)
- Built an AI-based defense system protecting nuclear power plant control networks from cyber attacks.

#v(0.2em)
#grid(columns: (1fr, auto), column-gutter: 1em,
  [*Quadruped Robot with Vision SLAM* $|$ _ROS, depth camera, SLAM_],
  emph("Apr 2022 – Nov 2022"),
)
- Developed autonomous navigation algorithm with SLAM and depth-camera perception for a quadruped platform.

#v(0.2em)
#grid(columns: (1fr, auto), column-gutter: 1em,
  [*Smart Logistics with Computer Vision* $|$ _PyTorch, OpenCV, container tracking_],
  emph("Apr 2021 – Nov 2021"),
)
- Logistics detection system with location tracking and stack-layer identification — Ministerial Gold Award.

#section("Publications & Patents")

- *D. Kwon*#super[†] et al. "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades." _ACL 2026 — Industry Track (Poster)_.  #super[†]Equal contribution.
- *D. Kwon*#super[†] et al. "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems." _EMNLP 2025 — Industry Track (Oral)_.  #super[†]Equal contribution.
- *D. Kwon* et al. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments." Under review at _DMKD_ (Springer Nature), 2025.
- *D. Kwon* et al. "Hybrid GAT + Transformer for implantable-device anomaly detection." _IBEC 2024_. *Best Poster Silver.*
- Patent *KR 10-2961984* — Real-time anomaly detection for implantable medical devices (Apr 2026).
- Patent *KR 10-2848814* — GPT API-Based Network Anomaly Detection (Aug 2025).

#section("Technical Skills")

*Languages:* Python, C/C++, MATLAB, Bash \
*Frameworks:* PyTorch, TensorFlow, Transformers, LangChain, NumPy, Pandas, scikit-learn \
*Developer Tools:* Linux, Docker, Git, CUDA, VS Code \
*Domains:* Agentic AI, multi-agent LLM systems, GNNs, time-series anomaly detection, biomedical signals
