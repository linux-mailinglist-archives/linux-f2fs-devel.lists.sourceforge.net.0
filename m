Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NuDjBZwaMGqsNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF04C687B37
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ARBt1ewi;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=NQ1AJOek;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=m5XITc4v;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=KXnLcB04;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62Phdf3fXDibUBxzDuicG5svOUuc7xJ8adUCF1vlSak=; b=ARBt1ewi4nsWakj+lZ/q0vTbN2
	HCuTxZ1stJIXYKzGiVkrMLJodaYm2wKydexrxv+W91y501s81lrDYnOP8AO83SphurLl7neTAdQFA
	Wwc2std5/CBa31GuA4KaUM8lTStsPlVSzmrRClfhyUAL1jFhL9EE1cXZNT6f5QaGi9fs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Gl-0002EI-TU;
	Mon, 15 Jun 2026 15:30:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZ9Gc-0002E7-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHl7EarGbqvA9kn+YJmWk4AdrVxstzmkgQrT2YInGPw=; b=NQ1AJOekRqTMFonhNySPErrojJ
 PoY/TernfoTUHrzwz1SrHBW+IGTcyLWMJhMCd0rwlgv+JWHnUPRjJYiigltuRip9iLu/uv/Vi8LPP
 8A/XFm1assYrKcjGIG4sQs6jRjwJuvjaLlH1VTBW7RHsc/BfF7nSR9lT8sEaRvODhmMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHl7EarGbqvA9kn+YJmWk4AdrVxstzmkgQrT2YInGPw=; b=m5XITc4vY3XQScgrqInowtgsOZ
 1BHRc9HOV8Loe2CtA4g5j4dqf7dscGAajxNTy9BhYtFB5EQQuQP0z1snN8+PPdfjbQXQdF541xnla
 CpyOiSg8REmL07PGOtrHAiNzWYvrdJmxT3zrJE5Kf3vs68lgoeXjgY0kN6zLThen7C2I=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9GW-0002uX-QQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B74B3601E6;
 Mon, 15 Jun 2026 15:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6C31F000E9;
 Mon, 15 Jun 2026 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537410;
 bh=KHl7EarGbqvA9kn+YJmWk4AdrVxstzmkgQrT2YInGPw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=KXnLcB04CnK07hLb+x7GvsrUUpo5moQt0dm9WvFwSsYHndDX6EWOSah5GYaupazko
 8ZSxs3xBQBTAwwckTjIZFGFQe7uTsRBoUjo8yFZd4v+APyEhgZbEfPaP2DEk6KtLjL
 EvVyNO9kFS5WJ7kyUKUOPCj8BBX+s7RpIrGnHjPKarepV7mdl87hRitWlVA15mywZ+
 cMjWHP+BKINBSCn08bpUGCYVOY2fHeZPAJyjdbOcvCSS9q58+QSiY4Vna1Urk8QQfA
 p7p4Mxwu+OalV7BoNR+f2TRIavMN+WuOsCG0VwbDCyJ855Urv+W3/dr9DUAS2nY40n
 +pLjBMEE+SeTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D0A713811A64; Mon, 15 Jun 2026 15:30:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178153740564.3946007.4916019333564296614.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 15:30:05 +0000
References: <20260526053557.1096229-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260526053557.1096229-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 26 May 2026 13:35:57 +0800 you
 wrote: > f2fs_recover_orphan_inodes() trusts the orphan block entry_count
 when > replaying orphan inodes from the checkpoint pack. A corrupted
 entry_count > larg [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ9GW-0002uX-QQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: validate orphan inode entry count
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
 qiwenjie@xiaomi.com, jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF04C687B37

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 26 May 2026 13:35:57 +0800 you wrote:
> f2fs_recover_orphan_inodes() trusts the orphan block entry_count when
> replaying orphan inodes from the checkpoint pack. A corrupted entry_count
> larger than F2FS_ORPHANS_PER_BLOCK makes the recovery loop read past the
> ino[] array and interpret footer or following data as inode numbers.
> 
> On a crafted image, mounting an unpatched kernel can drive orphan recovery
> into f2fs_bug_on() and panic the kernel. Validate entry_count before
> consuming entries so corrupted checkpoint data fails the mount with
> -EFSCORRUPTED and requests fsck instead.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: validate orphan inode entry count
    https://git.kernel.org/jaegeuk/f2fs/c/de81d95d4e42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
