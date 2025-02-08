Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33FA2D678
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2025 14:54:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tglHy-0004Pg-G4;
	Sat, 08 Feb 2025 13:54:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1tglHx-0004PT-4J
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Feb 2025 13:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iFnScfrb4FHKoOTGmqlb5WR9qT5yGH/QUW4XVtfAjOc=; b=IFodeJ3s6g9i8aoxfWUxzjwW/8
 Wh5h/hAJ+hYVxdtBdYMJNPXqht2GHNE0+OFmVLFKSihgPx4M3X9QcLi98XVV1vzfpBfIt7bTf/a2o
 AKYhkeq0/DEdIT9LU5oJOwpCMFSq/98vZeOJbvqiNdxHYGxFuj148minLVeVad++bmqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iFnScfrb4FHKoOTGmqlb5WR9qT5yGH/QUW4XVtfAjOc=; b=B
 xp669vpgwhNwsA4WV+3NhEv9DyoNOSbUapN7KvHQVPjIBrJ8zttEN5Ofn9+wLjRJPEd1rReBTyfr3
 SFziEBEBiitnF+stFEZS3sKfAAFC7vPR1mMKedHfcQGD1EThO3lGvND9egYIjiKngt5c3wcYBa5mu
 dal9kaX/liSBbjIA=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tglHv-0000bE-Pi for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Feb 2025 13:54:28 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21f710c17baso5076885ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 08 Feb 2025 05:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739022862; x=1739627662; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFnScfrb4FHKoOTGmqlb5WR9qT5yGH/QUW4XVtfAjOc=;
 b=SXrRep+/GLJnW0YygK4hmz1kWj+zxEMeEsy/0xMVuLmA/63IC+/1v7EDdjkg8jdG3m
 JpNXmYxT7+l63oKNs/XvxOePR7S0H/H+MSfpPcvoLy2MIgvBQFDgrzN9EuL457k9dzcb
 5zYijuK0hzPrkOHMxpxBB1fkp/0nbNW5zmBEmNHJnn0cdKbRWlfP2pm4MgS4AYltveDW
 CAYVHvrZqp0qCJ6Iwwf9ANJL68qn5PpekHhpWc1epYJLc7fzYvKjDpFI0nEUEjf8wL2K
 bPtKXbthBCRrqTHN0qXzTlTGv9RRVe6AZQZymcHLEccIsDKeZmj++0+DuZD7QVot/SaW
 s8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739022862; x=1739627662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFnScfrb4FHKoOTGmqlb5WR9qT5yGH/QUW4XVtfAjOc=;
 b=QMwPt4GfS0sOCxqogxrSk5K8Dj7oixuPXeyiuKjwJVvs0QlmyZ6Kpp6f1rwXHg191B
 jp1yJplH5qyW7UP0+B6junMcuLNdJGgTArmPu4sGrVUNucF3C5H/rzCl7fTCvflNBfIZ
 prbgNgeUqVCZdTcjBBEryTy7mxYa6MQjjbk3jP8MB2ReB+i6Qg4OdrfqV5svL+WSmFJP
 oBbIfD034gLoIyeZu5Mm/47S5fFvpDuyIx8ZIHe/4jovt29W6UWakQXrCSHNncOvKDSD
 0h/3LvqiACxIebtjKSS41AHSm4/d08oZgc6ZuHwnw3pi4CVdIMsZVLHTDwwpmzYx/XIa
 Z0Gw==
X-Gm-Message-State: AOJu0YzcxKMjS2V8HH/Or1gN0CxKYF0ZRLooJjwK+2X5SNcOt7JDnOpe
 aw2/gOi8tDYfq/PHmxu4Dz0kSE7/FvfksZr0y0o7MvP8JLj6OBFf
X-Gm-Gg: ASbGnctH4WqO2/qL/6HKml39/jfCtQi5gkEE4n1a8Nly/MtBg2wJiV97tTCcyO9VvDv
 3GrVTzs1uaDEo1cQRZyDuaU9icIixgaA3iB7COkMnfgh3lPX7E4h33hwZdE4c4txQaSFskW7ihG
 vHU4+SpeoyTuDNdmD4OGlcymEX+6g/JBHmDvFhGvltLQ/qOzBiFJa8sYPrA3vDzVMTbPw9dA8Fx
 aEMbOriwq4ID/Shu2pa6A3ZpsHzCtrrTn1d1DQvkED7yAuj6uEbfKSWSL1tNCGqB3FsD//AV0Bx
 fqtgGLH16z4uaWVHZVbz+N612EjOvuQ4J5LjmtsBULFK
X-Google-Smtp-Source: AGHT+IFbxc3GAXDoXKJ5rW0syHVzL3E4LhgGQxe7npP3vn/vPOBix39tigacRyRjZC1ZeMRoWdpayA==
X-Received: by 2002:a05:6a00:1acc:b0:725:e015:9082 with SMTP id
 d2e1a72fcca58-7305d421bf5mr10321913b3a.5.1739022862027; 
 Sat, 08 Feb 2025 05:54:22 -0800 (PST)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048ad292dsm4749597b3a.61.2025.02.08.05.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 05:54:21 -0800 (PST)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Sat,  8 Feb 2025 22:54:14 +0900
Message-Id: <20250208135414.417-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  currently,
 zone reset only occurs when there is urgent utilization
 and when pending blocks are reallocated. this causes performance degradation, 
 so we are modifying it to allow pending reset zones to [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.177 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.177 listed in bl.score.senderscore.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tglHv-0000bE-Pi
Subject: [f2fs-dev] [PATCH v1] f2fs: separate discard and zone reset command
 from pend list
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

currently, zone reset only occurs when there is urgent utilization and
when pending blocks are reallocated. this causes performance
degradation, so we are modifying it to allow pending reset zones to be
issued.

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/f2fs.h    |  3 ++-
 fs/f2fs/segment.c | 21 +++++++++++++++------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1afa7be16e7d..09a7e13c0d00 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -349,6 +349,7 @@ struct discard_entry {
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
+#define ZONE_PLIST_NUM		1
 #define plist_idx(blk_num)	((blk_num) >= MAX_PLIST_NUM ?		\
 					(MAX_PLIST_NUM - 1) : ((blk_num) - 1))
 
@@ -410,7 +411,7 @@ struct discard_policy {
 struct discard_cmd_control {
 	struct task_struct *f2fs_issue_discard;	/* discard thread */
 	struct list_head entry_list;		/* 4KB discard entry list */
-	struct list_head pend_list[MAX_PLIST_NUM];/* store pending entries */
+	struct list_head pend_list[MAX_PLIST_NUM + ZONE_PLIST_NUM];/* store pending entries */
 	struct list_head wait_list;		/* store on-flushing entries */
 	struct list_head fstrim_list;		/* in-flight discard from fstrim */
 	wait_queue_head_t discard_wait_queue;	/* waiting queue for wake-up */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..1c32252db525 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -962,7 +962,10 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
 
 	f2fs_bug_on(sbi, !len);
 
-	pend_list = &dcc->pend_list[plist_idx(len)];
+	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
+		pend_list = &dcc->pend_list[MAX_PLIST_NUM];
+	else
+		pend_list = &dcc->pend_list[plist_idx(len)];
 
 	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
 	INIT_LIST_HEAD(&dc->list);
@@ -1649,6 +1652,8 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 	struct discard_cmd *dc, *tmp;
 	struct blk_plug plug;
 	int i, issued;
+	int plist_num = f2fs_sb_has_blkzoned(sbi) ?
+		MAX_PLIST_NUM + ZONE_PLIST_NUM : MAX_PLIST_NUM;
 	bool io_interrupted = false;
 
 	if (dpolicy->timeout)
@@ -1656,12 +1661,12 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 
 retry:
 	issued = 0;
-	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
+	for (i = plist_num - 1; i >= 0; i--) {
 		if (dpolicy->timeout &&
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
 			break;
 
-		if (i + 1 < dpolicy->granularity)
+		if (i + 1 < dpolicy->granularity && i + 1 != plist_num)
 			break;
 
 		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
@@ -1720,6 +1725,8 @@ static bool __drop_discard_cmd(struct f2fs_sb_info *sbi)
 	struct list_head *pend_list;
 	struct discard_cmd *dc, *tmp;
 	int i;
+	int plist_num = f2fs_sb_has_blkzoned(sbi) ?
+		MAX_PLIST_NUM + ZONE_PLIST_NUM : MAX_PLIST_NUM;
 	bool dropped = false;
 
 	mutex_lock(&dcc->cmd_lock);
@@ -2305,7 +2312,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc;
-	int err = 0, i;
+	int err = 0, i, plist_num;
 
 	if (SM_I(sbi)->dcc_info) {
 		dcc = SM_I(sbi)->dcc_info;
@@ -2316,7 +2323,9 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	if (!dcc)
 		return -ENOMEM;
 
-	dcc->discard_io_aware_gran = MAX_PLIST_NUM;
+	plist_num = f2fs_sb_has_blkzoned(sbi) ?
+		MAX_PLIST_NUM + ZONE_PLIST_NUM : MAX_PLIST_NUM;
+	dcc->discard_io_aware_gran = plist_num;
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
@@ -2326,7 +2335,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		dcc->discard_granularity = BLKS_PER_SEC(sbi);
 
 	INIT_LIST_HEAD(&dcc->entry_list);
-	for (i = 0; i < MAX_PLIST_NUM; i++)
+	for (i = 0; i < plist_num; i++)
 		INIT_LIST_HEAD(&dcc->pend_list[i]);
 	INIT_LIST_HEAD(&dcc->wait_list);
 	INIT_LIST_HEAD(&dcc->fstrim_list);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
