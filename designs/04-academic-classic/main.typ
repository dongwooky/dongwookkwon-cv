// Design 04: Academic Classic (revised, Newsreader serif)
// Refined small-caps section headers, generous leading, classical hierarchy.

#let ink = rgb("#1a1a1a")
#let muted = rgb("#666666")
#let faint = rgb("#c8c8c8")

#set page(
  paper: "us-letter",
  margin: (x: 1.0in, top: 0.9in, bottom: 0.9in),
  header: context {
    if here().page() > 1 [
      #set text(size: 9pt, fill: muted, font: "Newsreader", style: "italic")
      #grid(columns: (1fr, auto),
        [Dongwook Kwon · Curriculum Vitae],
        text(style: "normal")[#counter(page).display()],
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.3pt + faint)
    ]
  },
)

#set text(font: "Newsreader", size: 10.5pt, fill: ink, lang: "en", weight: "regular")
#set par(leading: 0.65em, justify: true)

#let section(title) = {
  v(0.9em)
  block[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      align: horizon,
      text(size: 10pt, weight: "semibold", tracking: 2.5pt)[#upper(title)],
      line(length: 100%, stroke: 0.5pt + ink),
    )
  ]
  v(0.2em)
}

#let entry(title, subtitle, date, location, body) = {
  block(spacing: 0.8em)[
    #grid(columns: (1fr, auto), column-gutter: 1em,
      strong(title),
      emph(date),
    )
    #v(-0.45em)
    #grid(columns: (1fr, auto), column-gutter: 1em,
      emph(subtitle),
      text(fill: muted, style: "italic")[#location],
    )
    #v(0.1em)
    #body
  ]
}

// === HEADER ===
#align(center)[
  #text(size: 26pt, weight: "regular", tracking: 0.5pt)[Dongwook Kwon]

  #v(0.1em)
  #text(size: 10pt, style: "italic", fill: muted)[AI Engineer · Intelligent Agent Technology]

  #v(0.3em)
  #text(size: 9.5pt)[
    Room 701, Saebit Hall, 20 Gwangun-ro, Nowon-gu, Seoul 01897, Republic of Korea \
    +82 10-6612-9246  ·  #link("mailto:tomiyadragon@gmail.com")[tomiyadragon\@gmail.com]  ·  #link("https://dongwooky.github.io")[dongwooky.github.io]
  ]
]

#section("Research Interests")

Anomaly detection in time-series data (ECG, cyber-physical systems); agentic AI
and multi-agent LLM systems; graph neural networks for biomedical and
industrial signals; verification and evaluation of AI systems.

#section("Education")

#entry(
  "M.S. in Computer Engineering",
  "Kwangwoon University",
  "Mar 2024 – Feb 2026",
  "Seoul, Korea",
  [GPA 4.33 / 4.50 (98.1%) · Bio-Computing & Machine Learning Laboratory.],
)

#entry(
  "Graduate Research Program in Mechanical & Industrial Engineering",
  "University of Toronto",
  "Jan 2025 – Jul 2025",
  "Toronto, Canada",
  [GPA 3.68 / 4.00.],
)

#entry(
  "B.S. in Electronics & Communications Engineering",
  "Kwangwoon University",
  "Mar 2019 – Feb 2024",
  "Seoul, Korea",
  [GPA 3.41 / 4.50 (88.1%).],
)

#section("Publications")

*Journal Articles*
#v(-0.4em)
+ Y. Nam, J. Lee, H. Lee, *D. Kwon*, M. Yeo, S. Kim, R. Sohn, and C. Park. "Designing a remote photoplethysmography-based heart rate estimation algorithm during a treadmill exercise." _Electronics_, vol. 14, no. 5, p. 890, 2025.

+ *D. Kwon*, Y. Kang, J. Lee, Y. Nam, J. Won, K. K. Kim, D. D. Kim, and C. Park. "Graph-Enhanced Bidirectional GRU for Anomaly Detection in Power Generation Environments." Under review at _Data Mining and Knowledge Discovery_ (Springer Nature), 2025.

#v(0.4em)
*Conference Papers*
#v(-0.4em)
+ R. Chang#super[†], *D. Kwon*#super[†], J. Lee#super[†], and N. Verma. "CascadeDebate: Multi-Agent Deliberation for Cost-Aware LLM Cascades." In _Proc. 64th Annu. Meeting Assoc. Comput. Linguistics (ACL) — Industry Track (Poster)_, 2026. #super[†]Equal contribution.

+ J. Lee#super[†], R. Chang#super[†], *D. Kwon*#super[†], H. Singh, and N. Verma. "GEMMAS: Graph-based Evaluation Metrics for Multi-Agent Systems." In _Proc. EMNLP 2025 Industry Track (Oral)_, 2025. #super[†]Equal contribution.

+ *D. Kwon*, M. Kim, Y. Kang, J. Lee, and C. Park. "Hybrid neural network model for anomaly detection in implantable devices using graph attention networks and transformers." In _Proc. 10th Int. Biomed. Eng. Conf. (IBEC)_, 2024. — _Best Poster Award, Silver_.

+ *D. Kwon*, Y. Kang, and C. Park. "Enhancing medical device security with GNN-GRU anomaly detection model." In _Proc. 62nd KOSOMBE Autumn Conf._, pp. 204–205, 2023. — _Outstanding Paper Award_.

#section("Patents")

+ "Method for Implantable Medical Device to Detect Anomaly in Real Time," KR Patent No. 10-2961984, issued Apr 30, 2026.

+ "GPT API-Based Network Anomaly Detection," KR Patent No. 10-2848814, issued Aug 18, 2025.

#section("Research Experience")

#entry(
  "AI Engineer, Intelligent Agent Technology Team",
  "Suresoft Technologies",
  "Dec 2025 – Present",
  "Seongnam, Korea",
  [
    Developing AI validation systems based on agentic architectures; designing
    autonomous and collaborative AI agents to verify and evaluate AI models;
    building scalable, reliable agentic verification frameworks.
  ],
)

#entry(
  "Research Assistant",
  "Bio-Computing & Machine Learning Laboratory, Kwangwoon University",
  "Aug 2021 – Dec 2025",
  "Seoul, Korea",
  [
    Researched deep-learning algorithms for anomaly detection in time-series
    data including ECG and cyber-physical systems. Contributed to the
    development of an Active Kill-Switch and Biomarker-Based Defense System for
    life-threatening IoT medical devices.
  ],
)

#entry(
  "Visiting Researcher",
  "LG Electronics Canada (with University of Toronto)",
  "Jan 2025 – Jul 2025",
  "Toronto, Canada",
  [
    Developed an LLM-driven assessment framework for evaluating performance of
    agentic AI systems.
  ],
)

#entry(
  "Summer Researcher",
  "Qualcomm Institute, UC San Diego — AI Development Project",
  "Jul 2022 – Aug 2022",
  "San Diego, CA, USA",
  [
    Participated in the Personality-Based Drug Addiction Prediction System
    project; attended seminars on deep learning and machine learning.
  ],
)

#section("Honors and Awards")

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.4em,
  emph("2025"), [*Silver Award*, 23rd Embedded Software Competition (KIISE), South Korea.],
  emph("2025"), [*Outstanding Student Paper Award*, IEIE Conference.],
  emph("2024"), [*Best Poster Award (Silver)*, 10th International Biomedical Engineering Conference (IBEC).],
  emph("2023"), [*Outstanding Paper Award*, Conference of the Korean Society of Medical & Biological Engineering (KOSOMBE).],
  emph("2022"), [*Bronze Award*, Hanium ICT Mentoring Competition, FKII.],
  emph("2022"), [*Excellence Award*, 18th Kwangwoon ICT Exhibition (KWIX).],
  emph("2022"), [*Achievement Award*, Qualcomm Institute AI Development Project, UC San Diego.],
  emph("2021"), [*Gold Award (Ministerial)*, Smart Maritime Logistics Project, Minister of Oceans and Fisheries.],
  emph("2021"), [*Grand Prize*, MY Capstone Design Competition, Kwangwoon University.],
)

#section("Selected Funded Projects")

#entry(
  "AI-based Intrusion Detection and Attack Packet Crafting for APR1400",
  "Sejong University (industry-academia)",
  "Jul 2022 – Present",
  "Seoul, Korea",
  [AI defense system protecting nuclear power plant control networks from cyber attacks.],
)

#entry(
  "Active Kill-Switch and Biomarker-Based Defense for IoT Medical Devices",
  "Kookmin University (industry-academia)",
  "Sep 2021 – Dec 2022",
  "Seoul, Korea",
  [Security system for cardiac implantable devices using anomaly detection.],
)

#entry(
  "Quadruped Robot Using Vision SLAM with Depth Camera",
  "Ministry of Science and ICT",
  "Apr 2022 – Nov 2022",
  "Seoul, Korea",
  [Autonomous navigation algorithm with SLAM and depth-camera perception.],
)

#entry(
  "Smart Logistics System Using Computer Vision",
  "Ministry of Oceans and Fisheries",
  "Apr 2021 – Nov 2021",
  "Seoul, Korea",
  [Logistics detection system with location tracking and stack-layer identification.],
)

#section("Leadership and Service")

- *President*, Kwangwoon International Student Association — intercultural programs and engagement initiatives.
- *Director of Filming & Editing*, Kwangwoon Broadcasting Center (KWBC) — media production oversight.
- *Class Representative*, Department of Electronics and Communications Engineering.
- *Executive Member*, Amateur Radio Club — workshops and technical exhibitions.
