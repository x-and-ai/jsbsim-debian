# For X and AI Docker Image Contributors

## Before changing the image

1. Always create and work on a local Git branch before making any change to this docker image.
1. If you are going to merge your change back to master later, make sure you are currently on the latest commit of master branch.

## During changing the image

1. Please conform to the coding standards and style guides of X and AI.
1. Use `./test` to test during your change.
1. The `./clean` script may not clean your test image if the build process was failed and image has no name (`docker images` command lists it as `<none>`). Please manually clean it up. The same applies to the test container.

## After changing the image

1. Use `./test` to test after your change.
1. Merge process:
    - Please make a commit on your local branch first.
    - Switch to master, NOT MERGING TO YET.
    - Fetch and pull the latest commit of master.
    - Merge the master to your local branch
    - Solve all conflict
    - Fetch and pull the latest commit of master again.
    - If there is any new commit on master after your last pull repeat the three steps above. Otherwise, merge you local branch to master.
    - Push to remote repo.
1. If the new commit on master is a new image version, please commit and push a new tag with the version number.

## File a bug

1. Please post an issue on the GitHub repo, so we can keep tracking the fixing progress.

## Propose a feature

1. Please post an issue on the GitHub repo, so we can know all proposals if they are solved, pending, or rejected.
