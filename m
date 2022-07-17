Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D75774B4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 07:32:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCwta-0005Wu-61; Sun, 17 Jul 2022 05:32:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1oCwtY-0005Wg-JC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 05:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OLxKCreHwi1ZZhwj7qWeP741DsxdhDZsNv0NsGQbUoo=; b=HVEvNzo+MSGd4zGXBK7pSV9FrQ
 EWqqRJxyPJLX2Q3EIpfV4UqjqAktpqOBlYr+Fkn7j47IsA9j91LLTHQdTy9pu9Io3X0GyH1YC0e9A
 J/QuDvSNmMHNOyiM7+QIMzlNnfsNourm239dj4EnEryZHrzE/kyUb6zMieNoZIJhrRBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OLxKCreHwi1ZZhwj7qWeP741DsxdhDZsNv0NsGQbUoo=; b=ZblFRUcpqB/jw+r4s9/qqRWOaE
 MGMVERQcbRLwOB+JNWtUowqLD7gD7xKvitNlwBBY4aCJkI+LwzX853b99GESVFyry4wGSuSEyCdyh
 qnJ5G8gjBmOM4mU1ua73iJ9q0P2s0T7egixHeRi/4Unut9wa45kBgno5wPPLmDo+4ZxQ=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oCwtT-001ZvY-7B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 05:32:44 +0000
Received: by mail-pg1-f172.google.com with SMTP id s206so7938889pgs.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Jul 2022 22:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLxKCreHwi1ZZhwj7qWeP741DsxdhDZsNv0NsGQbUoo=;
 b=VOJ6HTi5dSVKj35W8xGKPBRHDbsLA4sTz5rqsvIanvF9w9PTKd6CZR01vUKCzMY2Qx
 /w4yNZUW93lPt30zLemOY+oT1fwgB9jQdjnGSZDxYhofh8yXRHk1+8CK6ChDnzURyMZ3
 sRJcauIu2FeJglBx1qjreaEagpqv7KiHHfz6fJNM/WNY3DU4vzQ1J/UN07bpbS0SD7QT
 +V+hNnBxywluaOqI4w0qlAAMQwGM4oK3ehTDoxHInknci4PdKjwSk3zrisc7ZPIB1nlR
 dNsGY+U88xE1cZDtJsar6x7GDuJ6FmIqT6ZukD9QhnIg0Ypwkn81xxQtc9Vb4L5HqKbi
 RDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLxKCreHwi1ZZhwj7qWeP741DsxdhDZsNv0NsGQbUoo=;
 b=SKWJ5VJE35q+l93Ucr6BAEAlhnNDJ+Fitc2gzfocV0fuwdaXqJSDZdHAyif2Gbp4be
 xqfqhRCnAlaRiv8FLakb9epyk2ptnYheFExK1CZoPtp1oB0nA7qahBNcHbZ7hSIp4HU9
 jBxWglWueA7Qw7pzv2uFX2iq1KNnAK6mUuBLxkkxPkBw4CEX7nLUQQH+0sas6TXC7O3s
 xxRpl6ikxbdMBd9L33Hab2kQFa3cNk6GtKxO6h1fdncqHOxvsJzh5us/U7S75mcLHcG2
 q1pejUg32fVk/dndftDAG/g0XIOD2PRfjFTZmYNdlMFsSmrihhKEmNTi8fE/xoOXD/su
 94ew==
X-Gm-Message-State: AJIora/rRbeh5B+tMj6u3ZgORSFMCve/bS7bDWVcnT8u24M/iRSNUqvK
 UE91Dt3kdSoVUCqDSRnu60c=
X-Google-Smtp-Source: AGRyM1u0SI2yMEw9d+DPkVsXSlsgaP7KG+UJBJLyiLAYStmRPhaaZAgNnzitaRNxrwCW7u/2bpCYuQ==
X-Received: by 2002:a63:1f4b:0:b0:41a:daa:3068 with SMTP id
 q11-20020a631f4b000000b0041a0daa3068mr2750799pgm.330.1658035953651; 
 Sat, 16 Jul 2022 22:32:33 -0700 (PDT)
Received: from localhost.localdomain ([205.198.104.202])
 by smtp.googlemail.com with ESMTPSA id
 n8-20020a170902968800b0015e8d4eb1d3sm6488814plp.29.2022.07.16.22.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 22:32:33 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 17 Jul 2022 13:32:06 +0800
Message-Id: <20220717053207.192372-3-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717053207.192372-1-fengnanchang@gmail.com>
References: <20220717053207.192372-1-fengnanchang@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Fengnan Chang Since pvec have 15 pages,
 it not a multiple
 of 4, when write compressed pages, write in 64K as a unit,
 it will call pagevec_lookup_range_tag
 agagin, sometimes this will take a lot of time. Use onstack [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fengnanchang[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oCwtT-001ZvY-7B
Subject: [f2fs-dev] [PATCH v3 2/3] f2fs: use onstack pages instead of pvec
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Fengnan Chang <changfengnan@vivo.com>

Since pvec have 15 pages, it not a multiple of 4, when write compressed
pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
agagin, sometimes this will take a lot of time.
Use onstack pages instead of pvec to mitigate this problem.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c |  8 ++++----
 fs/f2fs/data.c     | 16 +++++++---------
 fs/f2fs/f2fs.h     |  4 +++-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 28619d45b5c9..6dd7782546e9 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -871,7 +871,7 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate)
 {
 	unsigned long pgidx;
@@ -887,12 +887,12 @@ bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct pagevec *pvec,
 	if (nr_pages - index < cc->cluster_size)
 		return false;
 
-	pgidx = pvec->pages[index]->index;
+	pgidx = pages[index]->index;
 
 	for (; i < cc->cluster_size; i++) {
-		if (pvec->pages[index + i]->index != pgidx + i)
+		if (pages[index + i]->index != pgidx + i)
 			return false;
-		if (uptodate && !PageUptodate(pvec->pages[index + i]))
+		if (uptodate && !PageUptodate(pages[index + i]))
 			return false;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 022d0a8715c5..d2d2cfd54210 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2901,7 +2901,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct pagevec pvec;
+	struct page *pages[F2FS_ONSTACK_PAGES];
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2932,8 +2932,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
-	pagevec_init(&pvec);
-
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2959,13 +2957,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
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
@@ -2997,7 +2995,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto lock_page;
 
 				if (f2fs_all_cluster_page_ready(&cc,
-					&pvec, i, nr_pages, true))
+					pages, i, nr_pages, true))
 					goto lock_page;
 
 				ret2 = f2fs_prepare_compress_overwrite(
@@ -3011,7 +3009,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					(!f2fs_compress_write_end(inode,
 						fsdata, page->index, 1) ||
 					 !f2fs_all_cluster_page_ready(&cc,
-						&pvec, i, nr_pages, false))) {
+						pages, i, nr_pages, false))) {
 					retry = 1;
 					break;
 				}
@@ -3101,7 +3099,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		pagevec_release(&pvec);
+		release_pages(pages, nr_pages);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index df07c15a5202..06d0370fd760 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -598,6 +598,8 @@ enum {
 #define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
 #define RECOVERY_MIN_RA_BLOCKS		1
 
+#define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
+
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	union {
@@ -4163,7 +4165,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 							block_t blkaddr);
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
