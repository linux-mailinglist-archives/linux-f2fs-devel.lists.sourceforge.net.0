Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A96EA48F06
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 04:15:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnqqV-0003l0-Id;
	Fri, 28 Feb 2025 03:15:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tnqqT-0003kt-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 03:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zciXl3N7U4BmmEAaCh88wg4PFV75Lt/IaK0iqEVzmdA=; b=QqyaH9tR5CTwF13LYyQpdbo46x
 okOupAmcDJhieGTfNSOcTmDd+JCy1EKBOh+fAW0AiZtYnFIUBX1jQ+yB6aRFFHVba5kN0Wb75+MJW
 JT0Al/itwzF2gxYAKwZ6KVIoSebt/jP/n3nH5xsZl3VxI0mCDpdkEYQbM4dcz1DbMigQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zciXl3N7U4BmmEAaCh88wg4PFV75Lt/IaK0iqEVzmdA=; b=cGgGgkwcadHETC1WeXYTRlRdrw
 FUOGWty7uGSwKErB6LPPpdFOvEwwnqWQ6oBH+7oIFKELGdPzv8NQRAM+eEi52uCOQfaCemOF3KT1q
 Yor2Lm0SmZs+rpkgZWbm4oO0WREzy8Vr2rC8KvBqBhLa2uuybTXJE52xZ1XYo0L2vHo8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnqqS-0005Vv-SH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 03:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 80BF161F32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Feb 2025 03:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B71E1C4CEE6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Feb 2025 03:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740712513;
 bh=O4BdHteugGRIixPSy4JF5KBsYBvbR5bJ8oHXYp86EHE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=twnYQbV1UQTZOQGRLciCP+beIj1UnMwHoswgEmZyroHzHOK77SZzNNx5TnO828Gss
 Nt/nUOGdEtvf9XobXCgXb7BPPw/Puzejd+n0kFqosABmWiiUR8F8M4OtTYH6XYou3/
 /usgUMdaF/ItdDhGQEdDkMYUgezZMoA9j+5wCmcCrrH6IsTrY7aiiAi4IplICGKRSQ
 7/wHq1OuHKOgG44PROWyfxvdRWK/GFAIY4vkYwC6ID95nIycuAUAFfA2z08sgwJHc0
 y+Dra3t5Dk88OdLd84Tnwm+OOPfUz8424tlT8AIdUG1PQrjN7xGtI33G5HDLtX5RDW
 zhHOdgTwF2AiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AAD08C41613; Fri, 28 Feb 2025 03:15:13 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 28 Feb 2025 03:15:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219784-202145-oLUHTh3Kkw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219784-202145@https.bugzilla.kernel.org/>
References: <bug-219784-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219784 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added CC| |chao@kernel.org 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnqqS-0005Vv-SH
Subject: [f2fs-dev] [Bug 219784] RIP:
 0010:__list_add_valid_or_report.cold+0x4f/0x60
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

https://bugzilla.kernel.org/show_bug.cgi?id=219784

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chao@kernel.org

--- Comment #4 from Chao Yu (chao@kernel.org) ---
Hi, it looks kernel crashes because page's link list is corrupted, and I didn't
see any suspected problem in f2fs, so I guess you should report this bug to
Product: memory management / Component: page alloctor.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
