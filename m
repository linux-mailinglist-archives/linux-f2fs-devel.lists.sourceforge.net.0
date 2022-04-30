Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC6515D7C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 15:25:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkn5p-0008Gn-D1; Sat, 30 Apr 2022 13:25:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkn5o-0008GG-0Y
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 13:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UkDDJhn8234EL/AZiyxMl3hYTDNx9eH3V/YBniwaFWA=; b=YyBXdEmPuy9MmYY8NwBqoOp79b
 JASLZcjKqdJOZCK4I8xsbToX2c4dIQy2pe/759DCyug1rGtdxCyGfH0s9Cs7Wt4rjnuSVfZM5uMu7
 u79OwfWauaGt7v7dnXGZi+TVfgaWOya6HekFiqyf+JuY0EBQn14vl3WDfEqXV01sREUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UkDDJhn8234EL/AZiyxMl3hYTDNx9eH3V/YBniwaFWA=; b=XVWZPJNoHbqR/QhiCemIHbKtrC
 2saiGFKwe5mnXSxfszXLRCxVsNsnXVmDaqep8kPeFLNoxEOkGY6NdH5S6cnFMVqzeBI4umbDSwEhs
 vCKuj13gt3kdXCc2JEAw4h7JhJHMLnuL/ZRw6oGB1j5WPM5BwvxQIK5eFozjKhkBMnxs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkn5n-00EsK4-OM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 13:25:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9199460C52
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 13:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06C33C385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651325089;
 bh=UkDDJhn8234EL/AZiyxMl3hYTDNx9eH3V/YBniwaFWA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S8CeWxZYiBVwSKXXG/5qp9c/j/YQkusx7iChPKzwARRa7JR+nvv0NJElDkEdnx+Td
 h01iIj0L50EyJvnnIz/Q5CtHt6FR50RK2kNY1ToLcS5WzFk5GIglhPCixyLwWaD6KC
 APgyIBl4cFRZ9khomrq2s9gYyWYFk85UdmMcXUjIBjpyj3Gi7nsv4l2sYOKhIAaPvn
 4LhIjr5PkCiptPUNjQGomdQmNYVlI1dFzIt+2v0Df0xlprLXZIXlWO1tXr3FWlQWFC
 3ZIrIbhTxh/U+tCCqLhx1Sds0M0Rej3cRbfv4z56MAqQB0iy0qaq72Eu0RngZe/ZCb
 hXx+ofhY6P3GQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DE863C05F98; Sat, 30 Apr 2022 13:24:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 13:24:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215904-202145-dhzFHOlEHM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215904-202145@https.bugzilla.kernel.org/>
References: <bug-215904-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215904 ---
 Comment
 #3 from Chao Yu (chao@kernel.org) --- (In reply to bughunter from comment
 #2) > Yes, you're right! This bug is caused by the same reason as the previous
 one. Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkn5n-00EsK4-OM
Subject: [f2fs-dev] [Bug 215904] kernel BUG at fs/f2fs/inode.c:825!
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

--- Comment #3 from Chao Yu (chao@kernel.org) ---
(In reply to bughunter from comment #2)
> Yes, you're right! This bug is caused by the same reason as the previous one.

Sorry, after adding umount command in your testcase, I can reproduce this
issue, and I figure out below patch...

https://lore.kernel.org/linux-f2fs-devel/20220430131924.10218-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
