Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DD55ABE5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jun 2022 20:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5AYA-0004zF-Dy; Sat, 25 Jun 2022 18:30:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1o5AY8-0004z8-UN
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jun 2022 18:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pvia6WMF9UihaQJWJ8/cG+QDTKLdfe/jLZp8wGf7jc0=; b=FZ4wsT4Qtbq8ZcEwmZNMYxPQpg
 FLAfue2Ms17EDiHqrBwOXMiQ8uxZqLf5cx/xeXxADcGMbaFsnfT7eo0P+g4CPxX0Otny7paGn43wC
 SmauaJS9sJdLulLPFGRaD1TEAKCtsxD/sYC1zCTA4WPhmbgf6HGY5BR1jPX8JhQy2GaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pvia6WMF9UihaQJWJ8/cG+QDTKLdfe/jLZp8wGf7jc0=; b=g8UarURtuBivx+Blwvuw9QlirM
 ZSdmitGpGBVLXvCXWQ1OAxdfobZazlczvMVAF82SAix3DdodwHGpfOR8r7x8aSTq5Wc6yB+98fmel
 dFfJSp/pydsvHq8u+3BKdJOPRiNQNd/iE7UpVvd3F7KFWAIT5N2eXgrQ+moNoQXFCnvk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5AY4-00DZnf-5u
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jun 2022 18:30:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24FD5B80B9D;
 Sat, 25 Jun 2022 18:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E415AC341CA;
 Sat, 25 Jun 2022 18:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656181805;
 bh=p5lnAOp8Ka1Nf9m8kWcAqfb5qFPlAkmK//Hiy5DW9Uc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=gKYKhhN1y05s8T6AirLLQ/bTLm5zqVHxfdRU9ASvHPd3PxKqaEKYx90uIe09hzw5L
 kLORSOzufLJKKMFywLNE3ONEGmU3zXlUsr6NHnD5V9czyzvcTiPt1NxAzyxmeH2m3J
 2906Gaw4ebZ2rUuHgS67f9xohXduAov9UO+RJLcFTU8IHGprIFU1U68yzbc+WcPDQE
 g/Ngjp67zqanY7Zo6E1Dsul7VKZ3c1HnNBvHY5kYMNpYamF884ZftH3WxHkHvaIDMs
 82iX3pmF/gw37X9uddlkhHNq2QCP75wgK8LqnioPJwJR67ipwAeofchGbnBonGjz6O
 smlsXmNygJ7lQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C9CADE7386C; Sat, 25 Jun 2022 18:30:05 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YrZZmp8qBSDM28iy@google.com>
References: <YrZZmp8qBSDM28iy@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YrZZmp8qBSDM28iy@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.19-rc4
X-PR-Tracked-Commit-Id: 82c7863ed95d0914f02c7c8c011200a763bc6725
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29eeafc661f283a7412ecf8d9899a5ffd0c80f59
Message-Id: <165618180582.26648.18370768969071109222.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jun 2022 18:30:05 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Fri, 24 Jun 2022 17:40:58 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.19-rc4 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/29eeafc661f283a7412ecf8d9899a5ffd0c80f59
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o5AY4-00DZnf-5u
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fix for 5.19-rc4
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

The pull request you sent on Fri, 24 Jun 2022 17:40:58 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.19-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29eeafc661f283a7412ecf8d9899a5ffd0c80f59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
