Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D4681F38
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:00:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMd8V-0001k7-CS;
	Mon, 30 Jan 2023 23:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMd8T-0001jv-HD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTj4zcj/XWxRsE9VlSIZWt2EDY9ZhSwSiGalBJkLLLo=; b=Nh8YohY4bQvp8bIUqrcRUnnRSB
 udKnk07CbHdhQqLA2AxwiEjqf5b55Nad3l+KjVtz1tKNUphUyCNDKZcC3im1Zi+kkShbXuViOoI8h
 nrAwuGQRGqCeBD+cqaAWRCOVVjdzvkTvFA8lbSWjZyeyE6FiiNFDR17cqch7wVd1/6oI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTj4zcj/XWxRsE9VlSIZWt2EDY9ZhSwSiGalBJkLLLo=; b=WSRPORnRoheZH3QTG2v4L85tjD
 gE7Sjg+vfi8HGaVKNnRhCFeZDu2oGnhKcxle8ZTpujLxHI0jtJ0kazJ8ViX9gUq/+G+kWxw9NRdQU
 hv39j12gjmiuglg4AqpMlAyKcIEOQSzMLENWClLbFC0zH6lSoJ3FjGj06BaSWB34Mylw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMd8S-004OGT-3F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B26FE612F3;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21869C433A7;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675119618;
 bh=oFJJ4H2f4g+K6au8aw2K+jW0tLl9r0XaxoY4/Pwg1og=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=A+LIGrp2YMdNDCBkgNcA8ltxp12rIFUSTeS1aUB7+h7fIrejEXoKmhfrQweqTyR4A
 XintNA+Nh5fXrbZa7NkPlNPcCitHTIAJYqroe/Auin2tvikpeJ4WrAHESVZaIMYNCd
 BLk0x7s7i9h4yNofYiP9ntqQqCeVRjlAv+Rnbv6lJhYmnidQSABfbcM5mN/SFYPG2B
 3sfqnQInFc5z5xRIrNBvlBDkrm12buTHua+vopsbG/DD4RXBbylDLfGPgu4E0CcIJt
 AgDZhF/jiA3tN356yOjBRXY9PyxInG79ULpTZVvAKqC+Y1JBihk6Ab+RACJTvr0CU8
 cM808e685itzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E2A46E5255D; Mon, 30 Jan 2023 23:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167511961792.12751.12417544655020627742.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 23:00:17 +0000
References: <20230117132442.77645-1-frank.li@vivo.com>
In-Reply-To: <20230117132442.77645-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 17 Jan 2023 21:24:42 +0800 you
 wrote: > hot_data_age_threshold is a non-zero positive number, and > condition
 2 includes condition 1, so there is no need to > additionally judge whether
 t is 0 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMd8S-004OGT-3F
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to check warm_data_age_threshold
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

On Tue, 17 Jan 2023 21:24:42 +0800 you wrote:
> hot_data_age_threshold is a non-zero positive number, and
> condition 2 includes condition 1, so there is no need to
> additionally judge whether t is 0. And let's remove it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to check warm_data_age_threshold
    https://git.kernel.org/jaegeuk/f2fs/c/3d41b70411d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
