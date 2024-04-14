Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CDE8A435F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qh-0005ZY-Bm;
	Sun, 14 Apr 2024 15:32:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qf-0005ZS-L6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MxQFT22AiOQUoFf93yusqSnLWngIfMTRhJi9bkxxcRU=; b=W+7WsGcPPT845iw622bet6y0j5
 BQU5F9LU21HM6YyP+e5WhF3/Nb+ONiWT5ccvf/J5ZArYMl+Nn9bzb3Ca3UWOGneeSdbintXCYbY4J
 PBQH6r6T5dTZ/q9gIidO70cK6jfHXfXDI4UtAFAbX2U9BVIPc1N+wa+JWvAM3F+avF58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MxQFT22AiOQUoFf93yusqSnLWngIfMTRhJi9bkxxcRU=; b=H
 sJFkazJOsCyfBLkIWFT+cME2NLONNrfeh8/xqhyeXt2qQt0d+NA3ewDaZXYar+kwv6uWN+o5h5mqA
 tWsEHc0ZIuWx2Y+XKKEHvyywTz2MlSm1vUJH1Y9wracat2blynVKgy9Jbtl5977VBOJ0gcsjqa0HD
 jsvk8N2NnJZmvP1U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qe-0003Vk-CD for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0DABCE0955
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22D57C072AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=DpkdQqZcDRv+wz/hn6k/Dfdr88HucZ0Sqx1ICguVTsI=;
 h=Subject:From:Date:To:From;
 b=fqUIkVbbbXH+9KV7tfHxsfGNu3F3tCJMtNCrfNywVa4n4YTIjKe598tq6yYn/HxcZ
 QF1Dm+CK9pSRSWERifBI45Om9xJwNkTgylRBkJEXrhAONafviqnwjG9405VpYGHofk
 JDGT5CV5D7Cqj3qmv75vZtAeXnDSUW365FYPSfDzSdS+SV5/qULNqppxYpWJR02h9L
 aoqluUPXTKea/+niJebVacp9Nt/dyMg5JOD4C0DvhEM5PGi7grLRSOz/AjQ9Rtc+rI
 jsd5sg7ThJbMDNt2+Yvyo742Cf8IS0B2WChRG2kYgUjakBdgNuObeXozLrVRwj7lov
 ATZ68ku63yfAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 09508C43140 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876495.3156.10556970641184213979.git-patchwork-summary@kernel.org>
Date: Sun, 14 Apr 2024 15:32:44 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to wait on page writeback in __clone_blkaddrs() Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/pro [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qe-0003Vk-CD
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

Patch: [f2fs-dev] f2fs: fix to wait on page writeback in __clone_blkaddrs()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=838341
  Lore link: https://lore.kernel.org/r/20240326112845.1576111-1-chao@kernel.org

Patch: [f2fs-dev,v7] f2fs: fix zoned block device information initialization
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=842105
  Lore link: https://lore.kernel.org/r/20240407072123.3484300-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: introduce map_is_mergeable() for cleanup
  Submitter: Chao Yu <chao@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=837947
  Lore link: https://lore.kernel.org/r/20240325152726.797423-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: introduce map_is_mergeable() for cleanup
             [f2fs-dev,2/2] f2fs: support to map continuous holes or preallocated address

Series: [f2fs-dev,1/2] f2fs: fix to relocate check condition in f2fs_fallocate()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=841112
  Lore link: https://lore.kernel.org/r/20240403142420.2042498-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to relocate check condition in f2fs_fallocate()
             [f2fs-dev,2/2] f2fs: fix to check pinfile flag in f2fs_move_file_range()

Series: [f2fs-dev,1/2] f2fs: compress: fix to relocate check condition in f2fs_{release, reserve}_compress_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=842106
  Lore link: https://lore.kernel.org/r/20240407072604.3488169-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: compress: fix to relocate check condition in f2fs_{release, reserve}_compress_blocks()
             [f2fs-dev,2/2] f2fs: compress: fix to relocate check condition in f2fs_ioc_{, de}compress_file()

Patch: [f2fs-dev,1/2] f2fs: prevent writing without fallocate() for pinned files
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=843742
  Lore link: https://lore.kernel.org/r/20240411175410.2406710-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: support .shutdown in f2fs_sops
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=831135
  Lore link: https://lore.kernel.org/r/20240229143838.45149-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: remove clear SB_INLINECRYPT flag in default_options
  Submitter: Yunlei He <heyunlei@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=838257
  Lore link: https://lore.kernel.org/r/20240326061043.1348968-1-heyunlei@oppo.com

Patch: [f2fs-dev] f2fs: write missing last sum blk of file pinning section
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=843019
  Lore link: https://lore.kernel.org/r/20240409233411.1197830-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: Prevent s_writer rw_sem count mismatch in f2fs_evict_inode
  Submitter: Yeongjin Gil <youngjin.gil@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=837217
  Lore link: https://lore.kernel.org/r/20240322041639.23144-1-youngjin.gil@samsung.com

Series: [f2fs-dev,1/3] f2fs: use folio_test_writeback
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=842987
  Lore link: https://lore.kernel.org/r/20240409203411.1885121-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: use folio_test_writeback

Patch: [f2fs-dev] f2fs: fix to detect inconsistent nat entry during truncation
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=837405
  Lore link: https://lore.kernel.org/r/20240322145955.2959257-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: multidev: fix to recognize valid zero block address
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=838736
  Lore link: https://lore.kernel.org/r/20240327074223.2216487-1-chao@kernel.org

Patch: None
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=843751
  Lore link: https://lore.kernel.org/r/20240411183753.2417792-1-daeho43@gmail.com

Patch: [f2fs-dev,V3] f2fs: add REQ_TIME time update for some user behaviors
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=836627
  Lore link: https://lore.kernel.org/r/1710915736-31823-1-git-send-email-zhiguo.niu@unisoc.com


Total patches: 18

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
