Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09BB199F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 03:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InbjEW53PglusP9mi70NmfOJKsx0e1DslLQE0juoVro=; b=bnODKi6e2Yd806jyNwulnNZUWF
	pAVv0aDw0pvs+CJeilW6BfT7zrEdwUrCq4AwK8pTxEQcy5g2uwto5fVeEVQ8bh4gbj8pliOIbNOKk
	qUb117jO2FdhIpwBkBx+fbw1A0GCBBTRjVt7OPg0BXFZTqsF8LLi++QXHkhRttNrizFw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uikFA-0006i3-Em;
	Mon, 04 Aug 2025 01:44:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uikF9-0006hx-LC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 01:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKWl2ukB64di52Q0Kml9nXHMl/yZJri/zLIz63+KGEM=; b=cB9+dIPaYUkg23P734ucWuk7YI
 7Sagwk8AOPJner7KX/DzV7BCEZPZP5tgCC8+vrzL11FC2IUP98u1R1xGvOHrtRcNWTqJzst6mGLAm
 UD2mC1JL8Io0aWg5o+ZG1plCs4KyANWWPLXsrMnQGCyiKLbr0s9CgrfNWfcm/0O2udA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GKWl2ukB64di52Q0Kml9nXHMl/yZJri/zLIz63+KGEM=; b=XNtsgmgb0zpDYdtPAFFo4zElCy
 Jzyy4M6F8gOoLtOmUy7s/DVU8Nbd1TmpHmXGlkhsPzKxD6PCJ0QZN7veCELtTyZlmD9Xy4TSbzhXz
 Eg/h13Pui+7xJPDzS1AtrwfneUzs/nbsl2SGYTRyfH+dzOZH4oruhjJHezG3dclpFKqg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uikF9-00076l-0s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 01:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AC4DC45C20;
 Mon,  4 Aug 2025 01:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877DAC4CEF9;
 Mon,  4 Aug 2025 01:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754271832;
 bh=Yi9KE/+A5RlPKQxaZwXXTeBQUPlphTVDzSCvxOglwRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IxX8r24+o3AAQxICqeLn67kyYtp5stNDeXndy2gwe8hv3HPSEdgoeIq/tLx+ycNko
 ol3WEE+jAdi2l2kQhLvVQjx3ReoWbuQdKEfCggelILjUtk/HateEuApnM+G/u/Dscw
 9A3y4ZT5RxEYwNh53CqPzZ4raFPQYpdvGNqt01XWD+S/7M2nFmU4+RJIiA77yRTR18
 Av2xmJheN6QbLIJlybAkHjq7GTff9UMwnSCl11+YWmL0eT1y9R7ydN7A+zTXqd+fmm
 AgRcMg1+I9GFWBtQnxFi+7kxuWt54x5ylpwmoFoOCu5m/mAeFfDT5Caa4iSOhEVSGy
 pAlnMWBEkHXvg==
To: jaegeuk@kernel.org
Date: Mon,  4 Aug 2025 09:43:39 +0800
Message-ID: <20250804014340.2537172-3-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804014340.2537172-1-chao@kernel.org>
References: <20250804014340.2537172-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  generic/091 may fail,
 then it bisects to the bad commit ba8dac350faf
 ("f2fs: fix to zero post-eof page"). What will cause generic/091 to fail
 is something like below Testcase #1: 1. write 16k as compressed blocks 2.
 truncate to 12k 3. truncate to 20k 4. verify data in range of [12k, 16k],
 however data is [...] 
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
X-Headers-End: 1uikF9-00076l-0s
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: fix to zero data after EOF for
 compressed file correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/091 may fail, then it bisects to the bad commit ba8dac350faf
("f2fs: fix to zero post-eof page").

What will cause generic/091 to fail is something like below Testcase #1:
1. write 16k as compressed blocks
2. truncate to 12k
3. truncate to 20k
4. verify data in range of [12k, 16k], however data is not zero as
expected

Script of Testcase #1
mkfs.f2fs -f -O extra_attr,compression /dev/vdb
mount -t f2fs -o compress_extension=* /dev/vdb /mnt/f2fs
dd if=/dev/zero of=/mnt/f2fs/file bs=12k count=1
dd if=/dev/random of=/mnt/f2fs/file bs=4k count=1 seek=3 conv=notrunc
sync
truncate -s $((12*1024)) /mnt/f2fs/file
truncate -s $((20*1024)) /mnt/f2fs/file
dd if=/mnt/f2fs/file of=/mnt/f2fs/data bs=4k count=1 skip=3
od /mnt/f2fs/data
umount /mnt/f2fs

Analisys:
in step 2), we will redirty all data pages from #0 to #3 in compressed
cluster, and zero page #3,
in step 3), f2fs_setattr() will call f2fs_zero_post_eof_page() to drop
all page cache post eof, includeing dirtied page #3,
in step 4) when we read data from page #3, it will decompressed cluster
and extra random data to page #3, finally, we hit the non-zeroed data
post eof.

However, the commit ba8dac350faf ("f2fs: fix to zero post-eof page") just
let the issue be reproduced easily, w/o the commit, it can reproduce this
bug w/ below Testcase #2:
1. write 16k as compressed blocks
2. truncate to 8k
3. truncate to 12k
4. truncate to 20k
5. verify data in range of [12k, 16k], however data is not zero as
expected

Script of Testcase #2
mkfs.f2fs -f -O extra_attr,compression /dev/vdb
mount -t f2fs -o compress_extension=* /dev/vdb /mnt/f2fs
dd if=/dev/zero of=/mnt/f2fs/file bs=12k count=1
dd if=/dev/random of=/mnt/f2fs/file bs=4k count=1 seek=3 conv=notrunc
sync
truncate -s $((8*1024)) /mnt/f2fs/file
truncate -s $((12*1024)) /mnt/f2fs/file
truncate -s $((20*1024)) /mnt/f2fs/file
echo 3 > /proc/sys/vm/drop_caches
dd if=/mnt/f2fs/file of=/mnt/f2fs/data bs=4k count=1 skip=3
od /mnt/f2fs/data
umount /mnt/f2fs

Anlysis:
in step 2), we will redirty all data pages from #0 to #3 in compressed
cluster, and zero page #2 and #3,
in step 3), we will truncate page #3 in page cache,
in step 4), expand file size,
in step 5), hit random data post eof w/ the same reason in Testcase #1.

Root Cause:
In f2fs_truncate_partial_cluster(), after we truncate partial data block
on compressed cluster, all pages in cluster including the one post eof
will be dirtied, after another tuncation, dirty page post eof will be
dropped, however on-disk compressed cluster is still valid, it includes
invalid data post eof, result in exposing previous data post eof while
reading.

Fix:
In f2fs_truncate_partial_cluster(), let change as below to fix:
- call filemap_write_and_wait_range() to flush dirty page
- call truncate_pagecache() to drop pages or zero partial page post eof
- call f2fs_do_truncate_blocks() to truncate non-compress cluster to
  last vali block

Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
Reported-by: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- should dirty & flush all pages in cluster and truncate blocks post eof
later
 fs/f2fs/compress.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e37a7ed801e5..6ad8d3bc6df7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1245,17 +1245,25 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	for (i = (1 << log_cluster_size) - 1; i >= 0; i--) {
 		struct folio *folio = page_folio(rpages[i]);
 		loff_t start = (loff_t)folio->index << PAGE_SHIFT;
+		loff_t offset = from > start ? from - start : 0;
 
-		if (from > start) {
-			folio_zero_segment(folio, from - start,
-					folio_size(folio));
+		folio_zero_segment(folio, offset, folio_size(folio));
+
+		if (from >= start)
 			break;
-		}
-		folio_zero_segment(folio, 0, folio_size(folio));
 	}
 
 	f2fs_compress_write_end(inode, fsdata, start_idx, true);
-	return 0;
+
+	err = filemap_write_and_wait_range(inode->i_mapping,
+			round_down(from, 1 << log_cluster_size << PAGE_SHIFT),
+			LLONG_MAX);
+	if (err)
+		return err;
+
+	truncate_pagecache(inode, from);
+
+	return f2fs_do_truncate_blocks(inode, round_up(from, PAGE_SIZE), lock);
 }
 
 static int f2fs_write_compressed_pages(struct compress_ctx *cc,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
