Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5bFzB5a9K2qGEAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB66779D3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=A3Dbr7TW;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=lw3uoSLe;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=dD+guiY8;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=VtNpvTOa;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2TX3lfJaj7+KbRQ0Iwn35RBfyKBkkBEImq5PuVUo14=; b=A3Dbr7TWO8cu4HfwUi/2vSCbhi
	lZtmDhjW3mDXdQHZT4pJvn97Ad0VbIsbmPHZqROmDbhW1eeeY0ut1yH635u3WnYOcEiawD6iiaJ33
	/kV4jegmFaSmyzkAjGGXZtou7IpfUYrKf7cPpQsSAaBz9K7nrKzQmssgFP0PpfLIXvIA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXwsL-0003b6-09;
	Fri, 12 Jun 2026 08:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wXwsE-0003aG-Qn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N4+qY9JParM5ASfmG5cftP+K0R1tDhf5N4uBo8SU5X4=; b=lw3uoSLehCp6UCC76kXPyE/Tzo
 yPYDNaLuwfg3qX9ElETOgWmbVJ8XF7VlnJUx+trnAOc4b9EySKDyspygi3qFftawd2IgVAMCKXNEy
 UbohpBdZ+MMwLu3lIY0s+DFbqr56FHLtwyddjh/n8RhJS6lOuVImmPRA+CiSvfwT0CT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N4+qY9JParM5ASfmG5cftP+K0R1tDhf5N4uBo8SU5X4=; b=dD+guiY8nSyrkVnVAHFxirDEUZ
 WjK+gbfBAiFGx9ICSju3S4Ph7ji9UviVVFVX2SiPELnj46bR5ISgxa15td6kXIXK9ip1wVGkY2YcG
 HRAfHTrks4fb5gzhBXGovBDAXJAe3s0kyX78Z61xt8s+w5PyPoyARmyp/TJZM1nGX8+s=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXwsB-0004Iw-EX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=N4
 +qY9JParM5ASfmG5cftP+K0R1tDhf5N4uBo8SU5X4=; b=VtNpvTOaOSO1o4IsVq
 Wh8Weqqx5EBDGTdXlUnpg4iwOxHvDy8t7kmxuFw6GkX685HxKAZnQi/SZIS2qSqM
 G6hbssP9imN8yzD5trTYuexg+HmexL57jseAHDiCOqs9uQXuLjwdSyoknH6aYjpd
 /E8qArX7jrW12zoOFfauxtT+Y=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDX_ytWvStqyXqrBQ--.43664S9; 
 Fri, 12 Jun 2026 16:03:45 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jun 2026 16:03:32 +0800
Message-Id: <20260612080334.70657-8-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
References: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_ytWvStqyXqrBQ--.43664S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Zw1rKr1Dur1Dur4rtrWDJwb_yoWDArW5pF
 WUGasxtrWkJr47Wrn7XF1kZr1rK34Iqr48CayxG34fAa4Yqwn5KF1kta4YyF4ftry8AFna
 qF4Ut3W5WF1UJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6E_iUUUUU=
X-Originating-IP: [223.104.43.40]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQHsvGorvWGw-AAA3x
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nanzhe <zhaonanzhe@xiaomi.com> GC can operate on a 4K
 block that is cached inside a large folio. The data lookup helpers therefore
 need to test and update uptodate state for the addressed subpage instead
 of rejecting large folios o [...] 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [223.104.43.40 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1wXwsB-0004Iw-EX
Subject: [f2fs-dev] [RFC PATCH 7/9] f2fs: make GC migration large-folio aware
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[lists.sourceforge.net:query timed out];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[xiaomi.com:query timed out,lists.sourceforge.net:query timed out];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19CB66779D3

From: Nanzhe <zhaonanzhe@xiaomi.com>

GC can operate on a 4K block that is cached inside a large folio.
The data lookup helpers therefore need to test and update uptodate
state for the addressed subpage instead of rejecting large folios or
treating the whole folio as the target block.

Let f2fs_get_read_data_folio(), f2fs_find_data_folio(), and
f2fs_get_lock_data_folio() to use subpage uptodate state. Submit
single-block reads at the requested folio offset and zero only the
addressed 4K range for NEW_ADDR.

Also update `move_data_page` to mark, clear, and restore dirty
state for the target subpage, and submit write I/O with the subpage
offset recorded in f2fs_io_info.

Signed-off-by: Nanzhe <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 93 ++++++++++++++++++++++++++++++++++++--------------
 fs/f2fs/f2fs.h |  3 ++
 fs/f2fs/gc.c   | 30 ++++++++++++++--
 3 files changed, 99 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 346057826835..033b28be2ae7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1211,19 +1211,31 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 
 /* This can handle encryption stuffs */
 static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
-				  struct folio *folio, block_t blkaddr,
-				  blk_opf_t op_flags, bool for_write)
+				  struct folio *folio, pgoff_t index,
+				  block_t blkaddr, blk_opf_t op_flags,
+				  bool for_write)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
+	size_t offset = 0;
 
-	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio->index,
+	if (folio_has_ffs(folio)) {
+		struct f2fs_folio_state *ffs = folio->private;
+		unsigned long flags;
+
+		offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);
+		spin_lock_irqsave(&ffs->state_lock, flags);
+		ffs->read_pages_pending++;
+		spin_unlock_irqrestore(&ffs->state_lock, flags);
+	}
+
+	bio = f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, index,
 				 for_write);
 
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
-	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
+	if (!bio_add_folio(bio, folio, PAGE_SIZE, offset))
 		f2fs_bug_on(sbi, 1);
 
 	inc_page_count(sbi, F2FS_RD_DATA);
@@ -1335,20 +1347,13 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	struct dnode_of_data dn;
 	struct folio *folio;
 	int err;
-retry:
+
 	folio = f2fs_grab_cache_folio(mapping, index, for_write);
 	if (IS_ERR(folio))
 		return folio;
 
-	if (folio_test_large(folio)) {
-		pgoff_t folio_index = mapping_align_index(mapping, index);
-
-		f2fs_folio_put(folio, true);
-		invalidate_inode_pages2_range(mapping, folio_index,
-				folio_index + folio_nr_pages(folio) - 1);
-		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
-		goto retry;
-	}
+	if (folio_test_large(folio))
+		ffs_find_or_alloc(folio);
 
 	if (f2fs_lookup_read_extent_cache_block(inode, index,
 						&dn.data_blkaddr)) {
@@ -1383,7 +1388,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1396,15 +1401,17 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	 * f2fs_init_inode_metadata.
 	 */
 	if (dn.data_blkaddr == NEW_ADDR) {
-		folio_zero_segment(folio, 0, folio_size(folio));
-		if (!folio_test_uptodate(folio))
-			folio_mark_uptodate(folio);
+		size_t offset = offset_in_folio(folio,
+						(loff_t)index << PAGE_SHIFT);
+
+		folio_zero_segment(folio, offset, offset + PAGE_SIZE);
+		ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE);
 		folio_unlock(folio);
 		return folio;
 	}
 
-	f2fs_submit_page_read(inode, f2fs_need_verity(inode, folio->index),
-			      folio, dn.data_blkaddr, op_flags, for_write);
+	f2fs_submit_page_read(inode, f2fs_need_verity(inode, index),
+			      folio, index, dn.data_blkaddr, op_flags, for_write);
 	return folio;
 
 put_err:
@@ -1421,7 +1428,7 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 	folio = f2fs_filemap_get_folio(mapping, index, FGP_ACCESSED, 0);
 	if (IS_ERR(folio))
 		goto read;
-	if (folio_test_uptodate(folio))
+	if (ffs_test_blk_uptodate(folio, index))
 		return folio;
 	f2fs_folio_put(folio, false);
 
@@ -1430,11 +1437,11 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 	if (IS_ERR(folio))
 		return folio;
 
-	if (folio_test_uptodate(folio))
+	if (ffs_test_blk_uptodate(folio, index))
 		return folio;
 
 	folio_wait_locked(folio);
-	if (unlikely(!folio_test_uptodate(folio))) {
+	if (unlikely(!ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, false);
 		return ERR_PTR(-EIO);
 	}
@@ -1458,7 +1465,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+	if (unlikely(folio->mapping != mapping ||
+				!ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2596,6 +2604,24 @@ void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len)
 		folio_mark_uptodate(folio);
 }
 
+bool ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
+{
+	struct f2fs_folio_state *ffs;
+	size_t offset;
+	unsigned int idx, nr_subpages;
+
+	if (!folio_has_ffs(folio))
+		return folio_test_dirty(folio);
+
+	ffs = folio->private;
+	offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);
+	idx = offset >> PAGE_SHIFT;
+	nr_subpages = folio_nr_pages(folio);
+	if (idx >= nr_subpages)
+		return false;
+	return test_bit(nr_subpages + idx, ffs->state);
+}
+
 void ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len)
 {
 	struct f2fs_folio_state *ffs;
@@ -2631,6 +2657,23 @@ static bool __ffs_clear_subrange_dirty(struct folio *folio,
 			2 * nr_subpages;
 }
 
+bool ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
+				      size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+	bool dirty;
+
+	if (!folio_has_ffs(folio))
+		return false;
+
+	ffs = folio->private;
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	dirty = __ffs_clear_subrange_dirty(folio, ffs, offset, len);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+	return dirty;
+}
+
 static void ffs_clear_subrange_dirty(struct folio *folio,
 				     size_t offset, size_t len)
 {
@@ -4767,7 +4810,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode :
 						inode,
 				      NULL, /* can't write to fsverity files */
-				      folio, blkaddr, 0, true);
+				      folio, index, blkaddr, 0, true);
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c9d0e9b41a91..e122e324c300 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4256,7 +4256,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
 struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio);
+bool ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
+bool ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
+					size_t len);
 void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 69e0a867219d..68dc10a987d9 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1514,12 +1514,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 						unsigned int segno, int off)
 {
 	struct folio *folio;
+	size_t foff = 0;
+	bool large = false;
 	int err = 0;
 
 	folio = f2fs_get_lock_data_folio(inode, bidx, true);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
+	if (folio_has_ffs(folio)) {
+		large = true;
+		foff = offset_in_folio(folio, (loff_t)bidx << PAGE_SHIFT);
+	}
+
 	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
 		err = -ENOENT;
 		goto out;
@@ -1534,6 +1541,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
+		if (large)
+			ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 	} else {
@@ -1546,32 +1555,49 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
 			.folio = folio,
+			.idx = bidx - folio->index,
+			.cnt = 1,
 			.encrypted_page = NULL,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
 		};
-		bool is_dirty = folio_test_dirty(folio);
+		struct f2fs_folio_state *ffs = NULL;
+		bool is_dirty = ffs_test_blk_dirty(folio, bidx);
 
 retry:
 		f2fs_folio_wait_writeback(folio, DATA, true, true);
 
+		if (large) {
+			ffs = folio->private;
+			ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
+		}
 		folio_mark_dirty(folio);
 		if (folio_clear_dirty_for_io(folio)) {
 			inode_dec_dirty_pages(inode);
 			f2fs_remove_dirty_inode(inode);
+			if (large &&
+			    ffs_clear_subrange_dirty_and_test(folio, foff, PAGE_SIZE))
+				folio_mark_dirty(folio);
 		}
 
+		if (large)
+			atomic_inc(&ffs->write_pages_pending);
 		folio_set_f2fs_gcing(folio);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
 			folio_clear_f2fs_gcing(folio);
+			if (large)
+				atomic_dec(&ffs->write_pages_pending);
 			if (err == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
 			}
-			if (is_dirty)
+			if (is_dirty) {
+				if (large)
+					ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 				folio_mark_dirty(folio);
+			}
 		}
 	}
 out:
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
