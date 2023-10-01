# proxmox options

<ul>
<li>
  <b><u>proxmox.defaults.lxc</u></b><br>
  <b>type</b>: submodule<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Default values inheritible by all LXC containers.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.arch</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Sets the container OS architecture type.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.clone</u></b><br>
  <b>type</b>: null or integer between 100 and 2147483647 (both inclusive)<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: VMID of LXC to clone
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.clone_storage</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Target storage for full clone.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.cmode</u></b><br>
  <b>type</b>: null or one of &#34;tty&#34;, &#34;console&#34;, &#34;shell&#34;<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Configures console mode.
&#34;tty&#34; tries to open a connection to one of the available tty devices.
&#34;console&#34; tries to attach to /dev/console instead.
&#34;shell&#34; simply invokes a shell inside the container (no login).
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.cores</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The number of cores assigned to the container.
A container can use all available cores by default.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.cpulimit</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number to limit CPU usage by.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.cpuunits</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number of the CPU weight that the container possesses.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.domain</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;localdomain&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Domain to use when deploying 
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.features</u></b><br>
  <b>type</b>: submodule<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: An object for allowing the container to access advanced features.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.features.fuse</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean for enabling FUSE mounts.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.features.keyctl</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean for enabling the `keyctl()` system call.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.features.mknod</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Allow unprivileged containers to use mknod() to add certain device nodes.
This requires a kernel with seccomp trap to user space support (5.3 or newer).
This is experimental.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.features.mount</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Defines the filesystem types (separated by semicolons) that are allowed to be mounted.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.features.nesting</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: true<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean to allow nested virtualization.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.flake</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
Use null to skip attempting to deploy NixOS configuration changes.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.force</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that allows the overwriting of pre-existing containers.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.full</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: When cloning, create a full copy of all disks.
This is always done when you clone a normal CT.
For CT template it creates a linked clone by default.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.hookscript</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A string containing a volume identifier to a script that
will be executed during various steps throughout the container&#39;s lifetime.
The script must be an executable file.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.memory</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number containing the amount of RAM to assign to the container (in MB).
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.nameserver</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The DNS server IP address used by the container. 
If neither nameserver nor searchdomain are specified, 
the values of the Proxmox host will be used by default.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.onboot</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Whether to start the container on boot.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.ostemplate</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The volume identifier that points to the OS template or backup file.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.password</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Sets the root password inside the container.
Doesn&#39;t seem to work with NixOS containers.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.pool</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the Proxmox resource pool to add this container to.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.protection</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that enables the protection flag on this container. 
Stops the container and its disk from being removed/updated. 
Default is false.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.rootfs.size</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Size of the underlying volume.
Must end in G, M, or K (e.g. &#34;1G&#34;, &#34;1024M&#34; , &#34;1048576K&#34;).
Cannot be changed after initial creation.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.rootfs.storage</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A string containing the volume , directory, or device to be
mounted into the container (at the path specified by mp).
E.g. local-lvm, local-zfs, local etc.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.ssh_public_keys</u></b><br>
  <b>type</b>: null or strings concatenated with &#34;\n&#34;<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the Proxmox resource pool to add this container to.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.start</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that determines if the container is started after creation.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.startup</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;order=1,up=5&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The startup and shutdown behaviour of the container.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.swap</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number that sets the amount of swap memory available to the container.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.tags</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Tags of the container. This is only meta information.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.target_node</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the Proxmox Node on which to place the VM
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.unique</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Whether a unique random ethernet address is assigned to the container.
<br>
</li>
<li>
  <b><u>proxmox.defaults.lxc.unprivileged</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: true<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that makes the container run as an unprivileged user.
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu</u></b><br>
  <b>type</b>: submodule<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Default values inheritable by all Qemu VMs.
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.agent</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: true<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Wether to enable the QEMU Guest Agent.
Note: you must run the qemu-guest-agent daemon in the guest for this to have any effect.
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.balloon</u></b><br>
  <b>type</b>: null or unsigned integer, meaning &gt;=0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The minimum amount of memory to allocate to the VM in MB.
See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_memory for documentation.
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.bios</u></b><br>
  <b>type</b>: one of &#34;seabios&#34;, &#34;ovmf&#34;<br>
  <b>default</b>: &#34;ovmf&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: BIOS mode to use<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.boot</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The boot order for the VM. Ordered string of characters denoting boot order.
Options: floppy (a), hard disk (c), CD-ROM (d), or network (n).
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.clone</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The base VM from which to clone to create the new VM.
Note: clone is mutually exclussive with pxe and iso
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.cores</u></b><br>
  <b>type</b>: positive integer, meaning &gt;0<br>
  <b>default</b>: 1<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The number of CPU cores per socket to allocate to the VM<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.flake</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
Use null to skip attempting to deploy NixOS configuration changes.
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.full_clone</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Wether to perform a full clone.
See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_copy_and_clone for documentation
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.iso</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;local:iso/debian.iso&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The name of the ISO image to mount to the VM.
Only applies when clone is not set.
Note: iso is mutually exclussive with clone and pxe
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.memory</u></b><br>
  <b>type</b>: positive integer, meaning &gt;0<br>
  <b>default</b>: 512<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The amount of memory to alloate to the VM in MB<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.numa</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Non-Uniform Memory Access
See https://pve.proxmox.com/pve-docs/chapter-qm.html#_numa for documentation
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.onboot</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Whether to start this VM on PVE startup
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.os_type</u></b><br>
  <b>type</b>: null or one of &#34;ubuntu&#34;, &#34;centos&#34;, &#34;cloud-init&#34;<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Which provisioning method to use, based on the OS type.<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.pool</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The resource pool to which the VM will be added<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.pxe</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: PXE boot of the VM. Requires network be set first in boot
Note: pxe is mutually exclussive with clone and iso
<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.scsihw</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;virtio-scsi-pci&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The SCSI controller type to be used<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.sockets</u></b><br>
  <b>type</b>: positive integer, meaning &gt;0<br>
  <b>default</b>: 1<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The number of CPU sockets to allocate to the VM<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.sshkeys</u></b><br>
  <b>type</b>: null or strings concatenated with &#34;\n&#34;<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: SSH public keys to add to authorized keys file for cloud-init user<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.tags</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Tags of the VM. This is only meta information.<br>
</li>
<li>
  <b><u>proxmox.defaults.qemu.target_node</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The name of the Proxmox Node on which to place the VM
<br>
</li>
<li>
  <b><u>proxmox.enable</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Whether to enable proxmox provider
See https://registry.terraform.io/providers/Telmate/proxmox for documentation
.<br>
</li>
<li>
  <b><u>proxmox.lxc</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: LXC containers deploy to PVE<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.arch</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.arch&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Sets the container OS architecture type.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.clone</u></b><br>
  <b>type</b>: null or integer between 100 and 2147483647 (both inclusive)<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.clone&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: VMID of LXC to clone
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.clone_storage</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.clone_storage&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Target storage for full clone.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.cmode</u></b><br>
  <b>type</b>: null or one of &#34;tty&#34;, &#34;console&#34;, &#34;shell&#34;<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.cmode&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Configures console mode.
&#34;tty&#34; tries to open a connection to one of the available tty devices.
&#34;console&#34; tries to attach to /dev/console instead.
&#34;shell&#34; simply invokes a shell inside the container (no login).
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.cores</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.cores&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The number of cores assigned to the container.
A container can use all available cores by default.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.cpulimit</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.cpulimit&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number to limit CPU usage by.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.cpuunits</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.cpuunits&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number of the CPU weight that the container possesses.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.domain</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.domain&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Domain to use when deploying 
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.enable</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Whether to enable deploying this container.<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.features</u></b><br>
  <b>type</b>: submodule<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: An object for allowing the container to access advanced features.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.features.fuse</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.features.fuse&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean for enabling FUSE mounts.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.features.keyctl</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.features.keyctl&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean for enabling the `keyctl()` system call.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.features.mknod</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.features.mknod&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Allow unprivileged containers to use mknod() to add certain device nodes.
This requires a kernel with seccomp trap to user space support (5.3 or newer).
This is experimental.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.features.mount</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.features.mount&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Defines the filesystem types (separated by semicolons) that are allowed to be mounted.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.features.nesting</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.features.nesting&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean to allow nested virtualization.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.flake</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.flake&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
Use null to skip attempting to deploy NixOS configuration changes.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.force</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.force&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that allows the overwriting of pre-existing containers.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.full</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.full&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: When cloning, create a full copy of all disks.
This is always done when you clone a normal CT.
For CT template it creates a linked clone by default.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.hookscript</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.hookscript&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A string containing a volume identifier to a script that
will be executed during various steps throughout the container&#39;s lifetime.
The script must be an executable file.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.hostname</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${name}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Specifies the host name of the container.<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.memory</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.memory&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number containing the amount of RAM to assign to the container (in MB).
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: An attribute set describing the mount points present in this container
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.acl</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Wether to enable ACL support<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.backup</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Wether to enable including this mount point in backups<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.mp</u></b><br>
  <b>type</b>: path<br>
  <b>default</b>: &#34;${name}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The path to the mount point as seen from inside the container. 
The path must not contain symlinks for security reasons.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.quota</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Wether to enable user quotas inside the container for this mount point<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.replicate</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Wether to enable including this volume in a storage replica job<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.shared</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Wether to enable marking this volume as available to all nodes<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.size</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;20G&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Size of the underlying volume.
Must end in G, M, or K (e.g. &#34;1G&#34;, &#34;1024M&#34; , &#34;1048576K&#34;).
Cannot be changed after initial creation.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.mountpoint.&lt;name&gt;.storage</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;local-lvm&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A string containing the volume , directory, or device to be mounted
into the container (at the path specified by mp).
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.name</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${name}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Name to use when creating terraform resources<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.nameserver</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.nameserver&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The DNS server IP address used by the container. 
If neither nameserver nor searchdomain are specified, 
the values of the Proxmox host will be used by default.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: An attribute set describing the network adapters present in this container
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.bridge</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Bridge to which the network device should be attached<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.firewall</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Whether to enable the Proxmox firewall on this network device.<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.hwaddr</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Override the randomly generated MAC Address for the container<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.ip</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The IPv4 address of the network interface. 
Can be a static IPv4 address (in CIDR notation), &#34;dhcp&#34;, or &#34;manual&#34;.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.ip6</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The IPv6 address of the network interface. 
Can be a static IPv6 address (in CIDR notation), &#34;auto&#34;, &#34;dhcp&#34;, or &#34;manual&#34;.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.name</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${name}&#34;<br>
  <b>example</b>: &#34;eth0&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the network interface as seen from inside the container.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.network.&lt;name&gt;.tag</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The VLAN tag to apply to packets on this device<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.onboot</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.onboot&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Whether to start the container on boot.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.ostemplate</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.ostemplate&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The volume identifier that points to the OS template or backup file.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.password</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.password&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Sets the root password inside the container.
Doesn&#39;t seem to work with NixOS containers.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.pool</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.pool&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the Proxmox resource pool to add this container to.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.protection</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.protection&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that enables the protection flag on this container. 
Stops the container and its disk from being removed/updated. 
Default is false.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.rootfs.size</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.rootfs.size&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Size of the underlying volume.
Must end in G, M, or K (e.g. &#34;1G&#34;, &#34;1024M&#34; , &#34;1048576K&#34;).
Cannot be changed after initial creation.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.rootfs.storage</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.rootfs.storage&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A string containing the volume , directory, or device to be
mounted into the container (at the path specified by mp).
E.g. local-lvm, local-zfs, local etc.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.ssh_public_keys</u></b><br>
  <b>type</b>: null or strings concatenated with &#34;\n&#34;<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.ssh_public_keys&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the Proxmox resource pool to add this container to.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.start</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.start&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that determines if the container is started after creation.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.startup</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.startup&#34;<br>
  <b>example</b>: &#34;order=1,up=5&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The startup and shutdown behaviour of the container.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.swap</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.swap&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A number that sets the amount of swap memory available to the container.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.tags</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.tags&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Tags of the container. This is only meta information.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.target_node</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.target_node&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: The name of the Proxmox Node on which to place the VM
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.unique</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.unique&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: Whether a unique random ethernet address is assigned to the container.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.unprivileged</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.lxc.unprivileged&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: A boolean that makes the container run as an unprivileged user.
<br>
</li>
<li>
  <b><u>proxmox.lxc.&lt;name&gt;.vmid</u></b><br>
  <b>type</b>: null or integer between 100 and 2147483647 (both inclusive)<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/lxc.nix">module/lxc.nix</a><br>
  <b>description</b>: VMID to assign this container or `null` for next available ID
<br>
</li>
<li>
  <b><u>proxmox.provider.endpoint</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;https://pve.example.com:8006/api2/json&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Proxmox API endpoint
<br>
</li>
<li>
  <b><u>proxmox.provider.log_level</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Log level to use for proxmox provider or null to disable logging.

Logs will be written to terraform-plugin-proxmox.log. This may be 
overriden with provider.proxmox.pm_log_file
<br>
</li>
<li>
  <b><u>proxmox.provider.password</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Proxmox password for API user authentication.
May be also be provied through PM_PASSWORD environment variable
<br>
</li>
<li>
  <b><u>proxmox.provider.token_id</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;myuser@pve!terraform&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Proxmox token id for API token authentication.
May be also be provied through PM_AP_TOKEN_ID environment variable
<br>
</li>
<li>
  <b><u>proxmox.provider.token_secret</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;00000000-0000-0000-0000-000000000000&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Proxmox token secret for API token authentication.
May be also be provied through PM_AP_TOKEN_SECRET environment variable
<br>
</li>
<li>
  <b><u>proxmox.provider.user</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;myuser@pve&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Proxmox user for API user authentication.
May be also be provied through PM_USER environment variable
<br>
</li>
<li>
  <b><u>proxmox.provider.version</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Version of the telmate/proxmox provider to use<br>
</li>
<li>
  <b><u>proxmox.qemu</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Qemu VMs deployed to PVE<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.agent</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.agent&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Wether to enable the QEMU Guest Agent.
Note: you must run the qemu-guest-agent daemon in the guest for this to have any effect.
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.balloon</u></b><br>
  <b>type</b>: null or unsigned integer, meaning &gt;=0<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.balloon&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The minimum amount of memory to allocate to the VM in MB.
See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_memory for documentation.
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.bios</u></b><br>
  <b>type</b>: one of &#34;seabios&#34;, &#34;ovmf&#34;<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.bios&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: BIOS mode to use<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.boot</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.boot&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The boot order for the VM. Ordered string of characters denoting boot order.
Options: floppy (a), hard disk (c), CD-ROM (d), or network (n).
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.clone</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.clone&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The base VM from which to clone to create the new VM.
Note: clone is mutually exclussive with pxe and iso
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.cores</u></b><br>
  <b>type</b>: positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.cores&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The number of CPU cores per socket to allocate to the VM<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.desc</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;Terraform managed VM&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The description of the VM. Shows as the &#39;Notes&#39; field in the Proxmox GUI.
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.disk</u></b><br>
  <b>type</b>: null or list of submodules<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Disks to attach to this VM<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.disk.*.discard</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Controls whether to pass discard/trim requests to the underlying storage
Not supported for `efidisk`
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.disk.*.size</u></b><br>
  <b>type</b>: string matching the pattern [0-9]+[GMK]<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The size of the created disk<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.disk.*.ssd</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Whether to enable SSD emulation on disk
Not supported for `efidisk`
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.disk.*.storage</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;local-lvm&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: he name of the storage pool on which to store the disk<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.disk.*.type</u></b><br>
  <b>type</b>: one of &#34;efidisk&#34;, &#34;ide&#34;, &#34;sata&#34;, &#34;scsi&#34;, &#34;virtio&#34;<br>
  <b>default</b>: &#34;virtio&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The type of disk device to add<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.domain</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: &#34;local&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Domain used for generate FQDN for provisioning<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.enable</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Whether to enable deploying this VM.<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.flake</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.flake&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Flake to use for deploying NixOS configuration changes via https://github.com/numtide/terraform-deploy-nixos-flakes
Use null to skip attempting to deploy NixOS configuration changes.
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.full_clone</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.full_clone&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Wether to perform a full clone.
See https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_copy_and_clone for documentation
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.iso</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.iso&#34;<br>
  <b>example</b>: &#34;local:iso/debian.iso&#34;<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The name of the ISO image to mount to the VM.
Only applies when clone is not set.
Note: iso is mutually exclussive with clone and pxe
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.memory</u></b><br>
  <b>type</b>: positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.memory&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The amount of memory to alloate to the VM in MB<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.name</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${name}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Name of the VM<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.network</u></b><br>
  <b>type</b>: list of submodules<br>
  <b>default</b>: []<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Network devices to attach to this VM<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.network.*.bridge</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;nat&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Bridge to which the network device should be attached<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.network.*.firewall</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Whether to enable the Proxmox firewall on this network device.<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.network.*.macaddr</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Override the randomly generated MAC Address for the VM<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.network.*.model</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;virtio&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Network Card Model.
The virtio model provides the best performance with very low CPU overhead.
If your guest does not support this driver, it is usually best to use e1000.
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.network.*.tag</u></b><br>
  <b>type</b>: null or positive integer, meaning &gt;0<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The VLAN tag to apply to packets on this device<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.numa</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.numa&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Non-Uniform Memory Access
See https://pve.proxmox.com/pve-docs/chapter-qm.html#_numa for documentation
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.onboot</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.onboot&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Whether to start this VM on PVE startup
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.os_type</u></b><br>
  <b>type</b>: null or one of &#34;ubuntu&#34;, &#34;centos&#34;, &#34;cloud-init&#34;<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.os_type&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Which provisioning method to use, based on the OS type.<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.pool</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.pool&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The resource pool to which the VM will be added<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.pxe</u></b><br>
  <b>type</b>: null or boolean<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.pxe&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: PXE boot of the VM. Requires network be set first in boot
Note: pxe is mutually exclussive with clone and iso
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.scsihw</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.scsihw&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The SCSI controller type to be used<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.sockets</u></b><br>
  <b>type</b>: positive integer, meaning &gt;0<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.sockets&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The number of CPU sockets to allocate to the VM<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.sshkeys</u></b><br>
  <b>type</b>: null or strings concatenated with &#34;\n&#34;<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.sshkeys&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: SSH public keys to add to authorized keys file for cloud-init user<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.startup</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The Proxmox startup/shutdown behaviour<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.tags</u></b><br>
  <b>type</b>: null or string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.tags&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: Tags of the VM. This is only meta information.<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.target_node</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;config.proxmox.defaults.qemu.target_node&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: The name of the Proxmox Node on which to place the VM
<br>
</li>
<li>
  <b><u>proxmox.qemu.&lt;name&gt;.vmid</u></b><br>
  <b>type</b>: null or integer between 100 and 2147483647 (both inclusive)<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule/qemu.nix">module/qemu.nix</a><br>
  <b>description</b>: VMID to use for creation or `null` to auto-assign the next available ID
<br>
</li>
<li>
  <b><u>proxmox.show_deploy_output</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/scottbot95/terranix-proxmox/tree/main/modulemodule">module</a><br>
  <b>description</b>: Whether to enable showing output from nixos_deploy
      May include sensitive information
.<br>
</li>
</ul>
