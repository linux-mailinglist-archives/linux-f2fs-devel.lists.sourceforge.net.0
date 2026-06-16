Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sRSRHAS6MGq9WgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C868B8B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=OsxriHsp;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DvQ6kNMG;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Ze529zNn;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=jgvPQcSN;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5vjyJ19UTY8z59pn8CQK6Twyk/nkEuMUrmEbTcNEV4=; b=OsxriHspOVkmlYFHbWRDy4W0mM
	zL+Y0S9v8xKRc6o3UjP2jKdiX2RIzeVHA+0cpGRlzkbBQ5LDz4b2+8cxDAxbdEB5OapAM4NyJ1DMZ
	lMpAoa+YX7aPDRv4sIj4XUmryPJ/SHOBvXEBIvXtYmjYxkSFlaqDYYiqPYdPynPtbNik=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZJss-0004Ev-96;
	Tue, 16 Jun 2026 02:50:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZJsc-0004Ea-GK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYHXw9s2G03tp7BHPHlk59AgvjQ7NSMtGPMB/Lk+1Yg=; b=DvQ6kNMGO4ulD0e1mNRR12diQQ
 VlGspCM1S2Lgs2dzJM5BAN1XRCbughOVIOLynCH2j2d6pNoJ+In+0C02ax8gwgVs+UXt/+FFhI9I8
 dPuOzZz1qSX49RN+h50m7TQQ4XDnnkqg528S9TbttYpZ32JdW8yQedaZRc2pnGqVfV4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYHXw9s2G03tp7BHPHlk59AgvjQ7NSMtGPMB/Lk+1Yg=; b=Ze529zNnccuotFqvxtqxc37ZIe
 C9fM0tMlRiG1QI86ZNePOJLq3kyyuhHncVM7cKGpb8TgwE/C/WC5GyWRcSbCsVHNRbsNH/z/vqi2Q
 aI0JDC5RBlIXNqdWieXIPw0mZ6sh8vB6ZGF+siUoCa4C0BpR3vQ3bU2/K9WYe3u2h9O8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZJsb-0008PD-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D77F4065A;
 Tue, 16 Jun 2026 02:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724081F000E9;
 Tue, 16 Jun 2026 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578211;
 bh=uYHXw9s2G03tp7BHPHlk59AgvjQ7NSMtGPMB/Lk+1Yg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=jgvPQcSN6AACN63Ha0a7jlWmL522AGc2J34NqZBlcT3aF0OSLhFbva2nmCAuLjLXN
 vxEyTVGY0aeqsjXqxcxMUWtjolfFC5VtNyoGxHHbhyNMweZ3cPJH0Nj8hokZijwU3s
 KjUV+PntsgHjMO6jAGXAUhemZVp6AGaB2WAQCQFC0MpNP7i70FiXZ/ri4C1spQZSgc
 nW85Kqorr8e7cVU0p0pjykZBzuci0TYOuefvAj5Csb/pU/gp3E6FaMpep6nufCVo8O
 pRGPoHCFD/Gx0r4X/5BKRSkLzoc00r6LH8N02gVgiO0TqTIj3AstaczyGW5eJVsZNw
 OibQQrNylD/Tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 93BCB3839A26; Tue, 16 Jun 2026 02:50:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178157820614.407856.1733629854453320542.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 02:50:06 +0000
References: <20260603161127.17464-1-sam.moelius@trailofbits.com>
In-Reply-To: <20260603161127.17464-1-sam.moelius@trailofbits.com>
To: Samuel Moelius <sam.moelius@trailofbits.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 3 Jun 2026 16:11:26 +0000 you wrote:
 > The f2fs dentry lookup path can use the on-disk name length before >
 checking
 that the name fits in the dentry filename area. A corrupted > dentry can
 th [...] 
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
X-Headers-End: 1wZJsb-0008PD-Bc
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate dentry name length before
 lookup compares it
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sam.moelius@trailofbits.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F2C868B8B8

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  3 Jun 2026 16:11:26 +0000 you wrote:
> The f2fs dentry lookup path can use the on-disk name length before
> checking that the name fits in the dentry filename area.  A corrupted
> dentry can then make lookup read beyond the filename slots.
> 
> The bounds check needs to happen before any comparison that consumes
> the name length from disk.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: validate dentry name length before lookup compares it
    https://git.kernel.org/jaegeuk/f2fs/c/d6d43742e65d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
