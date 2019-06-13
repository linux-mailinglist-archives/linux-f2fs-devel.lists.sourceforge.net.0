Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9D433F7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 10:10:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbKoK-0005Fs-Oz; Thu, 13 Jun 2019 08:10:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbKoJ-0005Fl-Fb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 08:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sn4jy7dwu/tWuWrVHmeaawbJKfJXqgGdmkXsm1LTSBk=; b=PtOBP7Ns6599eMdnxEtARPlN9n
 Zffyv2qYTC31R2Y28o+qeIFThT8hpgBEcqJ/wKX7cmIYCJcjuLg4zn1z5HpUSd71RPlXb4smJSeP4
 15ds6UfZZ1/vtBYGLUnx1mscHH+xjBM3mK1/FoJ703s/677pWMIFwq51gPTn7ojF4Beg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Sn4jy7dwu/tWuWrVHmeaawbJKfJXqgGdmkXsm1LTSBk=; b=B
 nshhgQb0XKzmQ+hn0hputAn5wWXiaK/0SQWfThIQkXjZ4fDxDmystXjP3LU6C2HomtbqLxH1XirP3
 1ckpgHSMwW7faaCcGgD387r78mNwHPjHvGzxPFurWAzyelYiqUJqpPm+h0JPyaK1xxmXvOMnTmYdU
 DzHlM8jRFz8CuPUo=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbKoG-004jgN-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 08:10:13 +0000
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 8EB176B42D7818FE87F0;
 Thu, 13 Jun 2019 16:10:05 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 13 Jun 2019 16:10:05 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 13 Jun 2019 16:10:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 13 Jun 2019 16:09:03 +0800
Message-ID: <20190613080903.4828-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme755-chm.china.huawei.com (10.3.19.101) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbKoG-004jgN-IZ
Subject: [f2fs-dev] [PATCH] f2fs-tools: introduce get_checkpoint_version()
 for cleanup
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just cleanup, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index aecd0cd..8d5d5cf 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -780,6 +780,24 @@ static int verify_checksum_chksum(struct f2fs_checkpoint *cp)
 	return 0;
 }
 
+static void *get_checkpoint_version(block_t cp_addr)
+{
+	void *cp_page;
+
+	cp_page = malloc(PAGE_SIZE);
+	ASSERT(cp_page);
+
+	if (dev_read_block(cp_page, cp_addr) < 0)
+		ASSERT(0);
+
+	if (verify_checksum_chksum((struct f2fs_checkpoint *)cp_page))
+		goto out;
+	return cp_page;
+out:
+	free(cp_page);
+	return NULL;
+}
+
 void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 				unsigned long long *version)
 {
@@ -788,34 +806,23 @@ void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 	unsigned long long cur_version = 0, pre_version = 0;
 
 	/* Read the 1st cp block in this CP pack */
-	cp_page_1 = malloc(PAGE_SIZE);
-	ASSERT(cp_page_1);
-
-	if (dev_read_block(cp_page_1, cp_addr) < 0)
-		goto invalid_cp1;
+	cp_page_1 = get_checkpoint_version(cp_addr);
+	if (!cp_page_1)
+		return NULL;
 
 	cp = (struct f2fs_checkpoint *)cp_page_1;
-	if (verify_checksum_chksum(cp))
-		goto invalid_cp1;
-
 	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg)
 		goto invalid_cp1;
 
 	pre_version = get_cp(checkpoint_ver);
 
 	/* Read the 2nd cp block in this CP pack */
-	cp_page_2 = malloc(PAGE_SIZE);
-	ASSERT(cp_page_2);
-
 	cp_addr += get_cp(cp_pack_total_block_count) - 1;
-
-	if (dev_read_block(cp_page_2, cp_addr) < 0)
-		goto invalid_cp2;
+	cp_page_2 = get_checkpoint_version(cp_addr);
+	if (!cp_page_2)
+		goto invalid_cp1;
 
 	cp = (struct f2fs_checkpoint *)cp_page_2;
-	if (verify_checksum_chksum(cp))
-		goto invalid_cp2;
-
 	cur_version = get_cp(checkpoint_ver);
 
 	if (cur_version == pre_version) {
@@ -824,7 +831,6 @@ void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 		return cp_page_1;
 	}
 
-invalid_cp2:
 	free(cp_page_2);
 invalid_cp1:
 	free(cp_page_1);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
