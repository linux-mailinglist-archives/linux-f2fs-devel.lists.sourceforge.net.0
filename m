Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAAA9FD2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 00:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gssY7lp+QxvtglAyzQK6ANu81Wv3a1hStalL2qvnj6I=; b=SziXwwoPYkKcA885gb1McKSZk9
	3obQ3RvYAGaF3+Y9Mf8McETco3jQcG30I/KFUTI4fd5fjdCoVz1MzAqW/3laAZZVnFofKgx1MyJII
	t/oEHeyrzFPE6TgByrCskY5XTuOmTJ2ivVQMAtGm0MM6sxa+Vb3nH3V5mYsqDuB4nVYw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9X9n-0007bQ-Le;
	Mon, 28 Apr 2025 22:40:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9X9b-0007ao-4z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mf0nVh8ht9HlGg1vTaoV+rmK/RUWADwrTJMrfNAhStU=; b=AhcY9w+M6uNo2LWYgNkW1arQ97
 xRa+JeNzHmweVhtK8gDkHXf5N7XwGBK3nJi7aOEpirlOaIZSs3xQXHVdyRewDjYBesllATyZ+gZmh
 CIK6DNsZeCZLU1r9rZm5qb0FZRwGwvYMWlPY/70q89hWoGiiGu7lMO72FwHQUzmyaEoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mf0nVh8ht9HlGg1vTaoV+rmK/RUWADwrTJMrfNAhStU=; b=U307y/IeHDpsTa4Qmsg8CU1Jga
 RIrRq4iLos5z5NyCCmoz1YFjaZ1JEet+K2lx39rF6oRSPCkddUZ+XtIzEDyXF6RxxhfboIrUTwJR3
 SR5siIZWT7F/UDtakWKQLCdF5dg4N1Abxwat+DnNJ3NaOGqkN/1P7PntmRKaXgsM9sdY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9X9L-0002KY-IC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4A38614B8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 22:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85DFC4CEED;
 Mon, 28 Apr 2025 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745880020;
 bh=wHUyCaPqsLAIqZ+Di8Jk8P2mpZYVmeP+9/4ZjPsMVG0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bprNgRS3Rh3chgh2Xg8e2YutiRFCBUFZ0nDIyzRlUcjXcQWnc+XlYnT5fH8ybjN/b
 Kt/OjRCtpGXmjC6b2kF5DrfDNyC+vAJc/YHNNzdsyRwAu6NACNr25mvJKWis2pUmSQ
 tjwxwq/7oZoDkhy7YvZLMaN4HBwKjbEdlxNDzXEylM+zd7OBgEdxuWdlwR70XPwv27
 y88GUIgKpmpi6h8jnHBaqSt4MFRTa9peoIpxtXOuT7c+Eom481tzqDtacYXCzNdmRN
 F4fDdW34JpaJGzPrYg1NQ5DIg/eeSBE/IX6dEgtrnDX8xWwA1DNnz7NX+/NjZdd4cd
 VEWkFXXU5jJhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EABE83822D43; Mon, 28 Apr 2025 22:41:00 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174588005948.1067750.7393632112050436477.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:59 +0000
References: <20250422115638.123455-1-chao@kernel.org>
In-Reply-To: <20250422115638.123455-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 22 Apr 2025 19:56:38 +0800 you
 wrote: > [ cut here ] > WARNING: CPU: 3 PID: 579 at fs/f2fs/segment.c:2832
 new_curseg+0x5e8/0x6dc > pc : new_curseg+0x5e8/0x6dc > Call tr [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9X9L-0002KY-IC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to bail out in get_new_segment()
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

On Tue, 22 Apr 2025 19:56:38 +0800 you wrote:
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 579 at fs/f2fs/segment.c:2832 new_curseg+0x5e8/0x6dc
> pc : new_curseg+0x5e8/0x6dc
> Call trace:
>  new_curseg+0x5e8/0x6dc
>  f2fs_allocate_data_block+0xa54/0xe28
>  do_write_page+0x6c/0x194
>  f2fs_do_write_node_page+0x38/0x78
>  __write_node_page+0x248/0x6d4
>  f2fs_sync_node_pages+0x524/0x72c
>  f2fs_write_checkpoint+0x4bc/0x9b0
>  __checkpoint_and_complete_reqs+0x80/0x244
>  issue_checkpoint_thread+0x8c/0xec
>  kthread+0x114/0x1bc
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to bail out in get_new_segment()
    https://git.kernel.org/jaegeuk/f2fs/c/9cada264501c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
