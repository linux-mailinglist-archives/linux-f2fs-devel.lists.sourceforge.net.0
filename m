Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A1813BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 21:50:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDsfK-00054r-MO;
	Thu, 14 Dec 2023 20:50:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rDsfJ-00054k-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8JdcgVqvVwxw2iJ5QIx6cgamsiApy3UqCCFHJgq0iRA=; b=QN4aynKyXmGcTPfPgnRIcPii4l
 rbXej/QhjDMYzyKmxEBwwaTZ2q/d0q0ImNTgTRKJ8Aj+WQgjy0OQnKKra5UNLvBjZJhm7R4zDmTWT
 tauboAExwMaz4XYq+3qxzkgoqLjTo15zJEUSVDIvpUMWL8Jlwwlj+Mwp8z4BVCG+6Lt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8JdcgVqvVwxw2iJ5QIx6cgamsiApy3UqCCFHJgq0iRA=; b=X
 ra8v9uRhquvXjbG0/hFB3ga14+lqO56cJez/uPbRUZS4AcyRguy8vhDmpT9pPHLmwAKSH0ST1RSp3
 qnLc+lue9e+7OZbCahMR68YclfTkMVU6DH2D+QWekMSE9QUdjAomF44emu6MRd97/YnRR3nvk+XC2
 kBh8LucCBhHUze3I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDsfI-0000k0-KA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A5F03B8243E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 060BFC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702587032;
 bh=51ATBR4oVlLKze1OtgF+rDFH2N3bqnvhC7keOw6znrc=;
 h=Subject:From:Date:To:From;
 b=ChyWl8tKpuUI5RRp6KzfjfXZPL5WwZwhj4ECFRibLEQfa5ZiGQEiXxA3VPoTfaNsf
 0prFnt4iJb0+RtUUGIulFr4/CBj4AT65ZtSGUMDmaVbwfqJ5AT6rzbLLXttMSWaLjS
 WL3iQvjimXFjkzi1LLQLnO2mt0sqkWfCUHDS81SYTMa6iE+VtIyK6E69RiuNE5zlar
 QyIpSVTvV5oHKDk7HENNsyhITWaOh1KIRlzXAreQ/Cey1dMWtMRALrt4X4Ox+XH8g1
 n9/spcfRw00A3mwKLnK5KMrDgjtojxgDcyv8U2PPKJnY5tphnsibWA5k5/C6lINKTM
 4yByCMAbZiFPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E0280DD4EFA for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Dec 2023 20:50:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170258703186.30587.5932043255553793854.git-patchwork-summary@kernel.org>
Date: Thu, 14 Dec 2023 20:50:31 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/6] f2fs:
 fix to tag gcing flag on page during block migration Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.o [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDsfI-0000k0-KA
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

Series: [f2fs-dev,1/6] f2fs: fix to tag gcing flag on page during block migration
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=808552
  Lore link: https://lore.kernel.org/r/20231210113547.3412782-1-chao@kernel.org
    Patches: [f2fs-dev,1/6] f2fs: fix to tag gcing flag on page during block migration
             [f2fs-dev,2/6] f2fs: fix to wait on block writeback for post_read case
             [f2fs-dev,3/6] f2fs: fix to check compress file in f2fs_move_file_range()
             [f2fs-dev,6/6] f2fs: fix to update iostat correctly in f2fs_filemap_fault()

Series: [f2fs-dev,1/6] f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=808545
  Lore link: https://lore.kernel.org/r/20231210092040.3374741-1-chao@kernel.org
    Patches: [f2fs-dev,1/6] f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
             [f2fs-dev,2/6] f2fs: delete obsolete FI_DROP_CACHE
             [f2fs-dev,3/6] f2fs: introduce get_dnode_addr() to clean up codes
             [f2fs-dev,4/6] f2fs: update blkaddr in __set_data_blkaddr() for cleanup
             [f2fs-dev,5/6] f2fs: introduce f2fs_invalidate_internal_cache() for cleanup
             [f2fs-dev,6/6] f2fs: add tracepoint for f2fs_vm_page_mkwrite()

Patch: [f2fs-dev,v3] f2fs: Restrict max filesize for 16K f2fs
  Submitter: Daniel Rosenberg <drosen@google.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=806865
  Lore link: https://lore.kernel.org/r/20231205023801.3669458-1-drosen@google.com

Series: [f2fs-dev,1/4] f2fs: allocate new section if it's not new
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=806738
  Lore link: https://lore.kernel.org/r/20231204180428.925779-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: allocate new section if it's not new
             [f2fs-dev,2/4] f2fs: fix write pointers on zoned device after roll forward
             [f2fs-dev,3/4] f2fs: check write pointers when checkpoint=disable

Patch: [f2fs-dev] f2fs: allow checkpoint=disable for zoned block device
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=806143
  Lore link: https://lore.kernel.org/r/20231201230257.238513-1-jaegeuk@kernel.org

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=808987
  Lore link: https://lore.kernel.org/r/20231212010120.252763-1-chao@kernel.org


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
