Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD00A877D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2WW-0004OJ-V0; Fri, 09 Aug 2019 10:53:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2WV-0004OD-OX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CTIPIeup5Ed36K5X2rhXpYTlx2lTbWyCnEDDhMsb3cQ=; b=mEL5HUzKjAIZaZWqdIbHg2mKFq
 oqVx4tqGL4V/QHRMLaEM4YniQP6bNgccACIM4crW+aXjvox74othiARQjyh4/8LRi0ZCj/GVoFhAa
 nU5o9KYlb7yfmGm8eVnDoJ5VR63JbLMHswmxzYdGnmv002yN5yJ/XCPdJIkt4jyFx0eE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CTIPIeup5Ed36K5X2rhXpYTlx2lTbWyCnEDDhMsb3cQ=; b=h
 OwI/RMe+1YgfJpPUX9mlDbZ8of74Wemvay81ywkRjVRJd9+98ylBm/0OOFOATNUi/IU2+mSDQotg0
 llWuwJ/SJyLeeTO19LonInIPGhaAE9zrMtUdj6pxs6Sf2wpQcoVSpkcFzKpUSlRCThP0iDrWeC4oy
 lSl3BdMFMBGCGb7o=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WT-00GHCp-NN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C40C0F8C62AAF6F52EDD;
 Fri,  9 Aug 2019 18:53:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:53 +0800
Message-ID: <20190809105302.79876-1-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WT-00GHCp-NN
Subject: [f2fs-dev] [PATCH 01/10] f2fs-tools: fix potential deadloop
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

In error path of build_sit_info(), start variable is unsigned int type,
it should never be less than zero, fix it.

build_sit_info()
{
...
	unsigned int start;
...
free_validity_maps:
	for (--start ; start >= 0; --start)
		free(sit_i->sentries[start].cur_valid_map);
...
}

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index fd89b8e..f97c4ea 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1401,7 +1401,8 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 	struct sit_info *sit_i;
-	unsigned int sit_segs, start;
+	unsigned int sit_segs;
+	int start;
 	char *src_bitmap, *dst_bitmap;
 	unsigned int bitmap_size;
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
