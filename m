Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C810959B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 23:45:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZN6b-0007dN-8j; Mon, 25 Nov 2019 22:45:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1iZN6Y-0007cz-8t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 22:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TAoLTjMRJhVJnd5MZaHImCleEqu+5y4LIqFAy0Innyo=; b=D43LaibsY61hN8fnxM9af310Fh
 YU+RNvXyV7opcPqkDQTjTY6wu3aCqho2qAP+09jF6HdkbdB/YscGDgPFBtuDxY/ngyjHqxjcYi3vW
 W8WzXmf+TojQSYIXQpQB22TeVckBWLa5IBJOozCVpnfMOzPX7PRoXs2XNDYY4LRZMyRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TAoLTjMRJhVJnd5MZaHImCleEqu+5y4LIqFAy0Innyo=; b=kt75/oZNbYilA8eHwqdsgr7E+5
 yKmzxbl0xhs1KimxToeLsd+vcV6B/abh4Jup1K+tW/DZSZu3e2rRSWCblYni5YpZqGnfnxk68Ifnz
 YRBypdugL/p/AijLytUGOCNrTNv2aS9Uw5BC8hhHi4Nxr3hg9AK5jncam6fDn8E6cyQk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZN6U-00DXD2-KK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 22:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574721902;
 bh=iBG0BodDs0Gwe2XN+3tSn6/CzKDz6Y3Hq1qD3RP8fVM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=DtDsSrUSnwwRHJAs7q+wn7NCy+oJCewmy6M4mKnDLa+fekgv+KY8iLupXJKXPmKtA
 fIp/hp484Qs8GDHFCzdKv6pW4DBnmxFSwhFsgb1CnOsQhgThquEGZWqucgX1gUkZvS
 Omu3s1Fbv+nmbK84xJ+WeEVZMb7Lip6E4uFdlcyI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191125044503.GB9817@sol.localdomain>
References: <20191125044503.GB9817@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191125044503.GB9817@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 73f0ec02d670a61afcef49bc0a74d42e324276ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c1ff4836fdab94c7c15b23be57bf64c1e56a36f
Message-Id: <157472190253.22729.6647142236304424052.pr-tracker-bot@kernel.org>
Date: Mon, 25 Nov 2019 22:45:02 +0000
To: Eric Biggers <ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iZN6U-00DXD2-KK
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 5.5
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 24 Nov 2019 20:45:03 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c1ff4836fdab94c7c15b23be57bf64c1e56a36f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
