Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJbXORGji2kJXgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 22:28:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B811F67F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 22:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7uRV7GWULgdgL3etLTwO22NE8EshTkz20bI6a0UMRaY=; b=UMI5chSz4wuIOqmxm8H/qzG3rl
	M7vB9DgtEMZe4f5V0nYro3PM1zJJNuYAcCauq9fIkcutvTA9pyzCbO0HNmoOM1qtoeStVj4QX9869
	UrIfpn82HdM16xTjFSS8gDQARTaavb4LSb7lh4+kDgrYsWQoc8lguyJE1bSNqsGMc2I8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpvHl-00043X-E6;
	Tue, 10 Feb 2026 21:28:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vpvHk-00043K-5a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 21:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2F4inzl0Gx5mLesVHY4/NV8qevekRe0wLsJZnczMnMw=; b=gkk/EWT9V9qtYGtzgB60RSC6d8
 MYXt/Pn4KzSDS3Hc8RaXxZTVeGpKZS5m2Oe6cY+S38m8wtoYnqWmlV4YDqKe3OCiU5dIlsXod/pDy
 O22jPlZy2gaVy4W74ZDWekH2NJrelpk4sW2MaBVR+dOyGXgHHFJU6UsVdFQxkNdq9v7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2F4inzl0Gx5mLesVHY4/NV8qevekRe0wLsJZnczMnMw=; b=K
 7PUEZtsVx2GZP48WHwadnyc3grbKMnGYCCW87LQYCIBFVcEr6XOn/aL1+azhN8PTTrPhqgMdJcPXr
 APbdCpPt+oYglGTgyqMQy0URbUwAidnA789XYjM3yhN1932ZYTb8xJpMdoS/IR/qDkGcl+a1JblHt
 gxmoCW+Nd7c5/8h8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vpvHk-00051R-CX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 21:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0DC1A44002
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Feb 2026 21:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFA7C116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Feb 2026 21:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770758909;
 bh=9Mk7X3e/NaUQxNDRyd27kvjgPO22yc4Q2rUd79tKtlw=;
 h=Subject:From:Date:To:From;
 b=fHxBhewqm64mg5kBFrsz2ZfOK88sYFLYNEtWEgKNBVnPNsgiPoNoNJGAOBZyD7fve
 cZL7sv0t8+mCFIkB2DZWI17Uud4KWzKuygWT147xDLiE6aSPTGPshvXARcKaHp4Mno
 9DZUHxo/hj57R47jppiSspTk147RF99M8zbjOjjGZ+Ml9txTBhMEFKuDUbVP3iOrhi
 ithXUdpflAlVuaHrybp6KnpDbytIPfYBCbEi+h8PqmDHBuTrEgY3kPPmmnGRIePvb4
 Vt/Vn9Szc+zK/Tp2zaWUru9DzBFYrc5bHVDHmvEncVqBXOWw840elkbuKbj2FBCAmQ
 ISKOM4XFgk3CA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 4A63139E3B79 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Feb 2026 21:28:26 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177075890501.3671709.15696353512099715164.git-patchwork-summary@kernel.org>
Date: Tue, 10 Feb 2026 21:28:25 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: sysfs:
 introduce critical_task_priority Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/li [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vpvHk-00051R-CX
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_EQ_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,samsung.com:email]
X-Rspamd-Queue-Id: 6B6B811F67F
X-Rspamd-Action: no action

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: sysfs: introduce critical_task_priority
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1050963
  Lore link: https://lore.kernel.org/r/20260204030501.85441-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: optimize f2fs_overwrite_io() for f2fs_iomap_begin
  Submitter: Yeongjin Gil <youngjin.gil@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1045595
  Lore link: https://lore.kernel.org/r/20260122104527.416871-1-youngjin.gil@samsung.com

Series: [f2fs-dev,1/2] f2fs: fix lock priority inversion issue
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1049210
  Lore link: https://lore.kernel.org/r/20260130132809.59707-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix lock priority inversion issue
             [f2fs-dev,2/2] f2fs: introduce trace_f2fs_priority_update


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
