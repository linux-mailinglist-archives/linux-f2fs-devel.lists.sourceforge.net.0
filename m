Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EKFCFomvMmpq3gUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 16:30:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B26EA69A8CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 16:30:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=TOuUhDKS;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=OYh9jVUL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="YqT/UWNa";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="dA80/AuO";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm5WO8Q2GSPT74fdHu+OP43pYSnR+aViQsxxhnnfxzc=; b=TOuUhDKSqiTN2wVFDvGmItLgyy
	h/I99bZ0+1Vb2Fr3xfQ8Wnw2vjSQRBr6KkGdZ6ayQZ2+DTVQhkqQRO6YDPfkb2uKvvy74owyrF/JI
	kMG8/ZkkgmChtXMgWvL5dw0O+thAMor/gy+kvhwJxIj7CU3Ocxz1giOj1cNeVl2KHNgg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZrHc-0003iS-8y;
	Wed, 17 Jun 2026 14:30:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZrHa-0003iL-Nm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 14:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcMmm66fy2boexN+2HQWlLQyE1UT42+Zjhka3b/DvZ4=; b=OYh9jVULdSD5vjeeRRyaQF5Src
 yLaB+m+9ZI38WWDlm0iqPftZVhjNoBiKpxpPAh2cBBmZYGIbOON8jEa9IAtwXaqj+OTWgBKrQV1AI
 KFxfi4OkOFhKSWFay4tqB44qtSwJl1PugUa890EikNemwGC3Ts+DM3YGVsBd4d4VEab8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcMmm66fy2boexN+2HQWlLQyE1UT42+Zjhka3b/DvZ4=; b=YqT/UWNaSOQrBocaSluuBTeZr3
 dtaLJyecHqKpFCFdmHe9mIbLlPA9rqUba2cDKmVXk1TUbKvcCLGphjbqN3B+/7K256G3ensypp1Dh
 SAcaPY1eVtH5P8fGEaOJOpK2dPWKAtSWEwnIzDBKaFm57Rlyk6yKveSbsAFqcZK2GU2w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZrHY-000120-Sb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 14:30:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 579D7600AB;
 Wed, 17 Jun 2026 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB471F000E9;
 Wed, 17 Jun 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781706610;
 bh=tcMmm66fy2boexN+2HQWlLQyE1UT42+Zjhka3b/DvZ4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=dA80/AuO4HowUNwLT3UKvrzr9aMX8vwVNCY+4Qw0TCTFSkYoXgah2eyfv6sH29GPT
 +T+vN3lP5GogPMnGtuymDQk0SZKzcDCsCMQPiLV/RgG6DNrsoy+2zJQCCRlAobluSq
 dsUUsQHvwDQPTkOmPJsP/uWvEB9rDMMmFziE5Xr0gfGTwsbb2qibzuqo7ai5hJyqxP
 EQysr0YIwKtZev8kG0pMtKrfKo1VIYRgQuxBmF/1b6emCckYLb3MOO6G0Pincht6Sq
 /hSfouEB/fKSvHBal96u9flniwI212Ncs8wSgOE5fDC5JsCypTu5Ea6+x4j97z3uwp
 Ae57B2eEGML6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 569703930E3E; Wed, 17 Jun 2026 14:30:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178170660389.1646430.11358036232536145597.git-patchwork-notify@kernel.org>
Date: Wed, 17 Jun 2026 14:30:03 +0000
References: <20260616030655.111933-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260616030655.111933-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 16 Jun 2026 11:06:55 +0800 you
 wrote: > F2FS iostat is optional and is disabled by default. Direct I/O still
 > allocates and binds a bio_iostat_ctx, updates the submit timestamp, and
 > replace [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZrHY-000120-Sb
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: skip direct I/O iostat context when
 disabled
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B26EA69A8CA

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 16 Jun 2026 11:06:55 +0800 you wrote:
> F2FS iostat is optional and is disabled by default.  Direct I/O still
> allocates and binds a bio_iostat_ctx, updates the submit timestamp, and
> replaces bi_end_io for every DIO bio even when sbi->iostat_enable is
> false.
> 
> The byte accounting calls do not need an extra guard because
> f2fs_update_iostat() already checks sbi->iostat_enable.  Only skip the
> DIO bio context setup when iostat is disabled.  If iostat is enabled
> through sysfs before submission, the existing context allocation and
> latency accounting path is still used.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: skip direct I/O iostat context when disabled
    https://git.kernel.org/jaegeuk/f2fs/c/b51f606aa323

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
