Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL8qEAmLrWkA4QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 08 Mar 2026 15:43:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A2230BBE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 08 Mar 2026 15:43:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=du7wnqcwuBe2H7DP+kPryfQISd2za3krBpc47vlGe30=; b=Iz9WHhhLcRSdNZ7OB53ZLX8eM5
	3jvvZ71s3MbrIsFUScYRHAnKfbFT5R7GYWIWifiUsVYIzASv3USAwNDFzbh+XogXeaMAzqOur1+Uz
	wcJLzZiYBaN0ubzieEK8VP/Q7IZpeoXbHh7GCiTDk8B/GccrpKtCPXvamlcVyxpCEr6U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzFLW-0007pv-Q1;
	Sun, 08 Mar 2026 14:43:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vzFLU-0007pm-2M
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Mar 2026 14:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Yix+63PKa96i9/rcne8IF2DCXr88Xd00UcU9oo7CqU=; b=Y4lelqccvfNBeM69Kyg1JCLHYR
 eDva1dRlg+wnEhpa6gY+1oMSXAiPszEdzcgOGU5Qt086fZOO71kDOVFkQ5syRU755rWGy6ZRWHfGU
 TaoYQOKGBr9KqsFSNvivj3DzmIKgIbhLmt47l5kchXIYwwOOAhM4dWC3eMj4dBbvQk7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/Yix+63PKa96i9/rcne8IF2DCXr88Xd00UcU9oo7CqU=; b=M
 YWWBEQ5UatFulC5EF11j4dVdYu/+uVqQNPqY3yiTxcULgb1/tNcvFrLykRpFa2Mr40ojE70wTqy7a
 UX6ymLMhQvkI5on1zAgejLEGWqlXu5Lg3ocbewX3cnjc3KZosFlYAwqo6ai2TGjsQssnMUC6E6sNP
 6PcmXgWyhAu3e+o8=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzFLS-0003hL-HI for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Mar 2026 14:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772980982; bh=/Yix+63PKa96i9/rcne8IF2DCXr88Xd00UcU9oo7CqU=;
 h=From:Subject:Date:Message-ID;
 b=ZXSZ9s5JNQ8QoNGRkrP4s/4FbOOzXFtBlqImGLibuvYz97uE998Opmw8c1u6LJQzW
 rBnQjV8mdJp95cYbHNBjguXuoEQys8WaGHu4d22jYZ8cKT4qMBOvV91RUUQWIVwHwo
 VFRgxHswXiuY7HyZSZQQBIMgo+ywG+qDDLzYBPPQ=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69AD8AE800002FA4; Sun, 8 Mar 2026 22:42:51 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2643754456620
X-SMAIL-UIID: 85C23F4A466D43988CE769B341BA10E9-20260308-224251-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sun,  8 Mar 2026 22:40:15 +0800
Message-ID: <20260308144013.2340225-3-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang When f2fs_fiemap() is called with
 `fileinfo->fi_flags`
 containing the FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
 retrieving file mappings via filemap_write_and_wait(). However, th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.19 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vzFLS-0003hL-HI
Subject: [f2fs-dev] [PATCH v2] f2fs: fix inline data not being written to
 disk in writeback path
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 0C4A2230BBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vm:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,sina.com:mid]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
retrieving file mappings via filemap_write_and_wait(). However, there is
an issue where the file does not get mapped as expected. The following
scenario can occur:

root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
root@vm:/mnt/f2fs# xfs_io data.3k -c "fiemap -v 0 4096"
data.3k:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..5]:          0..5                 6 0x307

The root cause of this issue is that f2fs_write_single_data_page() only
calls f2fs_write_inline_data() to copy data from the data folio to the
inode folio, and it clears the dirty flag on the data folio. However, it
does not mark the data folio as writeback. When
__filemap_fdatawait_range() checks for folios with the writeback flag,
it returns early, causing f2fs_fiemap() to report that the file has no
mapping.

To fix this issue, the solution is to call f2fs_sync_node_pages() in
f2fs_inline_data_fiemap() when getting fiemap with FIEMAP_FLAG_SYNC
flags. This patch ensures that the inode folio is written back and the
writeback process completes before proceeding.

Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
- Call f2fs_sync_node_pages() in getting fiemap path rather than
writeback path.
---
 fs/f2fs/checkpoint.c |  1 +
 fs/f2fs/inline.c     | 25 +++++++++++++++++++++++++
 fs/f2fs/node.c       | 21 ++++++++++++++++-----
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6dd39b7de11a..c85276931c45 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1416,6 +1416,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_ALL,
 		.nr_to_write = LONG_MAX,
+		.range_cyclic = 1,
 	};
 	int err = 0, cnt = 0;
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 86d2abbb40ff..ab1e10b0f6a6 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -9,6 +9,7 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/fiemap.h>
+#include <linux/writeback.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -814,6 +815,30 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 	}
 
+	if (fieinfo->fi_flags & FIEMAP_FLAG_SYNC) {
+		struct writeback_control iwbc = {
+			.sync_mode = WB_SYNC_ALL,
+			.range_start = inode->i_ino << PAGE_SHIFT,
+			.range_end = inode->i_ino << PAGE_SHIFT,
+			.nr_to_write = 1,
+			.range_cyclic = 0,
+		};
+
+retry:
+		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
+		if (folio_test_dirty(ifolio)) {
+			f2fs_folio_put(ifolio, true);
+			err = f2fs_sync_node_pages(F2FS_I_SB(inode), &iwbc, true, FS_NODE_IO);
+			if (!err) {
+				ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+				if (IS_ERR(ifolio))
+					return PTR_ERR(ifolio);
+				goto retry;
+			}
+			return err;
+		}
+	}
+
 	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
 	if (start >= ilen)
 		goto out;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bbfa677ef46f..2fbfecaf3f7b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2083,7 +2083,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				struct writeback_control *wbc,
 				bool do_balance, enum iostat_type io_type)
 {
-	pgoff_t index;
+	pgoff_t index, wbc_index;
+	pgoff_t end, wbc_end;
 	struct folio_batch fbatch;
 	int step = 0;
 	int nwritten = 0;
@@ -2092,14 +2093,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 
 	folio_batch_init(&fbatch);
 
+	wbc_index = 0;
+	wbc_end = LONG_MAX;
+	if (!wbc->range_cyclic) {
+		wbc_index = wbc->range_start >> PAGE_SHIFT;
+		wbc_end = wbc->range_end >> PAGE_SHIFT;
+	}
 next_step:
-	index = 0;
+	index = wbc_index;
+	end = wbc_end;
 
-	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
-				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
-				&fbatch))) {
+	while (!done && (index <= end)) {
 		int i;
 
+		nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
+				&index, end, PAGECACHE_TAG_DIRTY,
+				&fbatch);
+		if (nr_folios == 0)
+			break;
 		for (i = 0; i < nr_folios; i++) {
 			struct folio *folio = fbatch.folios[i];
 			bool submitted = false;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
