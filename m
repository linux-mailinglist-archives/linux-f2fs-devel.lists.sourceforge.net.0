Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29D59EF51
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 00:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQcZj-00052l-Jp;
	Tue, 23 Aug 2022 22:40:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oQcZh-0004zX-OP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Aug 2022 22:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H4QRlvDuDvHoJ6YS45/zP3pPcH6jP+DCeCBiHfVs27U=; b=MvJ6YFP7aIK7RpmpR7gYpyuxEj
 Fk6NzpRQIVV1M+iEHxTC6+OdqPmIEwMMONs9Sk9U3Ns9Aqv8Y4T0CUyoDcLa08UfVAdevWU5bvFCm
 Jr/ouZWpPBwTr769bW4WUm4kzbxhN4Mxin0/Z0c5W/5ApvTCv7lsQQxMkLPrqtqjBp3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H4QRlvDuDvHoJ6YS45/zP3pPcH6jP+DCeCBiHfVs27U=; b=IAZhU5WNrUW5DuzbfhlzhIA1i5
 iBSCBXZE4wwUJ6+4pTcnBM76vcE2Tj/xui7q5mxld0lq1Jf0NN5u0HvcyJKVWXoJb4FgIo1NQQW5n
 4VvVq9RnLssYBOm758ztMYQDQGB/DTNyKoGl/NZIyYr8jyaL4MDaBj8O+GRAlRKBhQ04=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQcZe-00EvTp-Hb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Aug 2022 22:40:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 438D9B821B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Aug 2022 22:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5F76C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Aug 2022 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661294434;
 bh=O0gXmakAzDB4uvgrQcKz85o1G7AN9Hi7pjkFmMOicPM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OuDQibZkz8SzCzW6xo8FRd6Y7wwQBIzjxGJhMU21mAbK1akYDAxd/t77dRf+9s3Lv
 vexBYHf99HzpqSpslv0gd9oJNb/6HIIV0w4ptAWX1p3cWiw6WvG7FhKaJeyiKzb25w
 ToPq3iAYaY6q+1cFh+PPLKLWL8ZgDdN7laDcidZmKYvLXU/NaDNxbX8BTylyaWOUWI
 oksmlaa3qTqOznh/hEACCVavMpREphHg2cF+sgxSWepjoiRU3zd0AJtAimT42Pj9z0
 HuXITzBWBtxzbQaDRQcExDqab5+u5rOPBtcgNkBD7ZboH9ztRwmfW+S9c6J4oReokH
 0gh27tOlZy3FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BB9DEC433E4; Tue, 23 Aug 2022 22:40:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 23 Aug 2022 22:40:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.nicolae@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-cmm0Oimkq7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #56 from bogdan.nicolae@gmail.com --- Also, there is a another task hanging
 up with a call trace: kernel: INFO: task mandb:13173 blocked for more than
 122 seconds. kernel: Not tainted 5.19.3-arch1-1 #1 kernel: "echo 0 >
 /proc/sys/kernel/hung_task_timeout_secs"
 disables this message. kernel: task:m [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQcZe-00EvTp-Hb
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

--- Comment #56 from bogdan.nicolae@gmail.com ---
Also, there is a another task hanging up with a call trace:

kernel: INFO: task mandb:13173 blocked for more than 122 seconds.
kernel:       Not tainted 5.19.3-arch1-1 #1
kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
kernel: task:mandb           state:D stack:    0 pid:13173 ppid:     1
flags:0x00000002
kernel: Call Trace:
kernel:  <TASK>
kernel:  __schedule+0x356/0x11a0
kernel:  ? ttwu_queue_wakelist+0xef/0x110
kernel:  ? try_to_wake_up+0x23e/0x550
kernel:  schedule+0x5e/0xd0
kernel:  schedule_timeout+0x11c/0x150
kernel:  __wait_for_common+0x94/0x1d0
kernel:  ? usleep_range_state+0x90/0x90
kernel:  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
d8aa87b5c63297ab56225cbf829d392db2a7d54b]
kernel:  ? f2fs_update_inode_page+0x3d/0x80 [f2fs
d8aa87b5c63297ab56225cbf829d392db2a7d54b]
kernel:  f2fs_do_sync_file+0x18b/0x960 [f2fs
d8aa87b5c63297ab56225cbf829d392db2a7d54b]
kernel:  __do_sys_msync+0x1d3/0x2c0
kernel:  do_syscall_64+0x5f/0x90
kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
kernel:  ? do_syscall_64+0x6b/0x90
kernel:  ? exc_page_fault+0x74/0x170
kernel:  entry_SYSCALL_64_after_hwframe+0x63/0xcd
kernel: RIP: 0033:0x7f48b6d377c4
kernel: RSP: 002b:00007ffeddb19528 EFLAGS: 00000202 ORIG_RAX: 000000000000001a
kernel: RAX: ffffffffffffffda RBX: 0000000000000f78 RCX: 00007f48b6d377c4
kernel: RDX: 0000000000000006 RSI: 0000000000004000 RDI: 00007f48b6e6a000
kernel: RBP: 000056363710af00 R08: 0000563636f48fc0 R09: 00000000035573fd
kernel: R10: 0000000000001000 R11: 0000000000000202 R12: 00000000000000a6
kernel: R13: 0000000000000000 R14: 0000563636f48fc0 R15: 000056363710af00
kernel:  </TASK>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
