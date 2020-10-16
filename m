Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76822290DC1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Oct 2020 00:32:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kTYGN-0002NV-Hs; Fri, 16 Oct 2020 22:31:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1kTYGM-0002NH-Kt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Oct 2020 22:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OOGtZpGllY/Vt+9hqNnuAtlP2H/r38XMc6U+lbjagA4=; b=nVA3+S2MKcyAP6W79rnz0dBAoN
 dRdWY2xX7fmPaJ8xddqiTyVknACOl3adAdr6SYY0uMlyqOp7G2AwT7SCjAIWWe0XF1PtMlLs/dfV3
 PfFuOf0aYga3KQ5KapwzVH4f4RCuSfU6P8bsRlZDzwITD2IGC2Xhlh+K7v3U+jXUJe1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OOGtZpGllY/Vt+9hqNnuAtlP2H/r38XMc6U+lbjagA4=; b=ZDvmi/HWkPFUt9QQRBoMncySMl
 yCF22VCV9FZGSIU+8EEDMAueJlFol7yyDEpx3UNJmEPHB/IzuyFqM1q9Y0M3+NuJ3/uCPIFVlbrkA
 BD1ei/ZCjLTlXUOPvMv4538JFM7vz/z6KRSGtkkVnZWCGG2YZTdREiOgyQaLt8Zvhh28=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kTYGI-000jcW-9n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Oct 2020 22:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602887494;
 bh=L2n4i6g2/UVSn7TIQcFjubhZvWUdZF9XUvufZ72SAnA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mOP6Ke1iLEU0PtBOBXQLGheH5EjViT/L+oxpmnI05CHFx1M34wExXBHaxZ8eHj8Gx
 TT871ftHOtn+X0ONUHKkE0RDDQPswdIxY3n/RF+q17oXjREO18mj8kQ23AM1YmBWG5
 D1ruw0BeNdEgu1XaBocbxjCf9bdHqmVt4++FwQSk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201015225508.GA2465821@google.com>
References: <20201015225508.GA2465821@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <20201015225508.GA2465821@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.10-rc1
X-PR-Tracked-Commit-Id: 788e96d1d39949fc91457a816f4bda0d374c257b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a3dadedc82e340f8292f64e7bfa964c525009c0
Message-Id: <160288749475.30401.5365560149755404936.pr-tracker-bot@kernel.org>
Date: Fri, 16 Oct 2020 22:31:34 +0000
To: jaegeuk@kernel.org
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
X-Headers-End: 1kTYGI-000jcW-9n
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.10-rc1
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

The pull request you sent on Thu, 15 Oct 2020 15:55:08 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a3dadedc82e340f8292f64e7bfa964c525009c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
