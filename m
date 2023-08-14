Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D477C1BC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 22:50:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVeWG-00012H-EY;
	Mon, 14 Aug 2023 20:50:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qVeWD-00012A-R5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8LCzzkcHQX2w21iJePa1sC1z0U0OCte7e7CUdEOH3qA=; b=POv0WS2Yv8VgfHNY/U/hoihAhp
 p54o/wkU/bsdgBN+5aXDirVeDkerOtWbfsNgMUr0OmwIwJhA9pA8pUPEyJfOJVdJ9wZfJzAKLI+Qx
 v16TdSH7W14vPERLRpuz6O+J3EDgn3g9liwFB81uDbAMfvsJx0LELGkQNuran1i7pw7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8LCzzkcHQX2w21iJePa1sC1z0U0OCte7e7CUdEOH3qA=; b=f
 wWwIP+nF5LxNFpBpqTLws87/p4JfRc4TZnjxKLxjCltJmz3II62rsRT4gTWtN/+oZtdwV7TvR8U8q
 B9ZOC7H0gkkiK7SNZFeffbOdvcMsl1IPlgEKSF1S3dV6N+TW5yW9Im0Trtwyv/6iNc9DTy2SVQr7X
 evuy+BDyl4eB1UsQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVeWD-005nrp-8G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1B3961DB0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E78EC433C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692046222;
 bh=7FMXJ4nnDccIKmME2luyOcuNmu+siXOg7p+XA7jycQE=;
 h=Subject:From:Date:To:From;
 b=Kwbs1Wzk9ClDfbGntirnbLXq8aVwhG1/JOtPGy8jHNDDvfEa0oRvlFyvw8qT9GuXR
 IdIvWlfQ9Ue9gisPeknL/i6hVcpRMyVGMchz5cilyBYgwSqY799VgatABbSMYaz9SQ
 v/o4+o2M/QwLUJD5Vhy8NEp16rG0IZWEwFeQ6TPWiYfbpNXYlBR8RGyqcgeNe0dUwL
 Z+tRKw4XgDUviZruv2tPGu3cfELLeG5wL5RgzSkp+Rx5BHUuX9eESzgkJ2sXBod7ww
 dmRG9QCE+PAsUtzkCKh8hbIESHGXjX8uo7aXCsXPcRZNPAUi3yCibSPA5/V6ztbIdc
 N4GBUO+0HgQqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1E5ABE93B32 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169204622207.5033.12657255335557343040.git-patchwork-summary@kernel.org>
Date: Mon, 14 Aug 2023 20:50:22 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,
 v1] f2fs: increase
 usage of folio_next_index() helper Submitter: Minjie Du <duminjie@vivo.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/proj [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVeWD-005nrp-8G
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

Patch: [f2fs-dev,v1] f2fs: increase usage of folio_next_index() helper
  Submitter: Minjie Du <duminjie@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=766363
  Lore link: https://lore.kernel.org/r/20230717071109.5663-1-duminjie@vivo.com

Series: [f2fs-dev,1/2] f2fs: fix to update i_ctime in __f2fs_setxattr()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=767418
  Lore link: https://lore.kernel.org/r/20230719135047.2947030-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to update i_ctime in __f2fs_setxattr()
             [f2fs-dev,2/2] f2fs: remove unneeded check condition in __f2fs_setxattr()

Series: [f2fs-dev,1/2] f2fs: fix to account gc stats correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=773884
  Lore link: https://lore.kernel.org/r/20230808005949.1790839-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to account gc stats correctly
             [f2fs-dev,2/2] f2fs: fix to account cp stats correctly

Patch: [f2fs-dev,v2] f2fs: Only lfs mode is allowed with zoned block device feature
  Submitter: Chunhai Guo <guochunhai@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=772692
  Lore link: https://lore.kernel.org/r/20230803142842.29062-1-guochunhai@vivo.com

Patch: [f2fs-dev] f2fs: should update REQ_TIME for direct write
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=774846
  Lore link: https://lore.kernel.org/r/1691656800-21616-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] Revert "f2fs: fix to do sanity check on extent cache correctly"
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=767784
  Lore link: https://lore.kernel.org/r/20230720112953.3764050-1-chao@kernel.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
