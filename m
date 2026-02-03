Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIZmKcTBgWm7JAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 10:37:08 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DCD6DDF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 10:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G05zMIZD9bCkGVUjyYoUP3CVFxnXKut7XqWKxXf+ZEE=; b=hN+JZFjRa4MGQCWe47kAZqFL4E
	ai8nMVn2jMfidr4Fadkf+qJ7v3GmP5ZYROgQcfsLBvp4Srgi5iNBOe66kWdB5TxdbDJOizWCihOsu
	/QqI5qfyRkNJStsC5cNtMaH5PdqtMoO+7f6FXsjJEmxWeCJbxtyzQvYenmrJmQTf569o=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnCqG-000859-Kg;
	Tue, 03 Feb 2026 09:37:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vnCqD-00084q-6R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 09:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nU5ojukyW155HZ7FD3G29haPEPsmol9u02BDQcrV7X0=; b=l+wzLfYGDa3qlQqm6iRJpy24Is
 bilL1iQ2V9pt7Sl+IkJMbAnD5xxxm5/C990I0+8po3NgKuatNUtbqSMg/Z9M7Jfi5plCy58gLP5Cz
 p5vu9NkOqXpREzp3xquu9DW1jTHj+kCYoIFbtUl6z/nW0lbbkmAZ1oLpsUY/enD4thIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nU5ojukyW155HZ7FD3G29haPEPsmol9u02BDQcrV7X0=; b=T7x4HGjYDl4SofXI1BdGu7phSR
 kv0+L+BM/Vxa+Etk6qNVeaNmHPsT8gllgkCBplOoqbqTJcPD6BQp1zK+im5636BhK03q433YLfEgp
 G5i7q5RoLgZGiUbV4YJtQQQD8HsIU7bTai3f/w/7FoOjmYmhsPGlfOlKKkSFS+ui41MU=;
Received: from m16.mail.126.com ([117.135.210.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnCqC-000681-1h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 09:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nU
 5ojukyW155HZ7FD3G29haPEPsmol9u02BDQcrV7X0=; b=DBSnMkxcDy6No9mwDi
 Ve458ol2YuCzhFyLmTJ09nQ0P5OW33JTYALffJbDsCjOQ4cR2u2wjvBaHZvpfTqD
 TKSSWvUcX5nkBlXc+pKilUpD9AV5y982QpSgKVtL0Wz/aKI6c9R7riUsynKAf9N1
 Rxy1zQ4Cs/VParonfA5H+AjTU=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wD3z5OjwYFpjYYQAA--.45631S3; 
 Tue, 03 Feb 2026 17:36:41 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 Feb 2026 17:36:13 +0800
Message-Id: <20260203093614.857390-5-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203091256.854842-1-nzzhao@126.com>
References: <20260203091256.854842-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3z5OjwYFpjYYQAA--.45631S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4DZF47AF13CFyUZrW5Wrg_yoWfuw45pF
 W5K3s8KrW8J3W7Wr1IyFn8Zr1Sk3s7Xw4UCayfG3WfA3WYq3s3KF1kt34Y9F4rtrWkAF97
 Xr4UtFyrWF4DJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRhSdgUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQlVJWmBwanIMgAA3y
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds support for large folios buffered write for
 regular files with exception of atomic files, inline files and compressed
 files. We introducte state bitmap to track the uptodate/dirty state of each
 sub -page within a folio. And for allocating multiple size f2fs_folio_state,
 we use kzalloc for now. Better ideas are appreciated. 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [58.240.165.118 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.9 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vnCqC-000681-1h
Subject: [f2fs-dev] [RFC PATCH v1 4/5] f2fs: Support large folios buffered
 write
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[126.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:nzzhao@126.com,m:21cnbao@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[126.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[126.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: F22DCD6DDF
X-Rspamd-Action: no action

This patch adds support for large folios buffered write for regular files
with exception of atomic files, inline files and compressed files.

We introducte state bitmap to track the uptodate/dirty state of each sub
-page within a folio. And for allocating multiple size f2fs_folio_state,
we use kzalloc for now. Better ideas are appreciated.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 222 ++++++++++++++++++++++++++++++++++++++++++++++---
 fs/f2fs/f2fs.h |   1 +
 fs/f2fs/file.c |   4 -
 3 files changed, 210 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a40db6894fc..3aaf20824205 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2414,14 +2414,26 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
 {
 	struct f2fs_folio_state *ffs = folio->private;
+	unsigned int nr_subpages;
 
 	if (ffs)
 		return ffs;
 
-	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab,
-			GFP_NOIO | __GFP_ZERO, true, NULL);
+	nr_subpages = folio_size(folio) >> PAGE_SHIFT;
+	if (nr_subpages <= 1)
+		return NULL;
+
+	ffs = kzalloc(struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
+			GFP_NOIO);
+	if (!ffs)
+		return NULL;
 
 	spin_lock_init(&ffs->state_lock);
+	if (folio_test_uptodate(folio))
+		bitmap_set(ffs->state, 0, nr_subpages);
+	if (folio_test_dirty(folio))
+		bitmap_set(ffs->state, nr_subpages, nr_subpages);
+
 	folio_attach_private(folio, ffs);
 	return ffs;
 }
@@ -2440,7 +2452,177 @@ static void ffs_detach_free(struct folio *folio)
 		return;
 
 	WARN_ON_ONCE(ffs->read_pages_pending != 0);
-	kmem_cache_free(ffs_entry_slab, ffs);
+	kfree(ffs);
+}
+
+static inline unsigned int ffs_nr_subpages(const struct folio *folio)
+{
+	return folio_size(folio) >> PAGE_SHIFT;
+}
+
+static inline bool ffs_subpage_is_uptodate(struct f2fs_folio_state *ffs,
+					 const struct folio *folio, size_t offset)
+{
+	unsigned int idx = offset >> PAGE_SHIFT;
+
+	if (!ffs)
+		return false;
+
+	if (idx >= ffs_nr_subpages(folio))
+		return false;
+
+	return test_bit(idx, ffs->state);
+}
+
+/* Must be called while holding folio lock */
+static inline void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs = folio->private;
+	unsigned int nr_subpages = ffs_nr_subpages(folio);
+	unsigned int start, end;
+
+	if (!ffs) {
+		folio_mark_uptodate(folio);
+		return;
+	}
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	bitmap_set(ffs->state, start, end - start);
+	if (bitmap_full(ffs->state, nr_subpages))
+		folio_mark_uptodate(folio);
+}
+
+/*
+ * During buffered writes, we may only need to read the first and last
+ * page of a folio.
+ */
+static bool f2fs_find_next_need_read_block(struct f2fs_folio_state *ffs,
+					  const struct folio *folio,
+					  size_t orig_off, size_t *need_off,
+					  size_t len)
+{
+	size_t start = orig_off;
+	size_t end = start + len;
+	size_t head, tail;
+
+	if (start & (PAGE_SIZE - 1)) {
+		head = round_down(start, PAGE_SIZE);
+		if (!ffs_subpage_is_uptodate(ffs, folio, head)) {
+			*need_off = head;
+			return true;
+		}
+	}
+
+	if (end & (PAGE_SIZE - 1)) {
+		tail = round_down(end - 1, PAGE_SIZE);
+		if (!ffs_subpage_is_uptodate(ffs, folio, tail)) {
+			*need_off = tail;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int prepare_large_folio_write_begin(struct inode *inode,
+					  struct address_space *mapping,
+					  struct folio *folio, loff_t pos,
+					  unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_folio_state *ffs;
+	struct dnode_of_data dn;
+	size_t ori_off = offset_in_folio(folio, pos);
+	size_t need_off = ori_off;
+	pgoff_t index;
+	bool get_dn;
+	int err = 0;
+	sector_t sector;
+	struct block_device *bdev;
+	struct bio *bio;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+	if (folio_test_uptodate(folio) || len == folio_size(folio))
+		return 0;
+
+	ffs = ffs_find_or_alloc(folio);
+	if (!ffs)
+		return 0;
+
+	/* Inline data must have been converted before reaching here. */
+	if (WARN_ON_ONCE(f2fs_has_inline_data(inode)))
+		return -EINVAL;
+
+	while (f2fs_find_next_need_read_block(ffs, folio, ori_off, &need_off, len)) {
+		size_t off;
+
+		index = folio->index + (ori_off >> PAGE_SHIFT);
+		get_dn = false;
+
+		if (!f2fs_lookup_read_extent_cache_block(inode, index,
+						 &dn.data_blkaddr)) {
+			if (IS_DEVICE_ALIASING(inode))
+				return -ENODATA;
+
+			set_new_dnode(&dn, inode, NULL, NULL, 0);
+			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+			get_dn = true;
+			if (err)
+				goto out;
+		}
+
+		if (dn.data_blkaddr == NULL_ADDR) {
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+
+		off = offset_in_folio(folio, index << PAGE_SHIFT);
+
+		if (dn.data_blkaddr == NEW_ADDR) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			continue;
+		}
+
+		if (!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
+				DATA_GENERIC_ENHANCE_READ)) {
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+
+		/* Submit a synchronous read for this subpage. */
+		f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
+		bdev = f2fs_target_device(sbi, dn.data_blkaddr, &sector);
+
+		bio = bio_alloc_bioset(bdev, 1, REQ_OP_READ | REQ_SYNC,
+				       GFP_NOIO, &f2fs_bioset);
+		bio->bi_iter.bi_sector = sector;
+		f2fs_set_bio_crypt_ctx(bio, inode, index, NULL, GFP_NOFS);
+
+		if (!bio_add_folio(bio, folio, PAGE_SIZE, off)) {
+			bio_put(bio);
+			err = -EIO;
+			goto out;
+		}
+
+		err = submit_bio_wait(bio);
+		bio_put(bio);
+		if (err)
+			goto out;
+
+		ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+
+out:
+		if (get_dn)
+			f2fs_put_dnode(&dn);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static int f2fs_read_data_large_folio(struct inode *inode,
@@ -2457,7 +2639,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio;
 
-	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode)) {
 		if (folio)
 			folio_unlock(folio);
 		return -EOPNOTSUPP;
@@ -3828,6 +4010,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	bool need_balance = false;
 	bool use_cow = false;
 	block_t blkaddr = NULL_ADDR;
+	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	int err = 0;
 
 	trace_f2fs_write_begin(inode, pos, len);
@@ -3875,9 +4058,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Do not use FGP_STABLE to avoid deadlock.
 	 * Will wait that below with our IO control.
 	 */
-	folio = f2fs_filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS,
-				mapping_gfp_mask(mapping));
+	fgp |= fgf_set_order(len);
+	folio = f2fs_filemap_get_folio(mapping, index, fgp, mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
 		goto fail;
@@ -3890,7 +4072,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	if (f2fs_is_atomic_file(inode))
 		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance, &use_cow);
-	else
+	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
 	if (err)
@@ -3911,6 +4093,13 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
+	if (folio_test_large(folio)) {
+		err = prepare_large_folio_write_begin(inode, mapping, folio, pos, len);
+		if (!err)
+			return 0;
+		goto put_folio;
+	}
+
 	if (len == folio_size(folio) || folio_test_uptodate(folio))
 		return 0;
 
@@ -3963,15 +4152,22 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	trace_f2fs_write_end(inode, pos, len, copied);
 
 	/*
-	 * This should be come from len == PAGE_SIZE, and we expect copied
-	 * should be PAGE_SIZE. Otherwise, we treat it with zero copied and
-	 * let generic_perform_write() try to copy data again through copied=0.
+	 * If a short copy happens on a folio that isn't uptodate, we treat it
+	 * with zero copied and let generic_perform_write() try to copy data again
+	 * through copied=0.
 	 */
 	if (!folio_test_uptodate(folio)) {
-		if (unlikely(copied != len))
+		if (unlikely(copied != len)) {
 			copied = 0;
-		else
+		} else if (folio_test_large(folio)) {
+			ffs_mark_subrange_uptodate(folio,
+						   offset_in_folio(folio, pos), len);
+		} else {
+			/*
+			 * For order-0 folios, this should be come from len == PAGE_SIZE
+			 */
 			folio_mark_uptodate(folio);
+		}
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e5b8f5374666..04a6310145c4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2045,6 +2045,7 @@ struct f2fs_sb_info {
 struct f2fs_folio_state {
 	spinlock_t		state_lock;
 	unsigned int		read_pages_pending;
+	unsigned long		state[];
 };
 
 /* Definitions to access f2fs_sb_info */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 18a9feccb1f9..9479f4d447c9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -624,10 +624,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (mapping_large_folio_support(inode->i_mapping) &&
-	    filp->f_mode & FMODE_WRITE)
-		return -EOPNOTSUPP;
-
 	err = fsverity_file_open(inode, filp);
 	if (err)
 		return err;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
