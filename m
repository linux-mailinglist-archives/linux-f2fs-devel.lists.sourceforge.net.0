Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 218BC91EEE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 10:30:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzd3x-0003qo-RI; Mon, 19 Aug 2019 08:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=127c8b87f=shinichiro.kawasaki@wdc.com>)
 id 1hzd3w-0003qf-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iHxQdovTj2CHBqmGTZW0ZX4uOUCcilu4K16MehxNcUg=; b=EDdUxvq7uEyq10MjBBfpfC+NKi
 8cXZq3pv9SVFCOXg83wssZEwC+0U0tMqFymTMIIb5h6rohAkY3ZEUlIloI6fw5y+EgJh/IDLxJxAk
 qTS1VLoaky4OfZqCYE9tw73jLu01I6nhdcNwsZAP4K3JnGO/QOPPPa1uhZEn9IYic20Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iHxQdovTj2CHBqmGTZW0ZX4uOUCcilu4K16MehxNcUg=; b=BsI8qGpAqr9CtPSy4ImrGj2Psn
 o7V3EmtwiDMNMl9LG1uRnTUAl+uyNyIgUUPTAgg1aiDtHlmWe8nb8622ntSYq05tt4yLWSkBwfcmg
 2AeTbMQJQkb+ajufFR/IRVJ1x6hcoXb2u0UnbRg5Tw2reCvkdZv7kL0guawvUbJMECzQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzd3v-008W8j-0B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566203465; x=1597739465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6VB3DCsthsLl2jsX+WpWsxW2QKrDE3eueJNa+NmiC1s=;
 b=hSzKkT3KuShwcDb9bwGMHMfALPfkbX4+w4qhDbeqG6peYT2meTPSFf2P
 84lgednko7mU6pB0JZyTNT3GAxVBWBWeRr3vb6bFp0lIh8SKm9IuIy0Av
 PNZmTL1sxYeyrQsS+qBFLZRISTRZwf7kEJYyg+sHID2CnSI/W+6sDRE/+
 igdH7QUgmRFDDbyNm5+Cwe2ORpTM+NrCEpUSrtL0jkMmAepBI1L5TvLqv
 wnELUEOZzVejcjisyQ3m2BXeFzbROi41iAbdO3dWgig/2Oeo6edssp8uO
 MK28B/tTItKMhE/nljiPMAIgtNy8tbippPOk+WzUZx7Wu2i13edL6Injw Q==;
IronPort-SDR: l86cJVRUjydpUL9i3ChFKtUeNcj+Al1qrKH6x7GK/8/YQN0ncEl8/LlC1sBTLD8HCChwowk1vV
 3RG2mbx+ZV3HP02mhJ0nB4yoEfo5bi9fVspSxpyBfHACQvOe9RMzRMrRZC/ywiT0B2Hdx2dGGG
 SKwDtmi18X0z3fKg/hn1MVKFTmLTo9pFnX60O4lBcNNQV7oEfDQrGDDyAR6oxpSXoAtuh0j/vn
 XRJgWJglNB0bo9wEGhGo/DBT6dfV6Il3xbdUWOp4nCs1l+Wz5crLmBMF9e44ybR0Euuw3NezJB
 9oY=
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="216517048"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Aug 2019 16:30:55 +0800
IronPort-SDR: MIXcPdDgiDC+Ox5aAyP6ttNVh7YeO23NXhVJzC0dffjT1K/gwiNFt0TfKldctGnTmUgB6WfPUv
 0Mjv1qB/Su6x3CDuLViqapV/yf8fDtHO5TZ/NU+QfgROPp500oSYqEdPRG392oZ4nnzsY/0NWe
 P0YBZX8sChyw37FCuFJFNPoL7sozgM2ZE3Em0v7f3aJ1KQhUJtTFXlwK5iNpSv/m10fiBicGm1
 //AnMvlKOzG/xXIDGLHUKPkNbkjZF6J+Bf2W1uD+ZqZRnqNryuoYSmchAFzi9TEWYKSEWa1HFU
 9Gb4h3cA9K/y/zRwJoV6iuhy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 01:28:05 -0700
IronPort-SDR: zy/Wz9CS16cW07z6mISQLpjIHfyWU35YaytkbgCwMT7+U62BUYG34OtE1eHY3kurM4rX58NZTh
 5NueAp4KySeS5P1wq3EA4ANNV9mWFP8Og6H2e8k3YcAwupLSj2PLdebFxLBSgzbp/hAsVLhiz+
 2iqqqUYZ71sBZrwQmTnROwAWXEAFYslL9k55Nw4a0Z9STN35PhLSrgtOoQuDQc5quHR4Xnt83y
 4EC2jFIXX2xUOiReHZVl6VrwfKd6QHb8qsVENBbu4Zg4xQEDMNpFD5XMAv0dDWzZsdtsJgTleG
 9Mo=
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2019 01:30:39 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 19 Aug 2019 17:30:34 +0900
Message-Id: <20190819083034.18218-5-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819083034.18218-1-shinichiro.kawasaki@wdc.com>
References: <20190819083034.18218-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1hzd3v-008W8j-0B
Subject: [f2fs-dev] [PATCH 4/4] fsck.f2fs: Check write pointer consistency
 with valid blocks count
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

When sudden f2fs shutdown happens on zoned block devices, write
pointers can be inconsistent with valid blocks counts in meta data.
The failure scenario is as follows:

- Just before a sudden shutdown, a new segment in a new zone is selected
  for a current segment. Write commands were executed to the segment.
  and the zone has a write pointer not at zone start.
- Before the write commands complete, shutdown happens. Meta data is
  not updated and still keeps zero valid blocks count for the zone.
- After next mount of the file system, the zone is selected for the next
  write target because it has zero valid blocks count. However, it has
  the write pointer not at zone start. Then "Unaligned write command"
  error happens.

To avoid this potential error path, reset write pointers if the zone
does not have a current segment, the write pointer is not at the zone
start and the zone has no valid blocks.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/fsck.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6beac5a..14bc804 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2622,6 +2622,7 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
 	void *zero_blk;
+	block_t	zone_valid_blocks = 0;
 
 	if (blk_zone_conv(blkz))
 		return 0;
@@ -2642,8 +2643,35 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
 			break;
 	}
 
-	if (cs_index >= NR_CURSEG_TYPE)
+	if (cs_index >= NR_CURSEG_TYPE) {
+		for (b = zone_block; b < zone_block + c.zone_blocks &&
+			     b < MAX_BLKADDR(sbi); b += c.blks_per_seg) {
+			se = get_seg_entry(sbi, GET_SEGNO(sbi, b));
+			zone_valid_blocks += se->valid_blocks;
+		}
+		if (wp_block == zone_block || zone_valid_blocks)
+			return 0;
+
+		/*
+		 * The write pointer is not at zone start but there is no valid
+		 * block in the zone. Segments in the zone can be selected for
+		 * next write. Need to reset the write pointer to avoid
+		 * unaligned write command error.
+		 */
+		if (c.fix_on) {
+			FIX_MSG("Reset write pointer at segment 0x%x",
+				zone_segno);
+			ret = f2fs_reset_zone(dev, blkz);
+			if (ret)
+				return ret;
+			fsck->chk.wp_fixed_zones++;
+		} else {
+			MSG(0, "Inconsistent write pointer at segment 0x%x\n",
+			    zone_segno);
+			fsck->chk.wp_inconsistent_zones++;
+		}
 		return 0;
+	}
 
 	/* check write pointer consistency with the curseg in the zone */
 	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
