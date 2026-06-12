Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wBJDL5e9K2qQEAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B456779DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QdtXB9Eh;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="nAYN/um/";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="c/3GjGQl";
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=VpGqPh13;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDMGPOxxxqRDsvh1BOxmdyCNTpT6LFEGjSKhLIMkXZU=; b=QdtXB9EhIUuu2yOlMsoeFUsWpX
	Tuyz2JjMrvFA6GFJfGUeXeOCXY2MTwnt7wudQHR7W9ztK21RktJ+aK8+7UJdJUz0862PZWZygIdKt
	W//Hv0lAK/1puSt6qH4wzBrrioIobbf6Tt9/u+elv5JTPUgz7lzMiJPSOJT2c4HjKe5Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXwsS-0007Ay-M1;
	Fri, 12 Jun 2026 08:04:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wXwsM-000788-68
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KixvksQDijuaj9WdnJrHY3dT3VlnmtEao7uYfMYrDp0=; b=nAYN/um/CvaRuG+IoapnCRQP+T
 rAWTq0E2SSF+nKSD6OgkjVkmcnYG9nkdxWuGeffv/jFwZ7f71iSGN5cqEPVmHwQ0ycn6GTBw1HjgC
 ECdVGvezg+1QHxSRPuFjyMd4e+AutmJgNbbqEZ207oyhcMDWVS9RHR7tQYQsrc7F/I8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KixvksQDijuaj9WdnJrHY3dT3VlnmtEao7uYfMYrDp0=; b=c/3GjGQlp5dyLpE61XgeLUVLQd
 0xyppGE+1oqwpD2mXFTFS/xBsBfQEN4p/XQGC0XwK5vwUNGW/JOE4dNNBN58xWP5M9PLAL3kp36Wx
 5E9ybFrrX8GPzAhwEpr+7LGfXbSMQswcKS5gwMYBNhLIi2tGUyreM3CGxNDNar4hVlmA=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXwsI-0004JQ-13 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ki
 xvksQDijuaj9WdnJrHY3dT3VlnmtEao7uYfMYrDp0=; b=VpGqPh136tWQJqYgZ9
 /0jHA6HLT096WaqKyN6Qljsrp+QcSZDPweYTb+S0tTyOD34ZvJ/ZkuX9BbElt1RN
 WksC45+f855gLwinVNaQWqvXhzwJYzD+uuKoonQi2SdQ/Hu+HmLhKiWlMlGEQ5gm
 qNRwSyzxLFHvJXzRFFel9L8R8=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDX_ytWvStqyXqrBQ--.43664S5; 
 Fri, 12 Jun 2026 16:03:39 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jun 2026 16:03:28 +0800
Message-Id: <20260612080334.70657-4-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
References: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_ytWvStqyXqrBQ--.43664S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF15uw15KF45Zry8CFyUWrg_yoWDGFW7pF
 WUK3s8KrWrJ3W7urn2qFnrZr1Sk3s7X34UCayfGa4fA3WYq3s3K3Wkt34Y9F4rJrykAFyx
 XF4jyFyrWFyDJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr-B_UUUUU=
X-Originating-IP: [223.104.43.40]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBzru2orvVyrtQAA3C
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nanzhe <zhaonanzhe@xiaomi.com> To avoid the complexity
 of unlocking a large folio in write_begin, preallocate partial blocks for
 inodes that can use large folios. During write_begin, read only the partial
 head and tail 4K subpages [...] 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [223.104.43.40 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.8 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1wXwsI-0004JQ-13
Subject: [f2fs-dev] [RFC PATCH 3/9] f2fs: support regular file buffered
 writes on large folios
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
From: Nanzhe Zhao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[xiaomi.com:query timed out,lists.sourceforge.net:query timed out];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[lists.sourceforge.net:query timed out];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58B456779DA

From: Nanzhe <zhaonanzhe@xiaomi.com>

To avoid the complexity of unlocking a large folio in write_begin,
preallocate partial blocks for inodes that can use large folios.
During write_begin, read only the partial head and tail 4K subpages
that need read-before-write, and skip read I/O for the full middle
subpages covered by the write.

Signed-off-by: Nanzhe <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 215 ++++++++++++++++++++++++++++++++++++++++++++++---
 fs/f2fs/f2fs.h |   2 +
 fs/f2fs/file.c |  17 +++-
 3 files changed, 222 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 904cfaee139e..f5b4974e6b3c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2548,6 +2548,187 @@ static void ffs_detach_free(struct folio *folio)
 	kfree(ffs);
 }
 
+bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
+{
+	struct f2fs_folio_state *ffs;
+	size_t offset;
+	unsigned int idx;
+
+	if (!folio_has_ffs(folio))
+		return folio_test_uptodate(folio);
+
+	ffs = folio->private;
+	offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);
+	idx = offset >> PAGE_SHIFT;
+	return test_bit(idx, ffs->state);
+}
+
+void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int nr_subpages, start, end;
+
+	if (!folio_has_ffs(folio)) {
+		folio_mark_uptodate(folio);
+		return;
+	}
+
+	ffs = folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	bitmap_set(ffs->state, start, end - start);
+	if (bitmap_full(ffs->state, nr_subpages))
+		folio_mark_uptodate(folio);
+}
+
+static void ffs_mark_subrange_dirty(struct folio *folio,
+				    size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int nr_subpages, start, end;
+	unsigned long flags;
+
+	if (!folio_has_ffs(folio))
+		return;
+
+	ffs = folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	bitmap_set(ffs->state, nr_subpages + start, end - start);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+}
+
+static bool f2fs_find_next_need_read_block(const struct folio *folio,
+					  size_t orig_off, size_t *need_off,
+					  size_t len)
+{
+	size_t start = orig_off;
+	size_t end = start + len;
+	size_t head, tail;
+	pgoff_t index;
+
+	if (start & (PAGE_SIZE - 1)) {
+		head = round_down(start, PAGE_SIZE);
+		index = folio->index + (head >> PAGE_SHIFT);
+		if (!ffs_test_blk_uptodate(folio, index)) {
+			*need_off = head;
+			return true;
+		}
+	}
+
+	if (end & (PAGE_SIZE - 1)) {
+		tail = round_down(end - 1, PAGE_SIZE);
+		index = folio->index + (tail >> PAGE_SHIFT);
+		if (!ffs_test_blk_uptodate(folio, index)) {
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
+		return err;
+
+	ffs_find_or_alloc(folio);
+
+	/* Inline data must have been converted before reaching here. */
+	if (WARN_ON_ONCE(f2fs_has_inline_data(inode)))
+		return -EINVAL;
+
+	while (f2fs_find_next_need_read_block(folio, ori_off, &need_off, len)) {
+		size_t off;
+
+		index = folio->index + (need_off >> PAGE_SHIFT);
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
+		/* Submit a synchronous read for this 4K subpage. */
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
+	}
+
+out:
+		if (get_dn)
+			f2fs_put_dnode(&dn);
+
+		return err;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3940,6 +4121,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	bool need_balance = false;
 	bool use_cow = false;
 	block_t blkaddr = NULL_ADDR;
+	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS;
 	int err = 0;
 
 	trace_f2fs_write_begin(inode, pos, len);
@@ -3987,9 +4169,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Do not use FGP_STABLE to avoid deadlock.
 	 * Will wait that below with our IO control.
 	 */
-	folio = f2fs_filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS,
-				mapping_gfp_mask(mapping));
+	fgp |= fgf_set_order(len);
+	folio = __filemap_get_folio(mapping, index, fgp,
+				    mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
 		goto fail;
@@ -4002,7 +4184,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	if (f2fs_is_atomic_file(inode))
 		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance, &use_cow);
-	else
+	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
 	if (err)
@@ -4023,6 +4205,14 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
+	if (folio_test_large(folio)) {
+		err = prepare_large_folio_write_begin(inode, mapping, folio,
+					pos, len);
+		if (!err)
+			return 0;
+		goto put_folio;
+	}
+
 	if (len == folio_size(folio) || folio_test_uptodate(folio))
 		return 0;
 
@@ -4076,15 +4266,19 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	trace_f2fs_write_end(inode, pos, len, copied);
 
 	/*
-	 * This should be come from len == PAGE_SIZE, and we expect copied
-	 * should be PAGE_SIZE. Otherwise, we treat it with zero copied and
-	 * let generic_perform_write() try to copy data again through copied=0.
+	 * If a short copy happens on a folio that isn't uptodate, we treat
+	 * it with zero copied and let generic_perform_write() try to copy
+	 * data again through copied=0.
 	 */
 	if (!folio_test_uptodate(folio)) {
-		if (unlikely(copied != len))
+		if (unlikely(copied != len)) {
 			copied = 0;
-		else
+		} else if (folio_test_large(folio)) {
+			ffs_mark_subrange_uptodate(folio,
+					offset_in_folio(folio, pos), len);
+		} else {
 			folio_mark_uptodate(folio);
+		}
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -4103,6 +4297,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!copied)
 		goto unlock_out;
 
+	if (folio_test_large(folio))
+		ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
+					copied);
 	folio_mark_dirty(folio);
 
 	if (f2fs_is_atomic_file(inode))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dd262eb41777..ac71d0d22a81 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4253,6 +4253,8 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
+bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
+void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 633e9ade654f..eb8e237f3dad 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5048,9 +5048,20 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
-	/* Do not preallocate blocks that will be written partially in 4KB. */
-	map.m_lblk = F2FS_BLK_ALIGN(pos);
-	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
+	if (mapping_large_folio_support(inode->i_mapping)) {
+		/*
+		 * Preallocate all blocks touched by a large-folio buffered write so
+		 * the regular write_begin path does not need to unlock the folio for
+		 * f2fs_balance_fs().  Rechecking large-folio state after unlock is
+		 * unreliable since partial truncation can split the folio.
+		 */
+		map.m_lblk = F2FS_BYTES_TO_BLK(pos);
+		map.m_len = F2FS_BLK_ALIGN(pos + count);
+	} else {
+		/* Do not preallocate blocks that will be written partially in 4KB. */
+		map.m_lblk = F2FS_BLK_ALIGN(pos);
+		map.m_len = F2FS_BYTES_TO_BLK(pos + count);
+	}
 	if (map.m_len > map.m_lblk)
 		map.m_len -= map.m_lblk;
 	else
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
