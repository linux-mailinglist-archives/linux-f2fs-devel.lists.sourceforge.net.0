Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C6B1858B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Aug 2025 18:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k+U1kpzHRXGN0hrs6LKUYRwHZXWAkICL6bT2WCuKUpE=; b=Le1ZzeOXTk582kIs4lGvHEo6h+
	HONM1UiezqA4AKy53D905gitegff4BWLGiQOkEYgoMSBqALFtckB+8wUmQz/dOMUBmJ4BCiY5LNzq
	Rpz1GOfrMkqMUfKwwsIxrOlmVSGUsZdsayMCOPLHnZtEF/jn4ExwPlphwXlRJgFbzwio=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhsOO-0001zc-Bt;
	Fri, 01 Aug 2025 16:14:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uhsOL-0001zU-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 16:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yv03/No7G12gtqGDQHz3uJG72v5BBEeK7AW29VX8dVw=; b=Ya/958xLeGUIiTZVtEbW6xSRaZ
 zVP1MWt7FQjv2iJBZI8mI6gI8QWResnkIP1cOmmoVvNn9MoDvOf0vPAAdRmrMrzulVc1ElKp3+Hpd
 /ePYVOVFI2bDDCYrL59JcQlLLtQqj+C+8rKp3faf7ZOOXOS3pny1HM4r7rWQWuJersBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yv03/No7G12gtqGDQHz3uJG72v5BBEeK7AW29VX8dVw=; b=H
 s0/TRZAp7XLy7ZnxSgfAm5Igv44q3qbiQ/Z0eb9645Qr5t4Lf5xzRwWRLX9vxR/zaK/4c5BfguHFp
 4bB3fGd0b/uucwhgpTfI46mG7S1Jjo2n64O6h7EB/oyopSGVgc3Tya6K8M79/1bAfwSC3vicUJaIu
 b25WjfGD0KWH1uE0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhsOL-0003bW-D2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 16:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2DB0A4F3F6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  1 Aug 2025 16:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5948CC4CEE7;
 Fri,  1 Aug 2025 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754064826;
 bh=8UvHbpx9Xm6WVKsiyRHD+loNlMpUrGq5xiaWzvafIAE=;
 h=From:To:Cc:Subject:Date:From;
 b=sVA+pyb5dE941lGWMEohj3Q4dIpy2/r5tcDEoCHHo7ciI4+knYfKvbLXnHqegTuuk
 ol1xSpTo2EyxPd6gjoiMAIuVmbd8ySd0YJDzPGEE+dkgGsZJPz65X83+F/cSQOLnLA
 cwjshLO8UIRML3OMPqwqAPwhAulrEVBK0WbMbl50RUW0YdAIXR5XEMBi+t/TflhD5N
 RWokFlIwttz6j/DtQEpazDHUfQLglhSfRWbPlKBH3rcwFN4/oeQakeZC+KA1Zghf+u
 Ngt2k2X1rzQG9x38578M2z9aIiCjODct+y0mf3gzqBYeFE/zDQlsRppH66PO8RxqHA
 iiX3QOb4vuxJg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 Aug 2025 16:13:40 +0000
Message-ID: <20250801161341.396038-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: external/f2fs-tools/mkfs/f2fs_format.c:392:31: error: format
 specifies type 'unsigned long long' but the argument has type 'size_t' (aka
 'unsigned int') [-Werror,-Wformat] 391 | MSG(1, "\tError: Unali [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uhsOL-0003bW-D2
Subject: [f2fs-dev] [PATCH] Fix build error in Android
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

external/f2fs-tools/mkfs/f2fs_format.c:392:31: error: format specifies type 'unsigned long long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
  391 |                         MSG(1, "\tError: Unaligned segment0 start (%u) for zoned LU (zone_blocks: %"PRIu64")\n",
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  392 |                                 get_sb(segment0_blkaddr), c.zone_blocks);
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
external/f2fs-tools/include/f2fs_fs.h:289:18: note: expanded from macro 'MSG'
  289 |                         printf(fmt, ##__VA_ARGS__);                     \
      |                                ~~~    ^~~~~~~~~~~
external/f2fs-tools/mkfs/f2fs_format.c:404:31: error: format specifies type 'unsigned long long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
  402 |                         MSG(1, "\tError: Unaligned start (%"PRIu64") for zoned LU from segment0 (%u) (zone_blocks: %"PRIu64")\n",
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  403 |                                 c.devices[1].start_blkaddr,
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  404 |                                 get_sb(segment0_blkaddr), c.zone_blocks);
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
external/f2fs-tools/include/f2fs_fs.h:289:18: note: expanded from macro 'MSG'
  289 |                         printf(fmt, ##__VA_ARGS__);                     \
      |                                ~~~    ^~~~~~~~~~~

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 7e8bdccf2241..b98976c6ffa8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -389,7 +389,8 @@ static int f2fs_prepare_super_block(void)
 			 * aligned at the zone.
 			 */
 			MSG(1, "\tError: Unaligned segment0 start (%u) for zoned LU (zone_blocks: %"PRIu64")\n",
-				get_sb(segment0_blkaddr), c.zone_blocks);
+				get_sb(segment0_blkaddr),
+				(uint64_t)c.zone_blocks);
 			return -1;
 		} else if (c.ndevs > 1 &&
 			(c.devices[1].start_blkaddr - get_sb(segment0_blkaddr)) % c.zone_blocks) {
@@ -401,7 +402,8 @@ static int f2fs_prepare_super_block(void)
 			 */
 			MSG(1, "\tError: Unaligned start (%"PRIu64") for zoned LU from segment0 (%u) (zone_blocks: %"PRIu64")\n",
 				c.devices[1].start_blkaddr,
-				get_sb(segment0_blkaddr), c.zone_blocks);
+				get_sb(segment0_blkaddr),
+				(uint64_t)c.zone_blocks);
 			return -1;
 		}
 	}
-- 
2.50.1.565.gc32cd1483b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
