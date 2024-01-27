export NODE_HOME="{{.dst}}/{{.dst_pkg_dir}}/{{.local_name}}/{{.local_version}}/nodejs"
export NODE_PATH="{{.dst}}/{{.dst_pkg_dir}}/{{.local_name}}/{{.local_version}}/pkgs"
export PATH=$NODE_PATH/bin:$NODE_HOME/bin:$PATH
npm config set prefix $NODE_PATH