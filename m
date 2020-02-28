Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED5173505
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2020 11:09:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7cZv-0007GT-Mb; Fri, 28 Feb 2020 10:09:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j7cZu-0007G3-Cd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Feb 2020 10:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0B+Yw3OTsMTEEPfWJ1OZyzZGDvPqHg+xDhYqhIr980=; b=MqzHInIPn1g5Of2ulptv38qDWz
 zezDxlGh7P2dY6NFG/Ad9GuDCWgaBaTgbE2P5HQNysC3maqGtxtGCIPBbg8HoPCjv00pfgM7O/xP/
 RzdhKVhnUTD39QraTBTUhftbcNSQsyXbm2t76W5Kp+KLvAYIiKLYIhJqRP0LH88FWZBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F0B+Yw3OTsMTEEPfWJ1OZyzZGDvPqHg+xDhYqhIr980=; b=F
 wGMxau6wUl3hbOUz+00XckfI5+8HkUPK9wkzfCh4pfnBuu8Y831Sw6kMZY+4H4NGz20Gie7l1F098
 BAB9B78Y2YPR3AZO2a6MwItiAQ/4At4P+aHYsNlQ6PSLDh21duITECWYCj+/N2j8SRZbutHi4F8Mq
 lnTExMslhBE7nMgk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7cZs-001Pcq-8R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Feb 2020 10:09:06 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 062DB507A3CF84CE4DC8;
 Fri, 28 Feb 2020 18:08:55 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 28 Feb 2020 18:08:47 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 28 Feb 2020 18:08:46 +0800
Message-ID: <20200228100846.4045-1-yuchao0@huawei.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7cZs-001Pcq-8R
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid use-after-free in
 f2fs_write_multi_pages()
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

In compress cluster, if physical block number is less than logic
page number, race condition will cause use-after-free issue as
described below:

- f2fs_write_compressed_pages
 - fio.page = cic->rpages[0];
 - f2fs_outplace_write_data
					- f2fs_compress_write_end_io
					 - kfree(cic->rpages);
					 - kfree(cic);
 - fio.page = cic->rpages[1];

f2fs_write_multi_pages+0xfd0/0x1a98
f2fs_write_data_pages+0x74c/0xb5c
do_writepages+0x64/0x108
__writeback_single_inode+0xdc/0x4b8
writeback_sb_inodes+0x4d0/0xa68
__writeback_inodes_wb+0x88/0x178
wb_writeback+0x1f0/0x424
wb_workfn+0x2f4/0x574
process_one_work+0x210/0x48c
worker_thread+0x2e8/0x44c
kthread+0x110/0x120
ret_from_fork+0x10/0x18

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 914b71b0071c..57f6306f2cd5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1008,7 +1008,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		block_t blkaddr;
 
 		blkaddr = f2fs_data_blkaddr(&dn);
-		fio.page = cic->rpages[i];
+		fio.page = cc->rpages[i];
 		fio.old_blkaddr = blkaddr;
 
 		/* cluster header */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
