Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F43966AEF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:52:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8bK-00015u-Ae;
	Fri, 30 Aug 2024 20:52:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8bI-00015Z-TO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lzNrCoONGqWQqTsrVBHMqojHnbYklvyZ82ZPdp2tsio=; b=XqW/9IWfkSBPP1YjTNBjFcuthc
 JR5qK1gIJQWNUjI1dZlYixLlZ2ll3tQ8n0u84dqmLaI7ZWu+Mck/PsjXwZcafyoNOSHCx6nIGAc48
 wS1C33tbLgH76ArDifZfp/qkMnFj8mcmjVIgk0kwg60FqfuG2UIUHUmKxxwKSreYsvts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lzNrCoONGqWQqTsrVBHMqojHnbYklvyZ82ZPdp2tsio=; b=bRC9urENeHwHvtnhKEvSJHpDrR
 DVZ1Vth0HDz01hJ7Jt805N/8ljnK6nGpdAXovzHq2VzLDAMs/gN+L1yNEOPs7QSdzN6IKQBsDs39A
 UG7M2+b+H3fr8uukqKQc3Wz8ONQw/pgYenevguABC8yETgLvLkMDY3R3OWg/4XO2wGZs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8bI-0005oN-8M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F298A41AD4;
 Fri, 30 Aug 2024 20:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC64C4CEC2;
 Fri, 30 Aug 2024 20:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051117;
 bh=g/0RicoJwcfOBXj2z2PbIfFdkrtNaWcHxTylTg4+mEI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jagBfViD7+152NpTqSgwD5umX6kXvhEai6ew4H82HDPeCDstAI1llFETT8jnTy4qt
 yg2eJmnsvZZWrMroAjtigN7/YLFNvqAuaqS+GZceGfdF8z8wHUX6OHosMiHJcymcAW
 P/mdL7dEPBvWSoqNU1L0q4Y2EEQlC5mCO8gR/UwDB9jN2tAjaFHe//2BM5YqSJhgKR
 eOyOBVJBIhqhqm4wjaXQ57JigVmnISthksS2ndwnTQffXnzFxqFtd2EXb4nID28Tvv
 ogKFcatFZlhfbAsfZfbehdcHS5S6sZhmWPFsjPN8m/iCUCqNRdHYnwfcUInM93jOx/
 VifKhugmzAUiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB14F3809A80; Fri, 30 Aug 2024 20:51:58 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505111749.2712133.2824132782211040782.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:57 +0000
References: <20240816040703.736887-1-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20240816040703.736887-1-shinichiro.kawasaki@wdc.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Aug 2024 13:07:03 +0900 you
 wrote: > As the helper function f2fs_bdev_support_discard() shows, f2fs checks
 if > the target block devices support discard by calling >
 bdev_max_discard_sector [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8bI-0005oN-8M
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: check discard support for
 conventional zones
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
Cc: hch@infradead.org, jaegeuk@kernel.org, dlemoal@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Aug 2024 13:07:03 +0900 you wrote:
> As the helper function f2fs_bdev_support_discard() shows, f2fs checks if
> the target block devices support discard by calling
> bdev_max_discard_sectors() and bdev_is_zoned(). This check works well
> for most cases, but it does not work for conventional zones on zoned
> block devices. F2fs assumes that zoned block devices support discard,
> and calls __submit_discard_cmd(). When __submit_discard_cmd() is called
> for sequential write required zones, it works fine since
> __submit_discard_cmd() issues zone reset commands instead of discard
> commands. However, when __submit_discard_cmd() is called for
> conventional zones, __blkdev_issue_discard() is called even when the
> devices do not support discard.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: check discard support for conventional zones
    https://git.kernel.org/jaegeuk/f2fs/c/43aec4d01bd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
