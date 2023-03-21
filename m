Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7E6C371E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 17:40:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pef2F-0001Ol-Bd;
	Tue, 21 Mar 2023 16:40:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pef2E-0001Of-Rf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6527N45SdC/F2zwWM/SDMyHX3zqq35L6jmxYK70VKHA=; b=L8A9Ec5AB9+Vjw3MxgdHyoK6wj
 ZxGBVqTGd9b/fXXWacSRGKbqYoyS70BGogKwMgpN8BQI9/Qn7mfpyHWWTRn16kq8HMqCHCNViphGd
 vIuZsMCM9a+jDXGUoRP/Jhghe820lLDhZfWFEe+no3l4oTy3P0JS9LTpi5g3R6VwkMQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6527N45SdC/F2zwWM/SDMyHX3zqq35L6jmxYK70VKHA=; b=gckzzripGSZrdSJ+etfbiiPSGB
 kOV0TWWnXki6P0Ze9s/ULduqYV3/fUMlMf1QjohBlfe7Tk8Ii0CCmye2gAa1rkqoFDr93I/QU3xH1
 2ySo05IjI9k4YO/eQjW6J2KQJhyWDaQbiRXKDoCZLUGLfHhM/6yvMlrF7gzdMfrqiknE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pef2D-0000hH-Ld for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 304CFB818E0;
 Tue, 21 Mar 2023 16:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAE07C433D2;
 Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679416818;
 bh=3rDLFVHcU6ma5+cN0vAvs0YCv2Sk5f2f3Irv+23Nd+0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PTyJ+slN6Kya1SR2N5ikXvIMXDRToqPgCBWLSYxyhbj2vGjsoY/Gt2zX+OoIEHnOf
 q1B8o7eyDU3Qawoow+mw0W+j524OCMrvKShRh9hP0BZY9kDOkNVDJdy7iZ0914dl/S
 bIW6AM9fUfd3hTEGVKV7sXfUowwCUqiSE2BUG50HJ78nU+lfMQ7flUsS2ubzMPjr21
 LMaWJ5WeTtI6Z394qoSqOC9Pcwr8dHWN6L2W+6JApm0on7bJBcBtELFAsPIj16jLWd
 vRthd7JAXRgrIb0UVIu5XiDp6KKsgGoPk5kl9Ph/EPZflGsWwFvDoBKtfZOC7piY97
 f9QN5BWSuA5RA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B83A5E66C97; Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167941681874.25004.16164429117786681993.git-patchwork-notify@kernel.org>
Date: Tue, 21 Mar 2023 16:40:18 +0000
References: <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
In-Reply-To: <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
To: Yonggil Song <yonggil.song@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 13 Mar 2023 18:48:25 +0900 you
 wrote: > When using f2fs on a zoned block device with 2MiB zone size, IO errors
 > occurs because f2fs tries to write data to a zone that has not been reset.
 > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pef2D-0000hH-Ld
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Fix discard bug on zoned block
 devices with 2MiB zone size
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

On Mon, 13 Mar 2023 18:48:25 +0900 you wrote:
> When using f2fs on a zoned block device with 2MiB zone size, IO errors
> occurs because f2fs tries to write data to a zone that has not been reset.
> 
> The cause is that f2fs tries to discard multiple zones at once. This is
> caused by a condition in f2fs_clear_prefree_segments that does not check
> for zoned block devices when setting the discard range. This leads to
> invalid reset commands and write pointer mismatches.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v1] f2fs: Fix discard bug on zoned block devices with 2MiB zone size
    https://git.kernel.org/jaegeuk/f2fs/c/5108a09b11d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
