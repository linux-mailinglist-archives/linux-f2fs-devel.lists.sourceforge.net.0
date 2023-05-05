Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA66F8CB4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 01:17:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pv4gG-0001o7-7Y;
	Fri, 05 May 2023 23:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pv4gE-0001o1-0f
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 23:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eMcfBI2Xnch4kdMe9hW5WVWrBQQ3U7XULCMQNcMiHUM=; b=kU68Xa20b1NPMLcJuQ9nN36qva
 b5NCbmjWa+S3FdQBlT89S2CwFjKobUECnQU4QqeCnbj+V2ZNfGdcJP8WiUw0+ehTwoUcnoW80cDjA
 bWnhihA0T0XBesuOgM7O5rw8iQHKxIcvwRkfqx4D+uAicOaN3drWzHQ32BV4aSudPdvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eMcfBI2Xnch4kdMe9hW5WVWrBQQ3U7XULCMQNcMiHUM=; b=a6X7SdoRgdkxXdnHlCHAIHkiJJ
 aV5tPvgPCvEowh0Q2A2Vqrl9x9/rvVe+R3y3IAlrDe8Gb5Yo5xFROXBezNzn4Wm66yjDFXvFlSwZ9
 +aqUkrynBV0525Itxa57dNrFlri9Lp37BLMv07tsDReiNi+ib75Nciu2OOjK1O5N1oSI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pv4gD-0008Hc-7X for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 23:17:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CAE16410C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 23:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68062C433A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 23:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683328649;
 bh=C1HoeCM9haCIDiSbqenpSjrZwgnwamd6dgKFXIZ+Hzo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ouHU7R4sTfd9SOo7cG/Vij6dvuPBz+hBcDdHy3M/ElOMVC9jrjz/SjJ//u+L78y9O
 e4Plu/Z2jmgAy62sKDT+kRd8Ovo2ofQ3IyHcOm1KGPqXEOeEA7D9hcsY0vXfLe2o2O
 Rvq8SScPEDNvvafeLlPpQOkYABx85bHH0uyTbaOVG1xCDAZa/9KFqf2AnW3yBtZHBu
 eiiRA6djncn6G0MOGFjC/1hHuzEoWOy0REmm7HPRHlExWKDllCCh/MyRFu5t+FcpxP
 yQf+7somCxcfMU4S8Ea2PiwebYIOg+EYgu0EMvxi36wUPij9yDIeaLCSab6MECkuh5
 lbSVzhE6I/ZEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 60460C43141; Fri,  5 May 2023 23:17:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 05 May 2023 23:17:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: lp610mh@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-YEtOxCO9I3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #168 from Matias (lp610mh@gmail.com) --- Removed background_gc=sync and it
 happened again, i hope this message gets sent so you could take a look, this
 is the journalctl log after it happe [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pv4gD-0008Hc-7X
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

--- Comment #168 from Matias (lp610mh@gmail.com) ---
Removed background_gc=sync and it happened again, i hope this message gets sent
so you could take a look, this is the journalctl log after it happens. 

Kernel: 6.3.1 with f2fs updates of 6.4-rc1



May 05 20:13:44 cachyos-x8664 kernel: INFO: task f2fs_ckpt-8:1:204 blocked for
more than 122 seconds.
May 05 20:13:44 cachyos-x8664 kernel:       Not tainted 6.3.1-1-cachyos #1
May 05 20:13:44 cachyos-x8664 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 05 20:13:44 cachyos-x8664 kernel: task:f2fs_ckpt-8:1   state:D stack:0    
pid:204   ppid:2      flags:0x00004000
May 05 20:13:44 cachyos-x8664 kernel: Call Trace:
May 05 20:13:44 cachyos-x8664 kernel:  <TASK>
May 05 20:13:44 cachyos-x8664 kernel:  __schedule+0x441/0x17b0
May 05 20:13:44 cachyos-x8664 kernel:  ?
asm_sysvec_apic_timer_interrupt+0x1a/0x20
May 05 20:13:44 cachyos-x8664 kernel:  schedule_preempt_disabled+0x65/0xe0
May 05 20:13:44 cachyos-x8664 kernel:  rwsem_down_write_slowpath+0x22b/0x6c0
May 05 20:13:44 cachyos-x8664 kernel:  ? psi_task_switch+0x12f/0x340
May 05 20:13:44 cachyos-x8664 kernel:  ?
__pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  down_write+0x5b/0x60
May 05 20:13:44 cachyos-x8664 kernel: 
__checkpoint_and_complete_reqs+0x7c/0x1b0 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  ?
__pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  issue_checkpoint_thread+0x4c/0x110 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  ?
__pfx_autoremove_wake_function+0x10/0x10
May 05 20:13:44 cachyos-x8664 kernel:  kthread+0xdb/0x110
May 05 20:13:44 cachyos-x8664 kernel:  ? __pfx_kthread+0x10/0x10
May 05 20:13:44 cachyos-x8664 kernel:  ret_from_fork+0x29/0x50
May 05 20:13:44 cachyos-x8664 kernel:  </TASK>
May 05 20:13:44 cachyos-x8664 kernel: INFO: task kworker/u16:0:5392 blocked for
more than 122 seconds.
May 05 20:13:44 cachyos-x8664 kernel:       Not tainted 6.3.1-1-cachyos #1
May 05 20:13:44 cachyos-x8664 kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 05 20:13:44 cachyos-x8664 kernel: task:kworker/u16:0   state:D stack:0    
pid:5392  ppid:2      flags:0x00004000
May 05 20:13:44 cachyos-x8664 kernel: Workqueue: writeback wb_workfn
(flush-8:0)
May 05 20:13:44 cachyos-x8664 kernel: Call Trace:
May 05 20:13:44 cachyos-x8664 kernel:  <TASK>
May 05 20:13:44 cachyos-x8664 kernel:  __schedule+0x441/0x17b0
May 05 20:13:44 cachyos-x8664 kernel:  ? blk_mq_submit_bio+0x396/0x760
May 05 20:13:44 cachyos-x8664 kernel:  ? ttwu_queue_wakelist+0xef/0x110
May 05 20:13:44 cachyos-x8664 kernel:  schedule+0x5e/0xd0
May 05 20:13:44 cachyos-x8664 kernel:  schedule_timeout+0x329/0x390
May 05 20:13:44 cachyos-x8664 kernel:  ? autoremove_wake_function+0x32/0x60
May 05 20:13:44 cachyos-x8664 kernel:  wait_for_completion+0x86/0x160
May 05 20:13:44 cachyos-x8664 kernel:  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  f2fs_balance_fs_bg+0x12e/0x3b0 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  f2fs_write_node_pages+0x85/0xa00 [f2fs
d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  ? __pfx_ata_scsi_rw_xlat+0x10/0x10
May 05 20:13:44 cachyos-x8664 kernel:  ? ata_qc_issue+0x138/0x270
May 05 20:13:44 cachyos-x8664 kernel:  ? ata_scsi_queuecmd+0xe4/0x170
May 05 20:13:44 cachyos-x8664 kernel:  ? select_task_rq_fair+0x15d/0x2880
May 05 20:13:44 cachyos-x8664 kernel:  ? __pfx_f2fs_write_node_pages+0x10/0x10
[f2fs d2333fc34706e39c1a83271e8b382b177aae887d]
May 05 20:13:44 cachyos-x8664 kernel:  do_writepages+0x8c/0x610
May 05 20:13:44 cachyos-x8664 kernel:  ? blk_mq_do_dispatch_sched+0xa7/0x3c0
May 05 20:13:44 cachyos-x8664 kernel:  ? _flat_send_IPI_mask+0x1f/0x30
May 05 20:13:44 cachyos-x8664 kernel:  ? ttwu_queue_wakelist+0xef/0x110
May 05 20:13:44 cachyos-x8664 kernel:  ? try_to_wake_up+0xd9/0xcb0
May 05 20:13:44 cachyos-x8664 kernel:  __writeback_single_inode+0x3d/0x360
May 05 20:13:44 cachyos-x8664 kernel:  writeback_sb_inodes+0x1ed/0x530
May 05 20:13:44 cachyos-x8664 kernel:  ? __wake_up+0x8b/0xc0
May 05 20:13:44 cachyos-x8664 kernel:  __writeback_inodes_wb+0x4c/0xf0
May 05 20:13:44 cachyos-x8664 kernel:  wb_writeback+0x1fe/0x390
May 05 20:13:44 cachyos-x8664 kernel:  wb_workfn+0x412/0x600
May 05 20:13:44 cachyos-x8664 kernel:  ? __schedule+0x449/0x17b0
May 05 20:13:44 cachyos-x8664 kernel:  process_one_work+0x24b/0x460
May 05 20:13:44 cachyos-x8664 kernel:  worker_thread+0x55/0x4f0
May 05 20:13:44 cachyos-x8664 kernel:  ? __pfx_worker_thread+0x10/0x10
May 05 20:13:44 cachyos-x8664 kernel:  kthread+0xdb/0x110
May 05 20:13:44 cachyos-x8664 kernel:  ? __pfx_kthread+0x10/0x10
May 05 20:13:44 cachyos-x8664 kernel:  ret_from_fork+0x29/0x50

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
