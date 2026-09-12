/* KUB-118: rendered by omarchy-theme-set-templates → ~/.local/state/omarchy/current/theme/zen.css,
 * imported from the Zen profile's chrome/userChrome.css. Applies on next Zen start (no hot reload).
 * Variable map = tinted-zen (valid for Zen 1.22b). double-brace spacing `{{ x }}` must be exactly one space each side. */
:root,
:root:-moz-lwtheme {
  --zen-primary-color:              {{ accent }} !important;
  --zen-colors-primary:             {{ accent }} !important;
  --zen-colors-secondary:           {{ lighter_background }} !important;
  --zen-colors-tertiary:            {{ dark_background }} !important;
  --zen-colors-hover-bg:            {{ selection_background }} !important;
  --zen-colors-primary-foreground:  {{ foreground }} !important;
  --zen-colors-border:              {{ muted }} !important;
  --zen-colors-border-contrast:     {{ light_foreground }} !important;
  --zen-colors-input-bg:            {{ dark_background }} !important;
  --zen-main-browser-background:    {{ background }} !important;
  --zen-dialog-background:          {{ dark_background }} !important;
  --zen-toolbar-element-bg:         {{ lighter_background }} !important;
  --zen-toolbar-element-bg-hover:   {{ mix lighter_background foreground 12% }} !important;
  --zen-urlbar-background:          {{ dark_background }} !important;
  --zen-sidebar-notification-bg:    {{ accent }} !important;
  --zen-sidebar-themed-icon-fill:   {{ foreground }} !important;

  /* Firefox-inherited */
  --toolbar-bgcolor:                {{ background }} !important;
  --toolbar-color:                  {{ foreground }} !important;
  --tab-selected-bgcolor:           {{ lighter_background }} !important;
  --tab-selected-color:             {{ bright_foreground }} !important;
  --arrowpanel-background:          {{ dark_background }} !important;
  --arrowpanel-color:               {{ foreground }} !important;
  --lwt-accent-color:               {{ background }} !important;
  --lwt-text-color:                 {{ foreground }} !important;
  --zen-themed-toolbar-bg-transparent: {{ background }} !important;
}

/* Zen 1.22 paints the workspace gradient INLINE on these two elements (ZenGradientGenerator.mjs
 * `browserBackgroundElement.style.setProperty("--zen-main-browser-background", …)`), so a :root value never
 * reaches them. A user-sheet !important on the element itself beats the inline author style. */
#zen-browser-background,
.zen-toolbar-background {
  --zen-main-browser-background:         {{ background }} !important;
  --zen-main-browser-background-toolbar: {{ background }} !important;
  --zen-main-browser-background-old:     {{ background }} !important;
  --zen-main-browser-background-toolbar-old: {{ background }} !important;
}
