Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF5E6C93
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 07:55:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOywI-00042c-He; Mon, 28 Oct 2019 06:55:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOywH-00041e-0F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I8jWBG32k4uSLCihJgM8NXVjtw4YrsVbXVHdM3cVZ4o=; b=Q/IVL+mhckO/CsFfqTmgPfBO+4
 kS5oImyIk62rsBAxAcl6Ag+iBy7K/eZyp7NaXG9h2M3RATr17wap/CLFC7Z+vfjeec/pVIWSj6Rwr
 euJ6lQNVJ09XaYN3bWd5H2HRTIMA7blVk2UuA4RpgLDaZhaV02c891r9s8kg3jgCMNks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I8jWBG32k4uSLCihJgM8NXVjtw4YrsVbXVHdM3cVZ4o=; b=jb9g84Da7BDn6SBTO6rPQaM5nd
 XrKrEqnzvfkZrc22DYfFrTlBu2WxQRbgN1zhtu3yluimpDLo1nxLlDTtffPx1Wbm5V4Ksw/fWsTsV
 PRM7//z7x/+DIqn9Uoyi2wkxE8d2YjY0HSWrkxo4ZvG4mz6BcK+M49As7ciG91zZKRH4=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOywB-0067BT-AK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572245736; x=1603781736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwNFvCh8qI5bDXKooY2DLOsj+GIyImOtvB3aYH4LtlI=;
 b=OaxvkSYJhLYIWEtHPFg7Anz97fQx4ninsCF+TTaZSrQxCEBM26Jk3kYL
 /nLVmbiCqDSoochkBAmsMRnIOnGJqMAvwqgnCGcNdDdV/2wgnyj354EsO
 CQ0vPAUDv6SHglFEg62u00ZUK3lYsJURp0ZFnx4tzvhp1ucXq1//cV8uM
 zXXaNwfE8mpgMrYTt34jtDsYh0zdwOi7MhFjOzzz+6lbsjAGAR+HuQ+bx
 hZaB/7+G1OIeTQBp99n1JictElSBIVyW0oRBs8w3Q0vMNE61l0DZF8q8z
 7fzQ/LRy5e8eC6TD3uP7vBzbhezsXuZDytZiDSa1+QtzXYzWbmR45wZsD w==;
IronPort-SDR: SM7+Tj5FhTEJwEUqgXfEc4QtSx2AEWjjQM3YysfTVF+yQ89rGx+BD7cj3pv833YQtmMi7yBc2t
 j1JrG0cPra5F9/MS9noloyjc//kL+9IMUmvgm+cMKvQlto3SFqRTtCBKTGTloXHATcq4UdyJeB
 4BVDfrJl4RYniXisdbbfEaSJMLR/p9dIlgtEZnz9o1Cdo83L/QsIo+KLgDmBXXufI6q56KrQtf
 RjfieKXfkIRQZaVFCxZ6w5TiPUoNZVEJOeRfOFbaIzuv00bHC+v2yyEa/BSUSmZlmN40AR0WW2
 uDA=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="125879637"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:26 +0800
IronPort-SDR: 9cw53k/GAtwGhn37PCHME5yZAt2aCUt+R31w8NqlvL0P23QDAThp1lVIyDbEAxuScUTqhYs4Rm
 IwLbVDwK8yg1B1ZxxN9U2e7jjpME3PqPsJXyb8j/kId2UB+6tdx8V0QLyDvZyTXvj1ikL2MXgb
 OzXO6gv4KfvatQkOKcJPxbP+zQPcI8Hd6cBOkYR2aWq8rcPBO7B8Ma6wt0OS81Pvv06g4b6tRQ
 kk3o2DoAWy+PoYhZxqeC4EvQeZIu0n8oaBKhXqE8igXQZ9x+S282THl6+W90TXYPoYGudAGsMY
 7CvAkp34l1qlAkjkYjrwgU2J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:47 -0700
IronPort-SDR: UD9KOnrVwU7BuwywI/NVWuLBpw4nssFgmpydAAvBRTrc6G97csc3Duzy+MkSm3Flm1RusdB6H9
 FIqRN7Qop8k74p3sPZhPByrMF2Ihipq1TOso5WcHW9pLWCOfLz9w9iB7uQBufBE+6cb5POA3fW
 JQGkb5Gr0i8BQ+LcY4wJIQYpCuELQmlOqEfZoArzs7QCbA/3wKO6MBZiNhT4SuDziKSXUuYtAE
 E0sWoPXN5jw4FOtVVNpKnSSDLS/ALTAyUCxjVSzoaqe++qhxnZ0TqexNZ5CtNbeJqHluJ8HoUP
 +HY=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:25 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:10 +0900
Message-Id: <20191028065512.27876-7-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iOywB-0067BT-AK
Subject: [f2fs-dev] [PATCH v6 6/8] fsck: Check fsync data always for zoned
 block devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fsck checks fsync data when UMOUNT flag is not set. When the f2fs was not
cleanly unmouted, UMOUNT flag is not recorded in meta data and fsync data
can be left in the f2fs. The first fsck run checks fsync data to reflect
it on quota status recovery. After that, fsck writes UMOUNT flag in the
f2fs meta data so that second fsck run can skip fsync data check.

However, fsck for zoned block devices need to care fsync data for all
fsck runs. The first fsck run checks fsync data, then fsck can check
write pointer consistency with fsync data. However, since second fsck run
does not check fsync data, fsck detects write pointer at fsync data end
is not consistent with f2fs meta data. This results in meta data update
by fsck and fsync data gets lost.

To have fsck check fsync data always for zoned block devices, introduce
need_fsync_data_record() helper function which returns boolean to tell
if fsck needs fsync data check or not. For zoned block devices, always
return true. Otherwise, return true if UMOUNT flag is not set in CP.
Replace UMOUNT flag check codes for fsync data with the function call.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.h    |  6 ++++++
 fsck/mount.c   | 14 +++++++-------
 fsck/segment.c |  2 +-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 8da0ebb..75052d8 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -133,6 +133,12 @@ enum seg_type {
 
 struct selabel_handle;
 
+static inline bool need_fsync_data_record(struct f2fs_sb_info *sbi)
+{
+	return !is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG) ||
+		c.zoned_model == F2FS_ZONED_HM;
+}
+
 extern int fsck_chk_orphan_node(struct f2fs_sb_info *);
 extern int fsck_chk_quota_node(struct f2fs_sb_info *);
 extern int fsck_chk_quota_files(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 915f487..2979865 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1525,7 +1525,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 
 	bitmap_size = TOTAL_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
 
-	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+	if (need_fsync_data_record(sbi))
 		bitmap_size += bitmap_size;
 
 	sit_i->bitmap = calloc(bitmap_size, 1);
@@ -1540,7 +1540,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 		sit_i->sentries[start].cur_valid_map = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 
-		if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
+		if (need_fsync_data_record(sbi)) {
 			sit_i->sentries[start].ckpt_valid_map = bitmap;
 			bitmap += SIT_VBLOCK_MAP_SIZE;
 		}
@@ -1887,7 +1887,7 @@ void seg_info_from_raw_sit(struct f2fs_sb_info *sbi, struct seg_entry *se,
 {
 	__seg_info_from_raw_sit(se, raw_sit);
 
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return;
 	se->ckpt_valid_blocks = se->valid_blocks;
 	memcpy(se->ckpt_valid_map, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
@@ -1903,7 +1903,7 @@ struct seg_entry *get_seg_entry(struct f2fs_sb_info *sbi,
 
 unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
 {
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return se->valid_blocks;
 	else
 		return se->ckpt_valid_blocks;
@@ -1911,7 +1911,7 @@ unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
 
 unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
 {
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return se->cur_valid_map;
 	else
 		return se->ckpt_valid_map;
@@ -1919,7 +1919,7 @@ unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
 
 unsigned char get_seg_type(struct f2fs_sb_info *sbi, struct seg_entry *se)
 {
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return se->type;
 	else
 		return se->ckpt_type;
@@ -3242,7 +3242,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 	struct list_head inode_list = LIST_HEAD_INIT(inode_list);
 	int ret;
 
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return 0;
 
 	ret = find_fsync_inode(sbi, &inode_list);
diff --git a/fsck/segment.c b/fsck/segment.c
index ccde05f..17c42b7 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -62,7 +62,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 	se->type = type;
 	se->valid_blocks++;
 	f2fs_set_bit(offset, (char *)se->cur_valid_map);
-	if (!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG)) {
+	if (need_fsync_data_record(sbi)) {
 		se->ckpt_type = type;
 		se->ckpt_valid_blocks++;
 		f2fs_set_bit(offset, (char *)se->ckpt_valid_map);
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
