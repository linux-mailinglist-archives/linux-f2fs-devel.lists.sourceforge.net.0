Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61238C50000
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atDFGb3Ex+s/PP+W13mVA4OwWniqx3xdfLZUo8A71Is=; b=nCLHwUSRR9BZdzzGdi35TZXyS1
	F3Hl+qUK94ylwN20ixScZZhRiTi6Y9gQu7VvHwQAfpJBSs/ijpXN3VBgoYoy8FFD51tgBeMcr+aLl
	bg5F+zh56gA7ktySu2m8OHA3RJP7CbOi/ofBAuwMC5zyXYGz72k8ryv14z7vkUk7sNy0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCT-0004b8-Dx;
	Tue, 11 Nov 2025 22:50:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCP-0004au-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jkUisRGrOYRfKmnyO3uhG28xxtG08HmE3ivrN+hfvNc=; b=fNEP/Ywvnz835Bh7dLTsLUSgHu
 MRPlumNpV7fHCMhS5CZC7mpSIS+yYuFN4fvkEvZmAnKiDgKaVYU3UzdEb48Qc//8xxCE7/9V0uIiN
 L8wGar2IxFnLHmyLfNVH7l7NZHgsgCaOxVpxYCWHPKFP4Ycd8tXAfe0NzXJLfYLdBpU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jkUisRGrOYRfKmnyO3uhG28xxtG08HmE3ivrN+hfvNc=; b=JcnPP1QooBeN0/G90p2es1pe8v
 rjuji2bIt8MvcgTZ74WKT/g/pkWVMUiArqnwBKssv+aqVH1zK1w5oVL8cNYX/iuUpKHbxTd/aBuyP
 Da4Rz77Odkcn8EodULEzk+Nn8jV0xHsYUtLoJF++C0OoDEn53Q/sG/rsbrhpaSw746BQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCO-00046A-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7479243734;
 Tue, 11 Nov 2025 22:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5752BC116B1;
 Tue, 11 Nov 2025 22:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901442;
 bh=k7EjqMDIXZOmAEX20bRumuCAP0u89RkyCZoaXm+jFug=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Eau7k2KHVnHTTROVeAzCv4PVFCDlX/6akmpwuIvNALZI81Isw6M/afwH1L2m4PdNp
 T864nvv49XxgjAoQDks6DQ3le387FFxbEWDl99F1LNWLQreBU6LvUPlmT/53a/ab2N
 GboVE+uuxH+Bz1EXP9RbGkHvRh2HikQRIS8lb5HKpUWLkVJ/ySU4F+YyFszSb6s38L
 tY1RAjv1k1thd/hZvJZvkbZ6JHeeW44IgvxGE4E58sBaZQhQ0n+MQCby6zrIhFw20/
 x9a2/AV6nBH84gNqcbTHA5rUa0ivBjvVe4ObVnKxmO0D3FIxocVdDgC/mYL1s1VbLe
 tv7pWOU0b23Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCEB380DBCD; Tue, 11 Nov 2025 22:50:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141215.3596344.6840868487944552761.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:12 +0000
References: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
In-Reply-To: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 24 Oct 2025 22:37:46 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > When F2FS uses
 multiple block devices, each device may have a > different discard granularity.
 The min [...] 
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
X-Headers-End: 1vIxCO-00046A-Ns
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity
 accounts for all devices
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
Cc: jaegeuk@kernel.org, yangyongpeng@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 24 Oct 2025 22:37:46 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When F2FS uses multiple block devices, each device may have a
> different discard granularity. The minimum trim granularity must be
> at least the maximum discard granularity of all devices, excluding
> zoned devices. Use max_t instead of the max() macro to compute the
> maximum value.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: ensure minimum trim granularity accounts for all devices
    https://git.kernel.org/jaegeuk/f2fs/c/5dc50bdb96e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
