Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 388689316FD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jul 2024 16:40:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTMsZ-0003jN-IK;
	Mon, 15 Jul 2024 14:40:40 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sTMsX-0003jF-It
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CUejnqb/mA+4criqz0Fi/1ni6R5Q4uJOFqs9hXobKT0=; b=FE2O21T7+g+TXZCx1lxYQR2Adb
 AM3skgcBdsFLUt4AXSm+bPgiKsv+LJpPn9LOBPmt9eFME3LW37NxcCu2ajj1opRbJOSvMcUGQOt3q
 bbuwmHtAvjscjJzIACaDYrr6iaq1CVsb/enPbRT7ErZlEfAOEL8Tt1j8/DU8ND+KAAH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CUejnqb/mA+4criqz0Fi/1ni6R5Q4uJOFqs9hXobKT0=; b=f83MwCeiGYboG4J1+RzYzNw2os
 Hk+SQqB2SQXhX/xPfyrlGobMAbHzU/s6MHeHxjAtHBnLWSK+3cQrRSW5DoJBaIk/hAkMVPhk4tcjI
 zOYzCsmckXSrt+kZoe0XQ4EV/RZs2OBth3nQuofAIho+C9/yckrHUE2cSdKEgOEIcaOI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTMsY-0003Dh-FF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C798611C8;
 Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 100EDC32782;
 Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721054432;
 bh=KzDd9XQYgO857UobzAp/4Deac60lHHMkorgQg6A0eas=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=greNMbVrmbZU+hLx+7PFSF/bhj0vdj3njF1i8X3k9R2h6IdvDOsXSZ3N4buYNmsd2
 RmQY3pScpEXeZPCh+zuM/v0R4P3sR1uXTs5uG6TQN4mBygn3vyyWOfnwFo1AswQRFT
 i5/ZpKZ+VVQFyF/UCq9zstoeuc5MLnkgBnPSNZMXt9hG8eQ3tmsR+jdjOVHNdIgsyF
 P89o74wqhojS7TNDhB80BNJmQbPJ4PDbttswZgct5IAN7YNgGb2fZ77p5CirLNwR+h
 HvuDgSyPMIiwzBW7CSClb8ExAR6W8194R+/SqghXSkSR7QY2/DChbgjT+QRVH+0Sy4
 rLJAIHEOZOGVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0127CC43443; Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172105443200.17443.3328341243004034413.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 14:40:32 +0000
References: <20240710115117.61255-1-s_min.jeong@samsung.com>
In-Reply-To: <20240710115117.61255-1-s_min.jeong@samsung.com>
To: Sunmin Jeong <s_min.jeong@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 10 Jul 2024 20:51:17 +0900 you
 wrote: > The page cache of the atomic file keeps new data pages which will
 be > stored in the COW file. It can also keep old data pages when GCing the
 > atomic f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTMsY-0003Dh-FF
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: use meta inode for GC of atomic
 file
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
Cc: daehojeong@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 10 Jul 2024 20:51:17 +0900 you wrote:
> The page cache of the atomic file keeps new data pages which will be
> stored in the COW file. It can also keep old data pages when GCing the
> atomic file. In this case, new data can be overwritten by old data if a
> GC thread sets the old data page as dirty after new data page was
> evicted.
> 
> Also, since all writes to the atomic file are redirected to COW inodes,
> GC for the atomic file is not working well as below.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: use meta inode for GC of atomic file
    https://git.kernel.org/jaegeuk/f2fs/c/b40a2b003709
  - [f2fs-dev,v3,2/2] f2fs: use meta inode for GC of COW file
    https://git.kernel.org/jaegeuk/f2fs/c/f18d00769336

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
