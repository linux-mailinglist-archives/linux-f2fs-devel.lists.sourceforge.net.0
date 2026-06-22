Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8dmrEXeUOWo4vQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 22:00:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BD6B2314
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 22:00:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RsEpZpap;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="C7Vpnj/m";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="C /I93vJ";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=NfPgYdg2;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EftU6hJlrU7qTjy7TTM8h7xKDbDS5S6K7ObfqT390rQ=; b=RsEpZpapt/NxUijEBTOFIuizFF
	Ff7e+nA+09/Ctlw0Q9ILJfcwVIO0qBZuNVxBXm1AxygHlUVyolHw7szkyo2tyRjY7N0oQsAOCMTBF
	goMqicT6u6/DkvXQ0iYl12ME9ZrEKVRG0Iy2k9sPDQPkK5YsUrSI9kCYja9zxk6rBd7I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbkp6-00053M-Je;
	Mon, 22 Jun 2026 20:00:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wbkp4-00053E-RA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 20:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qEjW2ja5zsHriXbhJAmzEId+JHa0NC2ygo5J6xWZCq4=; b=C7Vpnj/mxlTwGu0GBKp6GbcXbJ
 NIhhgCV6syMcsLo7ZKuqAWFpFAa34ZS58RsUkneSrT5f+RMeynoIHSGoLu6mZCxbs4BYQZkKeaQak
 CrfU8Ymi3UXfTzAyEvuqta0HRKonqIhlpJ7a7a5UwY+/ZcD4UjtckcO1xw7Z94Txic5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qEjW2ja5zsHriXbhJAmzEId+JHa0NC2ygo5J6xWZCq4=; b=C
 /I93vJN54JQzXiBCjYVHEZumNcrSX0SBvL1HPzBA0nrzwpupDgxLeJt/m3RE1cdGfDVqk0BGomr2u
 jMRevo5hgYawI6lyrZEcW1UGZ0bYdzEdHWBajY25jn3nnNoa9uT+cRJYSKYqn7O/1dyGxy9Bmm0WI
 NBKTbT/3U9Iog9Hs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbkp2-0004Nc-Ku for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 20:00:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7253C601F3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 20:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0851F000E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782158434;
 bh=qEjW2ja5zsHriXbhJAmzEId+JHa0NC2ygo5J6xWZCq4=;
 h=Subject:From:Date:To;
 b=NfPgYdg2GrsVtNuglRmo3q54QNuHutEWiVqVvZnqsXnjCulv97kdE4WXBTKdzDTvc
 S/A0QW5mQHM0ng3t9jGNO8bWqwOlir7xa0Qf/ONjjop/2QMRPBG4Rd8LseZE256nRQ
 PN4GQ2TBJn6lH+K9P2/jTHpw7VTvdfOTyL5g1873B6ZgKwYHDVjjzrSNYq5dz+KgMB
 Ze9SYXvVv7AHjgv8/0RUJE07IapWrHmn2xE0paAApjz9CwCIXr1TpV2+82fSjgPsw0
 zBYRKoSxKLwVvMTwT0//zNI1gnpuRFhDxzlG7h5C9RlEl482ehToNm1IjNdiKTkWdW
 wNEEUG21xcdRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D11B73930922 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 20:00:25 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178215842444.1396481.2249149402288597739.git-patchwork-summary@kernel.org>
Date: Mon, 22 Jun 2026 20:00:24 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v2] f2fs: fix
 to round down start offset of fallocate for pin file Submitter: Sunmin Jeong
 <s_min.jeong@samsung.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://pat [...] 
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
X-Headers-End: 1wbkp2-0004Nc-Ku
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_EQ_FROM(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D14BD6B2314

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v2] f2fs: fix to round down start offset of fallocate for pin file
  Submitter: Sunmin Jeong <s_min.jeong@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1114514
  Lore link: https://lore.kernel.org/r/20260622052817.3972188-1-s_min.jeong@samsung.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
