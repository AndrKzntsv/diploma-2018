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


% ---------------------------------------------------------------------------- %
%                                   Geometry                                   %
% ---------------------------------------------------------------------------- %

\RequirePackage{geometry}
\geometry{
  top=20mm,
  bottom=20mm,
  right=10mm,
  left=20mm,
  bindingoffset=0cm
}


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