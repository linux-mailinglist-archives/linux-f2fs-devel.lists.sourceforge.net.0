Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id syIZJzReOWrRrAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 18:09:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F86B0FED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 18:09:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="F7/IRVFe";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QzLd+P3I;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Sk9NP2ij;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=inpE3JzZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWFlS5k3tetmFP4FBasPwA2xKlzUbMO6BcoFt4QN3Ic=; b=F7/IRVFep1R8mkvbQgB6N+j8o4
	090jBlgEEKT+7IuCUiArmStg/73mKeIJrL/KYEdKxmYQZc+q2J2HVSxPmU7ZXiFtExgDfL0Fl7kRn
	hpq43qMH15EQ25EuxNfsIiRMYP3UoIl8b+Xf2OalkKpq6uvew6FD/FToGdK8ZAvowvyY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbhD6-0000Da-Bj;
	Mon, 22 Jun 2026 16:09:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wbhD2-0000DB-Rd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 16:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWbwT+E6ANQVijybXzyr3N22CFHwYDnzDUQZux8eE1I=; b=QzLd+P3IvZDnIzkoQnysSAbyJG
 Dwq2C6epr/IVa/jiedmTc0HrWqEeua//eNKIQDYNpaiJRCda/kX5Uwhfuz341Pg+IakqCMX7yIFZC
 U2guwNQJt+9C8gYfC4SX7HtpaFS7JxYd0W7Ne8ZAXpsXfKOO3uTGtZ4oX0dLNnrJ+2vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWbwT+E6ANQVijybXzyr3N22CFHwYDnzDUQZux8eE1I=; b=Sk9NP2ijqSBCtbroMTzltIiBz/
 o1ckDRmgoSQh85fVvp9lM2cuCMrJyBZVQ31K3KcdTAKfUbY/qC/WSzi+MmPKJCklu4c/Bm0JP+BXF
 MKTAUmwpj93RE8ovqHiVgRjgWjNZh0w0cAj/pwuDP6+/UKg7YRht7v2Rrtr57tQS1wDY=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbhD1-0001AW-5H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 16:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nW
 bwT+E6ANQVijybXzyr3N22CFHwYDnzDUQZux8eE1I=; b=inpE3JzZcuSSxNN5AK
 VV6oqckMUmcAMO1TAk/5FtuuQoKuPEJGNEI7qttd/swOkUXU1H2Dtd4qBlbo+VxQ
 k9krWAxLkMsFiJ8Yaa3J+Dv7CqSvT20icrPbiHmn+VciKpcBvFsMmexFtIPL96kt
 5LtR/MSJmK3uh7PpMddbRKwiM=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wAXfIP+XTlqz32SBw--.54996S9; 
 Tue, 23 Jun 2026 00:08:42 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 23 Jun 2026 00:08:27 +0800
Message-Id: <20260622160830.324455-8-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622160830.324455-1-zhaonanzhe@xiaomi.com>
References: <20260622160830.324455-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAXfIP+XTlqz32SBw--.54996S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxKr1rJw1UWF4UXw1Utr48Crg_yoWDGFWrpF
 WUGasxtrWDXr17Wrn7XFn5Zr1Fk34Iqr48CFWxG34fJ3WYqwn5KF1kta4YyF4ftry8AFna
 qF4Uta45WF1UJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UqNtsUUUUU=
X-Originating-IP: [39.144.78.181]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowqCUmo5Xgq7sAAA31
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  GC can operate on a 4K block that is cached inside a large
 folio. The data lookup helpers therefore need to test and update uptodate
 state for the addressed subpage instead of rejecting large folios o [...]
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [39.144.78.181 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1wbhD1-0001AW-5H
Subject: [f2fs-dev] [RFC PATCH v2 07/10] f2fs: make GC migration large-folio
 aware
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
X-Rspamd-Queue-Id: 821F86B0FED

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

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 93 ++++++++++++++++++++++++++++++++++++--------------
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/gc.c   | 30 ++++++++++++++--
 3 files changed, 97 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c37800befa1e..a53fe68640d9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1239,19 +1239,31 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode,
 
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
@@ -1363,20 +1375,13 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1411,7 +1416,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1424,15 +1429,17 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1449,7 +1456,7 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 	folio = f2fs_filemap_get_folio(mapping, index, FGP_ACCESSED, 0);
 	if (IS_ERR(folio))
 		goto read;
-	if (folio_test_uptodate(folio))
+	if (ffs_test_blk_uptodate(folio, index))
 		return folio;
 	f2fs_folio_put(folio, false);
 
@@ -1458,11 +1465,11 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
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
@@ -1486,7 +1493,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+	if (unlikely(folio->mapping != mapping ||
+				!ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2638,6 +2646,24 @@ static void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
@@ -2673,6 +2699,23 @@ static bool __ffs_clear_subrange_dirty(struct folio *folio,
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
 void ffs_clear_subrange_dirty(struct folio *folio, size_t offset, size_t len)
 {
 	struct f2fs_folio_state *ffs;
@@ -4862,7 +4905,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		 */
 		f2fs_submit_page_read(inode,
 				      NULL, /* can't write to fsverity files */
-				      folio, blkaddr, 0, true);
+				      folio, index, blkaddr, 0, true);
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1d2e40a42263..38680b729359 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4257,6 +4257,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				int compr_blocks, bool allow_balance);
 bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio);
+bool ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
 bool ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					size_t len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ffaa7ba76a1b..3c0e9009e02d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1510,12 +1510,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
@@ -1530,6 +1537,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
+		if (large)
+			ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 	} else {
@@ -1542,32 +1551,49 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
