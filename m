Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5E12A168
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Dec 2019 13:44:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ijjYT-0002E9-GS; Tue, 24 Dec 2019 12:44:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuehaibing@huawei.com>) id 1ijjYR-0002Dk-Kk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Dec 2019 12:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G0QdcOC6sj27syhjjWZsQNzIpnaNTx3E6nQX9GxnBAA=; b=UfvL3v/Mr/O9bYRImiRE8c73nG
 NIhdHcs1tNP1z4Vjd/GoSBjb4b6rj8XL6WLWJrx5bW10DHOwjkUm6Y4LjwsRaCm+5tWRt/E1owq5W
 92+YggnA86i8kfbKfOJC894PhtAiAVMm5Hs/GO7TUV2ZjO5arvj2TEbfsNo5KUVEm3qM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G0QdcOC6sj27syhjjWZsQNzIpnaNTx3E6nQX9GxnBAA=; b=G
 dz+nAt9Y62+qP36GJs+xud15V2Rj+4LfX5MSE+ZM3Zg2BF0iAb5w+HhUa3zm+egvzVP94QmXmJT4i
 5zeTsc6Z78ag2FWb2kQZPkQ7HzszMW7q/NtaTgygRR0wh5kk8B9dxc2MWz3+UA1jxukESegHTLKHt
 vuu1coL3yhmxjJx0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ijjYN-00EFRu-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Dec 2019 12:44:51 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5F26D71D9B931032672C;
 Tue, 24 Dec 2019 20:44:37 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
 20:44:29 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 24 Dec 2019 20:43:59 +0800
Message-ID: <20191224124359.15040-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
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
X-Headers-End: 1ijjYN-00EFRu-Sy
Subject: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fs/f2fs/segment.c: In function fix_curseg_write_pointer:
fs/f2fs/segment.c:4485:35: warning: variable cs_block set but not used [-Wunused-but-set-variable]

It is never used since commit 362d8a920384 ("f2fs: Check
write pointer consistency of open zones") , so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/f2fs/segment.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a951953..72cf257 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4482,14 +4482,13 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	struct f2fs_dev_info *zbd;
 	struct blk_zone zone;
 	unsigned int cs_section, wp_segno, wp_blkoff, wp_sector_off;
-	block_t cs_zone_block, wp_block, cs_block;
+	block_t cs_zone_block, wp_block;
 	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	sector_t zone_sector;
 	int err;
 
 	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
 	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
-	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
 
 	zbd = get_target_zoned_dev(sbi, cs_zone_block);
 	if (!zbd)
-- 
2.7.4




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
