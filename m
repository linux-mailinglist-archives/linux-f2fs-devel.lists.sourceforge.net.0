Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAD7397E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jun 2023 09:11:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCETK-0003IB-RO;
	Thu, 22 Jun 2023 07:11:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qCETI-0003I5-Fq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 07:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GlcjJ9qsf36jHL4bwITjXm8Op1EslVAsC6Kssm1sj+o=; b=hMPhEy4uxdnFgKrUu/f9Yb3sO4
 icdeOgFm2Z6RJQKdLVIzu2QRl1nQoRGHiT0WUCrxxmCtuq9zxgdd08ppbx/9m81Ftry9XpcDeZVkx
 hz85FRTvxzLHIF9MAcTkB/RW7fii/Kqf77fHYro3TRP16wN/HnwvOJNv7cg8aPTIW5dQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GlcjJ9qsf36jHL4bwITjXm8Op1EslVAsC6Kssm1sj+o=; b=H
 NiWcE9HewIxzjUMdwLlobR4k4JoIckmiunwmcJeu8kIL8uToQeD0A9iAB1GreInujDs9njl4sboTW
 4PzGR3ngR3cWYrTUOfuNtDxa7FswMAjsiEaPxf5BtjJgcLetHojnvGOtUZ9Yq271O81Rq1hhm7wXD
 ZJCHV/IHTOXdkC3I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCETI-0006Ss-7X for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jun 2023 07:11:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCF2461772
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jun 2023 07:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D332C433C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jun 2023 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687417865;
 bh=3qYLhvUqn3rCW6JI5F1t7M/Ds+v5BaqHx2FmNwf5et8=;
 h=Subject:From:Date:To:From;
 b=CdjCEPEOgU4ufPaJ79HKmxEzjTE3/iwkbZumbl6bNx6UvVt/kbiAmwsEARWz7JUte
 /2WsaIJyCW9bvijc9a3Kj9I58qqK0wC6efPcT4hobj9okWsNliLtwpNJ8X58v8B8Tq
 D0UCUOE0bJlRqg2nHq8shKiMy3ObZ9A4QJj+lAQFCfyonAwc0gpkyT4ZQFSOqeueA7
 5aifX3SX//BxT/ZrXzErf4lXxj+WLVZ3SsFq/mLTD++BWMmnOZryarrnltn95h4Rzb
 kiJrOAtiMgCXMMi+y2PCZmcme8/nPKzLCKh8+/bNNk/Y5qng50bKlPqDFTAJCWuF77
 RlxyQgAPXN4Mw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2848AC691EE for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jun 2023 07:11:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168741786516.21692.3124274629217326901.git-patchwork-summary@kernel.org>
Date: Thu, 22 Jun 2023 07:11:05 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/4] f2fs:
 convert to use sbi directly Submitter: Yangtao Li <frank.li@vivo.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCETI-0006Ss-7X
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,1/4] f2fs: convert to use sbi directly
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=746065
  Lore link: https://lore.kernel.org/r/20230509095706.17844-1-frank.li@vivo.com
    Patches: [f2fs-dev,1/4] f2fs: convert to use sbi directly

Series: [f2fs-dev,1/2] f2fs: convert to use F2FS_SMALL_VOLUME_IPU_POLICY macro
  Submitter: Yangtao Li <frank.li@vivo.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=756624
  Lore link: https://lore.kernel.org/r/20230613075157.41065-1-frank.li@vivo.com
    Patches: [f2fs-dev,1/2] f2fs: convert to use F2FS_SMALL_VOLUME_IPU_POLICY macro
             [f2fs-dev,2/2] f2fs: convert to use sbi directly


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
