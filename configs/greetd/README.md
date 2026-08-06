# greetd

A lightweight, terminal-based login screen powered by `tuigreet`.

## Highlights

- the host and current time are displayed above the login prompt,
  providing useful system context before signing in.
- the last logged-in username is remembered, reducing repeated input while
  still requiring authentication.
- a compact layout and dark gray, cyan, and magenta theme give the greeter a
  distinct look that fits the rest of the desktop.
- the greeter runs on the first virtual terminal as the dedicated `greeter`
  user, keeping the login flow predictable and isolated from user sessions.
