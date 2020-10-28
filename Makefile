PRJ=golights

help: ## This help dialog
	@IFS=$$'\n' ; \
  help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
  for help_line in $${help_lines[@]}; do \
  	IFS=$$'#' ; \
    help_split=($$help_line) ; \
    help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
    help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
    printf "%-40s %s\n" $$help_command $$help_info ; \
	done

sync: ## Push to dropbox bare git repo
	git push origin master

tmux: ## load tmux
	./setup-tmux.sh

createDBRepo: ## Create Dropbox repo
	cd ~drio/Dropbox/git_repo;\
	./create-bare-repo.sh ${PRJ};\
	cd -;\
	git remote add origin ~/Dropbox/git_repo/${PRJ}.git;\
	git push -u origin master
