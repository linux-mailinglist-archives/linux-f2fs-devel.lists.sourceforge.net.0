Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAA586BAFB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 23:50:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfSlB-0005a5-P8;
	Wed, 28 Feb 2024 22:50:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rfSl9-0005Zz-Kd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 22:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ODu98FWjYzwzmUMLVe8hJSnfk1j7rGA8aib9MkvIYVQ=; b=QYS70qeyu9xJdntKxQqTUa0fCP
 zAAXiHHC6fODpznxfeTU7nWAo0wdcVcouG+owxLg9xLtr+YGbk05QGUrvxWovp+1dWyNSPsWohjGQ
 F3h5XU0C2wkauIUVqAqs0vcuI3ChvUi/WtdC6oDf/up2mIS8o91zAueX3HKL90is0Cus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ODu98FWjYzwzmUMLVe8hJSnfk1j7rGA8aib9MkvIYVQ=; b=T
 B3d0hKv9TSe+oUpAUF+7bmKNPnECy1GiQMGNN5wnSWZ8J89sgumegdxHL25L4jFyoLq8WOhaNDN9B
 S3iVsObmmBChC3Hu/CBEAAZELIWS37irmPefMH1t1X7K+iv6uJeOm0xjsNitzmtdHbGzICk0uRiJ1
 Bha3vbR54Jb7QgFw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfSl5-0001hR-0R for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 22:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 41AABCE2312
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Feb 2024 22:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 801D0C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Feb 2024 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709160631;
 bh=cUS6eDLbPS61lMLi8B114Hba1j8h2I2ForcaCUIBIEY=;
 h=Subject:From:Date:To:From;
 b=P5FRl/GRRc6B9h+xro3cE//2RSASNZRS45swsedNGOKbcRP/v3U7E6ebvprTO4Sxp
 t4tMCY1i/xX7QFHon/Gh62Wt6owQ9G314RFpyOjWw7A2HHLujvVPv3SZqVk3S1Wf0U
 ZMGpXkzMTPjFyHqPbhOIhvs6bZtQ2xHWhNevXowF1KbMCBNkp6GEBKml7Ic/3CoBuu
 vN6+jcjnIt6blzKoS229k0u0FV9TmRZUS0OCDhWxILSPTHjiKvOzAMLhYOLwqrTxru
 uGQjhBus0OZHzY0T5r0t/Yy2ZiHVU2/E1VGw5TepLEcciCJ7Kyh1Yfqpr3FOjXOw40
 4ik+yBdaOK7hQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6AFFBC395F1 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Feb 2024 22:50:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170916063136.28690.3386829552318698782.git-patchwork-summary@kernel.org>
Date: Wed, 28 Feb 2024 22:50:31 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/5] f2fs:
 check number of blocks in a current section Submitter: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=829303
 Lore link: [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfSl5-0001hR-0R
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

Series: [f2fs-dev,1/5] f2fs: check number of blocks in a current section
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=829303
  Lore link: https://lore.kernel.org/r/20240223205535.307307-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/5] f2fs: check number of blocks in a current section
             [f2fs-dev,4/5] f2fs: prevent an f2fs_gc loop during disable_checkpoint
             [f2fs-dev,5/5] f2fs: allow to mount if cap is 100

Series: [f2fs-dev,1/4] f2fs: delete f2fs_get_new_segment() declaration
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=828652
  Lore link: https://lore.kernel.org/r/20240222121851.883141-1-chao@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: delete f2fs_get_new_segment() declaration
             [f2fs-dev,3/4] f2fs: fix to handle segment allocation failure correctly
             [f2fs-dev,4/4] f2fs: introduce FAULT_NO_SEGMENT

Patch: [f2fs-dev] f2fs: compress: fix to check compress flag w/ .i_sem lock
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=827313
  Lore link: https://lore.kernel.org/r/20240219022844.3461390-1-chao@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
