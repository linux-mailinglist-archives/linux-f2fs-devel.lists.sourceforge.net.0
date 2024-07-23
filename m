Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8893A94F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 00:27:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWNyQ-0001kY-3v;
	Tue, 23 Jul 2024 22:27:10 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1sWNyM-0001kQ-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 22:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wcu5jVYDYf86y3bHjgGcJJaBsSQPjmogGmL1CMTX7dY=; b=ihTXzi4ctd1SsL8h9UMPfTxioJ
 7H1nT9GhrQZ4BK4YKH7RiS0c/q0GEq6OXS1cA6FejyqqW0DinhikFOFQtfi5yaMnC7qMVgKEWOpQN
 gHYoh9aLxYaprK1zaWY9foZdtzoarEQ15I3hI+L/sqq02v5Lds8RKfJxIGhJu/+hB1Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wcu5jVYDYf86y3bHjgGcJJaBsSQPjmogGmL1CMTX7dY=; b=eItmEZTE1duh7LgrzHgxnZf8j3
 DWNeJLZ1KAuXRNubwaaDV0SwTq2KdUOeZb1xWM9ZUbZpBWY1B8tf+73FsveMIhbSqIJ3Qn59G4uW5
 A+L3VnWKPr/5KbJm6qwPtNLEQrbl36JoRWWqTR4vpz6CKhfmlHpI46Y0gsofowiR7g4k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWNyM-00089r-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 22:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 670A5CE0ACA;
 Tue, 23 Jul 2024 22:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B93A0C4AF0A;
 Tue, 23 Jul 2024 22:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721773613;
 bh=fULLGUDLIeNFvBBZga9l8thWsOiKQb2dvOik5/OIF+8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=MzQhbo4B+oeyjz5d4pJn5rYePGwmg+cGou4LiiBufrEvi5+JH0ZJWP3bjrJhxkSkQ
 vMMkeOdgJs5Ioyn6F/FBNqKwBlvSaVNPZba33uusPKomufezMGm6r7PdAul6xpcSV0
 OMVk+Y7Xq4/08GezLSYmu10oJffUVqCvtus/+0JOkmLHAGrBxy4LRfDluWjUMVTv35
 fFaOdTD/qBale7YckLAieDrZgs/qMLgfb0HTpaoPdZxveVJPkOpshZ3p9eKlULOVgX
 Kn99Kf36tvyUUoRLlDpou8oWZBOyq+0IfKali6gF/K1CAkL2xhDBznc+nZeSncP2Kq
 XSw57TNf9YFjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B0A84C43443; Tue, 23 Jul 2024 22:26:53 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZqAZZAmghKIaBAkJ@google.com>
References: <ZqAZZAmghKIaBAkJ@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZqAZZAmghKIaBAkJ@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.11-rc1
X-PR-Tracked-Commit-Id: bed6b0317441d82c32506750ccd868d83850e6f4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ad7ff8738b8bd238ca899df08badb1f61bcc39e
Message-Id: <172177361371.759.11999095889182184443.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jul 2024 22:26:53 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Tue, 23 Jul 2024 20:58:12 +0000:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.11-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/5ad7ff8738b8bd238ca899df08badb1f61bcc39e
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWNyM-00089r-Bd
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.11-rc1
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

The pull request you sent on Tue, 23 Jul 2024 20:58:12 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ad7ff8738b8bd238ca899df08badb1f61bcc39e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
