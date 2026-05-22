Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKP6JtHbD2ojQgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:30:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7185AE9E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2cmljkj08MVg4PziuxyfGQoXXhdHHGfRjLitqWfpYs=; b=jepwYn8rbaDH9mQKTar8UAWRee
	pk3CKojipNkrrzSVQ/jVe7aTDDZqRTGdjiRLCMJqPp5/893KCBX52lzXeEXYioBD7ReQeriEpedix
	sUA473NuaswnbaGsR2zqM0UN1vP6HPwavsfYEUQI2BBOYI+19FeDtk3KKDvNm8i7AoC8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQHWN-0001P8-E5;
	Fri, 22 May 2026 04:30:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wQHWM-0001Ox-IN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 04:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U0B3nJV47GnUsPGJ0wNmjnAObRYUpPkfaK0kEeX5go0=; b=nMHuae+nO8+VJPWIY6jiZbRnIu
 BYsagZBZrqKuMOIA7BU0PtiloBO/Xhe6TVmApaBUjRMLTiBPYSVPffI3nBclx6RJ5K8J+0Vsmhk/K
 TKufZuhSJolQZ9FHi0asMtT2mxruC3q8wk22B3eZhTP4pzkP1c9XiD+9zqxtXtRB2Qwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U0B3nJV47GnUsPGJ0wNmjnAObRYUpPkfaK0kEeX5go0=; b=F
 KXg42dVEehwoO8F9UEkOODS6X79Z30GZD3g8LdH7VZnK4bJiiNXu8Cpt76liWH0QSQlghrb0V0oTC
 w2WxZb1u4tvukyh1Df/5CA3zj5bs/L8DZ/Z/mNvd1a14gs6ILQXJpicax5jQQVdp4jhzwK5KHij30
 RlwxplPF1eC8cJvg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQHWL-0007SA-3r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 04:30:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B43C360172
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 May 2026 04:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3DF1F00A3D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 May 2026 04:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779424195;
 bh=U0B3nJV47GnUsPGJ0wNmjnAObRYUpPkfaK0kEeX5go0=;
 h=Subject:From:Date:To;
 b=lS2h2+ajDVa0UjSWpGPyFM/rIEP8EXq4dMZXhtHj6fOy78KQo0FS5S6nc0YHo5OJQ
 QJO2tond2aQeH65ommHtETU3xXEiroFfOMjd8YQRCvDLad0ByFel/AGg1OAFBNQ1H0
 eFm6ICPRTdbQon1ByUDsC0hU9KphlDa6Xzvuuui357/+ggPszSIoPeS0LNuL24dlK5
 93bnHqIPV9dh+V8fyqlqOgvBCHIOi/YG5VbP/w2ZPsUeB+HVLJVlgF6lvcC98zAsn5
 e44exHFSTLep5lQdEXhWRrpicLhd/99ruBsXkw1IFrXRV+Dm5tKNMQcHkHU1DzpjWP
 zRAxSydcBqYYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 1C2563930E41 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 May 2026 04:30:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177942420469.624124.11626272101636564441.git-patchwork-summary@kernel.org>
Date: Fri, 22 May 2026 04:30:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: atomic:
 fix UAF issue on f2fs_inode_info.atomic_inode Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/p [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wQHWL-0007SA-3r
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_EQ_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: DE7185AE9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: atomic: fix UAF issue on f2fs_inode_info.atomic_inode
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1098390
  Lore link: https://lore.kernel.org/r/20260521021505.1357466-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: avoid false shutdown fserror reports
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1098661
  Lore link: https://lore.kernel.org/r/20260521103748.1954748-1-qiwenjie@xiaomi.com

Patch: [f2fs-dev] f2fs: fix potential deadlock in gc_merge path of f2fs_balance_fs()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1096950
  Lore link: https://lore.kernel.org/r/20260519011438.1168155-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: submit cached data bios before gc_merge GC
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1098454
  Lore link: https://lore.kernel.org/r/20260521053050.1785858-1-qiwenjie@xiaomi.com

Patch: [f2fs-dev] f2fs: pass correct iostat type for single node writes
  Submitter: Wenjie Qi <qwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1097989
  Lore link: https://lore.kernel.org/r/20260520120705.1263756-1-qiwenjie@xiaomi.com

Patch: [f2fs-dev] f2fs: add logs in f2fs_disable_checkpoint()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1092768
  Lore link: https://lore.kernel.org/r/20260510163033.12148-1-chao@kernel.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
