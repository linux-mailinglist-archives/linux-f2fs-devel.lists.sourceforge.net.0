Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A624AAA217
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 00:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fECFe3uIahkv3RS+Z/hDc8AKAw1nhwoHpnBsStOFjk=; b=Slb1erZl1FAel2qb7CgTXktYmC
	/3PgEmLVPdYwwFCSf3WSLnDqlxcRzaJaJPfcolUD0sufPQFQNSQ491CqfFmytsMBXOPPshs8EufG7
	yy8liolzfJl8xa3nmpdNxtq0vQkRKzb2QE1zEeo+4k8Ih7m+66gioJxrXFy/GOQ5X2Qk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uC4i7-0003X7-Lo;
	Mon, 05 May 2025 22:54:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1uC4i6-0003X1-QQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 22:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e94AGEkVyp1qIWBOa5GJqqSvpOkeQnCMzI8Og6c0gMs=; b=N1Jf4InsGyj+mzZWnRX/beSB3s
 Kvrzj14ysPjZvcRsWDuv/Kp+hoIaqKhp+lC1MwFojbrCw4x753boYz3bZCXfAVm7ldKFyFxuD3+W7
 eqhC+Vxx9h6NnOYrJ46rg2KpdxVeoO5+f7noK2Py5EICPeEY29UhfA0L5v0TxjpTAj2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e94AGEkVyp1qIWBOa5GJqqSvpOkeQnCMzI8Og6c0gMs=; b=JGWBf2k24ZnksA1X9kQahQ7siq
 m0qbFiKKqoamk+Y4V9TWhkvnAgCDQT6NW12DVbnk3g6fKEZVDk232eGxbSHl+gnd0xnt1mB8E3BKj
 lD2sKiYm9yQhR5c9eJhJNAAhjQSlyrTqcQmUokmTGJmsFokUrEakgH42dnWTVXg/2YFE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uC4hn-0003Um-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 22:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9BFACA4D242
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 May 2025 22:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364B1C4CEEE;
 Mon,  5 May 2025 22:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485664;
 bh=IyFIML+rboKGpxA24Mrd1ILEPJI5G2tbJCi/JtGhixo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W2EfpZD0h22amkk5TtUzGkME5SNQCkOpN22Wtgc5WlUyPStWch/wWcR0sLrdmI/AE
 MpRhhuVsvk8wsJqJWoE0kBBdbZcXBrfxn9sYiub9VqPhQXWJW9HD+kM51QDKcprE0R
 l0qG551bOS1Z8ZfB83uPWgUFZesg+NjIt6BFLMNwMh4Gx8OYCl9isCVaHrhjHyDokY
 uf4u2ua0vbQ0LHqxgzLdS2ZL2TWOnL4tUASyYhcNSLGGIW3osVCjYKIANb7Ng0kvf4
 A56D7UIvTMpbiob16LZ4c4llFTuygdX6wA+6Cg+PZLQIyGwL1r3X4Wv03+myHyRkmt
 I8z+okh2DaimQ==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  5 May 2025 18:38:12 -0400
Message-Id: <20250505223922.2682012-416-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 21925ede449e038ed6f9efdfe0e79f15bddc34bc
 ] In /sys/fs/f2fs/features, there's no f2fs_sb_info, so let's avoid to get
 the pointer. 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uC4hn-0003Um-Vq
Subject: [f2fs-dev] [PATCH AUTOSEL 6.12 416/486] f2fs: introduce
 f2fs_base_attr for global sysfs entries
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 21925ede449e038ed6f9efdfe0e79f15bddc34bc ]

In /sys/fs/f2fs/features, there's no f2fs_sb_info, so let's avoid to get
the pointer.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/sysfs.c | 74 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index d9a44f03e558b..7df638f901a1f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -61,6 +61,12 @@ struct f2fs_attr {
 	int id;
 };
 
+struct f2fs_base_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct f2fs_base_attr *a, char *buf);
+	ssize_t (*store)(struct f2fs_base_attr *a, const char *buf, size_t len);
+};
+
 static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			     struct f2fs_sb_info *sbi, char *buf);
 
@@ -864,6 +870,25 @@ static void f2fs_sb_release(struct kobject *kobj)
 	complete(&sbi->s_kobj_unregister);
 }
 
+static ssize_t f2fs_base_attr_show(struct kobject *kobj,
+				struct attribute *attr, char *buf)
+{
+	struct f2fs_base_attr *a = container_of(attr,
+				struct f2fs_base_attr, attr);
+
+	return a->show ? a->show(a, buf) : 0;
+}
+
+static ssize_t f2fs_base_attr_store(struct kobject *kobj,
+				struct attribute *attr,
+				const char *buf, size_t len)
+{
+	struct f2fs_base_attr *a = container_of(attr,
+				struct f2fs_base_attr, attr);
+
+	return a->store ? a->store(a, buf, len) : 0;
+}
+
 /*
  * Note that there are three feature list entries:
  * 1) /sys/fs/f2fs/features
@@ -882,14 +907,13 @@ static void f2fs_sb_release(struct kobject *kobj)
  *     please add new on-disk feature in this list only.
  *     - ref. F2FS_SB_FEATURE_RO_ATTR()
  */
-static ssize_t f2fs_feature_show(struct f2fs_attr *a,
-		struct f2fs_sb_info *sbi, char *buf)
+static ssize_t f2fs_feature_show(struct f2fs_base_attr *a, char *buf)
 {
 	return sysfs_emit(buf, "supported\n");
 }
 
 #define F2FS_FEATURE_RO_ATTR(_name)				\
-static struct f2fs_attr f2fs_attr_##_name = {			\
+static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
 	.attr = {.name = __stringify(_name), .mode = 0444 },	\
 	.show	= f2fs_feature_show,				\
 }
@@ -1258,37 +1282,38 @@ static struct attribute *f2fs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs);
 
+#define BASE_ATTR_LIST(name) (&f2fs_base_attr_##name.attr)
 static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_FS_ENCRYPTION
-	ATTR_LIST(encryption),
-	ATTR_LIST(test_dummy_encryption_v2),
+	BASE_ATTR_LIST(encryption),
+	BASE_ATTR_LIST(test_dummy_encryption_v2),
 #if IS_ENABLED(CONFIG_UNICODE)
-	ATTR_LIST(encrypted_casefold),
+	BASE_ATTR_LIST(encrypted_casefold),
 #endif
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
-	ATTR_LIST(block_zoned),
+	BASE_ATTR_LIST(block_zoned),
 #endif
-	ATTR_LIST(atomic_write),
-	ATTR_LIST(extra_attr),
-	ATTR_LIST(project_quota),
-	ATTR_LIST(inode_checksum),
-	ATTR_LIST(flexible_inline_xattr),
-	ATTR_LIST(quota_ino),
-	ATTR_LIST(inode_crtime),
-	ATTR_LIST(lost_found),
+	BASE_ATTR_LIST(atomic_write),
+	BASE_ATTR_LIST(extra_attr),
+	BASE_ATTR_LIST(project_quota),
+	BASE_ATTR_LIST(inode_checksum),
+	BASE_ATTR_LIST(flexible_inline_xattr),
+	BASE_ATTR_LIST(quota_ino),
+	BASE_ATTR_LIST(inode_crtime),
+	BASE_ATTR_LIST(lost_found),
 #ifdef CONFIG_FS_VERITY
-	ATTR_LIST(verity),
+	BASE_ATTR_LIST(verity),
 #endif
-	ATTR_LIST(sb_checksum),
+	BASE_ATTR_LIST(sb_checksum),
 #if IS_ENABLED(CONFIG_UNICODE)
-	ATTR_LIST(casefold),
+	BASE_ATTR_LIST(casefold),
 #endif
-	ATTR_LIST(readonly),
+	BASE_ATTR_LIST(readonly),
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	ATTR_LIST(compression),
+	BASE_ATTR_LIST(compression),
 #endif
-	ATTR_LIST(pin_file),
+	BASE_ATTR_LIST(pin_file),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
@@ -1362,9 +1387,14 @@ static struct kset f2fs_kset = {
 	.kobj	= {.ktype = &f2fs_ktype},
 };
 
+static const struct sysfs_ops f2fs_feat_attr_ops = {
+	.show	= f2fs_base_attr_show,
+	.store	= f2fs_base_attr_store,
+};
+
 static const struct kobj_type f2fs_feat_ktype = {
 	.default_groups = f2fs_feat_groups,
-	.sysfs_ops	= &f2fs_attr_ops,
+	.sysfs_ops	= &f2fs_feat_attr_ops,
 };
 
 static struct kobject f2fs_feat = {
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
