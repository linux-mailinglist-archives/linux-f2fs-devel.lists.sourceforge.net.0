Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0927AD7325
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 16:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qc9HDjVPP6CqnaNsetPTRbUhM8rLAYAZpxmfrEloDOY=; b=TVzENKP37K80Qa9kMHtXLn+h6b
	2EOzBPI5DuPoeJiAfEtCjR68emvX75QDC/mgrMj3+tYcCFVGWPNOCxGG4fWPicbU3aECnGFZoHA88
	yPYpNXlGX60IOyPIUUnJNTs5xUpolB+a9Umdkl/5pI4T/MTmGhrO8KEoXaPxlIDQ2k+o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPiYm-0006Jq-QV;
	Thu, 12 Jun 2025 14:05:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPiYl-0006JY-0x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 14:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9NYizaC+eczUkz4B/9WF6EDoKlO57Nc74BvrQaK9OQ=; b=S8+nmaYVKMzFlTGvJFap4AhE0l
 dPATa1SlYA7rLyN15xjPvFY9Wo0NkjY9T3vOsTNC0bWxvJyvTRq7InjA51TUr9/q6+s69uoNZZohq
 dROf0N9Edj5R6bYUlPNVRBy1yRBjRQ52+sXgG2KofzSmKv0+1AsJqrujWGttUI+ht8IA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b9NYizaC+eczUkz4B/9WF6EDoKlO57Nc74BvrQaK9OQ=; b=H
 DPQl1OKOs1lo14JVIU50WmRrz00QQVf08K48GjCgtoDRHBCajhDLqT5X9IJYowyzOZ9UQAmdpQf0Z
 KNiPVH0VXzEDHXdFcIAILbLfKnknfOmpuFLYmfsCDuPGwwgCgfYdq0vr/Zwe05eBG8SiVTqjliyPh
 XWXHsh6zWGrxLlWA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPiYk-0004fc-HE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 14:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3401643FC2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jun 2025 14:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46230C4CEEA;
 Thu, 12 Jun 2025 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749737133;
 bh=nIwQa+mlLJWbBfrzS2N0M8rMHMjUKwQdZhUJBoyfG/w=;
 h=From:To:Cc:Subject:Date:From;
 b=jDh+STQqbL4vbcLlM9UZu+sTS/XDBoBRloMSaa2X68263QKs5ehPswuW+DV7WjMr7
 mrMgGeFUe3B06Ng55eDwbEwN0QHK3ty47qBYIcah0lE+21SN4M8UdfizYTgv7o7LnD
 LpzCrtES/XxGHK5zQeJfRVgXLkr/Ik+71HTh3JsX/DujBKNS4A4nEFrsORmhTCOMY2
 w6epVLxMk9oiXJhv3bDcc3jY3WPlIdKMpzQhbyOssvzmG61n82ilffPTYNvTqlqLEH
 H/q2dHiaHIjO/sOtHh/yCLVRfTUCKdHtvME4AoB1hK7m6Hms5Szbth9AhZlP3T022/
 jreG4HCCtJyZw==
To: jaegeuk@kernel.org
Date: Thu, 12 Jun 2025 22:05:26 +0800
Message-Id: <20250612140526.6435-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section
 for tuning @needed parameter of has_not_enough_free_secs(), if we configure
 it w/ zero, it can avoid f2fs_gc() as much as possible while f [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPiYk-0004fc-HE
Subject: [f2fs-dev] [PATCH] f2fs: introduce reserved_pin_section sysfs entry
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

This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
@needed parameter of has_not_enough_free_secs(), if we configure it w/
zero, it can avoid f2fs_gc() as much as possible while fallocating on
pinned file.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
 fs/f2fs/f2fs.h                          | 3 +++
 fs/f2fs/file.c                          | 5 ++---
 fs/f2fs/super.c                         | 3 +++
 fs/f2fs/sysfs.c                         | 9 +++++++++
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bf03263b9f46..c2a233f2a085 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -861,3 +861,12 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
 		SB_ENC_STRICT_MODE_FL            0x00000001
 		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
 		============================     ==========
+
+What:		/sys/fs/f2fs/<disk>/reserved_pin_section
+Date:		June 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This threshold is used to control triggering garbage collection while
+		fallocating on pinned file, so, it can guarantee there is enough free
+		reserved section before preallocating on pinned file.
+		By default, the value is ovp_sections, especially, for zoned ufs, the
+		value is 1.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..fa27498202a3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1724,6 +1724,9 @@ struct f2fs_sb_info {
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
+	/* free sections reserved for pinned file */
+	unsigned int reserved_pin_section;
+
 	/* threshold for gc trials on pinned files */
 	unsigned short gc_pin_file_threshold;
 	struct f2fs_rwsem pin_sem;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..a909f79db178 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			}
 		}
 
-		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
-			ZONED_PIN_SEC_REQUIRED_COUNT :
-			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
+		if (has_not_enough_free_secs(sbi, 0,
+				sbi->reserved_pin_section)) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 57adeff5ef25..48b97a95fd63 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
+	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
+			ZONED_PIN_SEC_REQUIRED_COUNT :
+			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..51be7ffb38c5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "reserved_pin_section")) {
+		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
+F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(last_age_weight),
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
+	ATTR_LIST(reserved_pin_section),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
