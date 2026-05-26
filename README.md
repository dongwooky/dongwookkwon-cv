# Dongwook Kwon — CV Collection

여러 디자인의 CV를 한 곳에 모아두는 컬렉션. 용도별로 다른 디자인을 골라 쓰기 위함.

## 디자인 일람

| # | 디자인 | 주 용도 | 페이지 | 시그니처 | 폰트 |
|---|--------|---------|--------|----------|------|
| 01 | [altacv-modern](pdfs/01-altacv-modern.pdf) | 산업계 | 1 | 다크 슬레이트 사이드바 + 앰버 액센트 | Inter |
| 02 | [deedy-compact](pdfs/02-deedy-compact.pdf) | 산업계 | 1 | 좌-슬림 / 우-와이드 2단, 무색 | Inter |
| 03 | [modern-onepager](pdfs/03-modern-onepager.pdf) | 산업계 | 1 | 단일단, 티얼 액센트 | Inter |
| 04 | [academic-classic](pdfs/04-academic-classic.pdf) | 학계 | 3 | 세리프, moderncv 풍, 가운데 정렬 이름 | Newsreader |
| 05 | [minimal-typography](pdfs/05-minimal-typography.pdf) | 학계/크로스오버 | 2 | 넉넉한 마진, 중앙 스몰캡 헤더 | Newsreader |
| 06 | [niw-comprehensive](pdfs/06-niw-comprehensive.pdf) | NIW 로펌 제출 | 6 | 페이지 헤더 + 다섹션 종합형 | Newsreader |
| 07 | [awesome-cv-style](pdfs/07-awesome-cv-style.pdf) | 산업계/학계 | 2 | **원본 PDF 스타일** — 빨간 split 헤더, 이탤릭 날짜 | Inter |
| 08 | [jakes-resume](pdfs/08-jakes-resume.pdf) | 산업계 (SWE) | 2 | Jake Gutierrez의 LaTeX 표준, ATS-우호적 | New Computer Modern |
| 09 | [brilliant-cv](pdfs/09-brilliant-cv.pdf) | 산업계 (모던) | 1 | 인디고 헤더 밴드 + 이니셜 아바타 | Inter |

## 디렉토리 구조

```
.
├── _CV__Dongwook_Kwon.pdf          원본 (Awesome-CV LaTeX 기반)
├── _CV__Dongwook_Kwon.md           파싱된 텍스트 — 단일 진실원
├── designs/
│   └── <NN-name>/main.typ          Typst 소스 (디자인별)
├── pdfs/
│   └── <NN-name>.pdf               컴파일된 PDF 모음 (build-all.sh가 채움)
└── scripts/
    └── build-all.sh                전체 일괄 컴파일
```

## 빌드 방법

### 설치 (1회)

Typst 0.14+ 필요. 단일 바이너리.

```bash
# linux x86_64 예시
mkdir -p ~/.local/bin
curl -fsSL -o /tmp/typst.tar.xz \
  https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz
tar xf /tmp/typst.tar.xz -C /tmp
mv /tmp/typst-x86_64-unknown-linux-musl/typst ~/.local/bin/typst
typst --version
```

macOS는 `brew install typst`.

### 컴파일

```bash
# 전체 — pdfs/ 에 모임
bash scripts/build-all.sh

# 개별
typst compile designs/01-altacv-modern/main.typ pdfs/01-altacv-modern.pdf

# 라이브 프리뷰 (수정하며 자동 재컴파일)
typst watch designs/01-altacv-modern/main.typ
```

## 콘텐츠 갱신 정책

`_CV__Dongwook_Kwon.md`가 단일 진실원. 새 publication·award·project 추가 시:

1. `_CV__Dongwook_Kwon.md` 먼저 갱신
2. 영향받는 design들의 `main.typ` 수정 (각 디자인이 자기완결형이라 수동 동기화)
3. `bash scripts/build-all.sh`로 일괄 재컴파일

## 새 디자인 추가

1. `designs/NN-name/main.typ` 생성 (번호는 다음 일련번호)
2. `bash scripts/build-all.sh` 실행 — 자동으로 잡힘
3. 본 README의 일람 표에 한 줄 추가
