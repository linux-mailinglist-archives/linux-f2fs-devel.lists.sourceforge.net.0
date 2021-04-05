Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EB3353C77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Apr 2021 10:44:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lTKq4-0003KP-OR; Mon, 05 Apr 2021 08:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <qkrwngud825@gmail.com>) id 1lTKq4-0003KH-4R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Apr 2021 08:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbbCARoGXy2MNLuze8kfnNSBr/bgDDxhHvk64Asixl4=; b=biI0iIMMD6/a4xedIg4AKw2rk3
 2HkM/FFjYu5vPJcO0OcesU1qtvLwX+PYeDTBQWJgHkt9pH7GGXUAFR/RqIeKnTnRgad+COYbu6Fta
 J0QZw/art1GXQQ/UjxL+xTSvWJo30S6I5CXHpfZXNu6RhvdNE54MrX0xtOn4AXwYJs/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dbbCARoGXy2MNLuze8kfnNSBr/bgDDxhHvk64Asixl4=; b=i
 fQukvDxm3krsCPbQK7kCeomFsNX0xF5pDjFacAl67CDDg1T+N3N1QQKdo8Em7moV43d1uEJI0eMaP
 FnydWptkjs2bBiYIAYVbRBNmn5mpVJloq79KPwkgaUIl8gWzPEXcKLiyAVW94v6uEelOG4Abngx7C
 NlJJDMT9xl2oyt+A=;
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lTKpr-003dxD-7A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Apr 2021 08:44:04 +0000
Received: by mail-pg1-f180.google.com with SMTP id b17so4064470pgh.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Apr 2021 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbbCARoGXy2MNLuze8kfnNSBr/bgDDxhHvk64Asixl4=;
 b=Ih3FR3KQfdHHc/iKpS+8YO6iN90iy3JqWVdxG8WlfA/bNbrkdTHsJGA7emgEMjIZsi
 0Y0Wr57j8xqXo4nlTWB7mcArGYZtdm28RkLagxlSoBjidsRLA0vZ+YtTDtyRVXpi4Lo8
 cnHpPRTbHZ1hCrXOHlILBM8JN2zZh7jWrNwqwX62m5ScuRKFfwITc/CcoyC4yT7nXZic
 n98lpCwiCY5touh3R6qCpa1X54qNtN90posUJgakAEAi59w5kECKcoetYv8a/9bnq4m5
 3tUU0LzqoNWxtuyrSyo9aWtYHtWDdVvHH+Nod3f1Tlr231ktiw3Dk6bc1xVrDFTuuxMQ
 ie7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbbCARoGXy2MNLuze8kfnNSBr/bgDDxhHvk64Asixl4=;
 b=rAJtmk9TwU/eP/C4Bn+4SZ95T/hcjP8HFtVRmfA64+qMTSu3QKNS1N6A2BVXaQRx58
 c4k5xPrc1wBgzNvepjiAXFjgeP/9Ov9mlrpbZZvEaNI1moH+1CE9Pug0AERDRlT/FEq4
 xABpkg/IjWQdP4QKs+DxQCqunKCLJ5agwzGLSj7YrcAgdbDStSuAAfU8oyn//Q35r+La
 ujKc2sUYV7KHPacfzkWHxqiIStgj1kJ9gTvug3Hv4fh4ngo7V7ZqQOTI2DExMNAmUHWH
 Bv+hcIZADnXkDPuVSyenXHCuOCZFldTXQsb+9AOwE6l8XEWAqoT3CDqGZaHr73yoTEA2
 kfrg==
X-Gm-Message-State: AOAM532O0/9/Dase/Dx7LKqfAja5gyvQSwPs2rWlRHvH57001CB0+1/m
 Yluqrvf0B0xwZQx2B0Tgx3y1hWijLt0B8A==
X-Google-Smtp-Source: ABdhPJxhg9EtYmCleonLb2ImMQV3FEye2Gq04FZYHG8PtDXJOM1NPXsVVe6tPidcCczS5aDPIjYUJQ==
X-Received: by 2002:a62:55c6:0:b029:21c:4dfc:d6e2 with SMTP id
 j189-20020a6255c60000b029021c4dfcd6e2mr22419687pfb.60.1617612225316; 
 Mon, 05 Apr 2021 01:43:45 -0700 (PDT)
Received: from localhost.localdomain ([114.71.101.153])
 by smtp.gmail.com with ESMTPSA id w18sm14671463pjh.19.2021.04.05.01.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 01:43:44 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  5 Apr 2021 17:43:36 +0900
Message-Id: <20210405084336.65165-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lTKpr-003dxD-7A
Subject: [f2fs-dev] [PATCH] f2fs: prevent mounting devices with unsupported
 features
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

Mounting f2fs devices with future options leads to unwanted behaviors
incurring errors and data destruction.

Implement a long overdue safeguard to prevent mounting devices with
unsupported features.

This can be further extended to allow read-only mounts on certain
incompatible features, but that doesn't seem necessary for now with
how f2fs features has been added.

Cc: stable@vger.kernel.org
Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 fs/f2fs/f2fs.h  | 11 +++++++++++
 fs/f2fs/super.c | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e2d302ae3a46..12d274492d6f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -153,6 +153,9 @@ struct f2fs_mount_info {
 	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
 };
 
+/*
+ * All features listed here should be appended to F2FS_SUPPORTED_FEATURES
+ */
 #define F2FS_FEATURE_ENCRYPT		0x0001
 #define F2FS_FEATURE_BLKZONED		0x0002
 #define F2FS_FEATURE_ATOMIC_WRITE	0x0004
@@ -168,6 +171,14 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_CASEFOLD		0x1000
 #define F2FS_FEATURE_COMPRESSION	0x2000
 
+/* Currently supported features by this version of f2fs */
+#define F2FS_SUPPORTED_FEATURES \
+	(F2FS_FEATURE_ENCRYPT | F2FS_FEATURE_BLKZONED | F2FS_FEATURE_ATOMIC_WRITE | \
+	 F2FS_FEATURE_EXTRA_ATTR | F2FS_FEATURE_PRJQUOTA | F2FS_FEATURE_INODE_CHKSUM | \
+	 F2FS_FEATURE_FLEXIBLE_INLINE_XATTR | F2FS_FEATURE_QUOTA_INO | F2FS_FEATURE_INODE_CRTIME | \
+	 F2FS_FEATURE_LOST_FOUND | F2FS_FEATURE_VERITY | F2FS_FEATURE_SB_CHKSUM | \
+	 F2FS_FEATURE_CASEFOLD | F2FS_FEATURE_COMPRESSION)
+
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
 #define F2FS_HAS_FEATURE(sbi, mask)	__F2FS_HAS_FEATURE(sbi->raw_super, mask)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 82592b19b4e0..4a2fe29b0740 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3610,6 +3610,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	int recovery, i, valid_super_block;
 	struct curseg_info *seg_i;
 	int retry_cnt = 1;
+	__le32 unsupported;
 
 try_onemore:
 	err = -EINVAL;
@@ -3647,6 +3648,15 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
 
+	/* check supported features */
+	unsupported = raw_super->feature & ~F2FS_SUPPORTED_FEATURES;
+	if (unsupported) {
+		f2fs_err(sbi, "unsupported features: 0x%x\n", unsupported);
+		f2fs_err(sbi, "please update your kernel or adjust the mkfs.f2fs option\n");
+		err = -EOPNOTSUPP;
+		goto free_sb_buf;
+	}
+
 	/* precompute checksum seed for metadata */
 	if (f2fs_sb_has_inode_chksum(sbi))
 		sbi->s_chksum_seed = f2fs_chksum(sbi, ~0, raw_super->uuid,
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
