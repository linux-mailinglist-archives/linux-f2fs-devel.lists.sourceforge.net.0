Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B837223ABDB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Aug 2020 19:55:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2eg5-0002WO-UH; Mon, 03 Aug 2020 17:55:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1k2eg3-0002W4-5b
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Aug 2020 17:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IDboQROlT8T0Bx1nvXCAUfGePfryK0PSYpDOGTxx13c=; b=GpbV/OZP9oAehF1cfi/PdZUcZk
 r8iG+H5vuf7fu+goJwOssF3gjdOLAwep5TbaohPlnMN3yCA+57FbtxkkOBjvmBmFkiYD8eRdtxq4w
 0nucE+3nJCPnnTDEmQchAqJRsb0GGJJOQ86rgzRO5ktPmiYrUC5wWsd/yj+CsQNvjxF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IDboQROlT8T0Bx1nvXCAUfGePfryK0PSYpDOGTxx13c=; b=Khkf8ALkiyTn61QeGFXxO/XoDg
 tDRB2Mn7wWQJ6yImLeHSIHvaaofb2Rdpw7kxEZIUfIMKVV+HiQKKLTYRQyMh5AN/9BSY71gew38AI
 ionig/ROZrCX8o6yVFxbOx3hfAo+Up/ZjCBjgKO3Yz/D4Zby2vQDVjHFsHnUTfQBWxJ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2eg1-001hUg-Rc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Aug 2020 17:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596477301;
 bh=F9J1NDKhlGuaR61i60J1kZCqAJQw5HbTND9VwIKUQZw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=p1E5Q+qhC/Ckte/Cs4JZx0YQrT80BjjCjWMFkjy7hr2vR7O9dQ+f8Iljt10f5yf4+
 Ook3zT+75+ndAgojyiZ770s2Sfp38FTOZPqccmXfWr3N7mvxrYJlI3ogJFZLNbH27i
 VQvhWaqNwgxnGc+5N2/ejl7odEAyBYTS60r1xfjc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200803070730.GB24480@sol.localdomain>
References: <20200803070730.GB24480@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200803070730.GB24480@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: f3db0bed458314a835ccef5ccb130270c5b2cf04
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5577416c39652d395a6045677f4f598564aba1cf
Message-Id: <159647730180.19506.8428131408463045290.pr-tracker-bot@kernel.org>
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
X-Headers-End: 1k2eg1-001hUg-Rc
Subject: Re: [f2fs-dev] [GIT PULL] fsverity updates for 5.9
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
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 3 Aug 2020 00:07:30 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5577416c39652d395a6045677f4f598564aba1cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
