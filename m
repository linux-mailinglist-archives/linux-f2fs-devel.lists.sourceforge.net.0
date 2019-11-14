Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061DFBEB0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70N-0005EH-Jy; Thu, 14 Nov 2019 04:45:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70K-0005Du-8N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qJtdqqquyU1IT2SMmY8PeViWrp+9WN75owPjHkwZFjM=; b=Uk8lzcUqbfGri1SSHNa8sYH/m/
 YrVFpgzr6WgQ6h9bfql+/VWYz+FEM+lOxqbZo3yA4iZZ/Y5N+iW/COKyjaVuHbTTk7Cizzm8YXYEE
 ximRXysy7fvvNk1Q9MBRcn8y3cqSQSDZx1GFF5OmMKBgDrigyDUabeGFPpSP1/gCaB4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qJtdqqquyU1IT2SMmY8PeViWrp+9WN75owPjHkwZFjM=; b=U5bIOrQy1odLkpM4VqgLidfqJc
 O0/CR3lYapn0TAcJ09s7r/QZJYYYsv/KejvDBot9ALKpq1EJx3q03H5qYwucBjIDsIpf0s4LXK5/4
 1rDfIRUl3/a3iMSfLbuJkf1psGLho9/e+BBbwNblt+m/CvsURuxI6m3HctXq37lkU1u8=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70G-002ZCm-Gr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706709; x=1605242709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oKzfeCojQHVyfQnCv3v9JkTSDE2OR2NvEx8txKSofWE=;
 b=nbUgIj5jQBVrWLIXNUEwKh5tL//Edv3i5a9B/ZcauK/z/zdJNaKH4399
 0UtkNM59YCBCsODOfjjsVKModfMPXmaDfeEYPCIZ1rgyLpKXoBI7Ig1Q3
 egwn8JdJ1fsTta30PwM1LRcBLoXmM0p1ocGx+WUAdFnG7uPJfM53j1D8F
 K0YZ2dqqVVfhJR0j4Puc4tQ/hNK930cdajLraK5x1NkTy2VgYAU3IOE5w
 MhdoSbDvqbfMJW+yY/2RApi5SElyESnpnsCc4GYjqiQPdYV/AZ0Kj8FqE
 YdEaFtXjHQ44K8LX4JW5f2ZC4g+bnC85MsVLaoI6RBpUEi7dkvvExZjzJ w==;
IronPort-SDR: gGqtE+f4Cv7lXr/FI2gx2gbu1Mw9GQ0iKN0ulu1YxHE7/vJf9ddTVD4jcg1VvEG+fF4Uf2/7Bk
 TfFbXGPraVOAgRRtyy+6loIn59LbT2NPyQFQ9jq9x1EgpuYVWD7+MC5MfE5zeuuYfozwCw7U38
 n963dl/agid17ewbjJEoxIbFAbzccMw/MYXIEY9OZBaTRr+2s0Q8ctQkusgNBck/BGrZdQqif3
 iBa1ZFXk6ufZ1jrwYKZCrojSMo+gsswgwAE63l/XEYCr5FPbkTZGfJD/0PtHlO/mtwR6K2OGdu
 Ug8=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411457"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:06 +0800
IronPort-SDR: OiMzT7vw65+EMq2lPwi4XMtgIPBPJnC6L/K4nUxZ+OzSbrhCviolRlpAf++qtS8cugZQpZi02e
 wPyvINfI5L1VzoNzJnyw9XeNe+dmLO71CnGhSjm5rzjA00CFLhm7Zj1XIpXHgPlaCVIpqLOsAw
 4XyDDG9Avq8pVE1iiEuaU28N+D7yUJe5Cl6JQZsG7Xn2WvFoPeEtY8ElAWRMTFzKoYO5jFSTjZ
 5H4vO8VJW/yaHn//IzNVSy6QglIFb3ln1TBlFbFMNZYdpJUiSGMgdcqXFEHoTDgvUQ8GR1onIx
 N9lpZSJKPauslqWTnozZH/XD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:40:05 -0800
IronPort-SDR: /pt3PdcZyhqQXhYSRxrg9w4BUbkE8OrBZuqT2wQz8tPszK8qWhPzza1s6IWcFhWaKH0v38PcBO
 IDR3oTJzkXh3WahnlIMctY68yURrJ5F2GNQF0/sii8XJgIACMH3+yjkjIim2sDEmHLKbDgEj18
 hzlEQU7Pj6bRTRTjePk1CmSIeblp0JIo71SMjK7SQAUEXa2aZGq1LdrtHCb7fTOiaVvpEuYgdU
 VHV7eoSuGtdhGYFUhWSyROi3JmB9UXhCEDikk+qPgDzfxfW3COfuYikOLQl0NqiCIecbbrmIEz
 v8s=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:06 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:54 +0900
Message-Id: <20191114044454.200461-9-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iV70G-002ZCm-Gr
Subject: [f2fs-dev] [PATCH v7 8/8] fsck: Check write pointer consistency of
 non-open zones
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

To catch bugs in write pointer handling code for zoned block devices,
have fsck check consistency of write pointers of non-open zones, that
current segments do not point to. Check two items comparing write pointer
positions with valid block maps in SIT.

The first item is check for zones with no valid blocks. When there is no
valid blocks in a zone, the write pointer should be at the start of the
zone. If not, next write operation to the zone will cause unaligned write
error. If write pointer is not at the zone start, reset the zone to move
the write pointer to the zone start.

The second item is check between write pointer position and the last
valid block in the zone. It is unexpected that the last valid block
position is beyond the write pointer. In such a case, report as the bug.
Fix is not required for such zone, because the zone is not selected for
next write operation until the zone get discarded.

In the same manner as the consistency check for current segments, do the
check and fix twice: at the beginning of do_fsck() to avoid unaligned
write error during fsck, and at fsck_verify() to reflect meta data
updates by fsck.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 37ac30a..fee51f3 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2749,6 +2749,122 @@ out:
 	return cnt;
 }
 
+#ifdef HAVE_LINUX_BLKZONED_H
+
+struct write_pointer_check_data {
+	struct f2fs_sb_info *sbi;
+	int dev_index;
+};
+
+static int chk_and_fix_wp_with_sit(int i, void *blkzone, void *opaque)
+{
+	struct blk_zone *blkz = (struct blk_zone *)blkzone;
+	struct write_pointer_check_data *wpd = opaque;
+	struct f2fs_sb_info *sbi = wpd->sbi;
+	struct device_info *dev = c.devices + wpd->dev_index;
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	block_t zone_block, wp_block, wp_blkoff;
+	unsigned int zone_segno, wp_segno;
+	struct curseg_info *cs;
+	int cs_index, ret, last_valid_blkoff;
+	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
+
+	if (blk_zone_conv(blkz))
+		return 0;
+
+	zone_block = dev->start_blkaddr
+		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
+	zone_segno = GET_SEGNO(sbi, zone_block);
+	if (zone_segno >= MAIN_SEGS(sbi))
+		return 0;
+
+	wp_block = dev->start_blkaddr
+		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
+	wp_segno = GET_SEGNO(sbi, wp_block);
+	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+
+	/* if a curseg points to the zone, skip the check */
+	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
+		cs = &SM_I(sbi)->curseg_array[cs_index];
+		if (zone_segno <= cs->segno &&
+		    cs->segno < zone_segno + segs_per_zone)
+			return 0;
+	}
+
+	last_valid_blkoff = last_vblk_off_in_zone(sbi, zone_segno);
+
+	/*
+	 * When there is no valid block in the zone, check write pointer is
+	 * at zone start. If not, reset the write pointer.
+	 */
+	if (last_valid_blkoff < 0 &&
+	    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
+		if (!c.fix_on) {
+			MSG(0, "Inconsistent write pointer: wp[0x%x,0x%x]\n",
+			    wp_segno, wp_blkoff);
+			fsck->chk.wp_inconsistent_zones++;
+			return 0;
+		}
+
+		FIX_MSG("Reset write pointer of zone at segment 0x%x",
+			zone_segno);
+		ret = f2fs_reset_zone(wpd->dev_index, blkz);
+		if (ret) {
+			printf("[FSCK] Write pointer reset failed: %s\n",
+			       dev->path);
+			return ret;
+		}
+		fsck->chk.wp_fixed = 1;
+		return 0;
+	}
+
+	/*
+	 * If valid blocks exist in the zone beyond the write pointer, it
+	 * is a bug. No need to fix because the zone is not selected for the
+	 * write. Just report it.
+	 */
+	if (last_valid_blkoff + zone_block > wp_block) {
+		MSG(0, "Unexpected invalid write pointer: wp[0x%x,0x%x]\n",
+		    wp_segno, wp_blkoff);
+		return 0;
+	}
+
+	return 0;
+}
+
+static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
+{
+	unsigned int i;
+	struct write_pointer_check_data wpd = {	sbi, 0 };
+
+	if (c.zoned_model != F2FS_ZONED_HM)
+		return;
+
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (!c.devices[i].path)
+			break;
+		if (c.devices[i].zoned_model != F2FS_ZONED_HM)
+			break;
+
+		wpd.dev_index = i;
+		if (f2fs_report_zones(i, chk_and_fix_wp_with_sit, &wpd)) {
+			printf("[FSCK] Write pointer check failed: %s\n",
+			       c.devices[i].path);
+			return;
+		}
+	}
+}
+
+#else
+
+static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
+{
+	return;
+}
+
+#endif
+
 /*
  * Check and fix consistency with write pointers at the beginning of
  * fsck so that following writes by fsck do not fail.
@@ -2764,6 +2880,8 @@ void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
 		fix_curseg_info(sbi);
 		fsck->chk.wp_fixed = 1;
 	}
+
+	fix_wp_sit_alignment(sbi);
 }
 
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
@@ -2982,6 +3100,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			fix_hard_links(sbi);
 			fix_nat_entries(sbi);
 			rewrite_sit_area_bitmap(sbi);
+			fix_wp_sit_alignment(sbi);
 			fix_curseg_info(sbi);
 			fix_checksum(sbi);
 			fix_checkpoints(sbi);
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
