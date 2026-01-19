Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1533D3AACE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy5Iknpqj9Y1sDvwEDjUzbsjIG3uSg+1D797vk5YTtU=; b=VuvjrNLEY7bBRuNzSRXtPqB5JY
	9SsPdI9PISoAhZRBA47Fd0gOoBYeX+ximocDxb9sHH4tGhJGBYlt2YjbdTAee4glyHQwQIZE0x7+A
	//MEJ37+qp/w/WMaz2/99Nlj5i036Cgs0atpfF1JjCjxVJPZ6fDN5zQaGIXfRq7aF1Vw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpiB-0001wY-J9;
	Mon, 19 Jan 2026 13:54:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpiA-0001wR-Dl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLFrp5RRyFbYeuSqx0b5uAtLk1Z/toATRNQiG/F9mPo=; b=KozB8/RwYL79C2GxjbUmCk2Jei
 SWjLYZm36gq2kFWz2lXWeC2rXmcqghVLNzS+QU0ELvThdTxvAfFKX/mCyXmpW/hdeYEGNJwOHNgiV
 5XGRAHdNETQ/TGd1c+J3RikIqAtpYGLz1cbZ4eLeWcG8eGvMiWftb1dLoCSx7T8Bm8/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLFrp5RRyFbYeuSqx0b5uAtLk1Z/toATRNQiG/F9mPo=; b=Uyc3LaD/avsjgfPRUOHOfL5GKY
 nhQ2rjiI9O+iVUWG7k+xn/ieUchmG/RpRYHD0KwWGliL7rDG5OuUSYm2wcklibfyZ3BIjENP+WOVG
 va8FkLknqtOPRaek9/30Ld2vOjPGyKlny6sDE3WG41Qvu4tSC/PhaYsmL68Cds814InU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpi9-0005rC-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8B2843D06
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 13:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B830FC19423;
 Mon, 19 Jan 2026 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830863;
 bh=AmkN3V1zZD++ylmgAj+zqcls9tAJiGnavCjdI+MXsj8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KpNcCOlPfVT+GHciUaDT7lP+2+DjC+897Gr9wbBuWv3dDCgfULPTRdow10tJqSyMV
 QpAnDjFQmGDD4NAejhS+I/47i2ep+xcpjl+wU2XMKRHvnTXer6Ymv6fj802wpqL2ko
 8hM15YzItLpI2RutAm3lQBZSp7JKqLuC3Gmo4eSn4s1McNSSZxaSDoEN3KWTq6+myR
 qAifXnhSrHsByB3U3Fv0DH1HVSBv35MR+CCImjykAev+tQrY5zBQhTtKUQK8n0L2Fc
 RC1C63B8fc0mDkOVUyUDPs3OwYg42RxZc8PlEst4W9VIwKYh0+o4Y+dKzoQhi5YEEf
 5hi88aevdHOUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B58C83A54A38; Mon, 19 Jan 2026 13:50:54 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883065328.1419958.4608417190161935533.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 13:50:53 +0000
References: <20260112013320.8028-1-chao@kernel.org>
In-Reply-To: <20260112013320.8028-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 12 Jan 2026 09:33:20 +0800 you
 wrote: > For consecutive large hole mapping across {d, id, did}nodes , we don't
 > need to call f2fs_map_blocks() to check one hole block per one time, >
 instead, w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpi9-0005rC-T4
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for
 consecutive holes in readpages
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

On Mon, 12 Jan 2026 09:33:20 +0800 you wrote:
> For consecutive large hole mapping across {d,id,did}nodes , we don't
> need to call f2fs_map_blocks() to check one hole block per one time,
> instead, we can use map.m_next_pgofs as a hint of next potential valid
> block, so that we can skip calling f2fs_map_blocks the range of
> [cur_pgofs + 1, .m_next_pgofs).
> 
> 1) regular case
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: avoid f2fs_map_blocks() for consecutive holes in readpages
    https://git.kernel.org/jaegeuk/f2fs/c/fe2961fb77e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
