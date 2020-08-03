Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5023ABDA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Aug 2020 19:55:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2eg3-0004Wz-Qj; Mon, 03 Aug 2020 17:55:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1k2eg2-0004Ws-2K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Aug 2020 17:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yx/vWN0Sc53PRlL3nc7i9Oo00lyFDbCNvHNNIfKzwI0=; b=UUY110TIKqppOFhBm6e5ABs0JL
 zAOGf+FBMufDy6Z59AnMogbpGfGbvY4753xT9VheJNmvNRKTfv+h8LoR8zTs/MGz/sDFB3i77x95S
 sxS4E3mBxhj2n+Gt/EzgNWH8oMRXLS0EsFrK9g2OJah+aZCBJMYxFf8sh0tVaT9NSP1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yx/vWN0Sc53PRlL3nc7i9Oo00lyFDbCNvHNNIfKzwI0=; b=HdnxBwxsdEdVYKQB8WGfHWmLZy
 SCP2ECCd6bqjM/TqTSxjD+neyx3dnLu60C0mPopQJrSRk2fbMecrQdVkGCrCUZs7P9fMoYVXnFE2j
 Joo/yqrKHd4yd6BU+/NSgadDcncK8U/hHOh7VQyNofdhTN3JmytZWUq0Np1GHu7z2uRk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2eg0-00808i-Ig
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Aug 2020 17:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596477301;
 bh=zoMh0nl23+pSyDpQtAkLlOsvsO3R3HRl5QxOs9dNUU4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TLwaIfx0FGEcrWa8IyQvq9a7sCFcL5Hs9++NjdORSBd7cBQh+tigrF0hl0ngo8WQv
 vViE81VquM5FAC4FsrHj6uUDYR347M8nqGW1qLlkaix7hcIlIieNBfM4t7Ert75B2h
 X9nZpi7wEgte2Q41n4BAtsH35GnoWdJy86VK6eFI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200803070547.GA24480@sol.localdomain>
References: <20200803070547.GA24480@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200803070547.GA24480@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 55e32c54bbd5741cad462c9ee00c453c72fa74b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 690b25675f5c9c082cb1b902e6d21dd956754e7e
Message-Id: <159647730140.19506.4501237993165044273.pr-tracker-bot@kernel.org>
Date: Mon, 03 Aug 2020 17:55:01 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.6 (/)
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
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2eg0-00808i-Ig
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 5.9
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 3 Aug 2020 00:05:47 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/690b25675f5c9c082cb1b902e6d21dd956754e7e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
