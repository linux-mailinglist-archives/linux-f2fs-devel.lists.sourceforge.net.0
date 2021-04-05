Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7036353C73
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Apr 2021 10:41:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lTKnh-0003CE-CX; Mon, 05 Apr 2021 08:41:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <qkrwngud825@gmail.com>) id 1lTKne-0003C0-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Apr 2021 08:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P3DY74ilax4cg/lfhIPyiy2oRVI64P7iXIHfAW0P3P0=; b=fjvONq/bh16U+VurbDQ8UMHzuW
 2ZCbFViLWLZe5/czhSj4dJcp5ICkof13P94vhPXE3fscDWjnjYrRYge4AJaDAHNbD3ZKkONyE3gK9
 m5fxO125cpfpPqW8Yot2V/CbfyWBmg8MW+Xe2Wr4Sk3VAJQCP4F0u7IYfE0qBpx+KfJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P3DY74ilax4cg/lfhIPyiy2oRVI64P7iXIHfAW0P3P0=; b=k
 nDzisIertGE1ccSL9N/RbAn9cWKSC2HA6WhcZ/rd5Slub2PsYxFTV41kFNSgmI1Jpa8GHgwfNl65E
 qY+TcA2DPqFHb1SIdaBkT95JAlqlP0TdiMSdLd1C+5/ZUXHPGq26rc1sCANNcsiRaFCF074XD47l7
 o7yID98RIB/29nwk=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lTKnZ-0005dp-DX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Apr 2021 08:41:33 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so8036670pjb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Apr 2021 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3DY74ilax4cg/lfhIPyiy2oRVI64P7iXIHfAW0P3P0=;
 b=VWB9uAL/THQeRHGRh1ES7+3vaX/eZO5Kd6v+MOG3N2sZaHo8A+Tv39kfs9jZe3JLX9
 Az04wMowqHK03MBuwGmuYhuE2DYVJZOP724fJWvLttuCAXcYrjAmijQDq5oefzIVIRhh
 6zgeWlR65dB5k80+a3Xv9zb1SJWznN5A7iE47mRD1M8x8xjBCahr1zEisOcdTF4AhhmY
 6E2wXOJk+7noI2CRvSR/ew+JYNtQLDtQSKZO81adVTgq7jzfaDXQBG1YuIr0S3ZDqLfz
 9AN3m45NfCpTVwN+5aTxJW5cjdl23PVRkXV9BaaA/rp3OdscCd9DLFILh4y2eOCWkvNw
 EaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3DY74ilax4cg/lfhIPyiy2oRVI64P7iXIHfAW0P3P0=;
 b=hm/IxxLrbMVTV36VJox0K/f4z/x9Fj+Vwl+5jB3JE13829YKIlcxanSVlP3HwGx+63
 /rYYWw5XoAQ8MMuIJ14ncx47FplUO6GX1De0VZQUkOiN+oTtsAZEWKrV1sX2cPpB4S+O
 FHrWs+vXYnihqot/QaNKNdwL153Xer0IjkQsZO3g0RVEg22fVuHfFsYaAI7A/2bUf1T8
 VUIuTtSeuSxcgQnYKCQ0tx5yNqiGx+ttxssgB/wZu0SRWb8eOIFrzO2bcb8giGFmTFMJ
 nn2XTfDwZA4JOG/0iTKOOVl+J7+TKv95QRMDj0Xd4aABbuoRpKrWj2zHdzJU8bRvkxry
 2hyw==
X-Gm-Message-State: AOAM531CAUo+g8zeg2BV/BdFI359oqCr/jdnRfDd6I0LraIeDZy7+D4y
 UmQ6sd9umQdap9mjiU7t+2E85mlpcX00vA==
X-Google-Smtp-Source: ABdhPJyMTMdWjb10GOqmJNHedtlpc+VxrtiSZp+sQZhT/jjqnV2QuwrCTo0I0DRyLyC48jomPiYkvA==
X-Received: by 2002:a17:903:4093:b029:e8:d8ec:eb3e with SMTP id
 z19-20020a1709034093b02900e8d8eceb3emr8863573plc.45.1617612083551; 
 Mon, 05 Apr 2021 01:41:23 -0700 (PDT)
Received: from localhost.localdomain ([114.71.101.153])
 by smtp.gmail.com with ESMTPSA id 12sm14696700pgw.18.2021.04.05.01.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 01:41:23 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  5 Apr 2021 17:41:15 +0900
Message-Id: <20210405084115.63502-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lTKnZ-0005dp-DX
Subject: [f2fs-dev] [PATCH] fsck: prevent working on devices with
 unsupported features
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

fsck should never work on devices with unsupported features.

This is a real practical issue as fsck'ing a compressed image with
an older version of fsck destroys the entire image.

Non-rolling nature of popular distros such as Ubuntu is making the
situation worse.

Implement a long overdue safeguard to cope better with different
versions of f2fs-tools.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 fsck/mount.c      |  9 +++++++++
 include/f2fs_fs.h | 18 +++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 6b2f17ebe8f3..107d61a88b7c 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -936,6 +936,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 {
 	char buf[F2FS_BLKSIZE];
+	__le32 unsupported;
 
 	sbi->raw_super = malloc(sizeof(struct f2fs_super_block));
 	if (!sbi->raw_super)
@@ -975,6 +976,14 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 			c.fix_on = 1;
 		}
 		print_sb_state(sbi->raw_super);
+
+		/* check supported features */
+		unsupported = f2fs_get_unsupported_features(sbi->raw_super);
+		if (unsupported) {
+			MSG(0, "Error: Unsupported features: 0x%x\n", unsupported);
+			MSG(0, "Error: Please update your f2fs-tools\n");
+			return -EOPNOTSUPP;
+		}
 		return 0;
 	}
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index cdcce2cd3b85..433440af0458 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -683,6 +683,9 @@ enum {
 #define MAX_ACTIVE_NODE_LOGS	8
 #define MAX_ACTIVE_DATA_LOGS	8
 
+/*
+ * All features listed here should be appended to F2FS_SUPPORTED_FEATURES
+ */
 #define F2FS_FEATURE_ENCRYPT		0x0001
 #define F2FS_FEATURE_BLKZONED		0x0002
 #define F2FS_FEATURE_ATOMIC_WRITE	0x0004
@@ -696,7 +699,15 @@ enum {
 #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
 #define F2FS_FEATURE_CASEFOLD		0x1000
- #define F2FS_FEATURE_COMPRESSION	0x2000
+#define F2FS_FEATURE_COMPRESSION	0x2000
+
+/* Currently supported features by this version of f2fs-tools */
+#define F2FS_SUPPORTED_FEATURES \
+	(F2FS_FEATURE_ENCRYPT | F2FS_FEATURE_BLKZONED | F2FS_FEATURE_ATOMIC_WRITE | \
+	 F2FS_FEATURE_EXTRA_ATTR | F2FS_FEATURE_PRJQUOTA | F2FS_FEATURE_INODE_CHKSUM | \
+	 F2FS_FEATURE_FLEXIBLE_INLINE_XATTR | F2FS_FEATURE_QUOTA_INO | F2FS_FEATURE_INODE_CRTIME | \
+	 F2FS_FEATURE_LOST_FOUND | F2FS_FEATURE_VERITY | F2FS_FEATURE_SB_CHKSUM | \
+	 F2FS_FEATURE_CASEFOLD | F2FS_FEATURE_COMPRESSION)
 
 #define MAX_VOLUME_NAME		512
 
@@ -1600,6 +1611,11 @@ static inline int parse_feature(struct feature *table, const char *features)
 	return 0;
 }
 
+static inline __le32 f2fs_get_unsupported_features(struct f2fs_super_block *sb)
+{
+	return sb->feature & ~F2FS_SUPPORTED_FEATURES;
+}
+
 static inline int parse_root_owner(char *ids,
 			u_int32_t *root_uid, u_int32_t *root_gid)
 {
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
