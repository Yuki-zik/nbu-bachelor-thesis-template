\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nbubachelor}[2026/04/28 Reusable bachelor thesis template]
\LoadClass[UTF8,openany,twoside,fontset=fandol]{ctexbook}

% =========================
% 基础宏包与学校论文版式
% =========================
\RequirePackage[a4paper,asymmetric,left=2.5cm,right=2.0cm,top=2.5cm,bottom=2.0cm,headheight=15pt,headsep=0.6cm,footskip=0.8cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{array,booktabs,longtable,multirow,tabularx}
\RequirePackage{amsmath,amssymb,amsthm,bm}
\RequirePackage{unicode-math}
\RequirePackage{enumitem}
\RequirePackage{caption,subcaption,float}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{tocloft}
\RequirePackage{etoolbox}
\RequirePackage[
    backend=biber,
    style=gb7714-2015,
    sorting=none,
    maxbibnames=3,
    minbibnames=3,
    gbnamefmt=lowercase,
    doi=false,
    url=false,
    eprint=false
]{biblatex}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=blue,
    pdftitle={宁波大学本科毕业设计（论文）模板},
    pdfauthor={宁波大学}
}

% =========================
% 字体与正文段落
% =========================
% 模板默认从项目 fonts/ 目录加载字体，便于复制后直接编译。
\IfFileExists{fonts/texgyretermes-regular.otf}
{\setmainfont[
        Path=fonts/,
        UprightFont=texgyretermes-regular.otf,
        BoldFont=texgyretermes-bold.otf,
        ItalicFont=texgyretermes-italic.otf,
        BoldItalicFont=texgyretermes-bolditalic.otf
    ]{texgyretermes-regular.otf}
    \newfontfamily\NBU@latin[
        Path=fonts/,
        UprightFont=texgyretermes-regular.otf,
        BoldFont=texgyretermes-bold.otf,
        ItalicFont=texgyretermes-italic.otf,
        BoldItalicFont=texgyretermes-bolditalic.otf
    ]{texgyretermes-regular.otf}}
{\IfFontExistsTF{Times New Roman}
    {\setmainfont{Times New Roman}\newfontfamily\NBU@latin{Times New Roman}}
    {\setmainfont{TeX Gyre Termes}\newfontfamily\NBU@latin{TeX Gyre Termes}}}
\IfFileExists{fonts/texgyretermes-math.otf}
{\setmathfont[Path=fonts/]{texgyretermes-math.otf}}
{\IfFontExistsTF{texgyretermes-math.otf}{\setmathfont{texgyretermes-math.otf}}{\setmathfont{Latin Modern Math}}}
\IfFileExists{fonts/latinmodern-math.otf}
{\setmathfont[Path=fonts/,range={cal,bfcal},Scale=MatchUppercase]{latinmodern-math.otf}}
{\IfFontExistsTF{latinmodern-math.otf}{\setmathfont{latinmodern-math.otf}[range={cal,bfcal},Scale=MatchUppercase]}{}}
\IfFileExists{fonts/FandolSong-Regular.otf}
{\newCJKfontfamily\NBU@songti[Path=fonts/,BoldFont=FandolSong-Bold.otf]{FandolSong-Regular.otf}}
{\IfFontExistsTF{Songti SC}{\newCJKfontfamily\NBU@songti{Songti SC}}{\newcommand{\NBU@songti}{\songti}}}
\IfFileExists{fonts/FandolHei-Regular.otf}
{\newCJKfontfamily\NBU@heiti[Path=fonts/,BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}}
{\newcommand{\NBU@heiti}{\heiti}}
\IfFileExists{fonts/FandolKai-Regular.otf}
{\newCJKfontfamily\NBU@kaiti[Path=fonts/,BoldFont=FandolKai-Regular.otf,AutoFakeBold=2.5]{FandolKai-Regular.otf}}
{\newcommand{\NBU@kaiti}{\kaishu}}
\newcommand{\NBU@simsun}{\NBU@songti}

\IfFileExists{fonts/texgyretermes-regular.otf}
{\newfontfamily\NBU@abstractlatin[
        Path=fonts/,
        Scale=1.142857,
        UprightFont=texgyretermes-regular.otf,
        BoldFont=texgyretermes-bold.otf,
        ItalicFont=texgyretermes-italic.otf,
        BoldItalicFont=texgyretermes-bolditalic.otf
    ]{texgyretermes-regular.otf}}
{\IfFontExistsTF{Times New Roman}
    {\newfontfamily\NBU@abstractlatin[Scale=1.142857]{Times New Roman}}
    {\newfontfamily\NBU@abstractlatin[Scale=1.142857]{TeX Gyre Termes}}}
\IfFileExists{fonts/FandolKai-Regular.otf}
{\newCJKfontfamily\NBU@abstractkaiti[Path=fonts/,Scale=1.142857,BoldFont=FandolKai-Regular.otf,AutoFakeBold=2.5]{FandolKai-Regular.otf}}
{\IfFontExistsTF{KaiTi}
    {\newCJKfontfamily\NBU@abstractkaiti[Scale=1.142857]{KaiTi}}
    {\IfFontExistsTF{STKaiti}
        {\newCJKfontfamily\NBU@abstractkaiti[Scale=1.142857]{STKaiti}}
        {\IfFontExistsTF{Kaiti SC}
            {\newCJKfontfamily\NBU@abstractkaiti[Scale=1.142857]{Kaiti SC}}
            {\IfFontExistsTF{FandolKai-Regular.otf}
                {\newCJKfontfamily\NBU@abstractkaiti[Scale=1.142857]{FandolKai-Regular.otf}}
                {\newcommand{\NBU@abstractkaiti}{\NBU@kaiti}}}}}}
\newcommand{\NBU@abstractbodyfont}{\NBU@abstractkaiti\NBU@abstractlatin\zihao{-4}}

\setstretch{1.5}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\raggedbottom
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}
\AtBeginDocument{\NBU@songti\zihao{-4}}

% book/ctexbook 的 \frontmatter 会调用 \cleardoublepage，可能在目录后插入空白偶数页。
% 模板使用单页清页版本，保持目录后直接进入中文摘要。
\newcommand{\nbufrontmatter}{\clearpage\@mainmatterfalse\pagenumbering{roman}}
\newcommand{\nbumainmatter}{\clearpage\@mainmattertrue\pagenumbering{arabic}}

% =========================
% 论文元信息命令
% =========================
\newcommand{\NBU@university}{宁波大学}
\newcommand{\NBU@titlecn}{中文论文题目占位}
\newcommand{\NBU@titleen}{English Thesis Title Placeholder}
\newcommand{\NBU@college}{信息科学与工程学院}
\newcommand{\NBU@major}{专业名称}
\newcommand{\NBU@class}{班级名称}
\newcommand{\NBU@id}{学号占位}
\newcommand{\NBU@author}{作者姓名}
\newcommand{\NBU@supervisor}{指导教师姓名}
\newcommand{\NBU@date}{YYYY.MM.DD}
\newcommand{\NBU@declarationdate}{YYYY 年 MM 月 DD 日}
\newcommand{\NBU@keywords}{关键词一；关键词二；关键词三}
\newcommand{\NBU@enkeywords}{Keyword One; Keyword Two; Keyword Three}
\newcommand{\NBU@coverlogo}{figures/nbu_cover_header.png}

\newcommand{\universityname}[1]{\gdef\NBU@university{#1}}
\newcommand{\titlecn}[1]{\gdef\NBU@titlecn{#1}}
\newcommand{\titleen}[1]{\gdef\NBU@titleen{#1}}
\newcommand{\college}[1]{\gdef\NBU@college{#1}}
\newcommand{\majorname}[1]{\gdef\NBU@major{#1}}
\newcommand{\classname}[1]{\gdef\NBU@class{#1}}
\newcommand{\studentid}[1]{\gdef\NBU@id{#1}}
\newcommand{\authorname}[1]{\gdef\NBU@author{#1}}
\newcommand{\supervisor}[1]{\gdef\NBU@supervisor{#1}}
\newcommand{\finishdate}[1]{\gdef\NBU@date{#1}}
\newcommand{\declarationdate}[1]{\gdef\NBU@declarationdate{#1}}
\newcommand{\keywordszh}[1]{\gdef\NBU@keywords{#1}}
\newcommand{\keywordsen}[1]{\gdef\NBU@enkeywords{#1}}
\newcommand{\coverlogofile}[1]{\gdef\NBU@coverlogo{#1}}

% =========================
% 图、表、公式编号与题注格式
% =========================
% 图题/表题：宋体五号，英文 Times，1.5 倍行距，居中；编号格式为 图1-1 / 表1-1。
\DeclareCaptionFont{nbucaption}{\NBU@songti\NBU@latin\zihao{5}}
\DeclareCaptionLabelFormat{nbu}{#1#2}
\DeclareCaptionLabelSeparator{nbutwospace}{\space\space}
\captionsetup{
    font={nbucaption,stretch=1.5},
    labelfont=nbucaption,
    labelformat=nbu,
    labelsep=nbutwospace,
    justification=centering,
    parindent=0pt,
    singlelinecheck=false,
    skip=3pt
}
\setlength{\textfloatsep}{6pt plus 1pt minus 1pt}
\setlength{\floatsep}{6pt plus 1pt minus 1pt}
\setlength{\intextsep}{6pt plus 1pt minus 1pt}
\setlength{\abovecaptionskip}{3pt}
\setlength{\belowcaptionskip}{0pt}
\setlength{\@fptop}{0pt}
\setlength{\@fpsep}{6pt plus 1fil}
\setlength{\@fpbot}{0pt plus 1fil}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\def\tagform@#1{\maketag@@@{\normalfont\zihao{5}(#1)}}

% 普通表格默认五号、1.5 倍行距；复杂实验表可在表格前调用 \nbucompacttable。
\setlength{\heavyrulewidth}{0.08em}
\setlength{\lightrulewidth}{0.05em}
\setlength{\cmidrulewidth}{0.03em}
\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\newcolumntype{Z}{>{\centering\arraybackslash}X}
\newif\ifNBU@compacttable
\NBU@compacttablefalse
\newcommand{\NBU@standardtablefont}{\centering\songti\NBU@latin\zihao{5}\setstretch{1.5}\renewcommand{\arraystretch}{1.0}}
\newcommand{\NBU@compacttablefont}{\centering\songti\NBU@latin\zihao{-5}\setstretch{1}\renewcommand{\arraystretch}{1.12}}
\newcommand{\nbutablefont}{\ifNBU@compacttable\NBU@compacttablefont\else\NBU@standardtablefont\fi}
\newcommand{\nbucompacttable}{\NBU@compacttabletrue}
\AtBeginEnvironment{tabular}{\nbutablefont}
\AtBeginEnvironment{tabularx}{\nbutablefont}
\AtBeginEnvironment{longtable}{\nbutablefont}
\AtEndEnvironment{tabular}{\NBU@compacttablefalse}
\AtEndEnvironment{tabularx}{\NBU@compacttablefalse}
\AtEndEnvironment{longtable}{\NBU@compacttablefalse}

% =========================
% 标题层级与目录格式
% =========================
\newcommand{\NBU@chapterfont}{\NBU@heiti\NBU@latin\mdseries\fontsize{18bp}{27bp}\selectfont}
\newcommand{\NBU@sectionfont}{\NBU@heiti\NBU@latin\mdseries\fontsize{15bp}{22.5bp}\selectfont}
\newcommand{\NBU@subsectionfont}{\NBU@heiti\NBU@latin\mdseries\fontsize{14bp}{21bp}\selectfont}
\ctexset{
    chapter = {format = \centering\NBU@chapterfont, name = {,}, number = \arabic{chapter}, fixskip = true, beforeskip = 13.5bp, afterskip = 26bp},
    section = {format = \raggedright\NBU@sectionfont, beforeskip = 5bp, afterskip = 6bp},
    subsection = {format = \raggedright\NBU@subsectionfont, beforeskip = 0pt, afterskip = 0pt}
}
\renewcommand{\contentsname}{目\quad 录}
\newcommand{\NBU@toctitlefont}{\NBU@heiti\mdseries\fontsize{18bp}{32bp}\selectfont}
\newcommand{\NBU@tocentryfont}{\NBU@songti\NBU@latin\fontsize{10.5bp}{12.6bp}\selectfont}
\renewcommand{\cfttoctitlefont}{\hfill\NBU@toctitlefont}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{17bp}
\setlength{\cftaftertoctitleskip}{17bp}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\renewcommand{\cftdotsep}{0.45}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchapleader}{\normalfont\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapfont}{\NBU@tocentryfont}
\renewcommand{\cftchappagefont}{\NBU@tocentryfont}
\renewcommand{\cftsecfont}{\NBU@tocentryfont}
\renewcommand{\cftsecpagefont}{\NBU@tocentryfont}
\renewcommand{\cftsubsecfont}{\NBU@tocentryfont}
\renewcommand{\cftsubsecpagefont}{\NBU@tocentryfont}
\newcommand{\NBU@tocafterpnum}{\par\vspace{-7bp}}
\renewcommand{\cftchapafterpnum}{\NBU@tocafterpnum}
\renewcommand{\cftsecafterpnum}{\NBU@tocafterpnum}
\renewcommand{\cftsubsecafterpnum}{\NBU@tocafterpnum}
\let\NBU@origtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
    \begingroup
    \setstretch{1}\setcounter{tocdepth}{2}\setlength{\parindent}{0pt}\setlength{\parskip}{0pt}%
    \@cfttocstart\par
    \begingroup
    \parindent\z@\parskip\cftparskip\@cftmaketoctitle
    \NBU@tocentryfont\setstretch{1}\@starttoc{toc}%
    \endgroup
    \@cfttocfinish
    \endgroup}

% =========================
% 页眉页脚、封面、诚信页、摘要、致谢
% =========================
\newcommand{\NBU@headerfont}{\NBU@songti\zihao{5}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[CE]{\NBU@headerfont \NBU@university\NBU@college 本科毕业设计（论文）}
\fancyhead[CO]{\NBU@headerfont \NBU@titlecn}
\fancyfoot[C]{\NBU@headerfont \thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{\fancyhf{}\fancyhead[CE]{\NBU@headerfont \NBU@university\NBU@college 本科毕业设计（论文）}\fancyhead[CO]{\NBU@headerfont \NBU@titlecn}\fancyfoot[C]{\NBU@headerfont \thepage}\renewcommand{\headrulewidth}{0.4pt}\renewcommand{\footrulewidth}{0pt}}

\newcommand{\makecover}{%
    \clearpage\thispagestyle{empty}\begingroup\setstretch{1}\centering
    \vspace*{-0.45cm}
    \ifdefempty{\NBU@coverlogo}
    {{\NBU@heiti\fontsize{22pt}{28pt}\selectfont \NBU@university\par}\vspace{0.35cm}{\NBU@songti\zihao{4}（宁波大学封面标识）\par}}
    {\IfFileExists{\NBU@coverlogo}{\includegraphics[width=11.1cm]{\NBU@coverlogo}\par}{{\NBU@heiti\fontsize{22pt}{28pt}\selectfont \NBU@university\par}\vspace{0.35cm}{\NBU@songti\zihao{4}（宁波大学封面标识图片缺失）\par}}}
    \vspace{1.15cm}
    {\NBU@kaiti\bfseries\zihao{2} 本科毕业设计\hspace{0.25em}（论文）\par}
    \vspace{0.80cm}
    \noindent\makebox[\textwidth][c]{\begin{minipage}{15.6cm}\centering\NBU@heiti\fontsize{18bp}{32bp}\selectfont\setlength{\parindent}{0pt}题目：\NBU@titlecn\par\end{minipage}}\par
    \vspace{0.25cm}
    {\NBU@latin\bfseries\fontsize{18bp}{34bp}\selectfont\begin{minipage}{15.6cm}\centering\setlength{\parindent}{0pt}\NBU@titleen\end{minipage}\par}
    \vspace{1.90cm}
    \noindent\makebox[\textwidth][c]{\begingroup\setlength{\arrayrulewidth}{0.4pt}\setlength{\tabcolsep}{0pt}
        \newcommand{\NBU@coverrow}[2]{\parbox[c][1.10cm][c]{2.20cm}{\centering{\NBU@simsun\NBU@latin\mdseries\fontsize{15pt}{15pt}\selectfont ##1}} & \parbox[c][1.10cm][c]{9.20cm}{\raggedright\NBU@heiti\NBU@latin\mdseries\fontsize{15pt}{15pt}\selectfont\hspace*{2.00cm}##2}\\[-0.02cm]\cline{2-2}}
        \begin{tabular}{@{}>{\centering\arraybackslash}m{2.20cm}@{}>{\raggedright\arraybackslash}m{9.20cm}@{}}
            \NBU@coverrow{学\hspace{1.8em}院}{\NBU@college}
            \NBU@coverrow{专\hspace{1.8em}业}{\NBU@major}
            \NBU@coverrow{班\hspace{1.8em}级}{\NBU@class}
            \NBU@coverrow{学\hspace{1.8em}号}{\NBU@id}
            \NBU@coverrow{学生姓名}{\NBU@author}
            \NBU@coverrow{指导教师}{\NBU@supervisor}
            \NBU@coverrow{完成日期}{\NBU@date}
        \end{tabular}\endgroup}\par
    \endgroup\clearpage}

\newcommand{\makedeclaration}{%
    \clearpage\thispagestyle{plain}\begingroup\setstretch{1}
    \begin{center}\vspace*{1.5cm}{\NBU@kaiti\bfseries\fontsize{26pt}{31.2pt}\selectfont 诚\hspace{0.85em}信\hspace{0.85em}承\hspace{0.85em}诺\par}\end{center}
    \vspace{1.35cm}\begingroup\setstretch{1}\NBU@simsun\NBU@latin\fontsize{14pt}{35pt}\selectfont\justifying\setlength{\parindent}{2em}
    \par\noindent\hspace*{2em}我谨在此承诺：本人所写的毕业论文《\NBU@titlecn》的主体均系本人独立完成，没有抄袭行为，凡涉及其他作者的观点和材料，均作了注释，若有不实，后果由本人承担并愿接受校方的处分。\par
    \vspace{1.25cm}\begin{flushright}\begin{minipage}{8.2cm}\centering{\bfseries 承诺人（签名）：\hspace{3.2cm}\par}\vspace{0.45cm}{\bfseries \NBU@declarationdate\par}\end{minipage}\end{flushright}
    \endgroup\endgroup\clearpage}

\newcommand{\zhabstract}[1]{%
    \clearpage\phantomsection\begingroup\setstretch{1}
    {\centering\NBU@heiti\mdseries\fontsize{18bp}{32bp}\selectfont \NBU@titlecn\par}\vspace{17bp}
    {\centering\NBU@heiti\mdseries\fontsize{18bp}{32bp}\selectfont 摘\quad 要\par}\vspace{17bp}
    \addcontentsline{toc}{chapter}{摘\ 要}
    \begingroup\NBU@abstractbodyfont\setstretch{1}\setlength{\baselineskip}{22pt}\setlength{\parindent}{2em}\indent #1\par\vspace{1em}
    \indent{\NBU@heiti\NBU@abstractlatin\mdseries\zihao{-4}关键字\hspace{1em}}{\NBU@keywords}\par\endgroup\endgroup\clearpage}

\newcommand{\enabstract}[1]{%
    \clearpage\phantomsection\begingroup\setstretch{1}
    {\centering\NBU@latin\bfseries\fontsize{18bp}{32bp}\selectfont \NBU@titleen\par}\vspace{17bp}
    {\centering\NBU@heiti\mdseries\fontsize{18bp}{32bp}\selectfont Abstract\par}\vspace{17bp}
    \addcontentsline{toc}{chapter}{Abstract}
    \begingroup\NBU@abstractbodyfont\setstretch{1}\setlength{\baselineskip}{22pt}\setlength{\parindent}{1em}\indent #1\par\vspace{1em}
    \indent{\NBU@abstractlatin\bfseries KEYWORDS\space}{\NBU@enkeywords}\par\endgroup\endgroup\clearpage}

\AtBeginBibliography{\NBU@songti\NBU@latin\zihao{5}\setstretch{1.5}\justifying\setlength{\parindent}{0pt}\setlength{\parskip}{0pt}\setlength{\bibhang}{0pt}\setlength{\bibitemsep}{0pt}\setlength{\bibparsep}{0pt}}
\defbibenvironment{bibliography}{\list{}{\setlength{\labelwidth}{0pt}\setlength{\labelsep}{0pt}\setlength{\leftmargin}{0pt}\setlength{\itemindent}{0pt}\setlength{\listparindent}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}\setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}\renewcommand*{\makelabel}[1]{##1}}}{\endlist}{\item\printtext[labelnumberwidth]{\printfield{labelprefix}\printfield{labelnumber}}\addspace}
\defbibheading{bibintoc}[\bibname]{\clearpage\phantomsection\addcontentsline{toc}{chapter}{#1}\thispagestyle{plain}\begingroup\setstretch{1}\vspace*{-0.65cm}\begin{center}{\NBU@heiti\mdseries\fontsize{18pt}{32pt}\selectfont #1\par}\end{center}\vspace{0.12cm}\endgroup}

\newcommand{\thesisacknowledgement}[1]{\chapter*{致谢}\addcontentsline{toc}{chapter}{致谢}#1\clearpage}
