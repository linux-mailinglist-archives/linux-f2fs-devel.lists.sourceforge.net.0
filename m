Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060D20C7EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 14:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpWSG-0006Os-5y; Sun, 28 Jun 2020 12:30:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpWSE-0006O6-6f
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 12:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=druS1IyrZPz3mcYs/zRsB+EUqWUopWStFSsTICn3/AA=; b=fLKRwd3ZSGA/RFZ7lLQuG5fuO0
 y7TgHqi7jKotsTSDakVaFBj+U5dHWn2r4O8T10v9syAsyMfc9PezCHP2msPti5JT6b/CK+6VvBRCG
 Y4ztAZu8NqEvX7cSznxlBlSl7fhYkSBJZxTD4bxU/r60wGoKE1LhClKo8cAEDBRfhlwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=druS1IyrZPz3mcYs/zRsB+EUqWUopWStFSsTICn3/AA=; b=N6MMhiQPmsIAA8VXtUEtyavf8B
 kzQ6ARvRp85H5ZN1sedboRkgrOAjE9VMusKgpNAouvK4r9we3ZfsxesNF8Zw7NCcKMNQp6eHuQmtV
 AJ5QDPgh6ZtrvL2wVdSrKTSepoL4kdVUo04+z4wrlcF+MocjpxnX88qOqpJ+FyayYsw8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpWS8-004RWS-KC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 12:30:34 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B6460FEF95BAB2B080D3;
 Sun, 28 Jun 2020 20:30:14 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 20:30:07 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sun, 28 Jun 2020 20:29:39 +0800
Message-ID: <20200628122940.29665-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628122940.29665-1-yuchao0@huawei.com>
References: <20200628122940.29665-1-yuchao0@huawei.com>
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
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpWS8-004RWS-KC
Subject: [f2fs-dev] [PATCH 2/3] f2fs: support to trace f2fs_bmap()
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

to show f2fs_bmap()'s result as below:

f2fs_bmap: dev = (251,0), ino = 7, lblock:0, pblock:396800

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c              | 14 +++++++++++---
 include/trace/events/f2fs.h | 27 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 91dc7b598961..c07a50e4d967 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3713,18 +3713,26 @@ static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
 static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 {
 	struct inode *inode = mapping->host;
+	struct buffer_head tmp = {
+		.b_size = i_blocksize(inode),
+	};
+	sector_t blknr = 0;
 
 	if (f2fs_has_inline_data(inode))
-		return 0;
+		goto out;
 
 	/* make sure allocating whole blocks */
 	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		filemap_write_and_wait(mapping);
 
 	if (f2fs_compressed_file(inode))
-		return f2fs_bmap_compress(inode, block);
+		blknr = f2fs_bmap_compress(inode, block);
 
-	return generic_block_bmap(mapping, block, get_data_block_bmap);
+	if (!get_data_block_bmap(inode, block, &tmp, 0))
+		blknr = tmp.b_blocknr;
+out:
+	trace_f2fs_bmap(inode, block, blknr);
+	return blknr;
 }
 
 #ifdef CONFIG_MIGRATION
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 8639ab962a71..3d844c51d283 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1891,6 +1891,33 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
 
+TRACE_EVENT(f2fs_bmap,
+
+	TP_PROTO(struct inode *inode, sector_t lblock, sector_t pblock),
+
+	TP_ARGS(inode, lblock, pblock),
+
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(ino_t, ino)
+		__field(sector_t, lblock)
+		__field(sector_t, pblock)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= inode->i_sb->s_dev;
+		__entry->ino		= inode->i_ino;
+		__entry->lblock		= lblock;
+		__entry->pblock		= pblock;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, lblock:%lld, pblock:%lld",
+		show_dev(__entry->dev),
+		__entry->ino,
+		(unsigned long long)__entry->lblock,
+		(unsigned long long)__entry->pblock)
+);
+
 #endif /* _TRACE_F2FS_H */
 
  /* This part must be outside protection */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
