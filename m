Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB85789DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 12:53:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs3HG-0004FP-JX; Mon, 29 Jul 2019 10:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hs3HC-0004FE-TU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 10:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ad7DSFOmtEUUKlkC0J5CIbIsJJwWVRQ3UQ3zWOymIAM=; b=TQkOsmE/040YkMmFAe280ed/ac
 MmOySAya0mruz9ouNh5CDqrUJRcKVQ4h5c5cyBL2MvG0GPYLcev9HsFJe0/DDWzdAjyWEvC95biM0
 InKMYBSWBTUlPR/PkHq23UpKWX5Sg6zQNUzb1qqRjFG1n0ioHKu0l6ubJotPT2bCjpxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ad7DSFOmtEUUKlkC0J5CIbIsJJwWVRQ3UQ3zWOymIAM=; b=B
 Dh+j3HtkzT98loH7x2XI2oXbASOaASNW8CsXtx8TOUzn/ekkjk54XLngdDlocneSG++lwa+aOQdz/
 Nz7EGVZaoLGOdROSL4MXjxW+N427P/ZLeGjulPDJh2Y3EUnWzvFr/nEckgnuYApWzf59+jHQ118Lu
 pdFnI2IhkOlpkUSs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs3H8-003HKb-Mw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 10:53:09 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6FA3D36A2727EA394098;
 Mon, 29 Jul 2019 18:52:57 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 29 Jul 2019 18:52:50 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 29 Jul 2019 18:52:43 +0800
Message-ID: <20190729105243.110833-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hs3H8-003HKb-Mw
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity with enabled features
 in image
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

Later after this patch was merged, all new incompatible feature's
bit should be added into sb.required_features field, and define new
feature function with F2FS_INCOMPAT_FEATURE_FUNCS() macro.

Then during mount, we will do sanity check with enabled features in
image, if there are features in sb.required_features that kernel can
not recognize, just fail the mount.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- add sb.required_features to store new incompatible feature's bit.
 fs/f2fs/f2fs.h          | 15 +++++++++++++++
 fs/f2fs/super.c         | 10 ++++++++++
 include/linux/f2fs_fs.h |  3 ++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 73e007dca3bb..9923902156f1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -163,6 +163,15 @@ struct f2fs_mount_info {
 #define F2FS_CLEAR_FEATURE(sbi, mask)					\
 	(sbi->raw_super->feature &= ~cpu_to_le32(mask))
 
+#define F2FS_INCOMPAT_FEATURE		0
+
+#define F2FS_HAS_INCOMPAT_FEATURE(sbi, mask)				\
+	((sbi->raw_super->required_features & cpu_to_le32(mask)) != 0)
+#define F2FS_SET_INCOMPAT_FEATURE(sbi, mask)				\
+	(sbi->raw_super->required_features |= cpu_to_le32(mask))
+#define F2FS_CLEAR_INCOMPAT_FEATURE(sbi, mask)				\
+	(sbi->raw_super->required_features &= ~cpu_to_le32(mask))
+
 /*
  * Default values for user and/or group using reserved blocks
  */
@@ -3585,6 +3594,12 @@ F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
 F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
 F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 
+#define F2FS_INCOMPAT_FEATURE_FUNCS(name, flagname) \
+static inline int f2fs_sb_has_##name(struct f2fs_sb_info *sbi) \
+{ \
+	return F2FS_HAS_INCOMPAT_FEATURE(sbi, F2FS_FEATURE_##flagname); \
+}
+
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 				    block_t blkaddr)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5540fee0fe3f..1ea24fce668e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2513,6 +2513,16 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EINVAL;
 	}
 
+	/* check whether current kernel supports all features on image */
+	if (le32_to_cpu(raw_super->required_features) &
+			~F2FS_INCOMPATIBLE_FEATURE) {
+		f2fs_info(sbi, "Unsupported feature: %x: supported: %x",
+			  le32_to_cpu(raw_super->required_features) ^
+			  F2FS_INCOMPATIBLE_FEATURE,
+			  F2FS_INCOMPATIBLE_FEATURE);
+		return -EINVAL;
+	}
+
 	/* Check checksum_offset and crc in superblock */
 	if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
 		crc_offset = le32_to_cpu(raw_super->checksum_offset);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 284738996028..a4bab287814f 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -117,7 +117,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__le32 required_features;	/* incompatible features to old kernel */
+	__u8 reserved[302];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
