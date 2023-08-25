Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2A788DD6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 19:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZadn-00053m-MY;
	Fri, 25 Aug 2023 17:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qZadl-00053f-SK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 17:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5CjzP/f6e82wLFzgGjF4oHWv7LwuHQ1QNLNwAzSoMx0=; b=lnNtxFHLLdng7WmOLnLhk+DTSy
 Snqyzc2e3i4d05LtuBLNl22GKH6SNcBbg+hvfRcLvrJofUmNHPxbsAYxncU+EXI4pK/rsdnXnJ9uh
 EJmfMd8O5CVcIbr7X++ZuIvLaCCj9oOWDH8jQI/jpL3pWtHYcdcJSaPqZ7IfAHXtQBEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5CjzP/f6e82wLFzgGjF4oHWv7LwuHQ1QNLNwAzSoMx0=; b=D
 iDscVTLYWhekrOIshDirKN6XpdGs/EQv3bwOlUOSe+fqGL1TeFqPKQ5RhQcy9rSclsDFIFYVFF+pK
 NS8sUvhDD5+PhUcJ08mu1WukSDq/GUIXFd5dYB+aMkx/amWt5GMVZY5M2G6ZuynTOHzocrjHwK2Au
 nadGg8mkarioHLEI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZadm-0006NP-9U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 17:30:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8EA461007
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 17:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ADC4C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692984623;
 bh=93hUTtZMM8NYIF1G7ekrw3OtU+FH6BZa1ivQ54027/E=;
 h=Subject:From:Date:To:From;
 b=aw+4ZYocZ0CgH240yB6OR6SaC8iY1qK22+yFcxAlxPakA+HfNest5v+yBOq95qOXY
 6Ffv3wym47hZo7dtDY5mtBIG1w58rirBUAWiNRvCclm4fM3Kg9uq/xE49/j1/7FrLt
 Q1sYDl4JKNpmM2XHqHkt4239PL44Ghf7DJMICeO8+5JY/ZP5rrc2CRmYi9ccofqv8g
 olV8oaMhzj6zLJuKFYCXn+CureG4OhsgUWNaUBKu4iIMln2FSIo/2wRaa26RJixgHs
 onVubLdXRY+fGz5hrEtVEC63oPZKo0mJDU6C4VWpH951kZkR7d/qmJVVTT4h9Wvg4J
 UAHpzcE4dA8yA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2E645C595D7 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 17:30:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169298462312.1914.5476407548783480783.git-patchwork-summary@kernel.org>
Date: Fri, 25 Aug 2023 17:30:23 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/3] f2fs:
 clean up error handling in sanity_check_{compress_, }inode() Submitter: Chao
 Yu <chao@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZadm-0006NP-9U
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

Series: [f2fs-dev,1/3] f2fs: clean up error handling in sanity_check_{compress_, }inode()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=777926
  Lore link: https://lore.kernel.org/r/20230821152225.4086924-1-chao@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: clean up error handling in sanity_check_{compress_, }inode()
             [f2fs-dev,2/3] f2fs: fix error path of f2fs_submit_page_read()
             [f2fs-dev,3/3] f2fs: compress: fix to assign compress_level for lz4 correctly


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
