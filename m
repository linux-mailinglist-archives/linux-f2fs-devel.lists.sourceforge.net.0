Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E6380F5F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 May 2021 20:01:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhc7X-0007bE-9W; Fri, 14 May 2021 18:01:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1lhc7V-0007b5-Fm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 18:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtG3AMImTl5vd9TZE1z11LHmqi/vEkP8I5AHpygU9kM=; b=O0n5IjPnEL+AVpC1QZuKo8FUcX
 n53JwylAiNPOhX+o8SMQvRtHZM6BgS5CMiUk6L8clLd4JG5zsq0PD1cuLGqDzuQbqc7Fl+RXgzbwc
 6xeBsMDi9iu8pqnDy48Q/U2YbGW8rB+gWrp6OMMynx1XcZKcg4i0poqB9FDeb2FRWFQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rtG3AMImTl5vd9TZE1z11LHmqi/vEkP8I5AHpygU9kM=; b=IZnFbNnBD3AzzvbWwEGlxyfzKh
 HD5f5KFVW17BXUbjGEdGWToWQDypg8GWN2D89IfKUpeFU4jijxCCpnRd0rSwaQEDte7ROh+ET3qBB
 LWwL/zhoumyZ51ep2U6nef/xGQGVofDeGPT+BTxhGtApX299/H+pR88gTB8tHd8zaxoc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lhc7S-008Vie-Os
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 18:01:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 210F1613C5;
 Fri, 14 May 2021 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621015253;
 bh=vsnP8XxSGeXkU2mbDvoXIjpdwW8d6Yy8xM8vQzxnDLc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mYisM0SsstagzvAXPi4Dp49DsfQUO58D76BKON118G2danCHZTbk+q+J//v6h0B/L
 /3RfdqlVe+p7LRL2GmD9C2wX5pHL7iuI7DxHty8wVIi/blKmcr7txAHoO5riTD7GbF
 e4yf4Me6VCDYbDUlWsZOjdP4wpODCSRBMr6VnheTxTSeEDrk3aLpAZnR1/CHgrst2S
 iAmmfTxLdSZTru0cJ6OiOjnV2ep7YtHlv8ghWGbZ/VGl+uLrSsEWzveCVABQwhQOek
 e6tLd+wSwiukSqzHasc6SjAV+STyy/OT3373MQTPK63MLsrklHsKoIcC/ZcrDC0APz
 II0t50/6AS+ng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 14C1D60A0D;
 Fri, 14 May 2021 18:00:53 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YJ5NdFzVb1f9aVqG@google.com>
References: <YJ5NdFzVb1f9aVqG@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YJ5NdFzVb1f9aVqG@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-5.13-rc1-fix
X-PR-Tracked-Commit-Id: f395183f9544ba2f56b25938d6ea7042bd873521
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac524ece210e0689f037e2d80bee49bb39791792
Message-Id: <162101525307.30508.17143855236769719252.pr-tracker-bot@kernel.org>
Date: Fri, 14 May 2021 18:00:53 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lhc7S-008Vie-Os
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fix for 5.13-rc1
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

The pull request you sent on Fri, 14 May 2021 03:14:12 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-5.13-rc1-fix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac524ece210e0689f037e2d80bee49bb39791792

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
