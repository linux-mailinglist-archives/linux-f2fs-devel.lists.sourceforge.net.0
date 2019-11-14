Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C82FBEA9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70L-0007bZ-9b; Thu, 14 Nov 2019 04:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70K-0007bI-0X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x4PH0Oqb39Ry0rT+IQomP/wdNXm27ZR035NMHrYLn8g=; b=EkmNeH7de+mghCFm8EH/m7Kr1R
 9dIzO+es2PF+Gb2hTmvs6xvkPoX0rSs0G4bmFYDJRGnwmcRINPq4Yc4nHEIcLxetKkuZ77WLyAoXF
 K9OGmieP4EMjTTjwKSkd3lYyjK4kgTnGJKjgSECnSVDLOZbHLw0lpZ8cPl1ryoQu/fq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x4PH0Oqb39Ry0rT+IQomP/wdNXm27ZR035NMHrYLn8g=; b=eBq8VHXiNmGmPn+O7EJoIJO9sS
 31KvE8e+PAL0SQhKtDro0SDvFabaCwplu3WyGOzy/NduvQJoT66oSkS3HWy6NyKAspEQHZ/tPPT0Q
 CFNqJ83LEOxNwLVZrfe5nGKzQ5zOwqcmT5ywPpisFzoDmqMRdVLcG5mJkKz8p0aVKicU=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70G-002ZDE-CH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706709; x=1605242709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XmnG2wLjtKJlQue7aagts5j3/txvG9pd8UrIUaBXBzw=;
 b=BHnhmFgpW3sVdmxQvVsF9DmHxqgVPzCFMZFDye1N7xvCPUd4cLLkeDo/
 6jHwKt6yGLTM833uF7s6wdh7Ii6EfwqgmNiDUv8iLMcrr9BGYXmGG6ctx
 BNCqGhMfPMv65HOtHloBhJ5M8tAJeBWRycugUUeMGAjuM/U/ZCNTjAdAI
 sknhnH+MvBhwZkWp3xkMfnHknl3OVpRD+cQ5wtuPloO4bsVQIa5ff7hZh
 Dlh5sGAqNKZeEK5UCcGMhOyiES/p5JvviD8hCx6OP/hXFA3Qphb6YS1Nl
 LoKe5NspliHp1EqggN6RXBXXd3mzQbBPnOAkXEy9Irzs+AmsQJktbMyyd g==;
IronPort-SDR: 1gwWq9mAZourWZL2yb2K2PY4aCkOiCZQj8rofDPWbqF0JFL4dK4iqT2o6rKKsTtSrCYQdxu3N+
 69+Za9/X/KH82Y8p013Ps+8p1j9bOf0yH3x4EC2TLYmtiOC35jxd3x0JTpz0XhDzH53MrRv2ME
 /JTuMGqblKORpS1ObgM0ml0FERljhWf+r2q+/uUKShg32OQ5iG3vHAIaItpu/AuOLobwNw8uhh
 VZuloXOHyaRs1LA+FLdGO+bsTtb2Gi3795nSGwVZrhuA3X7P3nSW+JBoFm3Xsj5CtyL3XGU2sR
 qME=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411453"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:04 +0800
IronPort-SDR: BgziGNy6GLkTfp+iaOd6FFZaA/ryecq2e/K1gYpnegfosq8bfls3zLvx8lyGoHxnKhQ5O9Envv
 Ynpt7NBuwXO2ly+8W6NxbbtA1IAuIr1f8GCSD17MtEQATinEXeGrU2DvFaLtX9wAWoMsciXAp5
 0QVi0OMkxUkLPI65VotOA44dNPOejI5gVEdfJJA9YEVMWcHKjULrlSn96bl9yT52VsHjQPymHh
 SrMX7zWYtGN4wHF2SoL0Q4jZ8QfF1Xb5p1nM31ROtz4B5OfPn4n/oP5WkLZzAoC31lvWs8p1+j
 iv2/kSpkMZw8uO5FoTDwH902
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:40:03 -0800
IronPort-SDR: 60QgFA597OAxOMtLk02JQMbnv/wMhU3rvXtoj+XdUuMchIk1rsrmbjGDLjnnnKpnEAMn+2CBh3
 Jj1htU81MLC0hdVR0jwkjnJXVRblDFT4A65oQE6VFg/KZstZs4vWfWW+bkS8M64cc3VjHquCwM
 xNKwr9gPA59IeDkzVxGWpE3e4xb2UiF9VE4v17om87+ifNk7lWwImh3NpIxzA7Snkv3qteX7QZ
 aiFW6pgCvjx3eAhb9tBnWksS2mNOM/td7Yy0XVsWDdi1+bI/VLPP3WdElaZ0lwmkLefiQF8j0W
 2dc=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:04 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:52 +0900
Message-Id: <20191114044454.200461-7-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iV70G-002ZDE-CH
Subject: [f2fs-dev] [PATCH v7 6/8] fsck: Check fsync data always for zoned
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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
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
index cd6b51b..fdf1dd7 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1540,7 +1540,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 
 	bitmap_size = TOTAL_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
 
-	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+	if (need_fsync_data_record(sbi))
 		bitmap_size += bitmap_size;
 
 	sit_i->bitmap = calloc(bitmap_size, 1);
@@ -1555,7 +1555,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 		sit_i->sentries[start].cur_valid_map = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 
-		if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
+		if (need_fsync_data_record(sbi)) {
 			sit_i->sentries[start].ckpt_valid_map = bitmap;
 			bitmap += SIT_VBLOCK_MAP_SIZE;
 		}
@@ -1902,7 +1902,7 @@ void seg_info_from_raw_sit(struct f2fs_sb_info *sbi, struct seg_entry *se,
 {
 	__seg_info_from_raw_sit(se, raw_sit);
 
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return;
 	se->ckpt_valid_blocks = se->valid_blocks;
 	memcpy(se->ckpt_valid_map, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
@@ -1918,7 +1918,7 @@ struct seg_entry *get_seg_entry(struct f2fs_sb_info *sbi,
 
 unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
 {
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return se->valid_blocks;
 	else
 		return se->ckpt_valid_blocks;
@@ -1926,7 +1926,7 @@ unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
 
 unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
 {
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return se->cur_valid_map;
 	else
 		return se->ckpt_valid_map;
@@ -1934,7 +1934,7 @@ unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
 
 unsigned char get_seg_type(struct f2fs_sb_info *sbi, struct seg_entry *se)
 {
-	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+	if (!need_fsync_data_record(sbi))
 		return se->type;
 	else
 		return se->ckpt_type;
@@ -3258,7 +3258,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
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
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
