Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4491A7407F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 22:58:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txvEn-0003r5-MC;
	Thu, 27 Mar 2025 21:58:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1txvEn-0003qz-3L
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxkKsPzdKdhchIs9v0M1iPuuLw61lawIt+UEvYURc4I=; b=PJZUA6r+xrrgXyPvjItS60lVtq
 l6KeGOMlco/pLPaZLSTgGTYoH9cfl4aKmbj+6FXhWfwUMMSk844MjfK+OsHGSrTOu+u7qSqGHrbrh
 qMuCWv25wW/SXaDyzxoWcnsbk5bqtLKWbpM9xcwNbkpVy+z/1Fo34wzsnC3LYFAd4d3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZxkKsPzdKdhchIs9v0M1iPuuLw61lawIt+UEvYURc4I=; b=U
 p6uZysn3LBtiOlTWIi+q6FpjFhjFohSdgL/pguRrmn918R/Yfbv3rFN4mk8dONLmS22ijdyxX53WN
 HUc9Cl+m21MtFDV+F00RdwPvhaJ+NGO1MIEF1n1LlCx33ebdW0pnixl5iSzFFTks/Gi+KRCMvM4B9
 VEGp0O7Kg5jSFDBo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txvEb-0008UV-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 21:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E684F61134
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Mar 2025 21:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5C0C4CEE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Mar 2025 21:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743112666;
 bh=uSNylkhivrfDnGUMNRU+z0/PDaDIWJyQ+YkZ3WTArUU=;
 h=Subject:From:Date:To:From;
 b=ucumk6kP4iFeZotjauzi/yz/wrMjUVak34Z2VROlE2VhxIJxppwTaztN5mCD3eZZv
 IdQ916ffNcx2/dlCXJcJo7FYNMW9ERVpadH3/P2X0U6nh1aZo5SdE2IkpjmB/YFpLM
 yXCXUhzibLxgcn/fYAQfRpzI3PmuEJ9ExF+kWqp4lo4Ejpo6ubXTrU/o9geCtS1Exj
 DpN68YdrgZzN0nBzvnJfbEr16M4EyrvQODNKjRtyIxr51piP1rd3HqFaWVpCqvzrv4
 rdKpecQQib+ztXQXgqcGrY8NUqXCROfA4jmg7reouDeCB2j2vbmMbogHtEBcWDVcP8
 2pSjyBD2uriaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 37FA3380AAFD for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Mar 2025 21:58:24 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174311270272.2230226.7475946395298840680.git-patchwork-summary@kernel.org>
Date: Thu, 27 Mar 2025 21:58:22 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,GIT,PULL] f2fs
 update for 6.15-rc1 Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer:
 Linus Torvalds <torvalds@linux-foundation.org> Patchwork:
 https://patchwork.kernel.org/projec [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txvEb-0008UV-P1
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

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.15-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=946897
  Lore link: https://lore.kernel.org/r/Z-GPopTYCOl0hjp3@google.com

Patch: Improve ABI documentation generation
  Submitter: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Committer: Jonathan Corbet <corbet@lwn.net>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=926550
  Lore link: https://lore.kernel.org/r/cover.1737135484.git.mchehab+huawei@kernel.org

Patch: Improve ABI documentation generation
  Submitter: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Committer: Jonathan Corbet <corbet@lwn.net>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=928688
  Lore link: https://lore.kernel.org/r/cover.1738020236.git.mchehab+huawei@kernel.org

Patch: Improve ABI documentation generation
  Submitter: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Committer: Jonathan Corbet <corbet@lwn.net>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=932185
  Lore link: https://lore.kernel.org/r/cover.1739182025.git.mchehab+huawei@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
