Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB0687732
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 09:21:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNUqA-000424-AX;
	Thu, 02 Feb 2023 08:21:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pNUq6-00041k-Kf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eautq1iIC0hDwNml5uf79FOlObXCfjHIXPRVUyN4Rz8=; b=fjbsCLIY43CXxRxgc+LDzAWZt2
 uPaD2vdotNOln3vRy/1rTCugBaRkdvxrxnqzDNkhoVs42oaVVdQyA5XwZGek1iIodH9GPriKowvT6
 x5zRdA+Cyyzoc6IRpUN5m+rvz2PCKpPpnMBBcJ9nmxt9igR0fuioAnYvjlplrOIfw2+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eautq1iIC0hDwNml5uf79FOlObXCfjHIXPRVUyN4Rz8=; b=G9f7fgg5tX6878HrwkyWSHZ8bS
 5JLnn7K1IlBl5H4SsbtFVtAWI6DXax95cE7rj0zFU0oqvbspB0KDMjU58rOXetRljZiU0BXT+E298
 440TR3JS9C4SKdMyUJ5/G4j3KVPULmNPoegxaZ+fmsmrrlolBsdy/8unagqEu4yGhzTI=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pNUq1-008GMu-0I for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:21:01 +0000
Received: by mail-pj1-f51.google.com with SMTP id pj3so1216857pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Feb 2023 00:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eautq1iIC0hDwNml5uf79FOlObXCfjHIXPRVUyN4Rz8=;
 b=BjA4n44s+6Sc15/jKkRvZ+cXGCK584TEzsQQkHK7X0WzK0r49dCwPB+MO0TD1j/5OH
 XczKi8pnrQ26T0b/1/UEk7bdFRvVI5A+yLzmcVG+XFQutjJpDt22jkYiW9pRI/IfUfck
 Zh81n37WC0xirz5eEMpI0FXnWtBAXF/x0MoMK+XMQOXPQEAyNJ7ibJHg/AX9vjARr1wE
 ULWXepaEvDWnNEEH+80H+SPvKaXowZICBBjIkdu5w+wN01wtWcZw2OSvj3WGdjlGZXqs
 oZYza3vhjsS3hMhWHpiIP9AORF2QtOw1TKsg6HjVaZL1xd4/RS3OJ2EmlaQHNRSsnsvh
 Aodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eautq1iIC0hDwNml5uf79FOlObXCfjHIXPRVUyN4Rz8=;
 b=3g2UNc3FyPpQqpIG1pyEPT7ACUiw30ozHq/7LntU42mmu2qyk4D6lm1+gX5fjjq2zZ
 uhpNTYaEJ5/vkrvqdco88I8iUYrufsjqNNbU/347/0Y36ugIW6bbivb3RTn9zI2mEe2w
 MfahtOHSj35/M23yHwMLexDa2J/JDCIQlaxXvaDI1WNWL4XiJ+h7cU+cBI7jmhgcUTJ+
 jOjb45LB448etX+5m9A6jVEHbqhhnNkedd11s6Qa8EWPZ3r3P5dKqxdjK5emyv8xiuP+
 /CTkWeyacJhSN3xOGLIW9HRZCFEJNap81urrKoIaW8fycVb12Mf+0hdNV4fzvqgaEldn
 Ys9Q==
X-Gm-Message-State: AO0yUKVPIT+nHUAgrJV/mtmqjNTxZIObZu07bynYoshxwc8KRUb/jvOa
 WQCQ7If4Wg8zHBybfKQpXw4=
X-Google-Smtp-Source: AK7set8o9F+PN4bVCE43tV8LiRfUMrMAyMFMd1QlFC4JGZ8dONn8Iee6EjuZBdJFijgbRZJPUixvtg==
X-Received: by 2002:a17:90b:3a85:b0:22c:b9e8:48d with SMTP id
 om5-20020a17090b3a8500b0022cb9e8048dmr5549757pjb.0.1675326051423; 
 Thu, 02 Feb 2023 00:20:51 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.237])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a17090a694500b0022c2e29cadbsm2578563pjm.45.2023.02.02.00.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 00:20:50 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  2 Feb 2023 16:20:28 +0800
Message-Id: <20230202082028.9013-2-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
References: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
 <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1 ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 5 +++++ fs/f2fs/extent_cache.c | 15 +++++++++------ fs/f2fs/f2fs.h | 1
 + fs/f2fs/sysfs.c | 11 +++++ [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pNUq1-008GMu-0I
Subject: [f2fs-dev] [PATCH 2/2 v3] f2fs: add sysfs nodes to set
 last_age_weight
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
Cc: Ping Xiong <xiongping1@xiaomi.com>, Xiaoyu Qi <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++++
 fs/f2fs/extent_cache.c                  | 15 +++++++++------
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 4 files changed, 26 insertions(+), 6 deletions(-)

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
index d9f12f404beb..ce99882ba81c 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -871,19 +871,21 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 }
 #endif
 
-static unsigned long long __calculate_block_age(unsigned long long new,
+static unsigned long long __calculate_block_age(struct f2fs_sb_info *sbi,
+						unsigned long long new,
 						unsigned long long old)
 {
 	unsigned int rem_old, rem_new;
 	unsigned long long res;
+	unsigned int weight = sbi->last_age_weight;
 
-	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
-		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
+	res = div_u64_rem(new, 100, &rem_new) * (100 - weight)
+		+ div_u64_rem(old, 100, &rem_old) * weight;
 
 	if (rem_new)
-		res += rem_new * (100 - LAST_AGE_WEIGHT) / 100;
+		res += rem_new * (100 - weight) / 100;
 	if (rem_old)
-		res += rem_old * LAST_AGE_WEIGHT / 100;
+		res += rem_old * weight / 100;
 
 	return res;
 }
@@ -917,7 +919,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
 
 		if (tei.age)
-			ei->age = __calculate_block_age(cur_age, tei.age);
+			ei->age = __calculate_block_age(sbi, cur_age, tei.age);
 		else
 			ei->age = cur_age;
 		ei->last_blocks = cur_blocks;
@@ -1233,6 +1235,7 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
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
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
