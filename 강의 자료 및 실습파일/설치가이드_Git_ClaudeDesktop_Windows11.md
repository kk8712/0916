# Git for Windows + Claude Desktop 설치·검증 가이드 (Windows 11)

> **대상**: 비전공자 포함 전 수강생 · **소요**: 약 15~25분 (네트워크 속도에 따라 상이)
> **목표**: **Git for Windows**와 **Claude Desktop** 2종을 *다운로드 → 설치 → 검증*까지 스스로 완료한다.
> **구성 원칙**: 설치 경로를 **① 프롬프트 · ② 스크립트 · ③ 수동** 3가지로 나누고, 셋 중 **하나만** 골라 진행합니다. 마지막 **PART 4 검증**은 어떤 경로를 택하든 **공통 필수**입니다.

---

## 0. 시작 전 확인

### 0-1. 준비물 체크리스트

- [ ] Windows 11 (64bit) PC / 노트북
- [ ] **관리자 권한** 계정 (설치 중 "예" 클릭 필요)
- [ ] 인터넷 연결 (사내망 방화벽 사용 시 IT 담당 사전 확인)
- [ ] 여유 디스크 공간 **2GB 이상**
- [ ] **Claude 계정** (이메일로 로그인 가능한 상태)

### 0-2. 무엇을·왜 설치하나

| 항목 | 무엇 | 왜 필요한가 | 설치 후 쓰는 곳 |
|---|---|---|---|
| **Git for Windows** | 버전관리 도구 + **Git Bash** 터미널 | 실습 파일 이력 관리, 리눅스식 명령 실행 환경 제공 | 3교시 프로젝트 폴더 구성 |
| **Claude Desktop** | Claude 데스크탑 앱 | **강의 주 실습 환경** (대화·파일 첨부·Projects) | 1~5교시 전 실습 |

### 0-3. 설치 경로 3가지 — 하나만 고르세요

| 경로 | 방법 | 추천 대상 | 난이도 | 소요 |
|---|---|---|---|---|
| **① 프롬프트** | Claude에게 시켜 안내받으며 설치 | AI 활용을 체험하고 싶은 분 | ★☆☆ | 15~20분 |
| **② 스크립트** | PowerShell 스크립트 실행 (자동) | 빠르게 끝내고 싶은 분 | ★★☆ | 5~10분 |
| **③ 수동** | 웹에서 직접 다운로드·설치 | 화면을 하나씩 확인하고 싶은 분 | ★☆☆ | 20~25분 |

> 💡 **처음이라면 ③ 수동**을 권장합니다. 화면을 직접 보며 진행해 문제 발생 시 원인을 찾기 쉽습니다.
> ⚙️ **사내 표준 PC로 여러 대 세팅**한다면 ② 스크립트가 가장 빠릅니다.

### 0-4. 터미널(PowerShell) 여는 법 — 앞으로 계속 사용

1. 키보드 `Win` 키를 누릅니다.
2. `powershell` 입력
3. **Windows PowerShell** 위에서 **마우스 오른쪽 클릭 → 관리자 권한으로 실행**
4. "이 앱이 디바이스를 변경하도록 허용하시겠어요?" → **예**
5. 파란(또는 검은) 창이 뜨면 준비 완료 → 아래 명령을 **한 줄씩 붙여넣고 Enter**

### 0-5. winget 사용 가능 여부 확인 (② 스크립트 경로에 필요)

```powershell
winget --version
```

- **버전이 출력되면** → ② 스크립트 경로 사용 가능
- **"용어를 인식할 수 없습니다"가 뜨면** → Microsoft Store에서 **"앱 설치 관리자"(App Installer)** 설치 후 재시도, 또는 **③ 수동** 경로로 진행

### 0-6. 실습 작업 폴더 만들기 — `C:\dev\fde`

교육 전 과정(1~5교시)에서 사용할 **공통 작업 폴더**입니다. 실습 파일·프로젝트가 모두 이 안에 쌓입니다.

```powershell
New-Item -ItemType Directory -Force C:\dev\fde | Out-Null
cd C:\dev\fde
```

생성 확인:

```powershell
Test-Path C:\dev\fde
```

→ `True`가 나오면 성공입니다.

> 📁 앞으로 **모든 실습은 `C:\dev\fde` 안에서** 진행합니다. Claude Desktop의 파일 연결(MCP)도 이 폴더를 기준으로 설정합니다.

---

# PART 1. 원클릭 프롬프트 (경로 ①)

## 1-1. 어디에 붙여넣나

Claude Desktop이 **아직 없는 상태**이므로, 아래 중 한 곳에 붙여넣습니다.

| 사용 가능한 곳 | 접속 방법 |
|---|---|
| **claude.ai 웹** (권장) | 브라우저에서 <https://claude.ai> 로그인 → 새 대화 |
| 스마트폰 Claude 앱 | 앱 실행 → 새 대화 (화면을 보며 PC에서 따라 실행) |

## 1-2. 프롬프트 전문 — 아래 블록을 **통째로** 복사해 붙여넣으세요

```text
너는 Windows 11 환경 설정을 도와주는 IT 지원 엔지니어야.

[맥락]
- 나는 비전공자이고, Windows 11 노트북에 관리자 권한이 있어.
- 오늘 AI 교육 실습을 위해 Git for Windows와 Claude Desktop 2종을 설치해야 해.
- 나는 터미널이 익숙하지 않아서, 클릭할 버튼 이름과 붙여넣을 명령을 그대로 알려줘야 해.

[요청]
아래 2종을 "다운로드 → 설치 → 검증" 순서로 설치하도록 나를 단계별로 안내해줘.
1) Git for Windows
2) Claude Desktop
설치를 마치면 실습 작업 폴더 C:\dev\fde 를 만들고 그 안으로 이동하는 방법까지 알려줘.

[진행 방식]
- 한 번에 한 단계씩만 알려주고, 내가 "다음"이라고 답하면 다음 단계로 넘어가.
- 각 단계마다 (a) 지금 무엇을 하는지 한 줄 설명 (b) 클릭할 버튼 이름 또는 붙여넣을 명령
  (c) 성공했을 때 화면에 보여야 하는 결과를 알려줘.
- 명령은 PowerShell 기준으로, 복사해서 붙여넣을 수 있는 형태로 한 줄씩 제시해줘.
- 설치 방법은 winget 명령 방식과 웹 다운로드 방식 두 가지를 제시하고, 내가 고르게 해줘.

[출력 형식]
각 단계를 다음 형식으로:
STEP n. (제목)
- 무엇을: ...
- 어떻게: (버튼 이름 또는 명령)
- 확인: (성공 시 보이는 결과)

[검증]
- 마지막에는 두 SW가 정상 설치됐는지 확인하는 방법을 [항목 | 확인 명령 | 정상 결과] 표로 정리해줘.
- Git은 사용자 이름·이메일 초기 설정까지 완료되게 안내하고,
  Claude Desktop은 로그인까지 마쳤는지 확인하는 방법을 알려줘.
- 실습 작업 폴더 C:\dev\fde 가 만들어졌는지 확인하는 방법도 포함해줘.
- 오류가 났을 때 자주 발생하는 문제 3가지와 해결책도 마지막에 정리해줘.
```

## 1-3. 이 프롬프트가 잘 작성된 이유 (프롬프트 5요소)

| 요소 | 이 프롬프트에서 | 효과 |
|---|---|---|
| **역할** | "IT 지원 엔지니어" | 답변 관점·용어 수준을 고정 |
| **맥락** | 비전공자 · Windows 11 · 관리자 권한 · 교육 목적 | 불필요한 전제 질문을 줄임 |
| **요청** | 2종을 "다운로드 → 설치 → 검증" 단계 안내 | 할 일을 명확히 한정 |
| **출력** | `STEP n` 형식 + 마지막 검증 표 | 결과가 매번 같은 형태로 나옴 |
| **검증** | 정상 결과·초기 설정·오류 3가지 필수 포함 | 빠짐없이 끝까지 안내받음 |

> 💡 2교시에서 배우는 **프롬프트 5요소**가 실제로 어떻게 쓰이는지 보여주는 예시이기도 합니다.

---

# PART 2. 실행 가능한 스크립트 (경로 ②)

> ⚠️ **관리자 권한 PowerShell**에서 실행하세요 (0-4 참고). winget이 필요합니다 (0-5 참고).

## 2-1. 설치 스크립트 — `install-fde-tools.ps1`

### 스크립트 파일 만들기

아래 명령으로 폴더 생성 + 메모장 열기 (PowerShell에 붙여넣기)

```powershell
New-Item -ItemType Directory -Force C:\dev\setup | Out-Null
notepad C:\dev\setup\install-fde-tools.ps1
```

"새 파일을 만드시겠습니까?" → **예** → 아래 코드를 **전체 복사**해 메모장에 붙여넣고 **Ctrl+S** 저장

```powershell
# =====================================================================
# FDE 기초과정 - 실습 SW 설치 (Git for Windows + Claude Desktop)
# 실행: 관리자 권한 PowerShell
# =====================================================================
$ErrorActionPreference = 'Continue'
Write-Host "=== FDE 실습 SW 설치 시작 ===" -ForegroundColor Cyan

# --- 0) 관리자 권한 확인 ---
$id = [Security.Principal.WindowsIdentity]::GetCurrent()
$pr = New-Object Security.Principal.WindowsPrincipal($id)
if (-not $pr.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[중단] 관리자 권한이 아닙니다. PowerShell을 '관리자 권한으로 실행'하세요." -ForegroundColor Red
    return
}

# --- 1) winget 확인 ---
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "[중단] winget이 없습니다. Microsoft Store에서 '앱 설치 관리자'를 설치하거나 수동 설치(PART 3)로 진행하세요." -ForegroundColor Red
    return
}
Write-Host "[OK] winget 사용 가능" -ForegroundColor Green

# --- 2) Git for Windows ---
Write-Host "`n[1/2] Git for Windows 설치 중..." -ForegroundColor Yellow
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements

# --- 3) Claude Desktop ---
Write-Host "`n[2/2] Claude Desktop 설치 중..." -ForegroundColor Yellow
winget install --id Anthropic.Claude -e --source winget --accept-package-agreements --accept-source-agreements
if ($LASTEXITCODE -ne 0) {
    Write-Host "[안내] winget 패키지를 찾지 못했습니다." -ForegroundColor Yellow
    Write-Host "      https://claude.ai/download 에서 직접 내려받아 설치하세요 (PART 3-2)." -ForegroundColor Yellow
}

# --- 4) PATH 갱신 ---
$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")

# --- 5) 실습 작업 폴더 생성 ---
New-Item -ItemType Directory -Force C:\dev\fde | Out-Null
Write-Host "[OK] 실습 작업 폴더: C:\dev\fde" -ForegroundColor Green

Write-Host "`n=== 설치 완료. 이제 verify-fde-tools.ps1 로 검증하세요 ===" -ForegroundColor Cyan
```

### 실행

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
C:\dev\setup\install-fde-tools.ps1
```

> `Set-ExecutionPolicy ... -Scope Process`는 **현재 창에서만** 스크립트 실행을 허용합니다(창을 닫으면 원복). 시스템 보안 설정을 영구히 바꾸지 않습니다.

## 2-2. 검증 스크립트 — `verify-fde-tools.ps1`

```powershell
notepad C:\dev\setup\verify-fde-tools.ps1
```

아래 코드를 붙여넣고 저장하세요.

```powershell
# =====================================================================
# FDE 기초과정 - 설치 검증
# 실행: 새 PowerShell 창 (일반 권한 가능)
# =====================================================================
$rows = @()
function Add-Row($name, $ok, $detail) {
    $script:rows += [pscustomobject]@{
        항목 = $name
        결과 = $(if ($ok) { "PASS" } else { "FAIL" })
        상세 = $detail
    }
}

Write-Host "=== FDE 실습 SW 검증 ===" -ForegroundColor Cyan

# 1) Git 설치
if (Get-Command git -ErrorAction SilentlyContinue) {
    Add-Row "Git 설치" $true (git --version)
} else {
    Add-Row "Git 설치" $false "git 명령을 찾을 수 없음 (PowerShell 재시작 후 재시도)"
}

# 2) Git 사용자 정보
$uname = git config --global user.name
$umail = git config --global user.email
if ($uname -and $umail) {
    Add-Row "Git 초기설정" $true "$uname <$umail>"
} else {
    Add-Row "Git 초기설정" $false "user.name / user.email 미설정 (PART 3-1 참고)"
}

# 3) Git Bash
$bash = Test-Path "C:\Program Files\Git\bin\bash.exe"
Add-Row "Git Bash" $bash $(if ($bash) { "설치됨" } else { "없음" })

# 4) Claude Desktop 설치 (폴더 → 등록정보 순으로 탐색)
$paths = @(
    "$env:LOCALAPPDATA\AnthropicClaude",
    "$env:LOCALAPPDATA\Programs\claude-desktop",
    "$env:PROGRAMFILES\Claude"
)
$found = $paths | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $found) {
    $keys = @(
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )
    $reg = Get-ItemProperty $keys -ErrorAction SilentlyContinue |
           Where-Object { $_.DisplayName -like "*Claude*" } |
           Select-Object -First 1
    if ($reg) { $found = $reg.DisplayName }
}
if ($found) {
    Add-Row "Claude Desktop 설치" $true "$found"
} else {
    Add-Row "Claude Desktop 설치" $false "설치 경로를 찾지 못함 (PART 3-2 참고)"
}

# 5) Claude Desktop 실행 여부
$proc = Get-Process -Name "Claude*" -ErrorAction SilentlyContinue
Add-Row "Claude Desktop 실행" ([bool]$proc) $(if ($proc) { "실행 중" } else { "미실행 (앱을 실행해 로그인하세요)" })

# 6) 실습 작업 폴더
$work = Test-Path "C:\dev\fde"
Add-Row "실습 작업 폴더" $work $(if ($work) { "C:\dev\fde" } else { "없음 (New-Item -ItemType Directory -Force C:\dev\fde)" })

$rows | Format-Table -AutoSize
$fail = ($rows | Where-Object { $_.결과 -eq "FAIL" }).Count
if ($fail -eq 0) {
    Write-Host "`n[완료] 모든 항목 PASS - 실습 준비 완료!" -ForegroundColor Green
} else {
    Write-Host "`n[확인 필요] FAIL $fail 건 - PART 5 트러블슈팅을 참고하세요." -ForegroundColor Yellow
}
```

### 실행

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
C:\dev\setup\verify-fde-tools.ps1
```

### 정상 결과 예시

```text
항목                   결과  상세
----                   ----  ----
Git 설치               PASS  git version 2.47.0.windows.1
Git 초기설정           PASS  홍길동 <hong@company.com>
Git Bash               PASS  설치됨
Claude Desktop 설치    PASS  C:\Users\사용자\AppData\Local\AnthropicClaude
Claude Desktop 실행    PASS  실행 중
실습 작업 폴더         PASS  C:\dev\fde

[완료] 모든 항목 PASS - 실습 준비 완료!
```

> ⚠️ **Git 초기설정이 FAIL**이면 **PART 3-1 ⓓ**의 명령 2줄을 실행한 뒤 다시 검증하세요.

---

# PART 3. 수동 따라하기 (경로 ③)

## 3-1. Git for Windows

**무엇을·왜**: 파일 변경 이력을 관리하는 도구입니다. 함께 설치되는 **Git Bash**는 리눅스식 명령을 쓸 수 있는 터미널로, 실습에서 자주 사용합니다.

### ⓐ 다운로드

1. 브라우저에서 <https://git-scm.com/download/win> 접속
2. **64-bit Git for Windows Setup** 클릭
3. 자동으로 다운로드가 시작됩니다 (`Git-2.xx.x-64-bit.exe`, 보통 `다운로드` 폴더)
   - 자동으로 시작되지 않으면 페이지의 **click here to download manually** 클릭

### ⓑ 설치

1. 받은 `Git-2.xx.x-64-bit.exe` **더블클릭**
2. "이 앱이 디바이스를 변경하도록 허용하시겠어요?" → **예**
3. 라이선스 화면 → **Next**
4. 설치 위치 → **기본값 그대로** → Next
5. 구성 요소 선택 → **기본값 그대로** → Next
6. 시작 메뉴 폴더 → **Next**
7. **기본 편집기 선택** → **Use Visual Studio Code as default editor** 선택 → Next
   - VS Code가 없으면 **Use Notepad as default editor** 선택
8. 초기 브랜치 이름 → **Let Git decide** (기본값) → Next
9. **PATH 환경 변수** → ⭐ **Git from the command line and also from 3rd-party software** (가운데, 권장) → Next
10. 이후 화면들은 **모두 기본값 그대로 Next**
11. **Install** 클릭 → 완료되면 **Finish**

> ⭐ 9번 **PATH 설정**이 가장 중요합니다. 이 옵션이어야 PowerShell에서 `git` 명령을 쓸 수 있습니다.

### ⓒ 확인

**PowerShell을 새로 연 뒤**(기존 창은 PATH가 반영되지 않음) 실행:

```powershell
git --version
```

정상 결과 예: `git version 2.47.0.windows.1`

### ⓓ 초기 설정 (이름·이메일) — **필수**

본인 정보로 바꿔서 실행하세요.

```powershell
git config --global user.name "홍길동"
git config --global user.email "hong@company.com"
```

설정 확인:

```powershell
git config --global --list
```

## 3-2. Claude Desktop

**무엇을·왜**: 강의 전 과정에서 사용하는 **주 실습 환경**입니다. 별도 개발도구 없이 대화·파일 첨부·Projects를 사용합니다.

### ⓐ 다운로드

1. 브라우저에서 <https://claude.ai/download> 접속
2. **Download for Windows** 클릭
3. 설치 파일이 `다운로드` 폴더에 저장됩니다

### ⓑ 설치

1. 받은 설치 파일 **더블클릭**
2. 보안 경고가 뜨면 → **추가 정보** → **실행**
3. 설치가 자동으로 진행되고, 완료되면 Claude 앱이 실행됩니다

### ⓒ 로그인 — **필수**

1. 앱 화면에서 **Continue with Google** 또는 **이메일로 로그인** 선택
2. 교육용으로 안내받은 계정으로 로그인
3. 로그인 후 **대화 입력창**이 보이면 완료

### ⓓ 확인

간단한 대화로 정상 동작을 확인합니다.

```text
안녕! 오늘 교육 실습을 시작할 준비가 됐는지 한 줄로 답해줘.
```

응답이 오면 설치·로그인 완료입니다.

---

# PART 4. 최종 검증 체크리스트 (공통 · 필수)

어떤 경로로 설치했든 **아래 5가지를 모두 확인**하세요.

| # | 확인 항목 | 확인 방법 | 정상 결과 |
|---|---|---|---|
| 1 | Git 설치 | PowerShell에 `git --version` | `git version 2.xx.x.windows.x` |
| 2 | Git 초기설정 | `git config --global --list` | `user.name` / `user.email` 표시 |
| 3 | Git Bash | `Win` → `git bash` 검색 | Git Bash 앱이 실행됨 |
| 4 | Claude Desktop 설치 | `Win` → `claude` 검색 | Claude 앱이 실행됨 |
| 5 | Claude Desktop 로그인 | 앱에서 대화 1건 전송 | 응답이 돌아옴 |
| 6 | 실습 작업 폴더 | `Test-Path C:\dev\fde` | `True` |

### 한 번에 확인 (복사해 실행)

```powershell
git --version; git config --global --list; Test-Path C:\dev\fde; Get-Process Claude* -ErrorAction SilentlyContinue
```

> ✅ 6개 항목이 모두 정상이면 **실습 준비 완료**입니다.

---

# PART 5. 트러블슈팅 (증상별)

| 증상 | 원인 | 해결 |
|---|---|---|
| `git : 용어를 인식할 수 없습니다` | PATH 미반영 | **PowerShell을 완전히 닫고 새로 열기** → 재시도. 그래도 안 되면 재설치 시 PART 3-1의 **9번 PATH 옵션** 확인 |
| `winget : 용어를 인식할 수 없습니다` | 앱 설치 관리자 없음 | Microsoft Store에서 **앱 설치 관리자(App Installer)** 설치, 또는 **PART 3 수동 설치** |
| 스크립트 실행이 차단됨 | 실행 정책 제한 | `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force` 실행 후 재시도 |
| winget에서 Claude 패키지를 못 찾음 | 패키지 ID 변경/미등록 | <https://claude.ai/download> 에서 **직접 다운로드**(PART 3-2) |
| 설치 중 "관리자 권한 필요" | 일반 권한 실행 | PowerShell을 **관리자 권한으로 실행**(0-4) |
| 다운로드가 차단됨 | 사내 방화벽·보안정책 | 사내 IT 담당에게 `git-scm.com`, `claude.ai` 허용 요청 |
| Claude 로그인이 안 됨 | 계정·네트워크 문제 | 브라우저에서 <https://claude.ai> 로그인 먼저 확인 → 앱 재실행 |
| Git 초기설정 FAIL | user.name/email 미설정 | **PART 3-1 ⓓ** 명령 2줄 실행 |

---

## 부록. 제거 / 재설치

```powershell
# 제거
winget uninstall --id Git.Git -e
winget uninstall --id Anthropic.Claude -e

# 재설치 (설치 스크립트 재실행)
C:\dev\setup\install-fde-tools.ps1
```

> Git 설정(`user.name`·`user.email`)은 제거해도 남아 있을 수 있습니다. 재설치 후 **PART 4 검증**으로 확인하세요.

---

## 요약 — 3줄 정리

1. **경로 3가지 중 하나만** 선택 (프롬프트 / 스크립트 / 수동)
2. 설치 후 **PART 4 체크리스트 5개**를 반드시 확인
3. 막히면 **PART 5 트러블슈팅**에서 증상으로 찾기

> 📌 관련 문서: 나머지 8종(VS Code · Node.js · Claude Code CLI · LibreOffice · MCP 4종)은
> **`실습환경_설치가이드_Windows11.md`** 를 참고하세요.
