Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCB9E40CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2024 18:12:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIsv2-0007Mj-EJ;
	Wed, 04 Dec 2024 17:12:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1tIsv0-0007MZ-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 17:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vj1b8Ze/fZAD2OCVGmGEy9Yu4e17Nxx83VAHxvLjoo=; b=N5/a9JQWX18odWHvJENRf4PMdy
 FcIykZ0NK1C6S7Bn0NbjDEghPLVbsvchpVIc1E6Dmo+1FLCscbQMGDVCesb9BS4f/dVX2l2bZj8pC
 uYeisHwCEpHO9EgJYvL5myS5DtHbK7fYoT8svIYSA4e6nBT4qDYSNaNsB+NEsORygg1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2vj1b8Ze/fZAD2OCVGmGEy9Yu4e17Nxx83VAHxvLjoo=; b=Kqa3tBAfzXfErz74X1GRFEqqt+
 jd2QCfz0PwkJVdiv25J0d8LR937HifMdKIAhRyo+la0Fcm5zF4RqQnbw9AbMYVK873nVHAMHEUKy7
 3/HBRCY0Leo1eJHn8WPbdJCMnmuipwbZlkomVdaVgg0EO3La6748gRc/GQBDOuJPf3XA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIsv0-0006D8-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Dec 2024 17:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28A395C6FA8;
 Wed,  4 Dec 2024 17:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1EAC4CECD;
 Wed,  4 Dec 2024 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733332315;
 bh=TbBfQwKdP331oy9aQCT7ZsPcuyQG/3FmklJ1v4p79NE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jYvF+1sxLgv8jNgjo0ZBUhdArKk8z8DUTr6f8U9WqnnnxznJIUF/Yc4DZBB6ZqSU4
 Ip/mqDe+g8CMWTrokRB5zkv9q3/9Z0uHtg0QufuQuoWp/zfPKKQKiBLCSKsyKB7bmG
 wcy3oJmEc5eIrjJz4ukiDjhkiazTNhtAYjhsrjDTf8sOG8gFuzkT/nCB/HuTxHiLTz
 gmtdeNhkdCgOPnMnuxaL+itl/QTpnCEKoygcRinELw2r6yAMyNaoVWav2NjDoDgiaX
 rNcm4XXo0B2AmNwSIc06NNErBiIOLxd9AfpFLNgJB8Aio3fkCep1uNLpHPkKxIU8de
 LIeOr78AsOyGg==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  4 Dec 2024 11:00:03 -0500
Message-ID: <20241204160010.2216008-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204160010.2216008-1-sashal@kernel.org>
References: <20241204160010.2216008-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 009a8241a8e5a14ea2dd0b8db42dbf283527dd44
 ] Quoted: "at this time, there are still 1086911 extent nodes in this zombie
 extent tree that need to be cleaned up. 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tIsv0-0006D8-E4
Subject: [f2fs-dev] [PATCH AUTOSEL 6.12 15/15] f2fs: add a sysfs node to
 limit max read extent count per-inode
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, Sasha Levin <sashal@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 009a8241a8e5a14ea2dd0b8db42dbf283527dd44 ]

Quoted:
"at this time, there are still 1086911 extent nodes in this zombie
extent tree that need to be cleaned up.

crash_arm64_sprd_v8.0.3++> extent_tree.node_cnt ffffff80896cc500
  node_cnt = {
    counter = 1086911
  },
"

As reported by Xiuhong, there will be a huge number of extent nodes
in extent tree, it may potentially cause:
- slab memory fragments
- extreme long time shrink on extent tree
- low mapping efficiency

Let's add a sysfs node to limit max read extent count for each inode,
by default, value of this threshold is 10240, it can be updated
according to user's requirement.

Reported-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Closes: https://lore.kernel.org/linux-f2fs-devel/20241112110627.1314632-1-xiuhong.wang@unisoc.com/
Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/extent_cache.c                  |  5 ++++-
 fs/f2fs/f2fs.h                          |  4 ++++
 fs/f2fs/sysfs.c                         | 10 ++++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index fdedf1ea944ba..ccee0fd74dd66 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -819,3 +819,9 @@ Description:	It controls the valid block ratio threshold not to trigger excessiv
 		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
 		background GC thread from intiating GC for sections having valid blocks
 		exceeding the ratio.
+
+What:		/sys/fs/f2fs/<disk>/max_read_extent_count
+Date:		November 2024
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	It controls max read extent count for per-inode, the value of threshold
+		is 10240 by default.
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 368d9cbdea743..fb09c8e9bc573 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -674,7 +674,9 @@ static void __update_extent_tree_range(struct inode *inode,
 		}
 
 		if (end < org_end && (type != EX_READ ||
-				org_end - end >= F2FS_MIN_EXTENT_LEN)) {
+			(org_end - end >= F2FS_MIN_EXTENT_LEN &&
+			atomic_read(&et->node_cnt) <
+					sbi->max_read_extent_count))) {
 			if (parts) {
 				__set_extent_info(&ei,
 					end, org_end - end,
@@ -1169,6 +1171,7 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
 	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
 	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
 	sbi->last_age_weight = LAST_AGE_WEIGHT;
+	sbi->max_read_extent_count = DEF_MAX_READ_EXTENT_COUNT;
 }
 
 int __init f2fs_create_extent_cache(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 33f5449dc22d5..928c10dc7ad58 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -634,6 +634,9 @@ enum {
 #define DEF_HOT_DATA_AGE_THRESHOLD	262144
 #define DEF_WARM_DATA_AGE_THRESHOLD	2621440
 
+/* default max read extent count per inode */
+#define DEF_MAX_READ_EXTENT_COUNT	10240
+
 /* extent cache type */
 enum extent_type {
 	EX_READ,
@@ -1619,6 +1622,7 @@ struct f2fs_sb_info {
 	/* for extent tree cache */
 	struct extent_tree_info extent_tree[NR_EXTENT_CACHES];
 	atomic64_t allocated_data_blocks;	/* for block age extent_cache */
+	unsigned int max_read_extent_count;	/* max read extent count per inode */
 
 	/* The threshold used for hot and warm data seperation*/
 	unsigned int hot_data_age_threshold;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c56e8c8739352..d9a44f03e558b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -789,6 +789,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "max_read_extent_count")) {
+		if (t > UINT_MAX)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "ipu_policy")) {
 		if (t >= BIT(F2FS_IPU_MAX))
 			return -EINVAL;
@@ -1054,6 +1061,8 @@ F2FS_SBI_GENERAL_RW_ATTR(revoked_atomic_block);
 F2FS_SBI_GENERAL_RW_ATTR(hot_data_age_threshold);
 F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
 F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
+/* read extent cache */
+F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
@@ -1244,6 +1253,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(hot_data_age_threshold),
 	ATTR_LIST(warm_data_age_threshold),
 	ATTR_LIST(last_age_weight),
+	ATTR_LIST(max_read_extent_count),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
