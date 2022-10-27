Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FB61065E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 01:26:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooCGz-00018M-S4;
	Thu, 27 Oct 2022 23:26:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1ooCGg-000186-Eg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 23:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVAjdJeW0zqFTl6P5ukSsnyhu6vuBypX1XW12aYu6xE=; b=CIJLozoWdvdMbdfyxb13vLfSPN
 AzSqUN+Oe5E++CeNcoNQVdRdbf7qQxMgj97cJmkkycqvffCNaFeJkeqgpB4hIWDBiiP+6lYKBcdyO
 WJs5XfCt9iDV6kaN6uxWJk5kXomicFQUDbiQQFSZpA69BhKH9S9RGGBhKWqBnDv6lRhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pVAjdJeW0zqFTl6P5ukSsnyhu6vuBypX1XW12aYu6xE=; b=ASDbDuOMuNRZRQmy4ST/HkSNUV
 NEsQjdq/3ZRsISQaU80P7inoIk+SiAVlZWagrGhxKNAng5AjmjNBFTpfZruI6+T3Yfhuk6lpvrzmm
 nP8EeWAGymOJ6kpmjHMkSQuBg856GNXB0QnP04MpBDQTQyTXy33cNhhQw2VAnW5i0f1Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooCGd-002nXI-5r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 23:26:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C59CD6257A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 23:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3365AC433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666913185;
 bh=pVAjdJeW0zqFTl6P5ukSsnyhu6vuBypX1XW12aYu6xE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NcExQb+vT2fdJckYC7GAs1GBW/rfEzyGfJnUNRlvI6kdbuhQTPBHlEtuyFaHJ0CvV
 XtvOsGxbfiTak4BndRb2Ux2FbL/soywBjYctl//Rj2MKafDDdvQ4nZT3ISfFWwaQ45
 Ty+4U03B5krqnxu5IjjDIvEQV+wZw/sR9KJ8YulYGK1ejPXAOVNR6P2J2DiT7ek5ro
 OqLSBzvLFAHil3o81zcOs1YuLkJ3cuOfr3qSy5dJG31Yr1uTmw//ctiP8inQuyiD2W
 WQr4WCeFPFpPQ1T5YzA711ZmGM5Q1OrZkXbuWngGfqdXr+BVWNS/WdZJjo1paEwW2T
 r5XFWGEVKq8Mg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1C221C433E6; Thu, 27 Oct 2022 23:26:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 27 Oct 2022 23:26:24 +0000
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
Message-ID: <bug-216050-202145-GAij2WQvXA@https.bugzilla.kernel.org/>
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
 #70 from bogdan.nicolae@gmail.com --- Well, if understand correctly, TRIM
 will still be issued on-demand when segments are cleared. There's also an
 option background_gc=sync, which I assum [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooCGd-002nXI-5r
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

--- Comment #70 from bogdan.nicolae@gmail.com ---
Well, if understand correctly, TRIM will still be issued on-demand when
segments are cleared. There's also an option background_gc=sync, which I assume
will block other I/O operations. Unfortunately, the documentation is vague
about both aspects.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
