Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045ABE50C4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 20:24:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4mydVU3wq+d5x0RCYLB1lXjg4Jyz5xt5byfNjTKJpE=; b=ej7tDAz6jQyinn6t7RzlV4V40S
	mCI07/5Tm/vgFEVNjOSw+wcgwnXzWzLwlv2B7gm5U3sH7Wypc7g/48Yq8AJ2m3mq6ASMNPazQHkJ7
	2dqa0XljfE/GmklJr8ABhB6G+/GqeUVMHL9VrTLh/MNhTfwJa3f/Be7Jr/R4pos96KfA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9See-0006YF-7H;
	Thu, 16 Oct 2025 18:24:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v9Sec-0006Y7-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yHASrSkdLDXdCmktnbcdvT55e8AtZzrIDarMPTEj6QM=; b=KA2EAGW86/EwxREq/1J/KGpgzc
 ieceILtF0fXXjUQTKGsWKmVEaZ9pU3LzRuT1OxAuGhm1cu+cSWWT0TqbnkpTxhqY0XfhNiJZClZt7
 Criy7Hjc3nP2ldhn2Buy3w6xJgzBREbGurGcAl34Dch8Bmgx8f0E8FTJczXQa2h4LDJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yHASrSkdLDXdCmktnbcdvT55e8AtZzrIDarMPTEj6QM=; b=SvnKUmxmwI6kBoExOj/wxzBm/e
 7CeUuMYb0JyfFWkFhX8IudC1Us4mN32Xoy0a1qgjPwXD4mosPte6hiDgXPNQRlycuyeBHJVU5039m
 dnPqwUOdf8hi9UX7y4F8H2r+6Qa/mk+FiOAHJB3nI/jTWk/s+40nLHbxENuC9eXGCJFI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9Seb-0001yS-VX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AC70743BF2;
 Thu, 16 Oct 2025 18:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E02C4CEF1;
 Thu, 16 Oct 2025 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760639075;
 bh=TPTHCPwqGZ9LOOxGmtMZ+cselDo9inzb2+E40aM+RIc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SAPKydVdK5R30Jule55EwpR11Eb1Kh9FiLjoLwYfpyLCzR+sCRDx/nLzzG6+aRByv
 3oD2sqLGaV9Q7nXcD2/EiU2auzSrBxS1rkw4F+pBPN/PSq6xghguRgqG/4Xq/XjdbX
 UC/CqWIBUrUyLnUDMsVd2W7OxmcXaqHqY1pQJXAUCak+KxpXMH7Q7TjI3sxngIXU6q
 JBfvcpJdXJSAKIK4FIIXE5qzyntTwqdzOWgGNYzDpAGVBOdmII7D9XMEjFHM991JQx
 IwtS+yt0LcQhdWtREoV1qaHqHPNmDrhtV3LoWYGt0t+S5nFSyn2vfhjEl+uTpTuHoZ
 wPnwVM28lGaYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE2D39B167A; Thu, 16 Oct 2025 18:24:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176063905975.1852182.15050146332743005367.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 18:24:19 +0000
References: <20251003224308.1948874-1-daeho43@gmail.com>
In-Reply-To: <20251003224308.1948874-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 3 Oct 2025 15:43:08 -0700 you wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > The current version missed
 setting one time GC for normal zoned GC > cycle. So, valid threshold control
 is [...] 
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
X-Headers-End: 1v9Seb-0001yS-VX
Subject: Re: [f2fs-dev] [PATCH] f2fs: maintain one time GC mode is enabled
 during whole zoned GC cycle
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

On Fri,  3 Oct 2025 15:43:08 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The current version missed setting one time GC for normal zoned GC
> cycle. So, valid threshold control is not working. Need to fix it to
> prevent excessive GC for zoned devices.
> 
> Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: maintain one time GC mode is enabled during whole zoned GC cycle
    https://git.kernel.org/jaegeuk/f2fs/c/5d431cc8759b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
