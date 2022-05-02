Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D236651691F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 May 2022 03:17:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlKgQ-0006Bz-Av; Mon, 02 May 2022 01:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nlKgP-0006Bs-DP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 May 2022 01:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hchHZjNWkE2b+yprzqdj79Agq6jUDsWaD+ZG+ifTVqk=; b=em0/ojlOOPD9S62RSeBgMiZlmy
 6XAzo5q7fWS0QZdI8QLRTDwMfxQ1Mm7xeLh0hjTn0SMiA5oOx+aZHlM5MLzuoZid+qKyvLpP8vBoZ
 z5pWj+HiTmryP/sKzjkCFmU0QeHieIg+QJ17ZvJd+AeecRnIpCqFsEtXDJJ0t3/n6FlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hchHZjNWkE2b+yprzqdj79Agq6jUDsWaD+ZG+ifTVqk=; b=OTofG2644Rq9MV2GY1VySe/z2o
 rue7GynsNIAH6UhCSqjtPw614/qYFTBn8rBVf4Y+DU0dBPU1mU7ZwFjGjea/05lFS8b87DQ2/x0DW
 Bgh2boeDo+1h6l3ILAm+n/mFFFM5lwB3jF3FgalCWgwns5EjJiWmS5ZRUbhYqSAVx6Vc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlKgN-00G3n5-QP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 May 2022 01:17:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FA2D61152
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 May 2022 01:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1AE8C385B1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 May 2022 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651454213;
 bh=2bE08cn/9S8zy73vF/DZzdl2uyPjQLmRUVjnj+TpRtg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=myY2YVITdAyj/f+uT/v24jCsjeaK98PWVkubakHABFGBxKDGYLTd8amuGQbYzMYqA
 9aVXnSQLsUA8ypqRPH7BH8AZLgP34gVKIy70Pi9YZEVCFKU6vCPGEw2G4ZlfMYTymK
 1aUanUOu/lFLH0yarMM9dFj6M1F1qeluDooXqsbYYWVpXO2WpDKGPfhvHFX7WCuRbk
 3Vc8IP20K3/Kss2FO8HLWJZVRbrTgkR1SK+jQDe92IeLDf+sQzuBXId9XQ0KQAXDTW
 TtF7zh9ZqIH1xgeBsjiG8SUPSot5L2t5e7vCC+bxzEyFEp0lrAj3dIybw/0kW9hTE0
 VJNpjOJ06UYwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A8DBEC05FCE; Mon,  2 May 2022 01:16:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 02 May 2022 01:16:53 +0000
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
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215929-202145-bGuPZ9ZDR8@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215929 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlKgN-00G3n5-QP
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

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
I can't reproduce this bug... Could you please test based on below bugzilla
branch? I've applied all recent fixing patches in that branch.

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=bugzilla

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
