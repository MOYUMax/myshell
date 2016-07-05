#start ovsdb
mkdir -p /usr/local/etc/openvswitch
ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema  2>/dev/null

#ovsdb-server -v --remote=punix:/usr/local/var/run/openvswitch/db.sock \
#		      --pidfile --detach --log-file
#                     --remote=db:Open_vSwitch,manager_options \
#                     --private-key=db:SSL,private_key \
#                     --certificate=db:SSL,certificate \
#                     --pidfile --detach --log-file


ovsdb-server -v --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                 --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                 --private-key=db:Open_vSwitch,SSL,private_key \
                 --certificate=db:Open_vSwitch,SSL,certificate \
                 --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                 --pidfile --detach

ovs-vsctl --no-wait init
ovs-vswitchd --pidfile --detach

ovs-vsctl show

depmod -A openvswitch
