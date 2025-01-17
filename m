Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F29A158D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 22:10:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYtbi-0001Lv-GA;
	Fri, 17 Jan 2025 21:10:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tYtbh-0001Lo-By
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 21:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nDozIooAqfeVtAIYMaBOQJARF3wAjXJTqY5eGs+Mn1c=; b=W38jpC0dT6FpzLQ0l1YehLrfMW
 4ab8hNjKJdDMwDqoXlvT7Hpis7nmZoh9Bd16oyVeKeAFK5chVpsbLEVm+OCqtfCq5wczL+cyllttk
 O25nskCEf3MqZl9fKO2TV3YZfnds6YUT8Dv9W62vMH922iTtVucIUYM6N+jJJaMhFa3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nDozIooAqfeVtAIYMaBOQJARF3wAjXJTqY5eGs+Mn1c=; b=RhyGCjN3v3PXBWDsklT0WMR0nf
 NDUAzTqS2iAgozk20m2V/qLwutS3UCSK4nIpPmHgBOdsROPjlxaCB7se5Mp8tP2nRH4adZ6/EJXfW
 QOKFyrSNsU04mZcmJV5mFxkOtysBf9OzNdekqerr+tzwdjQtt/WPIKX52jpVuFf+h8DI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYtbg-0006mm-PW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 21:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C349B5C64A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2025 21:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C68C4CEDF;
 Fri, 17 Jan 2025 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737148210;
 bh=i+Biox4wsknHdo+bROaKTXqbzMYBEy6SCBhwbWkal7s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D9UH6zzsDNUSYBaSnEHXmHCG/vNrU698ccDelS1lKfX7MLGt581p1eBhSuH4zdMaG
 X1sEgjS4wckeq3QRtbiVtjyeGIfbKMISHqcM8bxIXsTkiRv/yM0tdVQSQ1SgzYX4QR
 m0BibQIV4u7vWSL6i86VKuCtYTgvFvuSPKv91IIW3RVjjWKmqBEJ5hhdkAMNuMZ5QS
 hP0psIxEPwiDy5Y5DZgytTzmPdlsNMy5RKloEcjuFkvPUH5XmFsWY2Gwur26Gvgw9l
 MLHBsvu3rsfd6tPZMHgIUxmGhkEtrQs5ZeCnPaB60McG4vnBV5S6yKEKPnGG61AKVW
 mfDhSzdD9v7aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADFDB380AA62; Fri, 17 Jan 2025 21:10:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173714823352.2259050.12036983333145168110.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jan 2025 21:10:33 +0000
References: <20250108181908.4148111-1-jaegeuk@kernel.org>
In-Reply-To: <20250108181908.4148111-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 8 Jan 2025 18:19:08 +0000 you wrote:
 > Let's remove unclear blk_finish_plug. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 > --- > fs/f2fs/data.c | 4 ---- > 1 file changed, 4 deletions(- [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYtbg-0006mm-PW
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove blk_finish_plug
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  8 Jan 2025 18:19:08 +0000 you wrote:
> Let's remove unclear blk_finish_plug.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 4 ----
>  1 file changed, 4 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: remove blk_finish_plug
    https://git.kernel.org/jaegeuk/f2fs/c/4811fee8283f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
