FROM texlive/texlive:TL2024-historic

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=hu_HU.UTF-8 \
    LC_ALL=hu_HU.UTF-8 \
    TEXMFHOME=/workspace/texmf

RUN apt-get update && \
    apt-get install -y \
    locales \
    inkscape \
    fonts-texgyre \
    ghostscript && \
    rm -rf /var/lib/apt/lists/* && \
    fc-cache -f -v

RUN echo 'hu_HU.UTF-8 UTF-8' >> /etc/locale.gen && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    echo 'es_ES.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen


# RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet && \
RUN tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2024/tlnet-final && \
    tlmgr update --self && \
    tlmgr install \
    scheme-full \
    svg \
    xcolor \
    fontawesome5 \
    pgfornament \
    fancyhdr \
    fontspec \
    luatexbase \
    tex4ht \
    babel-hungarian

WORKDIR /workspace

# PDF example
# CMD ["sh", "-c", "lualatex --shell-escape --interaction=nonstopmode budavariam.tex && lualatex --shell-escape --interaction=nonstopmode budavariam.tex"]
# HTML example
# CMD ["sh", "-c", "lualatex --shell-escape --interaction=nonstopmode budavariam.tex && mk4ht htlatex budavariam.tex"]
