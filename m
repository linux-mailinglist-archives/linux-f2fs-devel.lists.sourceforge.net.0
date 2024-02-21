Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 718FC85E53E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 19:10:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcr3O-0007V2-7y;
	Wed, 21 Feb 2024 18:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rcr3M-0007Ut-F1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zm+5eHJsNK1HTZxWyBg/4lzsS4Yx5kqf6wgqZEtC/sQ=; b=Nu+5VyOVtFEImw9NES7G7bTpjT
 F9b+G21EeDwKfHrrl6krYKxUGjjFcHlKIFq2kago7h6MBOiWHMa5baBer+P5md35bQDSHrT5b17gJ
 joeyiRsuzJey0PJYXLGg6bQ3M9Oa7Wbl1JuZgzCmQtaMrpzVENbTWz8dUZIjJrn3Q01A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zm+5eHJsNK1HTZxWyBg/4lzsS4Yx5kqf6wgqZEtC/sQ=; b=D
 R4P6VgWi+Duy9MfCt+yuR9nbA2yDap7FOERn85XuAoNrHEzPeqqnE9u/+5uNKGV5aVAwp8AOTV98G
 98ETvrzYg3/KSkwLw/fS77TDnGR8m3QI4BUjtG4EoKIRMHYyokGFGDRzW+90SfBMjtehlzEnyizU3
 o4/aqZuZgJzjCc54=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcr3K-0001SC-0u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 18:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9C3ECE13D9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 18:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2820C433F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708539030;
 bh=p1RcsB0BN5gZsTkG1N34rOXnjhZLuI/Ny7v2/3s7Qhc=;
 h=Subject:From:Date:To:From;
 b=TrLtwL9YexkzFMW6/fL48uMhzidX5sQPdvpY+Ty2oUvj83nTLujRga4Sjo0hg1NQe
 SmkNKF1DeeARjuBfLHUgawyawgaOHISCcI/Tok34yQHb3YcEbh7323TL4DY+qagpny
 gMW4mVOENUsqPX9gCClx3UhLsdo7l62fRwM/ufQkHNXJ76LBfXKJP5qKW/VLBe9ijg
 u+rrJr+Ru/e5Wv16v6WZIIN1vaDv8VTpVEllPsUFE870kbiIQEWoGj3elEP3WVNX8X
 0ByYQa1rW1S3P8RrPwuYotP/Eyes9hJyopgiu0DUPV3c+BIuNFak9NXi1iQHWaAy/S
 W6ueY6Gl3Qm6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C6E81C00446 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 18:10:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170853903073.7043.17513314029025633276.git-patchwork-summary@kernel.org>
Date: Wed, 21 Feb 2024 18:10:30 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,
 v2] f2fs: introduce
 get_available_block_count() for cleanup Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/pr [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcr3K-0001SC-0u
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

Patch: [f2fs-dev,v2] f2fs: introduce get_available_block_count() for cleanup
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=827670
  Lore link: https://lore.kernel.org/r/20240220031515.4039498-1-chao@kernel.org

Series: f2fs: fix panic issue in small capacity device
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=823790
  Lore link: https://lore.kernel.org/r/1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com
    Patches: [f2fs-dev,v2,1/4] f2fs: correct counting methods of free_segments in __set_inuse
             [f2fs-dev,v2,2/4] f2fs: fix panic issue in update_sit_entry

Series: [f2fs-dev,v3,1/2] f2fs: separate f2fs_gc_range() to use GC for a range
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=825737
  Lore link: https://lore.kernel.org/r/20240213173812.1432663-1-daeho43@gmail.com
    Patches: [f2fs-dev,v3,1/2] f2fs: separate f2fs_gc_range() to use GC for a range
             [f2fs-dev,v3,2/2] f2fs: support file pinning for zoned devices

Patch: [f2fs-dev] f2fs: support SEEK_DATA and SEEK_HOLE for compression files
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=826570
  Lore link: https://lore.kernel.org/r/20240215201633.2365333-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: doc: Fix bouncing email address for Sahitya Tummala
  Submitter: Jeffrey Hugo <quic_jhugo@quicinc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=822605
  Lore link: https://lore.kernel.org/r/20240202165208.4091800-1-quic_jhugo@quicinc.com

Patch: [f2fs-dev,Patch-next] f2fs: Use folio in f2fs_read_merkle_tree_page
  Submitter: Huang Xiaojia <huangxiaojia2@huawei.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=821995
  Lore link: https://lore.kernel.org/r/20240201073858.104773-1-huangxiaojia2@huawei.com

Series: [f2fs-dev,1/3] f2fs: deprecate io_bits
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=823779
  Lore link: https://lore.kernel.org/r/20240207005105.3744811-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: deprecate io_bits

Patch: [f2fs-dev] f2fs: fix to create selinux label during whiteout initialization
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=823844
  Lore link: https://lore.kernel.org/r/20240207070548.3095087-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: compress: fix to check zstd compress level correctly in mount option
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=825261
  Lore link: https://lore.kernel.org/r/20240212160818.1020903-1-chao@kernel.org


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
