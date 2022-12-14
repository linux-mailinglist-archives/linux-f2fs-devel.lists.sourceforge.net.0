Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257664D376
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 00:32:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5bEX-0000cM-KT;
	Wed, 14 Dec 2022 23:32:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1p5bEW-0000cE-4f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 23:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hNIDcEq/Wgaugy+dc+6uFEiL2qXWOnXQZgXhdOyZkRo=; b=md5ar4aro2QPB2ZLlyw35YL3BM
 1td7ZMn8qg2a29S/lPAcRlsGNPn5eZ7Ed27yGvwB6LoNmwtYZllWuPUwSYigpnAjn6TOTla84yB5a
 hARTnoTFNI/elY32Jx1fcrIO43i0cxL7O9tSrVTbQ25rzvqv3IORMrQ3aQizyQTL5dNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hNIDcEq/Wgaugy+dc+6uFEiL2qXWOnXQZgXhdOyZkRo=; b=md5Cc94TSe3da82EmxY34mgNd/
 0mBK2W0mrKQyurCmAbsTtWgmPDHbo1F/dg9Y52glIQ9SUvz/xFNhyA4chIblZX84jHaLnaljfkQd0
 J/Tjs8saOQqtXFBXUxpxgA48uWZwfalnG7dZujoRPyyiiVZfZdRc+OxQx3gaa7+3pahk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5bEV-00HJMg-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 23:32:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 291EEB81A79;
 Wed, 14 Dec 2022 23:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E79BAC433D2;
 Wed, 14 Dec 2022 23:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671060727;
 bh=C1oR475LzvcrnuKDhjJpDf7Nmz68L+U/EbN5VutAOZQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mGeuVTY48BJN/LPQFF/sajLxFX0sBmBybXTLBqIlNKNXZD0M5praH5dZhSL+u+5sA
 hgO5M0KSzFBtvW4cpiE3zEaPbpzEXbKa7Lymvy8K0AsWhT7nwGmXuimw7+Hfo5xCuM
 C8ZKc51lW/FR+CfZIFRNqQAolpI2j1/tYeoAfcp3bHNPb7iVFy8MKUcxByaCn/XHKv
 gk+gcfBv6e/Oqi+ZnhvrFM6SSRhGYBZWiNIEUrv9dCkQvLWL7P8Bs9E9SSwcYMcz8g
 N/YLfKG6zpICRfyCPWH8/ZrrBhfUDvZG9HtH8hlQmMN2obb75zZH+jxQP8THXlM9Sx
 pRkFVpx+8MwFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CB89DC41612; Wed, 14 Dec 2022 23:32:07 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5pQnBPCtfPkiCkF@google.com>
References: <Y5pQnBPCtfPkiCkF@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y5pQnBPCtfPkiCkF@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.2-rc1
X-PR-Tracked-Commit-Id: 26a8057a1ada97b528b93fdf3ac4fd03170f1900
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 041fae9c105ae342a4245cf1e0dc56a23fbb9d3c
Message-Id: <167106072782.28623.17181629431391785161.pr-tracker-bot@kernel.org>
Date: Wed, 14 Dec 2022 23:32:07 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Wed, 14 Dec 2022 14:39:24 -0800:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.2-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/041fae9c105ae342a4245cf1e0dc56a23fbb9d3c
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5bEV-00HJMg-Ct
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.2-rc1
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

The pull request you sent on Wed, 14 Dec 2022 14:39:24 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/041fae9c105ae342a4245cf1e0dc56a23fbb9d3c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
