Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08D6CA9D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 18:00:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgpHC-00048Q-Ku;
	Mon, 27 Mar 2023 16:00:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pgpH1-00047i-HP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/hnheb0N2Zv2NcJzgAdXNf37u3wpBajPuf7eaPUd8Y=; b=F+Y1MVh4taWSAaRQWIdijz9fFy
 BZRdLBBAVekpbRsbMpHOeh+kRghJXZZOj5lmD6CddtCyUp3xvECx0V9Nrx6X6h7jx4lIdstwOJ/zd
 6OuFoI+KsUipCqWa72kv5sj6xUUiVLUffkAxCJJrxNL5IoUivRup9hFlwN4Ghe23pTug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/hnheb0N2Zv2NcJzgAdXNf37u3wpBajPuf7eaPUd8Y=; b=GZOy3no/2K4Q/zNGxNhpb4qL69
 wUoi0wKPeRIYsd5zv6egliZTMSFXQ2G4xibMm1l6h+kaRiQ8zxsSHYjUn8jMk146ieVUR+ER+3oIV
 IxUC5/LMaM3lln/7lBIlnU3iQTkuYZDaVPQ9QuYRB1kRZ7wAjEck6cYzQ3EAo0InZyoI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgpGr-00038f-5V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48AAA6136F;
 Mon, 27 Mar 2023 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FF38C433AE;
 Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679932820;
 bh=UosN6WQmhU0gC9d+forj880ODhU3d/cXAP2nSX62Ok8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KrsvI2JR/EF6ofUmO0G+zXz6nAti6v81lp4d0Hm3kNYM32oxxUjdsBymVpUy5Smoa
 olnw4Pn360MKZlVQCW/JUGnxgfLA53hL5JzVS6G6OW7L/ysbtQgaTmor35a54Ig+oJ
 axT62tuk+Zy7/3ijnrnbx2jaAnjGcziZGOCMzdj0aPZvIt3v9SDLQsuOfbkXKyc/IB
 fLlFegXI473a9e9WVZVbcmWUr0giKFIASeGOkC1YE26HF/WzBsKZPRilOt9PvSpasF
 pcguNWlGVjrRc6Re6NYHH39Sy3JBH+lkxh2sTWlW5aFsOWSBtWuthIFQK2mQeDTtj7
 FCZ2noenDN9pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0454AE52505; Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167993282000.32120.2964162432731935413.git-patchwork-notify@kernel.org>
Date: Mon, 27 Mar 2023 16:00:20 +0000
References: <20230320172218.59628-1-frank.li@vivo.com>
In-Reply-To: <20230320172218.59628-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 21 Mar 2023 01:22:18 +0800 you
 wrote: > BUG_ON() will be triggered when writing files concurrently, > because
 the same page is writtenback multiple times. > > 1597 void
 folio_end_writeback(str [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgpGr-00038f-5V
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix to call
 f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
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
Cc: hanqi@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 21 Mar 2023 01:22:18 +0800 you wrote:
> BUG_ON() will be triggered when writing files concurrently,
> because the same page is writtenback multiple times.
> 
> 1597 void folio_end_writeback(struct folio *folio)
> 1598 {
> 		......
> 1618     if (!__folio_end_writeback(folio))
> 1619         BUG();
> 		......
> 1625 }
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: compress: fix to call f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/08a8457cfd78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
