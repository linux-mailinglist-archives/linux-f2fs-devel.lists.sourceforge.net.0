Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE01CD6A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 19:05:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQarl-0007B6-89; Tue, 14 May 2019 17:05:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1hQarj-0007As-Rg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 17:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y17rt8eev3citVOIAVveFiNKImC9Z1xWYTUJ5MkWBLQ=; b=EayH/KTX5n9BSoT/2Jv0JRO3Wz
 4EHzh3ZYdvpU2Tf2jihtFeg4YMggMRxyWT7rCnhH6RpO6mhCE2jrE80pe/3M6lUt4yBhnyz1eE6iS
 cx6yGMYeZf9EgPl/ZbzhFksuAkMuoPTyagXLWvoEdUgXjSnLV8fv5WGDTdZz4k7lI9j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y17rt8eev3citVOIAVveFiNKImC9Z1xWYTUJ5MkWBLQ=; b=QzhfonUen9BF7+xBiGo5WoZtqI
 J3JHMYJdPFYzJ/G8FIhigwXEyS+Si/5gwU2VrBltt4sdTLrjtFiU+qnHniBM1zCh0ELb9deAzZlJn
 YsFlZesaTo6Diedq0Z2B9mtqS/akZIyt5OgE8PLHrIMRcriAkT1Mhni3YL0YZlLM/zJQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQarg-00Glnq-Bv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 17:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557853514;
 bh=pq/RxXYpWB1X4gKKNPp0P5P26ha5ACHS4BHT23x3oBA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gVIKapJdGhvyAmhK+AOBEX/oha51bxg9VQvtkh2w/kHU5lyAgo2L0jb3vWO77yKm6
 r1XxO4Fvy1Buox2MDhzB+YLtDKdIQ9EkhKPYB86pxUwjfo0UVtYeEUjKYXLSqIXsPq
 XrtUh/RXtZelLSOMk3cZ2uIXRIQY49Az2o7oGO3k=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190513233818.GA33287@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190513233818.GA33287@jaegeuk-macbookpro.roam.corp.google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190513233818.GA33287@jaegeuk-macbookpro.roam.corp.google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-v5.2-rc1
X-PR-Tracked-Commit-Id: 2777e654371dd4207a3a7f4fb5fa39550053a080
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d28544117fa9dcd0d202aeb4459bb15f42bb7de
Message-Id: <155785351467.31213.16662192776100044634.pr-tracker-bot@kernel.org>
Date: Tue, 14 May 2019 17:05:14 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hQarg-00Glnq-Bv
Subject: Re: [f2fs-dev] [GIT PULL] f2fs-for-5.2
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

The pull request you sent on Mon, 13 May 2019 16:38:18 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-v5.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d28544117fa9dcd0d202aeb4459bb15f42bb7de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
