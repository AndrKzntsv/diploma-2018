%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                       XeLaTeX class for dissertations                        %
%                                                                              %
%              Designed for ITMO University, SCS, IAM department               %
%                                                                              %
%             Created by Andrei Kuznetsov (andr.kzntsw@gmail.com)              %
%                         Distributed under LPPL 1.3+                          %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---------------------------------------------------------------------------- %
%                                Identification                                %
% ---------------------------------------------------------------------------- %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scs-iam}[2017/09/02 SCS IAM dissertation class]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=iam,
  prefix=iam@
}

\LoadClass[a4paper,14pt]{extarticle}

\RequirePackage{hyperref}
\RequirePackage{amsmath}


% ---------------------------------------------------------------------------- %
%                                   Geometry                                   %
% ---------------------------------------------------------------------------- %

\RequirePackage{geometry}
\geometry{
  top=20mm,
  right=15mm,
  bottom=20mm,
  left=30mm,
  bindingoffset=0cm
}


% ---------------------------------------------------------------------------- %
%                                  Font sizes                                  %
% ---------------------------------------------------------------------------- %

%  Command           Size
% ----------------------------
%  \tiny              6pt
%  \scriptsize        8pt
%  \footnotesize      10pt
%  \small             12pt
%  \subnormal         13pt
%  \normalsize        14.4pt
%  \large             17.28pt
%  \Large             20.74pt
%  \LARGE             24.88pt
%  \huge              29.86pt
%  \Huge              35.83pt

\newcommand{\subnormal}{\fontsize{13pt}{15.6pt}\selectfont}


% ---------------------------------------------------------------------------- %
%                                 Fonts setup                                  %
% ---------------------------------------------------------------------------- %

\RequirePackage{xecyr}
\RequirePackage{xunicode}

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}

\newif\if@cmu % Computer Modern Unicode
\newif\if@tnr % Times New Roman
\newif\if@pta % PT Astra Serif, PT Astra Sans

\DeclareOption{cmu}{
  \@cmutrue
  \@tnrfalse
  \@ptafalse
}
\DeclareOption{tnr}{
  \@cmufalse
  \@tnrtrue
  \@ptafalse
}
\DeclareOption{pta}{
  \@cmufalse
  \@tnrfalse
  \@ptatrue
}

\ExecuteOptions{cmu} % default is `cmu`

\ProcessOptions\relax

\if@cmu
  \setmainfont{CMU Serif}
\fi
\if@tnr
  \setmainfont{Times New Roman}
  \newfontfamily{\cyrillicfont}{Times New Roman}
  \newfontfamily{\cyrillicfontsf}{Arial}
  \newfontfamily{\cyrillicfonttt}{Courier New}
\fi
\if@pta
  \setmainfont{PT Astra Serif}
  \newfontfamily{\cyrillicfont}{PT Astra Serif}
  \newfontfamily{\cyrillicfontsf}{PT Astra Sans}
  \newfontfamily{\cyrillicfonttt}{PT Mono}
\fi

\RequirePackage{polyglossia}
\setdefaultlanguage[spelling=modern]{russian}


% ---------------------------------------------------------------------------- %
%                             Lengths and spacing                              %
% ---------------------------------------------------------------------------- %

\RequirePackage{setspace}
\setstretch{1.5}

\setlength{\parindent}{1.27cm}


% ---------------------------------------------------------------------------- %
%                                 Page styles                                  %
% ---------------------------------------------------------------------------- %

\def\ps@headcenter{
  \let\@mkboth\@gobbletwo
  \def\@oddhead{\reset@font\hfil\thepage\hfil}
  \def\@evenhead{\reset@font\hfil\thepage\hfil}
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
}


% ---------------------------------------------------------------------------- %
%                                    Titles                                    %
% ---------------------------------------------------------------------------- %

\RequirePackage{titlesec}

\setcounter{secnumdepth}{4}

% Centered or left aligned titles for section, subsections, etc.
\newif\if@ctitles
\newif\if@ltitles

\DeclareOption{ctitles}{
  \@ctitlestrue
  \@ltitlesfalse
}
\DeclareOption{ltitles}{
  \@ctitlesfalse
  \@ltitlestrue
}

\ExecuteOptions{ctitles} % default is ctitles

\ProcessOptions\relax

\if@ctitles
  \titleformat{name=\section}
    [block]
    {\large\centering\bfseries}
    {\thesection}
    {.5em}
    {}
  \titleformat{name=\section,numberless}
    [block]
    {\large\centering\bfseries}
    {}
    {0pt}
    {}

  \titleformat{name=\subsection}
    [block]
    {\normalsize\centering\bfseries}
    {\thesubsection}
    {.5em}
    {}

  \titleformat{name=\subsubsection}
    [block]
    {\normalsize\centering\bfseries}
    {\thesubsubsection}
    {.5em}
    {}

  \titleformat{\paragraph}
    [block]
    {\normalsize\centering\bfseries}
    {\theparagraph}
    {.5em}
    {}

  \titlespacing{\section}{0pt}{\parskip}{.5em}
  \titlespacing{\subsection}{0pt}{.5em}{.25em}
  \titlespacing{\subsubsection}{0pt}{.5em}{0em}
  \titlespacing{\paragraph}{0pt}{.5em}{0em}
\fi
\if@ltitles
  \titleformat{name=\section}
    [block]
    {\large\bfseries}
    {\hspace*{1.27cm}\thesection}
    {1em}
    {}
  \titleformat{name=\section,numberless}
    [block]
    {\large\bfseries}
    {}
    {0pt}
    {\hspace*{1.27cm}}

  \titleformat{name=\subsection}
    [block]
    {\normalsize\bfseries}
    {\hspace*{1.27cm}\thesubsection}
    {1em}
    {}

  \titleformat{name=\subsubsection}
    [block]
    {\normalsize\bfseries}
    {\hspace*{1.27cm}\thesubsubsection}
    {1em}
    {}

  \titleformat{name=\paragraph}
    [block]
    {\normalsize\bfseries}
    {\hspace*{1.27cm}\theparagraph}
    {1em}
    {}

  \titlespacing{\section}{0pt}{\parskip}{.5em}
  \titlespacing{\subsection}{0pt}{.5em}{.25em}
  \titlespacing{\subsubsection}{0pt}{.5em}{0em}
  \titlespacing{\paragraph}{0pt}{.5em}{0em}
\fi

% Automatically add numberless sections to TOC
\RequirePackage{xparse}
\NewDocumentCommand{\mysection}{s o m}{
  \IfNoValueTF{#2}
    {\global\edef\chapToCname{#3}}
    {\global\edef\chapToCname{#2}}
  \IfBooleanTF{#1}
    {
     \section*{#3}
     \phantomsection
     \addcontentsline{toc}{section}{\chapToCname}
    }{
     \section[\chapToCname]{#3}
    }
}


% ---------------------------------------------------------------------------- %
%                              Table of contents                               %
% ---------------------------------------------------------------------------- %

\RequirePackage{tocloft}

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\setlength{\cftsecnumwidth}{1em}          % section numbers
\setlength{\cftsubsecnumwidth}{1.75em}    % subsection numbers
\setlength{\cftsubsubsecnumwidth}{2.75em} % subsubsection numbers
\cftsetpnumwidth{1em}                     % page numbers
\setlength{\cftbeforesecskip}{0pt}

\renewcommand\cftsecfont{\mdseries}
\renewcommand\cftsecpagefont{\mdseries}

\AtBeginDocument{
  \makeatletter
  % Remome TOC title
  \renewcommand{\tableofcontents}{
    \@starttoc{toc}
  }

  % Disable hyphenation
  \renewcommand{\@tocrmarg}{\@pnumwidth plus1fil}
  \makeatother
}


% ---------------------------------------------------------------------------- %
%                                 Bibliography                                 %
% ---------------------------------------------------------------------------- %

\RequirePackage[numbers,colon]{natbib}

\AtBeginDocument{
  \bibliographystyle{utf8gost705u}
  \urlstyle{same}

  \makeatletter
  \renewcommand{\@biblabel}[1]{#1.} % Change numbering ('[1]' -> '1.')
  \renewcommand{\refname}{Библиографический список}
  \makeatother
}


% ---------------------------------------------------------------------------- %
%                                  Appendices                                  %
% ---------------------------------------------------------------------------- %

\RequirePackage{appendix}

\renewcommand{\appendixname}{ПРИЛОЖЕНИЕ}

\renewenvironment{appendices}{
  \setcounter{section}{0}
  \renewcommand{\thesection}{\appendixname~\Alph{section}}
  
  \renewcommand{\cftsecleader}{\hspace{1cm}\cftdotfill{\cftdotsep}}
}


% ---------------------------------------------------------------------------- %
%                                    Lists                                     %
% ---------------------------------------------------------------------------- %

\RequirePackage{enumitem}
\RequirePackage{calc}

\newif\if@normallists
\newif\if@paddedlists

\DeclareOption{normallists}{
  \@normalliststrue
  \@paddedlistsfalse
}
\DeclareOption{paddedlists}{
  \@normallistsfalse
  \@paddedliststrue
}

\ExecuteOptions{normallists}

\ProcessOptions\relax

\newlength{\dashItemIndentOne}
\newlength{\dashLeftMarginOne}
\newlength{\dashItemIndentTwo}
\newlength{\dashLeftMarginTwo}

\newlength{\alphItemIndentOne}
\newlength{\alphLeftMarginOne}
\newlength{\alphItemIndentTwo}
\newlength{\alphLeftMarginTwo}

\if@normallists
  \setlength{\dashLeftMarginOne}{0cm}
  \setlength{\dashItemIndentOne}{1.8cm}
  \setlength{\dashLeftMarginTwo}{\parindent}
  \setlength{\dashItemIndentTwo}{1.8cm}

  \setlength{\alphLeftMarginOne}{0cm}
  \setlength{\alphItemIndentOne}{1.8cm+0.15cm}
  \setlength{\alphLeftMarginTwo}{\parindent}
  \setlength{\alphItemIndentTwo}{1.8cm}
\fi
\if@paddedlists
  \setlength{\dashLeftMarginOne}{1.8cm}
  \setlength{\dashItemIndentOne}{0cm}
  \setlength{\dashLeftMarginTwo}{\parindent}
  \setlength{\dashItemIndentTwo}{0cm}

  \setlength{\alphLeftMarginOne}{1.8cm+0.15cm}
  \setlength{\alphItemIndentOne}{0cm}
  \setlength{\alphLeftMarginTwo}{\parindent-0.15cm}
  \setlength{\alphItemIndentTwo}{0cm}
\fi

\makeatletter
\AddEnumerateCounter{\asbuk}{\russian@alph}{щ}
\makeatother

\newlist{dashitemize}{enumerate}{2}
\setlist[dashitemize,1]{
  itemsep=-.5ex,topsep=0pt,leftmargin=\dashLeftMarginOne,itemindent=\dashItemIndentOne,label=--
}
\setlist[dashitemize,2]{
  itemsep=-.5ex,topsep=-5pt,leftmargin=\dashLeftMarginTwo,itemindent=\dashItemIndentTwo,label=\arabic*)
}

\newlist{alphitemize}{enumerate}{2}
\setlist[alphitemize,1]{
  itemsep=-.5ex,topsep=0pt,leftmargin=\alphLeftMarginOne,itemindent=\alphItemIndentOne,label=\asbuk*)
}
\setlist[alphitemize,2]{
  itemsep=-.5ex,topsep=-5pt,leftmargin=\alphLeftMarginTwo,itemindent=\alphItemIndentTwo,label=\arabic*)
}


% ---------------------------------------------------------------------------- %
%                                   Figures                                    %
% ---------------------------------------------------------------------------- %

\RequirePackage{subfig}

\renewcommand{\thesubfigure}{\asbuk{subfigure}}


% ---------------------------------------------------------------------------- %
%                                    Tables                                    %
% ---------------------------------------------------------------------------- %

\RequirePackage{ctable}
\RequirePackage{makecell}

\setlength{\abovetopsep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowbottomsep}{0pt}


% ---------------------------------------------------------------------------- %
%                                   Listings                                   %
% ---------------------------------------------------------------------------- %

\RequirePackage{listings}

\lstset{
  basicstyle=\footnotesize\ttfamily,
  breakatwhitespace=\true,
  breaklines=\true,
  extendedchars = \true,
  keepspaces=true,
  numbers=left,
  numberstyle=\footnotesize,
  tabsize=2,
  frame=single
}


% ---------------------------------------------------------------------------- %
%                                   Captions                                   %
% ---------------------------------------------------------------------------- %

\RequirePackage{chngcntr}

\counterwithin{figure}{section}
\counterwithin{table}{section}
\AtBeginDocument{
  \counterwithin{lstlisting}{section}
}

\RequirePackage{caption}

\captionsetup[figure]{
  labelsep=endash,
  justification=centering
}

\captionsetup[table]{
  labelsep=endash,
  skip=0pt,
  justification=raggedright,
  singlelinecheck=off
}

\DeclareCaptionFormat{listing}{
  \parbox{\textwidth}{#1#2#3}
}
\captionsetup[lstlisting]{
  format=listing,
  labelsep=endash,
  skip=7pt,
  justification=raggedright
}

\AtBeginDocument{
  \renewcommand{\figurename}{Рисунок}
}

\renewcommand\lstlistingname{Листинг}


% ---------------------------------------------------------------------------- %
%                                    Utils                                     %
% ---------------------------------------------------------------------------- %

\RequirePackage{calc}

\newlength{\remaining}

\newcommand{\titledline}[1]{
  \setlength{\remaining}{\textwidth-\widthof{#1}-5pt}
  #1
}

\newlength{\signaturewidth}
\setlength{\signaturewidth}{3cm}

\newcommand{\addsignatureskip}{
  \addtolength{\remaining}{-\signaturewidth-0.7cm}
}

\newcommand{\signature}{
  $\underset{\text{\scriptsize (подпись)}}{\underline{\strut\hspace{\signaturewidth}}}$
}

\newcommand{\datetemplate}{
  <<\,\underline{\hspace{1cm}}\,>>
  \hspace{0.2cm}
  \underline{\hspace{3.5cm}}
  \hspace{0.2cm}
  20\,\underline{\hspace{0.75cm}}\,г.
}

\renewcommand{\strut}{
  \rule[-.12\baselineskip]{0pt}{\baselineskip}
}
