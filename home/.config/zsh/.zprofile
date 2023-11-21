set -a
for file in ~/.config/environment.d/*.conf; do
  source $file
done
set +a
