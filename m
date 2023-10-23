Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A347D3AC5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwt1-0003AZ-09;
	Mon, 23 Oct 2023 15:30:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwt0-0003AM-E1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YoW2XuVytjJQwZvdB98h8/RpVvijLCXU9O1TMP0Ifyo=; b=aRX2D6Mn5z7acKBiO1RnCsy/Ae
 lMXoSrcHFpNivg0kkHgjGNEXJHd1Fsg7U3Qeo75gAHgL3uT6vssh0Meqlmt6h672NTSNaPGB9qauU
 dQz6oZY/m3eHZLCoHRnKLM9ZMJyK3Yw33dh1F2lD+7HIfjjxX6FL7jWtjrpkN90wzPWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YoW2XuVytjJQwZvdB98h8/RpVvijLCXU9O1TMP0Ifyo=; b=c
 yI2/pTPCWh9IWbzf/X7IPIfVzQ/gaJPgmKk1/AUyJNnFvgRlMvQtxTg2EeSb8SrpbgbOQaqH6pY39
 E2h0DiWZg8sIY7YFXs8hqh3O2MMBhDF4p2yzdWZafDiC4cGA5G5M0UGw5N8boF+ysaNF3Ld/XJLEn
 EQp9DUS+nqjc6d+8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwsy-007FvO-Bl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58E1761B74
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03951C433C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=5dEPofQQX7kzjPvdB9cVusHecLomZgqPqqkeKIhJNYQ=;
 h=Subject:From:Date:To:From;
 b=KaNDLWFfmUFVZRC0dtaWFBjXmiCA33U2f8dsDcn9n8U1dmerMMMwP5qBX/93X6DN+
 k2IKCZ14PP5MY3jXfGtUBz8a8Y+vRXiU4GCOUo4UbU3XFv9ScZLPwKS4lZ4Zk6wEOq
 b4WelMElYnsxy/XBzumd8EwlF4KfZGRquSzJfmGaRZ5/MJ/Z96gDXZ2dNXoJKmg+Qg
 fZT5nVaFDjJAKlqtwsUGG4xD4zCUurKH3vVy2tlFdAJ4bCVz3ZbrJrllCRFQpxIOzW
 beAiL/zfib5kFGaSA6v6pt3I2EezMhyAmWkiU0CUZDZ/84cK1rAufol0Srvj3HBO5v
 ZtZat0lY7EY4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DE194E4CC13 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Oct 2023 15:30:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502484.26537.4897695792131679719.git-patchwork-summary@kernel.org>
Date: Mon, 23 Oct 2023 15:30:24 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to initialize map.m_pblk in f2fs_precache_extents() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwsy-007FvO-Bl
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

Patch: [f2fs-dev] f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=790886
  Lore link: https://lore.kernel.org/r/20231007074552.3170496-1-chao@kernel.org

Patch: [f2fs-dev,V2] f2fs: fix error path of __f2fs_build_free_nids
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=793507
  Lore link: https://lore.kernel.org/r/1697455651-11124-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: clean up zones when not successfully unmounted
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=791910
  Lore link: https://lore.kernel.org/r/20231010193628.2629168-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: let f2fs_precache_extents() traverses in file range
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=791616
  Lore link: https://lore.kernel.org/r/20231010013459.115024-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: stop iterating f2fs_map_block if hole exists
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=789731
  Lore link: https://lore.kernel.org/r/20231003225208.1936359-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: fix error handling of __get_node_page
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=794205
  Lore link: https://lore.kernel.org/r/1697611862-25239-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: finish previous checkpoints before returning from remount
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=795192
  Lore link: https://lore.kernel.org/r/20231020163645.2852056-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: Clean up errors in segment.h
  Submitter: KaiLong Wang <wangkailong@jari.cn>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=792864
  Lore link: https://lore.kernel.org/r/1712b338.95b.18b27c8a5b6.Coremail.wangkailong@jari.cn

Patch: Add 16K Support for f2fs
  Submitter: Daniel Rosenberg <drosen@google.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=789420
  Lore link: https://lore.kernel.org/r/20231002230935.169229-1-drosen@google.com

Patch: [f2fs-dev] f2fs: do not return EFSCORRUPTED, but try to run online repair
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=794901
  Lore link: https://lore.kernel.org/r/20231019225300.1846362-1-jaegeuk@kernel.org


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
