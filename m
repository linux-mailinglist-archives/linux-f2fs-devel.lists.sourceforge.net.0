Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC79B140B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 18:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuoOMTbx7Wn3UAR4IG4/LPheC+Q4j5X+5La+RjLYgH8=; b=TpNPNQZ9Ogy9gLuk5bTU2SzhEp
	R7TROEslGjkTBiLHLQ3j+GImTLkOj340ZxmdiUGG9gZdBrkD6JZ5A68B2m5MQxlSTlhiZNDOgYEk4
	xkXceDHeD+UZCla1oOdsUdcawwgYu0xUR2GRPr+8KNQvfhU7ywQYqZvjWBcfFkygPZF4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugR3F-0002Mi-1P;
	Mon, 28 Jul 2025 16:50:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ugR3B-0002ML-Lh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BfLFYuzhxu2S+hEYv4NOI4/Vcj/Ciw0AV7Pdd2zdrMI=; b=YUAc1hsQYtABWIqJERIRY2PK6l
 reUM9VxLrzrGl+pe35DLV8LIUMWmmw5nUWrNUUC/gPpQWeVt+fLhaljxGV43m42nfHorWHFIKlG3v
 hDdV32Pa4heEBEJ+kRRVLNoicpviWW+B41H8nMP/x9tDLKr82XdLDYfCvitKqL/HlIhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BfLFYuzhxu2S+hEYv4NOI4/Vcj/Ciw0AV7Pdd2zdrMI=; b=DAhGONqCAWbCPv/Eonso/q3P73
 b4aKJx9L7bcWONx/gbORu8mDRjDkyzQ738Sk1bzfwTnFZ0SWQyKmRQGP2L/igA746r1y05lTEESvT
 dLdHv+g0koVALxRDvIuOxyJbr7KhGbXJUz2T2jvs/J41IKgQSFCyu11PgNUJxIQ5Sttc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugR3B-0008Kj-S6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A717A55064;
 Mon, 28 Jul 2025 16:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D662FC4CEE7;
 Mon, 28 Jul 2025 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753721403;
 bh=E40iXFH03lE41BAGYpM5On1XrJwL7oI+XFMR1X+a1LQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AnIoKuhz9XyGZ9w/lbOVj7shQ1rIMdNSpTaDjZtYAoAQORIA07A5nd6c5rrnqBzj9
 vBrv+P+dQHch8UL/sICDL1lJ8qZXkA7NZg9Ff8YFhwISk21p1UXsZjMPWbe3IXcFCM
 zPRZA3fRZrdUMKPOxZC5I74NsX8pjSIxvRKyVnmTgdKTqmTJVxLNP/Q/TbWimx8bzW
 ogLVhDW5owkgkZzlT6DWENkxAijtiyJ72vy++RIsYZzhOt+reNEzrxk4YSZVAOHojL
 8w+0nHHhuQ6hFxwKvyErbi1566ikk+i+HpAW1wc7wwUeyxp+R0spd0lvc8urznGU2Q
 72wu9X0/ryGeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE0D383BF5F; Mon, 28 Jul 2025 16:50:21 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175372142024.776676.5036079944268949062.git-patchwork-notify@kernel.org>
Date: Mon, 28 Jul 2025 16:50:20 +0000
References: <20250728050237.1563560-1-wangzijie1@honor.com>
In-Reply-To: <20250728050237.1563560-1-wangzijie1@honor.com>
To: wangzijie <wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 28 Jul 2025 13:02:35 +0800 you
 wrote: > __lookup_nat_cache follows LRU manner to move clean nat entry, when
 nat > entries are going to be dirty, no need to move them to tail of lru
 list. > Int [...] 
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
X-Headers-End: 1ugR3B-0008Kj-S6
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: avoid redundant clean nat entry
 move in lru list
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 28 Jul 2025 13:02:35 +0800 you wrote:
> __lookup_nat_cache follows LRU manner to move clean nat entry, when nat
> entries are going to be dirty, no need to move them to tail of lru list.
> Introduce a parameter 'for_dirty' to avoid it.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v3:
> - followed by Chao's suggestion to update comments
> v2:
> - followed by Jaegeuk's suggestion to add a parameter in __lookup_nat_cache
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: avoid redundant clean nat entry move in lru list
    https://git.kernel.org/jaegeuk/f2fs/c/0349b7f95c80
  - [f2fs-dev,v3,2/2] f2fs: directly add newly allocated pre-dirty nat entry to dirty set list
    https://git.kernel.org/jaegeuk/f2fs/c/40aa9e1223fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
