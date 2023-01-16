Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F266B5E6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 04:12:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHFuv-0001qV-G3;
	Mon, 16 Jan 2023 03:12:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pHFuu-0001qO-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 03:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=70wWPTTRf45yo4TsZOfmJlWbWf/vWiaM4qlj+SV+zPg=; b=TvGZnHZymnhVsmlcPP+C6GbK0J
 zyNrdJREV/RnSwLlOxbVXSsf+jGNcLV26iUpy7QJUDvSk0vorI83ca33ycw6ZJkJUTXUMlW64OR2e
 BYmlSP68NnAcNIaOJnXq0J0xPSmx7tLfVLFa7Edhz5eRbC3bGU5TFMJ9ZzIevszQ1GZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=70wWPTTRf45yo4TsZOfmJlWbWf/vWiaM4qlj+SV+zPg=; b=gO4TqaZz6+2qvN+sT8ouDDGkrO
 etYfh5klyZq+d+jTDgxSA41ckKhBRAx8EPs/ykxKVxAQ0wqKtJHyznJCTArvatoOOvclre43NYX7i
 CuPC2C6wyEM7X9tpUYa+wBhU1/qLCsPiAOD/OYyAmiH10dyJq+E7VjgQXy657bPmpkiY=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHFuq-0006jg-JB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 03:12:10 +0000
Received: by mail-pj1-f48.google.com with SMTP id bj3so24582133pjb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jan 2023 19:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70wWPTTRf45yo4TsZOfmJlWbWf/vWiaM4qlj+SV+zPg=;
 b=jdJ20l8M/RfczWorTmdZeOFh4qbp8AttwUMlGoseZpFA99uR1fLBekTrptX9mXE2Pe
 dUj2C5MLSdTl043rgpqSZyRqfYpkGBjy07xu1uR2Vo7t0tFgh1nD3O/nu2XMpirVmdp5
 TnfEUG/dPp+NMjAOyTBb8y7B5qUeDJcV4SX22jaPX6bf9G+mFM9dtLuyAYnkKMhWvL9B
 tT/7c0kd5n4fZ+1iqdo3+iN/2H7cZ16orrtA7/Tao4s9FK/UD3n+w7U/9pas5tWu36kM
 To7nmCu/P8U5UMPeAYZC4573/dQmc8vqlWnlWyQmTCb8AS08cGwGWvXNcVC0adJ+5m8f
 bNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70wWPTTRf45yo4TsZOfmJlWbWf/vWiaM4qlj+SV+zPg=;
 b=TMVer725QsfdJa7JvhcLv/RydjJEyX0i60zjGuev4eGp7ZbMlAStT78Qfm3RxpsFeu
 tsylghZl8LP3yTrBBH44I3eceBLLrcs9kHQopBFesF0EuVaqt++yWrPYVsCAGuVbQebh
 C8ircFFRwSQ2Ux8SoTi3ouZLk+2UPAWezPRCJgDACNp9Sh0z0BQoDOcOhvf4pMdNFIGk
 uKVq9/e5WjYAT7PJ/GocKkkGgwLg42hf+eivS4jhFaxO8WdfbrpCEynBs1+sGy1vSwlH
 J8Nyv4gSoUJC7JkUR2MT6XzQ6qsZsaF3t1fo4wJRK+y+Jw2PGpPAigbp08JjQZ2UbEu5
 Fdng==
X-Gm-Message-State: AFqh2kow2fDWzKIBnkQo9n9r14igfW/R9+h++gbHghvHr/DsW6dUbKmk
 klc2N5SLmm1FVmkvSSldhYA=
X-Google-Smtp-Source: AMrXdXvA54E+I6eaQGmDNC76CiN85SNIgGPjufJgIykCbBHVbvEqcj0PxpI9DLtqU6sOD6x4wddI1Q==
X-Received: by 2002:a17:902:9303:b0:194:8bd7:3236 with SMTP id
 bc3-20020a170902930300b001948bd73236mr4145106plb.45.1673838722991; 
 Sun, 15 Jan 2023 19:12:02 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a170902db0300b0018980f14ecfsm15326458plx.115.2023.01.15.19.12.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Jan 2023 19:12:02 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 16 Jan 2023 11:08:50 +0800
Message-Id: <20230116030850.20260-2-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
 <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1 ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 5 +++++ fs/f2fs/extent_cache.c | 12 +++++++----- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/sysfs.c | 11 ++++++++ [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pHFuq-0006jg-JB
Subject: [f2fs-dev] [PATCH 2/2 v2] f2fs: add sysfs nodes to set
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++++
 fs/f2fs/extent_cache.c                  | 12 +++++++-----
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 4 files changed, 24 insertions(+), 5 deletions(-)

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
index ad5533f178fd..f081f4edae78 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -871,11 +871,12 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 }
 #endif
 
-static unsigned long long __calculate_block_age(unsigned long long new,
-						unsigned long long old)
+static unsigned long long __calculate_block_age(struct f2fs_sb_info *sbi,
+						unsigned long long new, unsigned long long old)
 {
-	return div_u64(new, 100) * (100 - LAST_AGE_WEIGHT)
-		+ div_u64(old, 100) * LAST_AGE_WEIGHT;
+	unsigned int weight = sbi->last_age_weight;
+
+	return div_u64(new, 100) * (100 - weight) + div_u64(old, 100) * weight;
 }
 
 /* This returns a new age and allocated blocks in ei */
@@ -907,7 +908,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
 
 		if (tei.age)
-			ei->age = __calculate_block_age(cur_age, tei.age);
+			ei->age = __calculate_block_age(sbi, cur_age, tei.age);
 		else
 			ei->age = cur_age;
 		ei->last_blocks = cur_blocks;
@@ -1223,6 +1224,7 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
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
