Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40C7C291
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 15:01:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsoEG-0001JK-CP; Wed, 31 Jul 2019 13:01:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hsoEF-0001JC-64
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 13:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrAI0KJlJgHFd3p9cHQwqtCz6pl7UqBU4V70QG/S6io=; b=S1de547NWIe2pdNUJb7ylcNHok
 +F5e7Cj+bY87djC6TGiuNaiII+2S/Jfjw+OVzn+PU8jB/zjfRblyFqy0bkMZHPQA1FRg/Q+v5N62D
 QLbNjAduODi/jv/nlN5SXIA9324nt6/vyn3vDaupAzlQ4XvKLjalOdqwR5GZecwJBgGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DrAI0KJlJgHFd3p9cHQwqtCz6pl7UqBU4V70QG/S6io=; b=L
 Y57/C5iGDIEVtOMKHVk4leq8e8aU0ubfIjQHAQjjS2ThSpTjx86MU9Th0hfHOuDyWlBllzUOglXaz
 uTVphuFu3vQjJc2Ymxl6BbBAuUhsusgdvph764eAfkofs2pgr/TJN8xphXkUzhTP7uAyVse5/3Dmh
 1d1ha4D4/B2IWJtc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsoEA-003E5c-Rw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 13:01:15 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 198CB6ED926F25143B5C;
 Wed, 31 Jul 2019 21:01:02 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Wed, 31 Jul 2019 21:00:52 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 31 Jul 2019 21:00:45 +0800
Message-ID: <20190731130045.55760-1-yuchao0@huawei.com>
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
X-Headers-End: 1hsoEA-003E5c-Rw
Subject: [f2fs-dev] [PATCH] sload.f2fs: fix to set temperature during sload
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

This patch enable to set file's temperature while loading files
to image.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/dir.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 include/f2fs_fs.h  |  1 +
 mkfs/f2fs_format.c |  2 +-
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index b3957d6..92d7e05 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -409,6 +409,55 @@ static void page_symlink(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 	free(data_blk);
 }
 
+static inline int is_extension_exist(const char *s,
+					const char *sub)
+{
+	unsigned int slen = strlen(s);
+	unsigned int  sublen = strlen(sub);
+	int i;
+
+	/*
+	 * filename format of multimedia file should be defined as:
+	 * "filename + '.' + extension + (optional: '.' + temp extension)".
+	 */
+	if (slen < sublen + 2)
+		return 0;
+
+	for (i = 1; i < slen - sublen; i++) {
+		if (s[i] != '.')
+			continue;
+		if (!strncasecmp(s + i + 1, sub, sublen))
+			return 1;
+	}
+
+	return 0;
+}
+
+static void set_file_temperature(struct f2fs_sb_info *sbi,
+				struct f2fs_node *node_blk,
+				const unsigned char *name)
+{
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	int i, cold_count, hot_count;
+
+	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
+	hot_count = sbi->raw_super->hot_ext_count;
+
+	for (i = 0; i < cold_count + hot_count; i++) {
+		if (is_extension_exist((const char *)name,
+					(const char *)extlist[i]))
+			break;
+	}
+
+	if (i == cold_count + hot_count)
+		return;
+
+	if (i < cold_count)
+		node_blk->i.i_advise |= FADVISE_COLD_BIT;
+	else
+		node_blk->i.i_advise |= FADVISE_HOT_BIT;
+}
+
 static void init_inode_block(struct f2fs_sb_info *sbi,
 		struct f2fs_node *node_blk, struct dentry *de)
 {
@@ -467,6 +516,8 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 		node_blk->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
 	}
 
+	set_file_temperature(sbi, node_blk, de->name);
+
 	node_blk->footer.ino = cpu_to_le32(de->ino);
 	node_blk->footer.nid = cpu_to_le32(de->ino);
 	node_blk->footer.flag = 0;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 9f7717e..2dda901 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -550,6 +550,7 @@ enum {
 #define F2FS_MAX_LOG_SECTOR_SIZE	12	/* 12 bits for 4096 bytes */
 #define F2FS_BLKSIZE			4096	/* support only 4KB block */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
+#define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
 
 #define NULL_ADDR		0x0U
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index c9c4fe5..9402619 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -146,7 +146,7 @@ static void cure_extension_list(void)
 		ue = strtok(ext_str, ", ");
 		while (ue != NULL) {
 			name_len = strlen(ue);
-			if (name_len >= 8) {
+			if (name_len >= F2FS_EXTENSION_LEN) {
 				MSG(0, "\tWarn: Extension name (%s) is too long\n", ue);
 				goto next;
 			}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
