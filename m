Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B295CAC44B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 May 2025 23:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:References:In-Reply-To:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArxR585EPbL8CZ/pZWyBij07OLRP1k63A91Py7NJS4o=; b=E/UNaqlXkU34rVuZms6VqQu1R7
	MHw+Rf16ZGPlMbNkrjFSZatRYjJGF1+tS2MMrR4RRS1xOKtGwo0fOjmuZ0zDbEgCKFHxZ2pEgnVGX
	+QVTb0yipXFFxVPigiwqJAQz9NC5CiBhCeuln0RHmSoTpb9GcrLo1LSYDdpGnqT99fkQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uJfEd-00028j-Am;
	Mon, 26 May 2025 21:19:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1uJfEV-00028X-Ke
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 21:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tEBD6Ha5krA7xwKofxbDL/r16wo2hvLMkrfPFbJaQBA=; b=E28N8mboTTkPufG8hT8q3hdG8X
 h3T7A013YkIFndJ9cEnDkRy1iSinPiyR2/pBSC/0kACW72cWLlDJR5i82Q077lOAFF6+Oq5GFnufL
 Mq870qC+OmV+DDAY6CTU3du4YRjW3YwiWTVepc3mEV6QVcok7OGc1+3nQMHhPjdNP6c0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tEBD6Ha5krA7xwKofxbDL/r16wo2hvLMkrfPFbJaQBA=; b=JhsKsboFxAJLWDCiSDm5Op+8Sk
 lB2nDBrBa3FJC/ZoYx8Mr/X2J6XcuevztPtCkMDeKR8rzMd4cu9S+SnznNKbw26k5JhbZxA7mIdMd
 jRlJeEtaI4LpHpJsDW8ch9R9Z+JZF1Gvekv5Qws90zhiPsLRjsG72ThGRtanNKYMqcbY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uJfEV-0004C8-17 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 May 2025 21:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 40967629C8;
 Mon, 26 May 2025 21:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AE4C4CEEE;
 Mon, 26 May 2025 21:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748294376;
 bh=55RHTqjxFPps4bWXmQvG/ltqDhb9qkxLQ2n7TN75cJw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rp7RU9VtXlusRahdYSksxE9lLtV9HOJr42BezDr9peiaiZnBSY6kyMiNy9HcVtbno
 GHPXBqRDPy/VnxYpvZzH1hu+O8Ns7Qtm/cY5tthKpTaa1Nx+fMGXv+e8x6A/PbBbdv
 QMpGIKEn7mRJHI/Sp6QiorBuBAYgRQ9L1M9l4mAL9M9TrIDIFRJPgJn3mCYHgaqbJ0
 WMfn311LS2+2SjNkyNWqCU/NrgPSdoGBeKQOImmXh5zc+8rjR6zDwrTvmr6K5DChGP
 chafSzXsKq6cbk9BVRAirpq/TcqnkmfA5WXK2jy/+YXNbjnrzF//rpzTpK6pRjoIXj
 TJh+vKC8R63Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9F0DD380AAE2; Mon, 26 May 2025 21:20:12 +0000 (UTC)
In-Reply-To: <20250526011159.GA23241@sol>
References: <20250526011159.GA23241@sol>
X-PR-Tracked-List-Id: <linux-fscrypt.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526011159.GA23241@sol>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: c07d3aede2b26830ee63f64d8326f6a87dee3a6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14f19dc6440f23f417c83207c117b54698aa3934
Message-Id: <174829441147.1051981.9323787415682692074.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 21:20:11 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 25 May 2025 18:11:59 -0700:
 > https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/14f19dc6440f23f417c83207c117b54698aa3934
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uJfEV-0004C8-17
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt update for 6.16
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
From: pr-tracker-bot--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: pr-tracker-bot@kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 25 May 2025 18:11:59 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14f19dc6440f23f417c83207c117b54698aa3934

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
