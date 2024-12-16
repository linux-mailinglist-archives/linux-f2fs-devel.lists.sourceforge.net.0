Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B79F3642
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 17:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNE95-0000vC-Ki;
	Mon, 16 Dec 2024 16:40:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tNE91-0000v2-0a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yrd1e+xKhdqPKoGCCh7bHkxv/8IVPUQAN31vMdi9Qlg=; b=j+XibTG8Zv0+CQnwh5ytCo36xG
 TD3JwQNsL6QFt6WTy0kkx87mOG92kBSZA5AtyvHT/FS/gLhELRR2g/HL9Fa11Dk3ih74Tw3CuAh4C
 SaU4KyQ9pkl0Gl4t1GfohqT43nwGdavTObrqCXN7HI29rDWxywZ5jou1zBiwUETWYVxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yrd1e+xKhdqPKoGCCh7bHkxv/8IVPUQAN31vMdi9Qlg=; b=B
 +nVWEW2RTto282Qqr9vlo2dZLNoK/dLoJtLKR9I1tllpBAMueLv6wk1SHR8/JlUDM0PR6zhMFdsu9
 7nFsMGxRryqyYsLF55cFeM+C3k2vbV2i34BbiSE8FmxBaKWz9bv0M4+5waC66VB+QIRKwu6o4ML3o
 vITluPA8VSjr3G3w=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNE90-0000sQ-BU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D650BA418A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Dec 2024 16:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EBAC4CED0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Dec 2024 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734367219;
 bh=/3R7pExnIrxzd+JWm79iC8xusEKTEFsBi+qveIMRTWs=;
 h=Subject:From:Date:To:From;
 b=SVhncxu+xvfsU7yLwWpyUwu9aknv36tPiNJFOhtpXtkiloremS+h4ohEP3r7z8i4L
 IhCSfbufDtuqu3hyCR4Hz2TunHjsYPXiecqaY56uDnU7wGWOxyWUscjfA+UUc7KbmY
 NkKo0OPcp0taDRTIbcWr/2RFKaQ4VfzvUoBmh0Ya7Cu6iuB92rtEqqci8vevUhBxby
 Nfw2dXpn8qr/rLRqwJWITnrak+DQEnWIxSD8z9RUZR4E3kZJIvyZFfyD05U+m0fym7
 za/UqfNzhMMGE4nPgSn+Eb3dnDJFZSQeNwYaCyVSFZnCVwXYkMXclS6Pe64OX0ZuKy
 ol8H387XlQpAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 754B73806656 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Dec 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173436723607.272389.12287193959041888192.git-patchwork-summary@kernel.org>
Date: Mon, 16 Dec 2024 16:40:36 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: f2fs folio patches
 Submitter:
 Matthew Wilcox (Oracle) <willy@infradead.org> Committer: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=912990
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tNE90-0000sQ-BU
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

Series: f2fs folio patches
  Submitter: Matthew Wilcox (Oracle) <willy@infradead.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=912990
  Lore link: https://lore.kernel.org/r/20241128045828.527559-1-willy@infradead.org
    Patches: [f2fs-dev,01/11] f2fs: Use a folio in f2fs_all_cluster_page_ready()
             [f2fs-dev,02/11] f2fs: Use a folio in f2fs_compress_write_end()
             [f2fs-dev,03/11] f2fs: Use a folio in f2fs_truncate_partial_cluster()
             [f2fs-dev,04/11] f2fs: Use a folio in f2fs_write_compressed_pages()
             [f2fs-dev,05/11] f2fs: Convert submit tracepoints to take a folio
             [f2fs-dev,06/11] f2fs: Add F2FS_F_SB()
             [f2fs-dev,07/11] f2fs: Convert f2fs_finish_read_bio() to use folios
             [f2fs-dev,08/11] f2fs: Use a folio more in f2fs_submit_page_bio()
             [f2fs-dev,09/11] f2fs: Use a data folio in f2fs_submit_page_bio()
             [f2fs-dev,10/11] f2fs: Convert __read_io_type() to take a folio
             [f2fs-dev,11/11] f2fs: Remove calls to folio_file_mapping()

Patch: [f2fs-dev,v2] f2fs: ensure that node info flags are always initialized
  Submitter: Dmitry Antipov <dmantipov@yandex.ru>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=917328
  Lore link: https://lore.kernel.org/r/20241212175748.1750854-1-dmantipov@yandex.ru

Patch: [f2fs-dev,V2] f2fs: The GC triggered by ioctl also needs to mark the segno as victim
  Submitter: Yongpeng Yang <yangyongpeng1@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=914401
  Lore link: https://lore.kernel.org/r/20241204033113.4133027-1-yangyongpeng1@oppo.com


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
