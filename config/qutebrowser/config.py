## Default monospace fonts. Whenever "monospace" is used in a font
## setting, it's replaced with the fonts listed here.
## Type: Font
c.fonts.monospace = '"Fira Code Retina", "xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'

## Font used in the tab bar.
## Type: QtFont
c.fonts.tabs = '13pt monospace'

## Font used in the statusbar.
## Type: Font
c.fonts.statusbar = '12pt monospace'

## Where to show the downloaded files.
## Type: VerticalPosition
## Valid values:
##   - top
##   - bottom
c.downloads.position = 'bottom'

## Which implementation to use to find elements to hint.
## Not available with QtWebEngine
## Type: String
## Valid values:
##   - javascript: Better but slower
##   - python: Slightly worse but faster
# c.hints.find_implementation = 'javascript'

## Execute the best-matching command on a partial match.
## Type: Bool
c.completion.use_best_match = True

## Automatically start playing `<video>` elements. Note: On Qt < 5.11,
## this option needs a restart and does not support URL patterns.
## Type: Bool
c.content.autoplay = False

## Padding (in pixels) for the statusbar.
## Type: Padding
c.statusbar.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 1}

## Automatically enter insert mode if an editable element is focused
## after loading the page.
## Type: Bool
c.input.insert_mode.auto_load = True

## Enable smooth scrolling for web pages. Note smooth scrolling does not
## work with the `:scroll-px` command.
## Type: Bool
c.scrolling.smooth = True

## Open base URL of the searchengine if a searchengine shortcut is
## invoked without parameters.
## Type: Bool
c.url.open_base_url = True

## Search engines which can be used via the address bar. Maps a search
## engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
## placeholder. The placeholder will be replaced by the search term, use
## `{{` and `}}` for literal `{`/`}` signs. The search engine named
## `DEFAULT` is used when `url.auto_search` is turned on and something
## else than a URL was entered to be opened. Other search engines can be
## used by prepending the search engine name to the search term, e.g.
## `:open google qutebrowser`.
## Type: Dict
c.url.searchengines = {
  'DEFAULT': 'https://duckduckgo.com/?q={}',
  'gg': 'https://google.com/search?q={}',
  'yt': 'https://youtube.com/results?search_query={}',
  'ar': 'https://wiki.archlinux.org/index.php?search={}'
}

## Hide the window decoration.  This setting requires a restart on
## Wayland.
## Type: Bool

# c.window.hide_decoration = False
### BINDINGS ###
#
# mpv bindings
config.bind(',v', 'spawn umpv {url}')
config.bind(',V', 'hint links spawn umpv {hint-url}')
config.bind(',,V', 'hint --rapid links spawn umpv {hint-url}')

## List of user stylesheet filenames to use.
## Type: List of File, or File
# wait for per domain support
c.content.user_stylesheets = []
# c.content.user_stylesheets = [
#   "~/dev/github/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css",
# ]

# My theme
config.source('sol-light-qutebrowser.py')
