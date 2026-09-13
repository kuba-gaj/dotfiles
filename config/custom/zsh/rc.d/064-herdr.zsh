# herdr-automatic-rename: live per-command tab naming (preexec/precmd hooks).
# No-ops outside a herdr pane. Glob (N) = silent when plugin not installed.
for _f in ${HOME}/.config/herdr/plugins/github/herdr-automatic-rename-*/shell/hook.zsh(N); do
  source $_f; break
done
unset _f

# hm: run herdr CLI against the mac's server (KUB-141). Linux only; `hm pane list`,
# `hm agent prompt ...`. Same commands as local herdr, different socket.
[[ $OSTYPE == linux* ]] && hm() { ssh mac "export PATH=/opt/homebrew/bin:\$PATH; herdr ${(q)@}"; }
