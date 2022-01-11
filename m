Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF9E48A690
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jan 2022 04:42:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n782t-000232-3J; Tue, 11 Jan 2022 03:42:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1n782r-00022n-22
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 03:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qf33rbt3HTHYnLaKdklj7qf/SBkK6X/CaIZP7UQNHYY=; b=bMUV/fkXVeFWV2ugHc8SuZQNun
 RHpeamPm7zAAPTcPJugnCJL56PyDgFJxOh4TgWElWrSD2Q/mMlhJc9uX+wrmgPG3mjG0te++QGBzN
 XeCVsrEE6xsIR0Yy77fLXoq+PPTI2mEpdOuRTPianakLj/Tb65Y2paa04NbqwmRQcIWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qf33rbt3HTHYnLaKdklj7qf/SBkK6X/CaIZP7UQNHYY=; b=C/mCb+t/3EfRWo5XDsnMD+3kr3
 STb3T5ecaku8d5k+PMbj1z0To6sCe5LEYeDhOGNKkRn0T3lE8al42eQ+maFq6d96NmK5/ib2qTEuo
 t2UQEGKtri8LUGxAAcDvy0ngVKYkY8WjScBrBU4SodEJmd30mbj0PO9Aw9jK4vHJw2wU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n782n-00BFmo-LY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jan 2022 03:41:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 982D9B818AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Jan 2022 03:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4423CC36AED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Jan 2022 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641872509;
 bh=qf33rbt3HTHYnLaKdklj7qf/SBkK6X/CaIZP7UQNHYY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HVX8NNBy+psl7tfyqjVdWuBrWsnJnvjXqDPyZlSdCpjJUMv1PagLw1X3C8SXCk3FM
 sJ+xNbM04ZrJm11n8WcRoThk/9AQ7sYmxUBstOyHkaN31XS6ElcNG0wNCQkgP3Hne8
 cIA98G2+YWj0QLljqPKWa0cWnR2BWyrfBPyMEGEsZJZxjXkv8Yms6z4hfYTxiVaarK
 DkAW/TtlT1wDP4QX8RiF57HEU4afK8XGcvclWucsP1JYilT133TG/xlnRRt4TH+QxE
 Jc4050XIZtl4HdCWgzOGYVhnFI+S4WAKupPVSmzxDJOlVwN7k7wutmu+tUVL0X2/Vw
 c0OfFWeIsJAmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1E81CC05FF5; Tue, 11 Jan 2022 03:41:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 11 Jan 2022 03:41:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215235-202145-kttXypcShe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215235-202145@https.bugzilla.kernel.org/>
References: <bug-215235-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215235 ---
 Comment
 #5 from Chao Yu (chao@kernel.org) --- This patch was merged in dev branch,
 and will be pushed to mainline in 5.17-rc1.
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=645a3c40ca3d40cc32b4b5972bf2620f2eb5dba6
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n782n-00BFmo-LY
Subject: [f2fs-dev] [Bug 215235] page fault in f2fs_setxattr() when mount
 and operate on corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215235

--- Comment #5 from Chao Yu (chao@kernel.org) ---
This patch was merged in dev branch, and will be pushed to mainline in
5.17-rc1.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=645a3c40ca3d40cc32b4b5972bf2620f2eb5dba6

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
