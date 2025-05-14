Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21190AB7014
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 17:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/110iH5rdMxZHsLaSdwM/xXmWRY8eteed7+LuKG3vRY=; b=ebQb+zUUBqE5kUsLlve3whZgOv
	14d/QPFqhmvKroHg5+TqpcR7aQs5sV+Uc9qPVJ0DPsZru5fdD3lpr/9NeU0IxbxU+p3N5Kw+ggCaR
	at+6Ag3c8ZgolOGS0xYkb/0CLkDbweIO0Iv3vOStplFtjBd+SZMcuThuztvFXicgy+t4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFEDD-00008A-8O;
	Wed, 14 May 2025 15:40:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uFEDB-00007J-Cu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/QdgS/v7DO7FkpCe+ZReKzQdMJFNnLm52MXHp1eI1Q=; b=TeHEZjRrcjK6aHAi2cmdIkx5+n
 in4LXR23Ri0MYcsSEJ4JH4eo4uJzlrzT9dj3eQyDWeJg39b7Y5WNzZQUwvF3Gj3rtBqsgnoHufqVo
 5Lncn9aA/gISqR7ar3NQf3V6QuqDHr/e2rbXuh2jXyWbK2WQbGeqGDdJVnqFMrEkuXSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/QdgS/v7DO7FkpCe+ZReKzQdMJFNnLm52MXHp1eI1Q=; b=RWOojiPTnq6nHhEL6lVsv6ld+l
 CHB+YIlXbm4TgeKahYcn6qb7gSppROQTJrsfwX57L2ifjk7t3k6GViqINKv/5zMxYxwWLJoMAW5Vp
 nrifeoXZSUfqz6JUCjaQj5pNxONoW8J4kQnsLFzxwJDRN2tmujjuiKcJV20L76JX8wKY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFEDA-0002D2-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1AF9DA4DDC9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 15:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5127C4CEE3;
 Wed, 14 May 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747237194;
 bh=1/RojYoMkA7n73sH+Vf+EvlFoDM/rE5hQ4SlIT0wOaI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dQYLxnmkH95dPKv4PFH6iZuuEMD5tej6CfjnMJME1VplVbm6tf/ofi4BilArgJ5Ke
 DxrAnhVymWsB5rhzsttbr2eBDwzU5AJ0yl2H/xa+/uN5CJO87TzaL9GBbeZ3CX+Dfe
 NBuVv7OniOFmFgsknfrMcTTLqaa0eikk6AfCbgYD8+4jHXi/m2P7RRqXYNrIjY4MmR
 xSuacVlUtUgLOys+D1oaQFYa10PANWjR0cvNNnkoXPJogNS1hrTPey1D0XmoJA25lq
 Nh3fsK4UOz/nx9tjmbkppKr6n2uHFMV+i4hfJd+2zBoJMBmQyJ/9UknkGLA1fZGC9U
 Fbtvqkj/IRmJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E87380AA7C; Wed, 14 May 2025 15:40:32 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174723723101.2412407.4712455078848380290.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:31 +0000
References: <20250513112538.2999915-1-chao@kernel.org>
In-Reply-To: <20250513112538.2999915-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 May 2025 19:25:38 +0800 you
 wrote: > This fixes an analogus bug that was fixed in modern filesystems:
 > a) xfs in commit 4b8d867ca6e2 ("xfs: don't over-report free space or >
 inodes in stat [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
X-Headers-End: 1uFEDA-0002D2-S5
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't over-report free space or inodes
 in statvfs
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
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 May 2025 19:25:38 +0800 you wrote:
> This fixes an analogus bug that was fixed in modern filesystems:
> a) xfs in commit 4b8d867ca6e2 ("xfs: don't over-report free space or
> inodes in statvfs")
> b) ext4 in commit f87d3af74193 ("ext4: don't over-report free space
> or inodes in statvfs")
> where statfs can report misleading / incorrect information where
> project quota is enabled, and the free space is less than the
> remaining quota.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: don't over-report free space or inodes in statvfs
    https://git.kernel.org/jaegeuk/f2fs/c/a92019606232

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
