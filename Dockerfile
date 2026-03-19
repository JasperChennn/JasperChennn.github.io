# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# 1. 先创建 apt 目录（确保目录存在）
RUN mkdir -p /etc/apt && \
    # 2. 直接创建 sources.list 文件，写入清华源（无需备份，因为原文件不存在）
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ trixie main contrib non-free non-free-firmware" > /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ trixie-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ trixie-backports main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security/ trixie-security main contrib non-free non-free-firmware" >> /etc/apt/sources.list


# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*


# Create a non-root user with UID 1000
RUN groupadd -g 1000 vscode && \
    useradd -m -u 1000 -g vscode vscode

# Set the working directory
WORKDIR /usr/src/app

# Set permissions for the working directory
RUN chown -R vscode:vscode /usr/src/app

# Switch to the non-root user
USER vscode

# Copy Gemfile into the container (necessary for `bundle install`)
COPY Gemfile ./



# Install bundler and dependencies
RUN gem install connection_pool:2.5.0
RUN gem install bundler:2.3.26
RUN bundle install

# Command to serve the Jekyll site
CMD ["jekyll", "serve", "-H", "0.0.0.0", "-w", "--config", "_config.yml,_config_docker.yml"]
