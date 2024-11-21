Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB75F9D4A38
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 10:50:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE3pd-0005Z1-CY;
	Thu, 21 Nov 2024 09:50:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tE3pc-0005Yt-EJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 09:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p2Z5dfmPmZvFmCe6LBRZGUwPN54Rercxp2c7mQZ6y6U=; b=PDTAinQHX6lLVfVV8is+cYkBAJ
 5fLI5PSWxpoMcxDrV0ivXj/lQOfII84jJM/KmFwrrf7EGA8fSSct42/CxIzY+GM5F1i/TwCzgrh35
 JXE/dOiC0WPcFPw7jcmJAeWpcz2ov3tNxPtKtHo2oRSTmsh5nfXNBJg3qCp9SbxiSEus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p2Z5dfmPmZvFmCe6LBRZGUwPN54Rercxp2c7mQZ6y6U=; b=dqAkmRmhfSWE8jkQt5scuB4NnQ
 AcGokuFshwATabfeFVwXAyowROUKW2ygKmAb3yXdNJ3AKZdS8irFcRETaWabvGk2QnV9DoTNAlzvi
 wUVFrGg3PTD1WMkgPqKcocTalVfk/ixVJjZfsVXfJ3sbkb9QoX9UykHyu4z6aTiNrpYI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE3pb-0000wu-Oc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 09:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B5172A40117
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 09:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEA8DC4CECE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732182624;
 bh=p2Z5dfmPmZvFmCe6LBRZGUwPN54Rercxp2c7mQZ6y6U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iTNwlrqp+lV8w78PftqDPyQKPb16FBMZ0VC/BrpddOAL3Ag+TErjeZxlEzlEYheGg
 PYrjFHgmKyvD7mvq6DZDmIdTmsBjx4GidbLLxLuqQhAMWBfRWzXHz+229fNjy7ZD+L
 GfgL3E/iD1VTIi4p82qBMJH6+6hBv/RFK1/DG7UL6HMIni/RXuozmBhcwMZne1k3ws
 j5IVDirjoTqPtca89ny5uppLDrlW7xCkCNOYN83B43lfbHab4AbG25nvVXk0DCJKkb
 Zq67EcuTVmWPj1y9ZW1TaqhnyxPokegS4wuItJ+ONWEHFBc6OVsUNMF7hTTAHddgbp
 3uYdbUCn0HRig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B9AA3C53BC5; Thu, 21 Nov 2024 09:50:24 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 21 Nov 2024 09:50:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-PZKaMPaXrD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #6 from Chao Yu (chao@kernel.org) --- Sorry for long delay due to I'm out
 of office. Now, I can reproduce this bug w/ below testcase: - pvcreate /dev/vdb
 - vgcreate myvg1 /dev/vdb - lvcreate -L 1024m -n mylv1 myvg1 - mount
 /dev/myvg1/mylv1
 /mnt/f2fs - dd if=/dev/zero of=/mnt/f2fs/file [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE3pb-0000wu-Oc
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=219484

--- Comment #6 from Chao Yu (chao@kernel.org) ---
Sorry for long delay due to I'm out of office.

Now, I can reproduce this bug w/ below testcase:
- pvcreate /dev/vdb
- vgcreate myvg1 /dev/vdb
- lvcreate -L 1024m -n mylv1 myvg1
- mount /dev/myvg1/mylv1 /mnt/f2fs
- dd if=/dev/zero of=/mnt/f2fs/file bs=1M count=20
- sync
- rm /mnt/f2fs/file
- sync
- lvcreate -L 1024m -s -n mylv1-snapshot /dev/myvg1/mylv1
- umount /mnt/f2fs

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:1363!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 4 UID: 0 PID: 730 Comm: umount Not tainted 6.12.0-rc3+ #1107
RIP: 0010:__submit_discard_cmd+0xa53/0x1410
<TASK>
__issue_discard_cmd+0x3e5/0x1190
f2fs_issue_discard_timeout+0x244/0x360
f2fs_put_super+0x1fc/0xed0
generic_shutdown_super+0x14c/0x4a0
kill_block_super+0x40/0x90
kill_f2fs_super+0x264/0x430

Let me figure out a patch for that soon.:)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
