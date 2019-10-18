Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293FDBDF3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLMEB-00008K-2Q; Fri, 18 Oct 2019 06:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME9-000085-VG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TBEJKI+zUp9I/ZHtb5BdzkayDhgHcPTuWlC2rTN9g7U=; b=BECHSx/T5Eds1ELWXnvskR7SAs
 fQSm+QUcBTZ9WeZeP91HtQKNZxGpE1qY1lnEn5dFU+95cByyjKxuOT8mIQkeIYIXeteDSfgMk39k9
 6pYdXmSqVfiwUpoVP0oT2Zk9GYUviz5WRUuXYO3+TBueRhz6+j5hUyauUjupEiPrSWfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TBEJKI+zUp9I/ZHtb5BdzkayDhgHcPTuWlC2rTN9g7U=; b=UamS2wdbNqnuLLy5IdQL/Fgr6v
 RC2pYdimRvH2OiCgzMw0lggFlyVfTGzcY8O/i0ASm9B7ihBcE5IIC5NEoYHRiw1yGmrzkT6AhUMFW
 r+TRZuXGJ9d5Nl05Wc+DdYC8s3jIJxH+gqSL7FvcMacQVoRbHtiu92LaiEy2xbP1W00g=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME8-00DD9Y-E1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571382007; x=1602918007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wgPklxg7EbkJh77IPKbRdLWLjqgjd9IYYQ/nz4Re/RU=;
 b=HV97YgMDDXRdx87lvS9TpE2otslqvy5NVqfRvSEkev4kqnkvOxqrFRew
 1iv1knmbwi7zRa1yl6nHC6IYcUi9qIfWg4CeXGlrOGOMKNteKARkjneyJ
 q8DPCl9+XB6ecxg4H7297RQ64W3d40Vbz0nJvFsMrhIpjJdwDkP/B5r/a
 bRcbBfpcLBzkgzFtrEpF0RmJ4RUTY3+UwrKl5M/BDKkvEdN8h1jlu28+2
 wNvb2hsv7IFjKdlbO0siJgB8SVKrlK6GsxXZ7L0ao/qe/ygyGDSwg26Yv
 ppJD0yKrqoxSMy0eut1vpw4Iv2kEoCdeQPLsZQ7hqIXpmXQGbM4ojiyTB w==;
IronPort-SDR: c3lMsLM17SoSkVSvML2rwN3H6f5wLbRXxZXGOlbo75s9OzbyeXnrnDsv/IiQ8aSXLg7roctPzR
 1kbKrUsPl1uMg85X2/6Mc9Q3bA46vZIX9bmXUKUt8tEU+aldB/oEttnFCZrWSgw0RoecPOibij
 8E/+cC9kwzZxs+dRG7miZVkiPaO1wVF7tYlSNWNFuF+OcD/HY4jPtuoxtUq/4tDrCtNgTfc9ah
 nAVo7bsqLg6AZYWLhqlOQhMOih9/oaLq9GUNHu610NWpEW339jrRzAFFhvI3uKE4CxXSoWizvS
 6n8=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884349"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:12 +0800
IronPort-SDR: mo9id+jbH93YzfGhkueZ7gA9KgtmYgR0C2vG/fSoO2V3IO4v32hV7lixiaq2uy4luvmHANJbBO
 RxbXYNYdQDstOi4y8dUR0odA2ocDuZ+3nrcgrL9EI9+qM9OGTgcl+IumnTUO63tiGOvQH68QNn
 YigaWCfqKgym4hNpyhdwlFd/TDk1eFt2b188navCUPDEdDJMsWoJH5xapMm5vWZAIb0zYJz/HS
 VvP9PgKk1XinEd+jecFKNaLC5kuAy/Nf11BoMVgzVkOxj4jacWXf+3scVtZEsxhyI9DifwzDHc
 r9Oph5zaNL984Zp/l9eXO3qq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:33 -0700
IronPort-SDR: QkrezDHvuR0JnFSmBRE1aGkpZ4q7aPZXyuFb5iVukXYio3U2UnZKnFL4ppaa1B3UOtK4BtWZSa
 VnWylr5Ea5LdcaDBY7Welp7SZFEgV3AEZ9d1fcCyw0SgG1ssQHbxzktHbUeySYkbGB/EOiZxIb
 2mv4cHTWrn7oj+zTb+Pbh9YcdtHA0DyJjLetiElVNtrGs4dC9fz6KP3P6ugYgxjz/0yTS0YGZD
 PCqLQP53L3JUZgrHnb+sS7AeHCUs16OHpi8BgGz0XXTqWkU/A6g0ja3ZnrHSb7SHrTeU2HktTW
 sZY=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:48 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:38 +0900
Message-Id: <20191018063740.2746-7-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iLME8-00DD9Y-E1
Subject: [f2fs-dev] [PATCH v5 6/8] fsck: Check fsync data always for zoned
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
