Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DC28D22A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 18:24:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSN5z-0008VV-E7; Tue, 13 Oct 2020 16:24:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1kSN5y-0008VE-Bv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 16:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aCvw31zfVJCXAAOtSaKuesBidahZBAKTVyjLbbnjoyE=; b=Sepp8UgNS+ioDPelf/scrasfCj
 BJiIZJKCf9w+a3L4Vj/eWWp6CV/p6mpf18XpWrH8RjZJ66eDiPBA9snPbLKHrTa2SAwfHmY9TSlpL
 VUPZCDT5nMxLelHpGnmutypdvzAzNsY7G1cIEpOBFl/4X+HLRh5qpjYRIgb1xvNZFnVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aCvw31zfVJCXAAOtSaKuesBidahZBAKTVyjLbbnjoyE=; b=Q+mlSF+DBYIrDFbjFxtXfd8BBH
 OogETitSz/Hp/AZnAImQOZFAeJYRhXpQvjUdxx99Pocu1U1LgawbxRqztOjrb5gdBzt+u0XUSWLJl
 wUfzwEzOCyugC58/vijO8HDos1shLwZa2xTfUtHF9TMwQEHcIpkV8D9P1sYooDctKWFg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSN5v-008ptr-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 16:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602606244;
 bh=0GDL0FDvlJWyLDYOyGXqNYN79mm0g6czXO6Y14y8hrk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mofhlG7EDLN4Wve2vrb/jiWtdjc82+lqb+c3kTbmI1iFf2xdVgtLjlQf0+l9/MtrC
 sE81COzKRt4L22V5GvwJKgzI+XyZCUsfnYqG3/HK4o0gRIglNXN8s9xuYDCF7C+Van
 fYZnaujwVqmKli37bmbx/DRw8xt2EHPDN/A1MYzs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201012163543.GB858@sol.localdomain>
References: <20201012163543.GB858@sol.localdomain>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012163543.GB858@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 5b2a828b98ec1872799b1b4d82113c76a12d594f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f5032a852f9bf3c449db58a9209ba267f11869a
Message-Id: <160260624476.24492.420695043633414876.pr-tracker-bot@kernel.org>
Date: Tue, 13 Oct 2020 16:24:04 +0000
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kSN5v-008ptr-Ta
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 5.10
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 12 Oct 2020 09:35:43 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f5032a852f9bf3c449db58a9209ba267f11869a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
