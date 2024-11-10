Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F549C32D6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Nov 2024 15:45:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tA9Bb-0007J4-Em;
	Sun, 10 Nov 2024 14:45:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tA9Ba-0007Iw-IP
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Nov 2024 14:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QPPCunxI++LpEHPhxznX6kIvtHfUnXVuPvWhAR85lHY=; b=fo7oje8Erts6l4M7NpyXrFicCD
 /htN6GEl6lLl3bDjMBCOCoa3Ad0bVA4eL0HuNTu5dsEDGJ4ceQlQuVgI+XwgIAMEb39tg8UEATUHz
 DBWy3QeJBV/Uv9l+DRDs59zu8xCZaA6mJz0VGGDMkbrm0EtexrYyKjp64BMPew5q2p4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QPPCunxI++LpEHPhxznX6kIvtHfUnXVuPvWhAR85lHY=; b=PsyvWS73Uzy3cvmEacVbpxRBjD
 ymU1s48KFq/YmQkWRljoMLDeV0G71/sOjrXTZMOSXN87A63nqPsVVPBMCPbIW5KHnKmDEcWwcBa+Z
 +P+ogYhBVbXq0fEWU7SWRopZ+4yn2FpENOza0lptS3t58uP+k7NGtJvMPFMcxzBc8/VM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tA9BZ-0007l5-9h for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Nov 2024 14:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 25652A40D7A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Nov 2024 14:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46948C4CED6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Nov 2024 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731249899;
 bh=vKmaHnsYbhuur++blgBdWLw3+zg2BWAVfzOtqzjP5sU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MdjI+LE1E0iqLC0Od+yt4jxYPLO6qCts7bKm5WQkpai6mTn/LRCQhYllOxnTxa6BX
 YAdJNmqug15esL5OzpU/zZk8K3RDessiM5iUFOt2Nr+D+ucPbIqhu0qIGsww79Y/0t
 XRPQBwihX9iMTp1y39N0Jrpl59RODtpyvxb5jEI3aQIanItcPRrZWBnagsvhu6NzZv
 dopysiezph6S7VQBdA6v0UNx8/8G6gUJlJKVU9EUiuoh7XrHn1ltyks/5mcDp8PVfm
 i+30GH1S2QlJV4t4k0fXWOcmmKFD2yoXg38YNSdP6sFBEadGbkPLQXYkDSjArcxWBi
 mC6e0FbahHrQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2A1EBC53BBF; Sun, 10 Nov 2024 14:44:59 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 10 Nov 2024 14:44:59 +0000
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
Message-ID: <bug-219484-202145-1fNzh2K4gg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #4 from Chao Yu (chao@kernel.org) --- Do we have any chance to apply this
 and try to check whether it can fix this bug? From: Chao Yu <chao@kernel.org>
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tA9BZ-0007l5-9h
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

--- Comment #4 from Chao Yu (chao@kernel.org) ---
Do we have any chance to apply this and try to check whether it can fix this
bug?

From: Chao Yu <chao@kernel.org>

---
 fs/f2fs/segment.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 10ec69cbae68..86a22447b89b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1314,11 +1314,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info
*sbi,
                unsigned long flags;
                bool last = true;

-               if (len > max_discard_blocks) {
-                       len = max_discard_blocks;
-                       last = false;
-               }
-
                (*issued)++;
                if (*issued == dpolicy->max_requests)
                        last = true;
-- 
2.40.1

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
