Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A0C8CA34B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2024 22:30:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s99eQ-0002yS-RM;
	Mon, 20 May 2024 20:30:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1s99eQ-0002yI-1T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 20:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g8ILL+ZtcVtw6Zd9V81duNKSDK4CB8qSYT1cFsUFQmU=; b=nI+BdpV6ht6V4vo2EGvU6AThor
 qtjljMiJQ8CsI1Jp++TFF0zJbd8b6j01f6mLsU7OMAymTU4Ja/B1vt8/xcAAcRX3Dq1Q5v4uWG+pU
 H5hfxTfdEacvgcVKi/ncT7jHA17BFXCSMojm/Oli3fdz0XMreF1vxSmEC3DDgcW0rFHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g8ILL+ZtcVtw6Zd9V81duNKSDK4CB8qSYT1cFsUFQmU=; b=H4w0ybL1DE7HFlxAdRVHvRHlmM
 Jjb9px+s6xRwrtmNJXQl85FfB4waiEs+68Cfl50bXH6VzehieA2DOS7dTnzp+ulijVGUQ24LJCqY9
 pHyIY7gOEwBB9Eq41lohWRuBbYEYbs4Tjz8LHV+Czr9qpY9Dx/Mt8dtFgYTrOR4MWSJM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s99eQ-0003Jj-Fi for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 20:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F23961E5B;
 Mon, 20 May 2024 20:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B4BDC2BD10;
 Mon, 20 May 2024 20:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716237019;
 bh=LXSUUECeY4XGsL7QYyf+TXUuVGBlieNNwYUMtHidaqE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OTb+EUbAbXv9bhBO4rBXIP7Cx+DlLSsv3bcc0BuFmCPtCVxlCHbwxP5iOl7qUtz9N
 HDumJOrV7UM6ZFsUurMdEO5ZbxPSierzoDds6ShQtdOT5Of88+NZP8D8d5mN6tACbm
 ZE/eosaEWWgfNNc5z10D3YPAPDAGxofvX4DwnLm6Lt3Wo5ssGiTyND0BuUQa1JO61q
 QLB5bAAi8RAiHaPQECx4xEc/PIefs6itzXkaRo6ZgwPy4gw7w9/flLL2ZW2uZ/AS2u
 RqbPNUpmYZsr7Xt9Ala9Pcx0iBzUPYZmkiNa2dMw+vDDfhIhT3QqZ8Hahur0Tai64o
 Cb+U0Pz9Erg3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EB91CC54BDA; Mon, 20 May 2024 20:30:18 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZkumXs7POGImbr-k@google.com>
References: <ZkumXs7POGImbr-k@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <ZkumXs7POGImbr-k@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.10.rc1
X-PR-Tracked-Commit-Id: 16409fdbb8828d7ae829bc4ac4e09e7ff02f8878
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72ece20127a366518d91c5ab8e9dd8bf7d7fdb2f
Message-Id: <171623701895.8142.8608336086340569971.pr-tracker-bot@kernel.org>
Date: Mon, 20 May 2024 20:30:18 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 20 May 2024 19:37:02 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.10.rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/72ece20127a366518d91c5ab8e9dd8bf7d7fdb2f
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s99eQ-0003Jj-Fi
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.10-rc1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 20 May 2024 19:37:02 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.10.rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72ece20127a366518d91c5ab8e9dd8bf7d7fdb2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
