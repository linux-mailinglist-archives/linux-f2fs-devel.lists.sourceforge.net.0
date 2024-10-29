Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3D9B4B27
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 14:46:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5mXz-0006KE-2d;
	Tue, 29 Oct 2024 13:46:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1t5mXy-0006K8-1e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 13:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DyKlJXEr9keHaOcYBjr3auPA6keraHgOZp7hXIzFnsc=; b=TDuW/TQ5vNmqrGpZkbfrLSkGAT
 oM7CkHO6AcM6uh0BGo1jiPgay0s2hRnVMrzwnwp+/eGfqPlXvQC9pBz0k7wnhRo6Y/e3kPm16C0mS
 o0vlgHv2GOBQHc1422Qqs2L1enUwMtJTsJLaTUFZ+5+qjjtQqfuts1y92V9SyFrMqO/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DyKlJXEr9keHaOcYBjr3auPA6keraHgOZp7hXIzFnsc=; b=D
 l8H8FuOLxhbnmghk0j7o1pGxuAvBOpUlOqLCX8fyMo+2/DgDfnJEdR/Hw+MY2+N4lL29bZ3MlF1Vh
 iw8tbnIUehOhRHnbjueOqJS40m13rjY6wkqmjKxleh0xObNgEieQI76UTgExXszG1ifeiBQ6ShXdK
 SFDsuecGoD/f1xjA=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5mXx-00088n-CM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 13:46:09 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20cceb8d8b4so31506595ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2024 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730209559; x=1730814359; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DyKlJXEr9keHaOcYBjr3auPA6keraHgOZp7hXIzFnsc=;
 b=nsem5s2LbThCZg3/OZRQX7ufYdyMzzKM/1c+3EUeQ5DRceXaANmDnna8qunY+mka06
 GSIIbrP7E2/DiT92LjUHVeuQamv4t7wCe5sSckrW5YDI1Yc8wHmxZVFnDO1iLgnT2oRW
 no7NfMxBNIpsrPnfufahlaOFfTqHQTVQU4A0zxxjCBHnlXVzQfR6wDVGrmgidoKzeQ8E
 FWBMgws0WeT37/SyfMskpsXqQ7Ma+osfY8GbqqhT5y537EZsqTVgFHGANz8rTpR2XOx6
 1IgPP8y93pZKQua1h4XahfWrDhHYsRd/7DnCOxCVXfWI5XROtapt3FUrDc/Ik/mm6ZSa
 C8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730209559; x=1730814359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DyKlJXEr9keHaOcYBjr3auPA6keraHgOZp7hXIzFnsc=;
 b=HfzbpopHa/UYBphi8SPymvDZrQVb+vYgYepsV80DSG6KJm8smkJAcvzbuBDAcyQHHc
 c2AwhF4pJb0XtOGBComgCwBlHSmyJAILzrjoQ+zrKWaNCz2NWjJ+ZJrfzgFWQL1kZCJo
 ExXdj8xCMIoFJLPJXRZsoVUFKdCq3eMqZoh2rOlAGJufF5VJ0hZLThXo+dw7cKwXtYVA
 Vc4ugBLy39unDu47isOOO3Gy1vn8Us2onLKoNIZRc6D8VIyxe5UoN04pKziKUBa9DBu2
 dZ+IJIax54EP9TgScYxXHYyQ4vR2Jc6aj04wuoR46J9zdpM4rEWOaOqOYZDmfZ75R3z0
 jvyQ==
X-Gm-Message-State: AOJu0Yz7XDn9ktQ8Zxo238fd1NIgmlpiP0bcl6noIuvyh0tltkeXIQyc
 t3Njz+0gXjSpDcf1f3D5jZjdXFF1S+c1mxK6fK+i7HgjKHwhy8Ufhlw2CMN0
X-Google-Smtp-Source: AGHT+IHaQmImiSAvmwcrgTR+a9jJroqanJ509E2/ohzIrAEtDJHGJHVUWI5GqnE5pF82suQcYJIiww==
X-Received: by 2002:a17:902:d511:b0:20c:f6c5:7f6c with SMTP id
 d9443c01a7336-210ed09e387mr32343895ad.16.1730209558621; 
 Tue, 29 Oct 2024 06:45:58 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6dd23sm66401285ad.92.2024.10.29.06.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 06:45:58 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Tue, 29 Oct 2024 22:45:51 +0900
Message-Id: <20241029134551.252-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When formatting conventional partition with zoned one, we
 are already aligning the starting block address of the next device to the
 zone size. Therefore, we do not align the segment0 address to the zo [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t5mXx-00088n-CM
Subject: [f2fs-dev] [PATCH v2] mkfs.f2fs: adjust zone alignment when using
 convention partition with zoned one
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When formatting conventional partition with zoned one, we are already
aligning the starting block address of the next device to the zone size.
Therefore, we do not align the segment0 address to the zone alignment.
This reduces the wasted zone_align_start_offset.

Test result
segment0 blkaddr 389583 -> 119251
Add one additional section to main

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 mkfs/f2fs_format.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index a01b19e..52a1e18 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -266,6 +266,7 @@ static int f2fs_prepare_super_block(void)
 	uint32_t log_sectorsize, log_sectors_per_block;
 	uint32_t log_blocksize, log_blks_per_seg;
 	uint32_t segment_size_bytes, zone_size_bytes;
+	uint32_t alignment_bytes;
 	uint32_t sit_segments, nat_segments;
 	uint32_t blocks_for_sit, blocks_for_nat, blocks_for_ssa;
 	uint32_t total_valid_blks_available;
@@ -305,10 +306,12 @@ static int f2fs_prepare_super_block(void)
 
 	set_sb(block_count, c.total_sectors >> log_sectors_per_block);
 
+	alignment_bytes = c.zoned_mode && c.ndevs > 1 ? segment_size_bytes : zone_size_bytes;
+
 	zone_align_start_offset =
 		((uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
-		2 * F2FS_BLKSIZE + zone_size_bytes - 1) /
-		zone_size_bytes * zone_size_bytes -
+		2 * F2FS_BLKSIZE + alignment_bytes  - 1) /
+		alignment_bytes  * alignment_bytes  -
 		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
 
 	if (c.feature & F2FS_FEATURE_RO)
@@ -327,7 +330,8 @@ static int f2fs_prepare_super_block(void)
 
 	if (c.zoned_mode && c.ndevs > 1)
 		zone_align_start_offset +=
-			(c.devices[0].total_sectors * c.sector_size) % zone_size_bytes;
+			(c.devices[0].total_sectors * c.sector_size -
+			 zone_align_start_offset) % zone_size_bytes;
 
 	set_sb(segment0_blkaddr, zone_align_start_offset / blk_size_bytes);
 	sb->cp_blkaddr = sb->segment0_blkaddr;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
