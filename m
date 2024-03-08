Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2B875BD1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Mar 2024 02:09:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1riOjM-0008S9-Bp;
	Fri, 08 Mar 2024 01:09:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1riOjL-0008S3-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 01:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+3pHV4jAtT0qNESwDF0fiEBp2U2dHxSD+znHWkAZTY=; b=UQrb8r2pJJ15x3zdAkOuxZckQJ
 0/gbypr5HeUCzjUJMmCIeyIuq9U7m7nUBKIsahQWVo4XanBcmeIYQ5GAxdtJin7QpsV3C7dWMZfr7
 gpeVN2bG2dtS5NnDs7HzP7SO5AzpBmh0e/g1Af+2Iz8GkGYY/rx2kun3sIFm+U+mGbp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z+3pHV4jAtT0qNESwDF0fiEBp2U2dHxSD+znHWkAZTY=; b=U
 hthyaNwp+DCDFT86U/z1sYJmgHr3QogKjLxGOtwngkDRttrx3abjmZ1+k6qViQKmLW2JsptfMGcOn
 2CDqbKhdGoCYeVcQteC0N3vGsgaGoYfR7VxYEigDDnbK99MLLWv1nJAlyiclEvelhkBupRlaYeJgd
 yZffQZJi6oi2/T1U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1riOjB-0005Sc-0F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 01:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3631DCE2745
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Mar 2024 01:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC6CC433C7;
 Fri,  8 Mar 2024 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709860122;
 bh=/5W1ItLMiLDBcxiqWbCKid+EHj6ZdkuzqaV/WRK8wUg=;
 h=From:To:Cc:Subject:Date:From;
 b=UQxZ1rYG46lk1o72JjSJjBgutl5LLwRrw3/HcbSTeyiHTP2qiSXlA47F/hWyk3hBV
 hs1p3MhmhXRy33gi3FnbQ/SrcsKBLGdrQQjO+yiHnmsD3vpsHJ0K2c4CfT3AuyeZRU
 n2ug3YXHT+Ydq7YhIZGZ/QaEkPP2Nk+p1TeM1OZ3RBoS5rF9J7SeWzMZeA1LpZYE2h
 XVA6XXsa0yzA0oYGEj4wS186pWs8YcKmRxHcWi/z0BPYXgDu0YrC1RN5mmrpQMm7Jz
 3u01N9b3mzPuawrCPQS1A8FDkCyuGZcdTXZu86f22+8F/0QW2zur4em35VnHqdZvK1
 YDD6RQ4B/DlLw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  8 Mar 2024 09:08:34 +0800
Message-Id: <20240308010834.4023772-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Below race case can cause data corruption: Thread A GC thread
 - gc_data_segment - ra_data_block - locked meta_inode page -
 f2fs_inplace_write_data
 - invalidate_mapping_pages : fail to invalidate meta_inode page due to lock
 failure or dirty|wri [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1riOjB-0005Sc-0F
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to truncate meta inode pages forcely
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

Below race case can cause data corruption:

Thread A				GC thread
					- gc_data_segment
					 - ra_data_block
					  - locked meta_inode page
- f2fs_inplace_write_data
 - invalidate_mapping_pages
 : fail to invalidate meta_inode page
   due to lock failure or dirty|writeback
   status
 - f2fs_submit_page_bio
 : write last dirty data to old blkaddr
					 - move_data_block
					  - load old data from meta_inode page
					  - f2fs_submit_page_write
					  : write old data to new blkaddr

Because invalidate_mapping_pages() will skip invalidating page which
has unclear status including locked, dirty, writeback and so on, so
we need to use truncate_inode_pages_range() instead of
invalidate_mapping_pages() to make sure meta_inode page will be dropped.

Fixes: 6aa58d8ad20a ("f2fs: readahead encrypted block during GC")
Fixes: e3b49ea36802 ("f2fs: invalidate META_MAPPING before IPU/DIO write")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix race condition description.
 fs/f2fs/checkpoint.c    |  5 +++--
 fs/f2fs/f2fs.h          | 28 +++++++++++++++++++++++++++-
 fs/f2fs/segment.c       |  5 ++---
 include/linux/f2fs_fs.h |  1 +
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a09a9609e228..55b7d2cf030f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1598,8 +1598,9 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 */
 	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi) ||
 		f2fs_sb_has_compression(sbi))
-		invalidate_mapping_pages(META_MAPPING(sbi),
-				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1);
+		f2fs_bug_on(sbi,
+			invalidate_inode_pages2_range(META_MAPPING(sbi),
+				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1));
 
 	f2fs_release_ino_entry(sbi, false);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4836e7cb0efe..9814e5981a6a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4655,10 +4655,36 @@ static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
 	return f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
 }
 
+static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
+					block_t blkaddr, unsigned int cnt)
+{
+	bool need_submit = false;
+	int i = 0;
+
+	do {
+		struct page *page;
+
+		page = find_get_page(META_MAPPING(sbi), blkaddr + i);
+		if (page) {
+			if (PageWriteback(page))
+				need_submit = true;
+			f2fs_put_page(page, 0);
+		}
+	} while (++i < cnt && !need_submit);
+
+	if (need_submit)
+		f2fs_submit_merged_write_cond(sbi, sbi->meta_inode,
+							NULL, 0, DATA);
+
+	truncate_inode_pages_range(META_MAPPING(sbi),
+			F2FS_BLK_TO_BYTES((loff_t)blkaddr),
+			F2FS_BLK_END_BYTES((loff_t)(blkaddr + cnt - 1)));
+}
+
 static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
 								block_t blkaddr)
 {
-	invalidate_mapping_pages(META_MAPPING(sbi), blkaddr, blkaddr);
+	f2fs_truncate_meta_inode_pages(sbi, blkaddr, 1);
 	f2fs_invalidate_compress_page(sbi, blkaddr);
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4ff3b2d14ddf..20af48d7f784 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3741,8 +3741,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	}
 
 	if (fio->post_read)
-		invalidate_mapping_pages(META_MAPPING(sbi),
-				fio->new_blkaddr, fio->new_blkaddr);
+		f2fs_truncate_meta_inode_pages(sbi, fio->new_blkaddr, 1);
 
 	stat_inc_inplace_blocks(fio->sbi);
 
@@ -3932,7 +3931,7 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 	for (i = 0; i < len; i++)
 		f2fs_wait_on_block_writeback(inode, blkaddr + i);
 
-	invalidate_mapping_pages(META_MAPPING(sbi), blkaddr, blkaddr + len - 1);
+	f2fs_truncate_meta_inode_pages(sbi, blkaddr, len);
 }
 
 static int read_compacted_summaries(struct f2fs_sb_info *sbi)
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 755e9a41b196..a357287eac1e 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -27,6 +27,7 @@
 
 #define F2FS_BYTES_TO_BLK(bytes)	((bytes) >> F2FS_BLKSIZE_BITS)
 #define F2FS_BLK_TO_BYTES(blk)		((blk) << F2FS_BLKSIZE_BITS)
+#define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
 
 /* 0, 1(node nid), 2(meta nid) are reserved node id */
 #define F2FS_RESERVED_NODE_NUM		3
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
