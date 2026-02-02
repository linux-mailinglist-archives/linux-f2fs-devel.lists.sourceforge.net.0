Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO98K3g/gGlH5QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 008BFC881E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCWOY/WjeIFG3+/rlWNNulzCPzOawvE0FdJ8P81Epw8=; b=J9m1s5oGXtzWjwaRp603DvY4hC
	UX/dbMxu3bN6eyitQmAYeaRz22PU3cY+VmNeHMlQrwgOv5mskHSIjoO2rClTyQzQU5KBuf4F15BeH
	xiYaSA2Dr1eHNjU82NSQXMC1aKZlFZYCGPhjycfstOO088ozwaBaAwbJqA9rFrOXU/bE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmn7F-0004vl-TE;
	Mon, 02 Feb 2026 06:08:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1250474bd6e1e3d30609+8198+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vmn7E-0004vZ-Sy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PgkK/w7RCSXRzbuNalqUJdUjsLJbZJznBNluiIsClZ4=; b=jwx2oRQ574OKoS5FGwVIDzwGeR
 +2SmP0mBAiBZAmxmA/HgNpMeXMDQUoQV+ADQ+pRF71yCKHvoU3Cllk81yEJy26TNLurmkSbq8q3Lo
 0cmoJ1tIP9hBDBqLSLmlH2niquRfJK7A5F5JrRK/93R07tah5eFpL0LwENQyccPFsd7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PgkK/w7RCSXRzbuNalqUJdUjsLJbZJznBNluiIsClZ4=; b=VaJOOWeuu+u+37CIu7OfimtpjW
 F3d80CHrO7ZNfATxRzevP2kH1ULht2UYi3qdp5BHuIWhB28AlS6DAX2Qn5ANv/ntj7ho90rxz/tLg
 JaXPeDTFHX+E6NwjcXMT4N1vzvTX3IgI3cyBWu+xAhrfa+88ufGIKXvKm0AxLJNl+Xm0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmn7E-0007r1-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PgkK/w7RCSXRzbuNalqUJdUjsLJbZJznBNluiIsClZ4=; b=fccZZ2Kk3jACjaidGY4udXmXzN
 PqZ95ALdL30DunF1MfLKoQTt+rUevmN+oHK7yEby2r0XRC6WScEyUqE/gM1wDOx+AqUcQeCwMdKDK
 5P1rcrFcGz2eAQY2duh8PP3YRxbyMl7vnUtOZHFVKl5BJFqgZNdHVn18TG3ecFekn6j7n/Qsy2iiM
 /sJf7frkJn1fNRqfjaSoICvDmewfHBQiCMuiBGagKQO9hLdBkiFSR1OqQKDd2AyQIC4Q8Z4e/9Gd0
 aEE4T7Vh7AqfGXyDqezOmylyB4XVTOfUCInXadfwNAwUBLYr2KpGv77pNXYqM4eoEgPBTnvzQKuN2
 Iv3qQMjg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vmn71-00000004Ulv-1qvg; Mon, 02 Feb 2026 06:08:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Feb 2026 07:06:37 +0100
Message-ID: <20260202060754.270269-9-hch@lst.de>
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
 Content preview:  Look up the fsverity_info once in ext4_mpage_readpages, and
 then use it for the readahead, local verification of holes and pass it along
 to the I/O completion workqueue in struct bio_post_read_ctx. This amortizes
 the lookup better once it becomes less efficient. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vmn7E-0007r1-S5
Subject: [f2fs-dev] [PATCH 08/11] ext4: consolidate fsverity_info lookup
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
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:mid,lst.de:email,suse.cz:email]
X-Rspamd-Queue-Id: 008BFC881E
X-Rspamd-Action: no action

Look up the fsverity_info once in ext4_mpage_readpages, and then use it
for the readahead, local verification of holes and pass it along to the
I/O completion workqueue in struct bio_post_read_ctx.

This amortizes the lookup better once it becomes less efficient.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/ext4/readpage.c | 46 ++++++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 823d67e98c70..09acca898c25 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -62,6 +62,7 @@ enum bio_post_read_step {
 
 struct bio_post_read_ctx {
 	struct bio *bio;
+	struct fsverity_info *vi;
 	struct work_struct work;
 	unsigned int cur_step;
 	unsigned int enabled_steps;
@@ -97,7 +98,7 @@ static void verity_work(struct work_struct *work)
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
 	struct bio *bio = ctx->bio;
-	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
+	struct fsverity_info *vi = ctx->vi;
 
 	/*
 	 * fsverity_verify_bio() may call readahead() again, and although verity
@@ -110,7 +111,7 @@ static void verity_work(struct work_struct *work)
 	mempool_free(ctx, bio_post_read_ctx_pool);
 	bio->bi_private = NULL;
 
-	fsverity_verify_bio(*fsverity_info_addr(inode), bio);
+	fsverity_verify_bio(vi, bio);
 
 	__read_end_io(bio);
 }
@@ -174,22 +175,16 @@ static void mpage_end_io(struct bio *bio)
 	__read_end_io(bio);
 }
 
-static inline bool ext4_need_verity(const struct inode *inode, pgoff_t idx)
-{
-	return fsverity_active(inode) &&
-	       idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
-}
-
 static void ext4_set_bio_post_read_ctx(struct bio *bio,
 				       const struct inode *inode,
-				       pgoff_t first_idx)
+				       struct fsverity_info *vi)
 {
 	unsigned int post_read_steps = 0;
 
 	if (fscrypt_inode_uses_fs_layer_crypto(inode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 
-	if (ext4_need_verity(inode, first_idx))
+	if (vi)
 		post_read_steps |= 1 << STEP_VERITY;
 
 	if (post_read_steps) {
@@ -198,6 +193,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
 			mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 
 		ctx->bio = bio;
+		ctx->vi = vi;
 		ctx->enabled_steps = post_read_steps;
 		bio->bi_private = ctx;
 	}
@@ -211,7 +207,7 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
 	return i_size_read(inode);
 }
 
-static int ext4_mpage_readpages(struct inode *inode,
+static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
 {
 	struct bio *bio = NULL;
@@ -331,10 +327,7 @@ static int ext4_mpage_readpages(struct inode *inode,
 			folio_zero_segment(folio, first_hole << blkbits,
 					  folio_size(folio));
 			if (first_hole == 0) {
-				if (ext4_need_verity(inode, folio->index) &&
-				    !fsverity_verify_folio(
-						*fsverity_info_addr(inode),
-						folio))
+				if (vi && !fsverity_verify_folio(vi, folio))
 					goto set_error_page;
 				folio_end_read(folio, true);
 				continue;
@@ -362,7 +355,7 @@ static int ext4_mpage_readpages(struct inode *inode,
 					REQ_OP_READ, GFP_KERNEL);
 			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
 						  GFP_KERNEL);
-			ext4_set_bio_post_read_ctx(bio, inode, folio->index);
+			ext4_set_bio_post_read_ctx(bio, inode, vi);
 			bio->bi_iter.bi_sector = first_block << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
 			if (rac)
@@ -401,6 +394,7 @@ static int ext4_mpage_readpages(struct inode *inode,
 int ext4_read_folio(struct file *file, struct folio *folio)
 {
 	struct inode *inode = folio->mapping->host;
+	struct fsverity_info *vi = NULL;
 	int ret;
 
 	trace_ext4_read_folio(inode, folio);
@@ -411,24 +405,28 @@ int ext4_read_folio(struct file *file, struct folio *folio)
 			return ret;
 	}
 
-	if (ext4_need_verity(inode, folio->index))
-		fsverity_readahead(*fsverity_info_addr(inode), folio->index,
-				   folio_nr_pages(folio));
-	return ext4_mpage_readpages(inode, NULL, folio);
+	if (folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
+		vi = fsverity_get_info(inode);
+	if (vi)
+		fsverity_readahead(vi, folio->index, folio_nr_pages(folio));
+	return ext4_mpage_readpages(inode, vi, NULL, folio);
 }
 
 void ext4_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
+	struct fsverity_info *vi = NULL;
 
 	/* If the file has inline data, no need to do readahead. */
 	if (ext4_has_inline_data(inode))
 		return;
 
-	if (ext4_need_verity(inode, readahead_index(rac)))
-		fsverity_readahead(*fsverity_info_addr(inode),
-				   readahead_index(rac), readahead_count(rac));
-	ext4_mpage_readpages(inode, rac, NULL);
+	if (readahead_index(rac) < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
+		vi = fsverity_get_info(inode);
+	if (vi)
+		fsverity_readahead(vi, readahead_index(rac),
+				   readahead_count(rac));
+	ext4_mpage_readpages(inode, vi, rac, NULL);
 }
 
 
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
