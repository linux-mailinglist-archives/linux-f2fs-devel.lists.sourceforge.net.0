Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5DD14E631
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Jan 2020 00:50:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixJZu-0004WT-4k; Thu, 30 Jan 2020 23:50:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1ixJZs-0004Vt-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jan 2020 23:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RWzypPpzsC3kAV70wpqW9/uIDNPkqLeg3setLU/CBqA=; b=HJRtCuvEKgS38pNbdWPhq0VBAa
 73a4xMfhtP7HsdDees0x5d/JvCvsjDPeEXSwtYxxfhHHuButpJLZp9+v8pkbKTw1zSoNVFa73k17k
 0Df/4O+inmEaO574Lm3QIaUBZ53zG7sNxkHnMBAe32TDsjNblHYlUYyjdHCRNzsex8UM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RWzypPpzsC3kAV70wpqW9/uIDNPkqLeg3setLU/CBqA=; b=Vh/Dbzb7Khm8/c+iqd8k0TlAnw
 hCo2ooQtdx0m4jCSqLlk8B1YF9xVxBs440ggFhYL157OhzawQWR9UWBql4UUIG5qHy/kwuPWuBT5f
 HyC7FWW7D1e/7Y7oEc3bHwRJT/EAYp8jekFhd5X4yvo0Yx08kQQbQRVEpxmBCyqGBHPo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixJZq-005crh-W0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jan 2020 23:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580428218;
 bh=SX4dd91lUe1tOyO4Sif0XUIJozxIpAwzV+9mPvfm39M=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=yVexK8+KmAARoH5F2UkYD+kvV6XUATWC3fMYpaKVMHYzQfLx3pQoDXzAGyumsQ+Tm
 En8+qyZGo9s4dKjdxEF0CI+bVy7BzEQYSBdujUQAROI/Phlob0RI/WTlzUl8swDDj8
 AUHAG2IOQMAkG4rFIFFHNfUwc2/zk7UT3HbC/n2k=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200130185335.GA225399@google.com>
References: <20200130185335.GA225399@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200130185335.GA225399@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.6
X-PR-Tracked-Commit-Id: 80f2388afa6ef985f9c5c228e36705c4d4db4756
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e135baed8e70b00b88f7608f6b041461a5270bc
Message-Id: <158042821807.30792.10663230485770061389.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jan 2020 23:50:18 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixJZq-005crh-W0
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.6
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

The pull request you sent on Thu, 30 Jan 2020 10:53:36 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e135baed8e70b00b88f7608f6b041461a5270bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
