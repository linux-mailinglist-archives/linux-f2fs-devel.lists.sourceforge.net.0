Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC935AE56B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 12:33:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVVt1-0000BE-NC;
	Tue, 06 Sep 2022 10:32:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oVVt0-0000B7-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 10:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ByCrgYSvV5rK109QSaug+H1CHfQ/CtgE19e4KB7BV+c=; b=b97KIZzaRD+Bx54nVwg71JY8re
 yW4+db47FonycTYYsSqnAgTt2n46UDwX2/e8XNRk/jiJp15PQb2uO0PFpUnPNgSnUUm47iROf5VKP
 vMsLii4rHGQj0XRR8infuD8HZugtriorAyXKgTzzDmC8md00mlIsu3Nh+JC1D7meVI44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ByCrgYSvV5rK109QSaug+H1CHfQ/CtgE19e4KB7BV+c=; b=S8z8rbeHmz50+DTBIqwsoDTCVc
 j1+lqi96+9QgcGvUsJtRwBPKOVkoFjmWBVBOSBMzO0j/Z1lLr+YQbxMJkxIWWDVFiPETno7v2aWrI
 qUTCwaWFkAfWwMm09ITsiZ5kP/4yClmb8/nr3YdD06dXiWrdHcyNm4CTNz7aNI0FDW/U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVVsz-0003Rb-A1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 10:32:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E754B81630
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Sep 2022 10:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BA6BC433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Sep 2022 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662460365;
 bh=nQsmEabX17kN3iNETfIT90cAyKjiksPt5ykWelSElkI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l2lSNKKniIwjDmYFxei34ZLrCdA22udwhDInQVHnYqggwPixzqk10uXcSxpM3sCT7
 0X0kMCkS3fYRStU0zVVoNT16vJyp+XVlwcK8MRyTxWv/ESdgqbHP2paXqFO7206LfD
 TOWHv4wGFpKZAXwsxTBMM5B0CZ263AtScBhOMxOIuJp99bejbYJNII3IKTsQOiw1n/
 4Bj1c/t5FoDEpXayEPPPEEXvehBQWBL0v70//iKqIITdWpImK3I/4pmDBR0FLnyrm/
 wKFFPFsJsY92AzAtfQLAmTD/yc+WGLC8LRXO/EWvWPbjkpVDnooGXU5bbH7lr7++xj
 QTRzMFhLiAOiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B987BC433E4; Tue,  6 Sep 2022 10:32:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 06 Sep 2022 10:32:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@sgoth.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-rQZo4yH4N9@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 Sebastian
 Goth (linux@sgoth.de) changed: What |Removed |Added CC| |linux@sgoth.de 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVVsz-0003Rb-A1
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

Sebastian Goth (linux@sgoth.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux@sgoth.de

--- Comment #57 from Sebastian Goth (linux@sgoth.de) ---
I started to see this on 5.19.6-arch1-1 out of the blue. Noticed the first time
while processing pacman post-install hooks hanging, so actually working on the
FS.
Now the system was essentially idle when f2fs_gc grabbed a core again. 


INFO: task f2fs_ckpt-259:2:377 blocked for more than 122 seconds.
      Tainted: P           OE     5.19.6-arch1-1 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:f2fs_ckpt-259:2 state:D stack:    0 pid:  377 ppid:     2 flags:0x00004000
Call Trace:
 <TASK>
 __schedule+0x356/0x11a0
 ? preempt_schedule+0x43/0x60
 schedule+0x5e/0xd0
 rwsem_down_write_slowpath+0x335/0x720
 ? __schedule+0x35e/0x11a0
 ? __checkpoint_and_complete_reqs+0x1b0/0x1b0 [f2fs
9fac87d5629570e172d2b77a90a74b98e0678f12]
 __checkpoint_and_complete_reqs+0x7a/0x1b0 [f2fs
9fac87d5629570e172d2b77a90a74b98e0678f12]
 ? __checkpoint_and_complete_reqs+0x1b0/0x1b0 [f2fs
9fac87d5629570e172d2b77a90a74b98e0678f12]
 issue_checkpoint_thread+0x4c/0x110 [f2fs
9fac87d5629570e172d2b77a90a74b98e0678f12]
 ? cpuacct_percpu_seq_show+0x20/0x20
 kthread+0xdb/0x110
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x1f/0x30
 </TASK>
INFO: task kworker/u64:0:5076 blocked for more than 122 seconds.
      Tainted: P           OE     5.19.6-arch1-1 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u64:0   state:D stack:    0 pid: 5076 ppid:     2 flags:0x00004000
Workqueue: writeback wb_workfn (flush-259:0)
Call Trace:
 <TASK>
 __schedule+0x356/0x11a0
 ? ttwu_queue_wakelist+0xef/0x110
 schedule+0x5e/0xd0
 schedule_timeout+0x11c/0x150
 __wait_for_common+0x91/0x1d0
 ? usleep_range_state+0x90/0x90
 f2fs_issue_checkpoint+0x11f/0x200 [f2fs
9fac87d5629570e172d2b77a90a74b98e0678f12]
 f2fs_balance_fs_bg+0x119/0x370 [f2fs 9fac87d5629570e172d2b77a90a74b98e0678f12]
 f2fs_write_node_pages+0x78/0x240 [f2fs
9fac87d5629570e172d2b77a90a74b98e0678f12]
 do_writepages+0xc1/0x1d0
 ? __percpu_counter_sum+0x5b/0x70
 ? sched_clock_cpu+0xd/0xb0
 __writeback_single_inode+0x3d/0x360
 writeback_sb_inodes+0x1ed/0x4a0
 ? pollwake+0x78/0xa0
 __writeback_inodes_wb+0x4c/0xf0
 wb_writeback+0x204/0x2f0
 wb_workfn+0x36f/0x520
 process_one_work+0x1c4/0x380
 worker_thread+0x51/0x390
 ? rescuer_thread+0x3b0/0x3b0
 kthread+0xdb/0x110
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x1f/0x30
 </TASK>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
