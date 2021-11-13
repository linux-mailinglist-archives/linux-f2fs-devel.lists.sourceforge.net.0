Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D240C44F50A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Nov 2021 20:44:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mlyx8-0007TI-L3; Sat, 13 Nov 2021 19:44:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1mlyx7-0007T8-EP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Nov 2021 19:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r7b5L4IDGax5Vjo4FYAUkBvZRaL7TxtBa5A8WJYknj0=; b=Hga7Nj5o0Q7eCUAgdFa984Dh43
 I9UXygfCDk9q6VNVpwXrLHHoFT1FIJ2r5oGhp3o2P3dODGpQZ/y7VnWg87LwtzwRK7ptODy4fqytt
 1hqlz0rSntH6JhJ6tYRKJmjHbTaBiZ+pkOgDLWta1IUH1F0uDV6ECQ2ikx84C4375U4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r7b5L4IDGax5Vjo4FYAUkBvZRaL7TxtBa5A8WJYknj0=; b=fvbnEdKmH8Kkr93xWoG84aFec2
 D5jqbihGIOfONN0F9cCpr2DE6G6Q48aqdnr8grN3hAdFAh/xyPWNz8qRkfSd4GkSgNhbqlN4OAQUU
 l0AB/dNhzM+gDc2KINQNB2Dh4sQaZ4usSDGgpOovImHQwnMiZCbQwsw/q5EahVjTt6Vc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mlyx3-00C0qg-08
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Nov 2021 19:44:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id A500361207;
 Sat, 13 Nov 2021 19:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636832666;
 bh=qjKVF+R30OaY0jTv/XtMmQw9pfN+A18vJ8yIhEcSnCQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=I+HyOqhG3QXUyhHaX8KzlC9yfodCLLl95lmz4Sd8jIA46Wy+gvuBB1g5+Rqf9rPm0
 L4TXeCDnyLSJOquceCWohjfMIxBhudtpFwaA3QDUDFixzZBksfeN/mAGtOre9A7o5T
 UMzgry40PCWcRg+ETr/FAklh+cB/BaiwdKmWgKrBkeSViQl6332RCja5grXY4WOId/
 lHCffHKQVO2Lgc0/kmjZw8JPFw9w0w+pdhs259kK1mQDvKZjX2wl7cfjqDFscZKeVb
 x1x/OJXlKXCJzW3c3MJCJ3vTHeQqnEUhmIdAaNaZj6ERacuvWmG2XBCT1euOQjAVWQ
 vu8Od5jPYlCjw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9910760987;
 Sat, 13 Nov 2021 19:44:26 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YYyX3oZXNAjYzG0A@google.com>
References: <YYyX3oZXNAjYzG0A@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YYyX3oZXNAjYzG0A@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.16-rc1
X-PR-Tracked-Commit-Id: 5429c9dbc9025f9a166f64e22e3a69c94fd5b29b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5664896ba29e6d8c60b6a73564d0a97d380c0f92
Message-Id: <163683266661.24678.17070565669479389986.pr-tracker-bot@kernel.org>
Date: Sat, 13 Nov 2021 19:44:26 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Wed, 10 Nov 2021 20:11:10 -0800:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.16-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/5664896ba29e6d8c60b6a73564d0a97d380c0f92
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mlyx3-00C0qg-08
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.16-rc1
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

The pull request you sent on Wed, 10 Nov 2021 20:11:10 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5664896ba29e6d8c60b6a73564d0a97d380c0f92

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
