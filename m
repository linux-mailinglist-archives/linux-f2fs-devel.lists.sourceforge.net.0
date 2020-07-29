Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458C2316D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 02:39:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0a7i-000404-Vi; Wed, 29 Jul 2020 00:39:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1k0a7h-0003zv-8y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 00:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p08Vk1EVdSzKmz4iiOifsaruuo3Aka9Dx1cMGUhPNOo=; b=N0WUA8qEEerTY8Lf0etT7ohMb8
 ZQMmq/3KL+q3C1Ka/2gPOTuHK6eeL+sRBFzZuhFPEhs9zoEWdCxZ9J3tdpjD+fS74BD65+gFfeapu
 HqHMtJUk7rafN8hsBGiHYK8XATpFEPIQoF3crFY0QMqSjR+J8QLD/ouQkWeUT8/ypgZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p08Vk1EVdSzKmz4iiOifsaruuo3Aka9Dx1cMGUhPNOo=; b=A
 Ft2wJq0OsUNzMeBRYVUCjR/lJ/g9qrmf9JRY3z9dvA3xYkJN362ichRn2RyZI+s8CJloq7He9rMTY
 UM1xyHmT40RjAbdPG+bo1LSSRFtp8XBnlVcon5smC2Szr58MC02J9LFKQ2EbR0gW/baYvcJX36V5s
 PIymKk1nlS48tobE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0a7c-005b4Y-5J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 00:39:09 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A90F884C02907908A7BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jul 2020 08:38:48 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Jul 2020
 08:38:42 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 29 Jul 2020 09:29:01 +0800
Message-ID: <20200729012901.29151-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k0a7c-005b4Y-5J
Subject: [f2fs-dev] [PATCH v2] f2fs: use macro instead of f2fs verity version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Because fsverity_descriptor_location.version is constant,
so use macro for better reading.

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/verity.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 865c9fb774fb..9eb0dba851e8 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -29,6 +29,8 @@
 #include "f2fs.h"
 #include "xattr.h"

+#define F2FS_VERIFY_VER	(1)
+
 static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
 {
 	return round_up(inode->i_size, 65536);
@@ -152,7 +154,7 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
 	struct inode *inode = file_inode(filp);
 	u64 desc_pos = f2fs_verity_metadata_pos(inode) + merkle_tree_size;
 	struct fsverity_descriptor_location dloc = {
-		.version = cpu_to_le32(1),
+		.version = cpu_to_le32(F2FS_VERIFY_VER),
 		.size = cpu_to_le32(desc_size),
 		.pos = cpu_to_le64(desc_pos),
 	};
@@ -199,7 +201,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc), NULL);
 	if (res < 0 && res != -ERANGE)
 		return res;
-	if (res != sizeof(dloc) || dloc.version != cpu_to_le32(1)) {
+	if (res != sizeof(dloc) || dloc.version != cpu_to_le32(F2FS_VERIFY_VER)) {
 		f2fs_warn(F2FS_I_SB(inode), "unknown verity xattr format");
 		return -EINVAL;
 	}
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
