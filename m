Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE330C50032
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrxJRHhlNxbxKXItN8weeClK8c+hg8tizGfnEgNCoEA=; b=E4jbYt1FrI04TZ2IB2nbkXD7ei
	2DJWEmZ4BvIgCgspJcNAtLZZnhcb0xQYwHIq6EVXj56K3VBuZkzglD33/c6AV8dPe9qAvxfQZS1dh
	Ekxfgj463ztVEz9W00eRVeFTs/ET5ld3kKEo6fb8o0kXe/pKxRtSLhPiSWvpqQQ3a1Ak=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCk-0008UW-Se;
	Tue, 11 Nov 2025 22:51:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCh-0008To-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+lhYZ65D5rS51OljvZt496ol2qV3x8VzqDGXCM/R1U=; b=Ah1qlm+ddiyKcaQF7w5kI/+Zod
 2CQHn7tqjyvzJrrSXcScv9khmZ5PZFbjV3e4+RZWmtYlrcWNtLWagseT8Ogf7AP5qJmCQkOMYmqSI
 dw18yGO3uhmA8ms3x5tY1Q1MPSj0XDBVLUHN05PuQe9trV/ISSXMv45Mzzy3wrAyPagY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+lhYZ65D5rS51OljvZt496ol2qV3x8VzqDGXCM/R1U=; b=auEOVGN+L7XK1OIwVne9AnofgR
 xkWa4WIkbBY7AWKo7n/cYHV3Yy2SmdCvC8BWGyICbMV4L43XOhCBVqb2PYDU9QF0MBGeWFmwJAA/d
 OjdB7SihHbZBzRBEvEljHwTsxTxZaPrWeeaWrB8qz0byDVsxW2NNCG03MUMq6h25zepk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCh-00048b-B3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE4E560051;
 Tue, 11 Nov 2025 22:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4D2C116D0;
 Tue, 11 Nov 2025 22:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901460;
 bh=u51U8yVkwn+sqh38JGcORAerkrd9IH4FeT/eOeCwWMs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cFL9lVU8P8B2/FgWp6hFLkhO91Fq6rOeAvHISsN9tQvyuIL1WuHHXdaARX7v1qBwM
 a4bhiVaTySMFg8DbTTYtU99hX46T1hopgYn4zgJW0ry6mn/o+tTnbA7t9BJdafAlij
 vWW1bPNlDftqWyPCycJPe+LknhgWuRYb/p7mMxbqq+v3Mh7PUPlyiGHF3DZxcvRRZQ
 +E/7G5TZkF0au7h4Ycl7StFz/UNwRUi5iLDsB7tLzTVN7NcUDxZiO4f0wjBLibAfIK
 lUSbxNm+MXHlJUhx9TQuAq2NQynjgywcgOqPDBamufXfitqoi2Xvj/pIEQNAOLHwhi
 /13YQ0BIrQ7Sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDA8380DBCD; Tue, 11 Nov 2025 22:50:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290143023.3596344.4932276486991628363.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:30 +0000
References: <20251010-origin-dev-v2-1-952a3c98cd9c@amlogic.com>
In-Reply-To: <20251010-origin-dev-v2-1-952a3c98cd9c@amlogic.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 10 Oct 2025 10:45:50 +0000 you
 wrote: > From: Jiucheng Xu <jiucheng.xu@amlogic.com> > > On 32-bit
 architectures, 
 when GFP_NOFS is used, the file cache for write > operations cannot be allocate
 [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vIxCh-00048b-B3
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Use mapping->gfp_mask to get file
 cache for writing
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
Cc: devnull+jiucheng.xu.amlogic.com@kernel.org, jianxin.pan@amlogic.com,
 tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 10 Oct 2025 10:45:50 +0000 you wrote:
> From: Jiucheng Xu <jiucheng.xu@amlogic.com>
> 
> On 32-bit architectures, when GFP_NOFS is used, the file cache for write
> operations cannot be allocated from the highmem and CMA.
> 
> Since mapping->gfp_mask is set to GFP_HIGHUSER_MOVABLE during inode
> allocation, using mapping_gfp_mask(mapping) as the GFP flag of getting file
> cache for writing is more efficient for 32-bit architectures.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: Use mapping->gfp_mask to get file cache for writing
    https://git.kernel.org/jaegeuk/f2fs/c/2308de27c03d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
