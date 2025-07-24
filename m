Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC0B1125B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdcv6bJNtJcdxxYBnp7O/xsl6a+4TqgnfaUE4KFrjsQ=; b=TAUUxVCNma879rqX98tqEvOTif
	h1jaG6albtd6FCQGSTMi7CxS1f1u4Kog4W5gNvUU9jv3/vdH8b1UZQlbQTTnl1emGs3S5EvntOzWn
	D/jQCtpEaXvkM53vQPmeXm1ViCO7yiUUZAKiwy07yM+4Vimc8XQLD6lj/7k0Qt9NX/Fk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zl-0004F9-Os;
	Thu, 24 Jul 2025 20:30:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zj-0004EG-Sc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9p//c5sckLA46YASjf0624vAZXdkE5hhB083u9lIFME=; b=brBlxrUYh0TBGSgjmtKeqzOG8S
 vDE4pMOKZkOh+pjBEXKJO+T0tVuUvnK4Kj5MG7rITKjr17P9NkJ1VR4QIW1kGGyF/5cQStNzn0q7o
 v46yUwFW7lUuGhbOIpY5MKkbdtfPO/c3a3LA9Vdsa8lmbQWFSADSlg7HaoHXX9h++pA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9p//c5sckLA46YASjf0624vAZXdkE5hhB083u9lIFME=; b=Noiezl1MtdYoUXNzqaTDGIlV8P
 FmE3pzy0ThtrcDQJ9pNzO4gqpxm4dSFtYDK6qoJPpoAGIwk2hrefMyRxuvdJDtKFHnE6VAyhSdj3a
 QG/YnPlcs4vDufg7Fi56TWkTVtSHyF7vzS1DcmAkkwZnjwqRt+eBLwM+1jnC2z72OA9s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zj-00012E-DN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0516E467CA;
 Thu, 24 Jul 2025 20:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF8FC4CEF4;
 Thu, 24 Jul 2025 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388993;
 bh=LYDvAi+oLveMgY3YmOkXpDoCDiOLM8woIasqX1I8qZY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gKEgLJa1elFugQ6mzuAcPZM7Ri9Nio7lgRkOCpEHtyN1WKBCj4FNcqOTmEw+pRg3i
 C0hkR+gKfnTp82MfabcNqNlzSHJdTuE+w8VIr1pU2OQtj2FhiT1GbgF0+9h2ZDEFBm
 VjtBTITIs8Ku/xRqjMPlHITsFJiI+PVdobmwXo6E6fcK4dsZAG3W+6AOA7KfCbfcct
 3rIs5waVwQFh8/2OjpwFyva9u+LvwWqarE4bF02rei3oI8KMu0kxuS6cJA+bZQLjJS
 Lz9WhOJPu/cPnYyLm1qSdstNFcMMDL6KCSHbWJ0UOLdlrRoLpoRXI8dYacvOPpd9Ss
 BnK0uVoTL+yTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EADDC383BF4E; Thu, 24 Jul 2025 20:30:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338901149.2519964.13246019745046353367.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 20:30:11 +0000
References: <20250722060240.1469-1-yohan.joung@sk.com>
In-Reply-To: <20250722060240.1469-1-yohan.joung@sk.com>
To: yohan.joung <yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 22 Jul 2025 15:02:40 +0900 you
 wrote: > read for the pinfile using Direct I/O do not wait for dio write.
 > > Signed-off-by: yohan.joung <yohan.joung@sk.com> > --- > fs/f2fs/file.c
 | 8 ++++++-- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zj-00012E-DN
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: zone: wait for inflight dio
 completion, excluding pinned files read using dio
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 22 Jul 2025 15:02:40 +0900 you wrote:
> read for the pinfile using Direct I/O do not wait for dio write.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/file.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: zone: wait for inflight dio completion, excluding pinned files read using dio
    https://git.kernel.org/jaegeuk/f2fs/c/3bf1bab503a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
