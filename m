Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C0C455C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 09:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KoFM+ZlioucTtY/CGgehIbqT4o2JCEmvef++MdgF4/c=; b=O4Ys3IkFvmdHQgYwNIyrfCIcDk
	1C2azlXpd+501wCpgIp8eaV9tdoa8AmIbxQeYIIDyt/MmU7/iJbLR/i53lpgMsROVb2adKbEgELd+
	jS/uaHWxcYvcwPZzPr8CBkI//VjlJ6IWjm3tgA7Nq/RPFmySAOSvnAnoheWADJpUC2UI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vINAf-0007Kc-Cm;
	Mon, 10 Nov 2025 08:22:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vINAe-0007KO-GM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 08:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pk5desxvVlgFwB887i7EWePNrU1qCGwJNJBbJbR3S/o=; b=PF+hT9LhGFA6bR4grVRwMaONpw
 ezY41uK5Ksu01KT8OXl/BPzyBBeCr2Jop56U6dA2nUTLmbL/m0b6djwgiw7WjUFUpTrEcT0DV/ZFF
 XfqUT75WQ9IxGUxLqYGPuVa2vU7bJ3TvrPbRRtMCrjRQZe6IQCd51kJNH+KBesyJcrbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pk5desxvVlgFwB887i7EWePNrU1qCGwJNJBbJbR3S/o=; b=W
 30UhMAeTPcnLWYd5VWI45V8fGVOICC51MKAQoztZuXEmGwTyBAv/IlB43AnN4Pmo+cpEeKWXKe/TM
 aFXfW5CZmAln6AG5W8BLtQFR4O9dwBv5tWznVOUaOf2lSjfmZ2SWDNhiTR93AJLT/+Om2U7ng3hXi
 ti/ZXLezI3PJkAVE=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vINAe-0007Yz-TB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 08:22:41 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-343684a06b2so1662117a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762762950; x=1763367750; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pk5desxvVlgFwB887i7EWePNrU1qCGwJNJBbJbR3S/o=;
 b=gx8/59Vv4MDxsYdueBDP7XLN2yjGRd1Cy2DiX5kkP72ioVW72PvY5CNJauxiYeqxs3
 JurD0JbwFneE+lfxR8ihgl08pT2gci2OrfjfV6yYhUg+WTjr1tIZwkw+MMFLKSN6HJxQ
 EC8TzPWSAIYWcbI4uHuT+82jNZyVnwbi4DWwGW94JmO/8LkRtknJDxXnqUJP2KznKViS
 yMIGbjp0msSGmQIo/IhXOkHdJCQJ5LlJWk+vkCsew041mlvNIMHGmpHPRbSNVMIP6ayN
 hn/bOYDap0DHFNwc/km1rHnw4hghLGD8mRicm2Q4/tdW6yHtcDhN8DkcQhgOxEmOnoGQ
 G32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762762950; x=1763367750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pk5desxvVlgFwB887i7EWePNrU1qCGwJNJBbJbR3S/o=;
 b=MgQZQKaXrxMWooH8obRv/aqAr+tDB721E5TV/4YNBTqfBlYUc7/XAGsRt0g7jF6jgq
 CzFbz1tlzCpGhm3Q6J0YExdWfXNccgC9tG7HdNHVTt6v96OuzZNPSAg4arYKPU8+ZdCw
 IYofTZVBuaTCUWzZkvf+IyYZM5/1wQuE9vNuiriBaip11/1tJWCJmyx6mI9h8wBx4/+P
 JBg9LNPqD4AVV+TUD8TdSSBRyCegB2s9CjnarCsNdUHfqYgt98Mez6nuejYzQIUgq7bt
 qDGHVjujpkvFMoIWZOWFg5wJEeX1KFXvx40d8gHCUtu/gFLCRtT9I+ghTYnnFjTfvo1G
 IzUQ==
X-Gm-Message-State: AOJu0YzzQ/Oz6Ew3wteePXUR8fjctorKJe0iU0kZiBQh8nFO3V/izDKq
 lBl+TjNG+tzm1ZzbmJtRgNxTSPdKwCnXgfaCgi5Lb/mSLkESE27QBHibbmPs4cYhQxA=
X-Gm-Gg: ASbGncuRmvjHTJ2cHPPbDIaiZHcgyE+UWlrF6MSf2Ap5AKvJL3N7a8Ehexp/+D+uJp0
 /2HfaCCwvZDF0AKT9ZsGN6lqFpxbVwnLbh8dL0Fra7YrM/NOKGDoH2eluA8mSrFa8E0IQajfeob
 QZO62C2MyLR2hH5Xg+ZErPRDp3U/UGA9TOBfMK6n0MenlNrKEIfJ5lbJ/Vlc/zocNdC9aWWqBOy
 2CXOMxWW96BGABwYwoPj83lRq1gw40fGpGFcusiy8IKFOWkallBCEUq/ChRtyX2UnQKbtK9jIdE
 1NbAmGXzg/KYtRr1zHA+tav60TbBlQrKkkQwlxQN+sEoPQiJXK+kKQlc1yK+dlwKQozR9JlzQrZ
 8ke8WckTzNd+WQGBXmNZOF/YRBs2VNntkrXxeJFHcEBCtjvaj+YO1W38/QkR4TzIw1zupc9m4Dm
 oJhx9g/0m0StjBnnSFbDNTIrDXNGBQKBN0KO4W1Cj+rsI4MPeSRTyBc0r8DcyvzA==
X-Google-Smtp-Source: AGHT+IFC6RslupaHKfIBc3O0XhoUB0wnYfUX1t27q8I0iei2dwQbVlIghY+zMGZs9kBRVgZ54RFlIQ==
X-Received: by 2002:a17:90b:350d:b0:340:c261:f9f3 with SMTP id
 98e67ed59e1d1-3436cb8a0bdmr9271197a91.14.1762762950041; 
 Mon, 10 Nov 2025 00:22:30 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f0d16483sm11590059a12.0.2025.11.10.00.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 00:22:29 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 10 Nov 2025 16:22:21 +0800
Message-ID: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang The usage of unusable_blocks_per_sec is
 already wrapped by CONFIG_BLK_DEV_ZONED, except for its declaration and the
 definitions of CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC. This patch ensures
 that all co [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vINAe-0007Yz-TB
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs: wrap all unusable_blocks_per_sec
 code in CONFIG_BLK_DEV_ZONED
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

The usage of unusable_blocks_per_sec is already wrapped by
CONFIG_BLK_DEV_ZONED, except for its declaration and the definitions of
CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC. This patch ensures that all code
related to unusable_blocks_per_sec is properly wrapped under the
CONFIG_BLK_DEV_ZONED option.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Revert the renaming of unusable_blocks_per_sec.
- Separate the sysfs node addition for max_open_zones into a separate
patch.
- Add more explanation for the case that zoned block device's
max_open_zones == 0.
---
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/segment.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5b4e9548a231..238ef4bcab6d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1661,6 +1661,7 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int unusable_blocks_per_sec;   /* unusable blocks per section */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
 	/* For adjust the priority writing position of data in zone UFS */
 	unsigned int blkzone_alloc_policy;
@@ -1732,7 +1733,6 @@ struct f2fs_sb_info {
 	unsigned int meta_ino_num;		/* meta inode number*/
 	unsigned int log_blocks_per_seg;	/* log2 blocks per segment */
 	unsigned int blocks_per_seg;		/* blocks per segment */
-	unsigned int unusable_blocks_per_sec;	/* unusable blocks per section */
 	unsigned int segs_per_sec;		/* segments per section */
 	unsigned int secs_per_zone;		/* sections per zone */
 	unsigned int total_sections;		/* total section count */
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 1ce2c8abaf48..e9134f66ab1f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -69,11 +69,16 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	((!__is_valid_data_blkaddr(blk_addr)) ?			\
 	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
 		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
+#ifdef CONFIG_BLK_DEV_ZONED
 #define CAP_BLKS_PER_SEC(sbi)					\
 	(BLKS_PER_SEC(sbi) - (sbi)->unusable_blocks_per_sec)
 #define CAP_SEGS_PER_SEC(sbi)					\
 	(SEGS_PER_SEC(sbi) -					\
 	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
+#else
+#define CAP_BLKS_PER_SEC(sbi) BLKS_PER_SEC(sbi)
+#define CAP_SEGS_PER_SEC(sbi) SEGS_PER_SEC(sbi)
+#endif
 #define GET_START_SEG_FROM_SEC(sbi, segno)			\
 	(rounddown(segno, SEGS_PER_SEC(sbi)))
 #define GET_SEC_FROM_SEG(sbi, segno)				\
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
