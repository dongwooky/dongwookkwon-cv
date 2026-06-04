# Dongwook Kwon — CV Collection

여러 디자인의 CV를 한 곳에 모아두는 컬렉션. 용도별로 다른 디자인을 골라 쓰기 위함.
모든 디자인은 **하나의 마스터 데이터(`data/cv.yaml`)**에서 생성되므로 내용이 항상 동기화된다.

## 디자인 일람

| # | 디자인 | 주 용도 | 페이지 | 시그니처 | 폰트 |
|---|--------|---------|--------|----------|------|
| 01 | [awesome-cv](pdfs/01-awesome-cv-upstream.pdf) | 산업계/학계 (종합) | 3 | 빨간 split 헤더, 전 섹션 종합형 | Source Sans 3 / Roboto |
| 02 | [awesome-cv-summary](pdfs/02-awesome-cv-summary-upstream.pdf) | 산업계/학계 (요약) | 2 | 01 + 상단 Summary, Patents·Publications 우선 배치 | Source Sans 3 / Roboto |
| 03 | [jakes-resume](pdfs/03-jakes-resume-upstream.pdf) | 산업계 (SWE) | 2 | Jake Gutierrez LaTeX 표준, 단일단 ATS-친화 | New Computer Modern |
| 04 | [moderncv](pdfs/04-moderncv-upstream.pdf) | 학계 | 3 | 클래식 moderncv (banking·blue), 종합형 | Latin Modern Sans |

## 디렉토리 구조

```
.
├── _CV__Dongwook_Kwon.md/.pdf      원본/참고용 (Awesome-CV 기반)
├── data/
│   └── cv.yaml                      ★ 마스터 데이터 — 단일 진실원
├── designs/
│   └── <NN-name>/
│       ├── main.tex.j2             Jinja2 템플릿 (디자인별)
│       ├── main.tex                sync.py가 생성한 LaTeX (직접 수정 금지)
│       └── *.cls                   디자인별 클래스 파일
├── pdfs/
│   └── <NN-name>.pdf               컴파일된 PDF (build-all.sh가 채움)
└── scripts/
    ├── sync.py                     cv.yaml + *.j2 → main.tex + .md 렌더링
    └── build-all.sh                전체 xelatex 일괄 컴파일
```

## 빌드 방법

### 요구사항

- **TeX Live** (xelatex) — scheme-medium + `roboto`, `fontawesome5`, `fontawesome6`, `pdfx`, `biblatex`, `simpleicons`
- **시스템 폰트**: Source Sans 3, Roboto (fontconfig에서 이름으로 로드됨)
- **Python 3** + `pyyaml`, `jinja2` (sync.py용)

### 컴파일

```bash
# 1) 마스터 데이터 → 각 디자인 main.tex 동기화
python3 scripts/sync.py            # 전체
python3 scripts/sync.py 01 03      # 특정 디자인만 (번호 접두사)

# 2) 전체 xelatex 컴파일 → pdfs/ 에 모임
bash scripts/build-all.sh
```

## 콘텐츠 갱신 정책

`data/cv.yaml`이 **단일 진실원**. 새 publication·award·project 추가 시:

1. `data/cv.yaml` 수정
2. `python3 scripts/sync.py` — 모든 디자인의 `main.tex`와 `_CV__Dongwook_Kwon.md` 재생성
3. `bash scripts/build-all.sh` — PDF 일괄 재컴파일

> `designs/*/main.tex`는 생성물이므로 직접 고치지 말 것. 레이아웃을 바꾸려면 해당 디자인의 `main.tex.j2`(또는 `.cls`)를 수정한다.

## 새 디자인 추가

1. `designs/NN-name/`에 `main.tex.j2` (+ 필요 시 `.cls`) 생성 — 번호는 다음 일련번호
2. `python3 scripts/sync.py && bash scripts/build-all.sh` — 글롭으로 자동 인식
3. 본 README 일람 표에 한 줄 추가
