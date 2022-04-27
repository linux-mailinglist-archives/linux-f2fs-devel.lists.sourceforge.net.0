Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE9C511686
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 14:02:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njgNi-0000Xq-0d; Wed, 27 Apr 2022 12:02:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njgNh-0000Xk-36
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 12:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWBr9xTiB3Vi8BRz2Q/PGfgfxi6UOK7tcFf/8jrZefY=; b=mV0knGWRi8TgXZ7tQfhxOJsP0n
 iYLWGUQybR+u5TCnhDOF6d0LbkAFKfu9ZZTttvW2Z6n19WmWzrRiWgSdV0mI7dVqoJrJoK0JmL92J
 oykkHOT1bh+vECSuxuoNanY87warZefBxHh13doCwQbt1LJ2SR4p1d9unfXd2E5qrW4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NWBr9xTiB3Vi8BRz2Q/PGfgfxi6UOK7tcFf/8jrZefY=; b=g
 McAcYormSsUP5w2IhD3I+/Lddxkx7Hwiz37Ikvvr3VGZAkFpiwOvV8jHxL/bJN0pvvnfvcVJkd7MR
 P6+VWrJZzZpKNu0wUiVcp1DZBrMtV8FHfejLHH9AAi9d1xSjd6jmvF461dN4GohUhlUtYAAnZnf7s
 ovi19S8ct9g1rcG0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njgNg-00BjZr-Vx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 12:02:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 01848CE24BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 12:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94E30C385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651060959;
 bh=wKwUmBOnECm6m14uYK0x1xbOM+dISjJDk+ZU9RabgIU=;
 h=From:To:Subject:Date:From;
 b=l6LEmZT2w5YpcaV084j0n16yPxkZBwLLDIAbDzBhkzzg0t+0BdgkSMYlEWmhbu2IQ
 +U6KB9LPbmBprnlVvQhLdJJnPnEzEp/CDWbyqf/PLdRdNzj4AzSWGRmuNwMM8hBHIz
 Y8zMjHIDTGWI2WbsqB/97ezya7P00SJx/bBiTrtGmAlIpiVUrQPxwKpJPWURQ7iQyj
 6woQDiF8oLNooAuQ9ig7FO9UcqgdMvj2XDw3VFsgQoD68d8PrkgVVjr5IdI+eugSR+
 j/ZrgJ+v2UHjouOmmo8dMrewpUuHRwvdWBLn4rVlUa4YpfEPZZOQnE7Y3JM8QYiXYj
 E+e2SEgakVAVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 747F8C05FD0; Wed, 27 Apr 2022 12:02:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 12:02:39 +0000
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
Message-ID: <bug-215897-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215897 Bug ID:
 215897 Summary: kernel BUG at fs/f2fs/f2fs.h:2511! Product: File System
 Version:
 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree: Mainline Status: NEW
 Severity: normal Priority: P1 Comp [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njgNg-00BjZr-Vx
Subject: [f2fs-dev] [Bug 215897] New: kernel BUG at fs/f2fs/f2fs.h:2511!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215897

            Bug ID: 215897
           Summary: kernel BUG at fs/f2fs/f2fs.h:2511!
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

Created attachment 300821
  --> https://bugzilla.kernel.org/attachment.cgi?id=300821&action=edit
case.c

I have encountered a bug in F2FS file system in kernel v5.17.

The file operations performed on the file system are in case.c, and I have
uploaded the F2FS image to the google net disk
(https://drive.google.com/file/d/1SQ5oHSMJLD_e_HtYRad6gcmVQU-dvLk3/view?usp=sharing).

The kernel should enable CONFIG_KASAN=y and CONFIG_KASAN_INLINE=y. You can
reproduce the bug by running the following commands:

gcc -o case case.c
losetup /dev/loop0 case.img
mount -o
"background_gc=sync,disable_roll_forward,nouser_xattr,disable_ext_identify,nobarrier,fastboot,mode=adaptive,grpquota,noquota,alloc_mode=reuse,test_dummy_encryption"
-t f2fs /dev/loop0 /root/mnt
./case

The kernel message is shown below:

4,1119,116278718,-;------------[ cut here ]------------
2,1120,116278721,-;kernel BUG at fs/f2fs/f2fs.h:2511!
4,1121,116278795,-;invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
4,1122,116278799,-;CPU: 7 PID: 1335 Comm: rm Not tainted 5.17.0 #3
4,1123,116278803,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,1124,116278805,-;RIP: 0010:truncate_node+0x85c/0xa70
4,1125,116278810,-;Code: 3c 24 e8 f7 11 4d ff e9 bb f8 ff ff 4c 89 54 24 10 e8
e8 11 4d ff 4c 8b 54 24 10 e9 55 fa ff ff e8 b9 11 4d ff e9 57 fb ff ff <0f> 0b
0f 0b 0f 0b 48 b8 00 00 00 00 00 fc ff df 48 8b 54 24 28 48
4,1126,116278813,-;RSP: 0018:ffff88812a707b98 EFLAGS: 00010246
4,1127,116278816,-;RAX: 0000000000000007 RBX: ffff88812a707ca0 RCX:
ffffffff850d5532
4,1128,116278819,-;RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffff888114e94484
4,1129,116278821,-;RBP: ffff888158cb0e88 R08: 0000000000000001 R09:
ffffed10254e0f69
4,1130,116278823,-;R10: ffff888114e94834 R11: ffffed10254e0f68 R12:
0000000000000000
4,1131,116278826,-;R13: ffff888114e94000 R14: ffff88812a707be8 R15:
0000000000000000
4,1132,116278828,-;FS:  00007f9ded34c580(0000) GS:ffff8881d57c0000(0000)
knlGS:0000000000000000
4,1133,116278831,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,1134,116278833,-;CR2: 0000564e9d5956a8 CR3: 000000010dfbc002 CR4:
00000000001706e0
4,1135,116278835,-;Call Trace:
4,1136,116278837,-; <TASK>
4,1137,116278839,-; ? f2fs_get_node_info+0xd10/0xd10
4,1138,116278843,-; f2fs_remove_inode_page+0x2a2/0x830
4,1139,116278846,-; ? f2fs_get_dnode_of_data+0x18e0/0x18e0
4,1140,116278850,-; ? f2fs_mark_inode_dirty_sync+0x4f/0x70
4,1141,116278853,-; ? f2fs_truncate+0x29f/0x710
4,1142,116278856,-; f2fs_evict_inode+0x9b7/0x1510
4,1143,116278860,-; evict+0x282/0x4e0
4,1144,116278862,-; ? __lookup_hash+0x1b/0x150
4,1145,116278867,-; do_unlinkat+0x33a/0x540
4,1146,116278870,-; ? __x64_sys_rmdir+0x50/0x50
4,1147,116278872,-; ? create_object+0x649/0xaf0
4,1148,116278875,-; ? kasan_unpoison+0x23/0x50
4,1149,116278879,-; ? kmem_cache_alloc+0x10f/0x220
4,1150,116278882,-; ? getname_flags+0xf8/0x4e0
4,1151,116278886,-; __x64_sys_unlinkat+0x8e/0xd0
4,1152,116278889,-; do_syscall_64+0x3b/0x90
4,1153,116278893,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,1154,116278897,-;RIP: 0033:0x7f9ded268d3b
4,1155,116278900,-;Code: 73 01 c3 48 8b 0d 55 c1 0d 00 f7 d8 64 89 01 48 83 c8
ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 07 01 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 8b 0d 25 c1 0d 00 f7 d8 64 89 01 48
4,1156,116278902,-;RSP: 002b:00007ffeb743e838 EFLAGS: 00000246 ORIG_RAX:
0000000000000107
4,1157,116278906,-;RAX: ffffffffffffffda RBX: 0000564e9d5957d0 RCX:
00007f9ded268d3b
4,1158,116278908,-;RDX: 0000000000000000 RSI: 0000564e9d5945a0 RDI:
00000000ffffff9c
4,1159,116278910,-;RBP: 0000564e9d594510 R08: 0000000000000003 R09:
0000000000000000
4,1160,116278912,-;R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
4,1161,116278914,-;R13: 00007ffeb743ea10 R14: 00007ffeb743ea10 R15:
0000000000000002
4,1162,116278917,-; </TASK>
4,1163,116278919,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,1164,116279030,-;---[ end trace 0000000000000000 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
