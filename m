Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE36DE6AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 23:51:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmLti-00028u-HG;
	Tue, 11 Apr 2023 21:51:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pmLth-00028o-Ec
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 21:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bIYr/1jLbIIwNPkGpzkJsu0lwHfLUxV4iEx+duy3RBg=; b=ea52SoeFLnY/Menpp4nvbl3jcG
 N8l0welRPFtmI3wIPHWZYKrAUktUJEGX8hYkgbNXerErHRbG271Cb8No29qcCBDl89sB/sfl5r+vW
 F1UMIPvAtdmjE6WAfuRHtTQYx6ce+dpmgqoIFA1jIs8H9b+Y5im7x/OKgu5qRNGG/T5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bIYr/1jLbIIwNPkGpzkJsu0lwHfLUxV4iEx+duy3RBg=; b=l6KwlOFf5lOSUoU6K03Uaj60zw
 ls9PHBARdbI2RrTMSZXZ/LueOFa0ejsl1cG35p+knIrdEpN17rD6RHZcQLMniXgtr1uZ4zcNX31zs
 e+4lBamL7DxPieux+dCQreuwhlkUkDjkEx6y5l/iwT1ipvdhVymdCqWX+zmkOUCK74uQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmLtf-004UFr-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 21:51:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58624627FE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 21:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA531C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 21:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681249881;
 bh=N5WJJDb4mWqrafKD/BjM/p8V72PDUwup6vWCvH7aGDU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=V4sZVgR4H4GTD4Uuw37ZvrkVYixGvgPxawLpWnJSt9usmX08+7EYw+xDBVQfGJgdX
 62RJHUvD3ovVOeZLEy0kIkPPla41f84Nr7DyqUQlTalEfv3ouPR+7t76nO7XCVmQJg
 nLdZnxPGj0bRrzrYyzrxXorndFFU9ktyvgPeq9Toip7QCq+USdTulHLJp89to174CO
 rzpTo36qxro/Utv3xz8ODOgBUXHyLVfIiSYZKDmUv1iUmgQeBO2mmrIL25ozbhDIlA
 hwf2GC1Y7dlv19lj9coEgsHBzXUTHi8NTnGFcc4odfVh+RzCAK0hBdn0uxLGifxAQn
 E4vIabUInBh6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 96E4DC43142; Tue, 11 Apr 2023 21:51:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 11 Apr 2023 21:51:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pikatenor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-s5GQiRS0Tg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216050 Ryotaro
 Ko (pikatenor@gmail.com) changed: What |Removed |Added CC|
 |pikatenor@gmail.com
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmLtf-004UFr-NZ
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

Ryotaro Ko (pikatenor@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pikatenor@gmail.com

--- Comment #153 from Ryotaro Ko (pikatenor@gmail.com) ---
I applied the patch on the latest archlinux kernel (6.2.10-arch1
https://github.com/pikatenor/linux/tree/archlinux-6.2.10-f2fs) and tried it,
but f2fs_gc still hangs around 2 hours after boot.

[    0.000000] Linux version 6.2.10-arch1-1-test-507874-g453da3ddc42a
(linux-test@archlinux) (gcc (GCC) 12.2.1 20230201, GNU ld (GNU Binutils) 2.40)
#1 SMP PREEMPT_DYNAMIC Tue, 11 Apr 2023 16:26:44 +0000
[    0.000000] Command line: initrd=\initramfs-linux-test.img
cryptdevice=UUID=b5b188ee-8355-4638-b192-111ee6371c79:Homie
root=UUID=ca2eb962-9af0-4d5c-869d-9c1916f32a2e rw quiet i915.enable_psr=0

[ 9584.264309] INFO: task f2fs_ckpt-259:4:213 blocked for more than 122
seconds.
[ 9584.264313]       Tainted: G     U            
6.2.10-arch1-1-test-507874-g453da3ddc42a #1
[ 9584.264314] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[ 9584.264315] task:f2fs_ckpt-259:4 state:D stack:0     pid:213   ppid:2     
flags:0x00004000
[ 9584.264318] Call Trace:
[ 9584.264319]  <TASK>
[ 9584.264321]  __schedule+0x3c8/0x12e0
[ 9584.264326]  ? select_task_rq_fair+0x16c/0x1c00
[ 9584.264329]  ? update_load_avg+0x7e/0x780
[ 9584.264332]  schedule+0x5e/0xd0
[ 9584.264333]  rwsem_down_write_slowpath+0x329/0x700
[ 9584.264338]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264366]  __checkpoint_and_complete_reqs+0x7a/0x1b0 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264390]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264411]  issue_checkpoint_thread+0x4c/0x110 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264433]  ? __pfx_autoremove_wake_function+0x10/0x10
[ 9584.264437]  kthread+0xdb/0x110
[ 9584.264438]  ? __pfx_kthread+0x10/0x10
[ 9584.264440]  ret_from_fork+0x29/0x50
[ 9584.264445]  </TASK>
[ 9584.264508] INFO: task kworker/u16:2:19587 blocked for more than 122
seconds.
[ 9584.264509]       Tainted: G     U            
6.2.10-arch1-1-test-507874-g453da3ddc42a #1
[ 9584.264510] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[ 9584.264510] task:kworker/u16:2   state:D stack:0     pid:19587 ppid:2     
flags:0x00004000
[ 9584.264514] Workqueue: writeback wb_workfn (flush-259:0)
[ 9584.264517] Call Trace:
[ 9584.264518]  <TASK>
[ 9584.264519]  __schedule+0x3c8/0x12e0
[ 9584.264521]  ? ttwu_queue_wakelist+0xef/0x110
[ 9584.264524]  ? try_to_wake_up+0xd9/0x540
[ 9584.264527]  schedule+0x5e/0xd0
[ 9584.264528]  schedule_timeout+0x151/0x160
[ 9584.264531]  wait_for_completion+0x8a/0x160
[ 9584.264534]  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264558]  f2fs_balance_fs_bg+0x12e/0x390 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264582]  f2fs_write_node_pages+0x78/0x240 [f2fs
137a18329c9b4a66b7d5836126aee7155321bd82]
[ 9584.264606]  do_writepages+0xc1/0x1d0
[ 9584.264610]  __writeback_single_inode+0x3d/0x360
[ 9584.264614]  writeback_sb_inodes+0x1ed/0x4a0
[ 9584.264618]  __writeback_inodes_wb+0x4c/0xf0
[ 9584.264621]  wb_writeback+0x204/0x2f0
[ 9584.264625]  wb_workfn+0x354/0x4f0
[ 9584.264627]  ? ttwu_queue_wakelist+0xef/0x110
[ 9584.264630]  process_one_work+0x1c5/0x3c0
[ 9584.264633]  worker_thread+0x51/0x390
[ 9584.264636]  ? __pfx_worker_thread+0x10/0x10
[ 9584.264638]  kthread+0xdb/0x110
[ 9584.264639]  ? __pfx_kthread+0x10/0x10
[ 9584.264641]  ret_from_fork+0x29/0x50
[ 9584.264645]  </TASK>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
