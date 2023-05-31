Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CA7188D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 19:53:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Q0J-0003Rc-1j;
	Wed, 31 May 2023 17:53:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1q4Q02-0003RI-13
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 17:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kfMuDdWL1b4kSqYmj4dPZPS2+HxbmlkGgksoSf7cEdM=; b=ZC8dq2F7cYKsaibX45giTxgunY
 Vp1mnpe9z1hK+U2G/RLc5e2WvcqLXNpOtxI1y4FBIkkYmv54AiPFwXa/CMA732hzJzgguy7fT2ns3
 gxoPAhzn2qLWiLTr5e7PZ9VyULBBmvrfELKEy4r7xqD38P98fjQynbtHnsz5V21IeY1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kfMuDdWL1b4kSqYmj4dPZPS2+HxbmlkGgksoSf7cEdM=; b=F
 PkzSWD5gucKPOaftOHQyCncdnqVcUv5SAWksc/LbOjv47eNbCTgyBUZarpqiOhVVZciwHCHQFl9BJ
 0mQgOpDnHpSBB2XBPrg+J70zuo6aO2/ssz2r8Q9UrZ3JeBUrEsQb6yjlh0jVwZW8s0ag4ooERBSV0
 sTo6G9E4lcs4oi0I=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4Q01-007elV-DC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 17:52:41 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso36142b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 May 2023 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685555556; x=1688147556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kfMuDdWL1b4kSqYmj4dPZPS2+HxbmlkGgksoSf7cEdM=;
 b=GCbj2dgtrPxM81YowcETNQ7Tw7u17jOm8NgY0XIvDAhknW7UNNBsch0YtMcFekc361
 6/Wad6Tz8fsQQg1eYGqg+85i9VG6EoFd6QO9uosS61SXofS450nU07/j9MSQ2VmiY2rn
 wad7XwqFrzdKhFr0cxIPBYy2E4V+2OaCfGyxCT1DSVfC3AkjQrqBZY1ueOxk16GDKHTR
 epPOhOIRe/Wua1Wzbeb4V1LkFHQT7UseSwek0eF6bjM2QuoopWANatm8LMmqsnlGCRdo
 DOmoMPQwsefZBwyj1nD7ejisJfYydRbcVQ3AitRWyz4lihhFvRGrbiQcvveSjJtkItu9
 8Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685555556; x=1688147556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kfMuDdWL1b4kSqYmj4dPZPS2+HxbmlkGgksoSf7cEdM=;
 b=FRPKkzkEbGIOrQOFcwB4MwST+MwmL9WdU289edEncWg3GPZvqrpmeUB9TBOGi5MDtf
 pSJ7qfO5P6un12r+BVhRwSIji8JYP3o+X9dnGrwrfZx/M7ap3EOlODCFrn+iRfOHIuED
 L/6P0zNN66nNrGEuWjElDox/e8m0knJ/mfcpbSgfymfmawP6Cut/uYumXVT1oDowPjnY
 gtIUY3rA2jn9AXZilftiEoMIx3seWCmuQUKpWrD+3Ody1xXaZUtoVM/LwZ012oR3i+p+
 KLfLnR2ZD6O2VadIRc5BLt62qMevZG7BeMAKKcaxiCekWy28UqAyuvQT/LVPKW2gY1Ym
 e/KQ==
X-Gm-Message-State: AC+VfDw+au+AyWDx2GQnAHLfgUGh+stx6h9K8+Lns3QgxrZUEDJtcBVM
 HTsbRbmgNK8RmgVplj+nTes=
X-Google-Smtp-Source: ACHHUZ6Bxgyls2p2BGxa2nv5b66W/y3d+qKs1L7ZFG+mA6gitDf/KIJHgmM/Krzh/mokc5fmG+G+Ng==
X-Received: by 2002:a05:6a00:2393:b0:64d:2a87:2596 with SMTP id
 f19-20020a056a00239300b0064d2a872596mr9221088pfc.10.1685555555629; 
 Wed, 31 May 2023 10:52:35 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:3d32:dc28:3a98:9cdf])
 by smtp.gmail.com with ESMTPSA id
 bm17-20020a056a00321100b0063f1a1e3003sm3587517pfb.166.2023.05.31.10.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 10:52:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 31 May 2023 10:52:13 -0700
Message-ID: <20230531175214.3561692-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Remove power-of-two limitation for zoned
 device, since zoned devices don't have it. Signed-off-by: Daeho Jeong ---
 fsck/mount.c | 12 +++++------- 1 file changed, 5 insertions(+), 7 deletions(-)
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.3 TVD_SUBJ_WIPE_DEBT     Spam advertising a way to eliminate debt
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q4Q01-007elV-DC
Subject: [f2fs-dev] [PATCH] f2fs-tools: remove power-of-two limitation of
 zoned device
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Remove power-of-two limitation for zoned device, since zoned devices
don't have it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 4c74888..851a62b 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -56,19 +56,17 @@ static int get_zone_idx_from_dev(struct f2fs_sb_info *sbi,
 {
 	block_t seg_start_blkaddr = START_BLOCK(sbi, segno);
 
-	return (seg_start_blkaddr - c.devices[dev_idx].start_blkaddr) >>
-			log_base_2(sbi->segs_per_sec * sbi->blocks_per_seg);
+	return (seg_start_blkaddr - c.devices[dev_idx].start_blkaddr) /
+			(sbi->segs_per_sec * sbi->blocks_per_seg);
 }
 
 bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
 {
-	unsigned int secno = segno / sbi->segs_per_sec;
 	block_t seg_start = START_BLOCK(sbi, segno);
-	block_t blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;
 	unsigned int dev_idx = get_device_idx(sbi, segno);
 	unsigned int zone_idx = get_zone_idx_from_dev(sbi, segno, dev_idx);
-	unsigned int sec_off = SM_I(sbi)->main_blkaddr >>
-						log_base_2(blocks_per_sec);
+	unsigned int sec_start_blkaddr = START_BLOCK(sbi,
+			GET_SEG_FROM_SEC(sbi, segno / sbi->segs_per_sec));
 
 	if (zone_idx < c.devices[dev_idx].nr_rnd_zones)
 		return true;
@@ -76,7 +74,7 @@ bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
 	if (c.devices[dev_idx].zoned_model != F2FS_ZONED_HM)
 		return true;
 
-	return seg_start < ((sec_off + secno) * blocks_per_sec) +
+	return seg_start < sec_start_blkaddr +
 				c.devices[dev_idx].zone_cap_blocks[zone_idx];
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
