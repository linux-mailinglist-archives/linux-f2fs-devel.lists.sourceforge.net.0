Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584FBAAB1C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YRLSd+TalrA2ysk4/hOsQzzwVUnAFqAp05qH+oPNkQY=; b=Yvqa3CU9qL/LCw1O1iyO97AsEb
	+hZqWKCRv3j8Ye2Y4Rc8oqYYli4ym/uuRXS7NsAD+kAB34b63GmrxrDnmZinG0ft7VHokQV78uobo
	4PLZAV9/KWjjjpJffI4fMRpPY+laPzx81bMExO/5EVFqbSH6w2CM9TrJEw++1aCF69iU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOQ-0001nE-7d;
	Mon, 29 Sep 2025 22:30:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MOL-0001ms-UR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWKluNU5OfiUz0vnSuyTOoSzLNWM+oC37Fb7s5k97vM=; b=PYXvMvJc8E9fIqx+nYgQZ4Shwu
 SM8VDm1yU4zFV2S+uy2sh72lnOlfJNFYcO+Pg5VLRbY+D2bnTXZi3eYamuZu4+Yd0Wo8MP0rCbmHq
 Xyfds4gXAnfKYuXn4fFy2guLFIVAIgwKHcapFtM+ixGGIRWeE2lg7a5QncN2sKBGJDAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oWKluNU5OfiUz0vnSuyTOoSzLNWM+oC37Fb7s5k97vM=; b=H
 ginEEy7JVEqoyliLDp/liO440E4CM/QV1Vuh4r/BjyKUOD7znOhKKCb3Ge5O8foxuRII3xNzOAl52
 BZ6LsVpyxujKK8n6X7yBszVei6qkOmv9SYxFZIn8wRDjMIG+5Zjf+KO/ENYmNZIqM+Skys2jUQiBm
 gCoNYWDN6dCSJR7o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MOC-0005NM-Pf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F398E6024D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B41C4CEF4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185025;
 bh=24rPtY6wp+lSCpojuQ3GjDw4ZrdQV46ZhJcJOpa86pU=;
 h=Subject:From:Date:To:From;
 b=kdNKQK1+jKuDI3Pn26njm57QPZWZwimKLGsKUc7dd0QhbhsB7qot5Y7ZvTslClUWN
 kMdxxgkG67lNa2xr+hBrgyM0SQLcrCYJuXth6vxi8tK8P2CCHTVUsKyCcAXkkq2Eaa
 hnEwvjMBXs11h82XXN3hTGJi/voc7+1TOFBS+c5AoCWJVoyO/AtWTCvpriz7QzW+HL
 +dx/dh7SnHf/9Sci4LgUGk+UN2a24Yl47owwtbulfBFEGF5xTUY2F/y3fr+1sOzK7K
 jQr4i34px8476TmOqpbPPmoZv3o4pjYpPaRiNQoOAYV+4Q1EYMEQ9/jQa5X573qrtK
 K7kjuXxV4Plvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3767A39D0C1A for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918501887.1733438.6271931173287244119.git-patchwork-summary@kernel.org>
Date: Mon, 29 Sep 2025 22:30:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to avoid migrating empty section Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3MOC-0005NM-Pf
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

Patch: [f2fs-dev] f2fs: fix to avoid migrating empty section
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=997379
  Lore link: https://lore.kernel.org/r/20250901020416.2172182-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix wrong layout information on 16KB page
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1000228
  Lore link: https://lore.kernel.org/r/20250909002717.829981-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: merge FUA command with the existing writes
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=999001
  Lore link: https://lore.kernel.org/r/20250904181642.3879283-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: fix to truncate first page in error path of f2fs_truncate()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1000854
  Lore link: https://lore.kernel.org/r/20250910084024.1722790-1-chao@kernel.org

Patch: [f2fs-dev,v4] f2fs: readahead node blocks in F2FS_GET_BLOCK_PRECACHE mode
  Submitter: Yunji Kang <yunji0.kang@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1005532
  Lore link: https://lore.kernel.org/r/20250924074358.253759-1-yunji0.kang@samsung.com

Patch: [f2fs-dev,v2] f2fs: fix to mitigate overhead of f2fs_zero_post_eof_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1002741
  Lore link: https://lore.kernel.org/r/20250916024709.4062265-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to update map->m_next_extent correctly in f2fs_map_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1001693
  Lore link: https://lore.kernel.org/r/20250912081250.44383-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: avoid unnecessary folio_clear_uptodate() for cleanup
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=998059
  Lore link: https://lore.kernel.org/r/20250902122720.2750481-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: avoid unnecessary folio_clear_uptodate() for cleanup
             [f2fs-dev,2/2] f2fs: clean up error handing of f2fs_submit_page_read()

Patch: [f2fs-dev] f2fs: fix UAF issue in f2fs_merge_page_bio()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1006875
  Lore link: https://lore.kernel.org/r/20250928102422.300429-1-chao@kernel.org

Series: [f2fs-dev,v3,1/2] f2fs: fix zero-sized extent for precache extents
  Submitter: wangzijie <wangzijie1@honor.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1003152
  Lore link: https://lore.kernel.org/r/20250917023622.516052-1-wangzijie1@honor.com
    Patches: [f2fs-dev,v3,1/2] f2fs: fix zero-sized extent for precache extents
             [f2fs-dev,v3,2/2] f2fs: fix infinite loop in __insert_extent_tree()

Patch: [f2fs-dev] f2fs: add sanity check on ei.len in __update_extent_tree_range()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1002839
  Lore link: https://lore.kernel.org/r/20250916085243.4165099-1-chao@kernel.org


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
