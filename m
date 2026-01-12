Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF31D10440
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 02:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N2m0ODWpmplyK0P6nTTJOkzcpF1VWCPkj4KVOB8wwNw=; b=YAjDCdoEPaD5tYhwPiqi4yNOrf
	T8U+4YAw3lr2GLo2UUK8PyTBk3guX633cyUrGvkFerFs6t23E33rkZFp5h36SMqyodIcdsVOnJqLT
	3ifI1ni3mOPSPvawTieSPnp3ufpZVJl2sJ9qIBFhQngi1R2hR/I741WZ/T++zaz1ilWM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vf6oO-0006en-0p;
	Mon, 12 Jan 2026 01:33:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vf6oM-0006ee-6F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=InUwuKUw3f7ZFgAEZHOztyWmtAT26GBgG7bPotgHSkQ=; b=USpc+pWjKn64NumRWkJF1UoHsR
 XNUxQ+Rv/EpRAQxuEJ7Ac3jBdIEyk3aPeWnsyQFyY88muyDNSkHiNSRSCyTukW5DhDBmdObjx533B
 l9v6XOcAfwD5ZXrMbqhwHVF6P1rxX8MF5qogP4S9fSRsMKXVJXOx8LPMwUrdDSUktr7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=InUwuKUw3f7ZFgAEZHOztyWmtAT26GBgG7bPotgHSkQ=; b=A
 lEWGXs5I14XATLSxgxohMetijmyWJwOgWZGx18iBzH6U9QJHnYtdL92S1ESzKuW+VThk77/P5I96/
 UFBqKLCuCxECKMIJuwhOsNUlYq9vCrZxkx1mDJlanVOV37KRy1WGop5AsAiGYLbvKcAMG0CblDMJF
 x/n8YHjwchhEJCz0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vf6oM-00010q-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4BE360159
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jan 2026 01:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66444C4CEF7;
 Mon, 12 Jan 2026 01:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768181607;
 bh=mhuJOGzZrMJ/ECVDq/vAmVEkdec5v0izbjLsdSSnEI4=;
 h=From:To:Cc:Subject:Date:From;
 b=U25qqbWAoV5SLKoMJTVcYUMnXf2XNs+cpmaLIdrhehWjeXWpUn0+oqARjQDbl1qXO
 0kkS5q5apAG/s48HKs/UhKaCnz7aiDDk/mqCgJd2Hxxh/RD1HQz10mzHSCP/4BhI5A
 PNxTd6IDNtVZEWJ1aGC7kAE0nEZrC+gyRr6q3d92oF4eQvtBubLoBFURBuA+UYLD3d
 b+cQYgROftMmtIq0+f4aV8Qbys3faMH+6XKwCodJQA+OcwGrh8inezekfeUwRsXAmI
 hnzjAlj5Ax1gq2b8a3QEEH7OM83iJtafSS+ZIQL2BTzPhJUfz81KQjsyHOsKVZUCBz
 fxuhcP9+HvVOg==
To: jaegeuk@kernel.org
Date: Mon, 12 Jan 2026 09:33:20 +0800
Message-Id: <20260112013320.8028-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For consecutive large hole mapping across {d,id,did}nodes
 , we don't need to call f2fs_map_blocks() to check one hole block per one
 time, instead, we can use map.m_next_pgofs as a hint of next potenti [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vf6oM-00010q-E4
Subject: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for consecutive
 holes in readpages
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

For consecutive large hole mapping across {d,id,did}nodes , we don't
need to call f2fs_map_blocks() to check one hole block per one time,
instead, we can use map.m_next_pgofs as a hint of next potential valid
block, so that we can skip calling f2fs_map_blocks the range of
[cur_pgofs + 1, .m_next_pgofs).

1) regular case

touch /mnt/f2fs/file
truncate -s $((1024*1024*1024)) /mnt/f2fs/file
time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024

Before:
real    0m0.706s
user    0m0.000s
sys     0m0.706s

After:
real    0m0.620s
user    0m0.008s
sys     0m0.611s

2) large folio case

touch /mnt/f2fs/file
truncate -s $((1024*1024*1024)) /mnt/f2fs/file
f2fs_io setflags immutable /mnt/f2fs/file
sync
echo 3 > /proc/sys/vm/drop_caches
time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024

Before:
real    0m0.438s
user    0m0.004s
sys     0m0.433s

After:
real    0m0.368s
user    0m0.004s
sys     0m0.364s

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a2c4769d0ae1..5b0642cd27ff 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2176,10 +2176,13 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 	/*
 	 * Map blocks using the previous result first.
 	 */
-	if ((map->m_flags & F2FS_MAP_MAPPED) &&
-			block_in_file > map->m_lblk &&
+	if (map->m_flags & F2FS_MAP_MAPPED) {
+		if (block_in_file > map->m_lblk &&
 			block_in_file < (map->m_lblk + map->m_len))
+			goto got_it;
+	} else if (block_in_file < *map->m_next_pgofs) {
 		goto got_it;
+	}
 
 	/*
 	 * Then do more f2fs_map_blocks() calls until we are
@@ -2454,7 +2457,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
 	struct f2fs_map_blocks map = {0, };
-	pgoff_t index, offset;
+	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
 	unsigned nrpages;
@@ -2487,16 +2490,21 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		/*
 		 * Map blocks using the previous result first.
 		 */
-		if ((map.m_flags & F2FS_MAP_MAPPED) &&
-				index > map.m_lblk &&
+		if (map.m_flags & F2FS_MAP_MAPPED) {
+			if (index > map.m_lblk &&
 				index < (map.m_lblk + map.m_len))
+				goto got_it;
+		} else if (index < next_pgofs) {
+			/* hole case */
 			goto got_it;
+		}
 
 		/*
 		 * Then do more f2fs_map_blocks() calls until we are
 		 * done with this page.
 		 */
 		memset(&map, 0, sizeof(map));
+		map.m_next_pgofs = &next_pgofs;
 		map.m_seg_type = NO_CHECK_TYPE;
 		map.m_lblk = index;
 		map.m_len = max_nr_pages;
@@ -2617,6 +2625,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	pgoff_t nc_cluster_idx = NULL_CLUSTER;
 	pgoff_t index;
 #endif
+	pgoff_t next_pgofs = 0;
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	struct address_space *mapping = rac ? rac->mapping : folio->mapping;
 	unsigned max_nr_pages = nr_pages;
@@ -2637,7 +2646,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	map.m_lblk = 0;
 	map.m_len = 0;
 	map.m_flags = 0;
-	map.m_next_pgofs = NULL;
+	map.m_next_pgofs = &next_pgofs;
 	map.m_next_extent = NULL;
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
