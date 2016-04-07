## Feedbacks application

Simple Feedbacks application with user registration

### Requirements
- Users should be able to sign in/sign up
- Allow anonymous access
- Allow users to send Feedbacks
- Prefill `name` field if user logged in
- Do not save Feedback on database
- Feedback's parameters `:name, :message` are necessary
- Send email if feedback is valid

### Quick Start

```
bundle install
rails s
```

### Tests
Run:

`rake spec`

### Improvements
- Process email in background
- Design :)
