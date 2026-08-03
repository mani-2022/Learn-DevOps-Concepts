Day 1 - Linux Fundamentals for DevOps
Learning Objectives

By the end of Day 1, you should understand:

What Linux is
Difference between Linux Kernel and Linux Distribution
Linux Boot Process
Linux Filesystem Hierarchy
Important Linux Directories
Absolute vs Relative Paths
Basic Linux Navigation Commands
File and Directory Operations
Searching Files and Text
Process vs Program
Virtual Filesystem (/proc)
1. What is Linux?

Linux is an open-source operating system kernel developed by Linus Torvalds in 1991.

The Linux Kernel is the core component of the operating system. It acts as an interface between the hardware and the applications.

Responsibilities of the Kernel
Process Management
Memory Management
Device Management
File System Management
Network Management
Security and Access Control
Architecture
+----------------------+
|   User Applications  |
+----------------------+
           |
+----------------------+
|    Linux Kernel      |
+----------------------+
           |
+----------------------+
|      Hardware        |
+----------------------+
2. Linux Kernel vs Linux Distribution
Linux Kernel

The kernel is the heart of the operating system.

Responsibilities:

CPU Scheduling
Memory Allocation
Hardware Communication
Device Drivers
Networking
File Systems

Examples:

Linux Kernel 5.x
Linux Kernel 6.x
Linux Distribution

A Linux Distribution (Distro) is a complete operating system built around the Linux kernel.

It contains:

Linux Kernel
GNU Utilities
Package Manager
Shell
System Libraries
Applications

Examples:

Ubuntu
Debian
RHEL
Rocky Linux
AlmaLinux
Fedora
Interview Question

Can Linux run with only the Kernel?

No.

The kernel alone is not sufficient. A usable operating system also requires user-space tools, libraries, a shell, and utilities.

3. Linux Boot Process

The Linux boot process consists of several stages.

Power ON
      |
      v
BIOS / UEFI
      |
      v
Bootloader (GRUB)
      |
      v
Linux Kernel
      |
      v
systemd (PID 1)
      |
      v
Services Start
      |
      v
Login Prompt
BIOS / UEFI

Initializes the hardware and starts the bootloader.

GRUB

GRUB (Grand Unified Bootloader)

Responsibilities:

Loads the Linux Kernel
Passes control to the Kernel
Linux Kernel

The kernel initializes:

CPU
Memory
Device Drivers
Filesystems
systemd

systemd is the default init system on most Linux distributions.

Responsibilities:

Starts services
Stops services
Restarts failed services
Manages system boot
Handles service dependencies
Collects logs through journald

Useful Commands

ps -p 1
systemctl status sshd
systemctl restart nginx
systemctl enable docker
4. Linux Filesystem Hierarchy

Linux follows a hierarchical directory structure that starts from a single root directory (/).

/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
5. Important Linux Directories
Directory	Purpose
/	Root directory of the filesystem
/bin	Essential system commands
/boot	Boot files and kernel
/dev	Device files
/etc	System-wide configuration files
/home	User home directories
/lib	Shared libraries
/media	Removable media mount points
/mnt	Temporary mount points
/opt	Optional third-party software
/proc	Virtual filesystem providing process and kernel information
/root	Root user's home directory
/run	Runtime data
/sbin	System administration binaries
/srv	Service data
/sys	Kernel and hardware information
/tmp	Temporary files
/usr	User applications and libraries
/var	Variable data such as logs, mail, cache, databases
6. Absolute Path vs Relative Path
Absolute Path

An absolute path always starts from the root directory (/).

Example

/home/manikanta/Documents/file.txt
Relative Path

A relative path starts from the current working directory.

Example

If current directory is:

/home/manikanta

Then

Documents/file.txt

is a relative path.

7. Basic Navigation Commands
Present Working Directory
pwd

Displays the current working directory.

List Files
ls

List files and directories.

Detailed view

ls -l

Include hidden files

ls -la
Change Directory
cd /home

Go to home directory

cd ~

Go back one directory

cd ..
8. Creating Files and Directories

Create a directory

mkdir DevOps

Create nested directories

mkdir -p DevOps/Linux/Lab1

Create an empty file

touch notes.txt
9. Viewing File Content

Display entire file

cat file.txt

View large files

less file.txt

First 10 lines

head file.txt

Last 10 lines

tail file.txt
10. Copy, Move, Rename and Delete

Copy file

cp file1 file2

Copy directory

cp -r folder backup

Move or rename

mv old.txt new.txt

Delete file

rm file.txt

Delete directory

rm -r folder

Warning: Use rm -r and rm -rf with extreme caution, especially when running as root. Deleted files are not moved to a recycle bin.

11. Searching Files

Find all .log files

find . -name "*.log"
12. Searching Text

Find the word "ERROR"

grep "ERROR" app.log

Search recursively

grep -r "Linux" .
13. Program vs Process
Program

A program is a static executable stored on disk.

Examples:

ls
python
docker
Process

A process is a running instance of a program.

Every running application is a process.

Example

python app.py

creates a Python process.

View running processes

ps -ef
Interview Answer

A program is stored on disk, while a process is a program currently executing in memory.

14. What Happens When You Run ls?
You type ls in the shell.
The shell searches for the ls executable using the PATH environment variable.
The shell creates a new process.
The Linux kernel loads the executable into memory.
The ls process requests directory contents from the kernel.
The kernel reads the filesystem metadata.
The ls process formats the output.
The shell displays the results.
The process exits.
15. The /proc Virtual Filesystem

/proc is a virtual filesystem created dynamically by the Linux kernel.

The files inside /proc do not exist on disk. Instead, they provide real-time information about the running system.

Useful examples

CPU Information

cat /proc/cpuinfo

Memory Information

cat /proc/meminfo

Kernel Version

cat /proc/version

System Uptime

cat /proc/uptime
16. What Happens When You Delete a File?

When you run:

rm file.txt

The file is not moved to a recycle bin.

Instead, Linux removes the directory entry pointing to the file. The data blocks may remain on disk until they are overwritten, but from a user's perspective, the file should be considered permanently deleted.

Key Commands Learned
Command	Description
pwd	Print current working directory
ls	List files and directories
cd	Change directory
mkdir	Create directories
touch	Create an empty file
cat	Display file contents
less	View large files page by page
head	Display the first lines of a file
tail	Display the last lines of a file
cp	Copy files or directories
mv	Move or rename files/directories
rm	Remove files or directories
find	Search for files
grep	Search for text within files
ps	Display running processes
systemctl	Manage services using systemd
