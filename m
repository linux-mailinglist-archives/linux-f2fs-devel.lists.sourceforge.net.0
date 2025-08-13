Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF3B24596
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wFqQ7TlrElne79dzb3dJyRg8YSPO1DM2txKQBgKNe4=; b=RwDktLtKa1yUAPhjlLo3HylyZr
	eCbsUm/Fb7IjOlbR24L4d+hC2k+xwsxD4kHdZqWKZurlfKza/xqO3RRjaJx4eHFyD6UI9vjYzGGzq
	Fz7sfgwc2dckFYk8jXiMV1KuOqrc+BxQG7safeTBbuG+wl+KUrvq6JIGSASpv3mCt/QE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wf-00063H-Tw;
	Wed, 13 Aug 2025 09:38:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wd-000630-AJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=clmdLcSEz6kiQGDh8neFf8Tbchu5TMZjFVQqtnsQs3U=; b=gq+NZEraDCQ4YTP7Wn66VCtHzY
 QL3/gY20uil+oxBe2xn9U9JHWKww8xtv4247zPiwfAz+Tx9QXCfUMn7aUrJTFvm0Z6SmUReCIHCJN
 CRPWNbSvU9K6f7pnKfPtL6DpIFzXBIS6wLle2AcXF1E9mjAqei/5LUvH0s2biNiEfdg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=clmdLcSEz6kiQGDh8neFf8Tbchu5TMZjFVQqtnsQs3U=; b=PETsKWW5dSgnhqShO0zQYjGRiJ
 M9GAxCGz9oX4LugLRRQvNwmnGpMQxmRO2LbYka6GNfABHSdxDarQCsFbKfcdKOvluKE5oPmGoWtGh
 GsiKTFViO41XiJ/dDmsjveKnhiwTvZjmfhsGAOwuUG8Pl2cFMqzCMIhQy6YiVN+a1zZ0=;
Received: from m16.mail.126.com ([220.197.31.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wc-0004V9-CZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cl
 mdLcSEz6kiQGDh8neFf8Tbchu5TMZjFVQqtnsQs3U=; b=KTUeOmvwn7/NyzE1NS
 USaFoPyW+O6rMGSSVK/IWbTxQP8HX6ob6ATshI0uJd0LZz0wNNDUgL7Lkxpfhons
 c/DAATf7ptHrfXZQkswBWN8W/azbdOQ25FsV01ni9Ws9KdvVkONn+HCX8j+HMclE
 KCYtf6uUow/LcNbSgkfN/Kit0=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S8; 
 Wed, 13 Aug 2025 17:38:28 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:52 +0800
Message-Id: <20250813093755.47599-7-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4rXry8KF45Cw4fKF18uFg_yoWrArWkpF
 y5Kr4rGrs3Gr1fWw1ktFn8XF1Fk347Gr4fGFs7Ga4Skayjg3s5KFn3Ka48XFyrtrZ3AFWk
 XF1SkFyUXF1UGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRPl1PUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiZAaoz2icUlqdGQAAs9
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since f2fs_io_info (hereafter fio) has been converted to use
 fio->folio and fio->page is deprecated, we must now track which sub-part
 of a folio is being submitted to a bio in order to support large f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.9 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wc-0004V9-CZ
Subject: [f2fs-dev] [RFC PATCH 6/9] f2fs: Extend f2fs_io_info to support
 sub-folio ranges
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since f2fs_io_info (hereafter fio) has been converted to use fio->folio
and fio->page is deprecated, we must now track which sub-part of a
folio is being submitted to a bio in order to support large folios.

To achieve this, we add `idx` and `cnt` fields to the fio struct.
`fio->idx` represents the offset (in pages) within the current folio
for this I/O operation, and `fio->cnt` represents the number of
contiguous blocks being processed.

With the introduction of these two fields, the existing `old_blkaddr`
and `new_blkaddr` fields in fio are reinterpreted. They now represent
the starting old and new block addresses corresponding to `fio->idx`.
Consequently, an fio no longer represents a single mapping from one
old_blkaddr to one new_blkaddr, but rather a range mapping from
[old_blkaddr, old_blkaddr + fio->cnt - 1] to
[new_blkaddr, new_blkaddr + fio->cnt - 1].

In bio submission paths, for cases where `fio->cnt` is not explicitly
initialized, we default it to 1 and `fio->idx` to 0. This ensures
backward compatibility with all existing f2fs logic that operates on
single pages.

Discussion: Now I don't know if it's better to store bytes-unit
logical file offset and LBA length instead of block-unit cnt and
page idx in fio if we are to support BLOCK_SIZE > PAGE_SIZE.
Suggestions are appreciated.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 16 ++++++++++------
 fs/f2fs/f2fs.h |  2 ++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a9dc2572bdc4..b7bef2a28c8e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -711,7 +711,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 
 	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
 			fio_folio->index, fio, GFP_NOIO);
-	bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
+	bio_add_folio_nofail(bio, data_folio,
+			     F2FS_BLK_TO_BYTES(fio->cnt ? fio->cnt : 1),
+			     fio->idx << PAGE_SHIFT);
 
 	if (fio->io_wbc && !is_read_io(fio->op))
 		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
@@ -1010,16 +1012,18 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		io->fio = *fio;
 	}
 
-	if (!bio_add_folio(io->bio, bio_folio, folio_size(bio_folio), 0)) {
+	if (!bio_add_folio(io->bio, bio_folio,
+			   F2FS_BLK_TO_BYTES(fio->cnt ? fio->cnt : 1),
+			   fio->idx << PAGE_SHIFT)) {
 		__submit_merged_bio(io);
 		goto alloc_new;
 	}
 
 	if (fio->io_wbc)
 		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
-				folio_size(fio->folio));
+					 F2FS_BLK_TO_BYTES(fio->cnt));
 
-	io->last_block_in_bio = fio->new_blkaddr;
+	io->last_block_in_bio = fio->new_blkaddr + fio->cnt - 1;
 
 	trace_f2fs_submit_folio_write(fio->folio, fio);
 #ifdef CONFIG_BLK_DEV_ZONED
@@ -2675,7 +2679,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
+	    f2fs_lookup_read_extent_cache_block(inode, folio->index + fio->idx,
 						&fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE))
@@ -2690,7 +2694,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi))
 		return -EAGAIN;
 
-	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, folio->index + fio->idx, LOOKUP_NODE);
 	if (err)
 		goto out;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f88be53174b..c6b23fa63588 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1281,6 +1281,8 @@ struct f2fs_io_info {
 	blk_opf_t op_flags;	/* req_flag_bits */
 	block_t new_blkaddr;	/* new block address to be written */
 	block_t old_blkaddr;	/* old block address before Cow */
+	pgoff_t idx; /*start page index within current active folio in this fio*/
+	unsigned int cnt; /*block cnts of the active folio, we assume they are continuous.*/
 	union {
 		struct page *page;	/* page to be written */
 		struct folio *folio;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
