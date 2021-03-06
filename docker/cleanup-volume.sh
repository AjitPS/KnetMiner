myname=$(basename $0)

[[ "$1" =~ ^(--all|-a)$ ]] && { all_opt='true'; shift; }
dataset_dir="$1"

if [ "$dataset_dir" == '' ]; then
	cat <<EOT


	$myname [--all|-a] <dataset volume path>
	
Deletes Docker-generated data and configuration files on a Docker volume (ie, local folder), so that the Knetminer
container can regenerate fresh versions of the new files.

For instance, $myname /home/wheat-dataset will clean-up directories like config/ or data/ subdirectories, under the
targeted wheat-dataset/ directory. the contents of those dirs are generated by our Docker container, files like 
data/knowledge-network.oxl are left untouched, since these are the data you need to provide from the extern in order
to run Knetminer against it.

The --all option additionally removes directories like settings/, which normally aren't touched. This is safe to do 
if you use --dataset-id with docker-run.sh, which re-depoloys the settings in the Knetminer code base. 
WARNING: if you're using your own settings under the volume path (typically by omitting --dataset-id), this will
completely delete them.
  

EOT
	exit 1
fi 

set -e # Stop upon errors 

function check_readable_dir
{
  dir="$1"
	[[ -d "$dir" && -r "$dir" && -w "$dir" ]] && return
	
	echo -e "WARNING: '$dir' isn't accessible"
	false
}

echo -e "\n\n"
check_readable_dir "$dataset_dir" || exit 1

cd "$dataset_dir"

if check_readable_dir "$dataset_dir/data"; then
	cd data
	echo -e "Cleaning data"
	rm -Rf *.tab index map*
	rm -f concepts2Genes genes2Concepts genes2PathLengths
fi

dir_list="client-src config"
[[ -z "$all_opt" ]] || dir_list="$dir_list settings"

for dir in $dir_list
do
	final_dir="$dataset_dir/$dir"

	echo -e "Cleaning $dir"
	check_readable_dir "$final_dir" || continue
	
	rm -Rf "$final_dir"
done

echo -e "\nThe end\n"
