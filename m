Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526B7A88F6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 17:50:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qizTV-0001PY-PX;
	Wed, 20 Sep 2023 15:50:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qizTN-0001OL-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0u58Puvtd5U8PzAEh+40VqH781XjfPAhwSV6ds52UYs=; b=WZhYz+1v4WhG5Uhi9ZIzJBbsiL
 jYLjY2tMBvtMcfwXbp/ZZbrRRrxpNRFtA6vMxMzxLz7IbVdhZJQes9FT4GCX6ucIbqOtvdheuc+tQ
 eGb4RJEG6NcG/kPMApTJv1hDZdFq1KZTnz7pJfhhkpr93lh6cpg1ya6Wfu/MR8ukmRWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0u58Puvtd5U8PzAEh+40VqH781XjfPAhwSV6ds52UYs=; b=U
 29avVhiTz0WM2IzUwpGiblONYWsl2AOpnSrwf9duIkhsFDEnnnCfhpSN663ANmI/7jGstNlNlpPc+
 dNN8eSrOCEmORlpH6HaGtZ/Iji66YYCTB7zJK5pwaqvfZ5fi+1eYCAkbl+vaF+LpvZqzRqIwO5k3r
 ckZzJg2BbzsPgdz4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qizTE-0004cH-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 15:50:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89198B81D8E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 15:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41095C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695225025;
 bh=isOmrW1sOEoXkRd0u7ExTJBuer6z1nLgwAceeHAXAZQ=;
 h=Subject:From:Date:To:From;
 b=A8o4k73MxRjaGQ7o02UAMD2eT+NT/g9ouPxg0lyHiGGQvsBBcUEmxlk6HmTCfRC8g
 y4ICVpI92bO0o8SxOe/sMkylLXBUb4U4clOTLK1eGUpADBFiJhneyYP8WSx3X4/M6M
 nT+mFJCUyZG3UaO+8Jt6K7BXutvEj0v1OX0zN+hvqlGomwMjV6YEuHg1ZCcGVTe5Xc
 tZdqXp8wi01OnKQVfGfjD31wQQCqeZ1cx+3NMZ1XAfwgNIIB9g5xKBqWv65kFjL9JN
 +l3L1VY6O4UyOvRTNywvsRHlV4L0I0Uo0QYNYAcxFwxFHU0PXZ/1oUQxonvi6uE7a/
 XBnb/hock+PUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 264E0C4166E for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 15:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169522502509.22557.16339383650277931414.git-patchwork-summary@kernel.org>
Date: Wed, 20 Sep 2023 15:50:25 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/4] f2fs:
 compress: fix deadloop in f2fs_write_cache_pages() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qizTE-0004cH-Jc
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

Series: [f2fs-dev,1/4] f2fs: compress: fix deadloop in f2fs_write_cache_pages()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=779960
  Lore link: https://lore.kernel.org/r/20230828140417.2951796-1-chao@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: compress: fix deadloop in f2fs_write_cache_pages()
             [f2fs-dev,2/4] f2fs: compress: fix to avoid use-after-free on dic
             [f2fs-dev,3/4] f2fs: compress: do sanity check on cluster when CONFIG_F2FS_CHECK_FS is on
             [f2fs-dev,4/4] f2fs: compress: fix to avoid redundant compress extension

Patch: [f2fs-dev] f2fs: compress: fix to avoid fragment w/ OPU during f2fs_ioc_compress_file()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=781536
  Lore link: https://lore.kernel.org/r/20230904151242.1786219-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: set the default compress_level on ioctl
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=783556
  Lore link: https://lore.kernel.org/r/20230912205015.2582133-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: fix to drop meta_inode's page cache in f2fs_put_super()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=782056
  Lore link: https://lore.kernel.org/r/20230905045753.24964-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: split initial and dynamic conditions for extent_cache
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=782343
  Lore link: https://lore.kernel.org/r/20230907210859.3698691-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: preload extent_cache for POSIX_FADV_WILLNEED
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=785776
  Lore link: https://lore.kernel.org/r/20230920004645.1462354-1-jaegeuk@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
