Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A45A88FD9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 00:57:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4Sk3-0006ai-Ms;
	Mon, 14 Apr 2025 22:57:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u4Sk1-0006aa-Q2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRAA6Lf3JDp13xKQrD70mxdEXMxv6ObetRbXRpZrm+s=; b=NGiGKytQwvO+WhW3NXG1xmOq2q
 WAuQu13bHSoFf0D3qdgvp2ULoFuFddp7DBcqH12xqi6pdms5e8S+tO7pzTbLjnuaD4Q3k9nSZ9E5/
 W1M5NHSE6NhiXq85KzX4Dol+2uHGkrrF+lb6MmHFYh2LLBHSrAOaakOhbDAfejMblRMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hRAA6Lf3JDp13xKQrD70mxdEXMxv6ObetRbXRpZrm+s=; b=g
 aWSd3siEcyjRfxk2b6WhG7VX5yHK2PIjnVWOCo2Jf8zUYVaXG6qMVFipDuzd4LUThDvoRKbCqGGvt
 ItbDLTwWnMoWdGjSTdjQNRw/5AH3WgcTKq0/Ka7xO581EjAu1Vx6yI6iujmATV51BDS2jj9j5LHqW
 Em+iD0QFsVwV4Sc4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4Sjm-0008TE-5Z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1A09BA4A320
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 22:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D864C4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 22:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744671419;
 bh=WaqPplhmdTSFQnOLmxRjJQsPw+IyIbxiWb7h0lDVjtk=;
 h=Subject:From:Date:To:From;
 b=TEHd63xccXQDPHebaqrw9T5QWGhGH/oarX+Bg4DZCjHEoObrNGYCxTv5RMminotDh
 pNYWCwLn6a8miY1O/wUajXL+JDElU5zrkPJm3agAZrBB/ChemvgNpZkrvimVCANGAU
 T2SIIBLlSdROWB1CR2+x300c/Fs1n4KfzB2nG/VIo5K3BuOVjLk0JIxmCuD9g/VW9K
 qH6PDPfzr5erYBb/oiySzfjp5i72BHQHsQarz5X2XFeSYHSjARv5nqFYFTbZEl4l03
 Fq2l1IhagFoPbzTYA5wOgWW4T/W+HZqVIIQYGT1/6n/mhfCwClfAoYbg/qLthoThUA
 Doy6B7HVAnH4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 712903822D1A for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 22:57:38 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174467145710.2060374.14965276535756720909.git-patchwork-summary@kernel.org>
Date: Mon, 14 Apr 2025 22:57:37 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: prevent
 kernel warning due to negative i_nlink from corrupted image Submitter: Jaegeuk
 Kim <jaegeuk@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://p [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4Sjm-0008TE-5Z
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: prevent kernel warning due to negative i_nlink from corrupted image
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=952781
  Lore link: https://lore.kernel.org/r/20250412214226.2907676-1-jaegeuk@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
