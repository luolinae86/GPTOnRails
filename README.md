# GPTOnRails

## Description

Using Ruby On Rails and the OpenAI API to implement the most concise chatgpt features,
support streaming response, markdown display, and code syntax highlighting

## Installation

Clone the repository and run the following commands:

```bash
bundle install
```

## Start the server

Run the following command on your terminal:
```bash
bin/dev 
```
This will call foreman to start the rails, taiwindcss and sidekiq configured in the Procfile.dev

```bash
# Procfile.dev
web: bin/rails server
css: bin/rails tailwindcss:watch
sidekiq: bundle exec sidekiq -c 2
queue: redis-server
```

## Usage

Visit the following URL on your browser:
```bash
http://localhost:3000
```

## OpenAI API Key Required

1. You need to have your own OpenAI API key at  https://platform.openai.com/account/api-keys
2. In app/jobs/get_ai_response_job.rb, replace the access_token with your own OpenAI API key

## Showcase


