Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A381474454D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jul 2023 01:40:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qFNj6-0005yZ-C0;
	Fri, 30 Jun 2023 23:40:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qFNj3-0005yT-OJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jun 2023 23:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZYDR2TWxAQBjrseq1iJKm/v1/dvUZmb2sMqFNnmeLE=; b=fEZD9gA+v9YAZq3YYcqPTSnL/V
 NVHqSIXDERI6aSjIF3TjuGsJCBVxIl99J2OyT7TdG6jTKp6U5Xiumcq0GR+eqOLJTPj3Kb12TVQBc
 jSCCCZrucYA4lD4XVnnwgiv52vI6VQ/TcfWfu9kzwze3vrpq6Snb6k6U28uDMA1mvfTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YZYDR2TWxAQBjrseq1iJKm/v1/dvUZmb2sMqFNnmeLE=; b=J
 hkI8k0P7cW5aVPGlWZGQb69XV/wkTXTNQpOOZkZ5SqHPRqg4kTZsvYVB7JfKUlxZltGx6ObaOgzTI
 j/eb5wAuljA2iByt/4P/ttWVWbO6jvaQMOwGxuv4LeS9ZwiSpbZvEF0ErsslaMTCQ5sgFtyha8nxK
 C/ZtYNpNGqGwFMHw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qFNj3-002Wkh-FO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jun 2023 23:40:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A0FD617E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jun 2023 23:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1A0C433C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jun 2023 23:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688168423;
 bh=L2AaKeMuP0jsXpJ5ClfyUX6qK20+3skbkismnC6S8bU=;
 h=Subject:From:Date:To:From;
 b=Due7B4moSjS+12f8NFLmcGX+ZJz8fH0MjWNvCYQY+SWEigxNRvVsWSj3DKkpq4yqF
 zuO9dg4egTZwN0Rcj5q/wuTRZ3vG69KeyjWiVhqjPJOj3W6W2W/8JSNC73Yd2Xpv0F
 KQz6Lb20+qxC7SVBh3DKxVdJaWB5fOgj0o0HKFXgaRWRrQNzr+mA3LdbZkIysPlO5C
 MoiPErWd6Rr2mQBh9ebpXECsxblDdTSWAkUS80TNVz3WTAOf0j6kmimZNFuAGhrj0B
 aNYsoZ91/WoTGQ7r1NO+SmboF6c1NH9ruL9blWg8HkorBvlG+o5c/tZU9mPhTAw5kd
 pe6Hia4J182xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4E868C39563 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jun 2023 23:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168816842324.31915.640960670411622269.git-patchwork-summary@kernel.org>
Date: Fri, 30 Jun 2023 23:40:23 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to do sanity check on direct node in truncate_dnode() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.o [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qFNj3-002Wkh-FO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: fix to do sanity check on direct node in truncate_dnode()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=761204
  Lore link: https://lore.kernel.org/r/20230629111144.3582787-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix error path handling in truncate_dnode()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=761084
  Lore link: https://lore.kernel.org/r/20230629014102.3057853-1-chao@kernel.org

Patch: [f2fs-dev,RFC] f2fs: only set release for file that has compressed data
  Submitter: Sheng Yong <shengyong@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=760603
  Lore link: https://lore.kernel.org/r/20230627122153.1557656-1-shengyong@oppo.com

Patch: [f2fs-dev] f2fs: fix compile warning in f2fs_destroy_node_manager()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=761085
  Lore link: https://lore.kernel.org/r/20230629014134.3058318-1-chao@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
