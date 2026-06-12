Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ogxTCpe9K2qPEAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B75106779D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=hOX3tExq;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=VBpKNwwr;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=I1zX4NOP;
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=nGGcCpWg;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pifQpljqSXXQqLAgDv36qVfTVICyvwjV2EBG2UQdZw=; b=hOX3tExqspuqqS0EJ1F5VoHcIk
	qN/t9mJyOl8Ggo6xQ9RD1XsN8JLyurIyp31sI8bv7Nx/TY//l9lEZBZ2zqarjzXbwktM3Kx0Awoh2
	celbf/g88Htq+J6az8raldatWp+0WNSv1G8iyetJuIOPPHmTW3gmlZwVvVtGBz3j83Lg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXwsL-0007v4-CY;
	Fri, 12 Jun 2026 08:04:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wXwsD-0007uo-1U
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QwokwhK7V5/uTVBy7p15UTto/ZM7an3qPE1otHkWh2U=; b=VBpKNwwrFBQ3CDgKveBw0ChmyR
 YCyX+pd6bUITslai2WWoMgZEqEt27xS6m0SNF91uqqFWM8UfbyAFDlud7y4zjxxs3EXFqDsp2Z0wo
 gSZ/geNHL/rOlcBEN27B0EtQlJyKKDYNFg8A1IUaRrsCgsf+a3wQIcWBVwbjxokFioB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QwokwhK7V5/uTVBy7p15UTto/ZM7an3qPE1otHkWh2U=; b=I1zX4NOPgYKUwXQr3j+sLlQk5o
 FBtDBa6YPIUssf8+6BS7Z6a6xI5reBP45BcFylaf2kNjYPGEc6EgMNeb2hAikueKNMoYX5AYHs0o4
 c8MQXBIRpU0tFA96SuAp+c47w0XNtdp1Gl4zadLhNG1a0XpZPrrzEpmSVgYq3trnJNGc=;
Received: from m16.mail.126.com ([117.135.210.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXwsA-0004Iv-Sn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Qw
 okwhK7V5/uTVBy7p15UTto/ZM7an3qPE1otHkWh2U=; b=nGGcCpWgk30PHcd8dp
 usCXXTEYqKGtx4MKiJHYrDDt2eJ/MvMra8qaf7Eaaq+9O2PXyiSLtxoDlYlOasSD
 B0+ysKEHBHessQxWXsS1sRvIwjE59f8e52RcQJ9ChJoMCW2wVgsun+Dkljf5bTUT
 Afk0rBdYkN9To2CWSF9yJqakg=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDX_ytWvStqyXqrBQ--.43664S6; 
 Fri, 12 Jun 2026 16:03:41 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jun 2026 16:03:29 +0800
Message-Id: <20260612080334.70657-5-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
References: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_ytWvStqyXqrBQ--.43664S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxKF1fuFyDJFW8uFy3uF4Uurg_yoW7tw1xpF
 WUK3s8KrWrJayfurn3XF1DZr1F934Iqa1UGayfGw1fZ3W5X3sxK3Wvyr1YkF1YqrZ7AF18
 Xa17tFyrWa18JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbnYwUUUUU=
X-Originating-IP: [223.104.43.40]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsR3ru2orvV2wqgAA3H
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Nanzhe <zhaonanzhe@xiaomi.com> ioctl can convert an
 inode with large folio support into an atomic file. Support large folio
 buffered
 writes for atomic files as well. Add a large folio atomic write_begin helper
 that reserves COW mappings for the write range. For partial head and tail
 subpages, read the existing data from either the COW inode or the original
 inode b [...] 
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wXwsA-0004Iv-Sn
Subject: [f2fs-dev] [RFC PATCH 4/9] f2fs: support atomic file large folios
 buffered write
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
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
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[lists.sourceforge.net:query timed out];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[xiaomi.com:query timed out,lists.sourceforge.net:query timed out];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B75106779D9

From: Nanzhe <zhaonanzhe@xiaomi.com>

ioctl can convert an inode with large folio support into an atomic
file. Support large folio buffered writes for atomic files as well.

Add a large folio atomic write_begin helper that reserves COW mappings
for the write range. For partial head and tail subpages, read the
existing data from either the COW inode or the original inode before
marking the subpage uptodate.

Signed-off-by: Nanzhe <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 152 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f5b4974e6b3c..390b50eff260 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2635,6 +2635,144 @@ static bool f2fs_find_next_need_read_block(const struct folio *folio,
 	return false;
 }
 
+static int __find_data_block(struct inode *inode, pgoff_t index,
+				block_t *blk_addr);
+static int __reserve_data_block(struct inode *inode, pgoff_t index,
+				block_t *blk_addr, bool *node_changed);
+
+static int prepare_large_folio_atomic_write_begin(struct inode *inode,
+		struct address_space *mapping, struct folio *folio, loff_t pos,
+		unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
+	size_t ori_off = offset_in_folio(folio, pos);
+	size_t need_off = ori_off;
+	pgoff_t index;
+	int err = 0;
+	sector_t sector;
+	struct block_device *bdev;
+	struct bio *bio;
+	unsigned int orig_order;
+	bool need_balance = false;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+
+	ffs_find_or_alloc(folio);
+
+	/* Inline data must have been converted before reaching here. */
+	if (WARN_ON_ONCE(f2fs_has_inline_data(inode)))
+		return -EINVAL;
+
+	/* 1) Reserve COW blocks for all covered 4K subpages first. */
+	{
+		pgoff_t start_index = folio->index + (ori_off >> PAGE_SHIFT);
+		pgoff_t end_index = folio->index +
+			((ori_off + len - 1) >> PAGE_SHIFT);
+
+		for (index = start_index; index <= end_index; index++) {
+			block_t cow_blkaddr = NULL_ADDR;
+			bool node_changed = false;
+			int ret;
+
+			ret = __find_data_block(cow_inode, index, &cow_blkaddr);
+			if (ret)
+				return ret;
+			if (cow_blkaddr != NULL_ADDR)
+				continue;
+
+			ret = __reserve_data_block(cow_inode, index, &cow_blkaddr,
+						   &node_changed);
+			if (ret)
+				return ret;
+
+			inc_atomic_write_cnt(inode);
+			need_balance |= node_changed;
+		}
+	}
+
+	if (need_balance && !IS_NOQUOTA(inode) &&
+			has_not_enough_free_secs(sbi, 0, 0)) {
+		orig_order = folio_order(folio);
+		folio_unlock(folio);
+		f2fs_balance_fs(sbi, true);
+		folio_lock(folio);
+		if (unlikely(folio->mapping != mapping ||
+			     folio_order(folio) != orig_order))
+			return -EAGAIN;
+	}
+
+	if (folio_test_uptodate(folio) || len == folio_size(folio))
+		return 0;
+
+	/* Then read partial 4K subpages. */
+	while (f2fs_find_next_need_read_block(folio, ori_off, &need_off, len)) {
+		size_t off;
+		block_t cow_blkaddr = NULL_ADDR;
+		block_t ori_blkaddr = NULL_ADDR;
+		struct inode *read_inode = NULL;
+		block_t read_blkaddr = NULL_ADDR;
+
+		index = folio->index + (need_off >> PAGE_SHIFT);
+		off = offset_in_folio(folio, index << PAGE_SHIFT);
+
+		err = __find_data_block(cow_inode, index, &cow_blkaddr);
+		if (err)
+			return err;
+
+		if (__is_valid_data_blkaddr(cow_blkaddr)) {
+			if (!f2fs_is_valid_blkaddr(sbi, cow_blkaddr,
+					DATA_GENERIC_ENHANCE_READ))
+				return -EFSCORRUPTED;
+			read_inode = cow_inode;
+			read_blkaddr = cow_blkaddr;
+		} else if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE)) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			continue;
+		} else {
+			err = __find_data_block(inode, index, &ori_blkaddr);
+			if (err)
+				return err;
+
+			if (!__is_valid_data_blkaddr(ori_blkaddr)) {
+				folio_zero_segment(folio, off, off + PAGE_SIZE);
+				ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+				continue;
+			}
+
+			if (!f2fs_is_valid_blkaddr(sbi, ori_blkaddr,
+					DATA_GENERIC_ENHANCE_READ))
+				return -EFSCORRUPTED;
+			read_inode = inode;
+			read_blkaddr = ori_blkaddr;
+		}
+
+		/* Submit a synchronous read for this 4K subpage. */
+		f2fs_wait_on_block_writeback(read_inode, read_blkaddr);
+		bdev = f2fs_target_device(sbi, read_blkaddr, &sector);
+
+		bio = bio_alloc_bioset(bdev, 1, REQ_OP_READ | REQ_SYNC,
+				       GFP_NOIO, &f2fs_bioset);
+		bio->bi_iter.bi_sector = sector;
+		f2fs_set_bio_crypt_ctx(bio, read_inode, index, NULL, GFP_NOFS);
+
+		if (!bio_add_folio(bio, folio, PAGE_SIZE, off)) {
+			bio_put(bio);
+			return -EIO;
+		}
+
+		err = submit_bio_wait(bio);
+		bio_put(bio);
+		if (err)
+			return err;
+
+		ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+	}
+
+	return 0;
+}
+
 static int prepare_large_folio_write_begin(struct inode *inode,
 					  struct address_space *mapping,
 					  struct folio *folio, loff_t pos,
@@ -4181,7 +4319,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	*foliop = folio;
 
-	if (f2fs_is_atomic_file(inode))
+	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
 		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance, &use_cow);
 	else if (!folio_test_large(folio))
@@ -4206,10 +4344,18 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
 	if (folio_test_large(folio)) {
-		err = prepare_large_folio_write_begin(inode, mapping, folio,
-					pos, len);
+		if (f2fs_is_atomic_file(inode))
+			err = prepare_large_folio_atomic_write_begin(inode,
+					mapping, folio, pos, len);
+		else
+			err = prepare_large_folio_write_begin(inode, mapping,
+					folio, pos, len);
 		if (!err)
 			return 0;
+		if (err == -EAGAIN) {
+			f2fs_folio_put(folio, true);
+			goto repeat;
+		}
 		goto put_folio;
 	}
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
