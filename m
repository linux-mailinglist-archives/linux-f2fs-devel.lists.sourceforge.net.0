Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F257268A942
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Feb 2023 10:44:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOF5l-0003tT-C2;
	Sat, 04 Feb 2023 09:44:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pOF5k-0003tN-Bp
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Feb 2023 09:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jlr7ucZANS1HTD7tqpm1obhZEXx5pvk7Aus1wPx5RkM=; b=H15B9bbZTlJc6bcWtVn/1cwkkE
 ziCICYrGs8DWP72O7U4Gx6tyGvtcH7lBHDnSnVA2YIHhkckAttAPlJOBBWRQLeVSDtUKOk7rJyVsi
 egNmxV50+PLfUsIcNf3SJNtdfTP/zKA+FWpKix7VygRrBXK43TXKMsTBIZcmR1OGyprQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jlr7ucZANS1HTD7tqpm1obhZEXx5pvk7Aus1wPx5RkM=; b=PIeD3y/sPqGz1ItRdFZzVO/cFw
 LjG+/Ug0pGj1Y+LqfF1RSwJSHZu7/cs9JRsR66bKAqxLqedAvlmUpSnWm074QvRw2O/pAZR0fmiDI
 VoLt2prgS4WX0SKuxK5dEJSIho453y2aBJh+gCLYC8EgOBvKkahcxOLHH8xxZkHXX2Ao=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pOF5d-00041B-Uu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Feb 2023 09:44:14 +0000
Received: by mail-pl1-f177.google.com with SMTP id r8so7587024pls.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 04 Feb 2023 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jlr7ucZANS1HTD7tqpm1obhZEXx5pvk7Aus1wPx5RkM=;
 b=KsSp0F/iOCaeLRq2Btztcc61UCfwZXJnTOo43Oa0aFqzEtZBiTJUzaE0VGcxTV4u6B
 FVN0bbr/HeC3RlS4iiyi35NxLkUJVVZH5KDn77wNHqgV0ZD2/RS8mlch1qf79h6JVYbC
 +mT1I65LgeN9CdUS6ZiZ2j0fVmjAefTdm9gMQ2ZWef7cjsUECJRUyrKL6Echt0Kmzx9r
 dPlPJTF0bCiXC8pajtyI0CwY7ZJuKyT1bR/DKq54ObZ3Itc20T+9yY9qDgVBeno1CW8b
 lglA/WbHuI7NrGsn7BRLBgXtFEnIaTCTWkPaiTB6Kq0IiELEBdoZQ/AC8hlW1mlbe9gL
 OWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jlr7ucZANS1HTD7tqpm1obhZEXx5pvk7Aus1wPx5RkM=;
 b=qwShFn1/ilxz8SxVdJ1zwZpkyImA0klL4JlaTwOTY51g9gzM5DQgwkul8Wa4mZx2k9
 DhdNhN7hmVqay4gWlbS35brS6vBoCphEvF+fGpNh/Gxbzm6l23vkZtsCjqvxDZvWLdIU
 1qirV4XsW5P3U72NOCXiWJSDHCSFa0WDDamnUlB3nDcXrSoMCEFY/PUts0bjLaIwCjDW
 Amnw9vDiI1qs5QmtQWJr/8kHlKKEv/JEpKOQX0PqDOSp+Wr1owy7vzjCiEljb/xS0Kie
 YbvO8VBlyhLx4yOicSc/zhrZY6u5JYNsdFCnU6U1vOQ4L+IcMCjz6v8iU2mOwWWYqC6m
 K4FQ==
X-Gm-Message-State: AO0yUKU+pxlm/gASEsdbiO1iTMHxo+VGjmHFDcifkbPnVdWjHowbBd3b
 qU+OfKfxHgQC3Z56S1LzbCI=
X-Google-Smtp-Source: AK7set+TLsj8/ei+1yPKzdLl4Lv/5CzSjD1nV609VJpiJHLZft4vH0BJSeU8b/RXQx4a8w4ZLsKtug==
X-Received: by 2002:a17:90b:38c2:b0:22c:15a4:62a0 with SMTP id
 nn2-20020a17090b38c200b0022c15a462a0mr13531877pjb.37.1675503845168; 
 Sat, 04 Feb 2023 01:44:05 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.237])
 by smtp.gmail.com with ESMTPSA id
 ie12-20020a17090b400c00b0020b21019086sm10710252pjb.3.2023.02.04.01.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 01:44:04 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat,  4 Feb 2023 17:43:45 +0800
Message-Id: <20230204094345.591407-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <3589331b-a3ec-87e1-790d-387439672ea5@kernel.org>
References: <3589331b-a3ec-87e1-790d-387439672ea5@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1 --- change
 log v3 -> v4: - allow 0 and 100 to a valid value
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 5 +++++ fs/f2fs/extent_cache.c | 15 +++++++++------ fs/f2fs/f2fs.h | 1
 + fs/f2fs/sysfs.c | 11 +++++++++++ 4 files changed, 26 insertions(+),
 6 deletions(-)
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pOF5d-00041B-Uu
Subject: [f2fs-dev] [PATCH 2/2 v4] f2fs: add sysfs nodes to set
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
change log v3 -> v4:
  - allow 0 and 100 to a valid value

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
index 83a366f3ee80..cd2fb52d1f3c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -686,6 +686,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "last_age_weight")) {
+		if (t < 0 || t > 100)
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
