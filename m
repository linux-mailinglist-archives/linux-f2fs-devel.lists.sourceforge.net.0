Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4BC39C6B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 06 Nov 2025 10:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWvQXdk6MYRwg+Cu2iv5gt1ngoLpumaNWvg+TxRxO8w=; b=hXkG5iqH4Lyqx/NMNeOmncw7+k
	uhJpx4znHPF80zAdmG+69fmLZ7ddkVMSE6ZyzvXzXdL886QBMdExFKhEJqOmfAL5jbrK+aktkcjFe
	21A7jqVGAraBHRdykZb1Ya0kaZHLHo2x7eJeife0ikAIbU2sDvPWICLET5JwviXKdWkY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGw62-0008Cp-RM;
	Thu, 06 Nov 2025 09:15:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vGw61-0008Cj-Ky
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 09:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9GWlxsWeB+hFDBkPLxLJDI3qJnfzhaJ+9iovcthGMQ=; b=f/pcFG4eaBEFBLNUsc13rSPUiL
 X3BGgzmk7Fse75f8JEy3Oz0H5Pnvm3oc2MHVK3TlExJzXoxWZoTU4mfcX2Z3WQua8KZH3UNQcXDns
 uPEwVKS8c4/mYsnlUaU3baVBVo2D+2/amubNGvojdQfpQDzvx389L0Op8WLc5SeHSZqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t9GWlxsWeB+hFDBkPLxLJDI3qJnfzhaJ+9iovcthGMQ=; b=Cb5XMkFqpJKS9A9BI+ux/L4yz+
 t7VTykq4nfMqEFtDmc4WgLil2H8PCojdkYtwjzSX39qk2i7PJtmELwyk1lJgjOqLFasdfgNwN/hEv
 2Lwgo+ua3jkErHOnBykb41PTSWiKqF1BQtOT9Vayqw38NFo7tnz898MwNUShaAye4YpY=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGw61-0004Cn-4c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 09:15:57 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-339d7c403b6so870906a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Nov 2025 01:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762420551; x=1763025351; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9GWlxsWeB+hFDBkPLxLJDI3qJnfzhaJ+9iovcthGMQ=;
 b=dyc2IfOKlCA2doUKgg9LbZwcjccpPa2nuDEPQ3OelaQINOYxBfsd3Y0DTR82KpWRIe
 0hNM70VoazZKAdPuI1CovDBEYn3/iaFzx1VJmXBU+TUA71nPSfvr9Aq8ayGw0HX50dn0
 6C6qIisduYGP9S/j6jk1ETXu1zOvdaLmwVE8zOzrUJj6NujK3VW6+hJJEl2thbnsQYrw
 w17/Cvw2i4VRvbHBEHlrLmeq31lqWGxkuRkmpn3nRVQTuFM9f8osrIfuHbzC7BYmubZA
 m47qEID5RjQ/3RpuE7ZUT29m49Uf5nhmYvCxVurpT/hACglM0F4QQNttrm5cOlueqEoX
 w3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762420551; x=1763025351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9GWlxsWeB+hFDBkPLxLJDI3qJnfzhaJ+9iovcthGMQ=;
 b=HqtfdmIm7eB0Dg4hdvJ+UySYoUGPZ71vprpYT8nDA1jN0krq9m8OqXP0i1c2LbC82a
 N+chs8iCEuEH354tR5SuANMBP92ODJc9GK+E5QNUCS+8TzlY0jxbkoLCEPenSPxSID7p
 3y0nk1qDkApSzoz8XmEwtEMFi0JTaU52Q348ytBxssRrfhqhSfbWAwb6oL2lT0fZcdNb
 lRFJWHrzut4FlNIysMSWu53jow0er+RzEvUKXuuXG2CcDC8ZU9fHGd0fftVGGoLt0eU+
 11bQODKlJgb0PEJuJacOI2yROViJtggEVI/iRU0t8xNG42QBh9Tw1f49WDbYShLvtaEF
 ZnTw==
X-Gm-Message-State: AOJu0YxZ1EDeADvzetd9Pz0Rs4IRRLzcIPqKNuS5tDefdWQEKg5HgD+P
 T8OFr2HPA4x+aXW6u36vaJVygE2W7eCK5nTLW/fVolzG1PF6lbMJBUMr
X-Gm-Gg: ASbGncud+2Jrcvye+cAmEyWaXSIIneAGszxv/oSfhApVq3mjb1ciVLz6RzteTVyVHgo
 iN61fxai83JWl6qeELVbeKRmRstHoh2H4F+mW7KbaX+HMIGUEaaBE0aqN3ZFK34UfakV+HJS+Qw
 n4LPnwuUt/PWD0KNyt6ck+zSezKVNwVu8uxYysnGVxXCVMxhMJZf0dCsUmwXCGXrMdWaTv9CyvH
 +gqO/K8lTOQ7BDHI6ZL33ggoZDWgcmF1iv48uDyQ4tygZ8W26/Z00MROBTseINLJbx2/JrwRI0n
 VqCIS7BbBq6kppxHaXr0TQG77BpCNDK9npTFSsucRjTAN7ZwJOtPaaeDabi7bNl5FHWz2pjnuOY
 WOgLrrACaC4K2NBr6rLTz4JVBM89xh+hqNpU0FmsZnTHjv4tSArkxYT+enyVRMNmnKSgvwRT+YV
 3FKVbtMXNZgrl2TC2X8lAgQgmjWr/gPbm3Jbq4SDa1GrqXgiLRteQ=
X-Google-Smtp-Source: AGHT+IGlqZkMr8jknNMz8GqWEqFyesRLeAfPWwukWN+1xuEdVbvVmZQUxg1Uj88yZXqrIvbbzI3XuQ==
X-Received: by 2002:a17:90b:574f:b0:340:d569:d29b with SMTP id
 98e67ed59e1d1-341a6dd9a3emr7597579a91.19.1762420551432; 
 Thu, 06 Nov 2025 01:15:51 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341d1258262sm672051a91.13.2025.11.06.01.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 01:15:51 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  6 Nov 2025 17:15:37 +0800
Message-ID: <20251106091537.3063566-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
References: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang When the block device reports
 max_open_zones
 == 0, sbi->max_open_zones is initialized to UINT_MAX. In such cases, F2FS
 can still be mounted successfully (as tested under qemu). However, for SSDs,
 a de [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vGw61-0004Cn-4c
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix handling of block devices with
 max_open_zones == 0
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

When the block device reports max_open_zones == 0, sbi->max_open_zones
is initialized to UINT_MAX. In such cases, F2FS can still be mounted
successfully (as tested under qemu).
However, for SSDs, a device reporting max_open_zones == 0 should not be
mountable, while for SMR HDDs this is acceptable.
Fix this issue by handling max_open_zones == 0 properly:
- Disallow mounting on SSDs when max_open_zones == 0.
- For SMR HDDs, set max_open_zones to the total number of zones.
- Remove redundant zoned device checks.
- Add a sysfs entry to expose max_open_zones.

Fixes: 0f9b12142be1af("f2fs: fix zoned block device information initialization")
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/super.c | 36 +++++++++++++++++++++---------------
 fs/f2fs/sysfs.c |  2 ++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c055032593b7..7349d9cd901b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4353,21 +4353,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	unsigned int max_open_zones;
 	int ret;
 
-	if (!f2fs_sb_has_blkzoned(sbi))
-		return 0;
-
-	if (bdev_is_zoned(FDEV(devi).bdev)) {
-		max_open_zones = bdev_max_open_zones(bdev);
-		if (max_open_zones && (max_open_zones < sbi->max_open_zones))
-			sbi->max_open_zones = max_open_zones;
-		if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
-			f2fs_err(sbi,
-				"zoned: max open zones %u is too small, need at least %u open zones",
-				sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
-			return -EINVAL;
-		}
-	}
-
 	zone_sectors = bdev_zone_sectors(bdev);
 	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
 				SECTOR_TO_BLOCK(zone_sectors))
@@ -4378,6 +4363,27 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (nr_sectors & (zone_sectors - 1))
 		FDEV(devi).nr_blkz++;
 
+	max_open_zones = bdev_max_open_zones(bdev);
+	if (!max_open_zones) {
+		/*
+		 * SSDs require max_open_zones > 0 to be mountable.
+		 * For HDDs, if max_open_zones is reported as 0, it doesn't matter,
+		 * set it to FDEV(devi).nr_blkz.
+		 */
+		if (bdev_nonrot(bdev)) {
+			f2fs_err(sbi, "zoned: SSD device %s without open zones", FDEV(devi).path);
+			return -EINVAL;
+		}
+		max_open_zones = FDEV(devi).nr_blkz;
+	}
+	sbi->max_open_zones = min_t(unsigned int, max_open_zones, sbi->max_open_zones);
+	if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
+		f2fs_err(sbi,
+			"zoned: max open zones %u is too small, need at least %u open zones",
+			sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
+		return -EINVAL;
+	}
+
 	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
 					BITS_TO_LONGS(FDEV(devi).nr_blkz)
 					* sizeof(unsigned long),
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 98d2cb60e806..d3d268c707a9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1210,6 +1210,7 @@ F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
 F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_blkz);
+F2FS_SBI_GENERAL_RO_ATTR(max_open_zones);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
@@ -1384,6 +1385,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_blkz),
+	ATTR_LIST(max_open_zones),
 	ATTR_LIST(blkzone_alloc_policy),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
