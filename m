Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B895AD82B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 07:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bj8Ctnk6YHikKZNFnidns81yNGEXyhEHR/NMudn4G0U=; b=ak5ChNQ6rBwXfFoYDkImdw6Rg0
	ORhUOIGh+aGqZnrInGcm0Vc8n8BHLG30kruXRzpS9JaCLOQLtj54lQxv0CfC8ZTnPX7NFBaZdLPTu
	gxp75oS1mGlfFU2EuvUa2sO1p7OF6iepTFae/9AqA4a77NrTCFHL8uf4cIAN8HCUjxWY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPxKC-00028r-CP;
	Fri, 13 Jun 2025 05:51:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPxK1-00028d-RT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 05:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7OnObjbTyatAwcl9xi0jl8VZQKal+OhuXLFRzbdShA=; b=BLMclJ161JcoRdPvT2aN7xafU7
 PUKTrUy2VNWiaeBAeFfTIuEfnPuVXd2F/PFYFN/Wj8wK6m4TcSZ7HBm2TCu8S+LzEfEYRDjReBwiS
 RWBgbqi680FERL03CxFc/4ECkZYWip4p9pNkjo3O0XycT/FVnVYJIQu+keEUzk2xgqZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P7OnObjbTyatAwcl9xi0jl8VZQKal+OhuXLFRzbdShA=; b=U
 IzqsBku9JeT75TkzTmDnnrJ5QQi4fzGVHeeEmeHcOBhL7VOBZA5iam2d2nR3pIXNSVvAFrLCgs1MV
 GI+Hnl0k1DEBZfKg8JQ/3JRYs005QgkDY3+efMZiUpzkIzseDPoEmyQfDQfN2AVPW83zgP/sGwq8e
 1Rklj78kVcXVcl5Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPxK1-0001hA-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 05:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53E685C66DF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Jun 2025 05:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8720CC4CEE3;
 Fri, 13 Jun 2025 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749793874;
 bh=KRqlg4gXsASPE1ojCNZ9bKXs5qtVRlaikINe1tozUSM=;
 h=From:To:Cc:Subject:Date:From;
 b=TweeflZXYV+3wWq9a1bm/ghWAbK31EjDAGur8bZZcdSbXVsfjCV8YQ9H+xcJwge16
 hV7Nf7GR+zT9j3LZTk14gj7ZalL6/J2Uzf3KJv9LIu+AuCeGgL2z/tkBw7T+IkRj03
 YWHV9aO6X/o15NEzi+nnPkEwiCYQhX8p2QdIYRcmfLMHtPJ1PwpzJICvK5uQ3gfbrJ
 zVoLj1rrSX1j4deGYL2QfEdg2UE7vnZoCclXTj2g0R6YUga3/uLZOgAG8x4SRJ4J22
 qndFn76Do3YcRdE04+UNCb+x2koZ8xIkLj4tf5VrmNV1HMWEXoO82KaB0DwTYI19Vi
 B3LPanFOS/bRA==
To: jaegeuk@kernel.org
Date: Fri, 13 Jun 2025 13:51:09 +0800
Message-Id: <20250613055109.2335-1-chao@kernel.org>
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
X-Headers-End: 1uPxK1-0001hA-Bc
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce reserved_pin_section sysfs
 entry
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
v2:
- assign SM_I(sbi)->ovp_segments after f2fs_build_segment_manager()
 Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
 fs/f2fs/f2fs.h                          | 3 +++
 fs/f2fs/file.c                          | 5 ++---
 fs/f2fs/super.c                         | 4 ++++
 fs/f2fs/sysfs.c                         | 9 +++++++++
 5 files changed, 27 insertions(+), 3 deletions(-)

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
index 57adeff5ef25..e0ecc341f1d3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5017,6 +5017,10 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* get segno of first zoned block device */
 	sbi->first_seq_zone_segno = get_first_seq_zone_segno(sbi);
 
+	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
+			ZONED_PIN_SEC_REQUIRED_COUNT :
+			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
+
 	/* Read accumulated write IO statistics if exists */
 	seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
 	if (__exist_node_summaries(sbi))
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
