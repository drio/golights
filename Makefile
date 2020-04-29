PRJ=golights

clean:
	echo "clean"	

createDBRepo:
	cd ~drio/Dropbox/git_repo;\
	./create-bare-repo.sh ${PRJ};\
	cd -;\
	git remote add origin ~/Dropbox/git_repo/${PRJ}.git;\
	git push -u origin master
