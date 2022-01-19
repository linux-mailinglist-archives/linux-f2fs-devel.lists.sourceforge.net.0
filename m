Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188D4937D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jan 2022 10:59:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nA7kF-0005EN-4P; Wed, 19 Jan 2022 09:59:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1nA7kD-0005EH-S0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 09:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cWwoilojlxZrI8KW8owlevTHEbE+sQpa/reUAgKxdEs=; b=Kf3fAB2ozUNypB6Ry9UH4VjsId
 PH8X1WA2aRebzS2PGuGUkIgiwKIebjYJFDyEay/KCnS+5hLWIAyqsfSdAG7eVkYjqosCpAT0jUqrj
 dnVku+122xZXjYQn2l1UoXNVgi8STfWpzNWA6sgvtNok5ZQN/01wrv1QRf+uRRQ3GPxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cWwoilojlxZrI8KW8owlevTHEbE+sQpa/reUAgKxdEs=; b=cAbev5jhyvsDCbGSzO/s7sgquU
 p4Q8nH15hMfemk8fOXqVOYpJwGpawBmphOacuzWwLHBMqwosH+EgAvbXJDrww1Tn09F+H8v6lTtr6
 HjYIvu8ndzVD2SmV/B63Kdi6RwqeoTjd1Ug+ko2DowxWIiRAQMbOR3h/m117j2K/d5N8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nA7kA-003NUR-EA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 09:59:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D96826154C;
 Wed, 19 Jan 2022 09:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45C56C340E5;
 Wed, 19 Jan 2022 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642586336;
 bh=YK+NHYklnZnc5AIU2rcQ/ugY3qqF2EwcMoX/0pl/+sA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nTCq/b988q3QVwf7qIrSTzbMlKR3pIqyZTqN+lweoSyiCmOT4hxwgm/V4YZH6t5uE
 rfr1k1LUq3DN0JAyf1QDYbDyFul/Cs1EJedRNZKaNZKpzyUaFIR6sLRux6TUzUWtrw
 4TI3c6HHXVxfFPeNEoTTQY4io2aidfKvGGTMxJXaycTEABsYu5ewaYGGZtEa36/UD6
 cVOMTC1+w+hbYF6byDDJ2OFnTDjBzIUVmcVsnhidtXVkx4/qonHVUy6y7hnqVRLNlp
 O7dQxtp3PRPpYrNL+Rs+fEOe/ZgkNgo35+8wcIViSSNBuFNR/qbprU1YDbOO2sumXY
 vbBlqSU3dRq4A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 33529F60797; Wed, 19 Jan 2022 09:58:56 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YedlHVEa4sdbvB2F@google.com>
References: <YedlHVEa4sdbvB2F@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YedlHVEa4sdbvB2F@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.17-rc1
X-PR-Tracked-Commit-Id: 5fed0be8583f08c1548b4dcd9e5ee0d1133d0730
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d1df41c5a33359a00e919d54eaebfb789711fdc
Message-Id: <164258633620.28417.9292686617329063876.pr-tracker-bot@kernel.org>
Date: Wed, 19 Jan 2022 09:58:56 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Tue, 18 Jan 2022 17:10:53 -0800:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.17-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/1d1df41c5a33359a00e919d54eaebfb789711fdc
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nA7kA-003NUR-EA
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.17-rc1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Tue, 18 Jan 2022 17:10:53 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d1df41c5a33359a00e919d54eaebfb789711fdc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
