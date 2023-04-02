Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607C6D3556
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Apr 2023 05:13:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pio9Y-0008Pf-1d;
	Sun, 02 Apr 2023 03:13:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1pio9W-0008PV-R2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 03:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WBn8FWyIBGPoaocuNnuzNDzQNus3aBXXJi3F94yzU7g=; b=QJfvB0sQMWR5OEDQoWyHmc+rbJ
 u0K1VpcHXSaMACkajH1Tce2vi98mTnEIwZbbFYlPMiiNWehL9JglhFxnhGdluLqCoqqypv9iJcm3D
 PHVGJVktr9P4YlKWp+KlUnjh8xZ/Yt8a4YuOIph9ReZAPuGqc8DyyrbKAANFdM+cM/7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WBn8FWyIBGPoaocuNnuzNDzQNus3aBXXJi3F94yzU7g=; b=U
 VyHy2OoJ1GCNnxK3VToZaOPT1yDv6DmUovkMEgrX68/M3niXXF8+1wsqujgvjzXvmaGYlZwv5nK8a
 9pmFUVQ8TRGPLN0Hkkl8E9auNDqRVRVgT02Irent4ZouF4FjMVwmVlvI8Xd53psuVL0uKUPwCryWf
 Z/krFRHHKmiH7FXI=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pio9V-0007tj-7I for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 03:13:11 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so29391197pjp.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Apr 2023 20:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680405183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WBn8FWyIBGPoaocuNnuzNDzQNus3aBXXJi3F94yzU7g=;
 b=dDbXy/ksBOsAuiljfaQBgfcBvYmVdwu2Pr1XaPN9vcLDju09h47KAhxxSFt9WUjzcc
 Ffcc7CatnyquBrd6kATdczwiHtzAKq3GQqAn0KHUvzc5YLeHTkL4bXv31iEv/CrJFUuJ
 N9/VLsdrngXMLtx6YA46/m4t3xyVZeHLgLR1kpleCVxKC+opblEDxcylieMPvuWaa0+h
 7lD61whHb6szJddnayZyQYEA9DhKK67Qi8Cbzn0ZGSuU+Y0L3MbFvpF5ERbr7oiS0lyj
 bqaUVT3fjpTj0lULhF9RTE6zRNgNCx+te1BITlDZa5dZrf6/WVDRA2tz9rv/wcVmCTSu
 mczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680405183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WBn8FWyIBGPoaocuNnuzNDzQNus3aBXXJi3F94yzU7g=;
 b=om7lHePqUuCYvJNmQi4p/WpYcbU1tYalLfDN1brIaEVpuCp1YZgEg4ylrkLtuK+Mu3
 yQiM7GhA/MfZdqH8Hgw8X0SphrQq+vRlIVb+YBC9Dd+qpsS2yRj4C654kU1zc0hRRaI2
 zTDrarzcTADsw0wnzdORNyPZIJsA+7bO0c/K2GZFD0hfZ/z75B9mCV6njTVeXuU6PFVU
 Abo2jooUOzPZpNwH5eNylkr3quoi+lyvQXoIyATU5akkUgNyIEqrfvL7WoAWDEsv/QBI
 mefYtf0eJV9r3fJrYXLy9uyDSM6mILkq/l8JKispDKIDdif358KW9UFwk1m5R+BBwTkj
 6ZQA==
X-Gm-Message-State: AAQBX9cz0oS4yIh1ogfUrGtDH5p5j2FhQLEF5meG9ssYJ7FJxTzfL2a2
 G77sHrH6pKcc1NqYSEcL1Gw=
X-Google-Smtp-Source: AKy350aw4KcPF03eEMSTE5Kgg3lOoy2cfLY1pa/n1CEHAeEjLcZ9eOykVUDcpE63SYFq7F3Ac7WhMw==
X-Received: by 2002:a17:903:687:b0:19e:8688:86fe with SMTP id
 ki7-20020a170903068700b0019e868886femr29894686plb.42.1680405183454; 
 Sat, 01 Apr 2023 20:13:03 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a1709028ec600b001a1ea1d6d65sm3974309plo.272.2023.04.01.20.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 20:13:02 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  2 Apr 2023 12:12:59 +0900
Message-Id: <20230402031259.286-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yohan Joung Fix alignment check to be correct in npo2
 as well Signed-off-by: Yohan Joung --- fs/f2fs/segment.c | 5 +++-- 1 file
 changed, 3 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pio9V-0007tj-7I
Subject: [f2fs-dev] [PATCH v2] f2fs: fix align check for npo2
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
Cc: Yohan Joung <jyh429@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yohan Joung <jyh429@gmail.com>

Fix alignment check to be correct in npo2 as well

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..c1525168f265 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1842,6 +1842,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	sector_t sector, nr_sects;
 	block_t lblkstart = blkstart;
 	int devi = 0;
+	u64 remainder = 0;
 
 	if (f2fs_is_multi_device(sbi)) {
 		devi = f2fs_target_device_index(sbi, blkstart);
@@ -1857,9 +1858,9 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
 		sector = SECTOR_FROM_BLOCK(blkstart);
 		nr_sects = SECTOR_FROM_BLOCK(blklen);
+		div64_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);
 
-		if (sector & (bdev_zone_sectors(bdev) - 1) ||
-				nr_sects != bdev_zone_sectors(bdev)) {
+		if (remainder || nr_sects != bdev_zone_sectors(bdev)) {
 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
 				 blkstart, blklen);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
