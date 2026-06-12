Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2TiZIJa9K2qLEAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB7E6779D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="I/3brW5w";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=K+Yzgt0O;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=dLt+xOXI;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=YBwPMYh1;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pewOOgrAhXVmzlVcaL8PqjH6CAtRYEvbyce3AHY7FCg=; b=I/3brW5wcOvFvsmIBNpVy55HJc
	60nHA6HvPmgKwmA76hMYfNsxR/lUYHX4OSYaN4c5/ayJvv5qo2a2WR86pMGJMulnrBTDYWIDIBA4M
	sG5vcPahRcJSrVixYR95zX8yqmwDA8ITFc4WpYL/2Pn2STtOZ4WjPlrIC8refY0CVXQE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXwsN-0000B6-3E;
	Fri, 12 Jun 2026 08:04:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wXwsH-0000Ak-2y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kmVQ1eWE/yf3KqBMbjptZunOX1kB5ALzRVGMLi/EY1M=; b=K+Yzgt0OZmnhLOhdy2y8uJG2X+
 4jwGNcL4bZXQiIpBtQYgQ4Zk84vBbd/FCK2Rb3PsBGz2sEXJJOZnED6OfucQhazriFcCy07RmrqZp
 jJ1lhbfLqgW42nFg0ZehPgFbY9R4EfOOjZPI1G/w8oBaG6C5BGWyQ5zQmxer6BJW4Al8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kmVQ1eWE/yf3KqBMbjptZunOX1kB5ALzRVGMLi/EY1M=; b=dLt+xOXIZkdjRcZ0Ui3P3sC58X
 cxLTHaPF23nrDNiTd0StcoQSnoPGNZg/EHPynU/fi4/kY0pccajwktBXIsGPflh+xv+w0lyKeyBOw
 PZUuMKx1f4v9I9ZOCqHbbOzEDlqM2Tab61lUO847XyH0wV77/ArpRNcwu2Ufrn2rGmWQ=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXwsE-0004J6-Qr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=km
 VQ1eWE/yf3KqBMbjptZunOX1kB5ALzRVGMLi/EY1M=; b=YBwPMYh1sBkxD0sxWP
 okMQuGGfErw+csPAlrLeeaEUvGbmb7MPC1HdpwdlFqj8/uiT4n3JjfvW3mw01RtE
 71sY9GEMWeWQq3gMBVXDoWOPPWTPXIR7aiUiP4MZogfvKPyNhSCTgwhzgzZgYK3T
 oedAVV+PDe1PPHo7c+FsOInGE=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDX_ytWvStqyXqrBQ--.43664S7; 
 Fri, 12 Jun 2026 16:03:42 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jun 2026 16:03:30 +0800
Message-Id: <20260612080334.70657-6-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
References: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_ytWvStqyXqrBQ--.43664S7
X-Coremail-Antispam: 1Uf129KBjvAXoW3KFW5WF13WFy3Kw1DXF1fJFb_yoW8JF47uo
 WfJw4qqr1rKr17ArWj9w12qFyUuws8AF95AF4furs8Z3ZrZ390gws7Kwn8Xw17Zr1Ykr1I
 9ryxK3W3JrWxAFn3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7qg4DUUUU
X-Originating-IP: [223.104.43.40]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoh-ru2orvV+YRQAA3T
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nanzhe <zhaonanzhe@xiaomi.com> Large folio can contain
 multiple dirty ranges. Add a folio-based writeback path for large-folio
 mapping
 files and keep the legacy f2fs_write_cache_pages() path unchanged for non
 large-folio mapping fi [...] 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [223.104.43.40 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1wXwsE-0004J6-Qr
Subject: [f2fs-dev] [RFC PATCH 5/9] f2fs: support large folio writeback
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
X-Rspamd-Queue-Id: 1BB7E6779D6

From: Nanzhe <zhaonanzhe@xiaomi.com>

Large folio can contain multiple dirty ranges.
Add a folio-based writeback path for large-folio mapping files
and keep the legacy f2fs_write_cache_pages() path unchanged for
non large-folio mapping files.

Signed-off-by: Nanzhe <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 400 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 394 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 390b50eff260..2de8c7963080 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -352,7 +352,9 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
+		unsigned int nr_pages = fi.length >> PAGE_SHIFT;
 		enum count_type type;
+		bool finished = true;
 
 		if (fscrypt_is_bounce_folio(folio)) {
 			struct folio *io_folio = folio;
@@ -362,7 +364,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (f2fs_is_compressed_page(folio)) {
+		if (!folio_test_large(folio) && f2fs_is_compressed_page(folio)) {
 			f2fs_compress_write_end_io(bio, folio);
 			continue;
 		}
@@ -383,11 +385,19 @@ static void f2fs_write_end_io(struct bio *bio)
 				folio->index, NODE_TYPE_REGULAR, true);
 			f2fs_bug_on(sbi, folio->index != nid_of_node(folio));
 		}
+		if (folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs = folio->private;
+
+			finished = atomic_sub_and_test(nr_pages,
+					&ffs->write_pages_pending);
+		}
+
+		while (nr_pages--)
+			dec_page_count(sbi, type);
+
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
-		dec_page_count(sbi, type);
-
 		/*
 		 * we should access sbi before folio_end_writeback() to
 		 * avoid racing w/ kill_f2fs_super()
@@ -396,8 +406,10 @@ static void f2fs_write_end_io(struct bio *bio)
 				wq_has_sleeper(&sbi->cp_wait))
 			wake_up(&sbi->cp_wait);
 
-		folio_clear_f2fs_gcing(folio);
-		folio_end_writeback(folio);
+		if (finished) {
+			folio_clear_f2fs_gcing(folio);
+			folio_end_writeback(folio);
+		}
 	}
 
 	bio_put(bio);
@@ -2605,6 +2617,87 @@ static void ffs_mark_subrange_dirty(struct folio *folio,
 	spin_unlock_irqrestore(&ffs->state_lock, flags);
 }
 
+static bool __ffs_clear_subrange_dirty(struct folio *folio,
+			struct f2fs_folio_state *ffs, size_t offset, size_t len)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+	unsigned int start, end;
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	bitmap_clear(ffs->state, nr_subpages + start, end - start);
+	return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) <
+			2 * nr_subpages;
+}
+
+static void ffs_clear_subrange_dirty(struct folio *folio,
+				     size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+
+	if (!folio_has_ffs(folio))
+		return;
+
+	ffs = folio->private;
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	__ffs_clear_subrange_dirty(folio, ffs, offset, len);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+}
+
+static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
+			const struct folio *folio, unsigned int start,
+			unsigned int end)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+
+	return find_next_bit(ffs->state, nr_subpages + end + 1,
+			nr_subpages + start) - nr_subpages;
+}
+
+static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state *ffs,
+			const struct folio *folio, unsigned int start,
+			unsigned int end)
+{
+	unsigned int nr_subpages = folio_nr_pages(folio);
+
+	return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
+			nr_subpages + start) - nr_subpages;
+}
+
+static unsigned int ffs_find_dirty_range(struct folio *folio,
+					  u64 *range_start, u64 range_end)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int start, end, nr_pages;
+
+	if (*range_start >= range_end)
+		return 0;
+
+	if (!folio_has_ffs(folio))
+		return range_end - *range_start;
+
+	ffs = folio->private;
+	start = offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
+	end = DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, range_end),
+					folio_size(folio)), PAGE_SIZE) - 1;
+
+	start = ffs_next_dirty_subpage(ffs, folio, start, end);
+	if (start > end)
+		return 0;
+
+	if (start == end)
+		nr_pages = 1;
+	else
+		nr_pages = ffs_next_clean_subpage(ffs, folio,
+				start + 1, end) - start;
+
+	*range_start = folio_pos(folio) + ((u64)start << PAGE_SHIFT);
+	return (u64)nr_pages << PAGE_SHIFT;
+}
+
 static bool f2fs_find_next_need_read_block(const struct folio *folio,
 					  size_t orig_off, size_t *need_off,
 					  size_t len)
@@ -3452,6 +3545,137 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	return err;
 }
 
+static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
+					struct writeback_control *wbc,
+					enum iostat_type io_type,
+					u64 start, u64 end)
+{
+	struct inode *inode = folio->mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	bool atomic_commit = f2fs_is_atomic_file(inode) &&
+				folio_test_f2fs_atomic(folio);
+	struct inode *dn_inode = atomic_commit ?
+				F2FS_I(inode)->cow_inode : inode;
+	u64 pos = folio_pos(folio);
+	pgoff_t start_idx = (start - pos) >> PAGE_SHIFT;
+	pgoff_t end_idx = (end - 1 - pos) >> PAGE_SHIFT;
+	int local_submitted = 0;
+	int err = 0;
+
+	for (pgoff_t i = start_idx; i <= end_idx; i++) {
+		struct dnode_of_data dn;
+		struct node_info ni;
+		pgoff_t data_idx = folio->index + i;
+		bool ipu_force = false;
+		struct f2fs_io_info fio = {
+			.sbi = sbi,
+			.ino = inode->i_ino,
+			.type = DATA,
+			.op = REQ_OP_WRITE,
+			.op_flags = wbc_to_write_flags(wbc),
+			.old_blkaddr = NULL_ADDR,
+			.folio = folio,
+			.idx = i,
+			.cnt = 1,
+			.encrypted_page = NULL,
+			.submitted = 0,
+			.need_lock = LOCK_DONE,
+			.meta_gc = f2fs_meta_inode_gc_required(inode) ? 1 : 0,
+			.io_type = io_type,
+			.io_wbc = wbc,
+		};
+
+		if (folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs = folio->private;
+
+			atomic_inc(&ffs->write_pages_pending);
+		}
+
+		set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
+
+		if (!atomic_commit && need_inplace_update(&fio) &&
+		    f2fs_lookup_read_extent_cache_block(inode, data_idx,
+							&fio.old_blkaddr)) {
+			if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
+						   DATA_GENERIC_ENHANCE)) {
+				err = -EFSCORRUPTED;
+				goto rollback;
+			}
+			ipu_force = true;
+			goto got_it;
+		}
+
+		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
+		if (err)
+			goto rollback;
+
+		fio.old_blkaddr = dn.data_blkaddr;
+
+got_it:
+		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
+		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
+					   DATA_GENERIC_ENHANCE)) {
+			err = -EFSCORRUPTED;
+			goto rollback;
+		}
+
+		if (fio.meta_gc)
+			f2fs_wait_on_block_writeback(inode, fio.old_blkaddr);
+
+		if (!atomic_commit && (ipu_force ||
+		    (__is_valid_data_blkaddr(fio.old_blkaddr) &&
+		     need_inplace_update(&fio)))) {
+			err = f2fs_encrypt_one_page(&fio);
+			if (err)
+				goto rollback;
+
+			f2fs_put_dnode(&dn);
+			err = f2fs_inplace_write_data(&fio);
+			if (err) {
+				if (fscrypt_inode_uses_fs_layer_crypto(inode))
+					fscrypt_finalize_bounce_page(
+							&fio.encrypted_page);
+				goto rollback_no_dnode;
+			}
+
+			local_submitted++;
+			set_inode_flag(inode, FI_UPDATE_WRITE);
+			continue;
+		}
+
+		err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
+		if (err)
+			goto rollback;
+
+		fio.version = ni.version;
+
+		err = f2fs_encrypt_one_page(&fio);
+		if (err)
+			goto rollback;
+
+		f2fs_outplace_write_data(&dn, &fio);
+		local_submitted++;
+		set_inode_flag(inode, FI_APPEND_WRITE);
+		trace_f2fs_do_write_data_page(folio, OPU);
+		f2fs_put_dnode(&dn);
+		continue;
+
+rollback:
+		f2fs_put_dnode(&dn);
+rollback_no_dnode:
+		if (folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs = folio->private;
+
+			atomic_dec(&ffs->write_pages_pending);
+		}
+		break;
+	}
+
+	if (submitted)
+		*submitted = local_submitted;
+	return err;
+}
+
 int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct bio **bio,
 				sector_t *last_block,
@@ -3900,6 +4124,167 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	return ret;
 }
 
+static int f2fs_write_cache_folios(struct address_space *mapping,
+				   struct writeback_control *wbc,
+				   enum iostat_type io_type)
+{
+	struct folio *folio = NULL;
+	struct inode *inode = mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_lock_context lc;
+	u64 pos = 0;
+	u64 end_pos = 0;
+	u32 r_len = 0;
+	int err = 0;
+	int submitted = 0;
+	int nwritten = 0;
+	bool op_locked = false;
+	bool next = false;
+	bool retry = false;
+
+	if (get_dirty_pages(inode) <= SM_I(sbi)->min_hot_blocks)
+		set_inode_flag(inode, FI_HOT_DATA);
+	else
+		clear_inode_flag(inode, FI_HOT_DATA);
+
+	while ((folio = writeback_iter(mapping, wbc, folio, &err))) {
+		struct f2fs_folio_state *ffs = NULL;
+		u64 isize;
+		size_t poff;
+		pgoff_t end_index;
+		bool verity_in_progress;
+		int folio_submitted = 0;
+		bool bias_added = false;
+
+		submitted = 0;
+		next = true;
+		retry = false;
+
+		if (atomic_read(&sbi->wb_sync_req[DATA]) &&
+		    wbc->sync_mode == WB_SYNC_NONE) {
+			folio_redirty_for_writepage(wbc, folio);
+			next = false;
+			goto retry_out;
+		}
+retry:
+		pos = folio_pos(folio);
+		end_pos = pos + folio_size(folio);
+		isize = i_size_read(inode);
+		verity_in_progress = f2fs_verity_in_progress(inode);
+		poff = 0;
+		end_index = 0;
+
+		if (retry) {
+			if (unlikely(folio->mapping != mapping))
+				goto retry_out;
+
+			if (!folio_test_dirty(folio))
+				goto retry_out;
+
+			if (folio_test_writeback(folio)) {
+				if (wbc->sync_mode == WB_SYNC_NONE)
+					goto retry_out;
+				f2fs_folio_wait_writeback(folio, DATA, true, true);
+			}
+
+			if (!folio_clear_dirty_for_io(folio))
+				goto retry_out;
+		}
+
+		/* To avoid dealing with the complexity for one subrange is in bio
+		 * while we trylock_op failed before writing another subrange.
+		 * Try to lock_op before any subrange write for the folio.
+		 */
+		if (!op_locked) {
+			if (!f2fs_trylock_op(sbi, &lc)) {
+				folio_redirty_for_writepage(wbc, folio);
+				err = 0;
+				if (wbc->sync_mode != WB_SYNC_ALL)
+					goto retry_out;
+
+				retry = true;
+				folio_unlock(folio);
+				f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+				folio_lock(folio);
+				goto retry;
+			}
+			op_locked = true;
+		}
+
+		if (!verity_in_progress) {
+			poff = offset_in_folio(folio, isize);
+			end_index = isize >> PAGE_SHIFT;
+
+			if (folio->index > end_index ||
+			    (folio->index == end_index && poff == 0))
+				goto out;
+
+			if (end_pos > isize) {
+				folio_zero_segment(folio, poff, folio_size(folio));
+				end_pos = isize;
+			}
+		}
+
+		folio_start_writeback(folio);
+
+		if (folio_test_large(folio)) {
+			ffs = ffs_find_or_alloc(folio);
+			ffs_mark_subrange_dirty(folio, 0, end_pos - pos);
+			if (!bias_added) {
+				/* Add a bias to prevent premature folio_end_writeabck() */
+				WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending) != 0);
+				atomic_inc(&ffs->write_pages_pending);
+				bias_added = true;
+			}
+		}
+
+		while ((r_len = ffs_find_dirty_range(folio, &pos, end_pos))) {
+			err = f2fs_write_single_data_folio(folio, &submitted,
+					wbc, io_type, pos, pos + r_len);
+			folio_submitted += submitted;
+			if (err)
+				goto out;
+
+			nwritten += submitted;
+			pos += r_len;
+		}
+
+		if (!err && folio_submitted &&
+		    f2fs_is_atomic_file(inode) &&
+		    folio_test_f2fs_atomic(folio))
+			folio_clear_f2fs_atomic(folio);
+
+out:
+		ffs_clear_subrange_dirty(folio, 0, folio_size(folio));
+		inode_dec_dirty_pages(inode);
+
+		if (bias_added) {
+			if (atomic_dec_and_test(&ffs->write_pages_pending))
+				folio_end_writeback(folio);
+		} else if (!folio_submitted && folio_test_writeback(folio)) {
+			folio_end_writeback(folio);
+		}
+
+retry_out:
+		if (folio_test_locked(folio))
+			folio_unlock(folio);
+
+		if (op_locked) {
+			f2fs_unlock_op(sbi, &lc);
+			op_locked = false;
+		}
+
+		if (err || !next)
+			break;
+	}
+
+	if (nwritten)
+		f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping->host,
+					       NULL, 0, DATA);
+
+	return err;
+}
+
 static inline bool __should_serialize_io(struct inode *inode,
 					struct writeback_control *wbc)
 {
@@ -3994,7 +4379,10 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	account_writeback(inode, true);
 
 	blk_start_plug(&plug);
-	ret = f2fs_write_cache_pages(mapping, wbc, io_type);
+	if (mapping_large_folio_support(inode->i_mapping))
+		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
+	else
+		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
 	blk_finish_plug(&plug);
 
 	account_writeback(inode, false);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
