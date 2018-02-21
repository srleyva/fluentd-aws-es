FROM cheungpat/fluentd-elasticsearch-aws

RUN apt-get update && apt-get install -y -q --no-install-recommends         curl ca-certificates make g++ sudo bash
RUN td-agent-gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 0.32.0
RUN td-agent-gem install --no-document fluent-plugin-kinesis -v 2.1.0
RUN td-agent-gem install --no-document fluent-plugin-prometheus -v 1.0.1
COPY td-agent.conf /etc/td-agent/td-agent.conf

RUN apt-get remove -y make g++ && apt-get autoremove -y && apt-get clean -y &&         rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
