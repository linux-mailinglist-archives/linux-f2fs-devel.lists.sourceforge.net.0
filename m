Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560851106A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 07:12:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njZy0-0007RP-91; Wed, 27 Apr 2022 05:11:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njZxy-0007RI-BW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 05:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9n/cpxL66CeLWbQGsXAhml/zY1kpxMGnZ5EMmhyk964=; b=kbRFNsvGH+9v17Eebx3F0gGwS2
 i+VrbpYk8D2iyO8TtoFEeXtRMe3X7Z/fToLndHSbZx+6Lsj22jzsbGxB+1tBEe/BaP3qDYaVfoQ5G
 9tylCbr5Ti8sWf8hrVPUWFZdk/lAzZEVECevUKFcJpGMJlij6wofu8OM7ma18hn+TieY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9n/cpxL66CeLWbQGsXAhml/zY1kpxMGnZ5EMmhyk964=; b=T
 T8dsEp1mJZHHrJnZJ5Z1d9wcBDkv04mCjznW4rt7tQv3ILwXQNwUO83v3O8OyKBBlZpzl+BpD0AcS
 JsMxTjqfBhDkMT89obuobCnQO+BhDKOAa9BuY8DySkNtlgdp9aed+xS269LvJodWiwxN+zq7nEHU4
 unc9bOMaEPpllINg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njZxq-00BRzW-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 05:11:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96767B824AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 05:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6411AC385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 05:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651036294;
 bh=ZsD3cG8wvklEOexpAFFsXJ5boCXWbidYhsvUPsU4kH8=;
 h=From:To:Subject:Date:From;
 b=XIxUsTQNL3YlPkMh7F9sKe1gQS67bPOHOtMLVBmJeTZ/tzrc8b2NsvUreyF5jHZLn
 0kizJ1UEUzjVMrTS2kbKbpa5DJDA4fAZ3Cu2mc1PW/49GSkdoMGk7FrvKaPQ0Ym0sZ
 QjHcWlaIiK5NRX46LnaM8oaMzaajpgy52hlWEEYKyOagHT7vths+2gji3s5BizT87h
 LDwURs+supOZAF2vazkQqN6yT0Gkuq13bs8SYYSxfx3ipGESULB9J26dAsZ/0AYn38
 O3aS6qN91q0YBDib4TK1dcva8Zd7SiQ7KYw/ScZ/MtJjeMMiBAX0yeHScMzY6hOXwl
 AL0l4tpi0y/EQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4697DC05FD2; Wed, 27 Apr 2022 05:11:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 05:11:33 +0000
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
Message-ID: <bug-215894-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215894 Bug ID:
 215894 Summary: kernel BUG at fs/f2fs/segment.c:2291! Product: File System
 Version: 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree: Mainline
 Status: NEW Severity: normal Priority: P1 C [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njZxq-00BRzW-Lu
Subject: [f2fs-dev] [Bug 215894] New: kernel BUG at fs/f2fs/segment.c:2291!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215894

            Bug ID: 215894
           Summary: kernel BUG at fs/f2fs/segment.c:2291!
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

Created attachment 300817
  --> https://bugzilla.kernel.org/attachment.cgi?id=300817&action=edit
case.c

I have encountered a bug in F2FS file system in kernel v5.17.

I have uploaded the system call sequence as case.c, and a fuzzed image can be
found in google net disk
(https://drive.google.com/file/d/10KcRiyQCdCiTWfKmkv2wxgSSk1581sqE/view?usp=sharing).

The kernel should enable CONFIG_KASAN=y and CONFIG_KASAN_INLINE=y. You can
reproduce the bug by running the following commands:

gcc -o case case.c
losetup /dev/loop0 case.img
mount -o
"background_gc=sync,disable_roll_forward,nouser_xattr,disable_ext_identify,nobarrier,fastboot,mode=adaptive,grpquota,noquota,alloc_mode=reuse,test_dummy_encryption"
-t f2fs /dev/loop0 /root/mnt
./case

The kernel message is shown below:

6,799,86360296,-;loop0: detected capacity change from 0 to 262144
4,800,86395847,-;F2FS-fs (loop0): Test dummy encryption mount option ignored
5,801,86398197,-;F2FS-fs (loop0): Disable nat_bits due to incorrect cp_ver
(7347879550090329573, 6600135115475369443)
5,802,86424567,-;F2FS-fs (loop0): Mounted with checkpoint version = 237dbde5
4,803,86455701,-;------------[ cut here ]------------
2,804,86455706,-;kernel BUG at fs/f2fs/segment.c:2291!
4,805,86455720,-;invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
4,806,86455727,-;CPU: 6 PID: 1079 Comm: case Not tainted 5.17.0 #2
4,807,86455733,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,808,86455738,-;RIP: 0010:update_sit_entry+0xa30/0x1050
4,809,86455746,-;Code: c9 0f 95 c1 40 84 ce 0f 85 79 05 00 00 83 e0 07 38 c2 0f
9e c1 84 d2 0f 95 c0 84 c1 0f 85 64 05 00 00 8b 43 48 e9 66 f6 ff ff <0f> 0b 44
89 4c 24 10 4c 89 44 24 08 e8 bf 2c 4b ff 44 8b 4c 24 10
4,810,86455755,-;RSP: 0018:ffff88810991fba8 EFLAGS: 00010246
4,811,86455761,-;RAX: 0000000000000200 RBX: ffff8881246cbe80 RCX:
0000000000000009
4,812,86455766,-;RDX: 00000000000001ff RSI: 00000000fff00000 RDI:
ffff888115b0c454
4,813,86455770,-;RBP: ffff888115b0c000 R08: ffffffffffffffff R09:
00000000fff00000
4,814,86455775,-;R10: ffff888131d74267 R11: ffffed10263ae84c R12:
0000000000000000
4,815,86455779,-;R13: 00000000ffffffff R14: 00000000007ff7f8 R15:
00000000ffffffff
4,816,86455783,-;FS:  00007f4253e76540(0000) GS:ffff8881d5780000(0000)
knlGS:0000000000000000
4,817,86455789,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,818,86455793,-;CR2: 00007f4253d9b750 CR3: 00000001115e0002 CR4:
00000000001706e0
4,819,86455798,-;Call Trace:
4,820,86455801,-; <TASK>
4,821,86455804,-; ? update_segment_mtime+0x129/0x500
4,822,86455809,-; ? down_write_killable+0x120/0x120
4,823,86455815,-; f2fs_invalidate_blocks+0x193/0x2d0
4,824,86455821,-; f2fs_fallocate+0x2593/0x4a70
4,825,86455826,-; ? may_open_dev+0xd0/0xd0
4,826,86455833,-; ? __f2fs_ioc_move_range+0xd70/0xd70
4,827,86455837,-; ? __inode_security_revalidate+0x98/0xc0
4,828,86455843,-; ? selinux_file_permission+0x32d/0x410
4,829,86455849,-; ? security_file_permission+0x4e/0x580
4,830,86455854,-; vfs_fallocate+0x2a5/0xac0
4,831,86455860,-; ksys_fallocate+0x35/0x70
4,832,86455864,-; __x64_sys_fallocate+0x8e/0xf0
4,833,86455869,-; ? syscall_exit_to_user_mode+0x1d/0x40
4,834,86455875,-; do_syscall_64+0x3b/0x90
4,835,86455880,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,836,86455886,-;RIP: 0033:0x7f4253d9b76d
4,837,86455890,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
4,838,86455898,-;RSP: 002b:00007fffa875d298 EFLAGS: 00000207 ORIG_RAX:
000000000000011d
4,839,86455904,-;RAX: ffffffffffffffda RBX: 00005652598f1630 RCX:
00007f4253d9b76d
4,840,86455909,-;RDX: 0000000000134419 RSI: 0000000000000011 RDI:
0000000000000003
4,841,86455913,-;RBP: 00007fffa8b5d440 R08: 00007fffa8b5d538 R09:
00007fffa8b5d538
4,842,86455918,-;R10: 0000000000147c62 R11: 0000000000000207 R12:
00005652598f10a0
4,843,86455922,-;R13: 00007fffa8b5d530 R14: 0000000000000000 R15:
0000000000000000
4,844,86455927,-; </TASK>
4,845,86455930,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,846,86455939,-;---[ end trace 0000000000000000 ]---
4,847,86455942,-;RIP: 0010:update_sit_entry+0xa30/0x1050
4,848,86455947,-;Code: c9 0f 95 c1 40 84 ce 0f 85 79 05 00 00 83 e0 07 38 c2 0f
9e c1 84 d2 0f 95 c0 84 c1 0f 85 64 05 00 00 8b 43 48 e9 66 f6 ff ff <0f> 0b 44
89 4c 24 10 4c 89 44 24 08 e8 bf 2c 4b ff 44 8b 4c 24 10
4,849,86455955,-;RSP: 0018:ffff88810991fba8 EFLAGS: 00010246
4,850,86455959,-;RAX: 0000000000000200 RBX: ffff8881246cbe80 RCX:
0000000000000009
4,851,86455964,-;RDX: 00000000000001ff RSI: 00000000fff00000 RDI:
ffff888115b0c454
4,852,86455968,-;RBP: ffff888115b0c000 R08: ffffffffffffffff R09:
00000000fff00000
4,853,86455972,-;R10: ffff888131d74267 R11: ffffed10263ae84c R12:
0000000000000000
4,854,86455977,-;R13: 00000000ffffffff R14: 00000000007ff7f8 R15:
00000000ffffffff
4,855,86455981,-;FS:  00007f4253e76540(0000) GS:ffff8881d5780000(0000)
knlGS:0000000000000000
4,856,86455986,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,857,86455990,-;CR2: 00007f4253d9b750 CR3: 00000001115e0002 CR4:
00000000001706e0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
