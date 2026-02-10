Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fLIzAhKji2krXgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 22:28:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7091E11F680
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 22:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuhtJolwAeDgakq7Zwtl/lzeThM2qIH34SXcVabktLA=; b=F6zvjOZlC2YW/pUvGp0XjiV24y
	+PvEQPu0mseURF+a0YWbKGUeVebOl1I+JprozurTQ/yWv2paAR8CovADE2l5NIitSRhKAsLXvlEyL
	VfeRQBu8OCF8mDbv9z0wBiQTIf77PescAYB2LSL2jDux2Aj9oSkxRoS/23RK4FkZlkew=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpvHp-0007gH-VX;
	Tue, 10 Feb 2026 21:28:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vpvHo-0007gB-BK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 21:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PNLm8hoJKh6IKtXK0IyQ0NQTmADAse+TC0TpIW41JnE=; b=A7wh1ujaAqpB3OwGqNCebZHxe9
 xcw8cjOf2TMp+74sjdJCzawp9nPh8wQLDHXNejrgQ49yHneb94p7Op07YYQQY1xggXvmq6dpR7xkZ
 mq2dJhnVtyYP8iMMqwby76RvCOzHeVBbGi9nBfpps45/qfey4bg3hyJCLz+qujgCwMaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PNLm8hoJKh6IKtXK0IyQ0NQTmADAse+TC0TpIW41JnE=; b=gTp7tZJ9LgE57/rSp0YghRt7vO
 PGBjCflkDPQrs9WsNcwafaA2jf8jadBrKL7AdBwMCcWLKTex8DprOSlzmfPSVuGgiX8pb7QnFxXop
 Mh3lAuctb9CLDCDxZNv0i3JYhuft4PYcLfx5MK7brl3VIGCWTdJqccbqm7Z7am/euhYk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vpvHn-00051d-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 21:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E6A7960143;
 Tue, 10 Feb 2026 21:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC3BC16AAE;
 Tue, 10 Feb 2026 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770758912;
 bh=lNhX9AaCYUnmW0RiYWtAj/u0M5kyqPMPmMR/hYV7mXM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jq1WE+jqMpT8FHAedYcZsVNBCSoThX6rAGoX9yGT1eEhLbMAcWZj74h4jrxm8dI4R
 HYQLiwJIy50RLaPRs7L/l7VoF3jYHTAyFVdtcoB5T+KqIJr1qvdjSPSjzhRxjnKRxj
 gya2AJGElcgZ2YFDgatpvzD1gJK4EBgez1eQFgZ1paJhQPbVwYl/6UnKYfF22YfitY
 PL94Vjsxs7VzQWWgUC2RtgeAYkEN8UC8u5PMzIzFiLscE3NRNTGbjIgDnFfT7qdTFv
 3x5Mx8PKE0nvesiuKTNXi1bhe6dqAuhpaPQ+l+zqcRr1Ik4egNy9BGtQZEZ+hLAERj
 L0cE/ACu4LwjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 0B08E39E3B79; Tue, 10 Feb 2026 21:28:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177075890757.3671709.12809959884362894465.git-patchwork-notify@kernel.org>
Date: Tue, 10 Feb 2026 21:28:27 +0000
References: <20260122104527.416871-1-youngjin.gil@samsung.com>
In-Reply-To: <20260122104527.416871-1-youngjin.gil@samsung.com>
To: Yeongjin Gil <youngjin.gil@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 22 Jan 2026 19:45:27 +0900 you
 wrote: > When overwriting already allocated blocks, f2fs_iomap_begin() calls
 > f2fs_overwrite_io() to check block mappings. However, > f2fs_overwrite_io()
 iterat [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vpvHn-00051d-JQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: optimize f2fs_overwrite_io() for
 f2fs_iomap_begin
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jyh429@gmail.com, jaegeuk@kernel.org, sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:youngjin.gil@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jyh429@gmail.com,m:jaegeuk@kernel.org,m:sj1557.seo@samsung.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org,samsung.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 7091E11F680
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 22 Jan 2026 19:45:27 +0900 you wrote:
> When overwriting already allocated blocks, f2fs_iomap_begin() calls
> f2fs_overwrite_io() to check block mappings. However,
> f2fs_overwrite_io() iterates through all mapped blocks in the range,
> which can be inefficient for fragmented files with large I/O requests.
> 
> This patch optimizes f2fs_overwrite_io() by adding a 'check_first'
> parameter and introducing __f2fs_overwrite_io() helper. When called from
> f2fs_iomap_begin(), we only check the first mapping to determine if the
> range is already allocated, which is sufficient for setting
> map.m_may_create.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: optimize f2fs_overwrite_io() for f2fs_iomap_begin
    https://git.kernel.org/jaegeuk/f2fs/c/d860974a7e38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
