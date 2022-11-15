Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CC6292F4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 09:08:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouqzZ-0001zr-2N;
	Tue, 15 Nov 2022 08:08:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1ouqzX-0001zl-CG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 08:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mONFuH/eIjENsEACtjCapQced/VcU/K3qmlG7gP50F4=; b=hV88vVBMAeXR0aX1Lvqi5rJXQZ
 S0cfB+a3Ka1jf0egFHR2IfJDHx/3+GYue2T/7oOu7sTrhvzrF4500bVCtRdcQhaupCKwm2FD14dH+
 Lu1U843oCLSM9/EHS5BFUdJ//izY0vwRVVGNx/SYadrhHxVllMXpBoQxvS+CSUO5HCP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mONFuH/eIjENsEACtjCapQced/VcU/K3qmlG7gP50F4=; b=S4p7TiquR58BUtBam5o3RZFZgK
 2pVulBhpYblXRv/MECOTdfYQLAa23nshO9Bl/aILFCmUiHf4hK6SQi4RFWm/rs2p2TXuLtKQnVM6M
 KHc0wKcinG6Z3lSsG145EZR3Xz35HAOSj/1f2Vx8Sm8E+gQztGWf+f3FXK2i63YZpxws=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouqzT-008tGd-3E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 08:08:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A165561563
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Nov 2022 08:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 100B1C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Nov 2022 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668499689;
 bh=6PF+WOCNq97DtwU/nS559ZGw4jRfYpaZAMThg+dRKag=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S/9bWazjVu/Wc8pHnpNxFvCNSvPb9aRG2UdErBttbzGvN0wYLpjnQNkZb3xrgy9tJ
 oOh45eTU/6t/hLf/YQmHj22aRlAURq3z1GgSJDNbCiGLuq2/NYKqh++2202+Jl5s3K
 WnZi/IIv0ve3WJWi3v+4T404pvvG4SOWzp0gN5kc2mes/7BX/LFQM/d0gw/A6VKc28
 iMMS7pacDxKArQ07Cd+2a1mRQKLpq7bAnggFg4DeRjJnjy9PfsEj6A1OlNGh2Cp9Mk
 Rq5ARWF7wZ2hiXM9Po+v2ro5UESKPJ2U9YKYJE/UpSrK9aPpjodcCZFv9e7Z0UWfhV
 iwckywFJKgKTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E3313C433E6; Tue, 15 Nov 2022 08:08:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 15 Nov 2022 08:08:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-yqyySMlx35@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #88 from Guido (guido.iodice@gmail.com) --- (In reply to Guido from comment
 #87) > Created attachment 303184 [details] > kernel log (with patch on data.c
 applied) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouqzT-008tGd-3E
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

--- Comment #88 from Guido (guido.iodice@gmail.com) ---
(In reply to Guido from comment #87)
> Created attachment 303184 [details]
> kernel log (with patch on data.c applied)

After several days of use I still did not have the 100% cpu busy problem but it
gets worse. The system would not go to sleep or shut down (this happened
several times and forced me to brutally shut down the computer), so checking
the log I noticed several errors related to f2fs. I attach the log.

Follows an extract of the log for your convenience

nov 15 02:17:13 manjaro kernel: INFO: task f2fs_ckpt-259:3:233 blocked for more
than 245 seconds.
nov 15 02:17:13 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:17:13 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:17:13 manjaro kernel: task:f2fs_ckpt-259:3 state:D stack:    0 pid: 
233 ppid:     2 flags:0x00004000
nov 15 02:17:13 manjaro kernel: Call Trace:
nov 15 02:17:13 manjaro kernel:  <TASK>
nov 15 02:17:13 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:17:13 manjaro kernel:  ? update_load_avg+0x7e/0x730
nov 15 02:17:13 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:17:13 manjaro kernel:  rwsem_down_write_slowpath+0x336/0x720
nov 15 02:17:13 manjaro kernel:  ? psi_task_switch+0xc3/0x1f0
nov 15 02:17:13 manjaro kernel:  ? __schedule+0x34b/0x11c0
nov 15 02:17:13 manjaro kernel:  ? __checkpoint_and_complete_reqs+0x1b0/0x1b0
[f2fs 112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  __checkpoint_and_complete_reqs+0x7a/0x1b0
[f2fs 112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  ? __checkpoint_and_complete_reqs+0x1b0/0x1b0
[f2fs 112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  issue_checkpoint_thread+0x4c/0x110 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  ? cpuacct_percpu_seq_show+0x20/0x20
nov 15 02:17:13 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:17:13 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:17:13 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:17:13 manjaro kernel:  </TASK>
nov 15 02:17:13 manjaro kernel: INFO: task kworker/u16:10:26736 blocked for
more than 245 seconds.
nov 15 02:17:13 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:17:13 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:17:13 manjaro kernel: task:kworker/u16:10  state:D stack:    0
pid:26736 ppid:     2 flags:0x00004000
nov 15 02:17:13 manjaro kernel: Workqueue: writeback wb_workfn (flush-259:0)
nov 15 02:17:13 manjaro kernel: Call Trace:
nov 15 02:17:13 manjaro kernel:  <TASK>
nov 15 02:17:13 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:17:13 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:17:13 manjaro kernel:  schedule_timeout+0x11c/0x150
nov 15 02:17:13 manjaro kernel:  wait_for_completion+0x8a/0x160
nov 15 02:17:13 manjaro kernel:  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  f2fs_balance_fs_bg+0x119/0x370 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  f2fs_write_node_pages+0x78/0x240 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:17:13 manjaro kernel:  do_writepages+0xc1/0x1d0
nov 15 02:17:13 manjaro kernel:  ? __wb_calc_thresh+0x4b/0x140
nov 15 02:17:13 manjaro kernel:  __writeback_single_inode+0x3d/0x360
nov 15 02:17:13 manjaro kernel:  ? inode_io_list_move_locked+0x69/0xc0
nov 15 02:17:13 manjaro kernel:  writeback_sb_inodes+0x1ed/0x4a0
nov 15 02:17:13 manjaro kernel:  __writeback_inodes_wb+0x4c/0xf0
nov 15 02:17:13 manjaro kernel:  wb_writeback+0x204/0x2f0
nov 15 02:17:13 manjaro kernel:  wb_workfn+0x31c/0x4f0
nov 15 02:17:13 manjaro kernel:  ? __mod_timer+0x289/0x3b0
nov 15 02:17:13 manjaro kernel:  process_one_work+0x1c4/0x380
nov 15 02:17:13 manjaro kernel:  worker_thread+0x51/0x390
nov 15 02:17:13 manjaro kernel:  ? rescuer_thread+0x3b0/0x3b0
nov 15 02:17:13 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:17:13 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:17:13 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:17:13 manjaro kernel:  </TASK>
nov 15 02:19:16 manjaro kernel: INFO: task kworker/7:1:86 blocked for more than
122 seconds.
nov 15 02:19:16 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:19:16 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:19:16 manjaro kernel: task:kworker/7:1     state:D stack:    0 pid:  
86 ppid:     2 flags:0x00004000
nov 15 02:19:16 manjaro kernel: Workqueue: inode_switch_wbs
inode_switch_wbs_work_fn
nov 15 02:19:16 manjaro kernel: Call Trace:
nov 15 02:19:16 manjaro kernel:  <TASK>
nov 15 02:19:16 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:19:16 manjaro kernel:  ? ttwu_do_wakeup+0x17/0x170
nov 15 02:19:16 manjaro kernel:  ? try_to_wake_up+0x25f/0x560
nov 15 02:19:16 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:19:16 manjaro kernel:  rwsem_down_read_slowpath+0x2a6/0x520
nov 15 02:19:16 manjaro kernel:  ? update_load_avg+0x7e/0x730
nov 15 02:19:16 manjaro kernel:  inode_switch_wbs_work_fn+0x5c/0x810
nov 15 02:19:16 manjaro kernel:  ? __switch_to_asm+0x3e/0x60
nov 15 02:19:16 manjaro kernel:  ? finish_task_switch.isra.0+0x90/0x2d0
nov 15 02:19:16 manjaro kernel:  ? __schedule+0x34b/0x11c0
nov 15 02:19:16 manjaro kernel:  ? mod_memcg_lruvec_state+0x15/0x30
nov 15 02:19:16 manjaro kernel:  process_one_work+0x1c4/0x380
nov 15 02:19:16 manjaro kernel:  worker_thread+0x51/0x390
nov 15 02:19:16 manjaro kernel:  ? rescuer_thread+0x3b0/0x3b0
nov 15 02:19:16 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:19:16 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:19:16 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:19:16 manjaro kernel:  </TASK>
nov 15 02:19:16 manjaro kernel: INFO: task f2fs_ckpt-259:3:233 blocked for more
than 368 seconds.
nov 15 02:19:16 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:19:16 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:19:16 manjaro kernel: task:f2fs_ckpt-259:3 state:D stack:    0 pid: 
233 ppid:     2 flags:0x00004000
nov 15 02:19:16 manjaro kernel: Call Trace:
nov 15 02:19:16 manjaro kernel:  <TASK>
nov 15 02:19:16 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:19:16 manjaro kernel:  ? update_load_avg+0x7e/0x730
nov 15 02:19:16 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:19:16 manjaro kernel:  rwsem_down_write_slowpath+0x336/0x720
nov 15 02:19:16 manjaro kernel:  ? psi_task_switch+0xc3/0x1f0
nov 15 02:19:16 manjaro kernel:  ? __schedule+0x34b/0x11c0
nov 15 02:19:16 manjaro kernel:  ? __checkpoint_and_complete_reqs+0x1b0/0x1b0
[f2fs 112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  __checkpoint_and_complete_reqs+0x7a/0x1b0
[f2fs 112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  ? __checkpoint_and_complete_reqs+0x1b0/0x1b0
[f2fs 112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  issue_checkpoint_thread+0x4c/0x110 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  ? cpuacct_percpu_seq_show+0x20/0x20
nov 15 02:19:16 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:19:16 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:19:16 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:19:16 manjaro kernel:  </TASK>
nov 15 02:19:16 manjaro kernel: INFO: task NetworkManager:791 blocked for more
than 122 seconds.
nov 15 02:19:16 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:19:16 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:19:16 manjaro kernel: task:NetworkManager  state:D stack:    0 pid: 
791 ppid:     1 flags:0x00000002
nov 15 02:19:16 manjaro kernel: Call Trace:
nov 15 02:19:16 manjaro kernel:  <TASK>
nov 15 02:19:16 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:19:16 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:19:16 manjaro kernel:  schedule_timeout+0x11c/0x150
nov 15 02:19:16 manjaro kernel:  wait_for_completion+0x8a/0x160
nov 15 02:19:16 manjaro kernel:  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  ? do_filp_open+0xb3/0x160
nov 15 02:19:16 manjaro kernel:  f2fs_do_sync_file+0x184/0x9d0 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  __x64_sys_fsync+0x3b/0x70
nov 15 02:19:16 manjaro kernel:  do_syscall_64+0x5c/0x90
nov 15 02:19:16 manjaro kernel:  ? do_syscall_64+0x6b/0x90
nov 15 02:19:16 manjaro kernel:  ? do_syscall_64+0x6b/0x90
nov 15 02:19:16 manjaro kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
nov 15 02:19:16 manjaro kernel:  ? do_syscall_64+0x6b/0x90
nov 15 02:19:16 manjaro kernel:  ? do_syscall_64+0x6b/0x90
nov 15 02:19:16 manjaro kernel:  ? do_syscall_64+0x6b/0x90
nov 15 02:19:16 manjaro kernel:  ? do_syscall_64+0x6b/0x90
nov 15 02:19:16 manjaro kernel:  entry_SYSCALL_64_after_hwframe+0x63/0xcd
nov 15 02:19:16 manjaro kernel: RIP: 0033:0x7fe4694ddb0a
nov 15 02:19:16 manjaro kernel: RSP: 002b:00007fff3d5a29d0 EFLAGS: 00000293
ORIG_RAX: 000000000000004a
nov 15 02:19:16 manjaro kernel: RAX: ffffffffffffffda RBX: 000056249d7d17b0
RCX: 00007fe4694ddb0a
nov 15 02:19:16 manjaro kernel: RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000016
nov 15 02:19:16 manjaro kernel: RBP: 0000000000000016 R08: 0000000000000000
R09: 00007fff3d5a2aa0
nov 15 02:19:16 manjaro kernel: R10: 0000000000000000 R11: 0000000000000293
R12: 000056249d86ec00
nov 15 02:19:16 manjaro kernel: R13: 0000000000000001 R14: 0000000000000016
R15: 000056249d83ccd0
nov 15 02:19:16 manjaro kernel:  </TASK>
nov 15 02:19:16 manjaro kernel: INFO: task kworker/u16:10:26736 blocked for
more than 368 seconds.
nov 15 02:19:16 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:19:16 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:19:16 manjaro kernel: task:kworker/u16:10  state:D stack:    0
pid:26736 ppid:     2 flags:0x00004000
nov 15 02:19:16 manjaro kernel: Workqueue: writeback wb_workfn (flush-259:0)
nov 15 02:19:16 manjaro kernel: Call Trace:
nov 15 02:19:16 manjaro kernel:  <TASK>
nov 15 02:19:16 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:19:16 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:19:16 manjaro kernel:  schedule_timeout+0x11c/0x150
nov 15 02:19:16 manjaro kernel:  wait_for_completion+0x8a/0x160
nov 15 02:19:16 manjaro kernel:  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  f2fs_balance_fs_bg+0x119/0x370 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  f2fs_write_node_pages+0x78/0x240 [f2fs
112497ead8e6784e9a6a664ca29672f96820d535]
nov 15 02:19:16 manjaro kernel:  do_writepages+0xc1/0x1d0
nov 15 02:19:16 manjaro kernel:  ? __wb_calc_thresh+0x4b/0x140
nov 15 02:19:16 manjaro kernel:  __writeback_single_inode+0x3d/0x360
nov 15 02:19:16 manjaro kernel:  ? inode_io_list_move_locked+0x69/0xc0
nov 15 02:19:16 manjaro kernel:  writeback_sb_inodes+0x1ed/0x4a0
nov 15 02:19:16 manjaro kernel:  __writeback_inodes_wb+0x4c/0xf0
nov 15 02:19:16 manjaro kernel:  wb_writeback+0x204/0x2f0
nov 15 02:19:16 manjaro kernel:  wb_workfn+0x31c/0x4f0
nov 15 02:19:16 manjaro kernel:  ? __mod_timer+0x289/0x3b0
nov 15 02:19:16 manjaro kernel:  process_one_work+0x1c4/0x380
nov 15 02:19:16 manjaro kernel:  worker_thread+0x51/0x390
nov 15 02:19:16 manjaro kernel:  ? rescuer_thread+0x3b0/0x3b0
nov 15 02:19:16 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:19:16 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:19:16 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:19:16 manjaro kernel:  </TASK>
nov 15 02:19:16 manjaro kernel: INFO: task kworker/6:2:27513 blocked for more
than 122 seconds.
nov 15 02:19:16 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:19:16 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:19:16 manjaro kernel: task:kworker/6:2     state:D stack:    0
pid:27513 ppid:     2 flags:0x00004000
nov 15 02:19:16 manjaro kernel: Workqueue: inode_switch_wbs
inode_switch_wbs_work_fn
nov 15 02:19:16 manjaro kernel: Call Trace:
nov 15 02:19:16 manjaro kernel:  <TASK>
nov 15 02:19:16 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:19:16 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:19:16 manjaro kernel:  rwsem_down_read_slowpath+0x2a6/0x520
nov 15 02:19:16 manjaro kernel:  inode_switch_wbs_work_fn+0x5c/0x810
nov 15 02:19:16 manjaro kernel:  ? __switch_to_asm+0x3e/0x60
nov 15 02:19:16 manjaro kernel:  ? finish_task_switch.isra.0+0x90/0x2d0
nov 15 02:19:16 manjaro kernel:  ? __schedule+0x34b/0x11c0
nov 15 02:19:16 manjaro kernel:  process_one_work+0x1c4/0x380
nov 15 02:19:16 manjaro kernel:  worker_thread+0x51/0x390
nov 15 02:19:16 manjaro kernel:  ? rescuer_thread+0x3b0/0x3b0
nov 15 02:19:16 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:19:16 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:19:16 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:19:16 manjaro kernel:  </TASK>
nov 15 02:19:16 manjaro kernel: INFO: task kworker/7:2:28769 blocked for more
than 122 seconds.
nov 15 02:19:16 manjaro kernel:       Tainted: G     U            
6.0.8-1-MANJARO #1
nov 15 02:19:16 manjaro kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
nov 15 02:19:16 manjaro kernel: task:kworker/7:2     state:D stack:    0
pid:28769 ppid:     2 flags:0x00004000
nov 15 02:19:16 manjaro kernel: Workqueue: inode_switch_wbs
inode_switch_wbs_work_fn
nov 15 02:19:16 manjaro kernel: Call Trace:
nov 15 02:19:16 manjaro kernel:  <TASK>
nov 15 02:19:16 manjaro kernel:  __schedule+0x343/0x11c0
nov 15 02:19:16 manjaro kernel:  ? try_to_wake_up+0x68/0x560
nov 15 02:19:16 manjaro kernel:  schedule+0x5e/0xd0
nov 15 02:19:16 manjaro kernel:  rwsem_down_read_slowpath+0x2a6/0x520
nov 15 02:19:16 manjaro kernel:  inode_switch_wbs_work_fn+0x5c/0x810
nov 15 02:19:16 manjaro kernel:  ? check_preempt_curr+0x5e/0x70
nov 15 02:19:16 manjaro kernel:  ? ttwu_do_wakeup+0x17/0x170
nov 15 02:19:16 manjaro kernel:  ? try_to_wake_up+0x25f/0x560
nov 15 02:19:16 manjaro kernel:  process_one_work+0x1c4/0x380
nov 15 02:19:16 manjaro kernel:  worker_thread+0x51/0x390
nov 15 02:19:16 manjaro kernel:  ? rescuer_thread+0x3b0/0x3b0
nov 15 02:19:16 manjaro kernel:  kthread+0xdb/0x110
nov 15 02:19:16 manjaro kernel:  ? kthread_complete_and_exit+0x20/0x20
nov 15 02:19:16 manjaro kernel:  ret_from_fork+0x1f/0x30
nov 15 02:19:16 manjaro kernel:  </TASK>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
