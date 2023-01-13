Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D462E6697D8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jan 2023 13:59:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pGJes-0006SA-8f;
	Fri, 13 Jan 2023 12:59:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pGJeq-0006S0-V2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jan 2023 12:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2GF+E99ye3xLBw4zeGrDxAlN/CsQQRneamSV4aiYR4=; b=FWh4QJLLZSfwxecKJJOyyO3Kuw
 z/KNNjCs0G6y5pkecaNKpHOgbzjmvULSz4+iLQ5OiRNfYbiklj+QkYKPyq8see8/cOEbQS9ZEHzeX
 Yq9z4OWXVd072VInr91ghMOVovpbuhMS7tiujMmkJtoUGQ7Ls2eXQ/gHQ6RrB7yGmvN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b2GF+E99ye3xLBw4zeGrDxAlN/CsQQRneamSV4aiYR4=; b=WD8DOkf64xjdSDznwlsvoDReWA
 vyFeF2RIDyUcet1TXF0q6YVRj9tXZornYTu+xMrSdsLzeBrDomjj5dyVSSxGH6U6RLelEYsUP2dPw
 UGrhBTNlTgEr9o2agnTN3hsbb3EwL5e3APzo1UQy8/1H5vM2QJg+ABOHjpXjGPAkbVs8=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pGJee-00046X-Pi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jan 2023 12:59:36 +0000
Received: by mail-pl1-f182.google.com with SMTP id p24so23338031plw.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Jan 2023 04:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2GF+E99ye3xLBw4zeGrDxAlN/CsQQRneamSV4aiYR4=;
 b=BsnEKympesLjhjKzcF7dnJQ9q6uo10MBwf3i43l25qQ8YIWtuAk4/nHk/Uc5+cP/MI
 Q5QSCh/0CWd/HvNVuLdpo9sp+LP8Briac8tQKiewm2Da5zfHtsIzY3xQVmSNU/T5cq94
 D+j3MnHg4mbEoaG+ylBBC0axJzMFjotSKtw6cH5esqiUxGICyIkNLVRSTUVZUVFFfGtf
 yptK0YSr3OJBRe/2MMtci6dqdGCHKY4449sjx35MGu1bd6GcIISgD98X9ehLvVvtdB3o
 Q4MtPcN1CdbOamcR8eCARC1DEmD1dcOh+znxTkcbIed2nCGgS18IKWAFTpRz5grQ4vhC
 JZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2GF+E99ye3xLBw4zeGrDxAlN/CsQQRneamSV4aiYR4=;
 b=aE+JwXZTEHA18trs2iGZTbLk4K1ygb8WkGqjUUKC+DdbKFda3nISZiBYHQEVJFaDV9
 aBUL2XCRWvBI4wwznNEqhZzqK9HE8b4KPihxviBCQPTyYbwTtP9rCyGzhwFDOfB/Uu4h
 jOFX9TIAkEIIFdFb/d2Gq6is8afr0gm7gJYOnDjgE3zqk8JGNxlcjx2nRc+DXIrjY0IR
 IXWEjY10faMEb3JekSB0DgG+pT1KyXecUWbKT/aAvhebV9j5KEShlEh3inM8ZNgRrCq/
 ACyQ2EPEdgxQnhOohyw/3QWoNJy/zZhM17YW0Jlr61k34iwuoAgBjdIYhXjyk6iZk49D
 wOYg==
X-Gm-Message-State: AFqh2kqv49YjaGIfhqWgrI9L3T7Ptu5BJ7PkMludV7vR2I+xtXv6YY2A
 IkYdufnqyCIZRJPCGn0xOM4zsKAxQdCJvQ==
X-Google-Smtp-Source: AMrXdXuo4ba/iGhBairsFpgRykdngEw56L219YrKDMjOuHM8gKF2vVZjhDGnuzCJrHhCv3Y+hXb7fA==
X-Received: by 2002:a17:902:a70c:b0:189:dcc3:e4a1 with SMTP id
 w12-20020a170902a70c00b00189dcc3e4a1mr78888035plq.9.1673614767155; 
 Fri, 13 Jan 2023 04:59:27 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170903028300b001944bf0b57asm5453820plr.204.2023.01.13.04.59.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Jan 2023 04:59:26 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 13 Jan 2023 20:58:59 +0800
Message-Id: <20230113125859.15651-2-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 5 +++++ fs/f2fs/extent_cache.c | 11 +++++++---- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/sysfs.c
 | 11 +++++++++++ 4 files changed, 24 inser [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pGJee-00046X-Pi
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add sysfs nodes to set last_age_weight
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
Cc: xiongping1@xiaomi.com, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++++
 fs/f2fs/extent_cache.c                  | 11 +++++++----
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9e3756625a81..11af7dbb6bc9 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -669,3 +669,8 @@ Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
 Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
 		the data blocks as warm. By default it was initialized as 2621440 blocks
 		(equals to 10GB).
+
+What:           /sys/fs/f2fs/<disk>/last_age_weight
+Date:           January 2023
+Contact:        "Ping Xiong" <xiongping1@xiaomi.com>
+Description:    When DATA SEPARATION is on, it controls the weight of last data block age.
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 93a1ab186517..47222a899385 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -871,10 +871,12 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 }
 #endif
 
-static unsigned long long __calculate_block_age(unsigned long long new,
-						unsigned long long old)
+static unsigned long long __calculate_block_age(struct f2fs_sb_info *sbi,
+						unsigned long long new, unsigned long long old)
 {
-	return new - new / 100 * LAST_AGE_WEIGHT + old / 100 * LAST_AGE_WEIGHT;
+	unsigned int weight = sbi->last_age_weight;
+
+	return new - new / 100 * weight + old / 100 * weight;
 }
 
 /* This returns a new age and allocated blocks in ei */
@@ -906,7 +908,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
 
 		if (tei.age)
-			ei->age = __calculate_block_age(cur_age, tei.age);
+			ei->age = __calculate_block_age(sbi, cur_age, tei.age);
 		else
 			ei->age = cur_age;
 		ei->last_blocks = cur_blocks;
@@ -1222,6 +1224,7 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
 	atomic64_set(&sbi->allocated_data_blocks, 0);
 	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
 	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
+	sbi->last_age_weight = LAST_AGE_WEIGHT;
 }
 
 int __init f2fs_create_extent_cache(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..c3609cbc28c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1679,6 +1679,7 @@ struct f2fs_sb_info {
 	/* The threshold used for hot and warm data seperation*/
 	unsigned int hot_data_age_threshold;
 	unsigned int warm_data_age_threshold;
+	unsigned int last_age_weight;
 
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 83a366f3ee80..a70cf674d8e7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -686,6 +686,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "last_age_weight")) {
+		if (t <= 0 || t >= 100)
+			return -EINVAL;
+		if (t == *ui)
+			return count;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -944,6 +953,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block)
 /* For block age extent cache */
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -1042,6 +1052,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(revoked_atomic_block),
 	ATTR_LIST(hot_data_age_threshold),
 	ATTR_LIST(warm_data_age_threshold),
+	ATTR_LIST(last_age_weight),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
