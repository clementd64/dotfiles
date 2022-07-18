direnv hook fish | source

if status is-interactive
	abbr -a -g -- d docker
	abbr -a -g -- dc 'docker compose'
	abbr -a -g -- dcd 'docker compose down -t0 -v --remove-orphans'

	abbr -a -g -- k kubectl
	abbr -a -g -- kctx 'kubectl config use-context'
	abbr -a -g -- kns 'kubectl config set-context (kubectl config current-context) --namespace'

	abbr -a -g -- ls exa
	abbr -a -g -- cat bat

	abbr -a -g -- vim 'nvim'
	abbr -a -g -- v 'nvim'
	set -x EDITOR nvim
	set -x VISUAL nvim

	alias todo="nvim ~/.todo"

	fish_add_path -P "$HOME/.local/bin" "$HOME/go/bin"

	starship init fish | source
end

function fish_greeting
	echo TODO:
	grep '^# ' ~/.todo | bat -p -l markdown
end
