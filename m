Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A7320CA9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Feb 2021 19:40:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDte7-0000rL-1V; Sun, 21 Feb 2021 18:39:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1lDte5-0000rD-7K
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Feb 2021 18:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgceCEiC2NRS5mgs9YMz/Ja4yetjTMo7lDGbCCro5Ks=; b=UsUsIkeBuTx+sWNW01HpXyvezJ
 EuQb5VbnHk9UcS5IYO3ORLBLRqhGZdQmoC5qCbDmyibNwdRFufIugRxwCInVJSdXkrKiiuUWg7LFI
 kxLuTaNSTb9YLcmm454sIntj1RM9CG/vdNz/BR2lGwrrNYMcw7eS2RZRGdL/hHo9qZwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mgceCEiC2NRS5mgs9YMz/Ja4yetjTMo7lDGbCCro5Ks=; b=mZsIzpVVHIt7cLzJLFsKuwk7ka
 GTgy9xS3d02a89HJnW3ffwTYTLhI10vm64mLAA40nWzVwAAox8rvIoU/crFO/Hxvc/CAy/k1x+hC6
 Tg/aSQKgcQu4EhGQ1d//1m6cAc1Qz5C69UyCW8KPYfPl7T9cz4/l5e0ydLc8Zn7duOx0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lDte0-000LYu-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Feb 2021 18:39:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4498E64F06;
 Sun, 21 Feb 2021 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613932783;
 bh=kiZ0UhlyMSAINGdIufeE1sLrUYx/zC1STHU0x+Eo+ec=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rTBMFipcdSmBkFCtZ7iPJW7xSZHUEAg2KIkr/rN4zvDpNDdC6BugI+AvpA4sJf/xQ
 5fGtqCKZ2nFOpS7Fno0N/wK6wgorW4cbnFcm480anTgcWiWGID603GLOoyQhYLvxlS
 fMsL7KY5WoriqG+7Il8PajNUW0qKNzGDztXsHIUTH+xH2+NNSguFxIWJDY0TTpW3VO
 nmtvOUl2CrjiPYciIYgExIuxEfgDsilcwtRuPvkgm9Kpj1W/49bz7oN2s3rSNFnHta
 YmF9xGnhxnCUOWHB7jkS/WwmHPFcoiYNPn0jEqCIqkl/2YY/vDFz0wnmm8lPrxItik
 zLUlft5CJRang==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C0FB60967;
 Sun, 21 Feb 2021 18:39:43 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YC18awybSAcVLPbr@google.com>
References: <YC18awybSAcVLPbr@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YC18awybSAcVLPbr@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.12-rc1
X-PR-Tracked-Commit-Id: 092af2eb180062f5bafe02a75da9856676eb4f89
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b42fe123b013fbdc3172616b27d568d0cb9d2d6
Message-Id: <161393278324.20435.8703658147073031710.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 18:39:43 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lDte0-000LYu-Nd
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.12-rc1
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

The pull request you sent on Wed, 17 Feb 2021 12:28:27 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b42fe123b013fbdc3172616b27d568d0cb9d2d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
