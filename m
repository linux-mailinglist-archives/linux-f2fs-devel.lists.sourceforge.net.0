Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF907BC5BA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 09:46:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qp21C-000382-Ss;
	Sat, 07 Oct 2023 07:46:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qp21B-00037v-8g
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 07:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zYa7LO8/Wh38Nb3C+f7kcpPnWxwJd6t+/Ec+JvinqRI=; b=TbAyUGix9VupND/15NULxnGkAa
 ZYevk3XlUOSI4jXzTiAG8rDpRq3zVvLMaP63MVT0Dpq9QDv1SWTVE+2BZ3OSmlrEtfIANOGR4/f9d
 cBTMOrpgG9TaG8IQ2YeEONEXYb09S9k1MwqD/Zkkx6Elv+jaqIdw+Hwmbtui9Hr+4ajQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zYa7LO8/Wh38Nb3C+f7kcpPnWxwJd6t+/Ec+JvinqRI=; b=H
 vxccPaIha4EB8DAaAzdY9vS/rqbACDz3QuGkln6XPQN8Fi7rgljOoIu8jSgTWaZ5/eZSkwPjBaKfd
 vi79fRi6ataLnyPKW//bEtLi0XPJrbE7sGtCraTmzYoy1mRD/h/LxxXBCwYyDe5bukYR3DjxxCIA4
 4sCYueY1C5dZU+yQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qp218-00562L-3O for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 07:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45636CE092F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Oct 2023 07:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49ABCC433C8;
 Sat,  7 Oct 2023 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696664782;
 bh=7rTaaOwJ2XLjmWgatV7u/BoCzFYYD2I7Tous8LEzDnw=;
 h=From:To:Cc:Subject:Date:From;
 b=jBA2dmFZkbBvFOg+3XCyntOekKurJ/TwSib6bXG5qcMhfJfFQ/Cn6w+piTYwnUxzd
 FaDfts0ZBNFSl2LqCRKAYIXB2CeR80MhrYThSsysifOnpn/zJEoBIuo0hqL/w/GAVM
 rbyxQIFDsXWq5LpC9XSWWCyPXR2sNN4uiTRIlK8kmdLttHUyZSwvkXlxifTvElyElR
 XA56wfJyxPbBbm4GZTwhLpef1irgERmSRZTWx3YNt8jP2byRFz7NAnchRTx9PveyiD
 0xkL/5GvH/tRBM3IMRzpQicllWWe/lrNw42G8QqVXq/BQzCcrfhz7LkeQaNFguUOV+
 k6ASXtzDyE/Cw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat,  7 Oct 2023 15:45:52 +0800
Message-Id: <20231007074552.3170496-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 it may print random physical block address in tracepoint
 of f2fs_map_blocks() as below: f2fs_map_blocks: dev = (253,16), ino = 2297,
 file offset = 0, start blkaddr = 0xa356c421, len = 0x0, flags = 0 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qp218-00562L-3O
Subject: [f2fs-dev] [PATCH] f2fs: fix to initialize map.m_pblk in
 f2fs_precache_extents()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, it may print random physical block address in tracepoint
of f2fs_map_blocks() as below:

f2fs_map_blocks: dev = (253,16), ino = 2297, file offset = 0, start blkaddr = 0xa356c421, len = 0x0, flags = 0

Fixes: c4020b2da4c9 ("f2fs: support F2FS_IOC_PRECACHE_EXTENTS")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5d726cbc4f0b..cfb199f9af0d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3261,6 +3261,7 @@ int f2fs_precache_extents(struct inode *inode)
 		return -EOPNOTSUPP;
 
 	map.m_lblk = 0;
+	map.m_pblk = 0;
 	map.m_next_pgofs = NULL;
 	map.m_next_extent = &m_next_extent;
 	map.m_seg_type = NO_CHECK_TYPE;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
