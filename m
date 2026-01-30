Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FT6HQzmfGlTPQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 18:10:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26CBCDA6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 18:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxb5QXKLFGdztzmZDVgORL8G3WsDRyiEgYTTIvzGKKo=; b=XcaxyH6+l6NYPCEZkB+/9kp+6G
	VY0RsHkbX70W6BVqthDR2x72FygA8UsYRmoYUy4KWBcM0OW0nwD6ZTPYESxhyHTdbaB2VFFKyX7Fs
	39eMmfPPViSqn5oDDdukll9nPRSjNKxvRGXTMAOu/3khxudnHKTObXRZoMZaQldQ/UYE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vls0p-0005g6-JK;
	Fri, 30 Jan 2026 17:10:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vls0n-0005fq-VG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 17:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAl/eqFA6ukEFmOf1sOinaQRD0aMtevj9XyRftixxjM=; b=X82nrFat+TX22D0sPeJWW5LtBl
 pO+RcDxOAyFbV5Jk9GTO3KCVzPSCactl8a9RE0fvnVb4NxZhPvktwg6ZvjT71cZNh3afVwSvx2pyn
 jkcy1tWnsyiE8ett2SvJ/5bUFj/wQyfbStzWdNnprMjFE20qR9Uaeljzg8/LL+nb2Su0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAl/eqFA6ukEFmOf1sOinaQRD0aMtevj9XyRftixxjM=; b=NY5jkSTMyYtVPU72mUJerYL0iR
 +odljAlH/qg77w13o4znF1UyFVs2doX7ZlYAzp3nVgG/kY6CrrpMb2GCfhVTWV+R5wcUh1C5ETHBc
 KEJpzLWGaIpeDhehRqAYMjk8yS2PjJ2Oj6HrMxC9lyeMwE9au65+Zoz1JCBPNwlLVqCk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vls0o-00055z-2x for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 17:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB2C843EAA;
 Fri, 30 Jan 2026 17:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC14C4CEF7;
 Fri, 30 Jan 2026 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769793015;
 bh=3DxQeeBfVpm2+71zRITF2v286289Fb7iGsGy1QsWTRw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pVtCU4M/wv9ytbgglzs0lRyGyvQkx0HNSLHo5LJeiPzM6Y8DwDifF5abwYMQJwLaZ
 xSlC2pjDiydq9m+QNMcggsp+vraQUM9sLECzK06nr/Ika4X0KoSJqKGw4+X4iwhIjH
 rcl14n7yDBUVsDaz5F0qR5UqlXH7X2nW2hZllkHya9EVmFE4sEOKvWB29bJu5okTZP
 9qYWoMK4kbNrQYaPtEu3i730CqsYljwvNqcmVDVZc0awzaITqyp8W02cA7tz/7OXlF
 wVh8ceRbJKh6q3jgClGAnn+Y9Ykx2UpTKozWmBEy0KdWvfb+mt7Z26Ynt1uMlZvOiH
 M6AiGxjK9Na8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 4EC06380CFD5; Fri, 30 Jan 2026 17:10:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176979300785.3449000.3636861708580013603.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 17:10:07 +0000
References: <20260126222801.2229197-1-daeho43@gmail.com>
In-Reply-To: <20260126222801.2229197-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 26 Jan 2026 14:28:01 -0800 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > In a previous commit,
 a bug was introduced where compact SSA summaries > failed to utilize the
 entire bloc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vls0o-00055z-2x
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix incomplete block usage in compact
 SSA summaries
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
Cc: clm@meta.com, daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:clm@meta.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
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
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: EE26CBCDA6
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 26 Jan 2026 14:28:01 -0800 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In a previous commit, a bug was introduced where compact SSA summaries
> failed to utilize the entire block space in non-4KB block size
> configurations, leading to inefficient space management.
> 
> This patch fixes the calculation logic to ensure that compact SSA
> summaries can fully occupy the block regardless of the block size.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix incomplete block usage in compact SSA summaries
    https://git.kernel.org/jaegeuk/f2fs/c/91b76f1059b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
