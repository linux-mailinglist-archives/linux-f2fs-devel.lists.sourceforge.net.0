Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEB1A1724
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 23:05:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLvPf-0007Fg-HB; Tue, 07 Apr 2020 21:05:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1jLvPd-0007FX-LJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 21:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CAwU7VVBdvCE6Rwj4UsLYMbvGKWGIggOwSeLRgsn8HE=; b=nApb4fQrh2KT4k9rLUuJrxNgmT
 Ssgq6k5UbvtCOgGjcegQeIX+a30mfCpZEzLr21XSA4YKdNW4Hg/RdTi3Ie47nMy42FabN9g1kgdU9
 FUhtzfToPhcCom1dTGaYa5KCaCuCnaJe0o5m2f8qOasAYhVvoOnQzoFQDiS0B8Rh5/tI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CAwU7VVBdvCE6Rwj4UsLYMbvGKWGIggOwSeLRgsn8HE=; b=QMqWuU5YlbXEElVEfsQIL7s6m+
 ps+Nvskd6TcdFnpCOemBqW3zrbbzHosfLc6TPpsYORynACyRvBYKMrJY9142ZwSTKutb9WJ+nMXdt
 fV3RiyHY86+1ZHLCxa+FbnmC04ifHiWQ21+cs34us06CEXhwM+TpNRiZG3cnPupMxrpY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLvPc-007NfA-GF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 21:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586293525;
 bh=zBaVdXuF23Lbox7ppFoyyZrhIO05fnK41HYaosVg2e0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=YaWLTCeV/nJSRzDEejEsg9nPQlz3Op4DS8dePlgv2dq7OPqra11xmDl/EV+eFMXtV
 9V71pdVRPu0E6T942r0pTgDa4zwTZcnvuxTZ+6JEk4AA078/osAr4brNJCt/UhATRr
 l/TdXn5BQcMabRdgMHKrOOALayv8HjIt1vHkaAyk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200407030242.GA139449@google.com>
References: <20200407030242.GA139449@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200407030242.GA139449@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.7-rc1
X-PR-Tracked-Commit-Id: 531dfae52e8c386f72fc4935b97486409291fdb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f40f31cadc0ea5dcdd224c8b324add26469c2379
Message-Id: <158629352584.19531.9084064391563587572.pr-tracker-bot@kernel.org>
Date: Tue, 07 Apr 2020 21:05:25 +0000
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jLvPc-007NfA-GF
Subject: Re: [f2fs-dev] [GIT PULL] f2fs-5.7-rc1
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
Cc: kernel-team@android.com, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 6 Apr 2020 20:02:42 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f40f31cadc0ea5dcdd224c8b324add26469c2379

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
