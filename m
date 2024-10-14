Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC399D7F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Oct 2024 22:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0RPC-00028P-8b;
	Mon, 14 Oct 2024 20:11:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t0RPB-000288-0J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 20:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czBPC9OXCTtPyhETpLjJyjOliCbTOfZKZyp7LOiV8U0=; b=l8/7KGuLFFrH0e0daAY+kJs/Cm
 gxpD0bCm1RkKkBtENGlZ/yWXo0REi05BMB1OCbgQW70M1zU3i3ipxrsE6fx+QOGUXISl21J8LKx9R
 3fRm+MiCpUfjV9kOv6Saq2zb+jqzew3veW2tDSrbe5L9dYNKvtSBgew/0SFTisZpvhQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=czBPC9OXCTtPyhETpLjJyjOliCbTOfZKZyp7LOiV8U0=; b=V
 p8B3tpx37lF5YLYuSE1wvD3EtuNDZK7jtslBKo5eo/dqlxy+13mx8OwJw+pPo/SGQfMU4LAw+CZEG
 N8I2jhZDujRW4nfCcc30OV+NGh+Ywn35Qc2PkEd8sm3eZJaR9b3fKak6M689u1ZujfBqKv0VK8nFs
 sixOKoe2qGSO99PM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0RPB-0004dy-5B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 20:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 687315C5857
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Oct 2024 20:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E364C4CEC3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Oct 2024 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728936655;
 bh=S0CSAtD0BSyQc4+MFVuKLBjQwJtL9aDUD6wY+BdkueI=;
 h=Subject:From:Date:To:From;
 b=mllAqEfSsWpQhpPA7VPSzshShlQ/3cM8vy3NF/Rf9l4xUEkA/lP8nr7IA50kCnzWi
 NNy94B2Nr6HjzPHDkuZuCyfppVZLZH1ynOOTO9p+RoTTAe44lBDcQU0IZlAmvGdcP1
 LMOrwX5E1PJ9yTRtaa8GRHAVQNWRVpGVCw2pOJSC7mGMt2nODqrqekY5no8B1oEdLZ
 sBwfMTIDOJDmhXeogwtxpD/IPI/Farlpon3B67HXhB+2ssm8y/lHE8XGTidcth2RSP
 HegCNPsLJMpe3dUbf2AWIhhd0p0PEQCVw78k9clb4pDGGW6UDfAl3SAelWeAo0VHDC
 zU71vobVKeqqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B22383822E4C for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Oct 2024 20:11:01 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172893666012.626029.13736342461794512993.git-patchwork-summary@kernel.org>
Date: Mon, 14 Oct 2024 20:11:00 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,GIT,PULL] f2fs
 fix for 6.12-rc4 Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer: Linus
 Torvalds <torvalds@linux-foundation.org> Patchwork:
 https://patchwork.kernel.org/project/f [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0RPB-0004dy-5B
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

Patch: [f2fs-dev,GIT,PULL] f2fs fix for 6.12-rc4
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=898995
  Lore link: https://lore.kernel.org/r/Zw1MHWwr3fRgJpLr@google.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
