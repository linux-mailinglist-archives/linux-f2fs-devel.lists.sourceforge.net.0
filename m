Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEDB12E101
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2020 00:32:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1imnTz-0008FZ-46; Wed, 01 Jan 2020 23:32:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=qmMd=2W=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1imnTs-0008Eq-QR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jan 2020 23:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KuXIchIXVX6CloZQu2Gep23BGqzL/ylAn2lFr5tlZu8=; b=J+oudWWR1lkPw+m361RoP8sfaJ
 NgwEqi0L5NVbk4DjJnLljbe4uJjsxhjYsHMBtj6NM5ebxd5i5owgOdurpL3UySrIaqMjcD+1OKNUd
 37j433qOhaMFF67Bed7J6G9/SdC9W/zv2Xax189t4gJTaRBZp/x/DPSHkbnZhINnSURg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KuXIchIXVX6CloZQu2Gep23BGqzL/ylAn2lFr5tlZu8=; b=b
 un+ARU1uZzGl6ZQgOVYP/sBpiaIKaI3oYfoiZloJyJuUyfxilEuNDm+1Wot2xrZdTodqp/y6zM8yz
 5UePXpmQVsGX5K78qvV21+MKXfWYH5EO3I+MT0SwgUgoV5l2pdC2qzegDowW5NRLYJnd9KFIronEJ
 wsjjuTB9Cjmu2Yqk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1imnTm-006Kjy-4G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jan 2020 23:32:48 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Jan 2020 23:32:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@ixit.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206057-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ixit.cz]
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1imnTm-006Kjy-4G
Subject: [f2fs-dev] [Bug 206057] New: 5.5.0: f2fs is extremely slow,
 with ext4 system works well
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=206057

            Bug ID: 206057
           Summary: 5.5.0: f2fs is extremely slow, with ext4 system works
                    well
           Product: File System
           Version: 2.5
    Kernel Version: 5.5.0-rc2-next
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: david@ixit.cz
        Regression: No

Machine model: ASUS Google Nexus 7 2012 (Project Bach)

used "f2fs: support data compression" from kernel/git/jaegeuk/f2fs.git . (to
fix 32bit divide compilation issue)

Compiled without F2FS compression support.

It seems that f2fs doing something extremely slow? After I flashed data onto
f2fs, tablet started behave slow and even didn't run Phoc UI.

/dev/mapper/mmcblk1p10p2 on / type f2fs
(rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix)

Failures:

[   12.291917] F2FS-fs (dm-1): Mounted with checkpoint version = 64abe365
[   14.617980] random: crng init done
[   14.989616] udevd[687]: starting version 3.2.9
[   15.257380] udevd[687]: starting eudev-3.2.9
[   16.584866] Bluetooth: HCI UART driver ver 2.3
[   16.584879] Bluetooth: HCI UART protocol H4 registered
[   16.589646] Bluetooth: HCI UART protocol Broadcom registered
[   17.002771] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4330-sdio
for chip BCM4330/4
[   17.041791] Bluetooth: hci0: BCM: chip id 62
[   17.042404] Bluetooth: hci0: BCM: features 0x0f
[   17.044464] Bluetooth: hci0: BCM4330B1
[   17.044480] Bluetooth: hci0: BCM4330B1 (002.001.003) build 0000
[   17.087552] bluetooth hci0: Direct firmware load for brcm/BCM4330B1.hcd
failed with error -2
[   17.087583] Bluetooth: hci0: BCM: Patch brcm/BCM4330B1.hcd not found
[   17.313674] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4330-sdio
for chip BCM4330/4
[   17.313993] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available
(err=-2), device may have limited channels available
[   17.318905] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4330/4 wl0: Jan 23
2013 17:47:42 version 5.90.195.114 FWID 01-73201c1f
[   20.181213] EXT4-fs (dm-0): mounting ext2 file system using the ext4
subsystem
[   20.202239] EXT4-fs (dm-0): mounted filesystem without journal. Opts: (null)
[   20.202311] ext2 filesystem being mounted at /boot supports timestamps until
2038 (0x7fffffff)
[   22.994765] elogind-daemon[1245]: Failed to create inotify watch on
/dev/null/utmp, ignoring: Not a directory
[   23.006602] elogind-daemon[1245]: New seat seat0.
[   23.182764] elogind-daemon[1245]: Watching system buttons on
/dev/input/event3 (gpio-keys)
[   23.329474] elogind-daemon[1245]: Failed to set utmp path to /dev/null/utmp:
Not supported
[   24.169197] ieee80211 phy0: brcmf_p2p_create_p2pdev: timeout occurred
[   24.169221] ieee80211 phy0: brcmf_cfg80211_add_iface: add iface
p2p-dev-wlan0 type 10 failed: err=-5
[   25.008074] elogind-daemon[1245]: Failed to create inotify watch on
/dev/null/utmp, ignoring: Not a directory
[   25.022306] elogind-daemon[1245]: New session c1 of user okias.
[   35.682232] vdd_camera: disabling
[   35.683021] avdd_dsi_csi: disabling
[   36.930091] rfkill: input handler disabled
[  243.681507] INFO: task kworker/u8:2:222 blocked for more than 122 seconds.
[  243.681588]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.681622] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.681661] kworker/u8:2    D    0   222      2 0x00000000
[  243.681834] Workqueue: writeback wb_workfn (flush-254:1)
[  243.682036] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.682195] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  243.682331] [<c0163b88>] (rwsem_down_write_slowpath) from [<c0388c50>]
(f2fs_write_single_data_page+0x420/0x4bc)
[  243.682438] [<c0388c50>] (f2fs_write_single_data_page) from [<c0388f90>]
(f2fs_write_cache_pages+0x2a4/0x3d8)
[  243.682526] [<c0388f90>] (f2fs_write_cache_pages) from [<c0389218>]
(f2fs_write_data_pages+0x154/0x228)
[  243.682663] [<c0389218>] (f2fs_write_data_pages) from [<c01f4374>]
(do_writepages+0x34/0x68)
[  243.682771] [<c01f4374>] (do_writepages) from [<c02660d4>]
(__writeback_single_inode+0x64/0x4d8)
[  243.682871] [<c02660d4>] (__writeback_single_inode) from [<c0266790>]
(writeback_sb_inodes+0x248/0x428)
[  243.682958] [<c0266790>] (writeback_sb_inodes) from [<c02669d4>]
(__writeback_inodes_wb+0x64/0xa0)
[  243.683097] [<c02669d4>] (__writeback_inodes_wb) from [<c0266bf0>]
(wb_writeback+0x1e0/0x34c)
[  243.683209] [<c0266bf0>] (wb_writeback) from [<c02678b8>]
(wb_workfn+0x194/0x3dc)
[  243.683307] [<c02678b8>] (wb_workfn) from [<c013876c>]
(process_one_work+0x19c/0x35c)
[  243.683395] [<c013876c>] (process_one_work) from [<c0138e70>]
(worker_thread+0x234/0x2d8)
[  243.683518] [<c0138e70>] (worker_thread) from [<c013d7a4>]
(kthread+0xfc/0x104)
[  243.683622] [<c013d7a4>] (kthread) from [<c01010f0>]
(ret_from_fork+0x14/0x24)
[  243.683668] Exception stack(0xdd4a9fb0 to 0xdd4a9ff8)
[  243.683729] 9fa0:                                     00000000 00000000
00000000 00000000
[  243.683805] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[  243.683869] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  243.684158] INFO: task phosh:1420 blocked for more than 122 seconds.
[  243.684201]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.684231] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.684263] phosh           D    0  1420   1397 0x00000000
[  243.684418] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.684536] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  243.684671] [<c0163b88>] (rwsem_down_write_slowpath) from [<c036f534>]
(f2fs_rename2+0x670/0x8fc)
[  243.684779] [<c036f534>] (f2fs_rename2) from [<c024978c>]
(vfs_rename+0x2a4/0x3e8)
[  243.684878] [<c024978c>] (vfs_rename) from [<c024aec0>]
(do_renameat2+0x2b0/0x38c)
[  243.684978] [<c024aec0>] (do_renameat2) from [<c024cafc>]
(sys_rename+0x20/0x28)
[  243.685070] [<c024cafc>] (sys_rename) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.685113] Exception stack(0xdc1a7fa8 to 0xdc1a7ff0)
[  243.685188] 7fa0:                   006bc3a0 00723190 0055b522 0055b4d0
00000000 00000000
[  243.685276] 7fc0: 006bc3a0 00723190 0055b4c0 00000026 00000011 fc02fc05
00000000 000001ed
[  243.685337] 7fe0: b5abce9c be9d34b4 b5a7ef78 b6efd018
[  243.685804] INFO: task dconf-service:1612 blocked for more than 122 seconds.
[  243.685854]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.685885] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.685918] dconf-service   D    0  1612      1 0x00000000
[  243.686090] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.686211] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  243.686322] [<c0163b88>] (rwsem_down_write_slowpath) from [<c0363fa8>]
(f2fs_add_regular_entry+0x150/0x270)
[  243.686410] [<c0363fa8>] (f2fs_add_regular_entry) from [<c0364128>]
(f2fs_add_dentry+0x60/0xc4)
[  243.686490] [<c0364128>] (f2fs_add_dentry) from [<c0364278>]
(f2fs_do_add_link+0xec/0xfc)
[  243.686581] [<c0364278>] (f2fs_do_add_link) from [<c036dc10>]
(f2fs_add_link+0x24/0x2c)
[  243.686679] [<c036dc10>] (f2fs_add_link) from [<c036f738>]
(f2fs_rename2+0x874/0x8fc)
[  243.686770] [<c036f738>] (f2fs_rename2) from [<c024978c>]
(vfs_rename+0x2a4/0x3e8)
[  243.686851] [<c024978c>] (vfs_rename) from [<c024aec0>]
(do_renameat2+0x2b0/0x38c)
[  243.686937] [<c024aec0>] (do_renameat2) from [<c024cafc>]
(sys_rename+0x20/0x28)
[  243.687027] [<c024cafc>] (sys_rename) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.687070] Exception stack(0xdbb93fa8 to 0xdbb93ff0)
[  243.687150] 3fa0:                   00000000 004b72d0 004b62d0 004b72d0
00000000 96fbdf41
[  243.687239] 3fc0: 00000000 004b72d0 004b62d0 00000026 00000001 bec5d5a8
0048912a bec5d630
[  243.687298] 3fe0: 0049af84 bec5d554 0048417c b6f12018
[  243.687370] INFO: task pulseaudio:1630 blocked for more than 122 seconds.
[  243.687408]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.687439] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.687466] pulseaudio      D    0  1630      1 0x00000000
[  243.687606] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.687724] [<c0989f98>] (schedule) from [<c098c860>]
(rwsem_down_read_slowpath+0x2ec/0x304)
[  243.687835] [<c098c860>] (rwsem_down_read_slowpath) from [<c036e9dc>]
(f2fs_new_inode+0x44/0x390)
[  243.687933] [<c036e9dc>] (f2fs_new_inode) from [<c036fbc8>]
(f2fs_create+0x4c/0x2b8)
[  243.688026] [<c036fbc8>] (f2fs_create) from [<c024bbe0>]
(path_openat+0x730/0xb34)
[  243.688110] [<c024bbe0>] (path_openat) from [<c024c024>]
(do_filp_open+0x40/0xa4)
[  243.688211] [<c024c024>] (do_filp_open) from [<c023b62c>]
(do_sys_openat2+0x70/0xf8)
[  243.688306] [<c023b62c>] (do_sys_openat2) from [<c023b7a0>]
(do_sys_open+0x40/0x64)
[  243.688391] [<c023b7a0>] (do_sys_open) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.688433] Exception stack(0xdb5c7fa8 to 0xdb5c7ff0)
[  243.688511] 7fa0:                   00080241 004d40f0 004d40f0 000a0241
000001b6 00000077
[  243.688599] 7fc0: 00080241 004d40f0 00508260 00000005 b25106f2 b6cddf84
02c6ae8e 00000000
[  243.688658] 7fe0: 00508262 bed95770 00006577 b6f12ba8
[  243.688738] INFO: task chatty:1662 blocked for more than 122 seconds.
[  243.688775]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.688806] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.688834] chatty          D    0  1662   1397 0x00000000
[  243.688971] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.689092] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  243.689623] [<c0163b88>] (rwsem_down_write_slowpath) from [<c037e244>]
(f2fs_write_checkpoint+0x144/0xe50)
[  243.689739] [<c037e244>] (f2fs_write_checkpoint) from [<c0376a74>]
(f2fs_sync_fs+0xf0/0x198)
[  243.689838] [<c0376a74>] (f2fs_sync_fs) from [<c0366604>]
(f2fs_do_sync_file+0x3c4/0x6fc)
[  243.689928] [<c0366604>] (f2fs_do_sync_file) from [<c0366984>]
(f2fs_sync_file+0x48/0x50)
[  243.690036] [<c0366984>] (f2fs_sync_file) from [<c026ab40>]
(vfs_fsync+0x20/0x28)
[  243.690131] [<c026ab40>] (vfs_fsync) from [<c026ab94>] (do_fsync+0x28/0x44)
[  243.690218] [<c026ab94>] (do_fsync) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.690262] Exception stack(0xdb7f9fa8 to 0xdb7f9ff0)
[  243.690332] 9fa0:                   00000000 00000000 00000004 00000000
00000000 00000000
[  243.690416] 9fc0: 00000000 00000000 00000000 00000094 bef1a4c8 00000000
00000200 b630f0fc
[  243.690476] 9fe0: bef1a450 bef1a440 b6f40f58 b6f4039c
[  243.690539] INFO: task calls:1665 blocked for more than 122 seconds.
[  243.690579]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.690610] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.690641] calls           D    0  1665   1397 0x00000000
[  243.690795] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.690906] [<c0989f98>] (schedule) from [<c098c860>]
(rwsem_down_read_slowpath+0x2ec/0x304)
[  243.691023] [<c098c860>] (rwsem_down_read_slowpath) from [<c036e9dc>]
(f2fs_new_inode+0x44/0x390)
[  243.691125] [<c036e9dc>] (f2fs_new_inode) from [<c036f8f4>]
(f2fs_mkdir+0x34/0x110)
[  243.691301] [<c036f8f4>] (f2fs_mkdir) from [<c0248924>]
(vfs_mkdir+0x60/0x84)
[  243.691409] [<c0248924>] (vfs_mkdir) from [<c024c3dc>]
(do_mkdirat+0x98/0xd4)
[  243.691494] [<c024c3dc>] (do_mkdirat) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.691535] Exception stack(0xdb023fa8 to 0xdb023ff0)
[  243.691615] 3fa0:                   005bbdd0 005bbdd0 005bbdd0 000001ed
ffffffee 0000002f
[  243.691751] 3fc0: 005bbdd0 005bbdd0 006b4a60 00000027 000001ed 004efc30
bee70694 006b4a60
[  243.691826] 3fe0: b6e6ee5c bee70554 b6d9fef0 b6f04fc8
[  243.691901] INFO: task sudo:1718 blocked for more than 122 seconds.
[  243.691942]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.691972] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.692003] sudo            D    0  1718      1 0x00000001
[  243.692168] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.692277] [<c0989f98>] (schedule) from [<c098c860>]
(rwsem_down_read_slowpath+0x2ec/0x304)
[  243.692386] [<c098c860>] (rwsem_down_read_slowpath) from [<c036e9dc>]
(f2fs_new_inode+0x44/0x390)
[  243.692487] [<c036e9dc>] (f2fs_new_inode) from [<c036fbc8>]
(f2fs_create+0x4c/0x2b8)
[  243.692579] [<c036fbc8>] (f2fs_create) from [<c024bbe0>]
(path_openat+0x730/0xb34)
[  243.692662] [<c024bbe0>] (path_openat) from [<c024c024>]
(do_filp_open+0x40/0xa4)
[  243.692753] [<c024c024>] (do_filp_open) from [<c023b62c>]
(do_sys_openat2+0x70/0xf8)
[  243.692844] [<c023b62c>] (do_sys_openat2) from [<c023b7a0>]
(do_sys_open+0x40/0x64)
[  243.692929] [<c023b7a0>] (do_sys_open) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.692970] Exception stack(0xdbf9bfa8 to 0xdbf9bff0)
[  243.693046] bfa0:                   00000000 00000000 becfea84 000200c1
00000180 00000000
[  243.693123] bfc0: 00000000 00000000 000000c1 00000005 00000001 00000000
00000000 00000000
[  243.693183] bfe0: becfea00 becfe9f0 b6f08f58 b6f0839c
[  243.693240] INFO: task sudo:1728 blocked for more than 122 seconds.
[  243.693277]       Not tainted 5.5.0-rc2-next-20191220 #8
[  243.693306] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  243.693334] sudo            D    0  1728      1 0x00000001
[  243.693474] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  243.693598] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  243.693703] [<c0163b88>] (rwsem_down_write_slowpath) from [<c024b7f0>]
(path_openat+0x340/0xb34)
[  243.693786] [<c024b7f0>] (path_openat) from [<c024c024>]
(do_filp_open+0x40/0xa4)
[  243.693876] [<c024c024>] (do_filp_open) from [<c023b62c>]
(do_sys_openat2+0x70/0xf8)
[  243.693962] [<c023b62c>] (do_sys_openat2) from [<c023b7a0>]
(do_sys_open+0x40/0x64)
[  243.694047] [<c023b7a0>] (do_sys_open) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  243.694088] Exception stack(0xdb9d3fa8 to 0xdb9d3ff0)
[  243.694204] 3fa0:                   00000000 00000000 be89fa84 000200c1
00000180 00000000
[  243.694294] 3fc0: 00000000 00000000 000000c1 00000005 00000001 00000000
00000000 00000000
[  243.694355] 3fe0: be89fa00 be89f9f0 b6f1bf58 b6f1b39c
[  366.563352] INFO: task kworker/u8:2:222 blocked for more than 245 seconds.
[  366.563495]       Not tainted 5.5.0-rc2-next-20191220 #8
[  366.563560] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  366.563629] kworker/u8:2    D    0   222      2 0x00000000
[  366.563939] Workqueue: writeback wb_workfn (flush-254:1)
[  366.564318] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  366.564614] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  366.564875] [<c0163b88>] (rwsem_down_write_slowpath) from [<c0388c50>]
(f2fs_write_single_data_page+0x420/0x4bc)
[  366.565073] [<c0388c50>] (f2fs_write_single_data_page) from [<c0388f90>]
(f2fs_write_cache_pages+0x2a4/0x3d8)
[  366.565248] [<c0388f90>] (f2fs_write_cache_pages) from [<c0389218>]
(f2fs_write_data_pages+0x154/0x228)
[  366.565462] [<c0389218>] (f2fs_write_data_pages) from [<c01f4374>]
(do_writepages+0x34/0x68)
[  366.565658] [<c01f4374>] (do_writepages) from [<c02660d4>]
(__writeback_single_inode+0x64/0x4d8)
[  366.565845] [<c02660d4>] (__writeback_single_inode) from [<c0266790>]
(writeback_sb_inodes+0x248/0x428)
[  366.566016] [<c0266790>] (writeback_sb_inodes) from [<c02669d4>]
(__writeback_inodes_wb+0x64/0xa0)
[  366.566189] [<c02669d4>] (__writeback_inodes_wb) from [<c0266bf0>]
(wb_writeback+0x1e0/0x34c)
[  366.566355] [<c0266bf0>] (wb_writeback) from [<c02678b8>]
(wb_workfn+0x194/0x3dc)
[  366.566539] [<c02678b8>] (wb_workfn) from [<c013876c>]
(process_one_work+0x19c/0x35c)
[  366.566713] [<c013876c>] (process_one_work) from [<c0138e70>]
(worker_thread+0x234/0x2d8)
[  366.566937] [<c0138e70>] (worker_thread) from [<c013d7a4>]
(kthread+0xfc/0x104)
[  366.567139] [<c013d7a4>] (kthread) from [<c01010f0>]
(ret_from_fork+0x14/0x24)
[  366.567226] Exception stack(0xdd4a9fb0 to 0xdd4a9ff8)
[  366.567356] 9fa0:                                     00000000 00000000
00000000 00000000
[  366.567504] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[  366.567633] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  366.568099] INFO: task phosh:1420 blocked for more than 245 seconds.
[  366.568179]       Not tainted 5.5.0-rc2-next-20191220 #8
[  366.568241] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  366.568296] phosh           D    0  1420   1397 0x00000000
[  366.568594] [<c0989e00>] (__schedule) from [<c0989f98>]
(schedule+0xc8/0x120)
[  366.568822] [<c0989f98>] (schedule) from [<c0163b88>]
(rwsem_down_write_slowpath+0x294/0x3b8)
[  366.569076] [<c0163b88>] (rwsem_down_write_slowpath) from [<c036f534>]
(f2fs_rename2+0x670/0x8fc)
[  366.569910] [<c036f534>] (f2fs_rename2) from [<c024978c>]
(vfs_rename+0x2a4/0x3e8)
[  366.570139] [<c024978c>] (vfs_rename) from [<c024aec0>]
(do_renameat2+0x2b0/0x38c)
[  366.570335] [<c024aec0>] (do_renameat2) from [<c024cafc>]
(sys_rename+0x20/0x28)
[  366.570520] [<c024cafc>] (sys_rename) from [<c0101000>]
(ret_fast_syscall+0x0/0x58)
[  366.570606] Exception stack(0xdc1a7fa8 to 0xdc1a7ff0)
[  366.570761] 7fa0:                   006bc3a0 00723190 0055b522 0055b4d0
00000000 00000000
[  366.570939] 7fc0: 006bc3a0 00723190 0055b4c0 00000026 00000011 fc02fc05
00000000 000001ed
[  366.571063] 7fe0: b5abce9c be9d34b4 b5a7ef78 b6efd018

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
