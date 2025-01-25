Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D675CA1C026
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jan 2025 02:20:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tbUqT-0000Vy-15;
	Sat, 25 Jan 2025 01:20:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tbUqN-0000VT-9N
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Jan 2025 01:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQPh9AgtjrTJfANDhkYY562WtCfqx7GA/rSBpZrkp9c=; b=lt1XChNt2VudFZ2hj8X9Y46F8M
 K75GS3YaIF5dacxXqm7KdymCwS1PJPRhQ3ejhmpcph9dqx8klhhOzU1zKEcladO+nU0qEPy+aVvvn
 fnvtQAv36tqHuudIZnuhkf00aUxBlSbSNCOV9LiGD3QDAU/GbE+ibIZmiX3dAmObHvNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LQPh9AgtjrTJfANDhkYY562WtCfqx7GA/rSBpZrkp9c=; b=b
 shJGH0ww3mN7VQBaoQ8R+6u7QOPRuxN7+vWXzFCkbAQtZ8DuJw1ANFVbqXp8ONxrcmf9AP6/HBTL8
 iXhVewhRWGovULccoEfSbGuZEQNHMMhNGv05V9rrzlnBWqkIstUYhdsnr92xGcgunr+hc4oRlshcH
 yX1IIuqEdyra9oRs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbUqM-0001li-K9 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Jan 2025 01:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CA8CA420EC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Jan 2025 01:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA1CC4CED2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Jan 2025 01:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737768003;
 bh=/lHdt9KmtIsaH3TXApnn9+iepkn6n//UW4mxlt6OLLU=;
 h=Subject:From:Date:To:From;
 b=mKk2lG0RxnXM8sXBkkF4Rkqp5LB9R1bCcgcyGj/E2C7wObwkEqXBbDJd8dNYBAAQB
 d3HkV9j/mafHLj8RPkXq7ijQRcrYbI2sJlcOEEIMkDLvgHdNxGdoL6O4sdx3Y/6qyD
 Ioe01QMznT1Zk14l8K48LerHwW/Ox4ycZQ6Je66FPnac0eFsazIX1mVsYMcAAxB9td
 9sVAcnV4ry2Wdrc2Rzxx7lrHNpbsCxrjIyNmXruXgyucYK74vR535a/68LvKhq+WLP
 ygtc7JHz4VwybKSbC8aqovdFc3XUkTGk1vT0eHvC5S2QcnyrIxTn+/qVAwyhm9so/l
 c4H1r0KhYSLhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 75C2C380AA79 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Jan 2025 01:20:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173776802786.2231594.10860151798708916903.git-patchwork-summary@kernel.org>
Date: Sat, 25 Jan 2025 01:20:27 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v3] f2fs: fix
 inconsistent dirty state of atomic file Submitter: Jianan Huang
 <huangjianan@xiaomi.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel. [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbUqM-0001li-K9
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

Patch: [f2fs-dev,v3] f2fs: fix inconsistent dirty state of atomic file
  Submitter: Jianan Huang <huangjianan@xiaomi.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=928021
  Lore link: https://lore.kernel.org/r/20250124055751.283198-1-huangjianan@xiaomi.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
