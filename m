Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2B6EF8F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Apr 2023 19:06:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pribJ-0002Zu-RT;
	Wed, 26 Apr 2023 17:06:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1pribH-0002Zo-VW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Apr 2023 17:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ZbEovEF9JawLxrJxyHJKbZvtckP1VA0PpWUYj9ZTqs=; b=ecPdjYhTgptcm2f0JgenYoAese
 z2bJNXvnwxDFgBpVE/KwAdFfVyThf5PsfAXjMlre47qOw/qP1WZ48LxrRKtx3ILyzhXKe2HmV49nK
 EzqLHrKqKFMTrSZk3MvhfIGQFe5fyppkttG1t1fl0B2zZNNl2EMCC74blh6ijE4uhl3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ZbEovEF9JawLxrJxyHJKbZvtckP1VA0PpWUYj9ZTqs=; b=fSVbXb4bd/+qiS14wGHNxdbsNn
 MFNa9d/zGf3y0FJUn+kzkwGEomXTtYvxsLqpNwsk5gv7GxpJXU/botFVqktFh6Yw1jNWC0uPMJPOu
 CDuuEpQsi754EDkqNqujhjIS1MZdg3fGkejG3fw7nfpG2ifVM9EY7wwlOBYbl14IouGM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pribH-0000yk-OO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Apr 2023 17:06:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6232F637A8;
 Wed, 26 Apr 2023 17:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C348AC4339C;
 Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682528793;
 bh=H7CqWFVpUAw/7Vebh4PMhNuemBm3Kab4UTdTT4iLd08=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DEMYUFhQsMwcMQNy5WQIluRStVTy7olwjSAvWFsxPtCnjPwDeumiltCpE9b5Wy+cv
 r5m6tfK+OoBGkMYuVExI7id3ljE0WaAeqcj+uADGn8NGRlqSktNBUWaglEYReGccQV
 2bZ0EWIRnL8tv+MJ7pTxillWesaqJyGnDAL5cLDic14f69ho6POULwX1d8BMCeUEQj
 FqSENLMcPbxaVng/QqEnaSFVEGej70RXyblsG+A3OJROcliyE2IYhpKYT6KS1RRMzP
 /+8rRyw5tm8pIbwiKOvpm6T9vBOFybOFDN5rGIHut2JRoqppEP+JKO8JStnaQqhDYi
 7LBiVfXJTOn+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AD487E5FFC8; Wed, 26 Apr 2023 17:06:33 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZEgdmJWhJX9NJ0fG@google.com>
References: <ZEgdmJWhJX9NJ0fG@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZEgdmJWhJX9NJ0fG@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.4-rc1
X-PR-Tracked-Commit-Id: 8375be2b6414577487486a92995bdc97a7934033
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c7ecada25d2086aee607ff7deb69e77faa4aa92
Message-Id: <168252879369.19907.4817770283995017833.pr-tracker-bot@kernel.org>
Date: Wed, 26 Apr 2023 17:06:33 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Tue, 25 Apr 2023 11:36:08 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.4-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/5c7ecada25d2086aee607ff7deb69e77faa4aa92
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pribH-0000yk-OO
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.4
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

The pull request you sent on Tue, 25 Apr 2023 11:36:08 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c7ecada25d2086aee607ff7deb69e77faa4aa92

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
