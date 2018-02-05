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

% `Computer Modern Unicode` or `Times New Roman` font
\newif\if@cmu
\newif\if@tnr

\DeclareOption{cmu}{
  \@cmutrue
  \@tnrfalse
}
\DeclareOption{tnr}{
  \@cmufalse
  \@tnrtrue
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
    
  \titleformat{name=\subsubsection,numberless}
    [block]
    {\normalsize\bfseries}
    {}
    {0em}
    {\hspace*{1.27cm}}
    
  \titlespacing{\section}{0pt}{\parskip}{.5em}
  \titlespacing{\subsection}{0pt}{.5em}{.25em}
  \titlespacing{\subsubsection}{0pt}{.5em}{0em}
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
    
  \titleformat{name=\subsubsection,numberless}
    [block]
    {\normalsize\bfseries}
    {}
    {0em}
    {\hspace*{1.27cm}}
    
  \titlespacing{\section}{0pt}{\parskip}{.5em}
  \titlespacing{\subsection}{0pt}{.5em}{.25em}
  \titlespacing{\subsubsection}{0pt}{.5em}{0em}
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

\setlength{\cftsecnumwidth}{1em}          % 1em width for section numbers
\setlength{\cftsubsecnumwidth}{1.75em}    % 1em width for subsection numbers
\setlength{\cftsubsubsecnumwidth}{2.5em}  % 1em width for subsection numbers
\cftsetpnumwidth{1em}                     % 1em width for page numbers
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
%                                    Lists                                     %
% ---------------------------------------------------------------------------- %

\RequirePackage{enumitem}

\makeatletter
\AddEnumerateCounter{\asbuk}{\russian@alph}{щ}
\makeatother

\newlist{dashitemize}{enumerate}{2}
\setlist[dashitemize,1]{
  itemsep=-.5ex,topsep=0pt,leftmargin=0cm,itemindent=1.8cm,label=--
}
\setlist[dashitemize,2]{
  itemsep=-.5ex,topsep=0pt,leftmargin=1.27cm,itemindent=1.8cm,label=\arabic*)
}

\newlist{alphitemize}{enumerate}{2}
\setlist[alphitemize,1]{
  itemsep=-.5ex,topsep=0pt,leftmargin=0cm,itemindent=1.91cm,label=\asbuk*)
}
\setlist[alphitemize,2]{
  itemsep=-.5ex,topsep=0pt,leftmargin=1.27cm,itemindent=1.8cm,label=\arabic*)
}


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
%                                   Captions                                   %
% ---------------------------------------------------------------------------- %

\RequirePackage{chngcntr}

\counterwithin{figure}{section}
\counterwithin{table}{section}

\RequirePackage{caption}

\captionsetup[figure]{
  labelsep=endash,
  skip=0pt,
  justification=centering
}

\captionsetup[table]{
  labelsep=none,
  skip=0pt,
  justification=raggedright,
  singlelinecheck=off
}

\AtBeginDocument{
  \renewcommand{\figurename}{Рисунок}
}
