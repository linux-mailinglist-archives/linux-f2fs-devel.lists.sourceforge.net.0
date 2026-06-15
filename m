Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vnVNCpoaMGqjNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE332687B1F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ZV3NbcEZ;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=iR+FX2PU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=lvyHWsxa;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=bFictPhk;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQwEr0RE9Ppl5A+U0+rt32wJ4sR7+dc41RsoHWxwhao=; b=ZV3NbcEZb03gPNNUvFIT3VEJ1y
	JN93LjQeRIYXR94MX3l1yzGhWsT9zf8mSpVzcByBD7WkH/thMhGmbH7tHtBA+vxPluBxEu1J7RO+8
	INbATs5L62k0nQReMN2nAqUMfarafQ+Pprk8x2HgEFRAmUvvb1iilQRH2Se1Y0Bn2bAU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Ge-0004MT-Rb;
	Mon, 15 Jun 2026 15:30:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZ9Ga-0004Lr-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hT5UO8YECt1Zh+naO2m+zZjR3PoEy411iORlB8Pf9EU=; b=iR+FX2PUOcZjnLQAQW2xai7GeE
 sYLvXHtw2uw3PPMQ4yLwjYvenAVCtSCZLs9AdibcdZUlrim5pMbW3NkR6e0oeGumCRvg1Dp+3YIPD
 uStQa0eY0ubwweW8VGPa/9JgQwTm5vOOJ+yEz7Stz7NvtsoUFBwqzKfiuSLw7Kxekzww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hT5UO8YECt1Zh+naO2m+zZjR3PoEy411iORlB8Pf9EU=; b=lvyHWsxamAxylbWb+EQBJXy7WB
 9RXXtpcxAP/LdBH3tEluoV5KiQAm5NPDcCIs/AUFt0hUfsKrJHNMiGF0EZJM8vjIdxKp3QdcxLR9w
 CyDK+TQ5SDPfzodtSeesquJ7bwYjKB0LtfdrRy63jv9epCasMnMlZ0hRHhXLCi8rAKUA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9GZ-0002vD-Az for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8AEDA41707;
 Mon, 15 Jun 2026 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0CB1F000E9;
 Mon, 15 Jun 2026 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537413;
 bh=hT5UO8YECt1Zh+naO2m+zZjR3PoEy411iORlB8Pf9EU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=bFictPhkEy2GgB3+W3OC33NitlF6QCxd2bbABwSfJAGz9ELH+Vg/Wwvf6AQi05yTL
 zogdADYp27lm5iPl+Kyfdmyge1j6bLlsaablIep7aLsJSDg7/4olIb8LO+ID1w+wHZ
 5bUqPHpi3mqnghn3Y/nQeJS/jmiQegRCy0hzVVUftr/l8uRIOuj+09IZHoU0fPx95b
 5Q51JpW5NzrpHN0Mjjv1l2ApreP2NSJodmetjxCE82kjygS1CxuVoACCOSzyiRJPcP
 KKSz4B2ZE+maOQ+HpGAgra7DgQNhEKIjm51dZC7lBNh9og+a/Mm9HFXyAA6lEWEXWG
 +bbFb8M/Y/Pdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D0AE93811A64; Mon, 15 Jun 2026 15:30:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178153740838.3946007.5241009515125425224.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 15:30:08 +0000
References: <20260529022924.3655519-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260529022924.3655519-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 29 May 2026 10:29:24 +0800 you
 wrote: > prepare_write_begin() first gets the inode folio and builds a dnode, 
 > then checks the read extent cache. For an ordinary overwrite of a >
 non-inline an [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ9GZ-0002vD-Az
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip inode folio lookup for cached
 overwrite
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
 qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE332687B1F

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 29 May 2026 10:29:24 +0800 you wrote:
> prepare_write_begin() first gets the inode folio and builds a dnode,
> then checks the read extent cache. For an ordinary overwrite of a
> non-inline and non-compressed file, an extent-cache hit already gives the
> data block address and the following path does not need to allocate or
> update any node state.
> 
> Check the read extent cache before fetching the inode folio for that
> narrow case. Keep the existing paths for inline data, compressed files,
> and writes that may extend past EOF, where the helper may need inline
> conversion, compression preparation, or block reservation.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: skip inode folio lookup for cached overwrite
    https://git.kernel.org/jaegeuk/f2fs/c/ec1a089b0c14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
