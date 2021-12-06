Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41655469034
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Dec 2021 06:35:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mu6eS-0007cW-UQ; Mon, 06 Dec 2021 05:35:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mu6eR-0007bz-7n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 05:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CqaVu/Z8rY8LsJb2NccBnkGj+d7m1yGS6RN/WUyEyBw=; b=ca/K4m/0NBw5BMRe9thz7+XcuV
 aC+mZmCW3c7wCTVJdrHU+/7WXcnX0eNyl29BaQ/ZzsHUdzz18zz64jiEqBJG8AF7Y1UeZeFFrgRRS
 givN6FwihSTD1iFskuicRWCZkn/tPOmq703eVaoTM6fy5LmlQd05evSzfGQnlfkbc2uk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CqaVu/Z8rY8LsJb2NccBnkGj+d7m1yGS6RN/WUyEyBw=; b=e
 5N0wHsrcOPGzuqfafwnfRyhcDcmd1RFoYVbM4KsCB6NjFPYq4ve/M0mbwo6R+fTfaTntpoFLLP+NZ
 ED94rBhnfDUF3vpQBko0P+ff551ffoMtGHkUI4sZfcWwBhITXXIGgFXFYnHlV+Xi+qm7ivQ2HAvMn
 jTXgld+euSIveTBs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mu6eP-0007Ev-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 05:35:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 814666111D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Dec 2021 05:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D532CC341C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Dec 2021 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638768883;
 bh=iH4owkvbjpGCyMp0uAm/SsNMZFOvlq4+CX1Q42zza4o=;
 h=From:To:Subject:Date:From;
 b=CMlC/LXf8rWrIQIP/Nr8x168XwHBdayuGxMjrojNVg8HfapxrejDZdzc1P8ByBL6K
 UDZlcTSCSzAawDfdSj84so451ryH/2RaB0VCuXi7e+e4WATkQfPIu9x2s+A79WgP6y
 gyGena0EUtGKg/I5T+lVHtQxUM/ZGrPB129FFsCQZtwfVEsnH+OCesaNbzXaa347Os
 R+9I1Kn32bzPf2GDQDrkHKqgr0/iYo2YRgchSL0rUfg8+J6VVED4peJiwxJo29pCua
 B/Gqx2zNqzUPn4If8zOKDDage/Zkgi/b/wgkR02GrhcrjyMMg8taSvFR4fxazF8du1
 mwau6Wwe/A1RA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A7BE9611C1; Mon,  6 Dec 2021 05:34:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 06 Dec 2021 05:34:43 +0000
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
Message-ID: <bug-215235-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215235 Bug ID:
 215235 Summary: page fault in f2fs_setxattr() when mount and operate on
 corrupted
 image Product: File System Version: 2.5 Kernel Version: 5.16-rc3, 5.15.X
 Hardware: All OS: Linux Tree: Mainli [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mu6eP-0007Ev-Tb
Subject: [f2fs-dev] [Bug 215235] New: page fault in f2fs_setxattr() when
 mount and operate on corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215235

            Bug ID: 215235
           Summary: page fault in f2fs_setxattr() when mount and operate
                    on corrupted image
           Product: File System
           Version: 2.5
    Kernel Version: 5.16-rc3, 5.15.X
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

Created attachment 299911
  --> https://bugzilla.kernel.org/attachment.cgi?id=299911&action=edit
poc and .config file

- Overview 
 page fault in f2fs_setxattr() when mount and operate on corrupted image 

- Reproduce 
tested on kernel 5.16-rc3, 5.15.X under root

# unzip tmp7.zip 
#./single.sh f2fs 7

Sometimes need to run the script several times

- Kernel dump
[   46.683775] loop0: detected capacity change from 0 to 131072
[   46.699526] F2FS-fs (loop0): Found nat_bits in checkpoint
[   46.712845] F2FS-fs (loop0): Mounted with checkpoint version = 7548c2ee
[   46.773227] BUG: unable to handle page fault for address: ffffe47bc7123f48
[   46.773247] #PF: supervisor read access in kernel mode
[   46.773257] #PF: error_code(0x0000) - not-present page
[   46.773266] PGD 0 P4D 0 
[   46.773272] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   46.773281] CPU: 0 PID: 1184 Comm: tmp7 Not tainted 5.16.0-rc3 #1
[   46.773293] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[   46.773308] RIP: 0010:kfree+0x66/0x320
[   46.773318] Code: 80 4c 01 ed 0f 82 a0 02 00 00 48 c7 c0 00 00 00 80 48 2b
05 3c 6f 10 01 48 01 c5 48 c1 ed 0c 48 c1 e5 06 48 03 2d 1a 6f 10 01 <48> 8b 45
08 48 8d 50 ff a8 01 48 0f 45 ea 48 8b 55 08 48 8d 42 ff
[   46.773348] RSP: 0018:ffffac4b008bfb28 EFLAGS: 00010282
[   46.773358] RAX: 0000726bc0000000 RBX: 0000000000000000 RCX:
0000000000000001
[   46.773370] RDX: 0000000080000001 RSI: ffffffffc07f5b9a RDI:
ffffe325848fd480
[   46.773383] RBP: ffffe47bc7123f40 R08: ffff8d94c63e6f10 R09:
ffffe325848fd480
[   46.773395] R10: 0000000000000018 R11: ffff8d94c63e71f8 R12:
ffffe32584098680
[   46.773407] R13: ffffe325848fd480 R14: ffff8d94d2203000 R15:
ffff8d94c261af0c
[   46.773419] FS:  00007f97e4524500(0000) GS:ffff8d96b5c00000(0000)
knlGS:0000000000000000
[   46.773433] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   46.773443] CR2: ffffe47bc7123f48 CR3: 00000001035ec003 CR4:
0000000000370ef0
[   46.773459] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   46.773471] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   46.773483] Call Trace:
[   46.773490]  <TASK>
[   46.773494]  ? __mark_inode_dirty+0x15c/0x360
[   46.773506]  __f2fs_setxattr+0x2aa/0xc00 [f2fs]
[   46.773553]  f2fs_setxattr+0xfa/0x480 [f2fs]
[   46.773573]  ? selinux_inode_permission+0xd5/0x190
[   46.773584]  __f2fs_set_acl+0x19b/0x330 [f2fs]
[   46.773603]  ? make_kuid+0xf/0x20
[   46.773610]  __vfs_removexattr+0x52/0x70
[   46.773619]  __vfs_removexattr_locked+0xb1/0x140
[   46.773629]  vfs_removexattr+0x56/0x100
[   46.773637]  removexattr+0x57/0x80
[   46.773644]  ? __check_object_size+0xd1/0x1a0
[   46.773654]  ? user_path_at_empty+0x40/0x50
[   46.773663]  ? kmem_cache_free+0xcb/0x310
[   46.773671]  ? preempt_count_add+0x49/0xa0
[   46.773680]  ? __mnt_want_write+0x5e/0x90
[   46.773689]  path_removexattr+0xa3/0xc0
[   46.773697]  __x64_sys_removexattr+0x17/0x20
[   46.774002]  do_syscall_64+0x37/0xb0
[   46.774303]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   46.774607] RIP: 0033:0x7f97e402e639
[   46.774902] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 1f f8 2c 00 f7 d8 64 89 01 48
[   46.775573] RSP: 002b:00007ffc1de8b648 EFLAGS: 00000217 ORIG_RAX:
00000000000000c5
[   46.775897] RAX: ffffffffffffffda RBX: 9e1da79895bd8a4a RCX:
00007f97e402e639
[   46.776230] RDX: 00007f97e402e639 RSI: 00007ffc1de8b860 RDI:
00007ffc1de8b679
[   46.776563] RBP: 00007ffc1dede2f0 R08: 00007ffc1dede3d8 R09:
00007ffc1dede3d8
[   46.776888] R10: 00007ffc1dede3d8 R11: 0000000000000217 R12:
6c73732e72657375
[   46.777214] R13: 007373656363615f R14: 702e6d6574737973 R15:
6c63615f7869736f
[   46.777543]  </TASK>
[   46.777866] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx xor raid6_pq raid1 raid0 multipath
linear qxl drm_ttm_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops drm hid_generic crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel usbhid crypto_simd hid psmouse cryptd
[   46.779358] CR2: ffffe47bc7123f48
[   46.779707] ---[ end trace 52653140d82b5d23 ]---
[   46.780053] RIP: 0010:kfree+0x66/0x320
[   46.780396] Code: 80 4c 01 ed 0f 82 a0 02 00 00 48 c7 c0 00 00 00 80 48 2b
05 3c 6f 10 01 48 01 c5 48 c1 ed 0c 48 c1 e5 06 48 03 2d 1a 6f 10 01 <48> 8b 45
08 48 8d 50 ff a8 01 48 0f 45 ea 48 8b 55 08 48 8d 42 ff
[   46.781119] RSP: 0018:ffffac4b008bfb28 EFLAGS: 00010282
[   46.781484] RAX: 0000726bc0000000 RBX: 0000000000000000 RCX:
0000000000000001
[   46.781853] RDX: 0000000080000001 RSI: ffffffffc07f5b9a RDI:
ffffe325848fd480
[   46.782218] RBP: ffffe47bc7123f40 R08: ffff8d94c63e6f10 R09:
ffffe325848fd480
[   46.782580] R10: 0000000000000018 R11: ffff8d94c63e71f8 R12:
ffffe32584098680
[   46.782938] R13: ffffe325848fd480 R14: ffff8d94d2203000 R15:
ffff8d94c261af0c
[   46.783342] FS:  00007f97e4524500(0000) GS:ffff8d96b5c00000(0000)
knlGS:0000000000000000
[   46.783712] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   46.784078] CR2: ffffe47bc7123f48 CR3: 00000001035ec003 CR4:
0000000000370ef0
[   46.784454] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   46.784830] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
