Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C66FB657
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 May 2023 20:34:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pw5h0-0002mB-TF;
	Mon, 08 May 2023 18:34:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pw5gz-0002m5-Ku
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGX4/eij3sXn1A8/AJX5f4FZ9CKsf1KK8syuanSOvMY=; b=Gel3aAdDfK3SFlyG/eI/4/dyxN
 rryYXcpH/nSm/9TPOE/8fjbF39Jj1ryheQB8E9f+nwKnrbtMhGi2GPvftCWHkux4WrvpM8PsLcJjd
 BA+Z/rL8P34ftOeIap7CXTD8Q6nxSqRiq62joI1NSaqUiZfKR0Gaburm3tU6gU8X7vv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGX4/eij3sXn1A8/AJX5f4FZ9CKsf1KK8syuanSOvMY=; b=d5qd3IXh1QQ0a84roQ2gamDfvp
 DGY3/9a6WVRnlkjwdd/F5uwIkdVBSqN9FjCIixMfg6LNbbkRYScznZQHKbTnmobJ6byJPm5BveDX7
 2oWiUh9Va2fRDxjb4glzT+UJr0kX2sNQ/lgK+p6n+UHZxowJvGgOqtYIjWO65Ffdm/2k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pw5gv-002LNI-Q7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 May 2023 18:34:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC5F6207F;
 Mon,  8 May 2023 18:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49015C4339C;
 Mon,  8 May 2023 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683570867;
 bh=TNvoTz3NbOFEJrnEiM49QKPvbzCgS37E7OGjAtEsRsY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=p9/NIXDwgryeNUn5DGG41xjRsbiCmgPp6PZigl/4kxKFAgY7dT+jLOz/uyOcSyi7+
 kW6gNPY4EB8c6Lw/+sEqmVeyW8c4et88oBbWC8fN1DmMkNuN85+wSD11ihhmxePAQg
 EviDXCwsK9Qjhu/c9C440VKLZhTAJTDjvP43SQWkRBt5yL8yQgo1l2AvsE32lMyM/6
 94dDj8iW+ZaUIuT6e+8fczPdosqDpJc8WLP3C6Kvw8Ky4anqVrpqt8ZzWT6i/g7Lu5
 MYgbTh5FVtTVqe1YBH2l0Mk1og3Ut7zyf6PCWFhrYZZFErzqSYyJRk7hYLlYc3WB7z
 0oizvHVW5Nm2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 203D3E270D4; Mon,  8 May 2023 18:34:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168357086712.2764.18059620800942332067.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 18:34:27 +0000
References: <20230423154915.530254-1-chao@kernel.org>
In-Reply-To: <20230423154915.530254-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 23 Apr 2023 23:49:15 +0800 you
 wrote: > This patch supports errors=remount-ro|continue|panic mount option
 > for f2fs. > > f2fs behaves as below in three different modes: > mode
 continue remoun [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pw5gv-002LNI-Q7
Subject: Re: [f2fs-dev] [PATCH v11] f2fs: support
 errors=remount-ro|continue|panic mountoption
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 23 Apr 2023 23:49:15 +0800 you wrote:
> This patch supports errors=remount-ro|continue|panic mount option
> for f2fs.
> 
> f2fs behaves as below in three different modes:
> mode			continue	remount-ro	panic
> access ops		normal		noraml		N/A
> syscall errors		-EIO		-EROFS		N/A
> mount option		rw		ro		N/A
> pending dir write	keep		keep		N/A
> pending non-dir write	drop		keep		N/A
> pending node write	drop		keep		N/A
> pending meta write	keep		keep		N/A
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v11] f2fs: support errors=remount-ro|continue|panic mountoption
    https://git.kernel.org/jaegeuk/f2fs/c/b62e71be2110

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
