Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A475AFF088
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B8Y8CLWLLxxmFt1won1gvaX4atQFlHldcphMyix/oE=; b=cQTtlDVDANTLeszKClEiIDK6oO
	g8JPdyTPQILJ3uaLuqNGrb/l5Wg0Zra2U/BhwRgetGqh6KvJn2+ewaH+Ey/OjDUTxZcCQ646epJwz
	6nMnnGriou/23rVCPjV0zBqQ+86tudy61cB6MMQQ04ohtfhwEVD6Zek684MAsNq+oExg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF7-0004vE-01;
	Wed, 09 Jul 2025 18:10:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF4-0004v4-KU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4yp6kDau2I6R0Nk5qt31+SQ/O4l3vqDu5gkc6QIbBl8=; b=STW1Lb8/NbR9rpxeSyTwD4WFtD
 I260CRO1wjqK7DV4RVeCmpTKfJ64USqB0Sw+j/v2dxUlOTQde6DlXBdVGmLr7R8OledaPHge+aOjo
 oDQNtPogoB0SSpXc5ySh20avoxddT9KyA6QAkTMECW+/f9Yn87UFRV4OEesCTS2P5ouQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4yp6kDau2I6R0Nk5qt31+SQ/O4l3vqDu5gkc6QIbBl8=; b=foEWD4HkCNv+yBWwQvv4ZsaBtv
 kvzaf7bir8R+yNPmZxrVETF2sxVJUcOHopShLMX5u8K2aEerFsCrZp2N0xb1jccHxMdp9vZ8B6tYS
 kwT9W635VPIO5TlRvBoiEeGDL28BDkuYTCwz+iK85bZpAP3hGbcgmYVfx1/lxZEMtGxY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZF4-00013j-16 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CA3E61456;
 Wed,  9 Jul 2025 18:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E7AC4CEEF;
 Wed,  9 Jul 2025 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084591;
 bh=28YLZgd9X0jg6YJkzaFzy74zIkGREL/t4IBt/9bUTpo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=U8jE81MawQErV+iExt4XZ7K61kZ4qvZbxBZeyHyZswO95PcW67u5ifMKwYKYLh792
 Q0BxhGxezJJORutMApQnnfCJuMvoxPkVBnPRKWqByVC9aRYXl4EH4LuO/ssaZqXS1z
 ttfgpXo+WSUArVzYNo5krqcWzENTEDB1HoYMrhnmarKzikyZQFLJ5b5KCxU2Cl/eFz
 Eh2q6kppnLpNhAZ3cdlj2M12/kbJP3MI9SigjXLUMVpSVje4nPWkQhvmWbM0IPGQqG
 a0vlLQ0EeEXnHkmgTuUnDW9sZurIGiqHYMFbC1FNB+3A8avoPgaakcV5bQkPeuKx38
 0PS/GJkxkeAPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B2EB1380DBEE; Wed,  9 Jul 2025 18:10:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208461351.806926.17457393495210057125.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:13 +0000
References: <20250703061358.13425-1-jqqlijiazi@gmail.com>
In-Reply-To: <20250703061358.13425-1-jqqlijiazi@gmail.com>
To: Jiazi Li <jqqlijiazi@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 3 Jul 2025 14:13:04 +0800 you wrote:
 > options in f2fs_fill_super is alloc by kstrdup: > options = kstrdup((const
 char *)data, GFP_KERNEL) > sit_bitmap[_mir], nat_bitmap[_mir] are alloc by
 kme [...] 
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
X-Headers-End: 1uZZF4-00013j-16
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kfree() instead of kvfree() to
 free some memory
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
Cc: jaegeuk@kernel.org, peixuan.qiu@transsion.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  3 Jul 2025 14:13:04 +0800 you wrote:
> options in f2fs_fill_super is alloc by kstrdup:
> 	options = kstrdup((const char *)data, GFP_KERNEL)
> sit_bitmap[_mir], nat_bitmap[_mir] are alloc by kmemdup:
> 	sit_i->sit_bitmap = kmemdup(src_bitmap, sit_bitmap_size, GFP_KERNEL);
> 	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
> 					sit_bitmap_size, GFP_KERNEL);
> 	nm_i->nat_bitmap = kmemdup(version_bitmap, nm_i->bitmap_size,
> 					GFP_KERNEL);
> 	nm_i->nat_bitmap_mir = kmemdup(version_bitmap, nm_i->bitmap_size,
> 					GFP_KERNEL);
> write_io is alloc by f2fs_kmalloc:
> 	sbi->write_io[i] = f2fs_kmalloc(sbi,
> 			array_size(n, sizeof(struct f2fs_bio_info))
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: use kfree() instead of kvfree() to free some memory
    https://git.kernel.org/jaegeuk/f2fs/c/e9705c61b1db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
