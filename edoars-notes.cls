%----------------------------
%IMPOSTAZIONI INIZIALI
%----------------------------
	\ProvidesClass{edoars-notes}[2022/09/03 version 0.3.1 Lecture notes]
	\NeedsTeXFormat{LaTeX2e}

	\RequirePackage{etoolbox}
	\newtoggle{@color}
	\newtoggle{@english}

	\DeclareOption{english}{\toggletrue{@english}}
	\DeclareOption{color}{\toggletrue{@color}}
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

	\ProcessOptions \relax

	\LoadClass[open=any,titlepage,cleardoublepage=empty,numbers=noenddot,BCOR=5mm]{scrreprt}
	%\KOMAoptions{DIV=10}
	\KOMAoptions{chapterprefix=false}

	\areaset{400pt}{775pt}
	\setlength{\marginparwidth}{7em}
	\setlength{\marginparsep}{2em}

	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\iftoggle{@english}{
		\RequirePackage[english]{babel}
	}{
		\RequirePackage[italian]{babel}
	}
%----------------------------
%COLORI
%----------------------------
	\RequirePackage[dvipsnames]{xcolor}
	\definecolor{halfgray}{gray}{0.55}
	\definecolor{aliceblue}{RGB}{240,248,255}

	%\definecolor{darker}{HTML}{304269}
	%\definecolor{lighter}{HTML}{D9E8F5}
	%\colorlet{lighter}{lighter!30}
	%\definecolor{contrast}{HTML}{F26101}
	%\definecolor{compl}{HTML}{91BED4}

	\iftoggle{@color}{
		\definecolor{darker}{HTML}{2C3E50}
		\definecolor{lighter}{HTML}{3498DB}
		\colorlet{lighter}{lighter!10}
		\definecolor{contrast}{HTML}{E74C3C}
		\definecolor{compl}{HTML}{2980B9}
	}{
		\colorlet{darker}{halfgray!60!black}
		\colorlet{lighter}{halfgray!10}
		\colorlet{contrast}{halfgray}
		\colorlet{compl}{black}
	}
%----------------------------
%FONTS
%----------------------------
	\RequirePackage{beramono}
	\RequirePackage[euler-digits,OT1]{eulervm}
	\RequirePackage{microtype}
	\renewcommand{\sfdefault}{iwona}

	\microtypesetup{expansion=false}

	\newfont{\chapterNumber}{pplr9d scaled 5000}
%----------------------------
%ABBELLIMENTI
%----------------------------
	\RequirePackage{textcase}
	\DeclareRobustCommand{\spacedallcaps}[1]{\sffamily\textls[160]{\MakeTextUppercase{#1}}}
	\DeclareRobustCommand{\spacedlowsmallcaps}[1]{\sffamily\textls[80]{\scshape\MakeTextLowercase{#1}}}

	\RequirePackage{marginnote}
	\def\graffito@setup{%
	   \itshape\footnotesize\leavevmode\color{Black}%
	   \parindent=0pt \lineskip=0pt \lineskiplimit=0pt %
	   \tolerance=2000 \hyphenpenalty=300 \exhyphenpenalty=300%
	   \doublehyphendemerits=100000%
	   \finalhyphendemerits=\doublehyphendemerits}

	\let\oldmarginpar\marginnote
	\renewcommand{\marginnote}[1]{\oldmarginpar%
	 [\graffito@setup\raggedleft\hspace{0pt}{#1}]%
	 {\graffito@setup\raggedright\hspace{0pt}{#1}}}
	\let\graffito\marginnote
%----------------------------
%TESTINE
%----------------------------
	%\RequirePackage[automark]{scrpage2}
	\RequirePackage[automark]{scrlayer-scrpage}
	\clearmainofpairofpagestyles


	\renewcommand{\chaptermark}[1]{\markboth{\spacedlowsmallcaps{#1}}{\spacedlowsmallcaps{#1}}}
	\renewcommand{\sectionmark}[1]{\markright{\textsc{\MakeTextLowercase{\thesection}} \spacedlowsmallcaps{#1}}}
	\lehead{\mbox{\llap{\small\thepage\kern1em\color{compl}\vline}\color{contrast}\hspace{0.5em}\headmark\hfil}} 
	\rohead{\mbox{\hfil{\color{contrast}\headmark\hspace{0.5em}}\rlap{\small{\color{compl}\vline}\kern1em\thepage}}}
	\renewcommand{\headfont}{\color{darker}\normalfont\sffamily}
	\renewcommand{\pnumfont}{\small\sffamily}
%----------------------------
%CAPITOLI, PARAGRAFI, ECC.
%----------------------------
	%capitoli
	\renewcommand*{\chapterformat}{{\color{contrast}\chapterNumber\thechapter}\hspace{10pt}\vline\hspace{10pt}}
	\renewcommand{\chapterlinesformat}[3]{%
	\normalfont\sffamily%
	#2%
	\color{darker}\spacedallcaps{#3}%
	}
	\renewcommand{\chapterpagestyle}{empty}

	%paragrafi
	\renewcommand{\sectionlinesformat}[4]{%
	\Ifstr{#1}{subsection}
		{\color{contrast}\normalfont\LARGE\sffamily%subsection settings
		\textsc{\MakeTextLowercase{\thesubsection}}\hspace{1em}%
		\color{darker}\spacedlowsmallcaps{#4}}
		{\color{contrast}\normalfont\LARGE\sffamily%section settings
		\textsc{\MakeTextLowercase{\thesection}}\hspace{1em}%
		\color{darker}\spacedlowsmallcaps{#4}}
	}	
%----------------------------
%ITEMIZE
%----------------------------
	\renewcommand\labelitemi{\color{halfgray}$\bullet$}
%----------------------------
%INDICE DEI CONTENUTI
%----------------------------
	\RequirePackage[titles]{tocloft}

	\newlength{\newnumberwidth}
	\settowidth{\newnumberwidth}{999}
	\cftsetpnumwidth{\newnumberwidth}

	\newlength{\beforebibskip}  
	\setlength{\beforebibskip}{0em}

	%solo se i capitoli sono più di 9
	%\newlength{\newchnumberwidth}
	%\settowidth{\newchnumberwidth}{.} % <--- tweak here if more space required
	%\addtolength{\cftchapnumwidth}{\newchnumberwidth}%
	%\addtolength{\cftsecnumwidth}{\newchnumberwidth}
	%\addtolength{\cftsecindent}{\newchnumberwidth}
	%\addtolength{\cftsubsecnumwidth}{\newchnumberwidth}
	%\addtolength{\cftsubsecindent}{2\newchnumberwidth}
	%\addtolength{\cftsubsubsecnumwidth}{\newchnumberwidth}

	%Patch per il font nel TOC
	%\RequirePackage{etoolbox}
	\patchcmd{\l@chapter}
		{\cftchapfont #1}
		{\cftchapfont{#1}}
		{}
		{}


	%capitoli
	\renewcommand{\cftchappresnum}{\scshape\spacedlowsmallcaps}
	\renewcommand{\cftchapfont}{\normalfont}%\spacedlowsmallcaps} %WORKAROUND PER HYPERREF
	\renewcommand{\cftchappagefont}{\small\normalfont\color{contrast}\spacedlowsmallcaps}
	\renewcommand{\cftchapleader}{\hspace{1.5em}}
	\renewcommand{\cftchapafterpnum}{\cftparfillskip}

	%paragrafi
	\renewcommand{\cftsecpresnum}{\scshape\spacedlowsmallcaps}
	\renewcommand{\cftsecfont}{\normalfont}
	\renewcommand{\cftsecpagefont}{\small\normalfont\color{contrast}\spacedlowsmallcaps}
	\renewcommand{\cftsecleader}{\hspace{1.5em}}
	\renewcommand{\cftsecafterpnum}{\cftparfillskip}

	%sottoparagrafi
	\renewcommand{\cftsubsecpresnum}{\scshape\spacedlowsmallcaps}
	\renewcommand{\cftsubsecfont}{\normalfont}
	\renewcommand{\cftsubsecpagefont}{\small\normalfont\color{contrast}\spacedlowsmallcaps}
	\renewcommand{\cftsubsecleader}{\hspace{1.5em}}
	\renewcommand{\cftsubsecafterpnum}{\cftparfillskip}

	%aggiustamenti
	\AtBeginDocument{\addtocontents{toc}{\protect\vspace{-\cftbeforechapskip}}}

	%WORKAROUND PER space low small caps nei capitoli
    \let\oldchap=\chapter
    \renewcommand*{\chapter}{\secdef{\Chap}{\ChapS}}
    \newcommand{\ChapS}[1]{\oldchap*{#1}}
    \newcommand{\Chap}[2][]{\oldchap[\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}]{#2}}
%----------------------------
%TITOLO
%----------------------------
	\RequirePackage[noadvisor,swapnames]{frontespizio}
%----------------------------
%ANALITICO
%----------------------------
	\RequirePackage{imakeidx}
	\makeindex[columns=2,columnseprule,options= -s style.ist]
	\indexsetup{headers={\spacedlowsmallcaps{\indexname}}{\spacedlowsmallcaps{\indexname}}}
%----------------------------
%FIGURE
%----------------------------
	\RequirePackage{graphicx}
	\RequirePackage{booktabs}
	\RequirePackage{caption}
	\captionsetup{font=small,format=hang,labelfont={sf,bf}}
%----------------------------
%LINK
%----------------------------
	\RequirePackage{url}
	\urlstyle{tt}
%----------------------------
%GRAFICI
%----------------------------
	\RequirePackage{pgfplots}
	\pgfplotsset{/pgf/number format/use comma,compat=newest}
	\usepgflibrary{fpu}

	\RequirePackage{tikz-cd} %Diagrammi commutativi

	\usetikzlibrary{calc}
	\usetikzlibrary{positioning}
	\usetikzlibrary{patterns}
	\pgfdeclarepatternformonly{north east lines wide}%
	   	{\pgfqpoint{-1pt}{-1pt}}%
	   	{\pgfqpoint{10pt}{10pt}}%
	   	{\pgfqpoint{9pt}{9pt}}%
	   	{
	    	\pgfsetlinewidth{0.3pt}
	     	\pgfpathmoveto{\pgfqpoint{0pt}{0pt}}
	     	\pgfpathlineto{\pgfqpoint{9pt}{9pt}}
	     	\pgfusepath{stroke}
	    }

	\usetikzlibrary{decorations.markings}
	\tikzset{->-/.style={decoration={markings, mark=at position 0.5 with {\arrow{>}}},postaction={decorate}}}
%----------------------------
%HYPERREF
%----------------------------
	\RequirePackage[pdftex,hyperfootnotes=false,pdfpagelabels]{hyperref}
	\hypersetup{hidelinks}

	\iftoggle{@english}{
		%\newcommand{\tcb@cnt@teorautorefname}{theorem}
		\def\tcb@cnt@teorautorefname~#1\null{[#1]\null}
		\newcommand{\tcb@cnt@defnautorefname}{definition}
		%\newcommand{\tcb@cnt@propautorefname}{proposition}
		\def\tcb@cnt@propautorefname~#1\null{(PR:#1)\null}
		\newcommand{\prautorefname}{property}
		\newcommand{\corautorefname}{corollary}
		%\newcommand{\lemautorefname}{lemma}
		\def\lemautorefname~#1\null{(LM:#1)\null}

	}{
		\newcommand{\tcb@cnt@teorautorefname}{teorema}
		%\def\tcb@cnt@teorautorefname~#1\null{TH:#1\null}
		\newcommand{\tcb@cnt@defnautorefname}{definizione}
		\newcommand{\tcb@cnt@propautorefname}{proposizione}
		\newcommand{\prautorefname}{proprietà}
		\newcommand{\corautorefname}{corollario}
		%\def\prautorefname~#1\null{PR:#1\null}
		%\renewcommand{\figureautorefname}{figura}
		\addto\extrasitalian{\def\figureautorefname{figura}}
	}
%----------------------------
%ALGORITMI
%----------------------------
	\RequirePackage[noend]{algpseudocode}
	\RequirePackage{algorithm,algorithmicx}

	\newcommand*\Let[2]{\State #1 $\gets$ #2}
	\algrenewcommand\algorithmicrequire{\textbf{Precondition:}}
	\algrenewcommand\algorithmicensure{\textbf{Postcondition:}}
%----------------------------
%MATEMATICA
%----------------------------
	\RequirePackage{amsmath,amssymb,amsthm}
	\RequirePackage{mathtools}
	\RequirePackage{braket} %Per le parentesi angolari
	\RequirePackage{cancel} %Per sbarrare le formule

	\RequirePackage{accents} %Per mettere le tilde sotto
	\DeclareMathAccent{\wtilde}{\mathord}{largesymbols}{"65}
	\newcommand*{\utilde}[1]{\underaccent{\wtilde}{#1}}

	%Aggiustamenti
	\newcommand\BoldSquare{\setlength\fboxrule{1.1pt}\setlength\fboxsep{0pt}\fbox{\phantom{\rule{5pt}{5pt}}}}
	\renewcommand{\qedsymbol}{\color{contrast}\(\BoldSquare\)}

	%pmod spacing
	\renewcommand{\pod}[1]{\allowbreak\mathchoice
	  {\if@display \mkern 8mu\else \mkern 8mu\fi (#1)}
	  {\if@display \mkern 8mu\else \mkern 8mu\fi (#1)}
	  {\mkern4mu(#1)}
	  {\mkern4mu(#1)}
	}

	%Insiemi numerici
	\newcommand{\numberset}{\mathbb}
	\newcommand{\N}{\numberset{N}}
	\newcommand{\Z}{\numberset{Z}}
	\newcommand{\Q}{\numberset{Q}}
	\newcommand{\R}{\numberset{R}}
	\newcommand{\C}{\numberset{C}}
	\newcommand{\F}{\numberset{F}}

	%Operatori spaziati
	\newcommand{\fa}{\forall\ }
	\newcommand{\ex}{\exists\ }

	%Abbreviazioni
	\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
	\DeclarePairedDelimiter{\norma}{\lVert}{\rVert}
	\newcommand{\dd}{\mathrm{d}}
	\newcommand{\pd}{\partial}
	%\newcommand{\ind}{\n}
	\DeclareMathOperator{\li}{li}
	\DeclareMathOperator{\ext}{ext}
	\DeclareMathOperator{\ord}{ord}
	\DeclareMathOperator{\BAR}{BAR}
	\DeclareMathOperator{\diam}{diam}
	\DeclareMathOperator{\divg}{div}
	\DeclareMathOperator{\Ker}{Ker}
	\DeclareMathOperator{\im}{Im}
	\DeclareMathOperator{\Char}{Char}
	\DeclareMathOperator{\ind}{Ind}
	\DeclareMathOperator{\irr}{Irr}
	\DeclareMathOperator{\Res}{Res}
	\DeclareMathOperator{\Aut}{Aut}
	\DeclareMathOperator{\Inv}{Inv}
	\DeclareMathOperator{\Gal}{Gal}
	\DeclareMathOperator{\mcm}{mcm}
	\DeclareMathOperator{\sgn}{sgn}
	\DeclareMathOperator{\dist}{d}
	\DeclareMathOperator{\wg}{w}
	\DeclareMathOperator{\GCD}{GCD}
	\DeclareMathOperator{\lcm}{lcm}
	\DeclareMathOperator{\Tr}{Tr}%Trace
	\DeclareMathOperator{\Nr}{N}%Norm
	\DeclareMathOperator{\Rs}{R}%Resultant
	\newcommand*{\setc}[1]{#1^{\mathsf{c}}}
	\newcommand\mapsfrom{\mathrel{\reflectbox{\ensuremath{\mapsto}}}}
	\newcommand\longmapsfrom{\mathrel{\reflectbox{\ensuremath{\longmapsto}}}}
	\newcommand*{\lege}[2]{\bigg(\frac{#1}{#2}\bigg)_L}
	\newcommand*{\jac}[2]{\bigg(\frac{#1}{#2}\bigg)}
	\newcommand*{\conj}[1]{\overline{#1}}
	\newcommand*{\chius}[1]{\overline{#1}}
	\newcommand*{\rfrac}[2]{{}^{#1}\!/_{#2}}
	\renewcommand{\vec}[1]{\underline{#1}}
	\newcommand*\sdot{\mathpalette\sdot@{.5}}
	\newcommand*\sdot@[2]{\mathbin{\vcenter{\hbox{\scalebox{#2}{$\m@th#1\bullet$}}}}}
	\newcommand*{\bO}{\mathcal{O}}
	\newcommand*{\tran}[1]{\prescript{t}{}{#1}{}{}}
		%Alfabeto greco
		\renewcommand{\a}{\alpha}
		\renewcommand{\b}{\beta}
		\renewcommand{\c}{\chi}
		\renewcommand{\d}{\delta}
		\newcommand{\e}{\varepsilon}
		\newcommand{\f}{\phi}
		\newcommand{\g}{\gamma}
		\newcommand{\h}{\eta}
		\renewcommand{\i}{\iota}
		\renewcommand{\j}{\varphi}
		\renewcommand{\k}{\kappa}
		\renewcommand{\l}{\lambda}
		\newcommand{\m}{\mu}
		\newcommand{\n}{\nu}
		\newcommand{\p}{\pi}
		\newcommand{\q}{\vartheta}
		\renewcommand{\r}{\varrho}
		\newcommand{\s}{\sigma}
		\renewcommand{\t}{\tau}
		\renewcommand{\u}{\upsilon}
		\newcommand{\w}{\omega}
		\newcommand{\x}{\xi}
		\newcommand{\y}{\psi}
		\newcommand{\z}{\zeta}
		\newcommand{\Tau}{\mathrm{T}}

	%Definizione enunciati
	\RequirePackage{varwidth}
	\RequirePackage{tcolorbox}
	\tcbuselibrary{theorems}
	\tcbuselibrary{skins}
	\tcbuselibrary{breakable}

	\tcbset{
		teorStyle/.style={
			enhanced,frame hidden,
			boxrule=2mm,borderline={0.5mm}{0pt}{compl},
			fonttitle=\large\sffamily,description font=\bfseries,
			before skip=12pt,after skip=12pt,
			colback=lighter,colbacktitle=darker,
			separator sign dash,
			arc=3mm,
		},
		propStyle/.style={
			boxrule=0.3mm,toprule=0.3mm,bottomrule=0.3mm,titlerule=0.3mm,
			fonttitle=\large\sffamily,description font=\bfseries,coltitle=white,
			before skip=12pt,after skip=12pt,
			colframe=compl,colback=lighter,colbacktitle=darker,
			separator sign dash,
			arc=0mm,outer arc=0mm,
		},
		defStyle/.style={
			enhanced,frame empty,interior empty,
			before skip=15pt,after skip=12pt,
			colframe=compl,colbacktitle=darker,coltitle=white,
			fonttitle=\large\sffamily,description font=\bfseries,
			borderline={0.5mm}{0mm}{compl},
			separator sign dash,
			attach boxed title to top left={yshift=-2mm},
			boxed title style={boxrule=0pt},varwidth boxed title,
		},
		remarkStyle/.style={
			enhanced,frame empty,interior empty,
			before skip=15pt,after skip=12pt,
			colframe=contrast!50,colbacktitle=white,coltitle=black,
			fonttitle=\small\sffamily,
			%borderline={0.5mm}{0mm}{compl},
			borderline={0.5mm}{0mm}{contrast!25},
			separator sign none,
			attach boxed title to bottom right={yshift=+2mm, xshift=-2mm},
			boxed title style={boxrule=0.5mm},varwidth boxed title,
		},
		corStyle/.style={

		}
	}

	\newcounter{dummy}
	\numberwithin{dummy}{section}

	\newtcbtheorem[number within=chapter]{teor}{\iftoggle{@english}{Theorem}{Teorema}}{teorStyle}{th}
	\newtcbtheorem[use counter from=teor]{prop}{\iftoggle{@english}{Proposition}{Proposizione}}{propStyle}{pr}
	\newtcbtheorem[use counter from=teor]{defn}{\iftoggle{@english}{Definition}{Definizione}}{defStyle}{df}
	\newtcbtheorem[no counter]{remark}{}{remarkStyle}{}


	\tcolorboxenvironment{proof}{
		blanker,breakable,
		left=5mm,
		borderline west={0.5mm}{0pt}{compl}
	}

	\theoremstyle{definition}
	\newtheorem*{cor}{\iftoggle{@english}{Corollary}{Corollario}}
	\tcolorboxenvironment{cor}{
		before skip=12pt,after skip=12pt,
		colframe=lighter, colback=lighter,
		interior hidden
	}
	\newtheorem*{notz}{\iftoggle{@english}{Notation}{Notazione}}
	\tcolorboxenvironment{notz}{
	enhanced jigsaw, colframe=lighter, interior hidden,
	before skip=12pt, after skip=12pt
	}
	\newtheorem{lem}[tcb@cnt@teor]{Lemma}
	\tcolorboxenvironment{lem}{
	enhanced, frame empty,
	before skip=12pt, after skip=12pt,
	colback=lighter
	}
	\newtheorem{pr}[tcb@cnt@teor]{\iftoggle{@english}{Property}{Proprietà}}
	\tcolorboxenvironment{pr}{
	enhanced, frame empty,
	before skip=12pt, after skip=12pt,
	colback=lighter
	}
	\newtheorem*{pr*}{\iftoggle{@english}{Property}{Proprietà}}
	\tcolorboxenvironment{pr*}{
	enhanced, frame empty,
	before skip=12pt, after skip=12pt,
	colback=lighter
	}
	\newtheorem*{ese}{\iftoggle{@english}{Example}{Esempio}}
	\tcolorboxenvironment{ese}{
	breakable, enhanced, 
	before skip=12pt, after skip=12pt,
	colback=lighter, colframe=compl
	}
	\newtheorem{exeN}{\iftoggle{@english}{Exercise}{Esercizio}}[chapter]
	\tcolorboxenvironment{exeN}{
	enhanced, frame empty,
	before skip=12pt, after skip=12pt,
	colback=lighter, colframe=compl
	}
	\newtheorem{exeL}{\iftoggle{@english}{Exercise}{Esercizio}}
	\renewcommand{\theexeL}{\theexeN.\alph{exeL}}
	\tcolorboxenvironment{exeL}{
	enhanced, frame empty,
	before skip=12pt, after skip=12pt,
	colback=lighter
	}
	\newtheorem*{exe}{\iftoggle{@english}{Exercise}{Esercizio}}

	\theoremstyle{remark}
	\newtheorem*{oss}{\iftoggle{@english}{Remark}{Osservazione}}
	\tcolorboxenvironment{oss}{
	breakable,
	enhanced jigsaw, colframe=compl, interior hidden,
	before skip=12pt, after skip=12pt
	}
	\newtheorem*{sol}{\iftoggle{@english}{Solution}{Soluzione}}