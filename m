Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A6B2DCD0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqNYIhy+7GTGZq3C9xQZqh2mhd27LyHwc9BV41CLvls=; b=ffS49q28Oo7NyvJtFhY5XZEYHn
	HMMwaebzL+2k7D7exlaTvoNV++MyWgxKGkIoDJW9uemhZe0K6ntUeCJRgI/1me0SpFr/hpxqmVoyX
	5AzHM8z2tQ3jyVbFUwzLc7ZLzVWMpdZIm+NUoL1odINrhzmRhjeudofOY849fuxSDKXs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9w-0006Ef-1J;
	Wed, 20 Aug 2025 12:43:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9t-0006EV-Ka
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=; b=K8eZXqRQClq03P0fifeYdS4er9
 h+rGFYc875p2Cdp7x5HG6dH/zoZPSyypiM7OFtxEJk++sFBHIUlN3FEsKJZT/hiy9VHNxUC1DJ7OK
 OXB4R9LujFS6o9Ks0UJY6u4JH4H4KDC5Fdsu6nubNW11+W4XjrJ6vgURYJEBlPm48uGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=; b=Un41rJGZgj1PNersDcRCRvUT0w
 3KW37UytmTMrLovSoASTS0gtXTp+2QpXX5bKIGonAyAYLiRCkyDkSfxKJ5CUm61q9puonhd8nwZwY
 S3lowUmKZZe1DXchppjXlN389IsC7hZlkpHaQIcg1EMLxezF2yQ68oy5meQSD3eSgfsM=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9t-0003mD-AS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:17 +0000
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b472fd93b4aso4147620a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693787; x=1756298587; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=;
 b=A0SHx+635bPlK5AA/ksof7dTMEhvxkPJ/7kTZ1oYv85JAEuVREpvBdKkEOq06/SKp+
 K1zCuJLcgJg+owjF67cUQbHAVWchPxu3rwYDtRFkTReMZM5GYJQob6ECfV9TI23M/psN
 ho0J2VsNyc+0+KKNgdy/CPvk7W6oS6+k8qhUBowMJ+n786P8vNfhdhsSYfGBVmOLdpLB
 7eS5ufXpudok9C6ShJP8Jhq59aBP+AGnRHJBVBqQIoj5TuRwJyaiMWP5pT+quI5yjUfJ
 UEgamj9WJrkNhEx04Mqb/hWy7CvmKay7ChCkLbtNcIO0GZ5tKRYlXgJtPBM/YXigPHib
 hfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693787; x=1756298587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=;
 b=B24gigrtiu8uHboGslMV3Db/giYOJ7dkTONlttNsJwgV/3c7Pp/AseS70od0oqn8et
 f3snUaY3jmAkLmdMGNamdKsOq1crzCvLxUoGk3b8RZhQvzYwlBcwru5w/7FnjJHU/WzW
 1EHNKW55rTVR3PscSg4CDk+ms06vc/P8m/ORwT1ii/AE9+vUj7+N0Sv71AJEEuWit4WI
 eheASt5XplKSRcAvzGmfhT/UItyQG0Zkfucr1TGxZbaQW1+3AdTN1nb6e//6mC18QTfq
 lWlfnyh0NArpbdqmWgtpqNNJj7Df46KlrUVpYPwjAv8EXEPL8V6kAs0+cMWTWjTQmlA5
 9kjg==
X-Gm-Message-State: AOJu0YyC/etLJlZBkm0fGrkZd+SP2noPS2Is5kNr7fhZ4c72DNOuWZ7G
 E5GmUbj9DJXwnjenPnM/j/UsY9+A0G7jiBdrBfXFr+aexEnCb9eZ1eqR
X-Gm-Gg: ASbGncsTaaajLkdhpCn4VMSstpQNyuLP8YwT4p/qEMo6m/jsbUEgWFY9k2ZQJzXZ8Kr
 O7J4eJWhKxGq5PSWAOAu2+6vtyNgbwSGQnb4SC6SuN0+NIrmBReXwDCQ9MLYod52kG34EQONPqE
 7TZwmT3yDwPIy4YuK+g5hhjYdSpfgg2LEC+/QXLxqT0Mb4zwnvlfXtI+RVo/VpLKpaVLhi7U8Aa
 HXJhQRcpJmMmTR0maKcdA7lrxdNMrEjix1HOmRoCsnx/P/hax92Z+tt7I9rD/LjmX8nMWooItmz
 R32sUN+bTZe2Dp/Ul7SbNfPpctxZut4XqDWfk6nThiqHEB0jA2GoxSmdhOlAjgFTd4ppW6aw+HC
 jIA1q9N62VHiL00vNQQJdLx2iZAOL
X-Google-Smtp-Source: AGHT+IGlEHWE4XuvUD0uGQoDMi2mVHLxHroa9jzzOzK5c+p6QGQAdSAGzpyxqWHfuQnGcOZV69a+6w==
X-Received: by 2002:a17:902:d547:b0:245:f2c2:650c with SMTP id
 d9443c01a7336-245f2c270b1mr20162765ad.18.1755693786440; 
 Wed, 20 Aug 2025 05:43:06 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:06 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:30 +0800
Message-ID: <20250820124238.3785621-6-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong dump.f2fs shows more info: * nat entry
 version
 * sit entry mtime Signed-off-by: Sheng Yong --- fsck/dump.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoi9t-0003mD-AS
Subject: [f2fs-dev] [PATCH v3 05/13] dump.f2fs: print more info
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

dump.f2fs shows more info:
 * nat entry version
 * sit entry mtime

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/dump.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 10df7e593bfe..21de2acf80b5 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -70,10 +70,10 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 			ASSERT(ret >= 0);
 			if (ni.blk_addr != 0x0) {
 				len = snprintf(buf, BUF_SZ,
-					"nid:%5u\tino:%5u\toffset:%5u"
+					"nid:%5u\tino:%5u\tver:%3d\toffset:%5u"
 					"\tblkaddr:%10u\tpack:%d"
 					"\tcp_ver:0x%" PRIx64 "\n",
-					ni.nid, ni.ino,
+					ni.nid, ni.ino, ni.version,
 					le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
 					ni.blk_addr, pack,
 					le64_to_cpu(footer->cp_ver));
@@ -91,10 +91,10 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 			ret = dev_read_block(node_block, ni.blk_addr);
 			ASSERT(ret >= 0);
 			len = snprintf(buf, BUF_SZ,
-				"nid:%5u\tino:%5u\toffset:%5u"
+				"nid:%5u\tino:%5u\tver:%3d\toffset:%5u"
 				"\tblkaddr:%10u\tpack:%d"
 				"\tcp_ver:0x%" PRIx64 "\n",
-				ni.nid, ni.ino,
+				ni.nid, ni.ino, ni.version,
 				le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
 				ni.blk_addr, pack,
 				le64_to_cpu(footer->cp_ver));
@@ -135,8 +135,10 @@ void sit_dump(struct f2fs_sb_info *sbi, unsigned int start_sit,
 		offset = SIT_BLOCK_OFFSET(sit_i, segno);
 		memset(buf, 0, BUF_SZ);
 		snprintf(buf, BUF_SZ,
-		"\nsegno:%8u\tvblocks:%3u\tseg_type:%d\tsit_pack:%d\n\n",
+		"\nsegno:%8u\tvblocks:%3u\tseg_type:%d\tmtime:%llu\t"
+		"sit_pack:%d\n\n",
 			segno, se->valid_blocks, se->type,
+			(unsigned long long)se->mtime,
 			f2fs_test_bit(offset, sit_i->sit_bitmap) ? 2 : 1);
 
 		ret = write(fd, buf, strlen(buf));
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
