Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JbtPFomvMmpr3gUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 16:30:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0069A8CB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 16:30:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YRKKPQB9;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YouhgRvu;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="U zRHa5t";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=eDwS+ITs;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQOflFnANTug5MIBaw9ay4I1xbEnoXWQ5T9UqjPpBgA=; b=YRKKPQB9NvOGZ9TvucqMPl4r9+
	DvwWJsVJSzChgdDXNSZhB74PzPBDPQsAq54G34+u1Ntrr0PgYe3mLOS1zp/FjIIh6H6ylAGEJT82H
	mv0vqFgCdJWd43j7jaamKmFvZn92VCyqw9wEc4L+WUVplU7kN/jY/kOh2zGybltavRQE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZrHZ-0003Zj-K5;
	Wed, 17 Jun 2026 14:30:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZrHY-0003Za-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 14:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvyNoOtE7rBE1+HnSYp9ODGEyXH9VFGhK8rGSA0BCD4=; b=YouhgRvuSvluFQLHIk1QIB9zQB
 iz2EdXAkPU4b+J3l27il/FVjcO7TdVvIWtFI5p1JP8g/8miPXAXFPO5Z3cs/AO1IHg7VMY/iPOPJk
 zf+4nHok5yUsHMreM8pvIUOYPyn72qdrCZpMjJGkDXW+FqbI0zrEe5ff00L9evIcjh9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MvyNoOtE7rBE1+HnSYp9ODGEyXH9VFGhK8rGSA0BCD4=; b=U
 zRHa5tZPAkuQAzPtsfcY1AfOc0q073a9A9Ovjv0jAXzde3qWZYnt5wme9bvKZTwWVRR1K0S1qaByS
 iVVpg/HnwBaaLzgadp5L6q8jhz7ndU2xXiwOByXt+/Uf1rI0vekaxhmwyO4lU2SPSuzch5jfPY37n
 5fzJOpyipv1J95/Q=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZrHX-00011j-L5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 14:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AD4D640D6F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2026 14:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CDD1F00A3A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2026 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781706608;
 bh=MvyNoOtE7rBE1+HnSYp9ODGEyXH9VFGhK8rGSA0BCD4=;
 h=Subject:From:Date:To;
 b=eDwS+ITsIcPYs5WZA7WjMZRC0c7sbxPmUPIgzQNgoAQcLuUL3KH2MgJzPHNrn32z6
 irnVEJb78KRQQ8BlKpzXn3QsAD10ibXTq1xAep0EBT0zZBGjK7YBw/BAeU/7tIHoAf
 MpBhP6gXE+vuLfptSNQqOJsM4zguDIG00IJqRnyto/z44vptaPRX43Kum7qP0MO0SB
 HtSORVLvBJZCObGmgmimSL4FRtI0YYaLwP/3j24rPBE1T46tNd9kAXek8zs0/Tn0iE
 g9J3pgTvGauSdPUxItUO1rhHjTVga12Y79umYDWt90fMNcMhjwa/V6H6pLnTxaypZr
 UOXnyUUVoitgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D33E53930E3E for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2026 14:30:03 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178170660246.1646430.15154465527633335923.git-patchwork-summary@kernel.org>
Date: Wed, 17 Jun 2026 14:30:02 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v2] f2fs: skip
 direct I/O iostat context when disabled Submitter: Wenjie Qi
 <qwjhust@gmail.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/pro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZrHX-00011j-L5
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
X-Rspamd-Queue-Id: B4F0069A8CB

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v2] f2fs: skip direct I/O iostat context when disabled
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1112037
  Lore link: https://lore.kernel.org/r/20260616030655.111933-1-qiwenjie@xiaomi.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
