Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 090608C5FB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 06:20:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s768J-0007U0-E5;
	Wed, 15 May 2024 04:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s7687-0007Tk-R1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 04:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1AqOk16umgq8Lla5vY2gaLGqVu1cF5iy8OSwQQD9gnQ=; b=kqDCu5wu5RnbTV45WkSE1OBAz9
 KM1dTluCTn6xwvSXIA5POS//NifPTK6CXLyyRZ/UA0vPAa9uwtUF1+GSpAfbBhmpQJhJYWVSAi9Pq
 wCJoYALE91fycZACZWQ/+O6qJ76ed6jgW2hoft37GfsfpfwBlnM4SYVz6uw+7Ymqr760=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1AqOk16umgq8Lla5vY2gaLGqVu1cF5iy8OSwQQD9gnQ=; b=b
 /Dgoxo/U9Gx6FbOnrFAnW/O9qhEmQFpV5MIkPKY0QoCpLQIzy0GfOTX7v4XBInf16H5Gi8Fy5LtTN
 Zxq/peCZXSZKemNbLucbxqbcWOZXM22s+mRh5KEs4ikA447rRuGWkEUDWrkq+G5PdIswdQ4+E/G9G
 3hC+d4mHUixIXE1M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7687-00009i-82 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 04:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9964CE1374
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 04:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0870AC116B1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 04:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715746830;
 bh=f3QQcfXo1DgLEaiimJ7Qf9ylzTqzx0rvFMB1LPSc7Bo=;
 h=Subject:From:Date:To:From;
 b=ExOMjvboyDJX8YrU7xZVHvSRG3kTi7x99cM7A7+Vh1Siar/2DwI18pzPAwa7XKDpy
 IuF4JFDLU6XGbI7JrJJlFAK4BxHXs52XaqkG9S17WlW6wzxKn37+8E1uRpzXugK9c9
 RbU0y38yPml8VM4FadnexVDhwlaiPWBVr8rz1Q/nLOE57m+acMd3d+nzWeCOVKhAx4
 OpzIRO+4RY9VWaKghBe0xMvOl9ymEM4ZAXoHTdM9A2fQ7Vf+OuqK4Vc0ByHaVCCYcG
 8gOY/8lmJr5BndbtjlyBRWaHMOqXO/nBglAdB1o9c4Rk76eba+OheQMh+3cxCizbqd
 x0szOHQ6PqrdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E7FFAC43331 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 04:20:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171574682990.29254.14071335802861982913.git-patchwork-summary@kernel.org>
Date: Wed, 15 May 2024 04:20:29 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs:
 initialize
 last_block_in_bio variable Submitter: Wu Bo <bo.wu@vivo.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?s [...] 
 Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s7687-00009i-82
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

Patch: [f2fs-dev] f2fs: initialize last_block_in_bio variable
  Submitter: Wu Bo <bo.wu@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=853095
  Lore link: https://lore.kernel.org/r/20240514113529.1498545-1-bo.wu@vivo.com

Patch: [f2fs-dev] f2fs: Add inline to f2fs_build_fault_attr() stub
  Submitter: Nathan Chancellor <nathan@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=852853
  Lore link: https://lore.kernel.org/r/20240513-f2fs-add-missing-inline-to-f2fs_build_fault_attr-v1-1-c3ce1c995fa2@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
