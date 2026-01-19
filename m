Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF11D3AAC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alaMvtC+T8MCVMCDR3LEXTzabqbIU0CHIA7vooFsXtE=; b=GYXlzV8xxhqavs20NlINW+vbLO
	1Ti4CQCsDGOGADRJErIAJwDq9hHYuxrf3t8bRgtplEnXlxnyAeZ4SLPn8t6D6FrTaseS58r1Nd9Jg
	UsciUeyna6XCnWrwrkbDCmpb3na+Jxo+1WgQ5h7CltcQoq9KJtuMlsmWUWf3HU/FDZV8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpi6-0001vx-7m;
	Mon, 19 Jan 2026 13:54:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpi5-0001vq-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8PMwnU08sVWzFHctfcdbIvJ4dhDkhRmZnjT7UCYUNJE=; b=lJ/kiFzEfwmCLTqBaO+U/Gei5Y
 j3zoqKHvenPgAIIbOalyXnqtlb3svSbVg79h9qrG/N0KgOkRW/3kLpaes9rk3IPxhKEv+MUugsCM1
 f5wrEiUt3zD+t/ZajZDFCj0kLEFtDWDX/dDNgL0QeGmBXm+MgPeo+j8MDAJa+RtqKuqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8PMwnU08sVWzFHctfcdbIvJ4dhDkhRmZnjT7UCYUNJE=; b=V3F2b5Ba4z28Lr+t1pK4UoWI/L
 6FD6DlapUwFFbzG3Z4KVVUgwpUmr9nAmUSC70HG4RAF+7+Ap9cEBPZsBRUD9gqTZNKrNBG4Bfd+3D
 O8jniHrdD+LEMzZRhQ1cIwoU2ZgosL1TvleawsgJhOThiMljjX+2Yico3lgbnujvqwHI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpi5-0005qy-0R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A2CF143839;
 Mon, 19 Jan 2026 13:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5D8C116C6;
 Mon, 19 Jan 2026 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830854;
 bh=2TxeKMGM/EO9J0g5+XpBxICPs5e6cKerbY8GEQkCV7Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=li7olwVoTMoc0dpo0c4NxsCvt4Q2dCqxDlpMVSZ8QYbXbYGG2zZw6vrpfPNKdkIGY
 CNurihfKtQbyqHpduwWt741neOkQJI9y7TZd4NJ9Ohhc6e9mMwraIvwKvomCVNh5H7
 A44MRtyjsggrjtOiFWlG9XNqD1wDoWYrg2v0M/Mcl/DFD8aoxKfizlDDiBrxQWkAqB
 UhSpyzjxFK8C3ZkmcOp8pspNpodzJiU9J+VywW3pqq8OqLZU7/Hy8WJCgxtg1NgKgG
 01XonbmUcZqfM8/MZsHSnwa51Fu7yz3BG5852wqujzqRcxjr959j8Bu/p0t8Fa0ljt
 cXESB56KH9t1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 789EF3A54A38; Mon, 19 Jan 2026 13:50:45 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883064431.1419958.7644951813571234460.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 13:50:44 +0000
References: <20260112074635.3405176-1-zangyangyang1@xiaomi.com>
In-Reply-To: <20260112074635.3405176-1-zangyangyang1@xiaomi.com>
To: Yangyang Zang <zangyangyang66@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 12 Jan 2026 15:46:35 +0800 you
 wrote: > Clean up code to improve readability,
 no logic changes. > > Signed-off-by:
 Yangyang Zang <zangyangyang1@xiaomi.com> > --- > fs/f2fs/checkpoint.c | 15
 ++ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpi5-0005qy-0R
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up the type parameter in
 f2fs_sync_meta_pages()
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
Cc: zangyangyang1@xiaomi.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 Jan 2026 15:46:35 +0800 you wrote:
> Clean up code to improve readability, no logic changes.
> 
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
> ---
>  fs/f2fs/checkpoint.c | 15 +++++++--------
>  fs/f2fs/f2fs.h       |  4 ++--
>  fs/f2fs/file.c       |  2 +-
>  3 files changed, 10 insertions(+), 11 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up the type parameter in f2fs_sync_meta_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/f7b929eda1f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
