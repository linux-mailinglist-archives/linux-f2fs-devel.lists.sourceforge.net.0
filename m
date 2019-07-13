Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CF6774A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jul 2019 02:40:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hm65N-0001Ub-2s; Sat, 13 Jul 2019 00:40:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1hm65L-0001UD-3z
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Jul 2019 00:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qfDOFmkEUWqnrExx2UqYBPt2dMNYDijWI6Tc53FqEmE=; b=hOUZTuav2C+pTi1KJ8ZEdF7yya
 l/Rlhd2qUAQcCxHSeUPzsBV6M8kln7sELKKvMqu1l8vrtA20MhT4+AAO/D5BO8JF809zh8Fb9cT+i
 3Y/LciKy4ZZgHilieN0Ynrd49j3C+fbyojfFAeKYG/xUU6dhxSfNzk9+kAijtXVV6esg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qfDOFmkEUWqnrExx2UqYBPt2dMNYDijWI6Tc53FqEmE=; b=XU1Va27s7o/FEsmsQbUONoXJds
 ktI6M9DVyBpLBMcN9f1KqdZcqK7D+uF/RcvZjO9nAKdDv5VPWP2OWkqD0CTUwBt1cqQj6Oo5S+q3T
 L2ORdo9cqAd4X8/FpDSn8sgvQAhQlXPM643MGBRKM+xIHcvBB4sBMfgfkBZZcASGmVHs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hm65J-00GrAb-O4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Jul 2019 00:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562978412;
 bh=TXsKEjoyPcEzIhqKMz4iKUFUjg9pRr3RvRnxuJ7n/zc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=R+xOtmTKsZDqhSEOIeh84R78A6Xkr7XfL3aPmFpLS96tI54TXzOWdBN5ZzfNvGGhZ
 9WmbYQBLWuonmFvDhHCMVUybbEGL3Vm2KCs7wck+aQ0iC8eq1L++Kzm6rE+Jm0OlvQ
 1gyXaQLtZJwSm6Ihu4JOq0Mm6pNSbUADh4fdSe4s=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190711171336.GA66396@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190711171336.GA66396@jaegeuk-macbookpro.roam.corp.google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190711171336.GA66396@jaegeuk-macbookpro.roam.corp.google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.3
X-PR-Tracked-Commit-Id: 2d008835ec2fcf6eef3285e41e62a5eabd1fe76b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a641a88e5d6864f20b2608cb01165c756794e645
Message-Id: <156297841209.30815.16710657427970608487.pr-tracker-bot@kernel.org>
Date: Sat, 13 Jul 2019 00:40:12 +0000
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hm65J-00GrAb-O4
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.3
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

The pull request you sent on Thu, 11 Jul 2019 10:13:36 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a641a88e5d6864f20b2608cb01165c756794e645

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
