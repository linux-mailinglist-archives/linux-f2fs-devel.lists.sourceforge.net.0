Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB126982CF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 19:00:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSM58-0004Vs-Gk;
	Wed, 15 Feb 2023 18:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pSM56-0004Vm-Kb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 18:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ps3V9VFNQdELo0q3DESXQoYN+9DsK+0ILMdIM5/Wxho=; b=c88kxn1n2GrbPqrzd+10s0FHay
 2o4vu8QsAq95CtKKqH2+BLnFw5UcfuCmYupWgCmLC+xJE1We7RqwS3n04GwZ3XDaxt3echynKU08L
 DtUT0ydlieyo+wdIqFdAO2rSWq4D/6SsbGzttJr8rOvFADuplZwNO4JnUjGB6H/8K61s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ps3V9VFNQdELo0q3DESXQoYN+9DsK+0ILMdIM5/Wxho=; b=azsJJ1lIJeEl0zc4FQZrZ/AhGh
 6WIOFWzx+sWe7ar/BrD62X1sAh/wC/lEdikB0xJ/uX+GN9dqz0I/tpliWKScY2SprPxjuTVm5mh5f
 RHPntksyaDumT5AJhrkN83pYlaz1Zg9hYFU0IH+yD/3EITao44OfG/EipD16bhRUkpgo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSM51-005SpS-LF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 18:00:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D8B9B8232C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06137C433D2;
 Wed, 15 Feb 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676484020;
 bh=UB6g6f76xAmdWGxPMMVT+GkA0BVI+b2dW+DWv+0yrko=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kQpcRKwU/eR9BB7oqPSpWVEqLxWzTCzLgsTDMmL8XuEHgl8YUKpXlkoesHJinDnPc
 gJse11kORQzh6V2PZHDVDRi4tN6DyWCyy9U6Tnds+/DMR5pdFiYMEzGe9u4/a+qYHw
 yLXuPXM7KdB86lPqvMi/hI9yPo49pBR2khHYYSvMGfTZLN5ClZQ4VzlW1RG4Htkfb9
 jIwSfAJxoEEj40PrNHCh3z9sCLbHegL04hdItpB0wbfvHM4hit24kkRjpZQvH5SVXW
 apUOn/V9Lpe85Bvt0iZcRPavsD6rd8OFYuVw87YEwCJ+L9a0JgPraF6xWbj98uE5v/
 fG+5qQJrU9sBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CB60BC41677; Wed, 15 Feb 2023 18:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167648401981.12560.5377751239465561928.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 18:00:19 +0000
References: <20230214235719.799831-1-jaegeuk@kernel.org>
In-Reply-To: <20230214235719.799831-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 14 Feb 2023 15:57:19 -0800 you
 wrote: > We should not truncate replaced blocks, and were supposed to truncate
 the first > part as well. > > This reverts commit
 78a99fe6254cad4be310cd84af39f6c4 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSM51-005SpS-LF
Subject: Re: [f2fs-dev] [PATCH] f2fs: Revert "f2fs: truncate blocks in batch
 in __complete_revoke_list()"
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 14 Feb 2023 15:57:19 -0800 you wrote:
> We should not truncate replaced blocks, and were supposed to truncate the first
> part as well.
> 
> This reverts commit 78a99fe6254cad4be310cd84af39f6c46b668c72.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Revert "f2fs: truncate blocks in batch in __complete_revoke_list()"
    https://git.kernel.org/jaegeuk/f2fs/c/c7dbc0668829

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
