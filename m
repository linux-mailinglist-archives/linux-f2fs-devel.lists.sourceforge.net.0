Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36112905789
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKc-00006T-NL;
	Wed, 12 Jun 2024 15:56:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKW-00005s-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gL5AiSL0vNePYAcCF3CdiqPVLVDzy0CVeM3itbFT/04=; b=eFUXWzx2u7u6Mi24gG4QCnwtOD
 maieRAIDffjFte6wrCBfVKOu/n8CLypz9e1pGXF2rfowOE4ZwPdzUIUYXEpHJhvSsEexLcaG24WL5
 jgaje7eNQjrKMcCS9H9oh/5OBV+JDrfBJaEeTyT9tcVbKVVIa25noVSADsM9hbIkE1rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gL5AiSL0vNePYAcCF3CdiqPVLVDzy0CVeM3itbFT/04=; b=k8ugKjo02TP4g/3h2jLlV821u+
 phRxewpRToqPkYuGLBVNPo9+fyD8NyRwcJJBANQox9UBD0Zik/WpNhOgWTQHhp6aiNGSX3jh2CEVx
 cdbKdVEq8f6eAck/Fs2vMY+fTeJaDk0HXVJq3jmxnDimrT74Sa36LLCP1pXAoXLYkj3c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKW-0007S5-GS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63214614CE;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1925CC4AF1A;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=9Z9Ru3yhVGdasewixq2jt9ojL4nDmltuDJb0o1FAZYE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TpQi0DQTGMB7xGuzygJ/k11AzpmaBgv1mUvwdVEao1lxlhZZUaUPNyszCN7YLCnzX
 QHvdfhNNpMPAA5r6mU3ADgVW73V+YZEXdd9BpJcaBah7IeRAH2hSoAf7cgoRBaR6r5
 m3iFuCWUjmwSCISRTsDV6T0OCqovQw8a7z0t/Gn8gZMbOguRkZ0bVVIz4w4uXpy9w9
 0VaoNzQPE1h/y0RBdrTA6K1taykdXoZAz327Slmq+iZtGIbCVP15HcAOijDhK4j1HL
 yDKH1HZPY3N4KRVY6J+DOgkgUIFGo0WbLQctL+uSTO9COLXqvEyA/wtY5sQjuw6DgX
 whiuafk1JiyFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 019D9C43616; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775700.32393.6615606891184295734.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240529112411.380453-1-shengyong@oppo.com>
In-Reply-To: <20240529112411.380453-1-shengyong@oppo.com>
To: Sheng Yong <shengyong@oppo.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 29 May 2024 19:24:11 +0800 you
 wrote: > If curseg is not the first segment in its zone, the zone is not empty,
 > and it should not be reset. This issue could be reproduced by: > > modprobe
 nul [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKW-0007S5-GS
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid resetting non empty zone
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 29 May 2024 19:24:11 +0800 you wrote:
> If curseg is not the first segment in its zone, the zone is not empty,
> and it should not be reset. This issue could be reproduced by:
> 
> 	modprobe null_blk nr_devices=1 zoned=1 zone_max_open=6 zone_max_active=6 zone_size=1024 gb=30
> 	# /dev/vda is 4G
> 	mkfs.f2fs -m -c /dev/nullb0 /dev/vda -f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: avoid resetting non empty zone
    https://git.kernel.org/jaegeuk/f2fs/c/76da333f4b93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
