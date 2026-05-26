// Design 06: NIW Comprehensive
// Multi-page, conservative, comprehensive CV for EB-2 NIW (National Interest Waiver)
// immigration petition. Designed to be submitted to immigration counsel.
//
// Sections follow USCIS / NIW evidence-friendly structure: each "pillar"
// (publications, patents, awards, original contributions, critical employment)
// has its own well-labeled section with full detail.
//
// Placeholders marked with [TODO] are spots the user should fill in with
// specific numbers (citation counts, journal IFs, audience sizes, etc.)
// since those substantially strengthen NIW petitions.

#set page(
  paper: "us-letter",
  margin: (x: 1.0in, top: 1.0in, bottom: 1.0in),
  header: context {
    if here().page() > 1 [
      #set text(size: 9pt, fill: rgb("#555"), font: "Newsreader", style: "italic")
      #grid(columns: (1fr, auto), [Dongwook Kwon — Curriculum Vitae], text(style: "normal")[Page #counter(page).display()])
      #v(-0.5em)
      #line(length: 100%, stroke: 0.3pt + rgb("#bbb"))
    ]
  },
  footer: context {
    set text(size: 8pt, fill: rgb("#888"), font: "Newsreader", style: "italic")
    align(center)[Curriculum Vitae · Dongwook Kwon · Updated #datetime.today().display()]
  },
)

#set text(font: "Newsreader", size: 11pt, lang: "en")
#set par(leading: 0.65em, justify: true, first-line-indent: 0em)

#show heading.where(level: 1): it => {
  v(1.0em)
  block(breakable: false)[
    #text(size: 14pt, weight: "bold", upper(it.body))
    #v(-0.4em)
    #line(length: 100%, stroke: 0.8pt + black)
  ]
  v(0.3em)
}

#show heading.where(level: 2): it => {
  v(0.5em)
  block[
    #text(size: 12pt, weight: "bold", style: "italic")[#it.body]
  ]
  v(-0.2em)
}

// === COVER / HEADER ===
#align(center)[
  #v(0.5em)
  #text(size: 22pt, weight: "bold", tracking: 1pt)[CURRICULUM VITAE]
  #v(-0.3em)
  #text(size: 28pt, weight: "bold")[Dongwook Kwon]

  #v(0.2em)
  #text(size: 11pt, style: "italic")[AI Engineer · Intelligent Agent Technology]

  #v(0.6em)
  #text(size: 10pt)[
    Room 701, Saebit Hall, 20 Gwangun-ro, Nowon-gu, Seoul 01897, Republic of Korea \
    Telephone: +82 10-6612-9246  ·  Email: tomiyadragon\@gmail.com \
    Web: #link("https://dongwooky.github.io")[dongwooky.github.io]  ·
    GitHub: #link("https://github.com/dongwooky")[dongwooky]  ·
    LinkedIn: #link("https://linkedin.com/in/dongwooky")[dongwooky]
  ]
  #v(0.5em)
  #line(length: 70%, stroke: 0.6pt + black)
]

#v(0.6em)

== Statement of Areas of Expertise

Dongwook Kwon is an AI engineer and graduate researcher whose work centers on
*agentic AI systems*, *multi-agent large language model (LLM) evaluation*,
and *time-series anomaly detection* for safety-critical domains such as
implantable medical devices, power-generation infrastructure, and
cyber-physical systems. His research has been published in leading
international venues including the Association for Computational Linguistics
(ACL) and the Empirical Methods in Natural Language Processing (EMNLP)
conferences, both ranked among the top peer-reviewed venues in natural
language processing globally \[TODO: confirm/cite CORE A-star / CSrankings tier\].
He is the holder of two granted Republic of Korea patents addressing critical
problems in implantable medical device safety and network-anomaly detection,
and the recipient of national-level awards from the Korean Ministry of Oceans
and Fisheries and the United States–based Qualcomm Institute at UC San Diego.

= Education

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 1em,

  [*2024–2026*],
  [
    *Master of Science in Computer Engineering* \
    Kwangwoon University, Seoul, Republic of Korea \
    Grade Point Average: 4.33 / 4.50 (98.1%) \
    Thesis advisor: Prof. Cheolsoo Park. Affiliated with the Bio-Computing
    and Machine Learning Laboratory.
  ],

  [*Jan–Jul 2025*],
  [
    *Graduate Research Program in Mechanical and Industrial Engineering* \
    University of Toronto, Toronto, Ontario, Canada \
    Grade Point Average: 3.68 / 4.00 \
    Visiting graduate researcher under a joint program with LG Electronics
    Canada.
  ],

  [*2019–2024*],
  [
    *Bachelor of Science in Electronics and Communications Engineering* \
    Kwangwoon University, Seoul, Republic of Korea \
    Grade Point Average: 3.41 / 4.50 (88.1%).
  ],
)

= Professional Experience

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 1em,

  [*Dec 2025 – Present*],
  [
    *AI Engineer*, Intelligent Agent Technology Team \
    Suresoft Technologies, Seongnam, Gyeonggi, Republic of Korea \
    Leading development of an AI validation system built on collaborative
    AI-agent architectures. Designing and implementing infrastructure to
    verify and evaluate machine-learning models through autonomous and
    cooperative AI agents. Building agentic AI systems that enable
    systematic, scalable, and reliable AI verification — addressing a
    pressing industry need as enterprise deployments of LLMs scale.
  ],

  [*Aug 2021 – Dec 2025*],
  [
    *Research Assistant* \
    Bio-Computing and Machine Learning Laboratory, Kwangwoon University,
    Seoul, Republic of Korea \
    Conducted research on deep-learning algorithms with a focus on anomaly
    detection in time-series data, including electrocardiogram (ECG) signals
    and cyber-physical-system telemetry. Contributed substantively to the
    development of an Active Kill-Switch and Biomarker-Based Defense System
    for life-threatening Internet-of-Things medical devices — a system
    designed to prevent catastrophic outcomes from cyber compromise of
    cardiac implantable devices.
  ],

  [*Jan – Jul 2025*],
  [
    *Visiting Researcher (Research Project)* \
    LG Electronics Canada, Toronto, Ontario, Canada \
    Joint program with the University of Toronto. Contributed to the
    development of an LLM-driven assessment framework that systematically
    evaluates the performance of agentic AI systems — work that fed
    directly into peer-reviewed publications at EMNLP 2025 and ACL 2026.
  ],

  [*Jul – Aug 2022*],
  [
    *AI Development Project Participant*, Summer Program \
    Qualcomm Institute, University of California San Diego, San Diego,
    California, United States \
    Selected for a competitive international summer program. Contributed to
    the Personality-Based Drug Addiction Prediction System project, applying
    machine-learning techniques to behavioral and personality data.
    Recognized with the program's Achievement Award.
  ],
)

= Honors and Awards

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.7em,

  [*Dec 2025*],
  [
    *Silver Award*, 23rd Embedded Software Competition, Korean Institute of
    Information Scientists and Engineers (KIISE), Republic of Korea.
    A nationally recognized competition in embedded software engineering.
    [TODO: number of participants / award rate]
  ],

  [*Nov 2025*],
  [
    *Outstanding Student Paper Award*, Conference of the Institute of
    Electronics and Information Engineers (IEIE), Republic of Korea.
  ],

  [*Nov 2024*],
  [
    *Best Poster Award (Silver)*, 10th International Biomedical Engineering
    Conference (IBEC), Republic of Korea.
  ],

  [*Nov 2023*],
  [
    *Outstanding Paper Award*, Conference of the Korean Society of Medical
    and Biological Engineering (KOSOMBE), Republic of Korea.
  ],

  [*Dec 2022*],
  [
    *Bronze Award*, Hanium ICT Mentoring Competition, Federation of Korean
    Information Industries (FKII), Republic of Korea.
  ],

  [*Sep 2022*],
  [
    *Excellence Award*, 18th Kwangwoon ICT Exhibition (KWIX), Kwangwoon
    University, Republic of Korea.
  ],

  [*Aug 2022*],
  [
    *Achievement Award*, Qualcomm Institute AI Development Project,
    University of California San Diego, United States. Awarded for
    outstanding contributions in a competitive international summer program.
  ],

  [*Dec 2021*],
  [
    *Gold Award (Ministerial Award)*, 2021 Smart Maritime Logistics Project,
    Minister of Oceans and Fisheries, Republic of Korea. This award is
    conferred by a cabinet minister of the Republic of Korea and represents
    a nationally significant recognition of contribution to maritime
    logistics technology.
  ],

  [*Oct 2021*],
  [
    *Grand Prize*, MY (Multi-Y) Capstone Design Competition, Kwangwoon
    University, Republic of Korea. Top award among all participating senior
    engineering capstone teams.
  ],
)

= Peer-Reviewed Publications

== Journal Articles

+ Y. Nam, J. Lee, H. Lee, *D. Kwon*, M. Yeo, S. Kim, R. Sohn, and C. Park.
  "Designing a Remote Photoplethysmography-Based Heart Rate Estimation
  Algorithm during a Treadmill Exercise." _Electronics_, vol. 14, no. 5,
  Article 890, 2025. \
  Publisher: MDPI. [TODO: journal impact factor, citation count if available]

+ *D. Kwon*, Y. Kang, J. Lee, Y. Nam, J. Won, K. K. Kim, D. D. Kim, and
  C. Park. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power
  Generation Environments." Under peer review at _Data Mining and Knowledge
  Discovery_ (Springer Nature), 2025. \
  [TODO: journal impact factor (DMKD is a leading journal in data mining)]

== Conference Papers

+ R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], and N. Verma.
  "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades."
  In _Proceedings of the 64th Annual Meeting of the Association for
  Computational Linguistics (ACL) — Industry Track (Poster)_, 2026. \
  #super[†]Equal contribution. \
  ACL is the flagship conference in computational linguistics and natural
  language processing. [TODO: acceptance rate of industry track]

+ J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, and
  N. Verma. "GEMMAS: Graph-Based Evaluation Metrics for Multi-Agent Systems."
  In _Proceedings of EMNLP 2025 — Industry Track (Oral Presentation)_, 2025. \
  #super[†]Equal contribution. \
  EMNLP is a top-tier conference in empirical methods for NLP. The work was
  selected for oral presentation. [TODO: oral acceptance rate]

+ *D. Kwon*, M. Kim, Y. Kang, J. Lee, and C. Park. "Hybrid Neural Network
  Model for Anomaly Detection in Implantable Devices Using Graph Attention
  Networks and Transformers." In _Proceedings of the 10th International
  Biomedical Engineering Conference (IBEC)_, 2024. _Best Poster Award —
  Silver Winner_.

+ *D. Kwon*, Y. Kang, and C. Park. "Enhancing Medical Device Security with
  GNN-GRU Anomaly Detection Model." In _Proceedings of the 62nd KOSOMBE
  Autumn Conference_, pp. 204–205, 2023. _Outstanding Paper Award_.

= Patents

+ "Method for Implantable Medical Device to Detect Anomaly in Real Time,"
  Republic of Korea Patent No. *KR 10-2961984*, issued April 30, 2026. \
  Addresses real-time anomaly detection for cardiac implantable devices —
  a safety-critical capability for the rapidly growing population of
  pacemaker and ICD recipients.

+ "GPT API-Based Network Anomaly Detection," Republic of Korea Patent
  No. *KR 10-2848814*, issued August 18, 2025. \
  Applies large-language-model APIs to the problem of network-traffic
  anomaly detection — a novel methodology bridging generative AI with
  classical cybersecurity.

= Funded Research Projects

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 1em,

  [*2025 – Present*],
  [
    *Agentic AI Evaluation Framework* — LG Electronics Canada \
    Developed an evaluation framework for agentic AI systems leveraging LLMs
    to assess performance and reliability.
  ],

  [*2022 – Present*],
  [
    *AI-Based Intrusion Detection and Attack-Packet Crafting Technologies
    for APR1400 Nuclear Reactors* — Sejong University, with national
    infrastructure stakeholders \
    Developed an AI-based defense system protecting nuclear power plants
    from cyber attacks. The APR1400 is a generation-III+ pressurized water
    reactor design deployed in the Republic of Korea and exported
    internationally.
  ],

  [*Apr – Nov 2022*],
  [
    *Quadruped Robot Using Vision SLAM with a Depth Camera* — Ministry of
    Science and ICT, Republic of Korea \
    Developed an autonomous quadruped robot using a navigation algorithm
    with simultaneous localization and mapping (SLAM) and a depth camera.
  ],

  [*Jul – Aug 2022*],
  [
    *Personality-Based Drug Addiction Prediction System* — Qualcomm
    Institute, University of California San Diego \
    Developed a personality-based drug-addiction prediction system using
    machine-learning models. Selected international participant.
  ],

  [*2021 – 2022*],
  [
    *Active Kill-Switch and Biomarker-Based Defense System for
    Life-Threatening IoT Medical Devices* — Kookmin University,
    industry-academia collaboration \
    Developed a security system for cardiac implant devices using anomaly-
    detection algorithms.
  ],

  [*Apr – Nov 2021*],
  [
    *Smart Logistics System Using Computer Vision* — Ministry of Oceans and
    Fisheries, Republic of Korea \
    Developed a logistics-detection system incorporating location tracking
    and stack-layer identification for shipping containers. Resulted in the
    Ministerial Gold Award.
  ],

  [*May – Oct 2021*],
  [
    *Smart Kitchen IoT System Utilizing Computer Vision and Deep Learning*
    — Kwangwoon University \
    Developed a cloud IoT platform with a grocery-classification system
    and an OCR receipt program.
  ],
)

= Leadership and Service

- *President*, Kwangwoon International Student Association — led intercultural
  programs and student-engagement initiatives spanning multiple cohorts of
  international students.
- *Director of Filming and Editing*, Kwangwoon Broadcasting Center (KWBC) —
  oversaw media production and content delivery for the campus broadcaster.
- *Class Representative*, Department of Electronics and Communications
  Engineering — represented student interests in academic affairs.
- *Executive Member*, Amateur Radio Club — organized radio workshops and
  technical exhibitions.

= Languages

- *Korean* — Native proficiency.
- *English* — Professional working proficiency (completed graduate research
  programs in Toronto, Canada and San Diego, California; published in
  English-language peer-reviewed venues).

= Selected Skills and Technical Competencies

- *Machine learning and deep learning*: PyTorch, TensorFlow; transformers,
  graph neural networks, sequence models (GRU, LSTM); anomaly detection;
  multi-agent systems; retrieval-augmented generation.
- *Software engineering*: Python (primary), C/C++, MATLAB; Linux, Docker,
  Git; CUDA programming.
- *Domain experience*: Biomedical signals (ECG, photoplethysmography),
  cyber-physical systems, industrial control / SCADA, embedded systems.

= Additional Information

[TODO: To strengthen the NIW petition, the following items are worth adding
once available:]

- *Citation counts and h-index*: provide Google Scholar profile metrics.
- *Invited talks and presentations*: list any keynote, invited, or
  conference-talk engagements.
- *Editorial and review service*: any peer-review for journals or
  conferences.
- *Professional society memberships*: e.g., ACL, IEEE, ACM.
- *Media coverage*: any press or media coverage of work, particularly the
  awards (Ministerial Gold, IBEC, ACL/EMNLP).
- *Letters of recommendation*: collected separately; this CV should be
  consistent with statements made by recommenders.

#v(1em)
#line(length: 100%, stroke: 0.5pt + black)
#align(center, text(size: 9pt, style: "italic", fill: rgb("#555"))[
  End of Curriculum Vitae · Dongwook Kwon
])
