Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455C400CC1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 21:01:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMaua-0000ZY-Gm; Sat, 04 Sep 2021 19:01:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1mMauZ-0000ZN-6c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 19:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9X9t2645+qcJF17DQUZLCqo7BH7bEjkqL8aveb2NzY=; b=SowuXfswQ46ShAJqyuaPOo7XYe
 WLPElLZ0JYpIEMrizo0XvFRD0l+AAmNtFyEkx4f72QiB/TI8vnZUlvKMy2oqjsFcMRxzKn/tdhH6M
 Tv57H9zTNyzqXlnBCmCWR7tOiFcbpGB4vVBzmOvVrSel3eARAQ7rP2qG2AXQH8ws041M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A9X9t2645+qcJF17DQUZLCqo7BH7bEjkqL8aveb2NzY=; b=MBKnPH+XoQmniMfLALC+R5GZQQ
 iry/r27I5AsEki5V+MVFqGivhsHSJqYhDU4kvyQXgdLJQ7nT+KxifkSRv9H7hBrqYR8hJqPFnM/J0
 tZ6dWn1gKHXpWHi17jGFvRAQcVgR8pZ8IcA1C0c3uP+CAAtDRQr4HEsZc4UnCLxi/kMY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMauV-0004JM-I3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 19:01:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 3720360F4C;
 Sat,  4 Sep 2021 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630782053;
 bh=4CLYOVf27HgI3udSKJqInt4iAK1gJXz2phwQaoJk8XI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=R0CfTW1e50Q7e89xLf1r4hCQ7mS9CyXLkCzK/qfkU0pma+Y+258hnjIExbPYhz4rg
 szqGY3Yqv+FTvRdUkXMWocePS3V/HKvgyYfaY9Nh4daiMWOeKbUAX9bs9obCn2t5IB
 cRRdovqlgp7hFLv4j6sb6sZG56Nd3Sim9TUrYypARPdTyEN9SIu0jDA7CS9IDdZkFH
 mdFtM6b+nwFzuwIR+ydUsy8Qg210ftFCsAjeMh660k4Tz2KOscZMQCn64BXDuEprgg
 ZYD6acdhBt2nmp4MpobYcf7SIEU2Y9HwQ7HEcaM0hy7Baz4bxL1Y16xJRhZJFZLDg8
 c+ZPrG4amJQfw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2FA1560A3E;
 Sat,  4 Sep 2021 19:00:53 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YTLLgFTaal2+EC1c@google.com>
References: <YTLLgFTaal2+EC1c@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <YTLLgFTaal2+EC1c@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-5.15-rc1
X-PR-Tracked-Commit-Id: 9605f75cf36e0bcc0f4ada07b5be712d30107607
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6abaa83c7352b31450d7e8c173f674324c16b02b
Message-Id: <163078205318.10287.7643558945708241474.pr-tracker-bot@kernel.org>
Date: Sat, 04 Sep 2021 19:00:53 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mMauV-0004JM-I3
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 5.15-rc1
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

The pull request you sent on Fri, 3 Sep 2021 18:27:28 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6abaa83c7352b31450d7e8c173f674324c16b02b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
