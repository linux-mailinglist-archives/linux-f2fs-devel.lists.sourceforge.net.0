Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F578EAB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 17:04:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs7Ca-0003Fc-EO; Mon, 29 Jul 2019 15:04:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hs7CZ-0003FV-A7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 15:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UAZx6nftTql1aqEdgqnyC1ff8Z/VwXfneWHWV9A/U2o=; b=STnYBpKWMJ2vJYj/Z/3wERzrVA
 1yijkE2mCO/Hd9YCeB5IcyA89gk5aR7xDQJqvDIu4att302pjgXfDSQeoYkHiH8+moIlju9aRh292
 rPeE42KVPUcVQELyt4dOnXERafQEqaN2Knxerqlf3HH/DsZoNd4oCAgvos9k5IvENlcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UAZx6nftTql1aqEdgqnyC1ff8Z/VwXfneWHWV9A/U2o=; b=e
 DUO+gYN50sB6jybZcKXSetBSFBtv+VyFqQNt2fk7CTv0Jhj7o+uUTsAOWInl6MBtdUzTvi+5ZxkCk
 Bq1tK7Xvcizdccr06xnaT80khy+s+/BmsNowopvZaEmOvIbJCKeJCYzENNgedKwpmM0jq8ZLt3mXU
 uUOuSnFo9WlKeT6g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs7CX-00EgMF-0P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 15:04:39 +0000
Received: from localhost.localdomain (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 481482067D;
 Mon, 29 Jul 2019 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564412671;
 bh=ZJaCH6/EG+GnwaN6bqP7F/RqkgpTASOAGcigZFAnIpA=;
 h=From:To:Cc:Subject:Date:From;
 b=g0MSFz+7OMkPIZ47mW81FpS9ruO3sSfKpaef/30p3Z6MGVRdKqFaraBrtSZq3Nhle
 Aep6OaQqNL6CZCAVhiTN0usFYDoVGDZiDgqNitz4eFgApTAZp2ApjiOFibdA4WtkMa
 Lt/DWlMfcMovyrZDTQalLLQnAQhkdrvOkr/XAw50=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 29 Jul 2019 23:03:51 +0800
Message-Id: <20190729150351.12223-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hs7CX-00EgMF-0P
Subject: [f2fs-dev] [PATCH v3 RESEND] f2fs: introduce sb.required_features
 to store incompatible features
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

From: Chao Yu <yuchao0@huawei.com>

Later after this patch was merged, all new incompatible feature's
bit should be added into sb.required_features field, and define new
feature function with F2FS_INCOMPAT_FEATURE_FUNCS() macro.

Then during mount, we will do sanity check with enabled features in
image, if there are features in sb.required_features that kernel can
not recognize, just fail the mount.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v3:
- change commit title.
- fix wrong macro name.
 fs/f2fs/f2fs.h          | 15 +++++++++++++++
 fs/f2fs/super.c         | 10 ++++++++++
 include/linux/f2fs_fs.h |  3 ++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a6eb828af57f..b8e17d4ddb8d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -163,6 +163,15 @@ struct f2fs_mount_info {
 #define F2FS_CLEAR_FEATURE(sbi, mask)					\
 	(sbi->raw_super->feature &= ~cpu_to_le32(mask))
 
+#define F2FS_INCOMPAT_FEATURES		0
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
index 5540fee0fe3f..3701dcce90e6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2513,6 +2513,16 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EINVAL;
 	}
 
+	/* check whether current kernel supports all features on image */
+	if (le32_to_cpu(raw_super->required_features) &
+			~F2FS_INCOMPAT_FEATURES) {
+		f2fs_info(sbi, "Unsupported feature: %x: supported: %x",
+			  le32_to_cpu(raw_super->required_features) ^
+			  F2FS_INCOMPAT_FEATURES,
+			  F2FS_INCOMPAT_FEATURES);
+		return -EINVAL;
+	}
+
 	/* Check checksum_offset and crc in superblock */
 	if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
 		crc_offset = le32_to_cpu(raw_super->checksum_offset);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index a2b36b2e286f..4141be3f219c 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -117,7 +117,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16	s_encoding;		/* Filename charset encoding */
 	__le16	s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__le32 required_features;       /* incompatible features to old kernel */
+	__u8 reserved[302];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
