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

\LoadClass[a4paper,14pt]{extarticle}


% ---------------------------------------------------------------------------- %
%                                  Geometry                                    %
% ---------------------------------------------------------------------------- %

\RequirePackage{geometry}

\geometry{
  top=20mm,
  bottom=20mm,
  right=10mm,
  left=20mm,
  bindingoffset=0cm
}
