Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F55182376
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 21:45:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC8E6-0004Gd-GO; Wed, 11 Mar 2020 20:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1jC8E5-0004GR-H3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 20:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+i3muPD+8G5NjEHsrC2AR3Vj9hX0xw6UXJUKOt17o/A=; b=IzZoApru8bxDC20e3P1x6A1zvk
 4p31aPck6mgx9uc1Yb3x+sfGVxauW2bHFCfJAp/992gj7w8wpanOHYPxhfDVMFMgD0AJp/0t1g29l
 jPO76X0iO3Ce8ukl+WpQXjtFMrED/qbBsZHUJdNh9OTIFzw9q9H1ks6xFzlppoJ0aMe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+i3muPD+8G5NjEHsrC2AR3Vj9hX0xw6UXJUKOt17o/A=; b=Jc3YCjGXvqjQxUwNDgQygCSCTW
 F0Z3L/PjZoi7q0eBmBF+lh1mS15x71PwUFkhrwZgdWXmJ/z3W3PvUhdwkdQL7OYH+3UtuE+ihahPZ
 wlv5EeUZtGz/fbkR6NhJd4AlkpN8xwQxcCEPICMJwNK6sqRBQ0dKjTtN6k13bX0Lk1Rk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jC8E0-008iQw-7y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 20:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583959502;
 bh=BpqMPqVMEExHAmwE9Beff6FPwRMgQuXwVzkTYS3rtlU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Xs0c8KJMFvlIzYcA40MhFlGm1IOWy8yJpK+Fr+m+FqJo0T4F6QMhQO5I8brlBTQQ9
 uN96LInyTlX1axYS0S+hFluaPchZGwlMsSGXC1kNPWesIoYBt+wReS3ilar28gicxk
 whhVJL8+3q1awpkbNsNhFivAMtRZl/XbkoeJm9ig=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200311194839.GB41227@sol.localdomain>
References: <20200311194839.GB41227@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200311194839.GB41227@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 2b4eae95c7361e0a147b838715c8baa1380a428f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6e6ec48dd0fa12e8a2d1ff6b55cd907401bd7fe
Message-Id: <158395950136.14877.831369511825672693.pr-tracker-bot@kernel.org>
Date: Wed, 11 Mar 2020 20:45:01 +0000
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
X-Headers-End: 1jC8E0-008iQw-7y
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt fix for v5.6-rc6
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
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Wed, 11 Mar 2020 12:48:39 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6e6ec48dd0fa12e8a2d1ff6b55cd907401bd7fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
