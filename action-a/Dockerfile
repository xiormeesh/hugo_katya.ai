FROM golang:buster

LABEL "name"="Hugo build & deploy"
LABEL "maintainer"="Katya Gordeeva <me@katyagordeeva.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Go Builder"
LABEL "com.github.actions.description"="Build a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="#E0EBF5"

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN apt-get update && apt-get install -y \
	google-cloud-sdk

RUN git clone https://github.com/gohugoio/hugo.git /hugo
RUN cd /hugo; go install --tags extended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]