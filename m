Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rg5LDpoaMGqlNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15390687B21
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DG52CWM6;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=kKuHDRTe;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=h6qf4N48;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=okjY35wn;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4AtTZqpkXSUvwBhg8sO1cQEsI3Ewp0qMulSxlVEnlY=; b=DG52CWM60HweC9xI6STs7+T+AG
	NGTdDYNAMOWvC8ahpPZZu86N4TTjF/3sElwzmL3DXEi1OiVnKkX7hEmAmrxDnps0TdGLEpyCpvqR3
	kfsTOyfMqjn3U26adXFH+MNGE+OTDlNPhoYQhf+JNuzg9Tn8R+mbGlSl3g08PnPsXy5Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Gh-0008JY-4m;
	Mon, 15 Jun 2026 15:30:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZ9Ge-0008JG-0P
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EifHw/YLYpw/Dcq7IYZh74Hc6w9ERqR9grR0ilAhAIw=; b=kKuHDRTeSFEDnv+g1nawcqYy1+
 nPZ5s8Lbk0nc9KoirDrK101j5E+4vqFawFHTSQLvDHnP2gkU3ZkT+zt6FiRmO5VpS7/T2sCkZiiPr
 wFiuJDoe7k81xoqIqNh7jTUC6qUvy5D2WXJecfkd1w+x3CPFlGqXJiHbl5YUNdA2Yd4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EifHw/YLYpw/Dcq7IYZh74Hc6w9ERqR9grR0ilAhAIw=; b=h6qf4N48cw/LdhwdpMBuSuAhDF
 EBbu9JGJjdqnoH1Uf7uRj/798hN1hMm63k55BLl2Di3w1SJQmqG+Id9qTpkqatlALOKV+grSqx90E
 tKYF1bmp6p6aRcFrM8UbKmMgVAabBTRAOZic/mkV6S4Ryr8bvC5acHnA35azqSz5rmfc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9Gb-0002vl-9x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D467601F0;
 Mon, 15 Jun 2026 15:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D991F000E9;
 Mon, 15 Jun 2026 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537414;
 bh=EifHw/YLYpw/Dcq7IYZh74Hc6w9ERqR9grR0ilAhAIw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=okjY35wncxyjrGteL7z39HyGj2rOZ24bB2jW9cGIPrqaGpFRgrPiRak/+BOrPcZuk
 jIYzooNVTJVMxozteEKnAVLWV3pLcNjAL5v55XE2+EHm6f6XMFSR1X1ZihTsxH0087
 B/nBWZMoy1vPApLczZ3emUOvOZM4e9clpbIP4PhvF926cGZHZ0s8vzRYJMaPyCH/B1
 YGoyZIMD07Oem5EKWRo1tlz4xh4NqWK0/oP9R75jLAG5uAIkIXwy2YAOY7tJPA8hrQ
 IO0xzY11Ylsx7kl9+146OhALXujP/Fnv4U7k6mLB60JFJkzYyFMxAOLjlDqfn6yg9Q
 vWpZi0JQfPTNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 567873811A64; Mon, 15 Jun 2026 15:30:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178153740988.3946007.10376202781077694557.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 15:30:09 +0000
References: <20260527120628.2255597-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260527120628.2255597-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 27 May 2026 20:06:28 +0800 you
 wrote: > A partial atomic write reserves a block in the COW inode before
 reading
 the > original data page for the untouched bytes in that page. > > If that
 read [...] 
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
X-Headers-End: 1wZ9Gb-0002vl-9x
Subject: Re: [f2fs-dev] [PATCH] f2fs: keep atomic write retry from zeroing
 original data
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 jaegeuk@kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:daehojeong@google.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 15390687B21

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 27 May 2026 20:06:28 +0800 you wrote:
> A partial atomic write reserves a block in the COW inode before reading the
> original data page for the untouched bytes in that page.
> 
> If that read fails, write_begin returns an error but leaves the COW inode
> entry as NEW_ADDR. A retry of the same partial write then finds the COW
> entry, treats it as existing COW data, and f2fs_write_begin() zeroes the
> whole folio because blkaddr is NEW_ADDR.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: keep atomic write retry from zeroing original data
    https://git.kernel.org/jaegeuk/f2fs/c/b5d5ab1ebe69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
