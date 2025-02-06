Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50311A2B161
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2025 19:40:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tg6nc-0001fz-40;
	Thu, 06 Feb 2025 18:40:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tg6na-0001ft-KN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 18:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+14zVyMVVGvsGLVPiMjlYpeL7GV6+6LA6HUDAT13Pc=; b=JivpOEauimeCllWXbydoDXHrG9
 lw4Y/qXtKBZy0l/UQomHIpipQkD9/Jd9Ve5LVzMK5SYqePe/D/b9rXSXW/EJ/6ecgDK+YQP9HU6RV
 rSAq3KDKmbOFNpjGlFZPW4QZ297/c3svaauL6BUkjFvUvzaLPIIUCv538N6qrdQz0Yx4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+14zVyMVVGvsGLVPiMjlYpeL7GV6+6LA6HUDAT13Pc=; b=bnNRj4O8GAVR8Qng02rWox3Mdu
 xrJ2gw1wv/hsMSmyY5ze5UCr3Q7Yut3H5DlCOJDgOLo+Wg5t9seSvwBW2Cf3ys6v9pSrhW62Wz5Lm
 aw1ZKMu16F+EpMvaMuB34+q95K7AURSFG/1Kvf334Ez5hagZrNQbTtwKYGCOU6v8YW2w=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tg6na-0006Kp-0j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 18:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5EA82A44500;
 Thu,  6 Feb 2025 18:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03925C4CEDD;
 Thu,  6 Feb 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738867215;
 bh=GKRCvxoDED8v3LIDc1YZoI2Ep36aJyEqyXUCeo9AoLU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fbM0nH7MP2S4px703AMFzpZToLv+BCNbWSWExOG58w3JsCUCBlVPsyNYsgJ5JvE8g
 7NcuYr4S0sgIzl4w1IQM4sFOgZGdtBiwDX+nAHz+u/XFgwWfsul9r89INH8rHo8c26
 zmmddd/l+sIsxvCBQYRNyLZN8LdZhxLIgMQLznK3Qhu5KdWTl6fmnTxAsN/ce3ZLVN
 qyyKM+D8Rn+ygAnpECUgURpn+UkDOUofTK9YLHJUsrWvzuN4p+1h+pAaKmDb9TZ1PF
 0IQX3Bcwr5Ls+IqBbj4vd0JXbUAgFKq1kz0yYGte6Cf1dtBwrjj1nbOCY80Jg7Hd5q
 JbHQg/2e5z3Sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB518380AADE; Thu,  6 Feb 2025 18:40:43 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173886724251.1614734.17651671887403590690.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 18:40:42 +0000
References: <20250202043253.64389-1-enjuk@amazon.com>
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
To: Kohei Enju <enjuk@amazon.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 2 Feb 2025 13:32:53 +0900 you wrote:
 > When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
 > specified,
 bio_alloc_bioset() never fails to allocate a bio. > Commit 67883ade7
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tg6na-0006Kp-0j
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: remove unnecessary null checking
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
Cc: axboe@kernel.dk, damien.lemoal@wdc.com, chaitanya.kulkarni@wdc.com,
 johannes.thumshirn@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 kohei.enju@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 2 Feb 2025 13:32:53 +0900 you wrote:
> When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
> specified, bio_alloc_bioset() never fails to allocate a bio.
> Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
> f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
> bio_alloc_bioset() was still left.
> 
> Fixes: 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO")
> Signed-off-by: Kohei Enju <enjuk@amazon.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: remove unnecessary null checking
    https://git.kernel.org/jaegeuk/f2fs/c/53333cdf5b03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
