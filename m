Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D1AD2835
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jun 2025 22:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKv2AwzHgMtzG9MIAmtkrMJlqtVhuLW7kLgNG3uaCP0=; b=XEGr04TLITRxEsLIXWH2ealsJ0
	qVDQEsohJx2xqMtW4WdBrFZKd4Nxnkv6DmnTnlDYlTDU50w9a7nl4jvqzmn9omqFIcy2I84E85Jm2
	kWTht5zy5yK6FfT9kXSJ78wdZP6I8++pA2DphR/i5hcHOS1Z68s58q08fAJr1TxAIWDM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOjXG-0003k4-Nk;
	Mon, 09 Jun 2025 20:56:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uOjXF-0003jn-Rh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6aUii8PFTq2fbXylsYk/SmATXiemVhUWzJIInA3rid4=; b=JwrEDcd9d0cY1ZpZEHevp7Lmxi
 d/k485pk66KiKWFVEnwbXgpyHvqTFiaHXll4tia+09aGFU1unsq5oREV/EUw19no5e1Xft0zyEKy2
 Rz5vQuIXk8pvJL+YNNz3OXzoMKeg7UUuW9aSp7mh9tJRyVJm7J3b744zGzlS6czDLQZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6aUii8PFTq2fbXylsYk/SmATXiemVhUWzJIInA3rid4=; b=ED73EYtBB4MZ5zEt6SLdijdxQQ
 vapFHp6OQPjN+c3sU/YA6ilAgXyIDlVsomLhrBqhoDj4AeNVza1U9toCvKRRK9Jm2Rj0EJZHwLwyx
 sHcm3IZinr+sKmCpJjYAyYqDD5l7W6TOCzrzebAWosyzrlONkkR5iEYlx5lb2F/9JPGA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOjXF-0004pP-D8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2D11629E2;
 Mon,  9 Jun 2025 20:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B32DC4CEF0;
 Mon,  9 Jun 2025 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749502550;
 bh=cqTQa8rm+F++IDXEr692KrwmjAEZKagK+bHhQ+bzCU4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=u1EBetkk6hR9Qmt5jAU/OlotzWfZAXdel5V1WwcDhfWXEHt3KQrqjj8vgNXTxnVNP
 wAa9BFAz7NskMhX7Q0uLI+hBmhEbZovh1maS1jFnKpFOHbID83GbbjB8jzS7k2z0S3
 6707+6vAjgriU7A8nTfRBWTWIPTyDalIpd9Y8xjh0cLwVfB4dY6SyIOvQyzCsYIpJx
 v2muC4yJfkEh0YxKCczO0ZAYLvin2GFNe3DinFbbrfuI58SRDGmSk2b4ZmS61rkF/k
 XW0WsBg8hLAc0dBolf3EjpMkqG8WMuXVcGs4xMDfUJfsrAff0qf7FPsreqy72rI12f
 th91gtHZ47qdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33AE83822D49; Mon,  9 Jun 2025 20:56:22 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174950258074.1531626.9419516015634434009.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jun 2025 20:56:20 +0000
References: <20250430181052.55698-4-ryncsn@gmail.com>
In-Reply-To: <20250430181052.55698-4-ryncsn@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Thu, 1 May 2025 02:10:49 +0800
 you wrote: > From: Kairui Song <kasong@tencent.com> > > folio_index is only
 needed for mixed usage of page cache and swap > cache, for pure page cache
 usage, the call [...] 
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
X-Headers-End: 1uOjXF-0004pP-D8
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: drop usage of folio_index
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
Cc: kasong@tencent.com, nphamcs@gmail.com, chrisl@kernel.org, david@redhat.com,
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

On Thu,  1 May 2025 02:10:49 +0800 you wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,3/6] f2fs: drop usage of folio_index
    https://git.kernel.org/jaegeuk/f2fs/c/fe15ec046431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
