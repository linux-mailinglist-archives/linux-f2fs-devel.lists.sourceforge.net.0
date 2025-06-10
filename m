Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34463AD3C67
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqNYIhy+7GTGZq3C9xQZqh2mhd27LyHwc9BV41CLvls=; b=YVW9D3fPekwFOyyOSpY0EAKCiD
	jhF6wJ6OlOyam4oPB/P2ycH+ORkTdN/2PSTktHHRJ5DrVu3yRf1eG+7XA/j6qNlL9XvpOZjZu+yJ9
	6t37BgjDE5++f1aNRc3ZLo30cPI3itpsjZWI2d5CKBxnVRQu1R03VJhpdykpOUzbD/aw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0gE-0005nr-1v;
	Tue, 10 Jun 2025 15:14:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0gD-0005nl-23
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=; b=MqN0XDKf3bgFDXyTaitNwGfpRN
 AJkm4H+weh86ghG9OYtMjzio61vM7cZjDfT11DNgYZAmcSEKdcLme6vcePKYwwprqIGD2sIZUPEmE
 qT3k0BNn7ZGVOFzoqad/N6YC8CZyS8vDfbq6xC3JyjUtb7uh8aDcdbx/eWEQvwyCik1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=; b=LgsvQwihKCbq6bVi5HVOoVgt1o
 SVN5oAfabip92lwCWdwqGUgS51gLbnpGEg2IuCBAJiXqslHU9HJqir8WJUxgzO6OIfgcDorW7PM4C
 kL2jUtCnLpwaoT+gav5xsQfcWo6rRZ/43jIKwWIr476vkOk8tvnh+FpopF+VxdkLcwiM=;
Received: from mail-qk1-f180.google.com ([209.85.222.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0gC-00032U-OB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:14:24 +0000
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7d21cecc11fso896816585a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568454; x=1750173254; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=;
 b=IKHewT/In7t6SVrQzEVWBEqkLCBQaaNhJqyifbUeuXiVL6zDEIeeJw9xuP6RehiGSw
 Mh6f7EbDuyD4otxddrJtK7mYmfW4ImZzQTtLp4d2aYF3o6J9jr0Pp7MXyXoT/IjoSmxd
 xYSwOYa53DkYBqF52dt61toyiCplQ0s3h0MFTqameyDs0Jb3IDjCGoCM/+aDVOw2zdO/
 RlO2jl2TkO/Yw0l2jAea1tCgoXMWE5J6Sg9xp0u2CgDin18Mn1traqFrJt0fivhVurU0
 PwvMTL5/qSpzMhX4QpvYms3Ic6q0HB3u8ibiiM9F2pMj3+vVDOSxK1xkILVgLlF5ygpv
 2stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568454; x=1750173254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwItgL9De2ErlmuRD00j/kHAGeGL21RGhXCER8YT7Ro=;
 b=szj3iaR+XMLU+rN2g83YTa+PWlGGKxKMeI0oKbP4m1JAazGEQrsSMTUq+FycVZCgtw
 OLJs8D9CSfqyfpebZL4h6wgAfgAZUvyt7OfibjGbSwuPVW6sbpMbkpL5TpZOyXsFN5fK
 L6XGp+sGZWxGRF3aWmjq6kmKrC+btdL4n1CfXumdTWcf4oPkVLmNXgvOmpMaKSDX2lpt
 nYclUwK4A3vmXTZuk+F6EoQBAfX068iBuElYaALp2tZVjbVRMuFec9/vvGxtYXWFUArB
 8M23o+8Q8q+tmjysd1L3oUFJkynuSuiObnAiB8LPFSqDXO1mA1CxWIjusHYQ5KL0/k+9
 z/TQ==
X-Gm-Message-State: AOJu0Yx8hnZB6dWgLwDc620rCgTvBckSG5VYT96/Ft0S0T0aagcsGSiC
 Nlk6DQd/7I4z4d04QAic5YuQUliLRfpuecG7WcdZQO+pY2NVDQieI99BRG00AQ==
X-Gm-Gg: ASbGncvV9lF73gsZVRVeMYU94Xj1Go9df3GxdYM13TB7PBE1ep3/v0TXdn+YjoM0us9
 dbNaUo+9RPTlU1z2WZyyw8idqhF1XWRq4B72byElMBH820dAlaoX7FaUgn81rX7PzJFHRI67Hiz
 GH2g6jzY46ftnTsfb3DFIYGhK7heYmGqb8gcRINlKY7MS+uvrMnckAzx0KZdd40TmPpGCPVtidS
 N7nNeFNj8FcSIs1Rb82B3iup0AKdVMuKtUMoyKj1sIOBmQHkKjqC3JjwIqI0KoWCZZl9uBwP8FF
 3NZ7TfTO0QMFWlKgnnLnp5Pjp6xIOPoacczKD2wlPT/qME6Vg5Tpok2LAx0B5ewtUzES
X-Google-Smtp-Source: AGHT+IEfECF7bMMaiY1d/p/pqhKWl9qHpItQ5LN9/g5Dx5Dgh8bytxQoaA0jFzSV1Aw/LbYGZYEb+Q==
X-Received: by 2002:a05:6a20:2586:b0:1f3:2e85:c052 with SMTP id
 adf61e73a8af0-21ee32b637bmr28285241637.35.1749559091635; 
 Tue, 10 Jun 2025 05:38:11 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:11 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:15 +0800
Message-ID: <20250610123743.667183-6-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.180 listed in wl.mailspike.net]
X-Headers-End: 1uP0gC-00032U-OB
Subject: [f2fs-dev] [RFC PATCH v2 05/32] dump.f2fs: print more info
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
