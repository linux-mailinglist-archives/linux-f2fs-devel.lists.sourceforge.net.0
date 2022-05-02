Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A48516F26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 May 2022 13:56:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlUfd-0005Ww-QA; Mon, 02 May 2022 11:56:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nlUfc-0005Wp-M4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 May 2022 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AfGFa7iHPm3R1vBoKwZW6FNk0VZfWblye56RL6rDg5o=; b=lPo64FwstRzL7dSp0N1U1ZjiIO
 UlFCAK3/blkMtj2ZHt9tuJY6Rv8tedeyEsJazdMOa9wqt7hG+ACmkdV8JF8au8crGcIv6HW54NOYw
 SXT9PalcFFOdIEFfgJ0PKJtlxGb5USGCB4QCX+BlNCt0goGye+BLJXjAjQ1oKmrUa0u0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AfGFa7iHPm3R1vBoKwZW6FNk0VZfWblye56RL6rDg5o=; b=BaGTMwWMbkGkq0qhoMhKSKKSAV
 Ya2D620q7uDE9YkLB6cvlSGb+twdqu7f6Wl5P6JoWQ233n58xNtLJDZlDgVVIMNM6JuGuECvt9c2A
 wqTFX9ZvoPp5SbN9RoIzDydq7nZQsuk0SrNiYxCTgu3U1wJNaQ0fn5169KUbsrRNSzQU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlUfX-00GUrL-Cf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 May 2022 11:56:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3796F612A3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 May 2022 11:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D5FCC385A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 May 2022 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651492596;
 bh=AfGFa7iHPm3R1vBoKwZW6FNk0VZfWblye56RL6rDg5o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G/qnpMh9SE1ZA1NBtcfqsBau/Ko6mHdA7Uq1Ulwd2VMg9miM+XiIODHz86sfzMbIw
 2XMLG8Cg253oM0qZCQ3W7SMEu/BPmSo7Ju1PEU5Lu0pofzCx4jUQ3fpFpiFQRB/DfO
 HnJnXKvbHoGkCfFQzMRXH7u1ExdPJzqHIgCe3rTDXcPIvStlzJQ/RpOvkpb2kxJhfM
 +ghoCD6y60FIdhOHrq7TP24SjnzTbita3CEXLr9OrjoQHJVCNQg6SgIgCya0BPO5xf
 GVrXxGhZ2wYW6N6KyEbgDw+4wMJcLZo6ukcKUy/rSRyysdgsCFCB7A9wbGqX+hq7X1
 OOpbgK3n7Gb6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 84130C05F98; Mon,  2 May 2022 11:56:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 02 May 2022 11:56:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215929-202145-K1016yWQye@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215929-202145@https.bugzilla.kernel.org/>
References: <bug-215929-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215929 ---
 Comment
 #2 from bughunter (yanming@tju.edu.cn) --- (In reply to Chao Yu from comment
 #1) > I can't reproduce this bug... Could you please test based on below
 bugzilla > branch? I've applied all re [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlUfX-00GUrL-Cf
Subject: [f2fs-dev] [Bug 215929] kernel deadlocks while performing file
 operations
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

https://bugzilla.kernel.org/show_bug.cgi?id=215929

--- Comment #2 from bughunter (yanming@tju.edu.cn) ---
(In reply to Chao Yu from comment #1)
> I can't reproduce this bug... Could you please test based on below bugzilla
> branch? I've applied all recent fixing patches in that branch.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/
> ?h=bugzilla

I've just tried the kernel in this branch, and this bug disappears. It may have
been fixed in a recent commit.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
