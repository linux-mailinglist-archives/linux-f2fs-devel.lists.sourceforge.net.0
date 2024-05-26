Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84E8D2159
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2024 18:11:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sBzQU-0004AO-Nj;
	Tue, 28 May 2024 16:11:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1sBzQT-0004AH-LY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 May 2024 16:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwEktQyh7mTZfiaFiUI+9TMLPZ6b/LWQbp2DRpKP3Z4=; b=GJp9rgnyOYpLhXVra3eafEzSQF
 GWZpDigPCUrl4fTBA6POSC4PjXKTb9sWmCLNlfvLX9ldp6RmRD1MMR/6EBqCMerIzYc36sE0CNa+d
 QGHaNCpa4zy1SwNAeciY68Prw0P7nucLLL0PUgolYBzQRtA/gPuj6VzWzOtqF4mNxvUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwEktQyh7mTZfiaFiUI+9TMLPZ6b/LWQbp2DRpKP3Z4=; b=GzBBzfW2aiFqIemEBMsRqqzug1
 kFRJYobaXCGrVoSmixXFqPm+SHZ91QqAeZfCVi3mjFit3d3LBG/wf1nfkJ5jqqHtnwXH8+me0xBO+
 tb6AJkTNTihIQzwtwDc6aFyPaXGaGGMRaEuRajK3i1JjzAQC0j8W9cuEk+NJZb5c82uw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sBzQU-0004QG-8d for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 May 2024 16:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C301D601D9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 May 2024 08:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71470C2BD10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 May 2024 08:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716710617;
 bh=fwEktQyh7mTZfiaFiUI+9TMLPZ6b/LWQbp2DRpKP3Z4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TTWZ9Sttzc2UquZexCfmfxvO88S58t2DpBlWbjY3E+R1okyVEwERJuzIViPCSBb3m
 FAJ5oNQFzDfJgNdgIauVvGUEtxcMmaAh3DbkgysdrDS+2gKcC96YKzLRMubYzKO0NX
 H35TEwvb6p2BlNL2KthKF9Ix95PFAIuL3u84lmUeWZ6lUa0PqbdArqEOfbWtu7tbuW
 JgthB1wxMHsyXCNsTQLpkeJgloGKB+v2QdyyZam64yG1aC5pY6xPl/ExEWHaqXI34r
 z0+4GOI9XFUpGHC+6Cm5zIiZVD0IIpL7Q97tQPb18uRY85JBX6IPhd+lusbMgGWusI
 HnS4S2UBqRpXA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 66E36C53BA7; Sun, 26 May 2024 08:03:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 26 May 2024 08:03:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george@sofianos.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218870-202145-aal3x367bu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218870-202145@https.bugzilla.kernel.org/>
References: <bug-218870-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218870 ---
 Comment
 #6 from George Sofianos (george@sofianos.dev) --- I did try 6.9.2 (on Arch
 Linux) and still the same issue. Looking at the commits
 https://git.kernel.org/pub/scm/linux/kernel/git/stable/st [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sBzQU-0004QG-8d
Subject: [f2fs-dev] [Bug 218870] F2FS mount/unmount results in
 invalid_blkaddr
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

https://bugzilla.kernel.org/show_bug.cgi?id=218870

--- Comment #6 from George Sofianos (george@sofianos.dev) ---
I did try 6.9.2 (on Arch Linux) and still the same issue. Looking at the
commits
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/commit/?id=95d316e2c24a447e2b692c20f321ce7795527822
I think the patch didn't make it for 6.9.2 (unless I'm reading it wrong).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
