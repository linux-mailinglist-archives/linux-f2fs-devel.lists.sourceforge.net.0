Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20388AD2834
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jun 2025 22:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGTSuG5HfV3Rf3uZdRhzi2NWbJ0ySqA57DoKEkUCr+Q=; b=SEFfahbQUWA9trMzk2rMDohlPE
	cJXsN8s+vZfWh64jxoWvfUfXT8I/PkdQayyWKtSF8rndvOQ9EP1gVdXIOrSErHiwVXnrdHXtTDguq
	c3uTnRzgfudescVLWD8m7dEetu0F8RuZzmd3E+HqURYqbj8FRUkk5Qjl+sImHiZ1dtho=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOjXE-00037Z-9j;
	Mon, 09 Jun 2025 20:56:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uOjXC-00037J-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QfdQsLWwZo3e5dGAakjqB/svnI2XdYmgQclRhtWzm8I=; b=CFxGFTVvrym2GNuIs9Ka+nL4S9
 XhlFrFVO4hBIwe1Jvy8HgsrHwm8QZaO45ldAqM6G1iaqLL88l3Iq6+YiLI+FwyAKcx7Et4+KtXmRQ
 dS1vvwMc0aKDQ8FLF5e8dOo2qCO/9egoKoQwLjJGcXbWNhC/C1oJpXDwn56KDS5Rd51w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QfdQsLWwZo3e5dGAakjqB/svnI2XdYmgQclRhtWzm8I=; b=aijRuqBtSkU4mB2y2fp+pQLiUH
 1Z5jhybpqbEkFlILovEUhKuv+hDNm/uUKfK3dwma6Ffwv6qtqzuyaMn0tfybiOAXhUWl4t/5aaX//
 ULa59gIlVka1OyUxIfoKIKwfmUVKJ6ZC1n50dMDn0+unoqIfNf7FNt2njgIMjZpWdi6E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOjXB-0004pB-WD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E06C55C548D;
 Mon,  9 Jun 2025 20:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40163C4CEEB;
 Mon,  9 Jun 2025 20:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749502547;
 bh=DTYx9Dawj/Zj6Ock61KyxoXhL18zAF98UER5Vrg69Lk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Egmrf9dte6jKUR+x7ySX8UGIAkM5ZtoW/5xyZIKgCxARjDOw8Ixc3CkaI/Rdiyd6c
 LA3MDvz3bBIwck0BSC6MfNTOLkmtf+sPsUsOIABTnr7HTwfZ2U3H35dOrcEK1i3PUf
 6HT1+WGwDEUG4jjOujCG+O4tB++JIrIr6IpZiJIvvZ325rZ/cAbnXR0gqQ7GQ3KP/q
 60lE2BsSQjvzpdlD/YXy+YHsBrXTFReBtU1HT7xIL4YnSTGNCC7gossYRddX0oMwUX
 gnuGF1zX7i8Cf3dCNjFAQyFmoQN773RNEa1UbsJuvpR/Wa0Hwov+nJbt+tpeUGLZdv
 2kId2umyrH/hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BE33822D49; Mon,  9 Jun 2025 20:56:19 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174950257781.1531626.13890659221205140362.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jun 2025 20:56:17 +0000
References: <20250427185908.90450-4-ryncsn@gmail.com>
In-Reply-To: <20250427185908.90450-4-ryncsn@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Mon, 28 Apr 2025 02:59:05 +0800
 you wrote: > From: Kairui Song <kasong@tencent.com> > > folio_index is only
 needed for mixed usage of page cache and swap > cache, for pure page cache
 usage, the cal [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uOjXB-0004pB-WD
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: drop usage of folio_index
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
Cc: kasong@tencent.com, nphamcs@gmail.com, david@redhat.com, chrisl@kernel.org,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, yosryahmed@google.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, ying.huang@linux.alibaba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 28 Apr 2025 02:59:05 +0800 you wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` and that is not supported for f2fs.  So just drop it
> and use folio->index instead.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,3/6] f2fs: drop usage of folio_index
    https://git.kernel.org/jaegeuk/f2fs/c/fe15ec046431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
