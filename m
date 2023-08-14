Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBF77C1B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 22:50:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVeWD-0001rO-Q5;
	Mon, 14 Aug 2023 20:50:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qVeWC-0001rC-MN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0H8crO3ynKT0ao6vObbZC4NivGgXKWRhKHUA3u2zCX8=; b=XWaQG/YcV66mkqGZNCDuxTN6EA
 kKgfTamNPohW2KshcNNNYBcW2FiD4NXgzUSZ8D3W5ospAAxjopTcXzHnrcWwyX6MFpcPSKHgTEPIY
 auGlx+nZyF7aJjL/GU3rzK2ZkL/hPx7QD4E3SOvoRVIrlSwvcCA/XSqY3VFJFyDzBkws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0H8crO3ynKT0ao6vObbZC4NivGgXKWRhKHUA3u2zCX8=; b=NdwHWGK/N8kvnpQ5DaqY24uvDu
 BBdLlAuPy8H0mtU7ufp8gkgbkldnWSJ4CihW8rgP5d1Xe3Ac2X2IbqcyJDcLILYTD+rCfFxLqc6Bi
 tDx1EZoDOb2llEb33mdvXlhQockWgGaDInEz9/MK+N8986lkZmHdLQAnGyMrmZ5cWqco=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVeWC-0007W0-JU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5D1C627DA;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58829C433C9;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692046222;
 bh=7ahPsYJb2VWj+5q4JjbIrqJmgJYdovuwK0IeKkfLRoM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IaLOjP0BzL70Cg1XYavERrlSXeabLnxia2+U5i1szJ0GbbZpyM+S3fDS84jPHuPyd
 0/5WCWKE15xIO/JC9t5gSB7hxrlre3HinG/ylj1t6AG9J3+v0XaWjvE8/YGnnvI8Sg
 ctPVJlj4xzPPjxNRnYEtnokyJYn2882OnE/Sg25VHVagXrBOa5vMRYlk4voW4Uh1wt
 +euJBLr8NL4GnKSMRYtUiiM9LY7rfLzT8gBkMNBIGhfylKSKHp8+a8qDBlj2pkkiyD
 hq6fFJvRH554MNzByRLR95PyiFFAzWbpKTrb02NOWqxQL1Eun20DDxzwKKKBiIcK81
 kTX5NvkLsTxbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 31477E93B36; Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169204622219.5033.17422365206843508436.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 20:50:22 +0000
References: <20230717071109.5663-1-duminjie@vivo.com>
In-Reply-To: <20230717071109.5663-1-duminjie@vivo.com>
To: Minjie Du <duminjie@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 17 Jul 2023 15:11:09 +0800 you
 wrote: > Simplify code pattern of 'folio->index + folio_nr_pages(folio)' by
 using > the existing helper folio_next_index(). > > Signed-off-by: Minjie
 Du <duminji [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVeWC-0007W0-JU
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: increase usage of
 folio_next_index() helper
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
Cc: opensource.kernel@vivo.com, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 17 Jul 2023 15:11:09 +0800 you wrote:
> Simplify code pattern of 'folio->index + folio_nr_pages(folio)' by using
> the existing helper folio_next_index().
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---
>  fs/f2fs/data.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: increase usage of folio_next_index() helper
    https://git.kernel.org/jaegeuk/f2fs/c/a842a90926b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
