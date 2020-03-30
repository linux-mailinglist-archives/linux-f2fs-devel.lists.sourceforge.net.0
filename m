Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1119778D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 11:14:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIqUb-00007T-KI; Mon, 30 Mar 2020 09:14:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jIqUa-00007L-DA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 09:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J1bb84blVews2v51CAiqdhMcALS2tYmgQsqEEmRYgE8=; b=m7A2ffwrgLqmni4pyU+14+ENeW
 08crgNcWPw0qWsChGfRiuJpKmyXOp8K/R7VG6oeLgbeY4PVBhu8nmZbUO4Yls4/t7r17HMrqr9To0
 MaF2LTl80Bkr9H74FCqEmV+xMRLjaZgSLr+J+A5Q1oT9g3/u/crzPWBrLVj7PUf/EZ2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J1bb84blVews2v51CAiqdhMcALS2tYmgQsqEEmRYgE8=; b=O
 Vqo+t4lrbYsD3HNtYazHum7snu5KL99culcFaCsj3xA6ozRX/sb0wOkNdNAY1Ooln6idJXDmlHhh1
 wvh/28+D7ybP7tDMiVz2xw70kgjHjARHsNWPTuddgab6+iOA8uiAEnRGUEszQYBWjh/1CwA8XKqYt
 PT+AqK2rfWBR21fA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jIqUY-001F7N-30
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 09:14:00 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ABE325328BAC93D9E736;
 Mon, 30 Mar 2020 17:13:44 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Mar 2020 17:13:37 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 30 Mar 2020 17:13:29 +0800
Message-ID: <20200330091329.46357-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jIqUY-001F7N-30
Subject: [f2fs-dev] [PATCH v3] f2fs: introduce f2fs_bmap_compress()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

to support bmap() on compressed inode: if queried block locates in
non-compressed cluster, return its physical block address.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v3:
- use round_down instead of rounddown to avoid compile error.
 fs/f2fs/data.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 24643680489b..2fcd70fd2cbb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3585,6 +3585,37 @@ static int f2fs_set_data_page_dirty(struct page *page)
 	return 0;
 }
 
+
+static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
+{
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	struct dnode_of_data dn;
+	sector_t start_idx, blknr = 0;
+	int ret;
+
+	start_idx = round_down(block, F2FS_I(inode)->i_cluster_size);
+
+	set_new_dnode(&dn, inode, NULL, NULL, 0);
+	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
+	if (ret)
+		return 0;
+
+	if (dn.data_blkaddr != COMPRESS_ADDR) {
+		dn.ofs_in_node += block - start_idx;
+		blknr = f2fs_data_blkaddr(&dn);
+		if (!__is_valid_data_blkaddr(blknr))
+			blknr = 0;
+	}
+
+	f2fs_put_dnode(&dn);
+
+	return blknr;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
+
 static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 {
 	struct inode *inode = mapping->host;
@@ -3596,6 +3627,9 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		filemap_write_and_wait(mapping);
 
+	if (f2fs_compressed_file(inode))
+		return f2fs_bmap_compress(inode, block);
+
 	return generic_block_bmap(mapping, block, get_data_block_bmap);
 }
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
