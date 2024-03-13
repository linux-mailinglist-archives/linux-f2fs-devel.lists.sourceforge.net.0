Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9736C87A0C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:30:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDS5-0006dU-So;
	Wed, 13 Mar 2024 01:30:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rkDS5-0006dL-8h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GfL97V75FC2ZEM0zq7fwqLDBazqMH4m/5/wIkevA2XY=; b=De7f3M5QjXsHmfkkwrMKFmFIAy
 h3TEObFSApjnzoDugEoNPdB+/SzReLRc1JbJAE4Ga+9Utmv+yCih0wcI0qUNvkoFiv8+SbP2gTYVd
 TJUDfY4xukqnhMNHXnXOV9ooi4zHz+ioTuaZf6WJl5DrvDwvO+4X9An1tWS/5Lpt0rY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GfL97V75FC2ZEM0zq7fwqLDBazqMH4m/5/wIkevA2XY=; b=SOc/jyUm1IR91mZeoSsQ3SQEKL
 E3APT4dFqrCddZhlWZDId9R+8Wfnlc82l78PzRyedcRZvC2JPnk6hvd5EqWJ5l1lm3Gm0KCi5d6wZ
 AGvKDAEa4Bx07XSyTr/iIDqjZQdSDrgM2u+ZwnIbULNi5/e+n7HWzv8Nb99JbWfk4YnI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDRu-00023D-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3D89561366
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 01:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11FA9C43394;
 Wed, 13 Mar 2024 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710293430;
 bh=N5SuHqpo4Wvs9m5+Pv+s084wtJWSEaRs8gGJ7KkurNM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GbriTUUKKc93bTnzrbklUGkVJNIc45MIr9c58+DVV+Pk5bP4NwmrF4WTF4Dh47/Mk
 eBggBh2aX9IXs6dYz+hjTIygJo0qF9HlZg3wPrN/sQizZWBEEZNn7AsXZLUKnSj/za
 rRPVIbemlvBk57pLevHPSARHbz1R2H4iVUZIZ8hA9YJFK5JeKfR9mDH1dtCwc843pF
 PYtdrlmv5BzCimYIUArPd0wdSZUugTx4FtuF8LYhLArKrrdrxJ75AEjO9ajYkDWTZ5
 7XF1Uk0Xh/WAjv6aEUnr4HNup58bUArur780lo+ztjwI0sT7vTbAWafMGZZ50E/KFC
 NH3zWrLOoMSfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E0D95C595C3; Wed, 13 Mar 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171029342991.17296.1644689290423723789.git-patchwork-notify@kernel.org>
Date: Wed, 13 Mar 2024 01:30:29 +0000
References: <20240308010834.4023772-1-chao@kernel.org>
In-Reply-To: <20240308010834.4023772-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 8 Mar 2024 09:08:34 +0800 you wrote:
 > Below race case can cause data corruption: > > Thread A GC thread > -
 gc_data_segment
 > - ra_data_block > - locked meta_inode page > - f2fs_inplace_write [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDRu-00023D-Gy
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to truncate meta inode pages
 forcely
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

On Fri,  8 Mar 2024 09:08:34 +0800 you wrote:
> Below race case can cause data corruption:
> 
> Thread A				GC thread
> 					- gc_data_segment
> 					 - ra_data_block
> 					  - locked meta_inode page
> - f2fs_inplace_write_data
>  - invalidate_mapping_pages
>  : fail to invalidate meta_inode page
>    due to lock failure or dirty|writeback
>    status
>  - f2fs_submit_page_bio
>  : write last dirty data to old blkaddr
> 					 - move_data_block
> 					  - load old data from meta_inode page
> 					  - f2fs_submit_page_write
> 					  : write old data to new blkaddr
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to truncate meta inode pages forcely
    https://git.kernel.org/jaegeuk/f2fs/c/9f0c4a46be1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
