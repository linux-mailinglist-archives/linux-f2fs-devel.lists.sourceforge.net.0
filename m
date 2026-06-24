Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8qEyMsScO2p2aQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEB6BCC1A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="jQ/Laa2A";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mTRxXVpm;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="lEpqlf/w";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=IebVNpcO;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIrrFiLAlYEtQjQHwR6VsT93eiz4czkaTjiZROg7hbM=; b=jQ/Laa2At6I4/HE4JpLzvKq4ti
	XiQUbZac6C5FrrxpyYBqdrQkCsG4QpipV8J154MkSp91FrqAwESxNDDPh03W86b+W7be31zeA7e0W
	At/bZWywiOfQ340nQMaVzk6SmYB3HfoXNRRocgy13l27xvyi++2BPAJT2eEQ175Vlda0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcJTR-0005jf-E8;
	Wed, 24 Jun 2026 09:00:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wcJTO-0005iq-T3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QX25g6kX50Ga0VDVtNL9l4LjcZSG6yPuCBcKrThPwss=; b=mTRxXVpmoVUzoMBLd6s2V/mTgY
 +YSX0IlZ67+syVTlxn641HW3+beeOfnmAx17junuUqk1yAibxYDIOWCkusdhDAysLnmSLH1ukyAA9
 prG8nFhLBg/1K/5lO/GE8vAW94r4HPVDHyjN6/fqcT1lQKbwKrwUFeZbpC/GPDnlrmuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QX25g6kX50Ga0VDVtNL9l4LjcZSG6yPuCBcKrThPwss=; b=lEpqlf/wsXRhen+lKS//y4eD9/
 tfDqIisPK2yefWM4+5K6ts5XjSxDqbDku3zYtH/sDS1Ho/ZEWoc1tgOth6Sa7embH9l3qKXkl1Rfa
 ZKzM7ezf+BNyzwyffczKY2kjJw4mSnyukpOt4F552TJkQTRhTMvv5WMsaKDKkAE9nvpg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcJSY-0000r5-PU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B038D60215;
 Wed, 24 Jun 2026 08:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1931F00A3A;
 Wed, 24 Jun 2026 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782291585;
 bh=QX25g6kX50Ga0VDVtNL9l4LjcZSG6yPuCBcKrThPwss=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=IebVNpcOfjYRSfS0oEY/ADIILQhVnG4hzaDc5mAoNZrLyvRgYO4JbDokDrr5CuOd9
 wRPvBhB/8Xg5XcPF88pQiMReKA6r38CQjhXDZjJNBIGBMZpUjcl9cAP8pUAMMQMk/i
 fK29HDY178sLdUtAUkrHzsrSWEbkYwIvCbBmSasuI7t9FkYDcEyG7Gx3b3gmMTH5wz
 /l05QtCwgfxWuYGtMX7+akW93e8YQ81+WDymkZIa+xnGPYmIw8MI2b0fbsbNYkplRj
 RTe/xkI0EPCKE1jMZxNa4s50lbo5F13y7vaJChA6xHsGV5/IYYnGtvnUfXOMDT5c47
 gDH6ES4rE5jYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9392339EF964; Wed, 24 Jun 2026 08:59:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178229157429.2577930.9752405343308255841.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jun 2026 08:59:34 +0000
References: <ajrLmn16uMPcc4Lv@google.com>
In-Reply-To: <ajrLmn16uMPcc4Lv@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Tue, 23 Jun 2026 18:08:26
 +0000 you wrote: > Hi Linus, > > Could you please consider this pull request?
 Given that the git history shows > less than a day since the last update,
 it is completely fi [...] 
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
X-Headers-End: 1wcJSY-0000r5-PU
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 7.2-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21AEB6BCC1A

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Tue, 23 Jun 2026 18:08:26 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request? Given that the git history shows
> less than a day since the last update, it is completely fine to let it soak in
> -next for a bit. I submitted this because I needed to remove an old patch that
> was incorrectly merged a while ago, and I wanted to clean up the tree.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 7.2-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/09ca8dc7d634

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
