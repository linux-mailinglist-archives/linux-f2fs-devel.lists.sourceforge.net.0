Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BAEA66511
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Mar 2025 02:30:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuLmf-0008F0-45;
	Tue, 18 Mar 2025 01:30:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tuLmd-0008Et-P6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Klex8/oVqmjH/Pqr7IoVJH0gH3iEnAIDQzivTuGWt+A=; b=KZKDGqou5yyoYa9rqIdD0H7O0B
 /Up7aW4jJijlZQTKvwXQmQJ9RjvM0BBE2NFv8gy/mPhNfKZQxH2t86+v+SApYty0tTU+seIXysGNN
 WUC6XqjuMtKERndIyiWao5m+GkI3SVi8aovQLGLouOVai7H/XT56bUtNzJzZFnM81d0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Klex8/oVqmjH/Pqr7IoVJH0gH3iEnAIDQzivTuGWt+A=; b=Iy6dur3XJNcI/kNznQnWKLfS0+
 PPSipbP2sNNMsDc6TwoYXVeGeMBTvblaSMctEfZNbvtuzv7JeGc/dUMNwuILsbLHVCte1G0kg57Jb
 NQ/rlwA4pBqP+S3kFqcIbIexXJex/574kryJq7sjZMxq5VlfVNP++45p9fjSkxDCCmxk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tuLmS-0006sW-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38FB2A48E3C;
 Tue, 18 Mar 2025 01:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C75DC4CEE3;
 Tue, 18 Mar 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742261397;
 bh=qODT3Q9/1WjT2glxMbxvM/9CfPGjd3ZnWgJhKz5zS2M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aFwdSjhQYQS2Pi0fdcGJ26rOL2ODWWEIklq2fQcvT9clt8dvsRFOQAlvgqs6JlIeu
 CbL6RmWtNJ+o2OUNMLv2TUXOj7t9dRf/elt12vvyswh+KUAl2OOKmiWtpVtR8W3t3q
 wsPkvRQ1m6srQ1eDrTXfjdSDGLFxJlOeNxNPMl/19qPKkTEJAPYaoc7A++cYVScFev
 hHk8nEQKnpg9ejzsAzRlL6d0j7tx4RGLj2luNUKk+nf2aNhc5cq8upKpY1KQW2A21s
 YJoOsyWc6J1geYXOkWaNeySgRdSsDMT8S4G/FATMZEysQkorYMy/V+9iZBaBCgSrl3
 8ExYlH1ImHoIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB02E380DBEF; Tue, 18 Mar 2025 01:30:33 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174226143279.3976340.11320826422025580869.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 01:30:32 +0000
References: <20250317133611.457-1-yohan.joung@sk.com>
In-Reply-To: <20250317133611.457-1-yohan.joung@sk.com>
To: Yohan Joung <jyh429@gmail.com>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 17 Mar 2025 22:36:11 +0900 you
 wrote: > this is unnecessary when we know we are overwriting already allocated
 > blocks and the overhead of starting a transaction can be significant >
 especiall [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tuLmS-0006sW-Hw
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: optimize f2fs DIO overwrites
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

On Mon, 17 Mar 2025 22:36:11 +0900 you wrote:
> this is unnecessary when we know we are overwriting already allocated
> blocks and the overhead of starting a transaction can be significant
> especially for multithreaded workloads doing small writes.
> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/data.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: optimize f2fs DIO overwrites
    https://git.kernel.org/jaegeuk/f2fs/c/351bc761338d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
