Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A5973929
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 15:57:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so1Me-0005MI-I3;
	Tue, 10 Sep 2024 13:57:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1so1Md-0005M7-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 13:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UiJ6/NiAxMWwoZLksU92Vs8y9/jjGEjZVsnJDxc3H6g=; b=ee14QKnuSpsA4wAeIZ/TlS741z
 eNRGzcH6+9Ltdu2yMRIOVawCvGem8pTkIxAoRJKrtdgWs9yqkEH/UKvF1sJW2kwHIeVGPiW+LCHgi
 h3ey/HYToZIGrDGZyTReUSorGle79LDEGp2yZfchiyTnBCv9rWr1mbEnIDi9tiLqGg88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UiJ6/NiAxMWwoZLksU92Vs8y9/jjGEjZVsnJDxc3H6g=; b=V
 8qUhUoBacPxyoiuSv/dRQ0UfDpmJAdpxFk8E8N9yB3qx7DQDi9PtakuCxf23aRW6CIxdJGy/h3jGw
 28yySCJQhSAifdmOcAtKpDECPFKXg0O13URR12+OVrSP8Kgmn9rE0KmqdiB+grd3f28qyseWiCNLd
 6xPqAD1BzbjQq6e0=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1so1Mc-0001Vs-Iz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 13:57:03 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2068bee21d8so54971755ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725976612; x=1726581412; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UiJ6/NiAxMWwoZLksU92Vs8y9/jjGEjZVsnJDxc3H6g=;
 b=Ig3s2NCyvqeBA+VmFcNP4Q5ClCRtMIhH419+TCKcTqUFHziKM+PHD6hyDUdqRaWzQl
 wV7DdDbARc03ipGNfMppN17fXnP91eA4//oyTs7PMaGucw9pPhVNDdO6Ayp39ikI/zy/
 og82Jdpa3WzpBfkx9ZlSYHt+Iz00SXyemdNAAEba1fcOtWkJGAvTR42q80oGcKLTIs+6
 dXdCaKwIr5jsjagKCyZT1je8gyJDVU0fuPVkzrUrlQldLgomyCKoAaK6TMiL4G5W/QyL
 /zoupNVv6cDgX6UA1jTH0WyLIxjvp3i9CNPZDSSINU/UK9acH13tHgbEXTMeNWbwc6DT
 R/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725976612; x=1726581412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UiJ6/NiAxMWwoZLksU92Vs8y9/jjGEjZVsnJDxc3H6g=;
 b=wilRtkL2uZgrYLV2WnY+ckrpiBwZEXHoYg1EaxNsFiFITsEt/JV3O/zJ0q39MoyRuW
 obYLq7H5afyFwg18S+QAxUZ2F7nDPcavuBZPAJaws+krtjK6Qel5XcMvTZ4WTHyf13pl
 9LZzasMxqD04mu2CiS1Fd07McEPjCrVQ0yZeMBI1SN4kmMos0cZK9GFq9TItG4ZNAkR5
 EidFNlHV6wiLB/58sgxpBW9Z+B1nANGe2F56+ZNyxQRp36hb/4/uiQknyvljD8wWsrHN
 e03pjdEMZRZr1ezn7EwVeaWdQNrKCyuRdaDLWFwFC7Qx4/NvyfLMD4vx2rJK/HVSgf7K
 +kQQ==
X-Gm-Message-State: AOJu0YyXN3w4DODs262Iww9Y4azxePKqeBdUU51Zxf9YxgIuBDQ0N4pI
 BHEpPBKMBfbMzOKFxhjOEqLidtRdMbx3O5+YC4BfcXZYyBXohT6r3aMb6zez
X-Google-Smtp-Source: AGHT+IEN0rUdBgXg+4In1D5q6hvtsWIDFLUtM/NmJkI5GTwJJ/oyYdIKF49k/6SzKVf0VZ02c1xChg==
X-Received: by 2002:a17:903:234e:b0:207:18cc:f76 with SMTP id
 d9443c01a7336-2074c5f2152mr11933075ad.23.1725976611523; 
 Tue, 10 Sep 2024 06:56:51 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20714b8d48fsm47556035ad.284.2024.09.10.06.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 06:56:51 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Sep 2024 22:56:36 +0900
Message-Id: <20240910135636.471-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1so1Mc-0001Vs-Iz
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: adjust zone alignment when using
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

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 mkfs/f2fs_format.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 37d23f3..71f5ec8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -252,11 +252,19 @@ static int f2fs_prepare_super_block(void)
 
 	set_sb(block_count, c.total_sectors >> log_sectors_per_block);
 
-	zone_align_start_offset =
-		((uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
-		2 * F2FS_BLKSIZE + zone_size_bytes - 1) /
-		zone_size_bytes * zone_size_bytes -
-		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
+	if (c.zoned_mode && c.ndevs > 1) {
+		zone_align_start_offset =
+			((uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
+			2 * F2FS_BLKSIZE + segment_size_bytes - 1) /
+			segment_size_bytes * segment_size_bytes -
+			(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
+	} else {
+		zone_align_start_offset =
+			((uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
+			2 * F2FS_BLKSIZE + zone_size_bytes - 1) /
+			zone_size_bytes * zone_size_bytes -
+			(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
+	}
 
 	if (c.feature & F2FS_FEATURE_RO)
 		zone_align_start_offset = 8192;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
