Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98C5118C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 16:27:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njidq-0004EA-L9; Wed, 27 Apr 2022 14:27:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njidp-0004E4-W9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 14:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M5To0gtSELWPOYfVIwL/G9pGNLfqrBHrYBLgD/F0B+4=; b=R32uq4bcbXgzPgi3VXEQMpw/Ut
 PLib3wU4Sa69c3pGUwVLjiSyIELANQ3FyLPH4oGnpRyauQOGANyWZ0upcKwr0+6ea2sf9NckqpAaK
 c0JzpZaK6Sbsf40WXQLF+HJfa44aIYxtsZ4nvmqFZr4FNE/f6fcxOyIxXI3/7v+hKucc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M5To0gtSELWPOYfVIwL/G9pGNLfqrBHrYBLgD/F0B+4=; b=A
 1mUpejxz0SdEdUh5ZuLd6RVrW4ZWWDxWW3zl2E0YMheedBjIumUG9I3F50VsMwwt0INueHPcZALB2
 1DenntZ7/1/ws115feUTlISxhUIQxu/axEbBRgDF6oOxYvAAQoeYv2Psx/AnvyTgn5a4a5p406Viz
 WbwrYyp7L6zfiCn0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njidn-00083Y-B8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 14:27:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9CCD61D73
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 14:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14AC5C385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651069648;
 bh=h4Z57SyF/mvRztOInXaGDBXaLc0ibPn5pDij84RzgDY=;
 h=From:To:Subject:Date:From;
 b=LtxZGhLpfLFTnx46mhrTn+mkXIe4712E2jsiUrZjXxk0yQA+3PgihO4NDme/aXeks
 b2zjJdWxq71hcGhgXpwhpICG7gYZrQUdk4Hez3U/mXJj8chidyzi9ITs5zrVzDSx7G
 rTB2WJncVOoaNO3Bnm28hsl668icR0289EyXZ/9bZa0LjPtBKWYcvQaH3y99LV65Ms
 GSFHh4mfNeHOf2zBgCSczrOVPctLcZltWbqUQLd6Y22khvky4d4OyHI6zSJHkPRRlG
 LoEN2RaXvQWZoZN/a+6NMZWoXchKzWoIoF4dMUDvBfVSIDIIm5xUcyFD///sv1ZjVv
 0F72/1TnG15Sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E2C38C05FCE; Wed, 27 Apr 2022 14:27:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 14:27:27 +0000
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
Message-ID: <bug-215904-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215904 Bug ID:
 215904 Summary: kernel BUG at fs/f2fs/inode.c:825! Product: File System
 Version:
 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree: Mainline Status: NEW
 Severity: normal Priority: P1 Comp [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1njidn-00083Y-B8
Subject: [f2fs-dev] [Bug 215904] New: kernel BUG at fs/f2fs/inode.c:825!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215904

            Bug ID: 215904
           Summary: kernel BUG at fs/f2fs/inode.c:825!
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

Created attachment 300828
  --> https://bugzilla.kernel.org/attachment.cgi?id=300828&action=edit
case.c

I have encountered a bug in F2FS file system in kernel v5.17.

I have uploaded the system call sequence as case.c, and a fuzzed image can be
found in google net disk
(https://drive.google.com/file/d/1jtULqt8XBvtgyzC2eZAz8-6scMcKX6eZ/view?usp=sharing).

The kernel should enable CONFIG_KASAN=y and CONFIG_KASAN_INLINE=y. You can
reproduce the bug by running the following commands:

gcc -o case case.c
losetup /dev/loop0 case.img
mount -o
"disable_ext_identify,inline_data,inline_dentry,flush_merge,nobarrier,mode=adaptive,noquota,alloc_mode=reuse"
-t f2fs /dev/loop0 /root/mnt
./case

The kernel message is shown below:

4,20635,429868223,-;------------[ cut here ]------------
2,20636,429868228,-;kernel BUG at fs/f2fs/inode.c:825!
4,20637,429868236,-;invalid opcode: 0000 [#2] PREEMPT SMP KASAN PTI
4,20638,429868243,-;CPU: 2 PID: 4549 Comm: umount Tainted: G      D W        
5.17.0 #4
4,20639,429868249,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,20640,429868253,-;RIP: 0010:f2fs_evict_inode+0x10b0/0x1510
4,20641,429868260,-;Code: fc ff df 4c 89 f2 48 c1 ea 03 80 3c 02 00 0f 85 33 04
00 00 41 8b 77 40 ba 01 00 00 00 48 89 ef e8 75 c0 05 00 e9 db fd ff ff <0f> 0b
48 8d 7d 48 be 08 00 00 00 e8 d0 6f 57 ff f0 80 4d 49 10 e9
4,20642,429868267,-;RSP: 0018:ffff88812cb27af0 EFLAGS: 00010202
4,20643,429868273,-;RAX: 0000000000000042 RBX: ffff88814af40000 RCX:
ffffffffb3e4a495
4,20644,429868278,-;RDX: 1ffff1102bd53356 RSI: 0000000000000008 RDI:
ffff88815ea99ab0
4,20645,429868284,-;RBP: ffff888110ece000 R08: 0000000000000001 R09:
ffffed102bd53357
4,20646,429868288,-;R10: ffff88815ea99ab7 R11: ffffed102bd53356 R12:
ffff88815ea99ab0
4,20647,429868293,-;R13: ffff888110ece048 R14: ffff88815ea99878 R15:
ffff88815ea99838
4,20648,429868298,-;FS:  00007f2e62b1b840(0000) GS:ffff8881d5680000(0000)
knlGS:0000000000000000
4,20649,429868304,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,20650,429868309,-;CR2: 000056521bb81000 CR3: 0000000117f70003 CR4:
00000000001706e0
4,20651,429868313,-;Call Trace:
4,20652,429868317,-; <TASK>
4,20653,429868322,-; evict+0x282/0x4e0
4,20654,429868328,-; __dentry_kill+0x2b2/0x4d0
4,20655,429868334,-; ? shrink_lock_dentry.part.0+0x7c/0x200
4,20656,429868341,-; shrink_dentry_list+0x17c/0x4f0
4,20657,429868348,-; shrink_dcache_parent+0x143/0x1e0
4,20658,429868355,-; ? shrink_dcache_sb+0x280/0x280
4,20659,429868361,-; ? rwsem_spin_on_owner+0x1d0/0x1d0
4,20660,429868368,-; ? f2fs_get_sectors_written+0x370/0x370
4,20661,429868375,-; do_one_tree+0x9/0x30
4,20662,429868381,-; shrink_dcache_for_umount+0x51/0x120
4,20663,429868388,-; generic_shutdown_super+0x5c/0x3a0
4,20664,429868395,-; kill_block_super+0x90/0xd0
4,20665,429868401,-; kill_f2fs_super+0x225/0x310
4,20666,429868407,-; ? kasan_quarantine_put+0x46/0x160
4,20667,429868413,-; ? f2fs_dquot_commit+0xb0/0xb0
4,20668,429868419,-; ? kfree+0x8f/0x2b0
4,20669,429868425,-; ? unregister_shrinker+0x194/0x250
4,20670,429868432,-; deactivate_locked_super+0x78/0xc0
4,20671,429868438,-; cleanup_mnt+0x2b7/0x480
4,20672,429868444,-; ? call_rcu+0x21c/0x820
4,20673,429868450,-; task_work_run+0xc8/0x150
4,20674,429868457,-; exit_to_user_mode_prepare+0x14a/0x150
4,20675,429868464,-; syscall_exit_to_user_mode+0x1d/0x40
4,20676,429868471,-; do_syscall_64+0x48/0x90
4,20677,429868477,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,20678,429868483,-;RIP: 0033:0x7f2e62d7a19b
4,20679,429868488,-;Code: cc 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e
fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 8b 0d c5 cc 0c 00 f7 d8 64 89 01 48
4,20680,429868494,-;RSP: 002b:00007ffd8e9f9438 EFLAGS: 00000246 ORIG_RAX:
00000000000000a6
4,20681,429868500,-;RAX: 0000000000000000 RBX: 00007f2e62eac204 RCX:
00007f2e62d7a19b
4,20682,429868505,-;RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000557ec0ea7740
4,20683,429868509,-;RBP: 0000557ec0ea7530 R08: 0000000000000000 R09:
00007ffd8e9f81e0
4,20684,429868512,-;R10: 00007f2e62e98379 R11: 0000000000000246 R12:
0000557ec0ea7740
4,20685,429868514,-;R13: 0000000000000000 R14: 0000557ec0ea7628 R15:
0000000000000000
4,20686,429868517,-; </TASK>
4,20687,429868519,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,20688,429868526,-;---[ end trace 0000000000000000 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
