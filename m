Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603E585D12
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Jul 2022 05:34:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oHzii-0001Tn-2T; Sun, 31 Jul 2022 03:34:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1oHzih-0001Tg-E4
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jul 2022 03:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mco/GcjKyyNMPotcBk8f5Q3yCPhuur6L9x7+sgcYuyk=; b=BAdHWCSVsCLgqxTZJPwN8rusky
 jdPWXcwP+o8u53q3p6UcBsrhUI7Qj3RWHi134c8NJbiPNGp3sOP2+FBy90ww9RoVR6WIyMrT/xm9h
 aw7chYgEbrx1DOBY4+rb9crFAjJEvv3CVEW6URlKwWLHYRWIamUL4gKZU1wCvPXDc1X4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mco/GcjKyyNMPotcBk8f5Q3yCPhuur6L9x7+sgcYuyk=; b=JMCmLDibKmTGCwQsgwLdmOqhZo
 GIogYiGfNe8m7cw/3ra3sb1jc2qtSm3//9/6CeZoM4Z8Ox9O3TuJd53GXgF0bDKTdDCdwWvl+IPxc
 lTabOVa/AD7bmFhNEZUvrohwtalWzy5xmBqKZzov2/n6HluvdLg4a5FvYMp/XAHD5xQs=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oHzif-00FdI7-CX
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jul 2022 03:34:22 +0000
Received: by mail-pg1-f175.google.com with SMTP id r186so6994224pgr.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Jul 2022 20:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mco/GcjKyyNMPotcBk8f5Q3yCPhuur6L9x7+sgcYuyk=;
 b=n9bo/j7W74eo8vwsGYIVm1xnqKlpaj5bKtlmw/Nw4Xlfyz8yvrGMT+gu3qz1MH6np7
 P85T1bvz6uWppPohVRaTd1JtGR2FqaR8xZ4p7R5jZ7088WHmAJXsTFd31sx6fH4y+ubX
 fJA0FO0AN0HX28QnffpWgL2fG+st29gxb3XRC4HAY+grZ7nAE2Hf6qsFq9++r6YCKjOH
 kTgwioCub01pkEHXWQNPTgtZWJUJZvmRhnljrbt5Bi8kq8KOdX6MUv3Gc3TfDQJicIwW
 mo9a4JgzeNz7BcDMW06XUuAMG0U84lX12C4Dy9PVQkf+rak6n5SBPbPPVR67vvrQlXvM
 CdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mco/GcjKyyNMPotcBk8f5Q3yCPhuur6L9x7+sgcYuyk=;
 b=Co/mLdwVqnsXxznghwp9fRRQtrZqA7ENxfSIFl9NronW6MIpT5tO0jGizr215CqdHG
 QEpmBM9EGyk/Yfd+BJrxVFRWjQ3wkWLpqxR9EEn7kL3kUk+XPBF585qJH/cZjTmLDt9b
 CTzn0IzrBSmN81rlZFn/cqoeHikyb7MxOpBo9k2vxCXiD1Tj9bEREpcFC7AOazJAwz+9
 syUznvs+FtgBjL2c0A1d5LSdPNOg2OgDjJv5/9fTYj8jr/EJ5x4zzw3i0uQZhU4TcPwG
 /xkwPVPWTDtjEGtdDjbz2N5wUqDngc5m+mfvLgSjHsS85QPVIdoSYFOU+7W9I5ps9iPw
 CkuQ==
X-Gm-Message-State: AJIora8u4ndIa31hO3565cywpFahb6nYg7AOpPeApb01rx/SA55+2OBK
 Pfgj0w5IyMHTtNiris5EyvUSaLu6t/8=
X-Google-Smtp-Source: AGRyM1vSpJmarzQu+2rM6ZghurhGKvtXvq0y7oC38iOkxEsTbBQz/KQ6GEXJos1C7p9O6SZo2zXETQ==
X-Received: by 2002:a05:6a00:194a:b0:52a:d6ff:22e2 with SMTP id
 s10-20020a056a00194a00b0052ad6ff22e2mr10319587pfk.10.1659238455776; 
 Sat, 30 Jul 2022 20:34:15 -0700 (PDT)
Received: from localhost.localdomain ([103.215.126.52])
 by smtp.googlemail.com with ESMTPSA id
 e10-20020a63500a000000b0040dd052ab11sm5026631pgb.58.2022.07.30.20.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 20:34:15 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 31 Jul 2022 11:33:46 +0800
Message-Id: <20220731033347.455209-3-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731033347.455209-1-fengnanchang@gmail.com>
References: <20220731033347.455209-1-fengnanchang@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since pvec have 15 pages, it not a multiple of 4, when write
 compressed pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
 agagin, sometimes this will take a lot of time. Use onstack [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fengnanchang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oHzif-00FdI7-CX
Subject: [f2fs-dev] [PATCH v4 2/3] f2fs: use onstack pages instead of pvec
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since pvec have 15 pages, it not a multiple of 4, when write compressed
pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
agagin, sometimes this will take a lot of time.
Use onstack pages instead of pvec to mitigate this problem.

Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
---
 fs/f2fs/compress.c |  8 ++++----
 fs/f2fs/data.c     | 16 +++++++---------
 fs/f2fs/f2fs.h     |  4 +++-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4677300e87fe..0eca4e060deb 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -929,10 +929,10 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate)
 {
-	unsigned long pgidx = pvec->pages[index]->index;
+	unsigned long pgidx = pages[index]->index;
 	int i = uptodate ? 0 : 1;
 
 	/*
@@ -946,9 +946,9 @@ bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
 		return false;
 
 	for (; i < cc->cluster_size; i++) {
-		if (pvec->pages[index + i]->index != pgidx + i)
+		if (pages[index + i]->index != pgidx + i)
 			return false;
-		if (uptodate && !PageUptodate(pvec->pages[index + i]))
+		if (uptodate && !PageUptodate(pages[index + i]))
 			return false;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 34a7a9affea0..0b159c555069 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2916,7 +2916,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct pagevec pvec;
+	struct page *pages[F2FS_ONSTACK_PAGES];
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2947,8 +2947,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
-	pagevec_init(&pvec);
-
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2974,13 +2972,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !retry && (index <= end)) {
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
+		nr_pages = find_get_pages_range_tag(mapping, &index, end,
+				tag, F2FS_ONSTACK_PAGES, pages);
 		if (nr_pages == 0)
 			break;
 
 		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+			struct page *page = pages[i];
 			bool need_readd;
 readd:
 			need_readd = false;
@@ -3012,7 +3010,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto lock_page;
 
 				if (f2fs_all_cluster_page_ready(&cc,
-					&pvec, i, nr_pages, true))
+					pages, i, nr_pages, true))
 					goto lock_page;
 
 				ret2 = f2fs_prepare_compress_overwrite(
@@ -3026,7 +3024,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					(!f2fs_compress_write_end(inode,
 						fsdata, page->index, 1) ||
 					 !f2fs_all_cluster_page_ready(&cc,
-						&pvec, i, nr_pages, false))) {
+						pages, i, nr_pages, false))) {
 					retry = 1;
 					break;
 				}
@@ -3116,7 +3114,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		pagevec_release(&pvec);
+		release_pages(pages, nr_pages);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac3788d0345d..955dbf4f83ad 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -599,6 +599,8 @@ enum {
 #define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
 #define RECOVERY_MIN_RA_BLOCKS		1
 
+#define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
+
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	union {
@@ -4193,7 +4195,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 				block_t blkaddr, bool in_task);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
