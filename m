Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C67C6CD93
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Nov 2025 07:01:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n+O3LwNAssBjB2hTVNazSHQR+/N8KvOa0NdPCaWhQX4=; b=FiLtgZCxAq2TOj8gtM7TsRp/Dg
	fRCNrfBXobVzilsSchYDnaqBh7Fyc+yJk+2Wa6LfAgbqki8C781LvFFzzdUsV/rKoYwhQZkm67mY0
	UXwuMcFXO46v/5yNfRflvvP6Zhd8Ztb/7ePvJjDMs2m9H6aaTqeeYP4R+cqWGWlhSPeQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLbGA-0000ws-Mj;
	Wed, 19 Nov 2025 06:01:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vLbG4-0000wO-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 06:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MZPhud8od52BCgGqIiMYwZw4MsJdQ/HMY6OVZrgo2ws=; b=iEO9DOIxAu66X+eGKDswfCew+x
 ABCxSmHvrtIwT0nhH5Vs+oMa6ldoASxFP12z/nnCMrEf1VcR7pemZE8mTvz61uX6TqEBq0uLTD24A
 O5gD12H30q+bYoWe+S//2KizRPEeVKOewxnoL6zwk/9r0dlE1UgBa6bkT8FNDMmNN8fI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MZPhud8od52BCgGqIiMYwZw4MsJdQ/HMY6OVZrgo2ws=; b=J
 u+XCSdOmSvuuKbTYKzycBfQGLExBIA5+PQg3caWLpufDj0M4XRr1i6VJvwai9G6mC8qiInd62tQ7/
 mKvIs/19pF3YDdiOtf6iy3DTWx7Tgm0Iskd+OUGOQnxVp+0LbDHbgGgL0bdibSfpql/oo+i/S4m/0
 8lUFkfJR9d3StXio=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLbG4-0002Ga-Hs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 06:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MZ
 Phud8od52BCgGqIiMYwZw4MsJdQ/HMY6OVZrgo2ws=; b=eL95G/D37I3vXG84yQ
 NjKCgsVeMPfttfpzQu6nv2oJWDmx5ScGcz4c9OGrer4Qen9hD3Dm7lwgd8mJF1Q/
 EFSEbsUlq7GKik0DuWZ0xaxgSzWaqDy2Fb9s5WFbiXpoiO/Ze/g+1JXvaXTmmMr7
 hoQWa10u+xW+sW+7ZC5WnTwys=
Received: from hpz640.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wD3v+kSXR1pVGleAA--.27189S2; 
 Wed, 19 Nov 2025 14:00:51 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 19 Nov 2025 14:00:45 +0800
Message-ID: <20251119060045.52471-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3v+kSXR1pVGleAA--.27189S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4rWr1DWr1UCFy5Kr4DArb_yoWrZryDpr
 Z0qF93trWrXFy7Xas5tF4FkryS93y2y3y3Jr1xXw1S9rW5CwnYqF10kr1vvr1YgF93AF17
 Zw12y3Z7C3ykJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5Ks8UUUUU=
X-Originating-IP: [202.110.209.182]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1tbiegELBmkdW2wf0gAAs4
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The code was checking for a non-existent macro `HDIO_GETGIO`
 instead of `HDIO_GETGEO`, which caused the ioctl() call to never be executed.
 This resulted in start_sector always being set to 0, even whe [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.8 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [hexiaole1994(at)126.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [hexiaole1994(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vLbG4-0002Ga-Hs
Subject: [f2fs-dev] [PATCH v1] mkfs.f2fs: fix incorrect start_sector
 detection due to typo in HDIO_GETGEO macro check
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
Cc: jaegeuk@kernel.org, shengyong1@xiaomi.com, Xiaole He <hexiaole1994@126.com>,
 daehojeong@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The code was checking for a non-existent macro `HDIO_GETGIO` instead of
`HDIO_GETGEO`, which caused the ioctl() call to never be executed.
This resulted in start_sector always being set to 0, even when the
partition actually starts at a different sector (e.g., 2048).

This bug affects:
- lib/libf2fs.c: get_device_info() function (lines 967, 1076)
- tools/fibmap.c: stat_bdev() function (lines 91, 108)

Reproducer:
1. Create a partition starting at sector 2048:
   # parted -s /dev/sdb mklabel gpt
   # parted -s /dev/sdb mkpart primary 2048s 32GiB

2. Verify the partition start sector:
   # cat /sys/block/sdb/sdb1/start
   2048

3. Format with f2fs-tools (before fix) and verify incorrect calculation:
   # mkfs.f2fs /dev/sdb1
   # Info: zone aligned segment0 blkaddr: 512

   The calculation happens in
   mkfs/f2fs_format.c:f2fs_prepare_super_block():

   With default values:
   - blk_size_bytes = 4096
   - c.blks_per_seg = 512
   - c.segs_per_sec = 1
   - c.secs_per_zone = 1
   - zone_size_bytes = blk_size_bytes * c.secs_per_zone
                       * c.segs_per_sec * c.blks_per_seg
                     = 4096 * 1 * 1 * 512 = 2,097,152 bytes (2MB)
   - alignment_bytes = zone_size_bytes (for non-zoned or single device)

   With c.start_sector = 0 (bug case):
   - zone_align_start_offset
       = ((c.start_sector * DEFAULT_SECTOR_SIZE +
          2 * F2FS_BLKSIZE + alignment_bytes - 1) /
          alignment_bytes * alignment_bytes) -
          (c.start_sector * DEFAULT_SECTOR_SIZE)
       = ((0 * 512 + 2 * 4096 + 2,097,152 - 1) /
          2,097,152 * 2,097,152) - (0 * 512)
       = ((8,192 + 2,097,152 - 1) / 2,097,152 * 2,097,152) - 0
       = 2,097,152 - 0 = 2,097,152 bytes (2MB)
   - segment0_blkaddr = zone_align_start_offset / blk_size_bytes
       = 2,097,152 / 4,096 = 512 blocks

   This matches the output "segment0 blkaddr: 512".

   With c.start_sector = 2048 (correct case):
   - zone_align_start_offset
       = ((2048 * 512 + 2 * 4096 + 2,097,152 - 1) /
          2,097,152 * 2,097,152) - (2048 * 512)
       = ((1,048,576 + 8,192 + 2,097,152 - 1) /
          2,097,152 * 2,097,152) - 1,048,576
       = 2,097,152 - 1,048,576 = 1,048,576 bytes (1MB)
   - segment0_blkaddr = zone_align_start_offset / blk_size_bytes
       = 1,048,576 / 4,096 = 256 blocks

4. Confirm the bug with gdb:
   So the correct output should be "segment0 blkaddr: 256", not 512.

   # gdb --args mkfs.f2fs /dev/sdb1
   (gdb) b lib/libf2fs.c:1075
   (gdb) run
   1075                    if (i == 0) {
   (gdb) l
   1075                    if (i == 0) {
   1076    #ifdef HDIO_GETGIO
   1077                            if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
   1078                                    c.start_sector = 0;
   1079                            else
   1080                                    c.start_sector = geom.start;
   1081    #else
   1082                            c.start_sector = 0;
   1083    #endif
   1084                    }
   (gdb) n
   1082                            c.start_sector = 0;
   # At line 1076: #ifdef HDIO_GETGIO (bug - this macro doesn't exist)
   # The ioctl() call at line 1077 is skipped, and execution goes
   # directly to line 1082, setting c.start_sector = 0

After fix:
   mkfs.f2fs output:
   Info: zone aligned segment0 blkaddr: 256

   gdb output:
   (gdb) p c.start_sector
   $1 = 2048

   The ioctl() correctly retrieves the partition start sector (2048),
   and zone_align_start_offset is calculated correctly, resulting in
   segment0_blkaddr = 256.

Fixes: 43bb7b6c99fa ("f2fs-tools: build binaries in Mac")
Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
 lib/libf2fs.c  | 4 ++--
 tools/fibmap.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 1a496b7..a3508c8 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -964,7 +964,7 @@ int get_device_info(int i)
 	uint32_t total_sectors;
 #endif
 	struct stat *stat_buf;
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 	struct hd_geometry geom;
 #endif
 #if !defined(WITH_ANDROID) && defined(__linux__)
@@ -1073,7 +1073,7 @@ int get_device_info(int i)
 		dev->total_sectors /= dev->sector_size;
 
 		if (i == 0) {
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 			if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
 				c.start_sector = 0;
 			else
diff --git a/tools/fibmap.c b/tools/fibmap.c
index 3acc77b..0a92551 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -88,7 +88,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
 #endif
 {
 	struct stat bdev_stat;
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 	struct hd_geometry geom;
 #endif
 	char devname[32] = { 0, };
@@ -105,7 +105,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
 		goto out;
 
 	if (S_ISBLK(bdev_stat.st_mode)) {
-#ifdef HDIO_GETGIO
+#ifdef HDIO_GETGEO
 		if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
 			*start_lba = 0;
 		else
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
