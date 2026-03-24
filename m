Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COebJLjKwmmIlgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBB31A0F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+eux7QBkl4xHXCpf9+bsSagqHCCARri1VLXgagaR9M=; b=lTNtgQWGI7/GW+d4CmFoDmb29o
	mT22RKUPbaqtWMIyrFNXR2xHYV/WVonyBR089+zZJPKZHAKWeA50/8l4tLPXi6jqYlL6kicOBTJLH
	rtO3feo4PwjuOEUXzQxyiJ/oES4Njg+IjM6uJfPb53uu/0AtmpdAQJtENcqK3L6bwup8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cH-0000mJ-TG;
	Tue, 24 Mar 2026 17:32:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cG-0000m6-LU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNZ3J3NLS3RwJrfHGcvcqFVimJ5yeBwtiIjjwICQlKU=; b=ih683odEzNpOORxsf+UX/yk1+X
 8S08Gy5RoLo82PHhPZQQlkE4Zr4aiTohKzUKBvn3eLjKL1SK0JIAZSrL4XyJ449LIUUFeg1PmH1ia
 xB7skojaiOntXmg957IQBmv7waZrY6c8e+5G3MKbEhj2s15HpjoTQEE8y35kGHc9xHos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNZ3J3NLS3RwJrfHGcvcqFVimJ5yeBwtiIjjwICQlKU=; b=WaYvZGHId7HIk8B5le2u1h2hyn
 oOaRA9lVCHGB7QeBl8Ep5RkfbhNMo5R5A3G0TQjL8TzbNUCEDAc7UcbY6BxzV+qt+paRpwvJIUZ7D
 e1pnyRMCgExbMPYpl6+TpkA/+rzUzl8Ubaqk8xcNHmZd5CrbTw4CMnfg4cvMxcZy6xa4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cG-0007q6-LI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60845441FB;
 Tue, 24 Mar 2026 17:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4EFC2BC87;
 Tue, 24 Mar 2026 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373542;
 bh=OScb9eSKFxr53sa09Lc9gXqyHQfkJFJumorEnS2Pr1U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CproB9FuRc8LTwIIPGLDieugNMZI3oE9TzLGgWBcN10r2LOkZfRc1mlloAoq47lyF
 s6wij6CdOjSgvepxJESB7hWg7Od61pNlEItCGkAwrqWZTYIB4Zi7edtdgh740yofZe
 kcsfejyg0Z1KPPK8w4+eQwkiis4TprUNUBWZMLdCE0w+sRXk6UymCMHwwlkAVha2MZ
 l8iLCSynIp9fCV6N6TEaq+Rqur1zg8vCH5xUjMj6zg3CQ3qhw31BrHc+z79a1LyMeC
 IBXjiotEMBz3buIBg+FhT9iBUUexEarJMD/UvEAPpPZFN2VRoTCkJoAYwNPMT6t4Gb
 l8V5dHybhRdnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FE073808203; Tue, 24 Mar 2026 17:32:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437353004.1223048.3316200244581865749.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:10 +0000
References: <20260319083525.603728-3-monty_pavel@sina.com>
In-Reply-To: <20260319083525.603728-3-monty_pavel@sina.com>
To: Yongpeng Yang <monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 19 Mar 2026 16:35:27 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > The ri parameter
 in truncate_partial_nodes() is unused. Remove it along > with the related
 code. No lo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cG-0007q6-LI
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop unused ri parameter from
 truncate_partial_nodes()
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
Cc: jaegeuk@kernel.org, yangyongpeng@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 18FBB31A0F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 19 Mar 2026 16:35:27 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The ri parameter in truncate_partial_nodes() is unused. Remove it along
> with the related code. No logical changes.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: drop unused ri parameter from truncate_partial_nodes()
    https://git.kernel.org/jaegeuk/f2fs/c/1e134c33b931

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
