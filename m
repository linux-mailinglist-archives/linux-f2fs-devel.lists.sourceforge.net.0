Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27954A36DCF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Feb 2025 12:43:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tjGZl-0000e9-G1;
	Sat, 15 Feb 2025 11:43:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tjGZk-0000e2-Bv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Feb 2025 11:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x+dPhvZdGbwywhtsn23jVlv6SIUfWeZ3BwJdOoTgkyM=; b=LS1y/y+7hgQtI1dPNIVtVVh9CO
 2iJ0TR+ep99MLK8WHbpN8kmuGFWlfqyytWZhg9rGnppbxwXfaDwjydfHXcatVzSzf85rcZySbhC/N
 PVkGg8QBZZhmNFvhoFv7SFHOZh+c/u5UHWSFtOLZ2Xz1aUdEJd6aJI6g5jKAhwdnieHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x+dPhvZdGbwywhtsn23jVlv6SIUfWeZ3BwJdOoTgkyM=; b=nJZJA/A7gzMsiGMTKRnwCAQhnR
 e1PB5u+l4Udk9ZeXW9n7r15T5RAGAzyid7LieC2KF78sk+7dIBFNgtZLKJZuHWoQDKFJn5NuxJS/s
 DRRR4y4w06vDo9G/VhpG56O+aQXjMvrVrRrmM/8+jJCE0+39r4WhYluLOQry8+zLO7dE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tjGZj-0002uM-5Z for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Feb 2025 11:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5ABD45C3EF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 15 Feb 2025 11:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E4A1C4CEDF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 15 Feb 2025 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739619780;
 bh=KArerF1hgBARSMAiNYM1GRC2swyR3mWbYIXu3IRQVBA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XfNM/036k/t7mqwe6tBBgaaLiwMFZw9DZ78g5+E+829J7J5ykQPDY7PXRZiQkb8Te
 gFDNuYj3fG5YYC7Zafmoir4hkywYAnenCp2g6XTYoZEXrqJyoXROTmk61Ju2b1bF/j
 lJuccxjfyb62ufoQuDaowwtOcmgTrtWpBv8bnqJlkeMp7qBA2wRakB/ZGSpquXXlLS
 MsYI3UHT5YLPAZnOH9IkmLGy2fi8NQsrDgzJAoVUDGKqmWcZq74iPzuXiGleFAezcD
 XSkZ2kcHRgYxsjo9sLZmsVUqjriVEBwVZijRX86P5GsLywKxgeTSj2yM8Kwvv0m6BQ
 ftYMWkaCG7EYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 765D3C3279E; Sat, 15 Feb 2025 11:43:00 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 15 Feb 2025 11:43:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219784-202145-VkqnpUa478@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219784-202145@https.bugzilla.kernel.org/>
References: <bug-219784-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219784 ---
 Comment
 #1 from sander44 (ionut_n2001@yahoo.com) --- Created attachment 307661 -->
 https://bugzilla.kernel.org/attachment.cgi?id=307661&action=edit dmesg 6.13.2
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tjGZj-0002uM-5Z
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

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
Created attachment 307661
  --> https://bugzilla.kernel.org/attachment.cgi?id=307661&action=edit
dmesg 6.13.2

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
