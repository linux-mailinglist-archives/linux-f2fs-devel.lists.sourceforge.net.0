Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B9A66509
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Mar 2025 02:30:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuLmS-0006yp-Rw;
	Tue, 18 Mar 2025 01:30:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tuLmS-0006yj-8X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fkwV9DokbFSo9Bn/stp6fYi139O1ufWus4jWXtmXgwM=; b=cOGLH1nNOTUo9yHb0L0Y1DkwO2
 fl5KQzm9+h7Zwqrpj8bOkLTGmub5d0qObH6mlEEdvuB4hiZszcFmVhMfhhMcW33nWCzWdMxzPMSd0
 Ybe33o1lRIMEdHViPItJ40Hzbsm0JkG+8FF/8VbSRrzCx42xunMpKmmtuDtDXny89gPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fkwV9DokbFSo9Bn/stp6fYi139O1ufWus4jWXtmXgwM=; b=G
 1bxs6oUz4RkIg4r8SpXZDvejX1wDqliCbI6GkqfdPoy1FmR4KPgDDMCQ6N3tuzxv2Hl0fZ83i8hRo
 bXPmGZrYlKr8yTz1z0CdTMYQJ2Wfe17da9BVLR/iUXGu9TzC4zal1BcWo02R1F5wCbPQflK+49jIa
 1aWR34lGT2fG4ij0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tuLmQ-0006sM-Uu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5B795C5464
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Mar 2025 01:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442B0C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Mar 2025 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742261396;
 bh=YO2NLbHwZssfhRcVQ73PafaoEbOOk/TMmifaZWRZX3s=;
 h=Subject:From:Date:To:From;
 b=cYWu9IwX5UbBXE8w6f5bzMQJmoY4foMg3S6c4wJk4L1/a2aWoeFeMoN275UCn1n4j
 N+KjGS6HsgJBfd9PFr/KjrVphNjwgLSbJr8qsWIl7HILVPcZ4KW1vI41v7NSSujIFF
 hi2VXpdwTqEdIQUaHredM0kcn36SkoWaNP63z4wee1Vxyc+Sv/TdurOO7ec/lqFz91
 bouAFCuYd2k9dG+i6acCktaPMdIhousDBaMYE6hS4OnpAR6fc4DPuyt2kuT0AM9zA4
 l1LdBxsPRvIDeQgNMqKeW6+WaSzxkfdmkwKUMfUUdHlDORgdiIClwwxgU7gG2GfhoH
 Cm0UDAj/iJhog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B2D1D380DBEF for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Mar 2025 01:30:32 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174226143112.3976340.5604980686176187576.git-patchwork-summary@kernel.org>
Date: Tue, 18 Mar 2025 01:30:31 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,
 v2] f2fs: optimize
 f2fs DIO overwrites Submitter: Yohan Joung <jyh429@gmail.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/ [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tuLmQ-0006sM-Uu
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

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v2] f2fs: optimize f2fs DIO overwrites
  Submitter: Yohan Joung <jyh429@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=944702
  Lore link: https://lore.kernel.org/r/20250317133611.457-1-yohan.joung@sk.com

Patch: [f2fs-dev,v3] f2fs: fix missing discard for active segments
  Submitter: Chunhai Guo <guochunhai@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=944588
  Lore link: https://lore.kernel.org/r/20250317101624.3223575-1-guochunhai@vivo.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
