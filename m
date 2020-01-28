Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C974414C3A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2020 00:40:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwaSy-0001dl-SX; Tue, 28 Jan 2020 23:40:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1iwaSx-0001dX-4A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9X8pEwrT7jWfuT1891tGmzDqistGWyhNK08J949sSA0=; b=J4ys0T7JvZLOU0UrrDqmrLmS8Q
 auJKIZKRl5yO+fjUdlk86cjRvdwe8Ib5h+udCNKLeij0fYiS8OdMCO/MZZSTVrF92WKdQDJVBOekc
 gisjYIosFREqEmX4TQ+rR+h24CvOzUIG920YAoDpT1wMZvsr2JYZS024Lz+5mxNGI7lY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9X8pEwrT7jWfuT1891tGmzDqistGWyhNK08J949sSA0=; b=JwtphqIrjC/DlB0L4T/Cj4jfrm
 SEAxlyee1p2B0oG2Lef9uWHoTVeCZ7WDWCQ1LwnC8mp0jghRCNOpHpiD7lodlajWvig6ga3Vu9myg
 VJddcQ/VJ1Kb+2jnD4SliG2m2qMEi94N1hAR7cFnWIGl62hkLJ02ct8WBwpEq5bGi7ac=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iwaSv-008hsh-5I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580254801;
 bh=FTTLR9MIHR1/Gdr9WwAJ4oAT91xeiib4YGas1QXvfTI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nRScizGtR1OS6FiMFccAEgDKKl9hkf3hBIEfV5G3fVot+rYpGszsKD39er9Ei1F62
 oCnFjli/S49RKmryJe8Po/gzCi0RPkU/zl92yUelxjPpUZozEOJIvEBTRHVkcJy5rM
 d8BaZB0Ctx8uvnhBQO9PQTt/htJzAOtc01y6gj6s=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200128014653.GA960@sol.localdomain>
References: <20200128014653.GA960@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200128014653.GA960@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: edc440e3d27fb31e6f9663cf413fad97d714c060
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0d874414329a86b67198cb0299d0dc9310592f1
Message-Id: <158025480189.16364.5716437858039757596.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2020 23:40:01 +0000
To: Eric Biggers <ebiggers@kernel.org>
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
X-Headers-End: 1iwaSv-008hsh-5I
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 5.6
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 27 Jan 2020 17:46:53 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0d874414329a86b67198cb0299d0dc9310592f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
