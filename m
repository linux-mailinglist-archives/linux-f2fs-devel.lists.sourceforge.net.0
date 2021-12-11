Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B390347140C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Dec 2021 14:38:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mw2aN-0005GT-MJ; Sat, 11 Dec 2021 13:38:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mw2aL-0005GN-VC
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Dec 2021 13:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lPaQUbXBWpOmabyGUIX4sJ4bAICTf4km1zJbKc9vz44=; b=Qv2d/vI3nht+/xD4WWrmjoh7tC
 ZXmyq/j0gdETm4cvfGPA52Hba+in+ItSFhpIgDO+HPg2DcTdk8rflqPhNysKKE69PruTj60UOk9mq
 zYnu5CER7UKfp+KG1cvrwYPbayqYOM2oBJ6c5DhuCR/GovhZ//62M2t80DIMpE98rPSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lPaQUbXBWpOmabyGUIX4sJ4bAICTf4km1zJbKc9vz44=; b=cl631sVJFljaBNlz09WwduhoY2
 x3WTQrtSD8hoSPFZzu/jfLQtqWeYKp9BewVUVsUIg8974M+SDKd076jFicDRZXMu3Wh43p2mJt9FB
 uWiScxofKw/mL90U2zXzHnX96B4bAjGSVz8T73gvf2KZ3f6VKsVA9mIoTImYnyIg7HIQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mw2aH-0005TO-JS
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Dec 2021 13:38:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 19B97CE16F8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Dec 2021 13:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A5E3C341C3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Dec 2021 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639229912;
 bh=lPaQUbXBWpOmabyGUIX4sJ4bAICTf4km1zJbKc9vz44=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ShPwMddOu29FZ8bHCQNWpUFZB1PfcUYgwRiFsogViziNkwGBhtjbqCVr8thJNPiDN
 QZ7i0vvdcWRJ/nVbG6rVIjBXS5cRL/5CkJWhEyjxheLjDliXhnigI4hKIBtYthKK8m
 w1Yn8Oe+ZsydkXq849Ekv/EqJJzLWOWBbwnEZF8oSSRIacP6dYyomG/fnOJCie/0eA
 Xs/nyRe9LS53sMCCaCQQaZxuFbcEnD8uXtPXtTFHU1C09KX87nwHfeQm2wl5pi0ZnB
 MCOK1IOXqwlFXjxZt3VwFWT937wlqVJHjBlOasreUOEzdewHU/7OFRgU+FO8jDfWad
 04BSsBZKT5kQg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0D86860F4F; Sat, 11 Dec 2021 13:38:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 11 Dec 2021 13:38:31 +0000
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
Message-ID: <bug-215293-202145-1Hc7ivewHz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215293-202145@https.bugzilla.kernel.org/>
References: <bug-215293-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215293 ---
 Comment
 #5 from Chao Yu (chao@kernel.org) --- I guess this is a known issue, could
 you please have a try with below patch?
 https://lore.kernel.org/linux-f2fs-devel/20211211132736.5283-1-chao@kernel.org/T/#u
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mw2aH-0005TO-JS
Subject: [f2fs-dev] [Bug 215293] F2FS: kernel bug at fs/f2fs/segment.c:2543
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

https://bugzilla.kernel.org/show_bug.cgi?id=215293

--- Comment #5 from Chao Yu (chao@kernel.org) ---
I guess this is a known issue, could you please have a try with below patch?

https://lore.kernel.org/linux-f2fs-devel/20211211132736.5283-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
