Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNT+NXg/gGk65QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C8C881F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iWdLw9IOoT3crWtHyNI820ProUVTrHJp46SkSayNOo=; b=KZ46Fr0Kh5ww7/PN+DgBqqyCKg
	Tcle0+JUY0q/7FmsDPPzARqcIuDol8po3zgsrrroAMzNtrDINxkGlKORZWWtwhUmeI20gcsEvpmf5
	wlh+Zi+sWw4VlztPSbnYgSjHVi/4q+Nob1qZexlMTptVGmGNyykv2elrR96Rb9m3+8wk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmn7G-00011h-TP;
	Mon, 02 Feb 2026 06:08:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1250474bd6e1e3d30609+8198+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vmn7F-00011a-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w25H83HvlF11VMhZqkjKVM/P2WnPxF6OiBR7NKsBSkY=; b=DefKrwukp4xclchK0XftKM6JCZ
 hUKBp57opKXVJmgviBV9HxysfESPvrkW7i1/IXeQCNN7+0iWPo6PBdLcTVGKr8ISA5QCCYYfwUPzh
 4Qe+q74lTTpLRpYJ7LC/3UA3SUokuphIAda7Q8/4F/pEa0i3/TIq/mPAXuWARw5Csu78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w25H83HvlF11VMhZqkjKVM/P2WnPxF6OiBR7NKsBSkY=; b=dstiCBq72BKpiMN6kphWLjzxu0
 8ezKboHDutLFmrcS1ETpYOHlgxnxfubz2N0QU5ZBQC5SsaT1RC6vK15owwCp1kVUiFwPR16qfZ7Nu
 1LCLNvjdgT+Zh37yPppvfGCn2GOlKKRtVp+j081FY9UtXXYGjA1mu1RnOonlrLvM6QD8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmn7E-0007qw-Cy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=w25H83HvlF11VMhZqkjKVM/P2WnPxF6OiBR7NKsBSkY=; b=ELTSAMwKMqxXcfqsKgcY+L4Ehp
 WnA++ZkbTcCd8rwJuo3kn+n3AA7Q8+l95swsoVQr8fWru/5BYncNGdF4afFx5AgS/brQLJwHjWRzK
 WyhwikqQJ+U+ozu6Z6SybiDYZYlB4pjuqt2a6bEosnvsEnCcbTqUen4Md5g4L0nfbsyI63rU4nB57
 0o5WjtuCSzFw/dGk0pmu3Kj2DLlKZF2Qen6m5AQtTr8ncGgy6RXf7lIzkV8oQLDvmva5aGsVnNLs7
 gUTvuM6rK8tAJI6vWapLYYGhOi/bf/RiOUs9ktfZ1GmNgu4Kv5DYXkgH/iGHBFK3BWCgnQIw0OCqh
 ElEAewSA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vmn76-00000004UmE-2HHr; Mon, 02 Feb 2026 06:08:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Feb 2026 07:06:38 +0100
Message-ID: <20260202060754.270269-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202060754.270269-1-hch@lst.de>
References: <20260202060754.270269-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Look up the fsverity_info once in f2fs_mpage_readpages, and
 then use it for the readahead, local verification of holes and pass it along
 to the I/O completion workqueue in struct bio_post_read_ctx. Do [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vmn7E-0007qw-Cy
Subject: [f2fs-dev] [PATCH 09/11] f2fs: consolidate fsverity_info lookup
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:mid,lst.de:email,cc.vi:url]
X-Rspamd-Queue-Id: 3B2C8C881F
X-Rspamd-Action: no action

Look up the fsverity_info once in f2fs_mpage_readpages, and then use it
for the readahead, local verification of holes and pass it along to the
I/O completion workqueue in struct bio_post_read_ctx.  Do the same
thing in f2fs_get_read_data_folio for reads that come from garbage
collection and other background activities.

This amortizes the lookup better once it becomes less efficient.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/compress.c |  9 +++--
 fs/f2fs/data.c     | 88 +++++++++++++++++++++++++---------------------
 fs/f2fs/f2fs.h     |  9 ++---
 3 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 3de4a7e66959..ef1225af2acf 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1181,6 +1181,7 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
 		.rpages = NULL,
 		.nr_rpages = 0,
+		.vi = NULL, /* can't write to fsverity files */
 	};
 
 	return prepare_compress_overwrite(&cc, pagep, index, fsdata);
@@ -1716,7 +1717,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	dic->nr_cpages = cc->nr_cpages;
 	refcount_set(&dic->refcnt, 1);
 	dic->failed = false;
-	dic->need_verity = f2fs_need_verity(cc->inode, start_idx);
+	dic->vi = cc->vi;
 
 	for (i = 0; i < dic->cluster_size; i++)
 		dic->rpages[i] = cc->rpages[i];
@@ -1814,9 +1815,7 @@ static void f2fs_verify_cluster(struct work_struct *work)
 		if (!rpage)
 			continue;
 
-		if (fsverity_verify_page(
-				*fsverity_info_addr(rpage->mapping->host),
-				rpage))
+		if (fsverity_verify_page(dic->vi, rpage))
 			SetPageUptodate(rpage);
 		else
 			ClearPageUptodate(rpage);
@@ -1835,7 +1834,7 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 {
 	int i;
 
-	if (IS_ENABLED(CONFIG_FS_VERITY) && !failed && dic->need_verity) {
+	if (IS_ENABLED(CONFIG_FS_VERITY) && !failed && dic->vi) {
 		/*
 		 * Note that to avoid deadlocks, the verity work can't be done
 		 * on the decompression workqueue.  This is because verifying
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3593208c99db..41a5f2d21282 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -109,6 +109,7 @@ enum bio_post_read_step {
 struct bio_post_read_ctx {
 	struct bio *bio;
 	struct f2fs_sb_info *sbi;
+	struct fsverity_info *vi;
 	struct work_struct work;
 	unsigned int enabled_steps;
 	/*
@@ -165,6 +166,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 		container_of(work, struct bio_post_read_ctx, work);
 	struct bio *bio = ctx->bio;
 	bool may_have_compressed_pages = (ctx->enabled_steps & STEP_DECOMPRESS);
+	struct fsverity_info *vi = ctx->vi;
 
 	/*
 	 * fsverity_verify_bio() may call readahead() again, and while verity
@@ -185,8 +187,6 @@ static void f2fs_verify_bio(struct work_struct *work)
 
 		bio_for_each_folio_all(fi, bio) {
 			struct folio *folio = fi.folio;
-			struct fsverity_info *vi =
-				*fsverity_info_addr(folio->mapping->host);
 
 			if (!f2fs_is_compressed_page(folio) &&
 			    !fsverity_verify_page(vi, &folio->page)) {
@@ -195,9 +195,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 			}
 		}
 	} else {
-		struct inode *inode = bio_first_folio_all(bio)->mapping->host;
-
-		fsverity_verify_bio(*fsverity_info_addr(inode), bio);
+		fsverity_verify_bio(vi, bio);
 	}
 
 	f2fs_finish_read_bio(bio, true);
@@ -1040,9 +1038,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	f2fs_up_write(&io->io_rwsem);
 }
 
-static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
-				      unsigned nr_pages, blk_opf_t op_flag,
-				      pgoff_t first_idx, bool for_write)
+static struct bio *f2fs_grab_read_bio(struct inode *inode,
+		struct fsverity_info *vi, block_t blkaddr, unsigned nr_pages,
+		blk_opf_t op_flag, pgoff_t first_idx, bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -1061,7 +1059,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	if (fscrypt_inode_uses_fs_layer_crypto(inode))
 		post_read_steps |= STEP_DECRYPT;
 
-	if (f2fs_need_verity(inode, first_idx))
+	if (vi)
 		post_read_steps |= STEP_VERITY;
 
 	/*
@@ -1076,6 +1074,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 		ctx->bio = bio;
 		ctx->sbi = sbi;
+		ctx->vi = vi;
 		ctx->enabled_steps = post_read_steps;
 		ctx->fs_blkaddr = blkaddr;
 		ctx->decompression_attempted = false;
@@ -1087,15 +1086,15 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 }
 
 /* This can handle encryption stuffs */
-static void f2fs_submit_page_read(struct inode *inode, struct folio *folio,
-				 block_t blkaddr, blk_opf_t op_flags,
-				 bool for_write)
+static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
+		struct folio *folio, block_t blkaddr, blk_opf_t op_flags,
+		bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
 
-	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
-					folio->index, for_write);
+	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio->index,
+			for_write);
 
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
@@ -1197,6 +1196,14 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 	return err;
 }
 
+static inline struct fsverity_info *f2fs_need_verity(const struct inode *inode,
+		pgoff_t idx)
+{
+	if (idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
+		return fsverity_get_info(inode);
+	return NULL;
+}
+
 struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs)
 {
@@ -1262,8 +1269,8 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		return folio;
 	}
 
-	f2fs_submit_page_read(inode, folio, dn.data_blkaddr,
-						op_flags, for_write);
+	f2fs_submit_page_read(inode, f2fs_need_verity(inode, folio->index),
+			folio, dn.data_blkaddr, op_flags, for_write);
 	return folio;
 
 put_err:
@@ -2067,12 +2074,10 @@ static inline blk_opf_t f2fs_ra_op_flags(struct readahead_control *rac)
 	return rac ? REQ_RAHEAD : 0;
 }
 
-static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
-					unsigned nr_pages,
-					struct f2fs_map_blocks *map,
-					struct bio **bio_ret,
-					sector_t *last_block_in_bio,
-					struct readahead_control *rac)
+static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
+		struct folio *folio, unsigned nr_pages,
+		struct f2fs_map_blocks *map, struct bio **bio_ret,
+		sector_t *last_block_in_bio, struct readahead_control *rac)
 {
 	struct bio *bio = *bio_ret;
 	const unsigned int blocksize = F2FS_BLKSIZE;
@@ -2124,10 +2129,7 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 	} else {
 zero_out:
 		folio_zero_segment(folio, 0, folio_size(folio));
-		if (f2fs_need_verity(inode, index) &&
-		    !fsverity_verify_folio(
-				*fsverity_info_addr(folio->mapping->host),
-				folio)) {
+		if (vi && !fsverity_verify_folio(vi, folio)) {
 			ret = -EIO;
 			goto out;
 		}
@@ -2149,7 +2151,7 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 		bio = NULL;
 	}
 	if (bio == NULL)
-		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
+		bio = f2fs_grab_read_bio(inode, vi, block_nr, nr_pages,
 				f2fs_ra_op_flags(rac), index,
 				false);
 
@@ -2301,8 +2303,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		}
 
 		if (!bio)
-			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
-					f2fs_ra_op_flags(rac),
+			bio = f2fs_grab_read_bio(inode, cc->vi, blkaddr,
+					nr_pages - i, f2fs_ra_op_flags(rac),
 					folio->index, for_write);
 
 		if (!bio_add_folio(bio, folio, blocksize, 0))
@@ -2342,7 +2344,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  * This function was originally taken from fs/mpage.c, and customized for f2fs.
  * Major change was from block_size == page_size in f2fs by default.
  */
-static int f2fs_mpage_readpages(struct inode *inode,
+static int f2fs_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
 {
 	struct bio *bio = NULL;
@@ -2397,6 +2399,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 		/* there are remained compressed pages, submit them */
 		if (!f2fs_cluster_can_merge_page(&cc, index)) {
+			cc.vi = vi;
 			ret = f2fs_read_multi_pages(&cc, &bio,
 						max_nr_pages,
 						&last_block_in_bio,
@@ -2430,8 +2433,8 @@ static int f2fs_mpage_readpages(struct inode *inode,
 read_single_page:
 #endif
 
-		ret = f2fs_read_single_page(inode, folio, max_nr_pages, &map,
-					&bio, &last_block_in_bio, rac);
+		ret = f2fs_read_single_page(inode, vi, folio, max_nr_pages,
+					&map, &bio, &last_block_in_bio, rac);
 		if (ret) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
@@ -2447,6 +2450,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		if (f2fs_compressed_file(inode)) {
 			/* last page */
 			if (nr_pages == 1 && !f2fs_cluster_is_empty(&cc)) {
+				cc.vi = vi;
 				ret = f2fs_read_multi_pages(&cc, &bio,
 							max_nr_pages,
 							&last_block_in_bio,
@@ -2464,6 +2468,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 {
 	struct inode *inode = folio->mapping->host;
+	struct fsverity_info *vi = NULL;
 	int ret;
 
 	trace_f2fs_readpage(folio, DATA);
@@ -2480,15 +2485,16 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 			return ret;
 	}
 
-	if (f2fs_need_verity(inode, folio->index))
-		fsverity_readahead(*fsverity_info_addr(inode), folio->index,
-				   folio_nr_pages(folio));
-	return f2fs_mpage_readpages(inode, NULL, folio);
+	vi = f2fs_need_verity(inode, folio->index);
+	if (vi)
+		fsverity_readahead(vi, folio->index, folio_nr_pages(folio));
+	return f2fs_mpage_readpages(inode, vi, NULL, folio);
 }
 
 static void f2fs_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
+	struct fsverity_info *vi = NULL;
 
 	trace_f2fs_readpages(inode, readahead_index(rac), readahead_count(rac));
 
@@ -2499,10 +2505,11 @@ static void f2fs_readahead(struct readahead_control *rac)
 	if (f2fs_has_inline_data(inode))
 		return;
 
-	if (f2fs_need_verity(inode, readahead_index(rac)))
-		fsverity_readahead(*fsverity_info_addr(inode),
-				   readahead_index(rac), readahead_count(rac));
-	f2fs_mpage_readpages(inode, rac, NULL);
+	vi = f2fs_need_verity(inode, readahead_index(rac));
+	if (vi)
+		fsverity_readahead(vi, readahead_index(rac),
+				   readahead_count(rac));
+	f2fs_mpage_readpages(inode, vi, rac, NULL);
 }
 
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
@@ -3653,6 +3660,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		}
 		f2fs_submit_page_read(use_cow ?
 				F2FS_I(inode)->cow_inode : inode,
+				NULL, /* can't write to fsverity files */
 				folio, blkaddr, 0, true);
 
 		folio_lock(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 20edbb99b814..f2fcadc7a6fe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1603,6 +1603,7 @@ struct compress_ctx {
 	size_t clen;			/* valid data length in cbuf */
 	void *private;			/* payload buffer for specified compression algorithm */
 	void *private2;			/* extra payload buffer */
+	struct fsverity_info *vi;	/* verity info if needed */
 };
 
 /* compress context for write IO path */
@@ -1658,7 +1659,7 @@ struct decompress_io_ctx {
 	refcount_t refcnt;
 
 	bool failed;			/* IO error occurred before decompression? */
-	bool need_verity;		/* need fs-verity verification after decompression? */
+	struct fsverity_info *vi;	/* fs-verity context if needed */
 	unsigned char compress_algorithm;	/* backup algorithm type */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
@@ -4886,12 +4887,6 @@ static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
 	return sbi->aligned_blksize;
 }
 
-static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
-{
-	return fsverity_active(inode) &&
-	       idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
-}
-
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 					unsigned long type, enum fault_option fo);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
