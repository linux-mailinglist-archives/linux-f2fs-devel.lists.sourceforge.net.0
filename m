Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E9BE50D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 20:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zqbp4VrlrsYuk3xe/3e6/xSfFZ+rT1vJcyPReK6byY=; b=Cxgqk7zcPN2cMj8z2N4ZD0pv+H
	bOEAxaAyVVlfbPy3vpw02ongjP3Xq1kZ4uvMtWi8DK25uoslpq1Mjm7JvbXM0HX6mi2gtF3T/o1+6
	gn743aGtxwhCRqbi4mz6fWm71GetHiXA1WPR08kfkZd9DdcG6qsUEIyfLUO1YFnJZQso=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9Seo-0003XG-WE;
	Thu, 16 Oct 2025 18:24:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v9Seh-0003Wt-2C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLejMYbXQGzJ5lMtMeru7CchvCdBbqgv0I2wcQtiIyw=; b=EAsdxdObyCjmybgddpjRPDzx7B
 jSjE5rBcfyS4olmPxxfgGLUpg4etaD5mWz0d9wMz0HQIcCaZwHPiaUEjRcI2V0h23NsmFRE2thGyV
 YemcQ2asqahIJmPURBxk2muANuWf55/ZgHng4PhZ9/BQJKw23G20kA3VQHbJqEtisLUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLejMYbXQGzJ5lMtMeru7CchvCdBbqgv0I2wcQtiIyw=; b=kBcj/3XTNeOwwqjgeQYrT5UGsk
 +M/a8m4NsUHMTTvEiGTGMmRHSH6pEQWPIHf3EwdV+xykzos6MiYQFI51Owrn83Qo3hn1hdh7CdXNS
 vsczcIkfcQ1W7jhHUGlrCH0ev/Ez9ucMcANk2BW1qFGPdVkm3h6947an2S/Ir9x3e4G4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9Seg-0001yv-HM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F12066040C;
 Thu, 16 Oct 2025 18:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05CEC4CEFE;
 Thu, 16 Oct 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760639079;
 bh=3G6NU7adcx9IxXLVXQAvw/QZhqU2AWiAKM0inqmninM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=goe5tqm1EaTaojhQIPSv05S1b2ECgZeF+7CrBlLDSrRa/fYLmOOG0qA6wF8ZPyeYX
 Tnc8YPJcnI/fMOEZAwojiR59ErBATIQ0yp9Tp31/e/uZ53LWt4rr0TVirD2UKDhwYQ
 qVxeX+lqEOajUkBJmYl2ueJVLMfLBpZO8e/N6+0C9QhnhEtkAhL1fr8ZGzd4PJMaDs
 pMA+VrF0ZmZXuVsbi683lQ9iQTxGI2WyvlYwbpxdlbRYVf5tK9+a0RhzcQwTOf3iG7
 PsbdFIRCebo4l2czY4dXSGQ/h3MSjG9bSuNLiFTQU/TJQjtco78AAF6BTBTcpbtA2u
 +loGqfSFSXE2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33A7739B167A; Thu, 16 Oct 2025 18:24:25 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176063906374.1852182.11763854243841197701.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 18:24:23 +0000
References: <20251007164614.3631594-1-daeho43@gmail.com>
In-Reply-To: <20251007164614.3631594-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 7 Oct 2025 09:46:14 -0700 you wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > Zoned storage devices provide
 marginal over-capacity space, typically > around 10%, for filesystem level
 st [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9Seg-0001yv-HM
Subject: Re: [f2fs-dev] [PATCH] f2fs: set default valid_thresh_ratio to 80
 for zoned devices
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  7 Oct 2025 09:46:14 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Zoned storage devices provide marginal over-capacity space, typically
> around 10%, for filesystem level storage control.
> 
> By utilizing this extra capacity, we can safely reduce the default
> 'valid_thresh_ratio' to 80. This action helps to significantly prevent
> excessive garbage collection (GC) and the resulting power consumption,
> as the filesystem becomes less aggressive about cleaning segments
> that still hold a high percentage of valid data.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: set default valid_thresh_ratio to 80 for zoned devices
    https://git.kernel.org/jaegeuk/f2fs/c/9a25aeb2be7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
