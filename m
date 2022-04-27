Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB30511029
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 06:29:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njZIm-00057e-T7; Wed, 27 Apr 2022 04:29:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njZIl-00057Y-Se
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 04:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pXZGXniNwQIKPuR++hX6ICxpA9ISQnC74+2UW7HxzfA=; b=dXRBqgrIsIOx5gXeuldGK6CVWT
 KEMRj7tOpTzdteu4+WSqW8m2Op56QgTDaC+iGrfXBDUogfzWNoyHAxjUg0yg3hNLb2ZE44VI5FfuQ
 opqpnivBXV8xUy5JXVu0HP/2fuyEIm95kMPZg3P1YEft8wMc3fz46JQtu5OYrIXaVekw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pXZGXniNwQIKPuR++hX6ICxpA9ISQnC74+2UW7HxzfA=; b=D
 gVROxz/gm5hpU6ixIDOMTjoD0GD/nvIvmJGRZjv+pv5Z7oNKgVMOIaUezERlvx09JlsE5x0S4xo0/
 YSDgh/7FS+IZxzfhBKadTNeRamKukHZUCm8oYzJdpm2H7mYKS1D8bG2c4mDigN52M9IfJ+y3fIUBL
 0+xlq34b27jtmxU4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njZIi-0005GR-Bx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 04:29:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E60EF6118D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 04:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C637DC385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 04:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651033745;
 bh=+CmHZ8VeUhiybe1+1pIlGRn5GX3Tqrap17XmABQhC1M=;
 h=From:To:Subject:Date:From;
 b=CNBDsVvLY4Xp6LCLnWpJ02h5hP7r4qN2NVClqEZrCwS6Flyw/fJXXcEQMI7G8uDV4
 sEMiZOUnlBSGZ3sOTCFJfBlWXP8j6asilH7zTHxIVh8SmwSbBmVsTt3z3iHSHEhNIU
 Nq8gSsjA2cKlRM7mMLy1SDWXDEi+GoKdanOLJFTq2enWBsZ5gz2iPHQm6bDuUsk7qq
 z5OjX6ksqa6JdPpD7a58RVFzNwb/txwpLx4C6/POkez/3SDjKUZ0FGBDpL8X52lzyJ
 gBBYDHwCQ6zTiq9MFJnZVa1/6golOKppmLkmAF9l9N8bOPu5joV6NVrkYdVnjiePYR
 K7mWOXg9qUy9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A639BC05FD0; Wed, 27 Apr 2022 04:29:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 04:29:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215893-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215893 Bug ID:
 215893 Summary: F2FS Bug at fs/f2fs/checkpoint.c:192
 f2fs_is_valid_blkaddr+0xbf5/0xe50
 Product: File System Version: 2.5 Kernel Version: 5.17 Hardware: All OS:
 Linux Tree: Mainline Status: NE [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njZIi-0005GR-Bx
Subject: [f2fs-dev] [Bug 215893] New: F2FS Bug at fs/f2fs/checkpoint.c:192
 f2fs_is_valid_blkaddr+0xbf5/0xe50
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

https://bugzilla.kernel.org/show_bug.cgi?id=215893

            Bug ID: 215893
           Summary: F2FS Bug at fs/f2fs/checkpoint.c:192
                    f2fs_is_valid_blkaddr+0xbf5/0xe50
           Product: File System
           Version: 2.5
    Kernel Version: 5.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: yanming@tju.edu.cn
        Regression: No

Created attachment 300816
  --> https://bugzilla.kernel.org/attachment.cgi?id=300816&action=edit
case.c, file operations to reproduce the bug

I have encountered a bug in F2FS file system.

I created a disk image and modified some properties. After that, I mount the
image and run some commands related to file operations, and the bug occurs.

The file operations are in the "case.c" file, and a modified image named
"case.img" can be achieved from
(https://drive.google.com/file/d/1--eGC9FZW4aXt35kjpKwUp5k6k1qIpcx/view?usp=sharing).
You can reproduce the bug by running the following commands:

gcc -o case case.c
losetup /dev/loop0 case.img
mount -o
"background_gc=sync,disable_roll_forward,nouser_xattr,disable_ext_identify,nobarrier,fastboot,mode=adaptive,grpquota,noquota,alloc_mode=reuse,test_dummy_encryption"
-t f2fs /dev/loop0 /root/mnt
./case

The kernel message is shown below:

6,799,86253155,-;loop0: detected capacity change from 0 to 262144
4,800,86288111,-;F2FS-fs (loop0): Test dummy encryption mount option ignored
5,801,86289902,-;F2FS-fs (loop0): Disable nat_bits due to incorrect cp_ver
(7347879550090329573, 6600135115475369443)
5,802,86315906,-;F2FS-fs (loop0): Mounted with checkpoint version = 237dbde5
4,803,86343451,-;F2FS-fs (loop0): access invalid blkaddr:4293918720
4,804,86343471,-;------------[ cut here ]------------
4,805,86343473,-;WARNING: CPU: 2 PID: 1047 at fs/f2fs/checkpoint.c:192
f2fs_is_valid_blkaddr+0xbf5/0xe50
4,806,86343480,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,807,86343486,-;CPU: 2 PID: 1047 Comm: case Not tainted 5.17.0 #2
4,808,86343489,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,809,86343491,-;RIP: 0010:f2fs_is_valid_blkaddr+0xbf5/0xe50
4,810,86343495,-;Code: e9 f6 f7 ff ff 44 89 e2 48 89 df 48 c7 c6 e0 81 5c a1 e8
b8 a5 d6 01 48 8d 7b 48 be 08 00 00 00 e8 80 cc 51 ff f0 80 4b 48 04 <0f> 0b 31
c0 e9 21 f7 ff ff 0f 0b e8 7b c8 51 ff e9 79 f4 ff ff 89
4,811,86343497,-;RSP: 0018:ffff88810dd1f9a0 EFLAGS: 00010206
4,812,86343500,-;RAX: 0000000000000001 RBX: ffff88810b100000 RCX:
ffffffff9f0a5330
4,813,86343503,-;RDX: 0000000000000001 RSI: 0000000000000008 RDI:
ffff88810b100048
4,814,86343504,-;RBP: ffff888107057700 R08: 0000000000000001 R09:
ffffed102162000a
4,815,86343506,-;R10: ffff88810b10004f R11: ffffed1021620009 R12:
00000000fff00000
4,816,86343508,-;R13: 0000000000000200 R14: ffff88810dd1fc70 R15:
0000000000000000
4,817,86343510,-;FS:  00007f2b11b67540(0000) GS:ffff8881cfe80000(0000)
knlGS:0000000000000000
4,818,86343512,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,819,86343514,-;CR2: 00007f2b11a8c750 CR3: 0000000111228003 CR4:
00000000001706e0
4,820,86343516,-;Call Trace:
4,821,86343517,-; <TASK>
4,822,86343519,-; f2fs_map_blocks+0x628/0x3710
4,823,86343524,-; ? f2fs_do_map_lock+0x30/0x30
4,824,86343528,-; ? file_update_time+0x220/0x390
4,825,86343531,-; ? put_page_refs+0x80/0x80
4,826,86343535,-; ? __vfs_removexattr+0xd0/0x130
4,827,86343539,-; ? fault_in_iov_iter_readable+0xfe/0x1a0
4,828,86343543,-; f2fs_file_write_iter+0x7fc/0x1aa0
4,829,86343546,-; ? up_write+0x43/0x70
4,830,86343550,-; ? vfs_removexattr+0xcf/0x230
4,831,86343553,-; ? f2fs_setattr+0x12e0/0x12e0
4,832,86343555,-; ? __vfs_removexattr_locked+0x370/0x370
4,833,86343559,-; new_sync_write+0x385/0x620
4,834,86343563,-; ? new_sync_read+0x620/0x620
4,835,86343566,-; ? __inode_security_revalidate+0x98/0xc0
4,836,86343570,-; ? security_file_permission+0x4e/0x580
4,837,86343573,-; vfs_write+0x41f/0x7b0
4,838,86343576,-; ksys_pwrite64+0x10a/0x130
4,839,86343580,-; ? __ia32_sys_pread64+0xf0/0xf0
4,840,86343583,-; ? exit_to_user_mode_prepare+0x12a/0x150
4,841,86343588,-; do_syscall_64+0x3b/0x90
4,842,86343592,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,843,86343596,-;RIP: 0033:0x7f2b11a8c76d
4,844,86343598,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
4,845,86343600,-;RSP: 002b:00007ffd73899e28 EFLAGS: 00000217 ORIG_RAX:
0000000000000012
4,846,86343603,-;RAX: ffffffffffffffda RBX: 00005642432b5610 RCX:
00007f2b11a8c76d
4,847,86343605,-;RDX: 00000000001edb9f RSI: 00007ffd73a99fb0 RDI:
0000000000000003
4,848,86343607,-;RBP: 00007ffd73c99fc0 R08: 00007ffd73c9a0b8 R09:
00007ffd73c9a0b8
4,849,86343608,-;R10: 000000000002e174 R11: 0000000000000217 R12:
00005642432b50a0
4,850,86343610,-;R13: 00007ffd73c9a0b0 R14: 0000000000000000 R15:
0000000000000000
4,851,86343612,-; </TASK>
4,852,86343614,-;---[ end trace 0000000000000000 ]---
4,853,86343623,-;F2FS-fs (loop0): access invalid blkaddr:4293918720
4,854,86343630,-;------------[ cut here ]------------
4,855,86343631,-;WARNING: CPU: 2 PID: 1047 at fs/f2fs/checkpoint.c:192
f2fs_is_valid_blkaddr+0xbf5/0xe50
4,856,86343635,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,857,86343638,-;CPU: 2 PID: 1047 Comm: case Tainted: G        W         5.17.0
#2
4,858,86343641,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,859,86343642,-;RIP: 0010:f2fs_is_valid_blkaddr+0xbf5/0xe50
4,860,86343645,-;Code: e9 f6 f7 ff ff 44 89 e2 48 89 df 48 c7 c6 e0 81 5c a1 e8
b8 a5 d6 01 48 8d 7b 48 be 08 00 00 00 e8 80 cc 51 ff f0 80 4b 48 04 <0f> 0b 31
c0 e9 21 f7 ff ff 0f 0b e8 7b c8 51 ff e9 79 f4 ff ff 89
4,861,86343647,-;RSP: 0018:ffff88810dd1f998 EFLAGS: 00010206
4,862,86343650,-;RAX: 0000000000000001 RBX: ffff88810b100000 RCX:
ffffffff9f0a5330
4,863,86343651,-;RDX: 0000000000000001 RSI: 0000000000000008 RDI:
ffff88810b100048
4,864,86343653,-;RBP: ffff888107057700 R08: 0000000000000001 R09:
ffffed102162000a
4,865,86343655,-;R10: ffff88810b10004f R11: ffffed1021620009 R12:
00000000fff00000
4,866,86343656,-;R13: 0000000000000200 R14: dffffc0000000000 R15:
0000000000000004
4,867,86343658,-;FS:  00007f2b11b67540(0000) GS:ffff8881cfe80000(0000)
knlGS:0000000000000000
4,868,86343660,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,869,86343662,-;CR2: 00007f2b11a8c750 CR3: 0000000111228003 CR4:
00000000001706e0
4,870,86343664,-;Call Trace:
4,871,86343665,-; <TASK>
4,872,86343666,-; f2fs_truncate_data_blocks_range+0x349/0x1480
4,873,86343670,-; f2fs_do_truncate_blocks+0x867/0xd20
4,874,86343673,-; ? f2fs_truncate_data_blocks+0x110/0x110
4,875,86343675,-; ? down_write+0xa8/0x110
4,876,86343678,-; f2fs_truncate+0x21c/0x710
4,877,86343681,-; f2fs_file_write_iter+0x8ab/0x1aa0
4,878,86343684,-; ? up_write+0x43/0x70
4,879,86343687,-; ? vfs_removexattr+0xcf/0x230
4,880,86343689,-; ? f2fs_setattr+0x12e0/0x12e0
4,881,86343692,-; ? __vfs_removexattr_locked+0x370/0x370
4,882,86343695,-; new_sync_write+0x385/0x620
4,883,86343698,-; ? new_sync_read+0x620/0x620
4,884,86343701,-; ? __inode_security_revalidate+0x98/0xc0
4,885,86343704,-; ? security_file_permission+0x4e/0x580
4,886,86343707,-; vfs_write+0x41f/0x7b0
4,887,86343710,-; ksys_pwrite64+0x10a/0x130
4,888,86343713,-; ? __ia32_sys_pread64+0xf0/0xf0
4,889,86343716,-; ? exit_to_user_mode_prepare+0x12a/0x150
4,890,86343720,-; do_syscall_64+0x3b/0x90
4,891,86343722,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,892,86343725,-;RIP: 0033:0x7f2b11a8c76d
4,893,86343727,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
4,894,86343729,-;RSP: 002b:00007ffd73899e28 EFLAGS: 00000217 ORIG_RAX:
0000000000000012
4,895,86343732,-;RAX: ffffffffffffffda RBX: 00005642432b5610 RCX:
00007f2b11a8c76d
4,896,86343734,-;RDX: 00000000001edb9f RSI: 00007ffd73a99fb0 RDI:
0000000000000003
4,897,86343735,-;RBP: 00007ffd73c99fc0 R08: 00007ffd73c9a0b8 R09:
00007ffd73c9a0b8
4,898,86343737,-;R10: 000000000002e174 R11: 0000000000000217 R12:
00005642432b50a0
4,899,86343739,-;R13: 00007ffd73c9a0b0 R14: 0000000000000000 R15:
0000000000000000
4,900,86343741,-; </TASK>
4,901,86343742,-;---[ end trace 0000000000000000 ]---
4,902,86343747,-;F2FS-fs (loop0): access invalid blkaddr:4294934527
4,903,86343754,-;------------[ cut here ]------------
4,904,86343754,-;WARNING: CPU: 2 PID: 1047 at fs/f2fs/checkpoint.c:192
f2fs_is_valid_blkaddr+0xbf5/0xe50
4,905,86343758,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,906,86343762,-;CPU: 2 PID: 1047 Comm: case Tainted: G        W         5.17.0
#2
4,907,86343764,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,908,86343765,-;RIP: 0010:f2fs_is_valid_blkaddr+0xbf5/0xe50
4,909,86343768,-;Code: e9 f6 f7 ff ff 44 89 e2 48 89 df 48 c7 c6 e0 81 5c a1 e8
b8 a5 d6 01 48 8d 7b 48 be 08 00 00 00 e8 80 cc 51 ff f0 80 4b 48 04 <0f> 0b 31
c0 e9 21 f7 ff ff 0f 0b e8 7b c8 51 ff e9 79 f4 ff ff 89
4,910,86343770,-;RSP: 0018:ffff88810dd1f998 EFLAGS: 00010206
4,911,86343772,-;RAX: 0000000000000001 RBX: ffff88810b100000 RCX:
ffffffff9f0a5330
4,912,86343774,-;RDX: 0000000000000001 RSI: 0000000000000008 RDI:
ffff88810b100048
4,913,86343776,-;RBP: ffff888107057700 R08: 0000000000000001 R09:
ffffed102162000a
4,914,86343777,-;R10: ffff88810b10004f R11: ffffed1021620009 R12:
00000000ffff7fff
4,915,86343779,-;R13: 0000000000000200 R14: dffffc0000000000 R15:
0000000000000004
4,916,86343781,-;FS:  00007f2b11b67540(0000) GS:ffff8881cfe80000(0000)
knlGS:0000000000000000
4,917,86343783,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,918,86343784,-;CR2: 00007f2b11a8c750 CR3: 0000000111228003 CR4:
00000000001706e0
4,919,86343786,-;Call Trace:
4,920,86343787,-; <TASK>
4,921,86343789,-; f2fs_truncate_data_blocks_range+0x349/0x1480
4,922,86343792,-; f2fs_do_truncate_blocks+0x867/0xd20
4,923,86343795,-; ? f2fs_truncate_data_blocks+0x110/0x110
4,924,86343797,-; ? down_write+0xa8/0x110
4,925,86343800,-; f2fs_truncate+0x21c/0x710
4,926,86343803,-; f2fs_file_write_iter+0x8ab/0x1aa0
4,927,86343805,-; ? up_write+0x43/0x70
4,928,86343808,-; ? vfs_removexattr+0xcf/0x230
4,929,86343811,-; ? f2fs_setattr+0x12e0/0x12e0
4,930,86343813,-; ? __vfs_removexattr_locked+0x370/0x370
4,931,86343816,-; new_sync_write+0x385/0x620
4,932,86343819,-; ? new_sync_read+0x620/0x620
4,933,86343823,-; ? __inode_security_revalidate+0x98/0xc0
4,934,86343825,-; ? security_file_permission+0x4e/0x580
4,935,86343828,-; vfs_write+0x41f/0x7b0
4,936,86343831,-; ksys_pwrite64+0x10a/0x130
4,937,86343834,-; ? __ia32_sys_pread64+0xf0/0xf0
4,938,86343837,-; ? exit_to_user_mode_prepare+0x12a/0x150
4,939,86343841,-; do_syscall_64+0x3b/0x90
4,940,86343844,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,941,86343847,-;RIP: 0033:0x7f2b11a8c76d
4,942,86343848,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
4,943,86343850,-;RSP: 002b:00007ffd73899e28 EFLAGS: 00000217 ORIG_RAX:
0000000000000012
4,944,86343853,-;RAX: ffffffffffffffda RBX: 00005642432b5610 RCX:
00007f2b11a8c76d
4,945,86343855,-;RDX: 00000000001edb9f RSI: 00007ffd73a99fb0 RDI:
0000000000000003
4,946,86343856,-;RBP: 00007ffd73c99fc0 R08: 00007ffd73c9a0b8 R09:
00007ffd73c9a0b8
4,947,86343858,-;R10: 000000000002e174 R11: 0000000000000217 R12:
00005642432b50a0
4,948,86343859,-;R13: 00007ffd73c9a0b0 R14: 0000000000000000 R15:
0000000000000000
4,949,86343862,-; </TASK>
4,950,86343863,-;---[ end trace 0000000000000000 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
