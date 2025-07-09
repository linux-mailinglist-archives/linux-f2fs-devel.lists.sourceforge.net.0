Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E996AFF089
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcWOvXTovRS5gU6IaZSPBRk9ca8nUSySFeVhDiak5u0=; b=Mkj3YmEu0C/h5YqcYkpqKx70Jq
	4O0IVozh119QB6VpdFe9VHyTnVMmS5Wcq2JF3dbjA5vx2B3j+EfGzFzqh/IIzAs9o06ExHO1opj+l
	GpHi0qmdiJfdabGGUdY610VVHmfPxB9PPNRhoiN71cxw/xzjAemk5yFvM7Od+FSMQsWM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF7-0004B2-Bc;
	Wed, 09 Jul 2025 18:10:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF5-0004Al-VB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HWOpeSr3t+oehSJSHBULj436Ey7BR5gVkKTYM5JW86Q=; b=XTPSj+mXIypQZSb92IiibtKvPV
 /qkexv24GwlM76pUQKf62eh5/6qNbxNRwLjbAsR5cmPsgQ5ZxlDDAbuQ+GK3d/yUg0SdbUtr9MFd2
 +4z8bL5/+XPmW7c84tDGVUcc7VQUiOg5krVGuNbKpJAPbRMGYaPYrNLV9R7ssyE/qHFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HWOpeSr3t+oehSJSHBULj436Ey7BR5gVkKTYM5JW86Q=; b=PoNwmqOiRp0zU1dMosCCCey7/D
 506IUSFQrFolYTW7a7nWRRtNWonI1TC3uB43dyZ8EqZSWOxNLH399Ty0RH7lyiKLqHJKWJRsZcKPL
 RalJurFqg9yhHSHPoiTv13ZVzvND8nFN0lwf67oHDIuydPqXHDW4hd0Xt4yb1pQwigxg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZF5-00013q-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC154A548C1;
 Wed,  9 Jul 2025 18:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7520BC4CEEF;
 Wed,  9 Jul 2025 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084592;
 bh=sA5J+muO6rD3pT+tp/xSgnrdLGmaAE23n4SGICzARtc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=H9Qeq4cZqHeWNs54ca7LX9aAoGcJZmwDX4Bye3hypNcVB9cHo9H2eCg6sIWtVoHss
 zFsPno0WJHDEhqY8mUZ6oCaBe5B4PSXFaJVx3B5F20cKxSikmTHHFJNPaEEQnG1+av
 mRVv3I3JY3bzk5lkJMuIksPSpylGz5ASri3Ky9TAowsozkJ184MlIu1PshchetZve3
 ZTzOI4Niwhf7LF4eCSW2cRKH7O+21JavalY1fwHhWXUtt2tagemJp/uKXoAw2fNiKD
 ap+IfvYj9YnfrWBGzsdbHBdLMoUQqXYllSB8LacTCxFNd+WTYDnVIfBwm9czWDiUR0
 Ll3mV0tg6u0BA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 343DB380DBEE; Wed,  9 Jul 2025 18:10:16 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208461478.806926.9492710512867516204.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:14 +0000
References: <20250625001336.1937-1-yohan.joung@sk.com>
In-Reply-To: <20250625001336.1937-1-yohan.joung@sk.com>
To: yohan.joung <yohan.joung@sk.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 25 Jun 2025 09:13:35 +0900 you
 wrote: > to allow users to dynamically tune > the boost_zoned_gc_percent
 parameter
 > > Signed-off-by: yohan.joung <yohan.joung@sk.com> > --- > fs/f2fs/gc.h
 | 3 + [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZF5-00013q-Ek
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: enable tuning of
 boost_zoned_gc_percent via sysfs
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

On Wed, 25 Jun 2025 09:13:35 +0900 you wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v4] f2fs: enable tuning of boost_zoned_gc_percent via sysfs
    https://git.kernel.org/jaegeuk/f2fs/c/956b81b3d41a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
