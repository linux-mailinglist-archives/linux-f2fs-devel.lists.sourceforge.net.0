Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6F4E99EF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 16:41:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYqZ1-0001d7-SY; Mon, 28 Mar 2022 14:41:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nYqZ0-0001d1-M9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 14:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+YVtAwlzMhJM+xpl+UrmsSwc2CwSW3GQKT16YZkONnc=; b=Vee/VabhNIrTJntqQEbwMD4YPO
 VI3a/RpYxYRzBvRQ9oNX4hXI+V/nXKf32DKdyrFbleLkgXl2qwfy43OMm4EjLwbX3A5CX9aV8BHyw
 Tw0KCi9y5/dGD1ibIFFKU3GriSoUeKv0plKi8Qj3ozcvg2blJC+kJoajV/T696NM4fvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+YVtAwlzMhJM+xpl+UrmsSwc2CwSW3GQKT16YZkONnc=; b=U
 SiqG7GmsB0Sq1WNlDgbTEpa2w6bN/wvf/2m/idgjQ0t/X6lbOvtEjldKjptd47xWLQjnoNWanV52r
 pxiQmq09qpeoM4+ULadyFM6wGFYx5IayP9BMQnXfFuxDxAFkMqwjh3/DOJm+I9Rx7iwS0/b1Du26e
 UEdSI1YFw61dpDuU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYqYx-0006J5-GW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 14:41:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B19C0611F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Mar 2022 14:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2338CC340EC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Mar 2022 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648478489;
 bh=+5BtyYhJbdm4i+GmHkXmX9T75V059XAFM5AQ4XvcEJk=;
 h=From:To:Subject:Date:From;
 b=byeNdb204JJ+X2W9msNQNHTw1m9sDN1RtfKm5p3PM9NKm7pWe9SEWSF/TcdVjxr8G
 4AglvJ7Fj2ECw/qRMs3+GUe+6SPcQOUVMPzIPfEqwfPtsmy1x7P71Kxc05YgeRw9HI
 d1bWLDF2Y+TUXnz7OCFpspeK8IcbWprHeETSw34BBQ2THi12yg7lqGPeINgIaGSvlk
 Lg4qx/Eo2sQZfqW+3J1IS36kbzfRyoRGrqe0VoS34PCH3RO+vhCYL9O60Q8c90Cj5B
 Sy1eUGwscotj+5S52jagxUflTu3MZGb8UqzQhArDIOZPpFCVfKcMPbUuVrRLj19HoG
 puUjthN1SDR+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 02360C05FCE; Mon, 28 Mar 2022 14:41:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Mar 2022 14:41:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215765-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215765 Bug ID:
 215765 Summary: kernel NULL pointer dereference at
 fs/f2fs/dir.c:f2fs_add_regular_entry()
 when mount and operate on corrupted image Product: File System Version: 2.5
 Kernel Version: 5.17 Hard [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYqYx-0006J5-GW
Subject: [f2fs-dev] [Bug 215765] New: kernel NULL pointer dereference at
 fs/f2fs/dir.c:f2fs_add_regular_entry() when mount and operate on corrupted
 image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215765

            Bug ID: 215765
           Summary: kernel NULL pointer dereference at
                    fs/f2fs/dir.c:f2fs_add_regular_entry() when mount and
                    operate on corrupted image
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
          Reporter: wenqingliu0120@gmail.com
        Regression: No

Created attachment 300632
  --> https://bugzilla.kernel.org/attachment.cgi?id=300632&action=edit
corrupted image and .config

- Overview 
kernel NULL pointer dereference at fs/f2fs/dir.c:f2fs_add_regular_entry() when
mount and operate on corrupted image

- Reproduce 
tested on kernel 5.17

# mkdir mnt
# mount tmp40.img mount
# ls mnt

- Kernel dump
[  131.000658] loop0: detected capacity change from 0 to 131072
[  131.147683] F2FS-fs (loop0): Mounted with checkpoint version = 7548c462
[  132.640535] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  132.640656] #PF: supervisor instruction fetch in kernel mode
[  132.640709] #PF: error_code(0x0010) - not-present page
[  132.640755] PGD 0 P4D 0 
[  132.640784] Oops: 0010 [#1] PREEMPT SMP NOPTI
[  132.640829] CPU: 3 PID: 1251 Comm: ls Not tainted 5.17.0 #1
[  132.640882] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[  132.640955] RIP: 0010:0x0
[  132.641003] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[  132.641123] RSP: 0018:ffffc184c04fb9e0 EFLAGS: 00010246
[  132.641174] RAX: 0000000000000000 RBX: ffffed6584a0ef80 RCX:
000000000000003b
[  132.641236] RDX: 0017ffffc0000005 RSI: ffffa093e83be000 RDI:
ffffed6584a0ef80
[  132.641296] RBP: ffffa093e83be950 R08: 0000000000000000 R09:
000000000000003b
[  132.641358] R10: 000000000000003d R11: 000000000000003b R12:
ffffed6584a0ef80
[  132.641418] R13: ffffed6584a0ef80 R14: ffffa093c5492340 R15:
ffffc184c04fbac0
[  132.641480] FS:  00007fd9bbdc7040(0000) GS:ffffa095b5d80000(0000)
knlGS:0000000000000000
[  132.641550] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  132.641600] CR2: ffffffffffffffd6 CR3: 000000010213e003 CR4:
0000000000370ee0
[  132.641671] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  132.641745] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  132.641806] Call Trace:
[  132.641832]  <TASK>
[  132.641855]  folio_mark_dirty+0x33/0x50
[  132.641906]  f2fs_add_regular_entry+0x541/0xad0 [f2fs]
[  132.642440]  f2fs_add_dentry+0x6c/0xb0 [f2fs]
[  132.642583]  f2fs_do_add_link+0x182/0x230 [f2fs]
[  132.642717]  __recover_dot_dentries+0x2d6/0x470 [f2fs]
[  132.642865]  f2fs_lookup+0x5af/0x6a0 [f2fs]
[  132.643000]  __lookup_slow+0xac/0x200
[  132.643043]  lookup_slow+0x45/0x70
[  132.643080]  walk_component+0x16c/0x250
[  132.643121]  path_lookupat+0x8b/0x1f0
[  132.643160]  filename_lookup+0xef/0x250
[  132.643204]  ? __check_object_size+0xc2/0x190
[  132.643265]  ? user_path_at_empty+0x46/0x70
[  132.643307]  user_path_at_empty+0x46/0x70
[  132.643349]  vfs_statx+0x98/0x190
[  132.643388]  __do_sys_newlstat+0x41/0x90
[  132.643433]  ? fpregs_assert_state_consistent+0x1e/0x40
[  132.643484]  ? exit_to_user_mode_prepare+0x38/0x1a0
[  132.643536]  __x64_sys_newlstat+0x1a/0x30
[  132.643578]  do_syscall_64+0x37/0xb0
[  132.643615]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  132.643666] RIP: 0033:0x7fd9bb69f7c5
[  132.643703] Code: c9 b6 2d 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 0f 1f
40 00 83 ff 01 48 89 f0 77 30 48 89 c7 48 89 d6 b8 06 00 00 00 0f 05 <48> 3d 00
f0 ff ff 77 03 f3 c3 90 48 8b 15 91 b6 2d 00 f7 d8 64 89
[  132.647032] RSP: 002b:00007ffdd3099a08 EFLAGS: 00000246 ORIG_RAX:
0000000000000006
[  132.648731] RAX: ffffffffffffffda RBX: 00005628315da0e8 RCX:
00007fd9bb69f7c5
[  132.651089] RDX: 00005628315da100 RSI: 00005628315da100 RDI:
00007ffdd3099a10
[  132.652883] RBP: 00007ffdd3099e00 R08: 0000000000000000 R09:
00005628315def9c
[  132.654519] R10: 0000000000000000 R11: 0000000000000246 R12:
00007ffdd3099a10
[  132.656120] R13: 0000000000000000 R14: 0000000000000003 R15:
00005628315da100
[  132.657749]  </TASK>
[  132.659376] Modules linked in: f2fs crc32_generic iscsi_tcp libiscsi_tcp
libiscsi scsi_transport_iscsi xfs input_leds joydev serio_raw qemu_fw_cfg
autofs4 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx raid1 raid0 multipath linear hid_generic usbhid hid qxl drm_ttm_helper
ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm
crct10dif_pclmul crc32_pclmul psmouse ghash_clmulni_intel aesni_intel
crypto_simd cryptd
[  132.665794] CR2: 0000000000000000
[  132.666980] ---[ end trace 0000000000000000 ]---
[  132.668162] RIP: 0010:0x0
[  132.669083] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[  132.670020] RSP: 0018:ffffc184c04fb9e0 EFLAGS: 00010246
[  132.670932] RAX: 0000000000000000 RBX: ffffed6584a0ef80 RCX:
000000000000003b
[  132.671866] RDX: 0017ffffc0000005 RSI: ffffa093e83be000 RDI:
ffffed6584a0ef80
[  132.672797] RBP: ffffa093e83be950 R08: 0000000000000000 R09:
000000000000003b
[  132.673641] R10: 000000000000003d R11: 000000000000003b R12:
ffffed6584a0ef80
[  132.674374] R13: ffffed6584a0ef80 R14: ffffa093c5492340 R15:
ffffc184c04fbac0
[  132.675131] FS:  00007fd9bbdc7040(0000) GS:ffffa095b5d80000(0000)
knlGS:0000000000000000
[  132.675895] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  132.676702] CR2: ffffffffffffffd6 CR3: 000000010213e003 CR4:
0000000000370ee0
[  132.677500] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  132.678279] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
