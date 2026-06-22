Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r1ZQJENeOWrdrAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 18:09:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95B6B101A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 18:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=kVAkNQv5;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=jyHnO8qX;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=SIESPgdb;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=XcWVQ6yk;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IC5pOLiLrCmCKPPFRlGpVpuD68G9SGXUMqBWxwFJ+R0=; b=kVAkNQv5x7IrYHVNPC4CDTqpWX
	+FC4qvyNgPh1sTediZImuUvnpKHRiE/V5xIPi1BR8cvM/TblZoCMK0ajMtvsCs059TnZoGIQYsBvl
	BgqiwR+ZTyoiy2d2+iptmEMM6gb0370o2YoPGCFxuZU6pAPERJEi13upYJ9fkdMVDs8Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbhDG-00057i-B1;
	Mon, 22 Jun 2026 16:09:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wbhDB-000575-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 16:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3obila+paB4K+COrsa60q3upg9fGQJI37YZui0Nn/Y=; b=jyHnO8qX1ZsnRysbsO3ndJOga7
 nAi/ack9qsMMwRlIX77/NiDPGQxZ4w03LhgXZWbhusqcr1mIezRaxI6NCiwayouPv9xkUIefCnLVB
 pG/x92WlqXgORxDD/nJoisLgGvPQeCH+YwEA7gnbENgmCve4pb9WXaKvTJ0UPqG276IA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d3obila+paB4K+COrsa60q3upg9fGQJI37YZui0Nn/Y=; b=SIESPgdb6dw5+EPF6UB0TgouDm
 bVtza3ToeYsjEmQI0uCT4bi7oCKDdOj85jS+GRgfe4kZnq/iVuwl0hNOrQaKsMRI04Ib4BE27Eyna
 XLfDOgxv5Q1kE3/q2RDkruweEoTPbAaahKME9dHzX+vyLrrRsN603B5+FEqxSgU9txBc=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbhD6-0001BF-Sp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 16:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=d3
 obila+paB4K+COrsa60q3upg9fGQJI37YZui0Nn/Y=; b=XcWVQ6ykn8bhlcAic/
 XUrvrISodB86ZHK/bc7jhkGL9ez+o0/i54RnnlPZgZyAFtOrH7sv1VoQCIgFM8eN
 083iwcM3amuihW2jk4f3lbl+PlVJhgpP3k+5M4SdXkYfSWL3C7pJpty0u7Gf3FPG
 RF3tH0mQlF84g+DiPhmpFcFCg=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wAXfIP+XTlqz32SBw--.54996S5; 
 Tue, 23 Jun 2026 00:08:36 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 23 Jun 2026 00:08:23 +0800
Message-Id: <20260622160830.324455-4-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622160830.324455-1-zhaonanzhe@xiaomi.com>
References: <20260622160830.324455-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXfIP+XTlqz32SBw--.54996S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3ZFWxZw1rJw4xKrW7tr1kZrb_yoWkKFW8pF
 WUK3s8KrW5AF17Wrn2qF1DZr1Sk3s2q3yUCayfGa4fA3W5t3s3Ka1kt34YgF4rtry8ZFyf
 XF4jyFyrWFWUJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFVbkUUUUU=
X-Originating-IP: [39.144.78.181]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowWBUWo5XgW7gQAA3E
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: To avoid the complexity of unlocking a large folio in
 write_begin, 
 preallocate partial blocks for inodes that can use large folios. During
 write_begin, 
 read only the partial head and tail 4K subpages [...] 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [39.144.78.181 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.8 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1wbhD6-0001BF-Sp
Subject: [f2fs-dev] [RFC PATCH v2 03/10] f2fs: support regular file buffered
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
Cc: Barry Song <baohua@kernel.org>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Pengfei Li <lipengfei28@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE95B6B101A

To avoid the complexity of unlocking a large folio in write_begin,
preallocate partial blocks for inodes that can use large folios.
During write_begin, read only the partial head and tail 4K subpages
that need read-before-write, and skip read I/O for the full middle
subpages covered by the write.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 284 +++++++++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h |   1 +
 fs/f2fs/file.c |  17 ++-
 3 files changed, 288 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9a2bb6d982df..ad24a0e2da5f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2575,6 +2575,139 @@ static void ffs_detach_free(struct folio *folio)
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
+	ffs = (struct f2fs_folio_state *)folio->private;
+	offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);
+	idx = offset >> PAGE_SHIFT;
+	return test_bit(idx, ffs->state);
+}
+
+static bool __ffs_mark_subrange_uptodate(struct folio *folio,
+		struct f2fs_folio_state *ffs, size_t offset, size_t len)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+	unsigned int start, end;
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	bitmap_set(ffs->state, start, end - start);
+	return bitmap_full(ffs->state, nr_subpages);
+}
+
+static void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
+				       size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+	bool mark_uptodate = false;
+
+	if (!folio_has_ffs(folio)) {
+		folio_mark_uptodate(folio);
+		return;
+	}
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	mark_uptodate = __ffs_mark_subrange_uptodate(folio, ffs, offset, len) &&
+			!ffs->read_pages_pending;
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+	if (mark_uptodate)
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
+	ffs = (struct f2fs_folio_state *)folio->private;
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
+static int f2fs_prealloc_large_folio_write_blocks(struct inode *inode,
+						  loff_t pos,
+						  unsigned int len)
+{
+	struct f2fs_map_blocks map;
+	block_t start = F2FS_BYTES_TO_BLK(pos);
+	block_t end = F2FS_BLK_ALIGN(pos + len);
+	int ret;
+
+	while (start < end) {
+		memset(&map, 0, sizeof(map));
+
+		map.m_lblk = start;
+		map.m_len = end - start;
+		map.m_seg_type = NO_CHECK_TYPE;
+
+		if (!IS_DEVICE_ALIASING(inode))
+			map.m_may_create = true;
+
+		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_AIO);
+		if (ret)
+			return ret;
+
+		if (!map.m_len)
+			return -ENODATA;
+
+		start += map.m_len;
+	}
+
+	return 0;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3966,6 +4099,105 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
+static int prepare_large_folio_write_begin(struct inode *inode,
+					  struct folio *folio, loff_t pos,
+					  unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_folio_state *ffs;
+	size_t ori_off = offset_in_folio(folio, pos);
+	size_t need_off = ori_off;
+	int err = 0;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+	if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL)) {
+		err = f2fs_prealloc_large_folio_write_blocks(inode, pos, len);
+		if (err)
+			return err;
+	}
+
+	if (folio_test_uptodate(folio) || len == folio_size(folio))
+		return 0;
+
+	ffs = ffs_find_or_alloc(folio);
+	if (!ffs)
+		return -ENOMEM;
+
+	/* Inline data must have been converted before reaching here. */
+	if (WARN_ON_ONCE(f2fs_has_inline_data(inode)))
+		return -EINVAL;
+
+	while (f2fs_find_next_need_read_block(folio, ori_off,
+					     &need_off, len)) {
+		struct dnode_of_data dn;
+		pgoff_t index = folio->index + (need_off >> PAGE_SHIFT);
+		size_t off = offset_in_folio(folio, index << PAGE_SHIFT);
+		block_t blkaddr;
+		bool get_dn = false;
+		sector_t sector;
+		struct block_device *bdev;
+		struct bio *bio;
+
+		if (!f2fs_lookup_read_extent_cache_block(inode, index,
+							&blkaddr)) {
+			if (IS_DEVICE_ALIASING(inode))
+				return -ENODATA;
+
+			set_new_dnode(&dn, inode, NULL, NULL, 0);
+			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+			if (err)
+				return err;
+			get_dn = true;
+			blkaddr = dn.data_blkaddr;
+		}
+
+		if (blkaddr == NULL_ADDR) {
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+
+		if (blkaddr == NEW_ADDR) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			goto out;
+		}
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+				DATA_GENERIC_ENHANCE_READ)) {
+			err = -EFSCORRUPTED;
+			goto out;
+		}
+
+		f2fs_wait_on_block_writeback(inode, blkaddr);
+		bdev = f2fs_target_device(sbi, blkaddr, &sector);
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
+out:
+		if (get_dn)
+			f2fs_put_dnode(&dn);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -3977,6 +4209,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
 	block_t blkaddr = NULL_ADDR;
+	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS;
 	int err = 0;
 
 	trace_f2fs_write_begin(inode, pos, len);
@@ -4024,9 +4257,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
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
@@ -4039,7 +4272,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	if (f2fs_is_atomic_file(inode))
 		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
-	else
+	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance);
 	if (err)
@@ -4060,6 +4293,14 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
+	if (folio_test_large(folio)) {
+		err = prepare_large_folio_write_begin(inode,
+					folio, pos, len);
+		if (!err)
+			return 0;
+		goto put_folio;
+	}
+
 	if (len == folio_size(folio) || folio_test_uptodate(folio))
 		return 0;
 
@@ -4120,15 +4361,19 @@ static int f2fs_write_end(const struct kiocb *iocb,
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
@@ -4147,6 +4392,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!copied)
 		goto unlock_out;
 
+	if (folio_test_large(folio))
+		ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
+					copied);
 	folio_mark_dirty(folio);
 
 	if (f2fs_is_atomic_file(inode))
@@ -4209,8 +4457,22 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
 
 	trace_f2fs_set_page_dirty(folio, DATA);
 
-	if (!folio_test_uptodate(folio))
-		folio_mark_uptodate(folio);
+	if (!folio_test_uptodate(folio)) {
+		bool uptodate = true;
+
+		if (folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs =
+				(struct f2fs_folio_state *)folio->private;
+			unsigned long flags;
+
+			spin_lock_irqsave(&ffs->state_lock, flags);
+			uptodate = bitmap_full(ffs->state, folio_nr_pages(folio)) &&
+				   !ffs->read_pages_pending;
+			spin_unlock_irqrestore(&ffs->state_lock, flags);
+		}
+		if (uptodate)
+			folio_mark_uptodate(folio);
+	}
 	BUG_ON(folio_test_swapcache(folio));
 
 	if (filemap_dirty_folio(mapping, folio)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4c2902abe499..2443fa3647d2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4255,6 +4255,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
+bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8acdd94272a0..1dddd4b04770 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5046,9 +5046,20 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
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
