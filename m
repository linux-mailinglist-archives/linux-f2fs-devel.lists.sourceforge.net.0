Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16B6F87DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 19:45:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puzUN-0003Rf-IG;
	Fri, 05 May 2023 17:45:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1puzUM-0003RZ-Qv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 17:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oEhR2LFbS4a/kg9KB292mrDkrmhVKy01rr9zggzTUug=; b=k8wiKx92WqRvzjjew61GnQkGqU
 ORMarR/MoEQ2k4WWWpTAcF9MPdoXv95PmlTZjIwUABTje7+sXv4l5S7XsMG5mg4yGKCPLOhQq65ik
 YLnXRnco1O9bNXQOxTV6VpZ+1RvCYsokHt76hgy8jZfqCoD8PHrHvFDLlHj/uhxrFIrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oEhR2LFbS4a/kg9KB292mrDkrmhVKy01rr9zggzTUug=; b=kJddJ4ux6UpT0RpKfWIAftgpdq
 Piv/oM2p5GcqTdWhTvPkauEqD+8X04Uvz/OsXSrwUHojZY4ZKxAcZ0yo/e/q2IY1lBrebRSOXE+Iy
 4J323o7qo4pS6jO9weLxFoTgCsfsqPgFaKRN/TatpTQK+ICzppSg5qyqoZ0esI/jHsjw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puzUM-00010w-9f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 17:45:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3F41612A8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 17:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 552ABC4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683308696;
 bh=oEhR2LFbS4a/kg9KB292mrDkrmhVKy01rr9zggzTUug=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bz60kzYL5Nq0cH5kaB9Wq6f5/fC9NfhKLrAEJ+y+6Hm1oC7/I08Nd22gcmv1FloAg
 nbBpOysTdVx/+m0OIVAbgWVSUriSZElf19O73QFtFNxnMqj+MOs1IhpKvD51FqZJka
 7s7zKorpooBoPF4Z9bJBAplg97SF3K0p5tZ9zirajF1wkMjRYinoA3gdTcDsy6AsIt
 yDoNUDy4s0d1jG3DQmEuoBgWnwhdIgk3JcdjeOYlCYe7LAmym8H5GqDfM8BzwcL/r+
 qLtN9aN14W4zS6WHAB5ZitFKXhEAGds1P1cg2YQvWUVa0cuhpZAXBuaa2wDmDMAwpE
 EK0yiUAZb187w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 283B5C43141; Fri,  5 May 2023 17:44:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 05 May 2023 17:44:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-yD8kKT5nHy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #161 from Jaegeuk Kim (jaegeuk@kernel.org) --- From Linus tree, could you
 please try this patch which was merged in 6.4-rc1? 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puzUM-00010w-9f
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

--- Comment #161 from Jaegeuk Kim (jaegeuk@kernel.org) ---

From Linus tree, could you please try this patch which was merged in 6.4-rc1?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=635a52da8605e5d300ec8c18fdba8d6f8491755d

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
