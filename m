Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA438320CA8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Feb 2021 19:40:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDteB-0002Ee-0w; Sun, 21 Feb 2021 18:39:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1lDte8-0002ET-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Feb 2021 18:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gR1xdBgD+rUos4EY0mCEp4MLxoh3ZFZ08x6ccb55ZmI=; b=PF/8HDfjHYIvUAJPZZdiO4Yp0W
 WDATK42SR4RPcvVc566V4ZJfhPhuWqcal0VANRlvIqfXprS0IYYYawkvO37HxiVVg+Q48KoaNaxVT
 whuHn5rVnhZh2WRGFGT9Mh2DY11nI4raCuy40MSFYb/p2lOOWzt8ip77TjP8+W1cWS5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gR1xdBgD+rUos4EY0mCEp4MLxoh3ZFZ08x6ccb55ZmI=; b=APkZp9JruCks5exPs0b6HT/Hq/
 lwUb0WbyPTXPwz+lpvfcDaVbrhIzj7+ZgyzFBpHDOdef2dxpvu49jiRasbjjcNQrC4KGE796f5Y7h
 5/F/D1Mhbvo3ztKs5UdcYZm3MKxu3uFw46NHqqFnisEPo9iHnJWwngcL2JvKM7jx06HY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lDte1-0005L1-9s
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Feb 2021 18:39:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 0319164F02;
 Sun, 21 Feb 2021 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613932783;
 bh=BdtrW9KKDysj8aSQB1bawTcYxDbJkOXemTzKewhvJ78=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZSHiINmaMM87c6IgWKHfqFHPqVNZ8AGEAnz8XoQw3V8h/DTZmurFjzS0I549CnFaz
 8ziigEHpUWC+Yx9K7cdHa618zXwvESb0mozqThsQdQO/9xnHer85BmFhFdTA/JFiZs
 cNB43Jj+y3t7xnVI0cR5xx6mAFG4sjqCZghL4/DVuh3JX9uNizhTFvhx2ZB66wbsrJ
 LZj9fjJNgQMv22UBLbwR2egxotAX/F3MNrURbYFD3bZooaX0RmCsVhx/SMrIsTVXA2
 1ICII5fGJ1f6wrLVS32rTogG4ZOZY8lrmP2Uid/vmFVYNgt7qLubvDpjSlM0BNNyUy
 TLYbik49dgJ+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F20B260967;
 Sun, 21 Feb 2021 18:39:42 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YCwBY/FsxEsnI0M/@sol.localdomain>
References: <YCwBY/FsxEsnI0M/@sol.localdomain>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YCwBY/FsxEsnI0M/@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 07c99001312cbf90a357d4877a358f796eede65b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7b36dc5cb37615b568b7161ddc53d604973ec8b
Message-Id: <161393278298.20435.13432772684850802253.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 18:39:42 +0000
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
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lDte1-0005L1-9s
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 5.12
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
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Victor Hsieh <victorhsieh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Tue, 16 Feb 2021 09:31:15 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7b36dc5cb37615b568b7161ddc53d604973ec8b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
