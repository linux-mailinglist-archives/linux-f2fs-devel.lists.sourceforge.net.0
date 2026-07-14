Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DmX8NWmmVWqRrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B72750874
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DgWLHPWk;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QE8uPmFt;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="f IbzUkO";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=EYjp1Rgs;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MdEBDqhoFfhXnle18KmH1ymdulGtZuPeYcW2hIcCVhY=; b=DgWLHPWksBYPUjBmbyp9FLW9yO
	dyay0RfPTMZmIZWUmv+pEvCvudEDxkY8RjfiSjK+Mt5DIw5VvN8yaREhmS1cbf1WzCDyETlSr3LQY
	tn9hzydo9dlq+SiAnIhcyU+48ys40/OvKXApkTC9NjXtnwtAmjGQITKfROm/P/xkVJlQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjTO9-0000sR-Op;
	Tue, 14 Jul 2026 03:00:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wjTNz-0000s8-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U1Ew9sdAkTwinqhZNS5hN3OTTXQSqYS2Fzv9QnO/KXo=; b=QE8uPmFt11OXfMs1xsCFqdVgAS
 3q3BYzT5+c+TiyU1GLo0LjWfvh4TTq5I9oV+YNsVD+iaTQwdrEDhFCk8P0jaKEVV5uaUizz+Ktxn6
 FUQJ/mTnb+4FxvFUe00wulJ56zYsl7hV1gDzfbmE9BXopTF/YpfKYCNIIY/4yMg4yxhY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U1Ew9sdAkTwinqhZNS5hN3OTTXQSqYS2Fzv9QnO/KXo=; b=f
 IbzUkORi1uo655a5l1k59lLOX46G0olalzxMjRLjCscsy8MIhjWm/wWm4g+nw7eAeS4xjLr/VcIQ1
 fGIsCKQfqEG/wC9NNZbn70lr0dQZ0Cw3Tp0+ko2fuCWwhh0j0e9o7wcq6uNarAEXTmWmd2PoaGRhx
 9ZX2dEo44zBIezCs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjTNx-0000kW-65 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DFD0F60103
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jul 2026 03:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D031F00A3A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jul 2026 03:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783998029;
 bh=U1Ew9sdAkTwinqhZNS5hN3OTTXQSqYS2Fzv9QnO/KXo=;
 h=Subject:From:Date:To;
 b=EYjp1RgsVX0015Ca6LjAOwsDkRCx3LwU8LhiGsXXx9tvc36q8mHgmu+QQ8XIwipDK
 +SBs++SQHZQsB+zQd5OuJKS68xFVfrXwPrTX3LrT5qqWogIEUdjMz0gwMREzzCGyth
 wb+H2y+D0ZOIuTkwP5K0pjVyPMPgJEce6th1tsA6ICVBukz7lQJqBryiI7cXsXG9GE
 qeVXQEfMR4U1Gh1SopJ+5sux0Ttb8UaEv6y8nNolOTsWOqbac5h0i829IZWQK5PLPa
 aRH3AC2GKELAQfzGXoFi23X5hgCQAHXEUNFd4a4QRi6+CDjJJLgV4cepbMmscdVAqm
 y82rq02gXKk4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D0C4E3924FB7 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jul 2026 03:00:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178399800431.2939750.18328172018634896031.git-patchwork-summary@kernel.org>
Date: Tue, 14 Jul 2026 03:00:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,v2,1/2] f2fs:
 quota: do not use GFP_NOFS in f2fs_quota_read() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org [...] 
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
X-Headers-End: 1wjTNx-0000kW-65
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_EQ_FROM(0.00)[];
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
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33B72750874

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,v2,1/2] f2fs: quota: do not use GFP_NOFS in f2fs_quota_read()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1123035
  Lore link: https://lore.kernel.org/r/20260707113934.3003158-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/2] f2fs: quota: do not use GFP_NOFS in f2fs_quota_read()
             [f2fs-dev,v2,2/2] f2fs: drop FGP_NOFS in f2fs_write_begin()

Patch: [f2fs-dev] f2fs: fix to avoid potential section-unaligned pinfile
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1118154
  Lore link: https://lore.kernel.org/r/20260629114918.224537-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix folio_nr_pages() race after put in large folio invalidate
  Submitter: zhaoyang.huang <zhaoyang.huang@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1126572
  Lore link: https://lore.kernel.org/r/20260713111944.924883-1-zhaoyang.huang@unisoc.com

Patch: [f2fs-dev,v2] f2fs: embed f2fs_gc_kthread in f2fs_sb_info
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1122341
  Lore link: https://lore.kernel.org/r/20260706123321.4015678-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to zero post-EOF data when extending file size
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1122089
  Lore link: https://lore.kernel.org/r/20260706072606.3709384-1-chao@kernel.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
