Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA81213696
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 10:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrHFO-000542-7B; Fri, 03 Jul 2020 08:40:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jrHFM-00053T-DV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 08:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PnRefA6gvUxV5/0G38abwPT18JSJGtwkykrwqZe+JHs=; b=h4IWLhm2Qiyg3ihYwdjuDwN6Oq
 ZTVyNqz1d9ClvdHaBY6pPmgA4Dg2alfY3Ne0KNjGxyczQ5NxkBNf3JdIHaoIQJD/syrTGmSop/ZlP
 cSX+GxVl8G95NUfL2pWjHqHdQPmD08Zg9AmDYrsqW7gM9Wo0G2dXRBg0dW7tWC5EQfNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PnRefA6gvUxV5/0G38abwPT18JSJGtwkykrwqZe+JHs=; b=e
 hI4rQPaAaCrUHBKnfkIoBAj1KsI5Kxwxb2bSwMAS4ijfnbx3h0vUrUIguQvjWheARSWQYy7huc4Wh
 PR4o7nep4um9NDVrCBYEddTqPM2/hRWOwsLnFhzTnbE7l3wy6/xYli5f/zVVEqBDSZvbh1BW6+9Tj
 5MVjhN5dlYNpG+To=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jrHFK-00Bjp1-Qo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 08:40:36 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EC97FCB10AA7DF8419DD;
 Fri,  3 Jul 2020 16:40:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Jul 2020 16:40:18 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 3 Jul 2020 16:40:11 +0800
Message-ID: <20200703084011.42755-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrHFK-00Bjp1-Qo
Subject: [f2fs-dev] [PATCH] f2fs: fix to wait GCed compressed page writeback
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

like we did for encrypted page.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3ecf7d4d6d8..3a847bc36748 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1152,6 +1152,13 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		f2fs_set_compressed_page(cc->cpages[i], inode,
 					cc->rpages[i + 1]->index, cic);
 		fio.compressed_page = cc->cpages[i];
+
+		fio.old_blkaddr = data_blkaddr(dn.inode, dn.node_page,
+						dn.ofs_in_node + i + 1);
+
+		/* wait for GCed page writeback via META_MAPPING */
+		f2fs_wait_on_block_writeback(inode, fio.old_blkaddr);
+
 		if (fio.encrypted) {
 			fio.page = cc->rpages[i + 1];
 			err = f2fs_encrypt_one_page(&fio);
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
