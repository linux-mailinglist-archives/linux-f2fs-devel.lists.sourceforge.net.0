Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2A82A26A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jan 2024 21:39:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNfLd-00008Z-Qe;
	Wed, 10 Jan 2024 20:38:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1rNfLc-00008S-Lj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jan 2024 20:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X5q1teBbwB5mmq9RZRSh2py18QTkyMXNupl0pRhLIrg=; b=B46yPxZnJ2PAaT4bBga7ruksak
 j8ycenKBmiH+CmYuuvtCgYSBS91p82lGIkt/nmDQXWJtblAmk+wzLQmhYGNdo9npc6+TjvdTff/Z+
 7JxETjJjP8rswRTMEy/gNXvdoRj2YLm+OYytuERfGKfBzJMg5wk1WEkZk3neUAgt0ymw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X5q1teBbwB5mmq9RZRSh2py18QTkyMXNupl0pRhLIrg=; b=GEXqt6F1MascAIRcwCAjQ3cDab
 BTtbB+2CP7NRrq0oFJxTdfWB5ftU35fYYYCF2QlY3jkqd+7miMJibY+l5k2TQRTcAwhx3SW0XRzlN
 h65H6lQxtZFoGcSh0+Efd0DS5A3rHRypFWLq4ksxbBeX/7u5NnMZezV3eMHICjwwkApE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNfLc-0000iH-2C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jan 2024 20:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91CF5618DB;
 Wed, 10 Jan 2024 20:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 341DEC433C7;
 Wed, 10 Jan 2024 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704919122;
 bh=VoBIQapusZ4NUreEbntc7ZhvKgj4PwK6SluWX86qojE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uapCWLkuRiRIyJGZsklMx2/2UUGdGsMtU2ypjC3vDi6dvXJasgC8G8bKPaF5qVXAM
 uTRiFw7jFYoyg6fLfvbVCiH6i3L2CuXpNAopX/euGweA15sfiW+pDfzVGOa+tjivuQ
 ErOb7d99SL39QlL/xNUyy+8zeJENVXiLkAYYLVYHZJqFghL0WG5lQSYIB/V6YTolvd
 bZejodSaIgdAcgkJpTKlEZ8PTpbE06ZfX0taBUuOco2z7P0YHOGfB/pPswmQOlHDRd
 iTwAmZLE1mBgXmE/5Xn+m9T4AF7x4ZtyzwxnCUIZ6I7rvVfZt9Gn1O1BSjhwdqPcp7
 yqHQn8WaL1Spw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 19644D8C96F; Wed, 10 Jan 2024 20:38:42 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240108224811.GA94550@sol.localdomain>
References: <20240108224811.GA94550@sol.localdomain>
X-PR-Tracked-List-Id: <linux-btrfs.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240108224811.GA94550@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 2a0e85719892a1d63f8f287563e2c1778a77879e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 17b9e388c619ea4f1eae97833cdcadfbfe041650
Message-Id: <170491912209.22036.13299280209691198905.pr-tracker-bot@kernel.org>
Date: Wed, 10 Jan 2024 20:38:42 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 8 Jan 2024 14:48:11 -0800:
 > https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/17b9e388c619ea4f1eae97833cdcadfbfe041650
 Content analysis details:   (-7.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNfLc-0000iH-2C
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 6.8
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
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 8 Jan 2024 14:48:11 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/17b9e388c619ea4f1eae97833cdcadfbfe041650

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
