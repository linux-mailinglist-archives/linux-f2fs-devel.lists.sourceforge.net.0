Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92A82BAA0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 06:07:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO9lh-00056Q-Fy;
	Fri, 12 Jan 2024 05:07:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1rO9ld-00056K-QA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 05:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YxSQs7fwWpe5kvQCUDcLbGjiYGF6s8yYF05l7D0FplU=; b=D1tqFN3WpDCjO7DK1VkXTQp3nR
 /gnSfx4XlOJ0iSTCFiwBt63r8WvjdzN5B1Z5IoSwOggJb68MTIFaB5RCWz5GR/7ap1/nRedZgDLxW
 WOdPMQ1t42e/jkBzRmHlazECUunkMWV4BSSxQ1UUKoeIXv682OTmWoy/u7yTwJnllGN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YxSQs7fwWpe5kvQCUDcLbGjiYGF6s8yYF05l7D0FplU=; b=Wi0Hu5ntnvq2+8cS1nrF55cgX/
 nJ04HiEMiWH+Vnjqe8CeOeqOPToTj88U42cat60g3C6UIwjKrbERkbEg0swnKd/7QRO9RcLsAl/0f
 KijuuNGW226PmnuZAWHV+CnyHRyb+cF+JhUSNyPqlhBdghrLEdZJoab67Clpnbah0Mmw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rO9lc-000619-TA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 05:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 235FAB8217D;
 Fri, 12 Jan 2024 05:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74226C433F1;
 Fri, 12 Jan 2024 05:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705036054;
 bh=9uOQOWcu9589qjg7vOdNOoKIK2O4vFqMz6HYx7sCDuk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=O5SAS8bMY2jZfXvDunL6bUdvnTnnLSRufT+wj+BRND7pX2xIBs5nqid7FOCXwPcES
 NBJU928mpq6uFgfVzDFAYXWR0kh6kCzDCd6CSqh8Hm0g1LCzamUSiEb0olbUVZTfhd
 re5gZgVkuvgmgU8odbfHaXzTlWL47yVkucRqidoAingR/KYuxUopJkOAuoF+tzgQ4P
 QY3M/QC7W1JQoT2ph7KLO50M6pnib3ZyuGFI+sYsRodRF9BDWA4mvmD5aSnI0fPCA4
 k/YqYrKZJrrWXBH10gCcvVB+ELWCKHU3N75ONZsPtu8H8KywAlkAeIlfZDfHOmISEM
 CSSNvGYoeDVOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59A2DD8C972; Fri, 12 Jan 2024 05:07:34 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZaAzOgd3iWL0feTU@google.com>
References: <ZaAzOgd3iWL0feTU@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <ZaAzOgd3iWL0feTU@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.8-rc1
X-PR-Tracked-Commit-Id: c3c2d45b9050180974e35ec8672c6e788adc236a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70d201a40823acba23899342d62bc2644051ad2e
Message-Id: <170503605435.7299.7615566737748705278.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jan 2024 05:07:34 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Thu, 11 Jan 2024 10:28:10 -0800:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.8-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/70d201a40823acba23899342d62bc2644051ad2e
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rO9lc-000619-TA
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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

The pull request you sent on Thu, 11 Jan 2024 10:28:10 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.8-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70d201a40823acba23899342d62bc2644051ad2e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
