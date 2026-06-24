Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tIhZLNJlO2o4XQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6666BB5B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=a8zUv25R;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=UhPpPHyt;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=fzjP4CDW;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=NnJXijvj;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkrMtfQZ4eRNg1hbR9PnRJn6sFKhuKjr2oOTW0NbIGk=; b=a8zUv25RBjTLFFi4rrzKFHcY4v
	7byAwPaJ4GN/gVoEjqp7rk1QMmuaLuILmsWfRZsLemsTsEX8Rl/7FRN0lubDHvuI0omdsxPUXQfva
	Fuw2FGGRR02UNLI9i+g7Ys5LilIjWfsV5jcTUCmiF6z4sZGIS4CPodx32SX/PKxPflQI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoV-00065e-DJ;
	Wed, 24 Jun 2026 05:06:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoU-00065U-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LPAefT4O3L5qYCFvV642ME99E+Bv6LpDKp8XwCLRud4=; b=UhPpPHytBrRDoswMbsIZ7ia1Dc
 7imUus00cL0ip64PT5x4sIejTSy67PqJsNBM3LZln3SUy/86E5+E3MxYdYmUmORVYecWT/JaDl+aP
 U1K3zgovsbNm6e3w0BJrxXniKdcvHnsMbZv2WprOiwbylFE3O6CRzwd8sRjwdCImHZGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LPAefT4O3L5qYCFvV642ME99E+Bv6LpDKp8XwCLRud4=; b=fzjP4CDWruR08D/x0K9aDI6kyL
 C/7bQQTpbq06uTCm9sLWaOC9o4CAYk90se6wyCmfg/1d+wT5s/AZTg8R/pDFQr9SHEwkAeNue+ofp
 Pi2eTOto6HOPsbgG8sI3pFMwQjL/MZiGvJRzr4i1o/UdjldXOhr5d7xMdsebwg7rK9ks=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoP-0004mQ-AF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 727F54450C;
 Wed, 24 Jun 2026 05:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7101F00A3A;
 Wed, 24 Jun 2026 05:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277564;
 bh=LPAefT4O3L5qYCFvV642ME99E+Bv6LpDKp8XwCLRud4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NnJXijvjac+dbsZr7VcUsj83UtxHLiXlx7uycEgoOwbOkROZV9HR06yETMrylNp+S
 Wf2lsSCcjDbCaxIPtR0+3Yinom2Jg+ZXJn6pKXi6UKbMwiaM7vV3EM/1uPqaboUkQc
 SlOl5T7xLYv3wlTKaUDV5DQJeYIm8wQvwokeVGNon3aBGGss8opioKLyEo/PXz1s5l
 /FwaUJ+afDk/C4eRmqE8uyJKCx38922bAl+egwO3Qvqf9NfPtsjZWV9Yrie0vAqM69
 A9q9mLdQ7GgnNoyBmYiJI76kv/5NmknykdpZb+67SI+ErJ/Ofo2DKORU5+CPzyehBc
 xBqJlxMVtd0BQ==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:27 -0700
Message-ID: <20260624050334.124606-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624050334.124606-1-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now that fscrypt's file contents en/decryption is always
 implemented
 using blk-crypto when the filesystem is block-based, the fs-layer en/decryption
 code in f2fs is unused code. Remove it. Note that the struct f2fs_io_info
 field encrypted_page is kept because it is still used by the garbage
 collection
 path to relocate encrypted blocks using raw meta pages from META_MAPPING.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wcFoP-0004mQ-AF
Subject: [f2fs-dev] [PATCH 09/16] f2fs: Remove fs-layer file contents
 en/decryption code
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D6666BB5B8

Now that fscrypt's file contents en/decryption is always implemented
using blk-crypto when the filesystem is block-based, the fs-layer
en/decryption code in f2fs is unused code.  Remove it.

Note that the struct f2fs_io_info field encrypted_page is kept because
it is still used by the garbage collection path to relocate encrypted
blocks using raw meta pages from META_MAPPING.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/f2fs/compress.c | 28 ++------------
 fs/f2fs/data.c     | 93 +++++-----------------------------------------
 fs/f2fs/f2fs.h     |  2 -
 fs/f2fs/segment.c  |  2 -
 fs/f2fs/super.c    |  1 -
 5 files changed, 12 insertions(+), 114 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 881e76158b96..e0ad9ba315b4 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1282,12 +1282,10 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.page = NULL,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
 		.io_type = io_type,
 		.io_wbc = wbc,
-		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode) ?
-									1 : 0,
 	};
 	struct folio *folio;
 	struct dnode_of_data dn;
 	struct node_info ni;
 	struct compress_io_ctx *cic;
@@ -1357,18 +1355,10 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		fio.old_blkaddr = data_blkaddr(dn.inode, dn.node_folio,
 						dn.ofs_in_node + i + 1);
 
 		/* wait for GCed page writeback via META_MAPPING */
 		f2fs_wait_on_block_writeback(inode, fio.old_blkaddr);
-
-		if (fio.encrypted) {
-			fio.page = cc->rpages[i + 1];
-			err = f2fs_encrypt_one_page(&fio);
-			if (err)
-				goto out_destroy_crypt;
-			cc->cpages[i] = fio.encrypted_page;
-		}
 	}
 
 	set_cluster_writeback(cc);
 
 	for (i = 0; i < cc->cluster_size; i++)
@@ -1402,25 +1392,19 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			goto unlock_continue;
 		}
 
 		f2fs_bug_on(fio.sbi, blkaddr == NULL_ADDR);
 
-		if (fio.encrypted)
-			fio.encrypted_page = cc->cpages[i - 1];
-		else
-			fio.compressed_page = cc->cpages[i - 1];
+		fio.compressed_page = cc->cpages[i - 1];
 
 		cc->cpages[i - 1] = NULL;
 		fio.submitted = 0;
 		f2fs_outplace_write_data(&dn, &fio);
 		if (unlikely(!fio.submitted)) {
 			cancel_cluster_writeback(cc, cic, i);
-
-			/* To call fscrypt_finalize_bounce_page */
-			i = cc->valid_nr_cpages;
 			*submitted = 0;
-			goto out_destroy_crypt;
+			goto out_free_page_array;
 		}
 		(*submitted)++;
 unlock_continue:
 		inode_dec_dirty_pages(cc->inode);
 		folio_unlock(fio.folio);
@@ -1448,18 +1432,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	page_array_free(sbi, cc->cpages, cc->nr_cpages);
 	cc->cpages = NULL;
 	f2fs_destroy_compress_ctx(cc, false);
 	return 0;
 
-out_destroy_crypt:
+out_free_page_array:
 	page_array_free(sbi, cic->rpages, cc->cluster_size);
-
-	for (--i; i >= 0; i--) {
-		if (!cc->cpages[i])
-			continue;
-		fscrypt_finalize_bounce_page(&cc->cpages[i]);
-	}
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
 out_put_dnode:
 	f2fs_put_dnode(&dn);
 out_unlock_op:
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8d4f1e75dee3..315bfe40da87 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -57,13 +57,10 @@ bool f2fs_is_cp_guaranteed(const struct folio *folio)
 {
 	struct address_space *mapping = folio->mapping;
 	struct inode *inode;
 	struct f2fs_sb_info *sbi;
 
-	if (fscrypt_is_bounce_folio(folio))
-		return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
-
 	inode = mapping->host;
 	sbi = F2FS_I_SB(inode);
 
 	if (inode->i_ino == F2FS_META_INO(sbi) ||
 			inode->i_ino == F2FS_NODE_INO(sbi) ||
@@ -93,15 +90,10 @@ static enum count_type __read_io_type(struct folio *folio)
 	return F2FS_RD_DATA;
 }
 
 /* postprocessing steps for read bios */
 enum bio_post_read_step {
-#ifdef CONFIG_FS_ENCRYPTION
-	STEP_DECRYPT	= BIT(0),
-#else
-	STEP_DECRYPT	= 0,	/* compile out the decryption-related code */
-#endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	STEP_DECOMPRESS	= BIT(1),
 #else
 	STEP_DECOMPRESS	= 0,	/* compile out the decompression-related code */
 #endif
@@ -293,15 +285,10 @@ static void f2fs_post_read_work(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
 	struct bio *bio = ctx->bio;
 
-	if ((ctx->enabled_steps & STEP_DECRYPT) && !fscrypt_decrypt_bio(bio)) {
-		f2fs_finish_read_bio(bio, true);
-		return;
-	}
-
 	if (ctx->enabled_steps & STEP_DECOMPRESS)
 		f2fs_handle_step_decompress(ctx, true);
 
 	f2fs_verify_and_finish_bio(bio, true);
 }
@@ -321,22 +308,15 @@ static void f2fs_read_end_io(struct bio *bio)
 	if (bio->bi_status != BLK_STS_OK) {
 		f2fs_finish_read_bio(bio, intask);
 		return;
 	}
 
-	if (ctx) {
-		unsigned int enabled_steps = ctx->enabled_steps &
-					(STEP_DECRYPT | STEP_DECOMPRESS);
-
-		/*
-		 * If we have only decompression step between decompression and
-		 * decrypt, we don't need post processing for this.
-		 */
-		if (enabled_steps == STEP_DECOMPRESS &&
-				!f2fs_low_mem_mode(sbi)) {
+	if (ctx && (ctx->enabled_steps & STEP_DECOMPRESS)) {
+		if (!f2fs_low_mem_mode(sbi)) {
+			/* Decompress inline. */
 			f2fs_handle_step_decompress(ctx, intask);
-		} else if (enabled_steps) {
+		} else {
 			INIT_WORK(&ctx->work, f2fs_post_read_work);
 			queue_work(ctx->sbi->post_read_wq, &ctx->work);
 			return;
 		}
 	}
@@ -357,17 +337,10 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
 		enum count_type type;
 
-		if (fscrypt_is_bounce_folio(folio)) {
-			struct folio *io_folio = folio;
-
-			folio = fscrypt_pagecache_folio(io_folio);
-			fscrypt_free_bounce_page(&io_folio->page);
-		}
-
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_is_compressed_page(folio)) {
 			f2fs_compress_write_end_io(bio, folio);
 			continue;
 		}
@@ -599,15 +572,10 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 		return true;
 
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *target = fi.folio;
 
-		if (fscrypt_is_bounce_folio(target)) {
-			target = fscrypt_pagecache_folio(target);
-			if (IS_ERR(target))
-				continue;
-		}
 		if (f2fs_is_compressed_page(target)) {
 			target = f2fs_compress_control_folio(target);
 			if (IS_ERR(target))
 				continue;
 		}
@@ -1117,13 +1085,10 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 			       for_write ? GFP_NOIO : GFP_KERNEL, &f2fs_bioset);
 	bio->bi_iter.bi_sector = sector;
 	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
 	bio->bi_end_io = f2fs_read_end_io;
 
-	if (fscrypt_inode_uses_fs_layer_crypto(inode))
-		post_read_steps |= STEP_DECRYPT;
-
 	if (vi)
 		post_read_steps |= STEP_VERITY;
 
 	/*
 	 * STEP_DECOMPRESS is handled specially, since a compressed file might
@@ -2808,39 +2773,10 @@ static void f2fs_readahead(struct readahead_control *rac)
 		fsverity_readahead(vi, readahead_index(rac),
 				   readahead_count(rac));
 	f2fs_mpage_readpages(inode, vi, rac, NULL);
 }
 
-int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
-{
-	struct inode *inode = fio_inode(fio);
-	struct folio *mfolio;
-	struct page *page;
-
-	if (!f2fs_encrypted_file(inode))
-		return 0;
-
-	page = fio->compressed_page ? fio->compressed_page : fio->page;
-
-	if (fscrypt_inode_uses_inline_crypto(inode))
-		return 0;
-
-	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(page_folio(page),
-					PAGE_SIZE, 0, GFP_NOFS);
-	if (IS_ERR(fio->encrypted_page))
-		return PTR_ERR(fio->encrypted_page);
-
-	mfolio = filemap_lock_folio(META_MAPPING(fio->sbi), fio->old_blkaddr);
-	if (!IS_ERR(mfolio)) {
-		if (folio_test_uptodate(mfolio))
-			memcpy(folio_address(mfolio),
-				page_address(fio->encrypted_page), PAGE_SIZE);
-		f2fs_folio_put(mfolio, true);
-	}
-	return 0;
-}
-
 static inline bool check_inplace_update_policy(struct inode *inode,
 				struct f2fs_io_info *fio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
@@ -3009,26 +2945,19 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	 * it had better in-place writes for updated data.
 	 */
 	if (ipu_force ||
 		(__is_valid_data_blkaddr(fio->old_blkaddr) &&
 					need_inplace_update(fio))) {
-		err = f2fs_encrypt_one_page(fio);
-		if (err)
-			goto out_writepage;
-
 		folio_start_writeback(folio);
 		f2fs_put_dnode(&dn);
 		if (fio->need_lock == LOCK_REQ)
 			f2fs_unlock_op(fio->sbi, &lc);
 		err = f2fs_inplace_write_data(fio);
-		if (err) {
-			if (fscrypt_inode_uses_fs_layer_crypto(inode))
-				fscrypt_finalize_bounce_page(&fio->encrypted_page);
+		if (err)
 			folio_end_writeback(folio);
-		} else {
+		else
 			set_inode_flag(inode, FI_UPDATE_WRITE);
-		}
 		trace_f2fs_do_write_data_page(folio, IPU);
 		return err;
 	}
 
 	if (fio->need_lock == LOCK_RETRY) {
@@ -3043,14 +2972,10 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (err)
 		goto out_writepage;
 
 	fio->version = ni.version;
 
-	err = f2fs_encrypt_one_page(fio);
-	if (err)
-		goto out_writepage;
-
 	folio_start_writeback(folio);
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
 
@@ -4547,13 +4472,13 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		return err;
 
 	iomap->offset = F2FS_BLK_TO_BYTES(map.m_lblk);
 
 	/*
-	 * When inline encryption is enabled, sometimes I/O to an encrypted file
-	 * has to be broken up to guarantee DUN contiguity.  Handle this by
-	 * limiting the length of the mapping returned.
+	 * Sometimes I/O to an encrypted file has to be broken up to guarantee
+	 * DUN contiguity.  Handle this by limiting the length of the mapping
+	 * returned.
 	 */
 	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
 
 	/*
 	 * We should never see delalloc or compressed extents here based on
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 91f506e7c9cf..746e678ceb1a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1353,11 +1353,10 @@ struct f2fs_io_info {
 	unsigned int need_lock:8;	/* indicate we need to lock cp_rwsem */
 	unsigned int version:8;		/* version of the node */
 	unsigned int submitted:1;	/* indicate IO submission */
 	unsigned int in_list:1;		/* indicate fio is in io_list */
 	unsigned int is_por:1;		/* indicate IO is from recovery or not */
-	unsigned int encrypted:1;	/* indicate file is encrypted */
 	unsigned int meta_gc:1;		/* require meta inode GC */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */
 	sector_t *last_block;		/* last block number in bio */
@@ -4176,11 +4175,10 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct folio *ifolio, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			u64 start, u64 len);
-int f2fs_encrypt_one_page(struct f2fs_io_info *fio);
 bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio);
 bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio);
 int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct bio **bio, sector_t *last_block,
 				struct writeback_control *wbc,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 788f8b050249..e45eb0ff961d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3985,12 +3985,10 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 	if (unlikely(err)) {
 		f2fs_err_ratelimited(fio->sbi,
 			"%s Failed to allocate data block, ino:%u, index:%lu, type:%d, old_blkaddr:0x%x, new_blkaddr:0x%x, err:%d",
 			__func__, fio->ino, folio->index, type,
 			fio->old_blkaddr, fio->new_blkaddr, err);
-		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
-			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(fio->sbi, folio);
 		f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
 							CP_ERROR_FLAG));
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f3f6768f8cca..fd9d3ea4c058 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3753,11 +3753,10 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 
 static const struct fscrypt_operations f2fs_cryptops = {
 	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_crypt_info) -
 				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
 	.is_block_based		= 1,
-	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
