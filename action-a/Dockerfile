FROM golang:alpine

LABEL "name"="Hugo build & deploy"
LABEL "maintainer"="Katya Gordeeva <me@katyagordeeva.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Go Builder"
LABEL "com.github.actions.description"="Build a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="#E0EBF5"


RUN apk add --no-cache \
	ca-certificates \
	g++ \
	gcc \
	make \
	musl \
	musl-dev \
	git

RUN git clone https://github.com/gohugoio/hugo.git /hugo
RUN cd /hugo; go install --tags extended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]