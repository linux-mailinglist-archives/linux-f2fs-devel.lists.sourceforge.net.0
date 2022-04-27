Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F4511361
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 10:17:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njcrl-00036B-SU; Wed, 27 Apr 2022 08:17:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njcrk-000365-T0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 08:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igpLx/msK0eXDv393dcBCcRS6xYjoGCbyLsSpepaC8A=; b=GDQGozS5Z2sCJFaPhR9I+S7q4Y
 lAkXRsR3dIHt/C2RDYOFv6IHNS49hqq6rL6/EYQ/0ZBeBt1hNZnSv1qaOPrEVg0/vCDtdB2K8vX97
 4PbLtrmEQQVhhBhGzU1XNL4UyxFMp6RBu0x47Yu/bgzoz8TyO3aDre2WmVvsfWbP+gOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=igpLx/msK0eXDv393dcBCcRS6xYjoGCbyLsSpepaC8A=; b=N
 pkS6dA11+uooN1P9VIxTgL4uvDF2CmFuVSdxVaEIRJXfYMzKs6OwEXvi2nm2eKy2wcpVIM4W39PRj
 v8QFUDHRh5jyPm2myohuWpAADbxgPcoE5PrL8St2GWQEzXQWB3siD4jzN8zAoCrfbozKE8mRzLsNx
 aLKtzGij/PSWn2Qc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njcrk-0008Bb-R8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 08:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87E12B80D66
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 08:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C96AC385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651047453;
 bh=bWCJ2bj0VOE2sAyIMeHv74KurGVYlxpXdO9e6x4YCws=;
 h=From:To:Subject:Date:From;
 b=aWLJNRS0/IqAL1V22RMXbb4SkqHitmd4GaZFK7wyXkpqQziy5tSTGN0u/8wwenMuv
 8iN/3xLZr43XDsc7gWZmAW17YortFZbn82Ixn4zanIaN5Dm8qOlzVGIkYhR4Aev6Yu
 ry+B6EM9jwQLYmytRak6KpFQa9olcbbThCHM7ry5KzclauZuouQb/NGea4gZYjM6LD
 86041+04ZgzgtdQJFfqh/nN3OWDsVY4ty++kSTLDb/IM+AD9uhJf3FyU1nzYrvUCGw
 ZJzlI9w56r/X6eg95i0iM6Rs+MzjybuBmcvQtaT6jPfLGHEpHFqKkNUhf+L4NnbNom
 UNnyahSC8GpaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0313BC05FCE; Wed, 27 Apr 2022 08:17:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 08:17:31 +0000
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
Message-ID: <bug-215895-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215895 Bug ID:
 215895 Summary: kernel BUG at fs/inode.c:611! Product: File System Version:
 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree: Mainline Status: NEW
 Severity: normal Priority: P1 Component [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1njcrk-0008Bb-R8
Subject: [f2fs-dev] [Bug 215895] New: kernel BUG at fs/inode.c:611!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215895

            Bug ID: 215895
           Summary: kernel BUG at fs/inode.c:611!
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

Created attachment 300818
  --> https://bugzilla.kernel.org/attachment.cgi?id=300818&action=edit
case.c

I have encountered a bug in F2FS file system in kernel v5.17.

I have uploaded the system call sequence as case.c, and a fuzzed image can be
found in google net disk
(https://drive.google.com/file/d/1PKx2vYljtEEn88AdYHZElKfahOjtzfh2/view?usp=sharing).

The kernel should enable CONFIG_KASAN=y and CONFIG_KASAN_INLINE=y. You can
reproduce the bug by running the following commands:

gcc -o case case.c
losetup /dev/loop0 case.img
mount -o
"background_gc=on,disable_roll_forward,nodiscard,noacl,flush_merge,nobarrier,fastboot,extent_cache,checkpoint=disable,usrquota,test_dummy_encryption"
-t f2fs /dev/loop0 /root/mnt
./case

The kernel message is shown below:

6,828,84762553,-;loop0: detected capacity change from 0 to 131072
6,829,84800241,-;F2FS-fs (loop0): Mismatch start address, segment0(512)
cp_blkaddr(4060086784)
3,830,84800254,-;F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th
superblock
4,831,84800328,-;F2FS-fs (loop0): Test dummy encryption mount option ignored
5,832,84804081,-;F2FS-fs (loop0): Disable nat_bits due to incorrect cp_ver
(17468725613732348634, 17765647070955881174)
4,833,84831908,-;F2FS-fs (loop0): Start checkpoint disabled!
6,834,85341039,-;F2FS-fs (loop0): Try to recover 2th superblock, ret: 0
5,835,85341048,-;F2FS-fs (loop0): Mounted with checkpoint version = 7548c2db
4,836,85400108,-;------------[ cut here ]------------
2,837,85400113,-;kernel BUG at fs/inode.c:611!
4,838,85400126,-;invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
4,839,85400132,-;CPU: 3 PID: 1067 Comm: case Not tainted 5.17.0 #2
4,840,85400138,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,841,85400142,-;RIP: 0010:clear_inode+0xdf/0x120
4,842,85400150,-;Code: fc ff df 48 89 ea 48 c1 ea 03 80 3c 02 00 75 42 48 8b 83
18 01 00 00 48 39 c5 75 16 48 c7 83 98 00 00 00 60 00 00 00 5b 5d c3 <0f> 0b 0f
0b 0f 0b 0f 0b 0f 0b e8 22 61 f8 ff e9 43 ff ff ff e8 18
4,843,85400158,-;RSP: 0018:ffff8881147d7c48 EFLAGS: 00010002
4,844,85400164,-;RAX: dffffc0000000000 RBX: ffff88814bbd1360 RCX:
ffffffff9f4d4923
4,845,85400168,-;RDX: 1ffff1102977a2a9 RSI: 0000000000000004 RDI:
ffff88814bbd1548
4,846,85400172,-;RBP: ffff88814bbd14d0 R08: 0000000000000001 R09:
ffffed10228faf7f
4,847,85400176,-;R10: 0000000000000003 R11: ffffed10228faf7e R12:
ffff88814bbd13f8
4,848,85400179,-;R13: ffff88814bbd1388 R14: ffffffff9fbc2fc0 R15:
ffff888107473508
4,849,85400184,-;FS:  00007f32d4133540(0000) GS:ffff8881d56c0000(0000)
knlGS:0000000000000000
4,850,85400189,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,851,85400192,-;CR2: 00007ffd60dc7f5c CR3: 000000012b5fc002 CR4:
00000000001706e0
4,852,85400196,-;Call Trace:
4,853,85400199,-; <TASK>
4,854,85400202,-; evict+0x282/0x4e0
4,855,85400206,-; __dentry_kill+0x2b2/0x4d0
4,856,85400211,-; dput+0x2dd/0x720
4,857,85400215,-; do_renameat2+0x596/0x970
4,858,85400220,-; ? __x64_sys_link+0x90/0x90
4,859,85400224,-; ? _raw_spin_lock_irqsave+0x88/0xe0
4,860,85400230,-; ? kmem_cache_alloc+0xc4/0x220
4,861,85400234,-; ? _raw_spin_unlock_irqrestore+0x3d/0x70
4,862,85400239,-; ? kasan_unpoison+0x23/0x50
4,863,85400244,-; ? getname_flags+0xf8/0x4e0
4,864,85400250,-; __x64_sys_rename+0x78/0x90
4,865,85400254,-; do_syscall_64+0x3b/0x90
4,866,85400259,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,867,85400264,-;RIP: 0033:0x7f32d405876d
4,868,85400267,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
4,869,85400274,-;RSP: 002b:00007ffd60dc7f48 EFLAGS: 00000286 ORIG_RAX:
0000000000000052
4,870,85400280,-;RAX: ffffffffffffffda RBX: 0000557225962190 RCX:
00007f32d405876d
4,871,85400284,-;RDX: ffffffffffffff80 RSI: 00007ffd60dc807a RDI:
00007ffd60dc802c
4,872,85400288,-;RBP: 00007ffd611c8340 R08: 00007ffd611c8438 R09:
00007ffd611c8438
4,873,85400292,-;R10: 00007ffd611c8438 R11: 0000000000000286 R12:
00005572259610a0
4,874,85400295,-;R13: 00007ffd611c8430 R14: 0000000000000000 R15:
0000000000000000
4,875,85400300,-; </TASK>
4,876,85400302,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,877,85400310,-;---[ end trace 0000000000000000 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
