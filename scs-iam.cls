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


% ---------------------------------------------------------------------------- %
%                                   Geometry                                   %
% ---------------------------------------------------------------------------- %

\RequirePackage{geometry}
\geometry{
  top=20mm,
  bottom=20mm,
  right=15mm,
  left=30mm,
  bindingoffset=0cm
}


% ---------------------------------------------------------------------------- %
%                                Cyrillic fonts                                %
% ---------------------------------------------------------------------------- %

\RequirePackage{xecyr}	
\RequirePackage{xunicode}

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Times New Roman}
\newfontfamily{\cyrillicfont}{Times New Roman}
\newfontfamily{\cyrillicfontsf}{Arial}
\newfontfamily{\cyrillicfonttt}{Courier New}

\RequirePackage{polyglossia}
\setdefaultlanguage[spelling=modern]{russian}


% ---------------------------------------------------------------------------- %
%                             Lengths and spacing                              %
% ---------------------------------------------------------------------------- %

\RequirePackage{setspace}
\setstretch{1.5}

\setlength{\parindent}{1.27cm}


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
  \titleformat{name=\section}[block]{\large\centering\bfseries}{\thesection}{.5em}{}
  \titleformat{name=\section,numberless}[block]{\large\centering\bfseries}{}{0pt}{}  
  \titleformat{name=\subsection}[block]{\normalsize\centering\bfseries}{\thesubsection}{.5em}{}  
  \titleformat{name=\subsubsection}[block]{\normalsize\centering\bfseries}{\thesubsubsection}{.5em}{}
    
  \titlespacing{\section}{0pt}{\parskip}{.5em}
  \titlespacing{\subsection}{0pt}{.5em}{.25em}
  \titlespacing{\subsubsection}{0pt}{.5em}{0em}
\fi
\if@ltitles
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
