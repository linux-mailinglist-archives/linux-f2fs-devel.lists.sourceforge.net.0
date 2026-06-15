Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NORnKJoaMGqpNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF1687B23
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bxYzzzVi;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bYDson9p;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="g ViIsRK";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=YH6AUJV5;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oFIcc2ICHImQ/TkMMyap7mRley6/LYI4N1Bw32fXtWo=; b=bxYzzzVi2GvQ3C46ZOIwdBQZxt
	qCneJU1+0hMRoO+0yZeRhmoCxKO1jN6ToVVEGpbnuDzWcYssQLPscTzkIxBzCzU9nT9UfBf3fNAhf
	cET16KcyW/a2ENZoZpCWXTMI70khJTU/vb2bY2a4LyZwRhl0/KL48QKsbsX3dxJSLF/k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Gd-0004MF-SA;
	Mon, 15 Jun 2026 15:30:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZ9GW-0004LZ-Oq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vHhA7MKdQh8rAtcegREfrfOuoxjtLSfqv3iYhxyv/Oo=; b=bYDson9pHmZRYxEjUDfKlBWPRk
 HmjbzYpWtZlA1SvISAhnE/38ZYaEZ6F/JbVV5h6T96kOPM5Axf5si903+tG343793rXmXADfS2GyV
 zJWZ18wFrS7ow1rPA3/uOESVRXU4pl25krTa9Qt/77mwYh9TtNIYFwvfd0GxyGZWBxfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vHhA7MKdQh8rAtcegREfrfOuoxjtLSfqv3iYhxyv/Oo=; b=g
 ViIsRKbNLMsEkH2MXFcxFAAz16XeXZIDr3ocKy8dEq4QP8ObTszV8uFec9fqlLt/Rl3O/Y+ICWevV
 7kkEVM6cCYEOYGbzBrygSkDJ+m1/cFb/h97Y0FBWc4gswO4ohJPvSrGEzrEGXaLYQROupAn3WK0gJ
 DnvT2U6mAp8NmdH4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9GV-0002uF-TI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8324D601E4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 15:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DD71F000E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537409;
 bh=vHhA7MKdQh8rAtcegREfrfOuoxjtLSfqv3iYhxyv/Oo=;
 h=Subject:From:Date:To;
 b=YH6AUJV5cKLc624BZoFB5Ty9zVjGjLaRgM6q9pJxGgRzeIvn4gslVpj3KZBux7Nsf
 NZFpwn68TWh+W+APA7mMSOUq84JWnA2YryizE9kTDYqfuj7hL5CIyWtDWos4GeTtHQ
 eK7unAX80IjHO4oBTeO6FioDspwU52TPzoAprsM6KeXf91Kcutxhd9Nk7ydHaEJRD7
 cwjjsdbHu8FTW525d2OAj72LL0dOI1svQUK+tG86v52KJgpE/jBY1C0Y/3lW2eRq1v
 d0wEQymMZdIpXgdAocIUSDcXJf7BqtxayzEXhlL8b9pB7T89wDJk9sEwrgtI7eRwxO
 /ykikmlH8kLWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 963093811A64 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 15:30:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178153740421.3946007.14916118422158982423.git-patchwork-summary@kernel.org>
Date: Mon, 15 Jun 2026 15:30:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,
 v2] f2fs: validate
 orphan inode entry count Submitter: Wenjie Qi <qwjhust@gmail.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/l [...] 
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
X-Headers-End: 1wZ9GV-0002uF-TI
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_EQ_FROM(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
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
X-Rspamd-Queue-Id: 20FF1687B23

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v2] f2fs: validate orphan inode entry count
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1100717
  Lore link: https://lore.kernel.org/r/20260526053557.1096229-1-qiwenjie@xiaomi.com

Series: [f2fs-dev,1/2] Revert: "f2fs: check in-memory block bitmap"
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1099170
  Lore link: https://lore.kernel.org/r/20260522065912.1756240-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] Revert: "f2fs: check in-memory block bitmap"
             [f2fs-dev,2/2] Revert: "f2fs: check in-memory sit version bitmap"

Patch: [f2fs-dev] f2fs: skip inode folio lookup for cached overwrite
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1102575
  Lore link: https://lore.kernel.org/r/20260529022924.3655519-1-qiwenjie@xiaomi.com

Patch: [f2fs-dev] f2fs: keep atomic write retry from zeroing original data
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1101617
  Lore link: https://lore.kernel.org/r/20260527120628.2255597-1-qiwenjie@xiaomi.com

Patch: [f2fs-dev] f2fs: stop checkpoint on compressed write IO error
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1100206
  Lore link: https://lore.kernel.org/r/20260525061456.231710-1-qiwenjie@xiaomi.com

Patch: [f2fs-dev] f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1099196
  Lore link: https://lore.kernel.org/r/20260522075329.12079-1-chao@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
