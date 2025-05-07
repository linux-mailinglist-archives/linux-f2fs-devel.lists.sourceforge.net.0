Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8DAADD43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 13:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IkAFjbhOnvwnxcWWfLH2lE81Vug4TClPd+vLJVlrAk=; b=Qw7gK5pB00smEqa8lsqs4UOjEC
	BYCl9mY1UB0AGpTRM4hujUe+SzwuiF9rf1NxrSqmpqcZuBjiC2lsa+r9L3e+N50Cical5WxPLqMex
	7aCoVKpbZ8vpisf3PhPFugRKGlUIYW+t4y9uESmVJcSTAYO6UQSIYAW7LzFxj/611lkk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCctW-0005cN-D9;
	Wed, 07 May 2025 11:24:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCctV-0005cB-0p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 11:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O/ST4GMVcUjHTUiesQ+vXYg/DgkjqD3Owu0KpeS7S4E=; b=jJ+WdTyRj2jMhqO2B51Gk3eefr
 2TVm67JQ5p7lnNN818kJaFoI+6LzVvV7QZ1vsGQ6KDvGmRSOjm6GuTvWQ6U5X5WTYw3S9VN8HoG8i
 OVmhmXfTcpFI4eH22qccj5Gk214cF5xghZKVfxf/hzED1XGXLijZCN9zooZp4zXzJhyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O/ST4GMVcUjHTUiesQ+vXYg/DgkjqD3Owu0KpeS7S4E=; b=O
 pEnbR4Zn5TMTro/S+NlfIf5EtfrtLjOknUSOXIvX3MZx5d/2Y5NGSHjb1dsgZdsHrjJNnmLt9tU99
 Ify+RbTZMyej/hmJ/hPmGS/+bj9XKNzFeaT72QelQAFd9oWfmGN3Kmug1zNFcqZp3SmmmtFXBzuJm
 QMjtOjv1sMxa9Hfc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCctF-0002AD-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 11:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0B7C5C4991
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 May 2025 11:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDBDC4CEE7;
 Wed,  7 May 2025 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746617075;
 bh=G1OpaFH341mKUya6UEBR/eabLctftXEu94N55ZxeP7M=;
 h=From:To:Cc:Subject:Date:From;
 b=qU7YTo40uZpmbj+qAGAFSGVxiBARtad3AgWpiPQvhAozDP5+JrrczOupNRlpp8hKE
 HnYsGCoYLXF7hYg48Co5nh5Q9LdVflSCIDZqeCYYSfnLXno7vgROV9DabsuayAzv4q
 QSlxvotEGWWB7tVvDTuqy8E46zg32uJ7Ft9AoMWdJHTIHRHiRg9ky5+2z1WUXZKOX1
 A0G/qAdyuTZ3/DU9dTeN00Ror1O9DhSCSguBj1UikUlp1iqHO01AfRZ/g5vNnxA3hL
 QB2Yj7FMsqvwVDNMK7ijzPYHb6gQFWmUc2B7/Ol5WtV404rzpqQZqj44/2FPrQa+PA
 kP+C/sk3UTojg==
To: jaegeuk@kernel.org
Date: Wed,  7 May 2025 19:24:25 +0800
Message-ID: <20250507112425.939246-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  active_logs, inline_xattr_size, f2fs_fault_info.inject_rate
 in struct f2fs_mount_info should never be negative, change its type from
 int to unsigned int. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/f2fs.h
 | 12 ++++++------ fs/f2fs/inode.c | 2 +- fs/f2fs/super.c | 8 ++++---- 3 files
 changed, 11 insertions(+), 11 deletions(-) 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCctF-0002AD-Ea
Subject: [f2fs-dev] [PATCH] f2fs: use unsigned int type for severial mount
 option variables
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

active_logs, inline_xattr_size, f2fs_fault_info.inject_rate in struct
f2fs_mount_info should never be negative, change its type from int to
unsigned int.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 12 ++++++------
 fs/f2fs/inode.c |  2 +-
 fs/f2fs/super.c |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6fa900600826..85d1c92aa6c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -77,7 +77,7 @@ enum fault_option {
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 struct f2fs_fault_info {
 	atomic_t inject_ops;
-	int inject_rate;
+	unsigned int inject_rate;
 	unsigned int inject_type;
 	/* Used to account total count of injection for each type */
 	unsigned int inject_count[FAULT_MAX];
@@ -173,8 +173,8 @@ struct f2fs_mount_info {
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
-	int active_logs;		/* # of active logs */
-	int inline_xattr_size;		/* inline xattr size */
+	unsigned int active_logs;	/* # of active logs */
+	unsigned int inline_xattr_size;	/* inline xattr size */
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	struct f2fs_fault_info fault_info;	/* For fault injection */
 #endif
@@ -498,7 +498,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
-static inline int get_inline_xattr_addrs(struct inode *inode);
+static inline unsigned int get_inline_xattr_addrs(struct inode *inode);
 #define MAX_INLINE_DATA(inode)	(sizeof(__le32) *			\
 				(CUR_ADDRS_PER_INODE(inode) -		\
 				get_inline_xattr_addrs(inode) -	\
@@ -890,7 +890,7 @@ struct f2fs_inode_info {
 
 	int i_extra_isize;		/* size of extra space located in i_addr */
 	kprojid_t i_projid;		/* id for project quota */
-	int i_inline_xattr_size;	/* inline xattr size */
+	unsigned int i_inline_xattr_size;/* inline xattr size */
 	struct timespec64 i_crtime;	/* inode creation time */
 	struct timespec64 i_disk_time[3];/* inode disk times */
 
@@ -3552,7 +3552,7 @@ static inline int get_extra_isize(struct inode *inode)
 	return F2FS_I(inode)->i_extra_isize / sizeof(__le32);
 }
 
-static inline int get_inline_xattr_addrs(struct inode *inode)
+static inline unsigned int get_inline_xattr_addrs(struct inode *inode)
 {
 	return F2FS_I(inode)->i_inline_xattr_size;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 747857a5b143..137e1458bbef 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -321,7 +321,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		f2fs_has_inline_xattr(inode) &&
 		(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
 		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
-		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %u, min: %zu, max: %lu",
 			  __func__, inode->i_ino, fi->i_inline_xattr_size,
 			  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
 		return false;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b86e42b43ef1..ec296d5d0fd7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -79,10 +79,10 @@ int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 	}
 
 	if (fo & FAULT_RATE) {
-		if (rate > INT_MAX)
+		if (rate > UINT_MAX)
 			return -EINVAL;
 		atomic_set(&ffi->inject_ops, 0);
-		ffi->inject_rate = (int)rate;
+		ffi->inject_rate = (unsigned int)rate;
 		f2fs_info(sbi, "build fault injection rate: %lu", rate);
 	}
 
@@ -1379,7 +1379,7 @@ static int f2fs_default_check(struct f2fs_sb_info *sbi)
 #endif
 
 	if (test_opt(sbi, INLINE_XATTR_SIZE)) {
-		int min_size, max_size;
+		unsigned int min_size, max_size;
 
 		if (!f2fs_sb_has_extra_attr(sbi) ||
 			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
@@ -1396,7 +1396,7 @@ static int f2fs_default_check(struct f2fs_sb_info *sbi)
 
 		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
 				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
-			f2fs_err(sbi, "inline xattr size is out of range: %d ~ %d",
+			f2fs_err(sbi, "inline xattr size is out of range: %u ~ %u",
 				 min_size, max_size);
 			return -EINVAL;
 		}
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
