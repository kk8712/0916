# FDE 기초과정 · 실습환경 설치·검증 가이드 (Windows 11)

> **대상**: 비전공자 포함 전 수강생 · **소요**: 약 60~90분 (네트워크 속도에 따라 상이)
> **목표**: 강의·실습에 필요한 **SW 10종**을 *다운로드 → 설치 → 검증*까지 스스로 완료한다.
> **구성 원칙**: 설치 경로를 **① 프롬프트 · ② 스크립트 · ③ 수동** 3가지로 나누고, 셋 중 **하나만** 골라 진행합니다. 마지막 **PART 4 검증**은 어떤 경로를 택하든 **공통 필수**입니다.

---

## 0. 시작 전 확인

### 0-1. 준비물 체크리스트

- [ ] Windows 11 (64bit) PC / 노트북
- [ ] **관리자 권한** 계정 (설치 중 "예" 클릭 필요)
- [ ] 인터넷 연결 (사내망 방화벽 사용 시 IT 담당 사전 확인)
- [ ] 여유 디스크 공간 **10GB 이상**
- [ ] **Claude 계정** (이메일로 로그인 가능한 상태)

### 0-2. 무엇을·왜 설치하나 (10종)

| # | 항목 | 무엇 | 왜 필요한가 | 쓰는 곳 |
|---|---|---|---|---|
| 1 | **VS Code** | 코드·문서 편집기 | 폴더 구조·`CLAUDE.md`를 눈으로 확인·편집 | 3교시 |
| 2 | **Git for Windows** | 버전관리 + Git Bash | 변경 이력 관리, 리눅스식 터미널 제공 | 3교시 |
| 3 | **Claude Desktop** | Claude 데스크탑 앱 | **강의 주 실습 환경** (대화·파일·Projects·MCP) | 1~5교시 |
| 4 | **Node.js (LTS)** ⭐ | JS 실행 환경 | **5·7~10의 필수 선행** (npm/npx 제공) | 4교시 |
| 5 | **Claude Code CLI** | 터미널 에이전트 도구 | 폴더 전체를 읽고 파일을 직접 생성·수정 | 3~5교시 |
| 6 | **LibreOffice** | 문서 도구 | 산출물(PPTX·XLSX) 확인 및 PDF 변환 | 5교시 |
| 7 | **MCP: filesystem** | 파일 연결 | 실습 폴더를 Claude가 읽고 쓰게 함 | 4교시 |
| 8 | **MCP: context7** | 최신 문서 연결 | 라이브러리 공식 문서 실시간 조회 | 4교시 |
| 9 | **MCP: sequential-thinking** | 단계적 사고 | 복잡한 분석·설계를 단계로 분해 | 4~5교시 |
| 10 | **MCP: playwright** | 브라우저 자동화 | 웹 화면에서 데이터 수집·캡처 | 4~5교시 |

### 0-3. 설치 순서와 의존성 ⚠️

| 순서 | 그룹 | 항목 | 왜 이 순서인가 |
|---|---|---|---|
| 1~3 | 기본 도구 | VS Code · Git · Claude Desktop | 서로 독립 — 순서 무관 |
| 4 | 실행 환경 | **Node.js (LTS)** | ⭐ **5·7~10의 필수 선행** |
| 5 | 실행 환경 | Claude Code CLI | Node.js 설치 후에만 가능 |
| 6 | 문서 도구 | LibreOffice | 독립 |
| 7~10 | MCP 서버 | filesystem · context7 · sequential-thinking · playwright | Node.js(npx) 위에서 동작 |

> ⚠️ **④ Node.js를 먼저 설치하지 않으면 ⑤·⑦~⑩이 모두 실패합니다.** 순서를 지켜 주세요.

### 0-4. 설치 경로 3가지 — 하나만 고르세요

| 경로 | 방법 | 추천 대상 | 난이도 | 소요 |
|---|---|---|---|---|
| **① 프롬프트** | Claude에게 시켜 안내받으며 설치 | AI 활용을 체험하고 싶은 분 | ★☆☆ | 60~90분 |
| **② 스크립트** | PowerShell 스크립트 실행 (자동) | 빠르게 끝내고 싶은 분 | ★★☆ | 20~30분 |
| **③ 수동** | 웹에서 직접 다운로드·설치 | 화면을 하나씩 확인하고 싶은 분 | ★☆☆ | 60~90분 |

> 💡 **처음이라면 ③ 수동**을 권장합니다. 문제 발생 시 원인을 찾기 쉽습니다.
> ⚙️ **여러 대를 세팅**한다면 ② 스크립트가 가장 빠릅니다.

### 0-5. 터미널(PowerShell) 여는 법 — 앞으로 계속 사용

1. 키보드 `Win` 키를 누릅니다.
2. `powershell` 입력
3. **Windows PowerShell** 위에서 **마우스 오른쪽 클릭 → 관리자 권한으로 실행**
4. "이 앱이 디바이스를 변경하도록 허용하시겠어요?" → **예**
5. 창이 뜨면 준비 완료 → 아래 명령을 **한 줄씩 붙여넣고 Enter**

### 0-6. winget 사용 가능 여부 확인 (② 스크립트 경로에 필요)

```powershell
winget --version
```

- **버전이 출력되면** → ② 스크립트 경로 사용 가능
- **"용어를 인식할 수 없습니다"가 뜨면** → Microsoft Store에서 **"앱 설치 관리자"(App Installer)** 설치 후 재시도, 또는 **③ 수동** 경로로 진행

---

# PART 1. 원클릭 프롬프트 (경로 ①)

## 1-1. 어디에 붙여넣나

| 사용 가능한 곳 | 접속 방법 |
|---|---|
| **claude.ai 웹** (권장) | 브라우저에서 <https://claude.ai> 로그인 → 새 대화 |
| Claude Desktop | 이미 설치했다면 앱에서 새 대화 |

## 1-2. 프롬프트 전문 — 아래 블록을 **통째로** 복사해 붙여넣으세요

```text
너는 Windows 11 환경 설정을 도와주는 IT 지원 엔지니어야.

[맥락]
- 나는 비전공자이고, Windows 11 노트북에 관리자 권한이 있어.
- 오늘 AI 교육 실습을 위해 아래 SW 10종을 설치해야 해.
- 나는 터미널이 익숙하지 않아서, 클릭할 버튼 이름과 붙여넣을 명령을 그대로 알려줘야 해.

[설치 대상 - 이 순서를 반드시 지켜줘]
1) Visual Studio Code
2) Git for Windows
3) Claude Desktop
4) Node.js (LTS)          ← 5, 7~10의 필수 선행
5) Claude Code CLI
6) LibreOffice
7) MCP: filesystem
8) MCP: context7
9) MCP: sequential-thinking
10) MCP: playwright

[요청]
위 10종을 "다운로드 → 설치 → 검증" 순서로 설치하도록 나를 단계별로 안내해줘.

[진행 방식]
- 한 번에 한 항목씩만 알려주고, 내가 "다음"이라고 답하면 다음 항목으로 넘어가.
- 각 단계마다 (a) 지금 무엇을 하는지 한 줄 설명 (b) 클릭할 버튼 이름 또는 붙여넣을 명령
  (c) 성공했을 때 화면에 보여야 하는 결과를 알려줘.
- 명령은 PowerShell 기준으로, 복사해서 붙여넣을 수 있는 형태로 한 줄씩 제시해줘.
- 설치 방법은 winget 명령 방식과 웹 다운로드 방식 두 가지를 제시하고, 내가 고르게 해줘.
- MCP 4종은 claude_desktop_config.json 을 어떻게 편집하는지 전체 JSON 예시로 알려줘.

[출력 형식]
각 단계를 다음 형식으로:
STEP n. (항목명)
- 무엇을: ...
- 어떻게: (버튼 이름 또는 명령)
- 확인: (성공 시 보이는 결과)

[검증]
- 마지막에는 10종이 정상 설치됐는지 확인하는 방법을 [항목 | 확인 명령 | 정상 결과] 표로 정리해줘.
- Git은 사용자 이름·이메일 초기 설정까지, Claude Desktop은 로그인까지 완료되게 안내해줘.
- Node.js는 반드시 LTS 버전인지 확인하는 방법을 알려줘.
- 오류가 났을 때 자주 발생하는 문제 5가지와 해결책도 마지막에 정리해줘.
```

## 1-3. 이 프롬프트가 잘 작성된 이유 (프롬프트 5요소)

| 요소 | 이 프롬프트에서 | 효과 |
|---|---|---|
| **역할** | "IT 지원 엔지니어" | 답변 관점·용어 수준을 고정 |
| **맥락** | 비전공자 · Windows 11 · 관리자 권한 · 교육 목적 | 불필요한 전제 질문을 줄임 |
| **요청** | 10종을 "다운로드 → 설치 → 검증" 단계 안내 + **의존 순서 명시** | 순서 실수를 방지 |
| **출력** | `STEP n` 형식 + 검증 표 + MCP JSON 전문 | 결과가 매번 같은 형태로 나옴 |
| **검증** | 정상 결과·초기 설정·LTS 확인·오류 5가지 필수 | 빠짐없이 끝까지 안내받음 |

> 💡 2교시에서 배우는 **프롬프트 5요소**의 실제 적용 예시이기도 합니다.

---

# PART 2. 실행 가능한 스크립트 (경로 ②)

> ⚠️ **관리자 권한 PowerShell**에서 실행하세요 (0-5 참고). winget이 필요합니다 (0-6 참고).

## 2-1. 설치 스크립트 — `install-fde-all.ps1`

### 스크립트 파일 만들기

```powershell
New-Item -ItemType Directory -Force C:\dev\setup | Out-Null
notepad C:\dev\setup\install-fde-all.ps1
```

"새 파일을 만드시겠습니까?" → **예** → 아래 코드를 **전체 복사**해 붙여넣고 **Ctrl+S** 저장

```powershell
# =====================================================================
# FDE 기초과정 - 실습환경 설치 (SW 10종)
# 실행: 관리자 권한 PowerShell
# =====================================================================
$ErrorActionPreference = 'Continue'
Write-Host "=== FDE 실습환경 설치 시작 ===" -ForegroundColor Cyan

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

# --- 2) 기본 도구 + 실행 환경 + 문서 도구 (winget) ---
$apps = @(
    @{ Name = "Visual Studio Code"; Id = "Microsoft.VisualStudioCode" },
    @{ Name = "Git for Windows";    Id = "Git.Git" },
    @{ Name = "Claude Desktop";     Id = "Anthropic.Claude" },
    @{ Name = "Node.js (LTS)";      Id = "OpenJS.NodeJS.LTS" },
    @{ Name = "LibreOffice";        Id = "TheDocumentFoundation.LibreOffice" }
)
$n = 0
foreach ($app in $apps) {
    $n++
    Write-Host "`n[$n/$($apps.Count)] $($app.Name) 설치 중..." -ForegroundColor Yellow
    winget install --id $($app.Id) -e --source winget --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) {
        Write-Host "      [안내] winget 설치 실패 - PART 3의 수동 설치를 참고하세요." -ForegroundColor Yellow
    }
}

# --- 3) PATH 갱신 (node/npm 인식) ---
$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")

# --- 4) Claude Code CLI (npm) ---
Write-Host "`n[6] Claude Code CLI 설치 중... (1~3분 소요)" -ForegroundColor Yellow
if (Get-Command npm -ErrorAction SilentlyContinue) {
    npm install -g @anthropic-ai/claude-code
} else {
    Write-Host "      [건너뜀] npm 없음 - PowerShell을 새로 열고 이 스크립트를 다시 실행하세요." -ForegroundColor Yellow
}

# --- 5) MCP 서버 4종 사전 다운로드 ---
Write-Host "`n[7-10] MCP 서버 4종 사전 다운로드 중... (수 분 소요)" -ForegroundColor Yellow
if (Get-Command npx -ErrorAction SilentlyContinue) {
    npx -y @modelcontextprotocol/server-filesystem --help            | Out-Null
    npx -y @upstash/context7-mcp --help                              | Out-Null
    npx -y @modelcontextprotocol/server-sequential-thinking --help   | Out-Null
    npx -y @playwright/mcp@latest --help                             | Out-Null
    Write-Host "      playwright 브라우저 엔진 설치 중... (5~10분)" -ForegroundColor Yellow
    npx -y playwright install chromium
} else {
    Write-Host "      [건너뜀] npx 없음 - Node.js 설치 확인 후 재실행하세요." -ForegroundColor Yellow
}

Write-Host "`n=== 설치 완료. 다음: setup-mcp-config.ps1 실행 ===" -ForegroundColor Cyan
```

### 실행

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
C:\dev\setup\install-fde-all.ps1
```

> `Set-ExecutionPolicy ... -Scope Process`는 **현재 창에서만** 스크립트 실행을 허용합니다(창을 닫으면 원복).

## 2-2. MCP 설정 스크립트 — `setup-mcp-config.ps1`

```powershell
notepad C:\dev\setup\setup-mcp-config.ps1
```

```powershell
# =====================================================================
# FDE 기초과정 - MCP 4종 설정 파일 자동 생성
# 실행: 일반 권한 PowerShell (Claude Desktop 종료 후 실행 권장)
# =====================================================================
$practice = "C:\dev\fde"
New-Item -ItemType Directory -Force $practice | Out-Null

$cfgDir  = Join-Path $env:APPDATA "Claude"
$cfgFile = Join-Path $cfgDir "claude_desktop_config.json"
New-Item -ItemType Directory -Force $cfgDir | Out-Null

# 기존 설정 백업
if (Test-Path $cfgFile) {
    $stamp = (Get-Item $cfgFile).LastWriteTime.ToString("yyyyMMddHHmmss")
    Copy-Item $cfgFile "$cfgFile.$stamp.bak"
    Write-Host "[백업] $cfgFile.$stamp.bak" -ForegroundColor Yellow
}

$config = @{
    mcpServers = @{
        "filesystem" = @{
            command = "npx"
            args    = @("-y", "@modelcontextprotocol/server-filesystem", $practice)
        }
        "context7" = @{
            command = "npx"
            args    = @("-y", "@upstash/context7-mcp")
        }
        "sequential-thinking" = @{
            command = "npx"
            args    = @("-y", "@modelcontextprotocol/server-sequential-thinking")
        }
        "playwright" = @{
            command = "npx"
            args    = @("-y", "@playwright/mcp@latest")
        }
    }
}

$config | ConvertTo-Json -Depth 6 | Set-Content -Path $cfgFile -Encoding UTF8
Write-Host "[완료] MCP 설정 생성: $cfgFile" -ForegroundColor Green
Write-Host "[다음] Claude Desktop을 완전히 종료 후 다시 실행하세요." -ForegroundColor Cyan
Get-Content $cfgFile
```

### 실행

```powershell
C:\dev\setup\setup-mcp-config.ps1
```

> ⚠️ 실행 후 **Claude Desktop 완전 종료 → 재실행**해야 MCP가 반영됩니다.
> (작업표시줄 아이콘 우클릭 → 종료 → 다시 실행)

## 2-3. 검증 스크립트 — `verify-fde-all.ps1`

```powershell
notepad C:\dev\setup\verify-fde-all.ps1
```

```powershell
# =====================================================================
# FDE 기초과정 - 실습환경 검증 (10종)
# 실행: 새 PowerShell 창 (일반 권한 가능)
# =====================================================================
$rows = @()
function Add-Row($no, $name, $ok, $detail) {
    $script:rows += [pscustomobject]@{
        No   = $no
        항목 = $name
        결과 = $(if ($ok) { "PASS" } else { "FAIL" })
        상세 = $detail
    }
}
function Get-Ver($cmd, $argline) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        try { return (& $cmd $argline 2>$null | Select-Object -First 1) } catch { return $null }
    }
    return $null
}

Write-Host "=== FDE 실습환경 검증 (10종) ===" -ForegroundColor Cyan

# 1) VS Code
$v = Get-Ver "code" "--version"
Add-Row 1 "VS Code" ([bool]$v) $(if ($v) { $v } else { "code 명령 없음 (PowerShell 재시작)" })

# 2) Git
$v = Get-Ver "git" "--version"
Add-Row 2 "Git" ([bool]$v) $(if ($v) { $v } else { "git 명령 없음 (PATH 옵션 확인)" })

# 2-1) Git 초기설정
$uname = git config --global user.name
$umail = git config --global user.email
Add-Row "2+" "Git 초기설정" ([bool]($uname -and $umail)) $(if ($uname) { "$uname <$umail>" } else { "user.name/email 미설정" })

# 3) Claude Desktop
$paths = @("$env:LOCALAPPDATA\AnthropicClaude", "$env:LOCALAPPDATA\Programs\claude-desktop", "$env:PROGRAMFILES\Claude")
$found = $paths | Where-Object { Test-Path $_ } | Select-Object -First 1
Add-Row 3 "Claude Desktop" ([bool]$found) $(if ($found) { $found } else { "설치 경로 없음 (PART 3-3)" })

# 4) Node.js
$v = Get-Ver "node" "--version"
Add-Row 4 "Node.js" ([bool]$v) $(if ($v) { $v } else { "node 명령 없음" })
$v = Get-Ver "npm" "--version"
Add-Row "4+" "npm" ([bool]$v) $(if ($v) { $v } else { "npm 명령 없음" })

# 5) Claude Code CLI
$v = Get-Ver "claude" "--version"
Add-Row 5 "Claude Code CLI" ([bool]$v) $(if ($v) { $v } else { "claude 명령 없음 (npm 설치 확인)" })

# 6) LibreOffice
$so = @("$env:PROGRAMFILES\LibreOffice\program\soffice.exe", "${env:PROGRAMFILES(X86)}\LibreOffice\program\soffice.exe") |
      Where-Object { Test-Path $_ } | Select-Object -First 1
Add-Row 6 "LibreOffice" ([bool]$so) $(if ($so) { $so } else { "soffice.exe 없음" })

# 7~10) MCP 설정 확인
$cfgFile = Join-Path $env:APPDATA "Claude\claude_desktop_config.json"
if (Test-Path $cfgFile) {
    try {
        $cfg  = Get-Content $cfgFile -Raw | ConvertFrom-Json
        $keys = $cfg.mcpServers.PSObject.Properties.Name
        foreach ($m in @("filesystem","context7","sequential-thinking","playwright")) {
            $no = switch ($m) { "filesystem" {7} "context7" {8} "sequential-thinking" {9} "playwright" {10} }
            Add-Row $no "MCP: $m" ($keys -contains $m) $(if ($keys -contains $m) { "설정됨" } else { "config에 없음" })
        }
    } catch {
        Add-Row "7-10" "MCP 설정" $false "JSON 문법 오류 - 파일을 확인하세요"
    }
} else {
    Add-Row "7-10" "MCP 설정" $false "config 파일 없음 (setup-mcp-config.ps1 실행)"
}

$rows | Format-Table -AutoSize
$fail = ($rows | Where-Object { $_.결과 -eq "FAIL" }).Count
if ($fail -eq 0) {
    Write-Host "`n[완료] 모든 항목 PASS - 실습 준비 완료!" -ForegroundColor Green
} else {
    Write-Host "`n[확인 필요] FAIL $fail 건 - PART 5 트러블슈팅을 참고하세요." -ForegroundColor Yellow
}
Write-Host "`n[남은 확인] Claude Desktop을 실행해 MCP 커넥터 4개가 보이는지 확인하세요 (PART 4-3)." -ForegroundColor Cyan
```

### 실행

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
C:\dev\setup\verify-fde-all.ps1
```

### 정상 결과 예시

```text
No  항목             결과  상세
--  ----             ----  ----
1   VS Code          PASS  1.95.3
2   Git              PASS  git version 2.47.0.windows.1
2+  Git 초기설정     PASS  홍길동 <hong@company.com>
3   Claude Desktop   PASS  C:\Users\사용자\AppData\Local\AnthropicClaude
4   Node.js          PASS  v20.18.0
4+  npm              PASS  10.8.2
5   Claude Code CLI  PASS  1.x.x
6   LibreOffice      PASS  C:\Program Files\LibreOffice\program\soffice.exe
7   MCP: filesystem  PASS  설정됨
8   MCP: context7    PASS  설정됨
9   MCP: sequential-thinking  PASS  설정됨
10  MCP: playwright  PASS  설정됨

[완료] 모든 항목 PASS - 실습 준비 완료!
```

---

# PART 3. 수동 따라하기 (경로 ③)

## 3-1. Visual Studio Code

**무엇을·왜**: 코드·문서 편집기. 폴더 구조와 `CLAUDE.md` 같은 파일을 눈으로 보고 편집합니다.

### ⓐ 다운로드
1. 브라우저에서 <https://code.visualstudio.com/> 접속
2. 파란색 **Download for Windows** 클릭
3. `VSCodeUserSetup-x64-<버전>.exe` 다운로드 (보통 `다운로드` 폴더)

### ⓑ 설치
1. 받은 `.exe` **더블클릭**
2. 사용권 계약 → **동의합니다** → 다음
3. 설치 위치 → **기본값 그대로** → 다음
4. **추가 작업 선택**에서 아래 3개를 **반드시 체크** ✅
   - "Code(으)로 열기" 작업을 Windows 탐색기 **파일** 상황에 맞는 메뉴에 추가
   - "Code(으)로 열기" 작업을 Windows 탐색기 **디렉터리** 상황에 맞는 메뉴에 추가
   - **PATH에 추가**(다시 시작한 후 사용 가능)
5. 설치 → 완료

### ⓒ 확인
```powershell
code --version
```
→ 버전 3줄이 출력되면 성공.

### ⓓ 막힐 때
- `code`를 찾을 수 없음 → **PowerShell 새로 열기**. 그래도 안 되면 4번 **PATH에 추가** 체크 후 재설치.

---

## 3-2. Git for Windows

**무엇을·왜**: 변경 이력 관리 + **Git Bash** 터미널 제공. Claude Code 사용 시 권장 환경입니다.

### ⓐ 다운로드
1. <https://git-scm.com/download/win> 접속
2. **64-bit Git for Windows Setup** 클릭 → `Git-<버전>-64-bit.exe` 다운로드

### ⓑ 설치
1. `.exe` 더블클릭 → Next
2. 설치 위치 기본값 → Next
3. 구성 요소 기본값 → Next
4. 시작 메뉴 기본값 → Next
5. **기본 편집기 선택**: `Use Visual Studio Code as Git default editor` → Next
6. **초기 브랜치 이름**: `Let Git decide` (기본) → Next
7. ⭐ **PATH 설정**: `Git from the command line and also from 3rd-party software` (**가운데, 권장**) → Next
8. 이후 항목은 **모두 기본값**으로 Next → Install → Finish

### ⓒ 확인
```powershell
git --version
```
→ `git version 2.x.x` 출력되면 성공.

### ⓓ 초기 설정 (본인 정보) — **필수**
```powershell
git config --global user.name "홍길동"
git config --global user.email "hong@example.com"
```
설정 확인:
```powershell
git config --global --list
```

### ⓔ 막힐 때
- `git`을 찾을 수 없음 → 7번 PATH 설정을 **가운데 옵션**으로 다시 설치.

---

## 3-3. Claude Desktop

**무엇을·왜**: **강의의 주 실습 환경**. 대화·파일 작업, MCP 커넥터 연결에 사용합니다.

### ⓐ 다운로드
1. <https://claude.ai/download> 접속
2. **Download for Windows** 클릭 → 설치 파일 다운로드

### ⓑ 설치
1. 받은 설치 파일 **더블클릭** (자동 설치 진행)
2. 보안 경고가 뜨면 → **추가 정보** → **실행**
3. 설치 완료 후 **Claude** 앱 실행

### ⓒ 로그인 — **필수**
1. **Continue with Google** 또는 **이메일로 로그인** 선택
2. 교육용으로 안내받은 계정으로 로그인
3. 로그인 후 **대화 입력창**이 보이면 완료

### ⓓ 확인
대화창에 아래를 입력해 답이 오면 성공:
```text
안녕하세요. 지금 제 PC에서 잘 동작하는지 한 줄로 알려주세요.
```

### ⓔ 막힐 때
- 로그인 실패 → 사내망 차단 가능. 모바일 핫스팟으로 시도하거나 IT 담당 문의.

---

## 3-4. Node.js (LTS) ⭐ 필수 선행

**무엇을·왜**: JavaScript 실행 환경. **Claude Code CLI와 MCP 서버 4종이 모두 Node.js 위에서 동작**합니다.

### ⓐ 다운로드
1. <https://nodejs.org/> 접속
2. **LTS** (안정 버전, 왼쪽 초록 버튼) 클릭 → `node-v<버전>-x64.msi` 다운로드
   > ⚠️ Current(최신) 말고 **LTS**를 받으세요.

### ⓑ 설치
1. `.msi` 더블클릭 → Next
2. 사용권 동의 → Next
3. 설치 위치 기본값 → Next
4. **Custom Setup**: 기본값 유지 (`Add to PATH` 포함) → Next
5. **Tools for Native Modules**: 체크 없이 진행해도 무방 → Next
6. Install → (관리자 권한 "예") → Finish

### ⓒ 확인
```powershell
node --version
```
```powershell
npm --version
```
→ `v20.x.x` / `10.x.x` 형태로 각각 출력되면 성공.

### ⓓ 막힐 때
- `node`를 찾을 수 없음 → **PowerShell 창을 완전히 닫고 새로 열기**. 그래도 안 되면 PC 재부팅.

---

## 3-5. Claude Code CLI

**무엇을·왜**: 터미널에서 동작하는 **에이전트형 개발 도구**. 폴더 전체를 읽고 파일을 직접 만들고 고칩니다.

### ⓐ 설치 (다운로드 페이지 없이 명령으로 설치)
```powershell
npm install -g @anthropic-ai/claude-code
```
> 설치에 1~3분 소요됩니다. 진행 표시가 멈춘 듯 보여도 기다려 주세요.

### ⓑ 확인
```powershell
claude --version
```
→ 버전이 출력되면 성공.

### ⓒ 첫 실행 (로그인)
1. 실습 폴더를 만들고 이동합니다.
```powershell
mkdir C:\dev\fde
```
```powershell
cd C:\dev\fde
```
2. Claude Code를 실행합니다.
```powershell
claude
```
3. 안내에 따라 **브라우저 로그인** → 터미널로 돌아오면 준비 완료
4. 첫 프롬프트를 입력해 봅니다.
```text
현재 폴더에 어떤 파일이 있는지 알려줘.
```
5. 종료는 `/exit` 또는 `Ctrl + C` 두 번

### ⓓ 막힐 때
- 권한 오류(EACCES/EPERM) → PowerShell을 **관리자 권한으로 실행** 후 재시도
- 사내 프록시 환경 → 아래 설정 후 재시도
```powershell
npm config set strict-ssl false
```

---

## 3-6. LibreOffice

**무엇을·왜**: 산출물(PPTX·XLSX·DOCX)을 열어 확인하고 **PDF로 변환**하는 데 사용합니다.

### ⓐ 다운로드
1. <https://www.libreoffice.org/download/download-libreoffice/> 접속
2. Windows(x86_64) 선택 → **DOWNLOAD** 클릭 → `LibreOffice_<버전>_Win_x86-64.msi`

### ⓑ 설치
1. `.msi` 더블클릭 → 다음
2. 설치 유형: **일반(Typical)** → 다음
3. 설치 → (관리자 권한 "예") → 마침

### ⓒ 확인
```powershell
& "C:\Program Files\LibreOffice\program\soffice.exe" --version
```
→ `LibreOffice 2x.x.x.x` 출력되면 성공.

### ⓓ 활용 예 (PPTX → PDF 변환)
```powershell
& "C:\Program Files\LibreOffice\program\soffice.exe" --headless --convert-to pdf "C:\dev\fde\sample.pptx"
```

### ⓔ 막힐 때
- 경로 오류 → `C:\Program Files (x86)\LibreOffice\program\soffice.exe` 경로도 확인.

---

## 3-7. MCP 공통 — 설정 파일 위치

> **MCP란?** AI와 외부 도구·데이터를 잇는 **표준 연결 방식(만능 콘센트)**입니다.
> 아래 4종은 모두 **Node.js(npx)** 위에서 동작하므로 **3-4를 먼저 완료**해야 합니다.

Claude Desktop의 MCP 설정 파일 경로:
```text
%APPDATA%\Claude\claude_desktop_config.json
```

파일 열기 (VS Code):
```powershell
code "$env:APPDATA\Claude\claude_desktop_config.json"
```

파일이 없다면 먼저 생성:
```powershell
New-Item -ItemType Directory -Force "$env:APPDATA\Claude" | Out-Null
New-Item -ItemType File -Force "$env:APPDATA\Claude\claude_desktop_config.json" | Out-Null
```

**⚠️ 중요**: 설정을 바꾼 뒤에는 **Claude Desktop을 완전히 종료 후 재실행**해야 반영됩니다.
(작업표시줄 아이콘 우클릭 → 종료 → 다시 실행)

---

## 3-8. MCP: filesystem

**무엇을·왜**: 내 PC의 **지정한 폴더**를 Claude가 읽고 쓸 수 있게 합니다. (실습 폴더 연결용)

### ⓐ 사전 다운로드 · 동작 확인
```powershell
npx -y @modelcontextprotocol/server-filesystem --help
```
> 최초 실행 시 자동 다운로드됩니다. 도움말이 출력되면 정상.

### ⓑ 설정 (claude_desktop_config.json)
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "C:\\dev\\fde"]
    }
  }
}
```
> 마지막 인자가 **허용 폴더**입니다. 경로의 역슬래시는 `\\` 두 개로 씁니다.

### ⓒ Claude Code에서 추가 (선택)
```powershell
claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem C:\dev\fde
```

### ⓓ 확인 (Claude Desktop 재시작 후)
```text
filesystem 도구로 연결된 폴더의 파일 목록을 보여줘.
```

---

## 3-9. MCP: context7

**무엇을·왜**: 최신 **라이브러리·프레임워크 공식 문서**를 실시간으로 가져옵니다. (개발 참고용)

### ⓐ 사전 다운로드 · 동작 확인
```powershell
npx -y @upstash/context7-mcp --help
```

### ⓑ 설정
```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

### ⓒ Claude Code에서 추가 (선택)
```powershell
claude mcp add context7 -- npx -y @upstash/context7-mcp
```

### ⓓ 확인
```text
context7로 최신 React 공식 문서에서 useState 사용법을 요약해줘.
```

---

## 3-10. MCP: sequential-thinking

**무엇을·왜**: 복잡한 문제를 **단계적으로 나눠 사고**하도록 돕습니다. (분석·설계 품질 향상)

### ⓐ 사전 다운로드 · 동작 확인
```powershell
npx -y @modelcontextprotocol/server-sequential-thinking --help
```

### ⓑ 설정
```json
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
```

### ⓒ Claude Code에서 추가 (선택)
```powershell
claude mcp add sequential-thinking -- npx -y @modelcontextprotocol/server-sequential-thinking
```

### ⓓ 확인
```text
sequential-thinking을 사용해서 "회의실 예약 앱 기능 정의"를 단계별로 정리해줘.
```

---

## 3-11. MCP: playwright

**무엇을·왜**: **브라우저를 자동 조작**해 웹 화면에서 데이터를 가져오거나 화면을 캡처합니다.

### ⓐ 브라우저 엔진 설치 (필수 · 5~10분 소요)
```powershell
npx -y playwright install chromium
```

### ⓑ 사전 다운로드 · 동작 확인
```powershell
npx -y @playwright/mcp@latest --help
```

### ⓒ 설정
```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["-y", "@playwright/mcp@latest"]
    }
  }
}
```

### ⓓ Claude Code에서 추가 (선택)
```powershell
claude mcp add playwright -- npx -y @playwright/mcp@latest
```

### ⓔ 확인
```text
playwright로 https://example.com 을 열고 페이지 제목을 알려줘.
```

---

## 3-12. MCP 4종 통합 설정 (복사해서 사용)

`claude_desktop_config.json` 전체를 아래 내용으로 교체하면 4종이 한 번에 등록됩니다.
**`C:\\dev\\fde` 부분만 본인 실습 폴더로 바꾸세요.**

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "C:\\dev\\fde"]
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "@playwright/mcp@latest"]
    }
  }
}
```

> 저장 후 **Claude Desktop 완전 종료 → 재실행** → 설정에서 커넥터 4개가 보이면 성공.

Claude Code에서 목록 확인:
```powershell
claude mcp list
```

---

# PART 4. 최종 검증 체크리스트 (공통 · 필수)

어떤 경로로 설치했든 **아래 항목을 모두 확인**하세요.

## 4-1. 체크리스트

| # | 항목 | 확인 방법 | 정상 결과 | 완료 |
|---|---|---|---|---|
| 1 | VS Code | `code --version` | 버전 3줄 출력 | ☐ |
| 2 | Git | `git --version` | `git version 2.x.x` | ☐ |
| 2+ | Git 초기설정 | `git config --global --list` | user.name / user.email 표시 | ☐ |
| 3 | Claude Desktop | 앱 로그인 후 대화 응답 | 응답이 돌아옴 | ☐ |
| 4 | Node.js (LTS) | `node --version` | `v20.x.x` (LTS) | ☐ |
| 4+ | npm | `npm --version` | `10.x.x` | ☐ |
| 5 | Claude Code CLI | `claude --version` | 버전 출력 | ☐ |
| 6 | LibreOffice | `soffice.exe --version` | `LibreOffice 2x.x` | ☐ |
| 7 | MCP filesystem | 폴더 파일 목록 요청 | 목록 응답 | ☐ |
| 8 | MCP context7 | 라이브러리 문서 요청 | 문서 요약 응답 | ☐ |
| 9 | MCP sequential-thinking | 단계별 정리 요청 | 단계 분해 응답 | ☐ |
| 10 | MCP playwright | 페이지 제목 요청 | 제목 응답 | ☐ |

## 4-2. 한 번에 확인 (복사해 실행)

```powershell
code --version; git --version; node --version; npm --version; claude --version
```
→ 5개 모두 버전이 출력되면 정상입니다.

## 4-3. 최종 확인 프롬프트 (Claude Desktop에 붙여넣기)

```text
너는 실습 환경 점검 담당자야.
지금 연결된 MCP 도구 목록을 확인하고,
filesystem·context7·sequential-thinking·playwright 4개가 모두 연결되었는지
[도구 | 연결여부 | 확인방법] 표로 정리해줘.
연결되지 않은 것이 있으면 원인과 해결 방법을 한 줄씩 알려줘.
```

> ✅ 10개 항목이 모두 정상이면 **실습 준비 완료**입니다.

---

# PART 5. 트러블슈팅 (증상별)

| 증상 | 원인 | 해결 |
|---|---|---|
| `xxx을(를) 찾을 수 없습니다` | PATH 미반영 | PowerShell 창 **완전히 닫고 새로 열기** → 안 되면 재부팅 |
| `winget : 용어를 인식할 수 없습니다` | 앱 설치 관리자 없음 | Microsoft Store에서 **앱 설치 관리자** 설치, 또는 **PART 3 수동 설치** |
| 스크립트 실행이 차단됨 | 실행 정책 제한 | `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force` 후 재시도 |
| `npm install` 권한 오류(EACCES/EPERM) | 관리자 권한 아님 | PowerShell 우클릭 → **관리자 권한으로 실행** |
| `npm`/`npx` 없음 | Node.js 미설치·PATH 미반영 | Node.js(3-4) 설치 확인 → PowerShell 새로 열기 |
| 사내망에서 다운로드 실패 | 방화벽·프록시 | 핫스팟으로 시도 또는 IT 담당에 도메인 허용 요청 |
| MCP가 목록에 안 보임 | 재시작 안 함 / JSON 오류 | Claude Desktop **완전 종료 후 재실행**, JSON 문법 확인 |
| JSON 저장 후 앱 오류 | 문법 오류 | 마지막 항목 뒤 **쉼표 금지**, 경로는 `\\` 사용 |
| `npx` 최초 실행이 느림 | 패키지 다운로드 중 | 1~3분 대기 (정상) |
| playwright 실행 실패 | 브라우저 엔진 미설치 | `npx -y playwright install chromium` 재실행 |
| winget에서 Claude 패키지를 못 찾음 | 패키지 ID 변경/미등록 | <https://claude.ai/download> 에서 **직접 다운로드**(3-3) |
| Node.js가 LTS가 아님 | Current 버전 설치 | 제거 후 <https://nodejs.org/> 에서 **LTS** 재설치 |

---

# 부록 A. 전체 명령어 요약 (순서대로)

```powershell
# 1) 기본 도구 확인
code --version
git --version

# 2) Git 초기 설정
git config --global user.name "홍길동"
git config --global user.email "hong@example.com"

# 3) Node.js 확인 (LTS)
node --version
npm --version

# 4) Claude Code CLI 설치·확인
npm install -g @anthropic-ai/claude-code
claude --version

# 5) 실습 폴더 생성·이동
mkdir C:\dev\fde
cd C:\dev\fde

# 6) LibreOffice 확인
& "C:\Program Files\LibreOffice\program\soffice.exe" --version

# 7) MCP 4종 사전 다운로드
npx -y @modelcontextprotocol/server-filesystem --help
npx -y @upstash/context7-mcp --help
npx -y @modelcontextprotocol/server-sequential-thinking --help
npx -y @playwright/mcp@latest --help
npx -y playwright install chromium

# 8) MCP 설정 파일 열기
code "$env:APPDATA\Claude\claude_desktop_config.json"

# 9) MCP 목록 확인 (Claude Code)
claude mcp list
```

---

# 부록 B. 제거 / 재설치

```powershell
# 제거 (winget 설치분)
winget uninstall --id Microsoft.VisualStudioCode -e
winget uninstall --id Git.Git -e
winget uninstall --id Anthropic.Claude -e
winget uninstall --id OpenJS.NodeJS.LTS -e
winget uninstall --id TheDocumentFoundation.LibreOffice -e

# Claude Code CLI 제거
npm uninstall -g @anthropic-ai/claude-code

# 재설치 (설치 스크립트 재실행)
C:\dev\setup\install-fde-all.ps1
C:\dev\setup\setup-mcp-config.ps1
```

> Git 설정(`user.name`·`user.email`)과 MCP 설정 파일은 제거해도 남아 있을 수 있습니다.
> 재설치 후 **PART 4 검증**으로 확인하세요.

---

## 요약 — 3줄 정리

1. **경로 3가지 중 하나만** 선택 (프롬프트 / 스크립트 / 수동)
2. **Node.js(4번)를 먼저** — 5번·7~10번이 모두 여기에 의존
3. 설치 후 **PART 4 체크리스트 10개**를 확인하고, 막히면 **PART 5**에서 증상으로 찾기

> 📌 관련 문서: Git·Claude Desktop 2종만 빠르게 설치하려면
> **`설치가이드_Git_ClaudeDesktop_Windows11.md`** 를 참고하세요.
