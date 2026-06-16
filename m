Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ihXGQS6MGq3WgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4268B8B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YUmy4U4Y;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=c7RWzwxS;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Y2SGFnOC;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=chquJTHv;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyQljyR5Eo9aW49mx5s7Fgwu54ffU2Sq1I9ly0u2iLw=; b=YUmy4U4YHucHyhD5bQmgNgDuOZ
	up+W57OABZPfJ5/mo5Qh2OPwl3PGM8EvCDrZo01vJQhajdvBYBNyDeyQXGAbMmJYeH0Uwntlm4oAz
	vjshLXBUBRYOWbO3dTbQdipdAdz9CIJefmn5FHfL04GD8SaAkMfy1m0DrNNmqcGM+1sM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZJsx-0007T1-Mk;
	Tue, 16 Jun 2026 02:50:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZJsb-0007SX-FQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CNNe1T2Rrrn24P9kGz8Kt9VA8EiwOwuhQ6dN+SFK1gE=; b=c7RWzwxSaIFA4mEDDE2e3DFkWv
 VsRhRuW5ib3eFs77OLTRmuZC4W/SZvrPDDYGAYohZYeVp3kSPM7HKK4HTi67byzIcVT4Hpfs9DVc8
 UkMlFD5vgFDnoBd37952S6PgiwBQOdQqrJtzgIdhBHNsyN10VUXuS9lv2WaaLpWjFkes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CNNe1T2Rrrn24P9kGz8Kt9VA8EiwOwuhQ6dN+SFK1gE=; b=Y2SGFnOCGsz7QtPvejspcEgvMU
 WZZr/85WCbuQZsfe6XN66WQQmj04G4vzrMgbzklUqf1N6as4S+vMmpBGCdGlOcxu+xN5EDJDzh/eF
 jZtdLbQcUDWGD6Ih7KWC0Wd4lB6Aixh5h8Ec1rBZg1Ow779/+DhbFp/VPCxnn6bKk6Rk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZJsX-0008Oc-Sc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 13E2F4044E;
 Tue, 16 Jun 2026 02:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEE81F000E9;
 Tue, 16 Jun 2026 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578213;
 bh=CNNe1T2Rrrn24P9kGz8Kt9VA8EiwOwuhQ6dN+SFK1gE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=chquJTHvFPW3RbgnctnCDJ814DeEzwDbHoVeb05fock4jA17rvI+3w3b0SkunZOAp
 VFypFA61K4cAkMq/Wyc8fT1vR/cXIdC3Wbuv2KR23Tqe1EJnIihkxKn3MMw8vb3eXJ
 8EjuHHhWkGbpFD9QpTvYpH+WrtQYZ31IrvUrbxncer51EKeh9ha1eeDGo2yQJsLbNd
 KxyLYrgmOXfDtJP1W3DvnKRXCPsRNJovtOas7XPgj+uGroSjcuxBF4DHB4p2cLhHX1
 fYdF1hgdWtBDc7LNzBOoScEss4b/zz+nSVqf9QiZMTcJk587febLFzUCcjCWnGKIiI
 UJHWWar0nj2OQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 1992A3839A26; Tue, 16 Jun 2026 02:50:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178157820763.407856.9024495873605797681.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 02:50:07 +0000
References: <cover.1781119949.git.bvanassche@acm.org>
In-Reply-To: <cover.1781119949.git.bvanassche@acm.org>
To: Bart Van Assche <bvanassche@acm.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 10 Jun 2026 12:34:16 -0700 you
 wrote: > Hi Jaegeuk, > > This patch series reduces the amount of time spent
 in interrupt context for > completing write bios. Please consider this patch
 series f [...] 
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
X-Headers-End: 1wZJsX-0008Oc-Sc
Subject: Re: [f2fs-dev] [PATCH v2 0/4] Reduce the time spent in interrupt
 context
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
X-Rspamd-Queue-Id: F3C4268B8B6

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 10 Jun 2026 12:34:16 -0700 you wrote:
> Hi Jaegeuk,
> 
> This patch series reduces the amount of time spent in interrupt context for
> completing write bios. Please consider this patch series for the next merge
> window.
> 
> Thanks,
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/4] f2fs: Prepare for supporting delayed bio completion
    https://git.kernel.org/jaegeuk/f2fs/c/130a2e41b08d
  - [f2fs-dev,v2,2/4] f2fs: Rename f2fs_post_read_wq into f2fs_wq
    https://git.kernel.org/jaegeuk/f2fs/c/41e63c48ab9f
  - [f2fs-dev,v2,3/4] f2fs: Split f2fs_write_end_io()
    https://git.kernel.org/jaegeuk/f2fs/c/09b06dc6a7d5
  - [f2fs-dev,v2,4/4] f2fs: Run f2fs_write_end_io() asynchronously
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
