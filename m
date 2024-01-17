Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A886830DA7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jan 2024 21:04:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQC8x-0003uz-Nm;
	Wed, 17 Jan 2024 20:04:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1rQC8q-0003ur-P3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 20:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JVaYp2wXUu+uTl96qGCkZR7MkQ8L/Vd+3FiuDlWtI5A=; b=ai1oL+KV9HR7n1Wzwl5tZAU2Co
 ofLkjutwL+waebMu7QSwhhQUDV9abl44wUvwAi8VB9Di1kFbZDVq1HSIFpMRNlWA/nf9DjeGaC+CG
 DZjEtOaZZLIymedb27/VyKEGaG4XS8dmkKeHhDZNwwzRxhde3WRpwG+ClOQwiiFAfXbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JVaYp2wXUu+uTl96qGCkZR7MkQ8L/Vd+3FiuDlWtI5A=; b=GJI56o1cSJ+W+CKhJtAyQkDj/P
 3r3Il7vDjtkaKz6Vj7v1LufJ3+QjnS1KDTnrznec57n4E1mb8SDIu4NgM7D9viyeGhCUDtzj0E1HZ
 Aqcos3MJ8WmY/9wUvL2hsU5Zc2T1kpE+Gfo6wQ/Ls6Fulx8v9OaYvHqQYYNk1/VRiD7w=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rQC8l-0003d0-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 20:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 78AFCCE1D05;
 Wed, 17 Jan 2024 20:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B76EFC43390;
 Wed, 17 Jan 2024 20:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705521827;
 bh=GIuoqC8ylvl6PYBYBhLCRpXy9wMTOxKdxQBbw1jTHKg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RgmjizTyRzae3GG1BCfstmzn8Sr4TNfW99GmAwu/tob3DcKO3D/OLIJ5ZsCHLUiOd
 1ZikaQP4PyeXEN8V/dYpaX1dZQHkVKdx7pki3ZR/Y+akyERcqp1rTnlUylijfjurgK
 4gxLv+3rrnJUjqQQCoYavXqskyaVwg2WqT0q/lYzwCOn9jIlNg+2k/mLMO7heQ/pu5
 6CiX0YeOQVbxosUFxHmwAVbfIu7JTg05vjXFy7ZNJ/Ia7OHtbHTKPd3gIDh+fkGk1y
 uRHubKpQMZQzMfnLqIN4oYMV1mlYMbd8CrnWHEnqsgjS13+u81UztgKbLkJKy/xkpi
 dwMBT+UclZ4bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9DED6D8C96C; Wed, 17 Jan 2024 20:03:47 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240113175604.GA1409@sol.localdomain>
References: <20240113175604.GA1409@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fscrypt.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240113175604.GA1409@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: c919330dd57835970b37676d377de3eaaea2c1e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eebe75827b73b0a61e84acd2033ce304a3166d70
Message-Id: <170552182764.2985.5742337421585450900.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jan 2024 20:03:47 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sat, 13 Jan 2024 09:56:04 -0800:
 > https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/eebe75827b73b0a61e84acd2033ce304a3166d70
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rQC8l-0003d0-Fj
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt fix for 6.8-rc1
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sat, 13 Jan 2024 09:56:04 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eebe75827b73b0a61e84acd2033ce304a3166d70

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
