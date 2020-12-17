Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EB2DD9C2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 21:21:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpzm4-0003ZZ-Bf; Thu, 17 Dec 2020 20:21:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1kpzm3-0003ZS-3z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 20:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p4D2jzZwZ0YxG2gHDMWLIEwo2mpb1KJ7+3lgIV79k3E=; b=chMHoCLNOTNZhHWRDVxzQIie0Q
 YJtpCwN+4dEtSL3b/d5H+2yA5NAPtqUt12XkKvifZT4JoWieS8SfIFo0munPS/1MhieyACRYTH9Dw
 BgRC4xOtskO9H+gPpUxhexPQXfqNmJwuKXV8rg6CZaCKxHjGLx2t7BFFnWihWfizT504=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p4D2jzZwZ0YxG2gHDMWLIEwo2mpb1KJ7+3lgIV79k3E=; b=h7IcOCgQada1pogbd69BMLTEko
 CIxpV1vAMDY0jugJ1cspshAUQT81tvE1CB3SFUHbbsato9+jVq7FSeGmHqYtUBjGN5qiFLF4HNsVG
 yBDjfOno/EA6kf/DIQuA93F0/gvNMlLtKBkzYcpyueRfry7FYKcCdaBWoQZ+ia/FZpBE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpzm0-000QbH-S7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 20:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608236471;
 bh=gESy059H5zo599KfZtdX82108W6FYXeU8i7d/GYKQ70=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JQgj10TQsm7/Apkr/UnzJHa/Y7PXLT4TvlLvRTzIKs0SSxAVRdkF5k/ZMWJTnTKw5
 CIadWh+U+FzR0YSUGCMXOdKcG8sNBuo1lWMAXNPn8fHT9uh3lZDltDjin97xzGMkWH
 iKcPclz/GDbQ+4tgRNd3nfTMueskE8s6kCMG4OQftZXDJQDreioNFtfm8upqLNYj7M
 TsPayfiGEvAo4YZwXBoDIEX1V2isaPa5vjsRkxY1w97xlrb+g1RPyelJraU6VtN84F
 /nNVzcKLl/dken21/icbR5vyuT/xOEDAc8acqjfdhuAJgzH0a29X7bs4qyzkR0v3tT
 L6xXvFE11yOwQ==
From: pr-tracker-bot@kernel.org
In-Reply-To: <X9rz/haGgEG0pmMa@google.com>
References: <X9rz/haGgEG0pmMa@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <X9rz/haGgEG0pmMa@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.11-rc1
X-PR-Tracked-Commit-Id: 75e91c888989cf2df5c78b251b07de1f5052e30e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff49c86f27e4726a86f5034543e6e684daf41955
Message-Id: <160823647128.7820.10554161551821543774.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 20:21:11 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpzm0-000QbH-S7
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.11-rc1
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

The pull request you sent on Wed, 16 Dec 2020 22:00:30 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff49c86f27e4726a86f5034543e6e684daf41955

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
