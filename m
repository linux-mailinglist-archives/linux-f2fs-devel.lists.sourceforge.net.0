Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50000966AEC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:52:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8bG-0001UW-4C;
	Fri, 30 Aug 2024 20:52:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8bC-0001Tx-TE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ryecMT0MDQXI0xjTg2NtrFLcf0tmYB1I4Y1P+tc8HnY=; b=jnHAU89tkg1Ga+6GMw0ZbGQY8d
 LX8xIu4SOaMbnVGN3sFPrmoErh4M0gTtQUC97O0UgJrWwp7+1YVz3Mz9/MXgJ6fD+BT1kSXgHPh+t
 F9KFzYpdVZm53DxmXfOuX37Mls2RpDP8rfBW3pIty1aLiVK9KoGUG/LbYNDrFUGu/Zgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ryecMT0MDQXI0xjTg2NtrFLcf0tmYB1I4Y1P+tc8HnY=; b=T5v3O4DF3Y55DkVegH42P0HUQB
 kDXX8jrPg/s9Sb3kHmswFZPkToFh0kwCUG3K5ftH2MHdypwe8Mh6CP95q5Zk0ofbo/c9bJdzrt7jd
 c1Vhis/d6tSup9PCFLrY8MnmYujO4S6CSi9YdcX0gw8xMFw7dsqxR8rtTHOKC4RU+8pE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8bC-0005nm-7d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 74D0AA41A87
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Aug 2024 20:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425F0C4CEC6;
 Fri, 30 Aug 2024 20:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051111;
 bh=5HvT4Ii3FEkKfU5sKRbDHNqFEXP1hCHQA4nUix0LiIw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YTNhf9Okvd9+PzUwMBAW+GF8maOawHNjMyPHWCFkW2WK54qU/sYM81ZwjqGFZmmQi
 dA8FnHW5fEqAWuA/Se3g+J2L1rX+y1oucOC2pzvpTk1LwfPVVG9n5q0QcUnUmtvrPj
 TR4GI4h0CJYpZzDgCINUAi4n6s3iwchK+0+QB/o/9nvhAHui383Z5hMAmqZ/nQ3wr6
 sjHuY8Xj6tFGHGA4vWvYTR7u+Nvk4pbvCGCZdz/2NWF0wIIpC0+kpVjzK6oMmmLGGC
 h6hlw2k0Bx28JsZoFfr1jZ1xV8Xo5vxAlEiDcIRTSC4eOYr/LoJUQowimlRZKUTcFR
 bz9iwJ74sseow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD033809A80; Fri, 30 Aug 2024 20:51:52 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505111150.2712133.9357937873277394097.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:51 +0000
References: <20240807102435.2198055-1-chao@kernel.org>
In-Reply-To: <20240807102435.2198055-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 7 Aug 2024 18:24:35 +0800 you wrote:
 > We should always truncate pagecache while truncating on-disk data. > >
 Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts") > Signed-off-by:
 Cha [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
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
X-Headers-End: 1sk8bC-0005nm-7d
Subject: Re: [f2fs-dev] [PATCH v4 3/4] f2fs: atomic: fix to truncate
 pagecache before on-disk metadata truncation
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  7 Aug 2024 18:24:35 +0800 you wrote:
> We should always truncate pagecache while truncating on-disk data.
> 
> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v4:
> - don't reset i_size to zero.
>  fs/f2fs/file.c | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - [f2fs-dev,v4,3/4] f2fs: atomic: fix to truncate pagecache before on-disk metadata truncation
    https://git.kernel.org/jaegeuk/f2fs/c/ebd3309aec62

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
