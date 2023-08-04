Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78E76F86F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 05:43:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRliG-0004Df-Nz;
	Fri, 04 Aug 2023 03:42:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1qRliE-0004DZ-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 03:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0hcJ6hAZFx5vSQqyeZUL2YwqZS+fwhJW6d0syw1hpqQ=; b=NjVY+0SAEoXEwxPLcFvz8Zqlns
 GfE9ve/symWgAhr2sBetg8xa72t0T4AjyUQWpvGDSC04KVDlBpwYXQ4pyy71EnO2x1o7w/wZ1g9KB
 +q34vbRypvprlt3eHb64ZtW3XVqyYBrxGMcWK4lFw0jOKYHNbUSVTg9mrKd6NKcZZoLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0hcJ6hAZFx5vSQqyeZUL2YwqZS+fwhJW6d0syw1hpqQ=; b=G37ieHJ8mFPu8lzEgrsCcwuh/r
 w3y7mmmio4n19zYdUJ+cE6EBz0KPuHjgJGmmHu4UTq2Ftp1s6anmV6VlYfP/pTsQJzYrsCswbzseo
 8vPWPI5Yzcqs7SPdVeIB8XpLL2qDsQ6Wq4IMI1tNx9rHuWGYy+xk5J7/8N5Ur43wYciA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRliA-0006Qe-JF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 03:42:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1884C61C0D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Aug 2023 03:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24968C43395
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Aug 2023 03:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691120555;
 bh=0hcJ6hAZFx5vSQqyeZUL2YwqZS+fwhJW6d0syw1hpqQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hsBhXdKZhSFfmm6on0j7ubWLHtBx8fmabDut2RNbRJwVU/J9ilEZ6qJ8urUYLvAqU
 dH0zOIQqPe2R1JS8uh231J3aq76MbliNKJJ3sh5P0bcfR9SU7bNZHhPZlMgN4RIJ5e
 zNVQi7fAuYocUsOY5W5e+GQX+mtcPTRJssns335N20IWDRXLWnPMiqFD+D9+RGfmLK
 gq/xKRtxTXIrMM5iKD6uG8wQiTsQp7jzE0ulb40bBaRt478vIOqTCdcNbVT4jUDalz
 giYOLXULQRL30BN/A1Lym8If2xnyZFcPoA1nZ9rhrVf+MmwugiUCigW0NPtW7zTeqY
 uHWscC0+/JZxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0F84FC53BC6; Fri,  4 Aug 2023 03:42:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 04 Aug 2023 03:42:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-9tU26oRzJr@https.bugzilla.kernel.org/>
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
 #177 from Chao Yu (chao@kernel.org) --- (In reply to kelak from comment #175)
 > Still happens on my system with 6.4.x kernels after about 4 days (today
 the > second time in the last two we [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRliA-0006Qe-JF
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

--- Comment #177 from Chao Yu (chao@kernel.org) ---
(In reply to kelak from comment #175)
> Still happens on my system with 6.4.x kernels after about 4 days (today the
> second time in the last two weeks):

Jaegeuk has proposed a workaround solution as below, it aims to enable from
6.6-rc1, could you please have a try with it?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=5a47ad28e6061c8fddf5c82d49fdc3280a80b2c4

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
