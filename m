Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6420ECB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 06:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jq82N-0000CD-9X; Tue, 30 Jun 2020 04:38:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jiayang5@huawei.com>) id 1jq82F-0000Bw-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 04:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NR2qk0twr2Vc1nAEAsEheg2I2j47pTPs5qkDdZwyuX0=; b=A8qFm+lZIvAucEqX1GBE7JRxrL
 8PXBkxjeW1o0rDoewOttu2Ter6XeKG8rdhzwpkpxz2SN+mew9L/JlkjSGcsq7q++SzANkTzOTd0aw
 zbCdj1W4BnxkfrDacH9iycPnSmJMVwgwVf9BQfkE7R2h2RsMVx9qdUbB9r5QXDl/mP84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NR2qk0twr2Vc1nAEAsEheg2I2j47pTPs5qkDdZwyuX0=; b=S
 wo2HS/wWs+jDrWtaereLQs6kydIBSGU8j56j3w5JBZejVTNqbqZok8EbLZYuSo7h8uweQvgEeEiJ8
 fS9NCA06nor+zaxIc/SU3tOKbbrqz5bfvbR5+TiWBCa+HqHRThFtSnhqiYB+0snasmEOWCdOZBu2F
 4TMa2f2N/TMVlL68=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jq82C-002dLW-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 04:38:19 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 986CA7D719F257598023;
 Tue, 30 Jun 2020 12:38:05 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 12:38:01 +0800
From: Jia Yang <jiayang5@huawei.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Tue, 30 Jun 2020 12:45:04 +0800
Message-ID: <20200630044504.24148-1-jiayang5@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jq82C-002dLW-Qi
Subject: [f2fs-dev] [PATCH] f2fs: remove unused parameter in
 f2fs_get_read_data_page()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The parameter "op_flags" is not used in f2fs_get_read_data_page(),
so it can be removed.

Signed-off-by: Jia Yang <jiayang5@huawei.com>
---
 fs/f2fs/data.c | 6 +++---
 fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/gc.c   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 326c63879ddc..f1b85185e9df 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1157,7 +1157,7 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 }
 
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
-						int op_flags, bool for_write)
+						bool for_write)
 {
 	struct address_space *mapping = inode->i_mapping;
 	struct dnode_of_data dn;
@@ -1237,7 +1237,7 @@ struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index)
 		return page;
 	f2fs_put_page(page, 0);
 
-	page = f2fs_get_read_data_page(inode, index, 0, false);
+	page = f2fs_get_read_data_page(inode, index, false);
 	if (IS_ERR(page))
 		return page;
 
@@ -1263,7 +1263,7 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 	struct address_space *mapping = inode->i_mapping;
 	struct page *page;
 repeat:
-	page = f2fs_get_read_data_page(inode, index, 0, for_write);
+	page = f2fs_get_read_data_page(inode, index, for_write);
 	if (IS_ERR(page))
 		return page;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..41ef50714a39 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3441,7 +3441,7 @@ int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
-			int op_flags, bool for_write);
+			bool for_write);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
 struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 			bool for_write);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b95d5a146eb..487f75d9136c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1094,7 +1094,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			}
 
 			data_page = f2fs_get_read_data_page(inode,
-						start_bidx, REQ_RAHEAD, true);
+						start_bidx, true);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 			if (IS_ERR(data_page)) {
 				iput(inode);
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
