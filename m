Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCF9485FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7AQ-0007JR-42;
	Mon, 05 Aug 2024 23:31:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AI-0007Iz-9B
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkGLCH6AA8QG8aaw0GDVG5SYDYlDnQeBMK4QEjyqfNw=; b=Ev5HbJwrUvOqgNEuf4K0X58vuw
 d+a7A6vPJ+CBpyRiHWpwfESlmebgTdwXoBWbyEMHz1qf4qbw3/VXyU4nDc2NuG7ZSC39Nk2yxtrit
 mncC7hC0+88r072LSrcJ53b4xqyPXN7CerUxCPvEOSwB9buZ1/E6uqrz0uoNLngsPRG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MkGLCH6AA8QG8aaw0GDVG5SYDYlDnQeBMK4QEjyqfNw=; b=j
 4/+wZ77jX0nu2fzEsSEBdKQqA5ROh+LhWF49oSgBRJrC5DQA7Lg8RNhM91ONii6IVXeLeJ+RVkfXF
 4427GV8LlTgkSeG8TaTQqShV1FDpChl9FLeyX8jxZDzmJIMPkdIxE3B5Jr+VmpYxgYBCP/slHYxc+
 MW8zSEZmqAVrJEDs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AH-00059r-Eo for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F77160EA9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6FE3C4AF0B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900651;
 bh=a1deIRdLwu8potLu+W0FTdVjnZ46QGgNha9TvmfRAUY=;
 h=Subject:From:Date:To:From;
 b=aE/kXRE7EZN/x8f/U7OedfJJZ40vq1GiYUodx7qT/o+C/GnRmNjPsIvu9hcC2CTt5
 rcitEOfpgJTc9oj2aZYyig7DDjRn+wvl5g5hCzHzcHk7WiXzLw00YCLgtGT7nCEO5O
 ttwo+VfnDQjFH//cwkamcuOeluqLUa+GgNCC824dcirx9WdSy3Q6/DH0WDtVK9CzVY
 z+OHbdcKrZDIomQuX3EOQTraggo1spQkbq4+P1U6Y+SwOuia7rFl0hEhqnFYG9Tkeg
 38ioSDhlfyyd0VEh8bGr9++7Sq0Q0dIxRO6Bs1/+r5QcbNHh8yWk/tmruVfy7B9PyI
 KR8wPk03ZdbmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AC68CC43337 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065158.2803.16538877170316459584.git-patchwork-summary@kernel.org>
Date: Mon, 05 Aug 2024 23:30:51 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v5] f2fs:Add
 write priority option based on zone UFS Submitter: Liao Yuanhong
 <liaoyuanhong@vivo.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.o [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AH-00059r-Eo
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

Patch: [f2fs-dev,v5] f2fs:Add write priority option based on zone UFS
  Submitter: Liao Yuanhong <liaoyuanhong@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=871359
  Lore link: https://lore.kernel.org/r/20240715123451.7918-1-liaoyuanhong@vivo.com

Series: [f2fs-dev,v2,1/2] f2fs: fix macro definition on_f2fs_build_free_nids
  Submitter: Julian Sun <sunjunchao2870@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=872806
  Lore link: https://lore.kernel.org/r/20240722023913.54788-1-sunjunchao2870@gmail.com
    Patches: [f2fs-dev,v2,1/2] f2fs: fix macro definition on_f2fs_build_free_nids
             [f2fs-dev,v2,2/2] f2fs: fix macro definition stat_inc_cp_count

Patch: [f2fs-dev,V2] f2fs: fix to use per-inode maxbytes and cleanup
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=873984
  Lore link: https://lore.kernel.org/r/1721975246-32345-1-git-send-email-zhiguo.niu@unisoc.com

Series: [f2fs-dev,1/4] f2fs: atomic: fix to avoid racing w/ GC
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=865147
  Lore link: https://lore.kernel.org/r/20240625031351.3586955-1-chao@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: atomic: fix to avoid racing w/ GC
             [f2fs-dev,2/4] f2fs: atomic: fix to not allow GC to pollute atomic_file
             [f2fs-dev,4/4] f2fs: atomic: fix to forbid dio in atomic_file

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=870295
  Lore link: https://lore.kernel.org/r/20240711014632.3927676-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to wait dio completion
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=866020
  Lore link: https://lore.kernel.org/r/20240627071711.1563420-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix several potential integer overflows in file offsets
  Submitter: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=873619
  Lore link: https://lore.kernel.org/r/20240724172838.11614-1-n.zhandarovich@fintech.ru

Patch: [f2fs-dev] f2fs: use f2fs_get_node_page when write inline data
  Submitter: wangzijie <wangzijie1@honor.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=840263
  Lore link: https://lore.kernel.org/r/2073e8995f5444aeaf7133b87ec07de8@honor.com

Patch: [f2fs-dev] f2fs: avoid potential int overflow in sanity_check_area_boundary()
  Submitter: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=873622
  Lore link: https://lore.kernel.org/r/20240724175158.11928-1-n.zhandarovich@fintech.ru

Patch: [f2fs-dev] f2fs: prevent possible int overflow in dir_block_index()
  Submitter: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=873614
  Lore link: https://lore.kernel.org/r/20240724170544.11372-1-n.zhandarovich@fintech.ru

Patch: [f2fs-dev,v5] f2fs: reduce expensive checkpoint trigger frequency
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=865565
  Lore link: https://lore.kernel.org/r/20240626014727.4095350-1-chao@kernel.org

Patch: [f2fs-dev,v3] f2fs: fix to avoid racing in between read and OPU dio write
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=866017
  Lore link: https://lore.kernel.org/r/20240627071521.1557830-1-chao@kernel.org

Patch: [f2fs-dev] Revert "f2fs: use flush command instead of FUA for zoned device"
  Submitter: Wenjie Cheng <cwjhust@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=861860
  Lore link: https://lore.kernel.org/r/20240614004841.103114-1-cwjhust@gmail.com

Patch: [f2fs-dev,v3] f2fs: get rid of buffer_head use
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=862893
  Lore link: https://lore.kernel.org/r/20240618072620.720535-1-chao@kernel.org


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
