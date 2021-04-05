\NeedsTeXFormat{LaTeX2e}[2019/12/30]
\ProvidesClass{HUNNUthesis}[2019/12/30 V1.0 Thesis for HUNNUer]
\LoadClass[a4paper,twoside,openright,UTF8]{ctexbook}
%%=======论文页边距一般要求：上边距2.54cm、下边距2.54cm,左右边距3.00cm,页眉1.50cm,页脚1.75cm
\RequirePackage[top=2.54cm, bottom=2.54cm, outer=3.00cm, inner=3.00cm, headheight=1.5 cm, footskip=1.75cm, heightrounded]{geometry}
\RequirePackage[numbers,sort&compress]{natbib}%连续参考文献连接起来
\RequirePackage[perpage, bottom]{footmisc}%尾注
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{mathptmx}%Times New Roman字体
\RequirePackage{float}%控制图片浮动位置
\RequirePackage[T1]{fontenc}
\RequirePackage{booktabs}
\RequirePackage{setspace}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{multirow}
\RequirePackage{fancyhdr}%Needed to define custom headers/footers
%\RequirePackage{lastpage}%Number of pages in the document
\RequirePackage{etoolbox}
\RequirePackage[titles,subfigure]{tocloft}%控制生成的表格和图片的目录格式
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{forloop}
\RequirePackage{xstring}
\RequirePackage[unicode,psdextra]{hyperref}%Required for hyperlinks
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{enumitem}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{caption}
\RequirePackage{ifthen}
\RequirePackage{titlesec}
%=======参考文献上标
\newcommand{\upcite}[1]{{\setcitestyle{square,super}\cite{#1}}}
%======是否需要插图和图表索引
\newboolean{PicAndTabIndex}
\pagestyle{fancy}% Enables the custom headers/footers
\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage} %
}
\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.3889}\selectfont}%行距
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}
%=======标题样式
\ctexset{
% 图和表目录的间距选项是在\chapter命令内部写入.lof/.lot 文件的
% 所以属于章节样式的一部分。ctex 宏集提供了现成的选项默认值都是是:10pt
contentsname={目\HUNNUspace 录},
chapter/lofskip=0pt,
chapter/lotskip=0pt
}
%%\CTEXsetup[name={第,章},number={\arabic{chapter}}]{chapter}%改变目录标题样式
\CTEXsetup[name={,.},number={\arabic{chapter}}]{chapter}%改变目录标题样式
\renewcommand{\cftdot}{$\cdot$}%页码前导点的符号;
\renewcommand{\cftdotsep}{0}%前导点的间隔;
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setlength{\cftbeforechapskip}{4pt}%章前间隔4磅
\setlength{\cftbeforesecskip}{4pt}%节前间隔4磅
\setlength{\cftbeforesubsecskip}{4pt}%小节节前间隔4磅
\cftsetpnumwidth{1.5em}
%%章节字体和字号
\renewcommand\cftchapfont{\fangsong\zihao{4}}
\renewcommand\cftsecfont{\fangsong\zihao{4}}
\renewcommand\cftsubsecfont{\fangsong\zihao{4}}
\renewcommand\cftchappagefont{\mdseries}
\setlength\cftbeforetoctitleskip{18pt}
%%%%%%%%%% 章节字体、段落、字号和间距设置 %%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{4}%设置编号深度
\setlength{\parindent}{2em}%段落缩进两个字符
%=======修改章节样式
\newcommand\prechaptername{ }
\newcommand\postchaptername{.}
\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}
\titleformat{\chapter}{\centering\zihao{4}\heiti}{\chaptername}{0.5em}{}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\zihao{4}\fangsong}{\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\zihao{4}\fangsong}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\zihao{4}\fangsong}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
%%=======标题页信息
\def\code#1{\def\@code{#1}}%%课程代码
\def\college#1{\def\@college{#1}}%%学院
\def\serialnumber#1{\def\@serialnumber{#1}}%%学号
\def\major#1{\def\@major{#1}}%%专业年级
\def\enmajor#1{\def\@enmajor{#1}}%%英语专业年级
\def\enauthor#1{\def\@enauthor{#1}}%%英文作者
\def\advisor#1{\def\@advisor{#1}}%%指导老师
\def\title#1{\def\@title{#1}}%%中文标题
\def\entitle#1{\def\@entitle{#1}}%%英文标题
\def\submityear#1{\def\@submityear{#1}}%%提交年份
\def\submitmonth#1{\def\@submitmonth{#1}}%%提交月份
%%设置令牌列表\newtoks\packagename
%%以指定名称:\packagename={New Name for the package}
%%将名称放入输出中:\the\packagename
%\newtoks\code%专业代码
\newtoks\titlextra%标题多余一行时添加
\newtoks\entitletra%标题多余一行时添加
%%=======标题页
%需要添加循环函数，判定多于一行的情况
\def\HUNNU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\HUNNUunderline{\@ifnextchar[\HUNNU@underline\underline}
\renewcommand\maketitle{%封面样式
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
    	\rightline{{\bf\heiti\zihao{-4}专业代码}\HUNNUunderline[2.5cm]{\bf\heiti\zihao{4}\@code}}%插入专业代码
    	\vspace{0.75cm}%设置垂直间距
        \includegraphics[width=10.5cm]{hunnu.bmp}\\%插入师大图标logo
         \vspace{0.25cm}%设置垂直间距
        {\bf\heiti\zihao{-0}{本~~科~~毕~~业~~设~~计}\\}%
        \vspace{1.25cm}
        \zihao{4}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{50pt}
        \begin{tabular}{rl}%标题右对齐，内容左对齐
            \heiti{\zihao{3}{题~~目}\zihao{-4}（中文）\zihao{3}:}%中文标题折行输出
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%整个循环不会超过6
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\HUNNUunderline[258pt]{\fangsong\zihao{3}\fontspec{Times New Roman}\zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
            \heiti {\zihao{-4}{（英文）}\zihao{3}:}%英文标题折行输出
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\@entitle}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@entitle}{\value{title_str_number}}[\mygroup]\HUNNUunderline[258pt]{\fontspec{Times New Roman}\zihao{4}\mygroup}}\\[0.40cm]%
                }%
            }%
            {\heiti{\zihao{3}姓~~~~~~~~~~~~~~名:}} &
            {\HUNNUunderline[258pt]{ \fangsong\zihao{4}\@author}}\\[0.40cm]%作者信息
            {\heiti {\zihao{3}{学~~~~~~~~~~~~~~号:}}} &
            {\HUNNUunderline[258pt]{\fontspec{Times New Roman}\zihao{3}  \@serialnumber}}\\[0.40cm]%学号
            {\heiti {\zihao{3}学~~~~~~~~~~~~~~院:}} &
            {\HUNNUunderline[258pt]{\fangsong\zihao{4}\@college}} \\[0.40cm]%学院
            {\heiti {\zihao{3}专~业、年~级:}} &
            {\HUNNUunderline[258pt]{ \fangsong\zihao{4}\@major}}\\[0.40cm]%专业年级
            {\heiti {\zihao{3}指~~导~~教~~师:}} &
            {\HUNNUunderline[258pt]{\fangsong\zihao{4} \@advisor}} \\[0.40cm]%指导老师
        \end{tabular}
        \par
        \vspace{70pt}
        {\heiti\zihao{3}二〇{\@submityear}年{\@submitmonth}月}
    \end{center}
    \pagestyle{empty}
    \cleardoublepage
}
%=======中文摘要页
\newcommand{\ZhAbstract}[2]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{摘\quad 要}
    \begin{center}%论文中文题目
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1.27}
            \centering
            \zihao{3}\heiti\noindent\@title\the\titlextra%
        \end{minipage}
    \end{center}
    \setlength{\parskip}{0pt}%行间距和段间距相等
    \vspace{10pt}
    \linespread{1.27}%行距20磅
    \zihao{4}\fangsong\centerline{\@major\quad\@author}
        \begin{center}%
    	\begin{minipage}{\textwidth}
    		\centering
    		\heiti\zihao{4}\noindent{摘要}%中文摘要
    	\end{minipage}
    \end{center}%
    \par \fangsong\zihao{-4}#1
    \vspace{10pt}
    \par \noindent\heiti\zihao{4}{关键词：}\fangsong\zihao{-4}#2
    \newpage
}
%=======英文摘要页
\newcommand{\EnAbstract}[2]{
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{\textwidth}
            \linespread{1}
            \selectfont
            \centering
            \bf\zihao{3}\noindent{\@entitle\ \the\entitletra}%英文标题
        \end{minipage}
    \end{center}%
    \setlength{\parskip}{0pt}
    {
    \linespread{1.27}%行距24磅
    \fontspec{Times New Roman}\zihao{4}\centerline{\@enmajor\quad\@enauthor}
    \begin{center}%
    	\begin{minipage}{\textwidth}
    		\centering
    		\fontspec{Times New Roman}\zihao{4}\noindent{Abstract}%英文标题
    	\end{minipage}
    \end{center}%
    \par \fontspec{Times New Roman}\zihao{-4} #1
    \vspace{10pt}
    \par \noindent\fontspec{Times New Roman}\zihao{4}\text{Key words: } \fontspec{Times New Roman}\zihao{-4} #2}
}
%=======空格
\newcommand\HUNNUspace{\phantom{永}}
%========超链接========
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {湖南师范大学本科毕业论文}
    }
}
%=====列表样式
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
%======英文名称改为汉字
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}
%=======程序伪代码实现
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
%=======改变图表的编号格式
\captionsetup[table]{labelsep=space}%{labelsep=quad}
\captionsetup[figure]{labelsep=space}
\renewcommand{\tablename}{表} %表题头
\renewcommand{\figurename}{图} %图题头
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} %使图编号为7.1的格式 %\protect{~}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}%使表编号为7.1的格式
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}%使公式编号为7.1的格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}%使子图编号为(a)的格式
\renewcommand{\thesubtable}{(\alph{subtable})} %使子表编号为(a)的格式
\newcommand{\appedixfigtabnum}[1]{\setcounter{equation}{0}
	\renewcommand{\theequation}{#1\arabic{equation}}
	\setcounter{table}{0}   %从零开始编号
	\renewcommand{\thetable}{#1\arabic{table}\ }
	\setcounter{figure}{0}   %从零开始编号
	\renewcommand{\thefigure}{#1\arabic{figure}\ }
	\renewcommand{\figurename}{图}
	\renewcommand{\tablename}{表}}
%%=======参考文献
\newtoks\bibdatabase
\newcommand{\printbib}{
\fangsong\zihao{4}
\bibliographystyle{hunnubib}
\addcontentsline{toc}{chapter}{参考文献}
\bibliography{\the\bibdatabase}
}
\endinput
%%
%% End of file `HUNNUthesis.cls'.
