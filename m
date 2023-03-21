Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0366C3722
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 17:40:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pef2I-0001P2-MX;
	Tue, 21 Mar 2023 16:40:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pef2H-0001Ot-Vp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+G+j4MuhMvIS8k8uJL4avdZfGwArslXuD+skiXvNaMM=; b=QSoPj+5s0LlmsEGl5bXIoRfflQ
 RGRaQWcHYW38QPBSq18TrzG0bnFkr3uFzkVJqERcsLT6XAgvtNwoRFubqf+9kNvZ0iF146voTVkIk
 0cMKZeZ9Zd9BNSKZmCNN/PWUJoTRdo/GX36JvleM9Sx3OugJ0vyNXp/VH6fegHF3hb+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+G+j4MuhMvIS8k8uJL4avdZfGwArslXuD+skiXvNaMM=; b=G
 QMvafcS6G9eGr/o4ZpUcF7JGzsiQSlUkpyXczcKGTDxTN0ildEvwpn20ha/53gyJcoRa/ORlWo/3k
 8F+mWm5JZTjAMuVvBqd/8uM90Phvt5O7v1QxcH62q3BlznnBb3i7nx2UFxxmSYjxJoxXpZs12PAVq
 FSFSP8fIc2Uw1fR8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pef2A-00FiIu-99 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 080A4B81330
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 16:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9EF0C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679416818;
 bh=ZGJgzSjAjp5fIZYt5oxZx1L35WCUG4PisRarmOB3mFM=;
 h=Subject:From:Date:To:From;
 b=af3c+fzK7WjByMf6bfciPiM/PUELI7JATNMICj88K/W+7x0qno09Rq9Td6u5OSdMg
 fh1QBtoqysKdyfNuYHQZPLdykHMy0PWwRtP4B/j6PukjkG1Sl6VSxSALGN1hHuawnk
 pXrhd7joaK75AV7hqu2iDU9x1qhwerzNBC/kbs2t4lQhrdIXv3zO9uI4HXmPgpS0Vg
 e7xtjiT1E1tMp/R90V+hrwkpvJYc0CMaOEYNBOoX6m9FavmE2vtr2yWIicNsIKPYvU
 Tm3ENC83VP8otQGXG+bLRhdgP9hbDAz28RMj1iEh5v1u0+K09QcL60ScMmx8aLZiBn
 5yjJI+/XplFsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ADCA6E52513 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167941681864.25004.6619306867640431372.git-patchwork-summary@kernel.org>
Date: Tue, 21 Mar 2023 16:40:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v1] f2fs: Fix
 discard bug on zoned block devices with 2MiB zone size Submitter: Yonggil
 Song <yonggil.song@samsung.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https:// [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pef2A-00FiIu-99
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

Patch: [f2fs-dev,v1] f2fs: Fix discard bug on zoned block devices with 2MiB zone size
  Submitter: Yonggil Song <yonggil.song@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=729378
  Lore link: https://lore.kernel.org/r/20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7

Series: [f2fs-dev,1/3] f2fs: factor out victim_entry usage from general rb_tree use
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=728892
  Lore link: https://lore.kernel.org/r/20230310210454.2350881-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: factor out victim_entry usage from general rb_tree use
             [f2fs-dev,3/3] f2fs: remove entire rb_entry sharing

Series: remove shared memory structures
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=729596
  Lore link: https://lore.kernel.org/r/20230313201216.924234-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: factor out victim_entry usage from general rb_tree use
             [f2fs-dev,2/3] f2fs: factor out discard_cmd usage from general rb_tree use
             [f2fs-dev,3/3] f2fs: remove entire rb_entry sharing

Patch: [f2fs-dev,v2] f2fs: convert to MAX_SBI_FLAG instead of 32 in stat_show()
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=727901
  Lore link: https://lore.kernel.org/r/20230308140623.35942-1-frank.li@vivo.com

Patch: [f2fs-dev] f2fs: fix to handle filemap_fdatawrite() error in f2fs_ioc_decompress_file/f2fs_ioc_compress_file
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=726046
  Lore link: https://lore.kernel.org/r/20230302095509.53720-1-frank.li@vivo.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
