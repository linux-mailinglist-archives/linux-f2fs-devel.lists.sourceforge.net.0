Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FAF10DEF3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Nov 2019 20:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ib8bd-00041D-Gd; Sat, 30 Nov 2019 19:40:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1ib8ba-000414-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Nov 2019 19:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3fDb2DrJ7g2mu/9zi9hhacN7x5YlAHHd3gzWwCJO2BQ=; b=dkXD1fxnGZvgBw3FNgKUufeSh3
 CiggqKhMvIQlF5464T5QdzUdS89lG5TjIt/h19KqkzDdiJVVUx8RAHvxfCI8EpH6F1iFuXWSnZPh8
 1nB8XXZoRrbqgOR0r8zmAdifGCsKt/bPHystbbLBNdsbcJT7FLJ3MEvJDSKpDcZxZMAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3fDb2DrJ7g2mu/9zi9hhacN7x5YlAHHd3gzWwCJO2BQ=; b=lDwVt5xYcLQpqTH7DmSTfw2LuU
 cNixhRfVxnSWL0WLUtOLKzZx4VPL73mZExOOWQWID4wLRrYfzwy6wXFb+NWO3AGyn/LEk9pcwnrsQ
 5sujQ0PvITJsTl4IcavT/K3bvXuL7oOfBCRCersPZF+pO3ftWFZhkFFiTYpsscxnA8yE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ib8bZ-00DB6r-DI
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Nov 2019 19:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575142823;
 bh=9UAxbB/+sQKEZhw/an7RU+qWhMVAXgU+E0K+loUGkzc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=HOPSA4MTcLjBcyz7CLWG5myXGF0Dz1uNlSC+wV9k38TRQwV/8pGsQP7xqTWo5lHuR
 lF8vdAT758dw7reOl3m/xm8iFX2QHqWNC0TDrw+rZrnUE/WSW2IPe9E9f4uAmXQ8L+
 yooDptqWugpo29mwriMozG78KdKFOdfqP3KdrsZI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191127200138.GA47793@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191127200138.GA47793@jaegeuk-macbookpro.roam.corp.google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191127200138.GA47793@jaegeuk-macbookpro.roam.corp.google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.5
X-PR-Tracked-Commit-Id: 803e74be04b32f7785742dcabfc62116718fbb06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f45533e9db917147066b24903a0d03a5adb50e1
Message-Id: <157514282301.12928.2833431195207322730.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2019 19:40:23 +0000
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
X-Headers-End: 1ib8bZ-00DB6r-DI
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.5
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

The pull request you sent on Wed, 27 Nov 2019 12:01:38 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f45533e9db917147066b24903a0d03a5adb50e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
