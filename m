Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2ECFBDAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 04:34:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj7Usa87n3ppuMj0fBznCGVUfTudhcAFy3pQGpPTwNc=; b=YD5sc31hxYXmddDnCjB78v6nA3
	mXWHpv+a3OyMEaXRobO7uSOTGhQYzeJ2R05zNAwRCpSkKZbLmw3Vy8m23en5sHayX5Mgz42WCbJ/W
	HSudPuo6ZtkxhWsj3FgnfU2bjFKoAPd1ugLWOwRRbCHcLXkmU1myJqAxkBFToCY11yfQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdKJ6-0006rQ-57;
	Wed, 07 Jan 2026 03:34:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vdKJ4-0006r3-KR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ckPAeNTpYWUncJSKK2WVpKk2OHkav5fBifKui6eku+w=; b=JXUAtXy7O1h/Fd/toC9ZIUfR11
 xIeViWyGb5rtJP5TTbElpYrrAM5SEXZpsfA66OLmDkbMzNqFQqhdLVVQuohfoBJRxqOgPPh87rKTo
 cWBxNcL8TxjYIzwZkcmnfioIKjzTtHqO5R8ZXyDE/R11woSbedJ5eIQtHkl+D8N5mMoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ckPAeNTpYWUncJSKK2WVpKk2OHkav5fBifKui6eku+w=; b=i0ZhbTBYpi2t0c8ux+db1hX63P
 idKM2Y+1BFcGsQy+zN273GVxGhc12CQekrxSB2BtucAzO/i0j6BZLsmV39I2NWZWCZjVSC8DAV5+H
 m7/07tXdE4f+GZ6kFvChGTKnhwmYkZoaGJ8qPdZNJCDRPzmDBKsbFQ4qF0Zx4H0AMyPE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdKJ4-0004Yv-Sq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 03:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B6A060143
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 03:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133E2C19422;
 Wed,  7 Jan 2026 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767756828;
 bh=Z8YzZTUBiepLj+U/Fkl1l4bQThUI8aKSS65n8kdUvEQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YvQvh2gYZYHwAscYVCGeq8iUDR1rygrAlCY7jabTDx2f49OWxFItKajLf53kRlDd1
 8cX7knW62u4/jFZdWsJ0eWpLLYFBUv8mPP3fVw9t0lTi3OQVlxEoWckT8+y2AFmYWq
 R2GXk+4igeN0NWM3X8DQEcZbjlmKzomccaSZGIqKmjx6Mjji5dSPc5oEpJkk70nfZ5
 R5CX4LlPxmdvo8oFJg6GuASPmLZDITp24g5X+1mhGhrotQJNF/LURx7qHfU6mn18ZO
 Qt+75DYUqG6qDl8+fOuY82bs2ofk9DtMusQcPykaDJvRZ9FEqF+YBk1eqPlAVIP4hj
 SiH+PcX/dbpLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B5819380CEF5; Wed,  7 Jan 2026 03:30:26 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176775662527.2218650.14445074864041510077.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 03:30:25 +0000
References: <20260104103412.46331-1-chao@kernel.org>
In-Reply-To: <20260104103412.46331-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 4 Jan 2026 18:34:12 +0800 you wrote:
 > Use f2fs_{down,up}_write_trace for gc_lock to trace lock elapsed time.
 > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > v2: > - fix unlock
 gc_lock in [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdKJ4-0004Yv-Sq
Subject: Re: [f2fs-dev] [PATCH v2 06/14] f2fs: trace elapsed time for
 gc_lock lock
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

On Sun,  4 Jan 2026 18:34:12 +0800 you wrote:
> Use f2fs_{down,up}_write_trace for gc_lock to trace lock elapsed time.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix unlock gc_lock incorrectly
>  fs/f2fs/checkpoint.c        | 10 ++++++----
>  fs/f2fs/f2fs.h              | 22 ++++++++++++----------
>  fs/f2fs/file.c              | 13 +++++++------
>  fs/f2fs/gc.c                | 23 +++++++++++++----------
>  fs/f2fs/segment.c           | 11 ++++++-----
>  fs/f2fs/super.c             | 14 ++++++++------
>  include/trace/events/f2fs.h |  3 ++-
>  7 files changed, 54 insertions(+), 42 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2,06/14] f2fs: trace elapsed time for gc_lock lock
    https://git.kernel.org/jaegeuk/f2fs/c/e605302c14ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
