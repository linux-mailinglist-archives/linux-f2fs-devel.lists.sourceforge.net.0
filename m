Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C50DB1147F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 01:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tqM7zN/FoXDLqgzCESqGWtPt1LDTgLsaDkCOaybA2sw=; b=FyVSYfU52xuZDCgNk1XxfWAvQg
	+skGyTSrZchpbKGoP4Dst2/1N124fdcszLHjvGE5MBSjj6uzZ7MWqUSOldJUU/HDFgY4vBRd5IGJe
	4xeh9G/qvJxLEZwaAman7xcZRkEGwISm09Zob/UevwDzyB77dPW+fVSTkLffo17z7kD4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf5Mp-0005y7-Au;
	Thu, 24 Jul 2025 23:28:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3q8GCaAcKAIQkp2ttmmowwotm.kwu@flex--chullee.bounces.google.com>)
 id 1uf5Mo-0005xz-1X for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 23:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cu7rWWmwvWhXlD+BIx8Cx8cffaKGRr6Qv6str/gp1qM=; b=HkAOckZ4Dk9G2PX1XjPbq20Zar
 GYz+9n4PfmOLGyxfrwnkN9lqiB8IIxStiC8ql16WCnXAfBfWKDQAGq7WdpO2PwoVLDmxX2/RWfGnP
 k9t1Q7Ayf/lx6J+VOvtjyJm/hmLnrgSFMK97hORJJEHridrA2gJr7aAI1iy+wmDKJWWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Cu7rWWmwvWhXlD+BIx8Cx8cffaKGRr6Qv6str/gp1qM=; b=P
 CzrSGuxk0QDSBWDyOBU8DBc+Ec5Lbe7pVSqMGIZoO0i+enwRt+ceU9wGvbU1zMeINftP5StZIHqgl
 P3LHDXAhdaMnc6ad5PBWI670GTFZumWfJ8JyCRTRHK//bRhySwbpUBBheqdhjZAnu0l9CAUEgRXG1
 SBDdxeDh8B4mJARQ=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uf5Mn-00066B-LS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 23:28:49 +0000
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-7494999de28so2251773b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 16:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753399724; x=1754004524;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Cu7rWWmwvWhXlD+BIx8Cx8cffaKGRr6Qv6str/gp1qM=;
 b=M/xEgkHBbgX9/u1JLFhJMloZv15HNH1vKp5DOFMeg7xcBnfmfElWEpwqJoPQIHhf6k
 ceI+6YIU+wXFmIhA2oUZhPES1WIbLwhlL85IAbzPOHK/XABy5a4vBeMLvUjoIbVv8+dm
 eRNtd0lCDNQwBTQjDl4pHcGq4im7kV+cJmDyAu8PFIDLnNZIUbJoI9qAdONJuln0kFzq
 KFH24I0L2YJICfgRkbXkmg+PrZNPqMrXdUzCh4hJiVmVzSRst3ZdsrEEwqMJUMT47kPP
 ouc/pgj+cGGLcip99qXqTwaDIT+PYRUUKML5e50DZWxqUkxd1zmR0YBS9z5Mqho+ImNR
 Wgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753399724; x=1754004524;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cu7rWWmwvWhXlD+BIx8Cx8cffaKGRr6Qv6str/gp1qM=;
 b=qSsEc+kxx0vNpmKBC5c9alAd2itb+PngpA1UkyKyiHqR+7Y1Zb/zLm4dngfjmDSMG6
 anmJ1NSGU8GyTMnIkKjrL4llY4lBmrLBZerS/0asIcDN0aq+TRunCLcsKT7PT3f08eFE
 LRKWfj8R2qK0wbWwQZBHP/L0ZMuY0cRkoEke1keTxG3D2GkAJ8zraGkvowUPmgKI2cjI
 4CJobQsBt3oQno6vxWKtugu5xNGncIvaXbiJwPXuXd8D+4iSLnvY/ySmc3KcQJ3C+SBT
 BkzXWfM4ywI2XYQ/JV9kT7o0bv82Hw+IfG6Uxc2PIa55sHZ2YLAikiqWlu4M5ety9CLW
 ZgnA==
X-Gm-Message-State: AOJu0Yyg3yyiTSMl16NUJ9kENGIDK2Yq3lTnwDh80m6i1ywTis0DXazX
 53sxZ1es//QWkiLajTcrJjEtn0nbwIwUOf0BM95e0RDslTCPYLymUqujTlwLTYvgWFs66XEoqdv
 Pn3HatypTSg==
X-Google-Smtp-Source: AGHT+IG/8S5AFLLuy5IOXV2ZBr4Hwz6CofrjsShjkH3vflGl8DlkDl30lwC00kLpYGOvenbFFR79ZO0QVgZc
X-Received: from pfbfh25.prod.google.com
 ([2002:a05:6a00:3919:b0:748:f98a:d97b])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1914:b0:742:b3a6:db09
 with SMTP id d2e1a72fcca58-76035ff5a1dmr12727998b3a.16.1753399723889; Thu, 24
 Jul 2025 16:28:43 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:28:39 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250724232839.848672-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit 84447ee7212e correctly relocated the zone alignment
 check to its proper location. However, this revealed that the original check's
 condition was incorrect for multi-device setups. This patch corrects the
 logic to check the alignment relative to the start of the segment0 and
 improves the error messages. 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uf5Mn-00066B-LS
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: Fix zoned alignment check for
 multi-device setups
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 84447ee7212e correctly relocated the zone alignment check to its
proper location. However, this revealed that the original check's
condition was incorrect for multi-device setups.

This patch corrects the logic to check the alignment relative to the start
of the segment0 and improves the error messages.

Signed-off-by: Daniel Lee <chullee@google.com>
---
 mkfs/f2fs_format.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2680bd3..18f6e34 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -339,17 +339,6 @@ static int f2fs_prepare_super_block(void)
 	MSG(0, "Info: zone aligned segment0 blkaddr: %u\n",
 					get_sb(segment0_blkaddr));
 
-	if (c.zoned_mode &&
-		((c.ndevs == 1 &&
-			(get_sb(segment0_blkaddr) + c.start_sector /
-			DEFAULT_SECTORS_PER_BLOCK) % c.zone_blocks) ||
-		(c.ndevs > 1 &&
-			c.devices[1].start_blkaddr % c.zone_blocks))) {
-		MSG(1, "\tError: Unaligned segment0 block address %u\n",
-				get_sb(segment0_blkaddr));
-		return -1;
-	}
-
 	for (i = 0; i < c.ndevs; i++) {
 		if (i == 0) {
 			c.devices[i].total_segments =
@@ -390,6 +379,33 @@ static int f2fs_prepare_super_block(void)
 
 		c.total_segments += c.devices[i].total_segments;
 	}
+
+	if (c.zoned_mode) {
+		if (c.ndevs == 1 &&
+			(get_sb(segment0_blkaddr) + c.start_sector /
+			DEFAULT_SECTORS_PER_BLOCK) % c.zone_blocks) {
+			/*
+			 * With a sole zoned LU, segment0 start should be
+			 * aligned at the zone.
+			 */
+			MSG(1, "\tError: Unaligned segment0 start (%u) for zoned LU (zone_blocks: %lu)\n",
+				get_sb(segment0_blkaddr), c.zone_blocks);
+			return -1;
+		} else if (c.ndevs > 1 &&
+			(c.devices[1].start_blkaddr - get_sb(segment0_blkaddr)) % c.zone_blocks) {
+			/*
+			 * With the first device as a conventional LU and the
+			 * second as a zoned LU, the start address for the zoned
+			 * LU should be aligned to the zone size, starting from
+			 * segment0.
+			 */
+			MSG(1, "\tError: Unaligned start (%lu) for zoned LU from segment0 (%u) (zone_blocks: %lu)\n",
+				c.devices[1].start_blkaddr,
+				get_sb(segment0_blkaddr), c.zone_blocks);
+			return -1;
+		}
+	}
+
 	set_sb(segment_count, c.total_segments);
 	set_sb(segment_count_ckpt, F2FS_NUMBER_OF_CHECKPOINT_PACK);
 
-- 
2.50.1.552.g942d659e1b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
