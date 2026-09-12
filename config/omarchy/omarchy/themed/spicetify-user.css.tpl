/* KUB-123: static Spicetify theme CSS (no placeholders); copied to ~/.config/spicetify/Themes/omarchy/user.css
 * by hooks/theme-set.d/spotify. From imbypass/omarchy-theme-hook 10-spotify.sh. */
:root,
.encore-dark-theme,
.encore-base-set,
.encore-inverted-light-set {
    --background-highlight: rgba(var(--spice-rgb-highlight), 0.25) !important;
}
.main-nowPlayingBar-container {
    background-color: var(--background-base);
    border-radius: 0.5rem;
    padding: 0.5rem;
    color: var(--spice-text);
}
.main-entityHeader-backgroundColor,
.main-actionBarBackground-background,
.main-home-homeHeader {
    display: none !important;
}
.main-topBar-background,
.main-home-filterChipsSection {
    background-color: var(--spice-main) !important;
}
