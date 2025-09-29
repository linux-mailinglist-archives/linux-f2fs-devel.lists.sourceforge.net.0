Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7BBAAB28
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p8JKlph2P9ow9Fe4jpUGpuPopIoCDvj5odi2hXCiLk=; b=JlcBl8DlzKqTybldmnGYT0GcFi
	h8fDXu1J7+tVKI3XuuyQOhFkmhJDpvVxwYwM8SiiHgdgJ8+GCj7gFuAiYnQnNlN306k/1PiNvCrkp
	IGioTRIFpiO8Psop6UpfAoJIMzAK7/gviqTuc7YNVnEYs0oQltJAkCIgQWan8X1dQUe8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOT-00080i-Ie;
	Mon, 29 Sep 2025 22:30:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MOS-00080U-2u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AWvgkPqX8WN55TZhH8OBdGT3jnv41v8UjvFwHb3BNDY=; b=ZyLVhcF0Hj4IGIJCi8A6j743IU
 oBViSSDU+lpKDkljFlaFYcYeM1Vf+gRgAzM0ClkMzHI5bCuM6W9lsZdfiCGOqOglqi3flQUqN1AGm
 FeLrxS6m/K/W2RtmkqIgKQANsNatwIjkBjkW0WtfK8bjewYXQFOwr0B/ItievCU1Md00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AWvgkPqX8WN55TZhH8OBdGT3jnv41v8UjvFwHb3BNDY=; b=cc0LIn0wnA+ElTGlWuVkX1+8xV
 dc/dL9dt1P1ya+X4eZVFerrrR3gPNybHuKau4IV2kKTeY4ZmGk/ZwhK0AquN6KoyHacQBCF5fDh6S
 bpNJ4xM1EysQqIZVwmSUTrXYlNM764X2cxhfaP+ajZ19bW2LTAyKAsu41rq1ZKFKpPps=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MOR-0005Oj-IB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 781386025F;
 Mon, 29 Sep 2025 22:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4617CC116B1;
 Mon, 29 Sep 2025 22:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185042;
 bh=xr3Vr5z7ZMusZyiO5tXSn9jP46rjLBrsMfvrhvdsjdE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nLynGGpU0zmglCgmg5pTp0iBcQyHEZE7hrJlXI2XnpfRf4zeGePfubwXpBsA0KaWE
 UHXB0DCWLkp3P4MGbKSMOOG5v58V3X9IhYrw2Yjbhmv5B6Nn/mihxRurZmVc5PJt6G
 q3wqb52LtyfMFW0hYuJSltXfmq6pKlOBSD/YgjJbnjKx+ld39nhuEFYnCN3rFDM74v
 EAB1G9TZ2FTh2FwwS7+tmQmfTl+uP/rCEZw2DdvY1YkLYnTQ64T9GZbIA3/rrfFbkU
 VJGiHasV4Fykej5li9EoO7QK/eDZwb2uJpiflKXCA+QkbkCqETuunXPspagvAr0IIH
 ft+ebdJgoKIiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EABF139D0C1A; Mon, 29 Sep 2025 22:30:36 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918503574.1733438.9199587753366819023.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 22:30:35 +0000
References: <20250916085243.4165099-1-chao@kernel.org>
In-Reply-To: <20250916085243.4165099-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 16 Sep 2025 16:52:43 +0800 you
 wrote: > Add a sanity check in __update_extent_tree_range() to detect any
 > zero-sized extent update. > > Signed-off-by: wangzijie
 <wangzijie1@honor.com> > Signe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3MOR-0005Oj-IB
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sanity check on ei.len in
 __update_extent_tree_range()
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 16 Sep 2025 16:52:43 +0800 you wrote:
> Add a sanity check in __update_extent_tree_range() to detect any
> zero-sized extent update.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/extent_cache.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Here is the summary with links:
  - [f2fs-dev] f2fs: add sanity check on ei.len in __update_extent_tree_range()
    https://git.kernel.org/jaegeuk/f2fs/c/45b70947a425

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
