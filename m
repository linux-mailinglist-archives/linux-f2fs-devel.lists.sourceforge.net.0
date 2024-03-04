Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28B870965
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCvc-0002Tp-N5;
	Mon, 04 Mar 2024 18:20:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvZ-0002Te-6G
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3+HmtyFXOimzwci6OiQgwNKHxpKY+1Wd4S8b3OJfoA=; b=idJHoSmPvhdw1MQwvUDPkq+RqC
 mJ0S0EiFreuPPR8nUJ9Yd1sNpXuA9YhbqmHCQoItBrLTe5mX2gPni7mlpQrRXmSzyAxQgNg7lrVNk
 TSsgEKVjGsmEGIgRLNrAzacStHn/kKT5UPoaGYppySAkeqz+jhrpqD61FfuRrEAjULDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3+HmtyFXOimzwci6OiQgwNKHxpKY+1Wd4S8b3OJfoA=; b=WsaUd6GtlI8WskP9t49gYUYbQe
 g85p7VJ3PBJ1vxdHZmEwT9pdzjPlNenIvngnnWa8re3u6phjB9lZaa2aZQDK18q1pSF/6TjFIbGWm
 bnZkFJK+Kq64iFcIF82btUCCIrJvnAY1F91NHz9XnzKepGLQrTSeZgghHrFfJyC4MbpY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvT-0002fu-8r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A10CBCE0B62
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFFEBC43399;
 Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576428;
 bh=zBz/B0sPWT2Admpa/78zITi4LH0kZhVDwkb4NFeSsWM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GafLWyUzmjeWoIBnnnYln5Nhx9tEkEO3bWDW0/2mgrMOGzo1wzMGo7hK/neWWgzNV
 SgAo3xqrVcLntFh8uUWkKbJywVhAVo6soeKhZlTkyM4h95g2sYKsniqGjm6a5N3XMu
 X83gggqeTexElXf1qelqwXW4ze+5D5dM+mHHZdRtqtRt2WdiJjxv77RqnMxTPyQcHO
 jkT+esrTICpUVGqVMJGi9KHm1bbADQalSTltH2/gVM5sm2X2rIPwRGKfWhiMjStREE
 hbOyUjIngKEEjU+ovl4dzLMFzyuxPHDrV6338Jsdi0es86uuoUbV+TGUyol6moDYsJ
 BplU+QoHNnzpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CA373D9A4B9; Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642882.16816.9297901358493884285.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 18:20:28 +0000
References: <20240304032855.1425579-1-chao@kernel.org>
In-Reply-To: <20240304032855.1425579-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Mar 2024 11:28:55 +0800 you wrote:
 > Just cleanup,
 no functional change. > > Signed-off-by: Chao Yu <chao@kernel.org>
 > --- > v2: > - don't cast type of segment number from unsigned int > to
 [...] Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhCvT-0002fu-8r
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS
 for cleanup
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

On Mon,  4 Mar 2024 11:28:55 +0800 you wrote:
> Just cleanup, no functional change.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - don't cast type of segment number from unsigned int
> to long long, because segs << log_blocks_per_seg won't
> overflow due to f2fs doesn't support 64-bits addressing.
>  fs/f2fs/debug.c   |  7 +++----
>  fs/f2fs/f2fs.h    | 14 ++++++++------
>  fs/f2fs/gc.c      | 10 +++++-----
>  fs/f2fs/gc.h      |  4 ++--
>  fs/f2fs/segment.c | 12 ++++++------
>  fs/f2fs/segment.h | 15 +++++++--------
>  fs/f2fs/super.c   | 16 ++++++++--------
>  fs/f2fs/sysfs.c   |  4 ++--
>  8 files changed, 41 insertions(+), 41 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup
    https://git.kernel.org/jaegeuk/f2fs/c/45809cd3bdac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
