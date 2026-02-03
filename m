Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADYwNWP6gWk7NQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 14:38:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78461D9FD2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 14:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz8pdaWMqMqHXdH7tnQqP7ieZocJp3IBIFHwj3m8338=; b=HrkS9h5veCPjR+lqOeJx7qa0lD
	4RS92XQ2U3aCThnaHPSL1goa4O22WoJ3KShksk+rvkvJiWRr94efPUrAXhePLiKlaS8IutBRbGpBz
	3uwngiyLLhEwY0KdjxtVxSQbifUSlm+FeTbiMSf01+5IraqN7Xwm+15bI7JECOObAeiM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnGc1-0004ad-18;
	Tue, 03 Feb 2026 13:38:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vnGbw-0004aT-1j
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 13:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=503khGFa53HM8Ifr+r9NZbSbjSyszAbK5hqusw1PE3c=; b=EM4clnzBWpr1XrVFdA/wD4k0LM
 MwMOcIlHabSPdCV0cRVjoUMBOzDM8RP2MDKkXbWROVfW5wUfrG8WODjJyfM59XTgp9hgV+7IGpDP4
 rTtHoLLu5eZ7S5cE8jSNkQXN9ILwINmXNuQMmhwtblwrpzmMpKMPxl5aa4+gzPKJTg68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=503khGFa53HM8Ifr+r9NZbSbjSyszAbK5hqusw1PE3c=; b=Yd16oi+t78JnFkhT9tGbw0Gr2J
 Qo/x4Jv67484cKB2oY2fYwt+zGe8/HtDKgJndSQIvgPPzOMnQOUiBWMBnHUUGXL0lw0HDb/j5Ul2r
 zqx58EIeYY3eY8audw9eGy7ZIbC9/dysU0UTx4yVryf/Qb2yKCkuwsF62e5nkSSuwZMw=;
Received: from r3-23.sinamail.sina.com.cn ([202.108.3.23])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnGbt-0004qg-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 13:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1770125910; bh=503khGFa53HM8Ifr+r9NZbSbjSyszAbK5hqusw1PE3c=;
 h=From:Subject:Date:Message-ID;
 b=BEPp/cdiSZyAUDmCqietzZxHZ5/8sdX5KzRxg7ClpmYN9JeXjnBGatmq6P9QkKMfC
 2qFkWNeAnbr0miDMWnaouVy5XGlW4Ra9fDr72EfFBWDgIZXE+kmHf3LrmyI2hCBtx5
 Q6K8uiXVztoFEj9YMzzGzGvEpzbxbDjCfvu7Qefo=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 6981FA4200001B4C; Tue, 3 Feb 2026 21:38:13 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 5808666816227
X-SMAIL-UIID: E6FA2628E805467EA2BEFBA6BBC93294-20260203-213813-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue,  3 Feb 2026 21:37:38 +0800
Message-ID: <20260203133635.3942502-6-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203133635.3942502-2-monty_pavel@sina.com>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.43.0
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vnGbt-0004qg-O8
Subject: [f2fs-dev] [PATCH 4/4] f2fs: fix inline data not being written to
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,sina.com:mid]
X-Rspamd-Queue-Id: 78461D9FD2
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

To fix this issue, the solution is to call f2fs_sync_node_pages() after
f2fs_write_inline_data() successfully returns, which will write back the
inode folio and wait for the writeback to complete.

Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/checkpoint.c |  1 +
 fs/f2fs/data.c       | 19 ++++++++++++++++++-
 fs/f2fs/node.c       | 21 ++++++++++++++++-----
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5172396c0b01..d0bca57854da 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1347,6 +1347,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_ALL,
 		.nr_to_write = LONG_MAX,
+		.range_cyclic = 1,
 	};
 	int err = 0, cnt = 0;
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eedadccf86bb..ccc5e4ddf547 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3126,8 +3126,25 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	err = -EAGAIN;
 	if (f2fs_has_inline_data(inode)) {
 		err = f2fs_write_inline_data(inode, folio);
-		if (!err)
+		if (!err) {
+			struct folio *ifolio;
+			struct writeback_control iwbc = {
+				.sync_mode = WB_SYNC_ALL,
+				.range_start = inode->i_ino << PAGE_SHIFT,
+				.range_end = inode->i_ino << PAGE_SHIFT,
+				.nr_to_write = 1,
+				.range_cyclic = 0,
+			};
+
+			if (!f2fs_sync_node_pages(sbi, &iwbc, true, FS_NODE_IO)) {
+				ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+				if (!IS_ERR(ifolio)) {
+					f2fs_folio_wait_writeback(ifolio, NODE, true, true);
+					f2fs_folio_put(ifolio, true);
+				}
+			}
 			goto out;
+		}
 	}
 
 	if (err == -EAGAIN) {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 74992fd9c9b6..47bff89bafe6 100644
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
