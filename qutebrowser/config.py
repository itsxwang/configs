# ============================================================
# Qutebrowser Config — Final Clean Setup
# Minimal • Fast • Aesthetic • Conflict-Free
# ============================================================


# ============================================================
# Core Behavior
# ============================================================

c.url.searchengines = {
    "DEFAULT": "https://search.brave.com/search?q={}",
    "am": "https://www.amazon.com/s?k={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "goog": "https://www.google.com/search?q={}",
    "hoog": "https://hoogle.haskell.org/?hoogle={}",
    "re": "https://www.reddit.com/r/{}",
    "ub": "https://www.urbandictionary.com/define.php?term={}",
    "wiki": "https://en.wikipedia.org/wiki/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "du": "https://duckduckgo.com/?q={}",
}

c.content.headers.user_agent = (
    "Mozilla/5.0 (X11; Linux x86_64) "
    "AppleWebKit/537.36 "
    "Chrome/120.0.0.0 Safari/537.36"
)

c.auto_save.session = True
c.session.lazy_restore = True


# ============================================================
# Tabs — Layout
# ============================================================

c.tabs.padding = {
    "top": 8,
    "bottom": 8,
    "left": 12,
    "right": 12,
}

c.tabs.min_width = 140
c.tabs.max_width = 200
c.tabs.indicator.width = 0

c.tabs.title.format = "{current_title}"
c.tabs.favicons.scale = 1.1


# ============================================================
# Tabs — Colors (Clean Dark)
# ============================================================

# Tab bar
c.colors.tabs.bar.bg = "#000000"

# Inactive tabs
c.colors.tabs.even.bg = "#000000"
c.colors.tabs.odd.bg = "#000000"
c.colors.tabs.even.fg = "#6f6f6f"
c.colors.tabs.odd.fg = "#6f6f6f"

# Active tab
c.colors.tabs.selected.even.bg = "#1e1e1e"
c.colors.tabs.selected.odd.bg = "#1e1e1e"
c.colors.tabs.selected.even.fg = "#ffffff"
c.colors.tabs.selected.odd.fg = "#ffffff"


# ============================================================
# Tabs — Pinned (Styled nicely)
# ============================================================

# Subtle accent (not ugly green)
PINNED_BG = "#000000"
PINNED_ACTIVE_BG = "#1e1e1e"

c.colors.tabs.pinned.even.bg = PINNED_BG
c.colors.tabs.pinned.odd.bg = PINNED_BG
c.colors.tabs.pinned.even.fg = "#aaaaaa"
c.colors.tabs.pinned.odd.fg = "#aaaaaa"

c.colors.tabs.pinned.selected.even.bg = PINNED_ACTIVE_BG
c.colors.tabs.pinned.selected.odd.bg = PINNED_ACTIVE_BG
c.colors.tabs.pinned.selected.even.fg = "#ffffff"
c.colors.tabs.pinned.selected.odd.fg = "#ffffff"


# ============================================================
# Completion UI (Advanced — from other config)
# ============================================================

c.colors.completion.fg = ["#9cc4ff", "white", "white"]

c.colors.completion.odd.bg = "#1c1f24"
c.colors.completion.even.bg = "#232429"

c.colors.completion.category.fg = "#e1acff"
c.colors.completion.category.bg = (
    "qlineargradient(x1:0, y1:0, x2:0, y2:1, "
    "stop:0 #000000, stop:1 #232429)"
)

c.colors.completion.category.border.top = "#3f4147"
c.colors.completion.category.border.bottom = "#3f4147"

c.colors.completion.item.selected.fg = "#282c34"
c.colors.completion.item.selected.bg = "#ecbe7b"
c.colors.completion.item.selected.match.fg = "#c678dd"

c.colors.completion.match.fg = "#c678dd"
c.colors.completion.scrollbar.fg = "white"


# ============================================================
# Statusbar & Misc UI
# ============================================================

c.colors.statusbar.normal.bg = "#282c34"
c.colors.statusbar.insert.bg = "#497920"
c.colors.statusbar.insert.fg = "white"
c.colors.statusbar.command.bg = "#282c34"
c.colors.statusbar.passthrough.bg = "#34426f"
c.colors.statusbar.url.warn.fg = "yellow"

c.colors.downloads.bar.bg = "#282c34"
c.colors.downloads.error.bg = "#ff6c6b"

c.colors.hints.fg = "#282c34"
c.colors.hints.match.fg = "#98be65"

c.colors.messages.info.bg = "#282c34"


# ============================================================
# Fonts
# ============================================================

c.fonts.default_family = '"Source Code Pro"'
c.fonts.default_size = "11pt"

c.fonts.completion.entry = '11pt "Source Code Pro"'
c.fonts.debug_console = '11pt "Source Code Pro"'
c.fonts.prompts = "default_size sans-serif"
c.fonts.statusbar = '11pt "Source Code Pro"'


# ============================================================
# Keybindings
# ============================================================

# Play video in mpv (hint mode)
config.bind("M", "hint links spawn mpv {hint-url}")

# Play current page in mpv
config.bind("cm", "spawn mpv {url}")

# Download video
config.bind(
    "Z",
    'hint links spawn konsole -e yt-dlp -o "~/Videos/yt/%(title)s.%(ext)s" {hint-url}',
)

# Open in new tab
config.bind("t", "cmd-set-text -s :open -t")

# Toggle UI
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)


# ============================================================
# Load autogenerated config
# ============================================================

config.load_autoconfig()
