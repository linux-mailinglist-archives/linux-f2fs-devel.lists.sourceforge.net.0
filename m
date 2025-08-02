Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB47B18A65
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Aug 2025 04:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScWYyIR6C9uKPm1abRtGmkyiRhKLYy5G1V3j0Fxu8xc=; b=d6UdTPZssBgpNqH3PZcL5b6iY+
	SEPCWrcJJQ/fxbr8QveN33vmItC5mnbVsfpMTYE/3TKWYsLfaO4U8fGxTLxpU9Rk0dUqgvQi7uNc8
	47CuT3l0zp4Azka7YCahxDFWI5JmpwjukqgtAPRQdA9IJEkaHCRwK8jDD5ILZtMGaq+c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ui1pg-0002Ko-W5;
	Sat, 02 Aug 2025 02:18:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ui1pg-0002Ki-3D
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Aug 2025 02:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nwqifph40ujW7fCSBC6xgU3SRyxvYBoF3r1vIU5ye7Y=; b=lW2IeE2JWfCaFjHcu8vjReXE3X
 iy00UXWj49ZSE85nDtwYUPVkwx+/fl3wQg+kcRh103ukkGw9JmKGW4qvCKDNtJci5t45HTCGvc6OO
 1cGNWFYokha7oZtOmnTxoUFxr2k2GqcViQNcNkcgxBz7m/p66ijWjE1kyVT6KS8Jje8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nwqifph40ujW7fCSBC6xgU3SRyxvYBoF3r1vIU5ye7Y=; b=dq+gHy4l+zbhsjYK47lG7nQ6fX
 1mL++3iV3fQdve8K5Sf5GyyMaTZHBpl7xymtC7DQZVVwtpNi5FhzwtYA20Iy5LUHrY/7I4+Nxw0sX
 FffSkuTmLwVSGifyHNZ54t80cLxQol9NXDPEl3RF8CvaNgO3OEKVXy7FUL5ZpG8u2ITA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ui1pf-00039e-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Aug 2025 02:18:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F61E45C53;
 Sat,  2 Aug 2025 02:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3137C4CEF9;
 Sat,  2 Aug 2025 02:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754101122;
 bh=+G3TPsT84hENM48wb5T4JMxURRdU/RnRJbW0ImSt1Uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DkuvWOCimkxwhAdrBkpkkmb8uFLMX+Vnd/Jsl5mUFaNvhnAMy3WSVDsxW9P0rxjlj
 dHLYGIcgtSX5OoTCC0Gc3Iiwb+WDnJbvgCjFBS/aG914RsfsGYU7osVLs6zu/OQlmT
 eSHmAaEuqrBh0IfY9r94+o1/3rqHFAgEZcF0UzKO0KmO9lN4m0fqD3PILqgeXXcvMw
 f8qHlOzH1aUkdwG5hmeHD9NBnyQEqjwxoWi911NcfOvIQtOdI1vNDvJvlg8LsCbSf1
 BRQs7VH0lYAbOFbTrajr2U+fL3oItq3epOhDfi5/F9qyYURufANLo0hKfFN+Cc1H/L
 nMofofoq+O/BQ==
To: jaegeuk@kernel.org
Date: Sat,  2 Aug 2025 10:18:32 +0800
Message-ID: <20250802021832.1882302-3-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250802021832.1882302-1-chao@kernel.org>
References: <20250802021832.1882302-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Yu <chaseyu@google.com> generic/091 may fail, then
 it bisects to the bad commit ba8dac350faf ("f2fs: fix to zero post-eof page").
 What will cause generic/091 to fail is something like below Testcase #1:
 1. write 16k as compressed blocks 2. truncate to 12k 3. truncate to 20k 4.
 verify data in range of [12k, 16k], however data is [...] 
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
X-Headers-End: 1ui1pf-00039e-Ha
Subject: [f2fs-dev] [PATCH 3/3] f2fs: fix to zero data after EOF for
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
Cc: Chao Yu <chaseyu@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chaseyu@google.com>

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
- don't dirty pages post eof
- call filemap_write_and_wait_range() to flush page
- call truncate_pagecache() to drop pages or zero partial page post eof

Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
Reported-by: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e37a7ed801e5..e029c8109b24 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1245,16 +1245,29 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	for (i = (1 << log_cluster_size) - 1; i >= 0; i--) {
 		struct folio *folio = page_folio(rpages[i]);
 		loff_t start = (loff_t)folio->index << PAGE_SHIFT;
+		loff_t offset = from > start ? from - start : 0;
 
-		if (from > start) {
-			folio_zero_segment(folio, from - start,
-					folio_size(folio));
-			break;
+		folio_zero_segment(folio, offset, folio_size(folio));
+
+		/* for folios post EOF, just drop them instead of redirty them */
+		if (from <= start) {
+			f2fs_folio_put(folio, true);
+			rpages[i] = NULL;
 		}
-		folio_zero_segment(folio, 0, folio_size(folio));
+
+		if (from >= start)
+			break;
 	}
 
 	f2fs_compress_write_end(inode, fsdata, start_idx, true);
+
+	err = filemap_write_and_wait_range(inode->i_mapping,
+			round_down(from, 1 << log_cluster_size << PAGE_SHIFT),
+			LLONG_MAX);
+	if (err)
+		return err;
+
+	truncate_pagecache(inode, from);
 	return 0;
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
