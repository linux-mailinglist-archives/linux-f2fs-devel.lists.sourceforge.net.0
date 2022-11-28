Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BE63A427
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:06:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oza6B-0000qd-50;
	Mon, 28 Nov 2022 09:06:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oza66-0000qK-6o
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ycZaznc+xC+6/FUK+5zwqZvTJkK+CKo/Qas+UmyGYJA=; b=Z7mZAd9OsagDKzTulm9pwwePBa
 zx46iBjJ5J4HPlULNhQf8MIDKa1IsJVcwFsurz3K8jSfMFtzD4BMi9CoF+IQu4DwEYxPWn5Hlqnd3
 4049g5HtE+K49Tfxkp/Ilt6duJrTMorrzA24IVH2Jdts3ZTck2HSn2Pj2qcj9ROJ2c7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ycZaznc+xC+6/FUK+5zwqZvTJkK+CKo/Qas+UmyGYJA=; b=K253DyhzRsXobAYekDma6eD5YP
 Wxs6eiUyFUaYvXpy2mgYMZs1A5yvCJ0GZmdrBrr4XR6ebiRMLdduRLgxKK4GOmun0Zyd3PZOh8Vf/
 EHFMtr9HAfk6xdgrsu6rEBM8xG+VKZLYDgNgyiBbBZjrO6w3AYKeS9BKg+CTJA9aqLfo=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oza60-0004N9-Q2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:40 +0000
Received: by mail-pf1-f180.google.com with SMTP id 130so9812171pfu.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 01:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycZaznc+xC+6/FUK+5zwqZvTJkK+CKo/Qas+UmyGYJA=;
 b=KXr9mkIABUKR23sDpx3J4fNYP0/DhMiVooAUH26XjKNyzrAOgpeNrWG0wdIl/X4SFb
 HkU1RDGt9qEPz8nVJfhbpbjAqjnsB0zvKkE7VgVGTjBaxBEd/o31Yd5es62ZAXQlX/Mx
 w3bgAW3VB+uZBxpy2qM/gdaokCHBC4IFVeHCwcwT/OUYq8kz/akUmUzFjxkmuzxBwBhO
 4cAJCQ5ASANz4N0mzLeELq6PbwvskDJNjSBtCyWTOkEqCw5mdZTf17H67HFFr/CEqung
 g47oNHwN/orzx/86GzTOz0/wwxlMSkGuhKy/IeO+lhObh08Xy98UzMJHIm/9/xPpBz/T
 4LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycZaznc+xC+6/FUK+5zwqZvTJkK+CKo/Qas+UmyGYJA=;
 b=SdQPCaWY90XkItpIPqTuk9JY+DYdRBEXepUcmfRb65m6nR/DOLgSRd4weGP/VAiyiq
 zHLJ/Ex899MKdZNYG8HspufV2Ur7kABPxs2nRp4sRgwIrAxJ5zqgLxo+xfobBvCFu4su
 XQ4caMZw+RPZ2QF/TRumHiO7q6NK+vxe5Ih1qpUUQ1keV2S44wHJT8Ot7X7Kk/A3GXHJ
 lwTVvXKXOuORv3oSbBulIMgPhiink0rwlCKuLST8xAnhjHjAyXe7zsL+xAt6REsG1aFe
 44b1thpYEePQWHetxfy9gIGZyIkmzTWSTzuUGt8zBGn8T9s3eWEWFCD8CoMtbHUgL7rJ
 MBxw==
X-Gm-Message-State: ANoB5pl6yi/WL3rr8LHekqDdl2Q40ExUH2rgcU7cLRNK2a92pDPQrKCJ
 IJ+b5xUGB8jZt/UMPm7MKCo=
X-Google-Smtp-Source: AA0mqf5//mr6NPOabTc2FkugvftXUYKc4FVT4sC5DIdFfkV7KaXLjupZcgbIk6Og0jc4Z1o28cgdiQ==
X-Received: by 2002:a63:1055:0:b0:46e:f011:9548 with SMTP id
 21-20020a631055000000b0046ef0119548mr26085763pgq.553.1669626391178; 
 Mon, 28 Nov 2022 01:06:31 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b001811a197797sm8269268plg.194.2022.11.28.01.06.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:06:30 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 16:58:58 +0800
Message-Id: <20221128085859.5295-5-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1 ---
 fs/f2fs/block_age.c
 | 89 ++++++++++++++++++++++++++++++++++++++++++++- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/segment.c | 4 ++ 3 files changed, 92 inse [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oza60-0004N9-Q2
Subject: [f2fs-dev] [PATCH 4/5] f2fs: update block age info during out of
 place update
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
Cc: xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
 fs/f2fs/block_age.c | 89 ++++++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h      |  1 +
 fs/f2fs/segment.c   |  4 ++
 3 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/block_age.c b/fs/f2fs/block_age.c
index bc009616adfb..488461b3f4bf 100644
--- a/fs/f2fs/block_age.c
+++ b/fs/f2fs/block_age.c
@@ -9,9 +9,14 @@
 #include <linux/f2fs_fs.h>
 
 #include "f2fs.h"
+#include "node.h"
 #include "segment.h"
 #include <trace/events/f2fs.h>
 
+
+#define LAST_AGE_WEIGHT		30
+#define SAME_AGE_REGION		1024
+
 static struct kmem_cache *age_extent_tree_slab;
 static struct kmem_cache *age_extent_node_slab;
 
@@ -264,8 +269,8 @@ static inline bool __is_age_extent_mergeable(struct age_extent_info *back,
 						struct age_extent_info *front)
 {
 	return (back->fofs + back->len == front->fofs &&
-			back->age == front->age &&
-			back->last_blocks == front->last_blocks);
+			abs(back->age - front->age) <= SAME_AGE_REGION &&
+			abs(back->last_blocks - front->last_blocks) <= SAME_AGE_REGION);
 }
 
 static inline bool __is_back_age_ext_mergeable(struct age_extent_info *cur,
@@ -497,6 +502,86 @@ void f2fs_truncate_age_extent_cache(struct inode *inode, pgoff_t fofs, unsigned
 	f2fs_update_age_extent_cache(inode, fofs, len, 0, 0);
 }
 
+unsigned long long f2fs_get_cur_dblock_allocated(struct f2fs_sb_info *sbi)
+{
+	return atomic64_read(&sbi->total_data_alloc);
+}
+
+static unsigned long long calculate_block_age(unsigned long long new,
+							unsigned long long old)
+{
+	if (new >= old)
+		return new - (new - old) * LAST_AGE_WEIGHT / 100;
+	else
+		return new + (old - new) * LAST_AGE_WEIGHT / 100;
+}
+
+void f2fs_update_data_block_age(struct dnode_of_data *dn)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
+	unsigned long long cur_total_blk_alloced = f2fs_get_cur_dblock_allocated(sbi);
+	pgoff_t fofs;
+	unsigned long long cur_age, new_age;
+	struct age_extent_info ei;
+	bool find;
+	loff_t f_size = i_size_read(dn->inode);
+
+	if (!f2fs_may_age_extent_tree(dn->inode))
+		return;
+
+	fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page), dn->inode) +
+								dn->ofs_in_node;
+
+
+	/* When I/O is not aligned to a PAGE_SIZE, update will happen to the last
+	 * file block even in seq write. So don't record age for newly last file
+	 * block here.
+	 */
+	if ((f_size >> PAGE_SHIFT) == fofs && f_size & (PAGE_SIZE - 1) &&
+			dn->data_blkaddr == NEW_ADDR)
+		return;
+
+	find = f2fs_lookup_age_extent_cache(dn->inode, fofs, &ei);
+	if (find) {
+		if (cur_total_blk_alloced >= ei.last_blocks)
+			cur_age = cur_total_blk_alloced - ei.last_blocks;
+		else
+			/* total_data_alloc overflow */
+			cur_age = ULLONG_MAX - ei.last_blocks + cur_total_blk_alloced;
+
+		if (ei.age)
+			new_age = calculate_block_age(cur_age, ei.age);
+		else
+			new_age = cur_age;
+
+		WARN(new_age > cur_total_blk_alloced,
+				"inode block(%lu: %lu) age changed from: %llu to %llu",
+				dn->inode->i_ino, fofs, ei.age, new_age);
+	} else {
+		f2fs_bug_on(sbi, dn->data_blkaddr == NULL_ADDR);
+
+		if (dn->data_blkaddr == NEW_ADDR)
+			/* the data block was allocated for the first time */
+			new_age = 0;
+		else {
+			if (__is_valid_data_blkaddr(dn->data_blkaddr) &&
+					!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
+								DATA_GENERIC_ENHANCE)) {
+				f2fs_bug_on(sbi, 1);
+				return;
+			}
+
+			/*
+			 * init block age with zero, this can happen when the block age extent
+			 * was reclaimed due to memory constraint or system reboot
+			 */
+			new_age = 0;
+		}
+	}
+
+	f2fs_update_age_extent_cache(dn->inode, fofs, 1, new_age, cur_total_blk_alloced);
+}
+
 void f2fs_destroy_age_extent_tree(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 428cc560b721..23516498b6d0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4238,6 +4238,7 @@ bool f2fs_lookup_age_extent_cache(struct inode *inode, pgoff_t pgofs,
 void f2fs_update_age_extent_cache(struct inode *inode, pgoff_t fofs,
 					unsigned int len, u64 age,
 					unsigned long long cur_blk_alloced);
+void f2fs_update_data_block_age(struct dnode_of_data *dn);
 void f2fs_truncate_age_extent_cache(struct inode *inode, pgoff_t fofs,
 					unsigned int len);
 int __init f2fs_create_age_extent_cache(void);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b105d8418f77..d4c338f332fa 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3417,6 +3417,10 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
 	struct f2fs_summary sum;
 
 	f2fs_bug_on(sbi, dn->data_blkaddr == NULL_ADDR);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	if (fio->io_type == FS_DATA_IO || fio->io_type == FS_CP_DATA_IO)
+		f2fs_update_data_block_age(dn);
+#endif
 	set_summary(&sum, dn->nid, dn->ofs_in_node, fio->version);
 	do_write_page(&sum, fio);
 	f2fs_update_data_blkaddr(dn, fio->new_blkaddr);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
