Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98F6CF145
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Mar 2023 19:41:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phZnu-0000fT-Rc;
	Wed, 29 Mar 2023 17:41:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1phZnt-0000fL-Sq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 17:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxZwgblZkPGKnOC0uDir98boint6jxZnXEWE1UNhPZ8=; b=ayMTWxdT/8w7IMStvm4r2cvlJ7
 AHIFWQRGOzg1E82bWoAtADpIekQj3vikGIBO7kccfBortMcwA1o3k/pyFYwAbM2bWzFiBXZrAUQ5r
 0KmwKPT8nMc74FK7J14n2ICMTdXD4nKvRTfwSWg7V7zUBp38utej5zC366MAjtrwiaKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZxZwgblZkPGKnOC0uDir98boint6jxZnXEWE1UNhPZ8=; b=J69tj9+k76Y8YnfDho2qM8XaQs
 Tt197iaxZAKDFvFXgQAO4udb/eXHwQsJwqZ2kQOVfyy78I62+cndmumDAOGFJeG3oxXWGCEqedFy3
 yo7tGnNGMtbxRee67DFKIRmswJhvhbk+kqxYquuTP5IQWAQ91Mmi1I1kdh7W2S/rICIw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phZno-008dlV-NW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 17:41:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CD9C61DE1;
 Wed, 29 Mar 2023 17:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B034EC433EF;
 Wed, 29 Mar 2023 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680111694;
 bh=ObuytjLa4eeOivSqVw0xJwNboKHFJrAVMi7DBvLkeaA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Z1UBfquvMVr+iBan9HL0t44w0BE0rH6y1o2scmZr0QdCcFABNdlrSPb6288hckwm8
 bxDobx2kWiNjcIJIlWc+HzV9uXuwQTCfWXvBqUzXXocFGy9HcCNy87JRvahu80sFYu
 F4ntOs0iQzxHJJYYRTZ2H7bwqsDOy+1kJOeq7O1rYQalejY+c8n1igw8ZSycTPPE4R
 KUi8Ti/lIAW9KPWjue51Lk6I+oydntU/ju/VU2rlXTI8ryQr8PnhPSWPoi2ONHoeuH
 w8jJHfeY8EvlFxJ3nooywEkHOpOz6b3KrxxFTHkepTb6qL9cnelFPGrnRQ1qD8Rpok
 xdwlo2UO0LvdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9481CC41612; Wed, 29 Mar 2023 17:41:34 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZCOHd4jYn8zUCEZ0@google.com>
References: <ZCOHd4jYn8zUCEZ0@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <ZCOHd4jYn8zUCEZ0@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-fix-6.3-rc5
X-PR-Tracked-Commit-Id: 0b04d4c0542e8573a837b1d81b94209e48723b25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3577a4d37f9e5caeb817e221482385151795ec6a
Message-Id: <168011169459.2257.13514222310679539779.pr-tracker-bot@kernel.org>
Date: Wed, 29 Mar 2023 17:41:34 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Tue, 28 Mar 2023 17:33:59 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-fix-6.3-rc5 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/3577a4d37f9e5caeb817e221482385151795ec6a
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1phZno-008dlV-NW
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fix for 6.3-rc5
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

The pull request you sent on Tue, 28 Mar 2023 17:33:59 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-fix-6.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3577a4d37f9e5caeb817e221482385151795ec6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
