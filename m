Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8B46C6096
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 08:24:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfFIr-0003fx-OC;
	Thu, 23 Mar 2023 07:24:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1pfFIp-0003fq-Hr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 07:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=buAA0gQONMWjkOKf6MOi67XvxnQyV7zOZpCFmaXgVLI=; b=b2PVdAuxmXPS6boIpNFfP8tUzY
 R7vyVS/gQHP7M72EajR8KJOaf7+l3HN+V5+iLBin+x6budFZXW/DDgYqwlaTPE7GsS4WM7CX7Zt92
 wd8zjmXuBwQoLUhMihlxeUkOVWykiDtyFumz2d4R19dKygaKg5URRuQakvT5WRkE/dFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=buAA0gQONMWjkOKf6MOi67XvxnQyV7zOZpCFmaXgVLI=; b=V1HEF7ap9fI/V/bNIXhu3n9vqT
 iNA9BK7qPnqCGANKXgJs24gf81LLjIy8XsEAmYk0PuL6hBskNPNAh9nk9eY3OlGhOWbxd8UdvneTH
 XoK61Ej/amYGCuGSfZ1lRqYZ6VSKc0STf6pw+GdBrj6wzvoiQfP63oBH5HVZYWTX1qa0=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pfFIp-00HRB7-6y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 07:24:03 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso2746354pjc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Mar 2023 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679556237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buAA0gQONMWjkOKf6MOi67XvxnQyV7zOZpCFmaXgVLI=;
 b=BwyezKzNUfJO24XJVuCeWKjJ6IRxjZ5OOcKf8Yd902IfLfzLsna/DcHVVSTAbNhKrc
 pfvcZdbY4N0rWsUWviK4dJtIzMnBKTJR+gdbIyTsg9RxsNxzQM+mond4mqGZBbPx0jN4
 /2vdACU86PD3yHB4FUwCJj5Chni2Qtp9LvQQUF/zhCTJnvxsAUeDAr+MHnuwGFT6cx3v
 OqO8tJs3nd1/05RDD2+FOWJBaJYBVshaWdA7b85efOn9i38Ef6dqbvCSAY0KgWoA1nVh
 lyS/V+wK+dk4twEqJECyiDr3XgGzcngjcSHOYSI6Xz41a31PgE9+NQboqvUMzQBEZQSw
 Pk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679556237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buAA0gQONMWjkOKf6MOi67XvxnQyV7zOZpCFmaXgVLI=;
 b=HU526p/5XK9ERbwRIH4gNuucV4bqa4QLCmLV6PiITEr877L9W93qUVAK+JA46Il4SV
 WopZRNQYY+YOuKdt/OXVHVppcAkxUF+ySMiMLRVPkXvHNmZ0q5gpeMD2DTwaFCwnQPuE
 2u1JGjiD1Uo2fRGXyegihT7V78qnYrazPZC2cXIs4LhnUpZebpUrBijucWZJ80bkYhYB
 pD9jYDptVK6Zw2i2Hd523Q1En0ph46vmuwIdj7Jcj82/AQfk+Fpcj5WpDb9JdUWgASIk
 uDqG69/41Lxuzrdy2VnTBLUfr0niHlwO5KdGJsanaUshNcV90JDqtW821v1gFxe1bqBa
 5Rfw==
X-Gm-Message-State: AO0yUKWZL572D0IAy434NFpfyfxVvnpOQn/cSpcGpQk7b7752RTMdZAf
 5SQDTHbWPuASBCNIxl/MjKA=
X-Google-Smtp-Source: AK7set9SOXtJImuAOa1KTCi+7H6Igv15mIZLquTlrWTwPzp4jAwGniT1wHdZ3xUmfpJkH70sHH0irw==
X-Received: by 2002:a17:903:42c3:b0:19e:dc0e:1269 with SMTP id
 jy3-20020a17090342c300b0019edc0e1269mr4723439plb.7.1679556237546; 
 Thu, 23 Mar 2023 00:23:57 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 je1-20020a170903264100b001a1ddd224desm5235691plb.89.2023.03.23.00.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 00:23:56 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
To: lkp@intel.com
Date: Thu, 23 Mar 2023 16:23:38 +0900
Message-Id: <20230323072338.175-1-jyh429@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202303231039.GKLRE8O5-lkp@intel.com>
References: <202303231039.GKLRE8O5-lkp@intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix alignment check to be correct in npo2 as well
 Signed-off-by:
 Yohan Joung --- fs/f2fs/segment.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
 055e70e77aa2..46458085a8d0
 100644 --- a/fs/f2fs/segment.c +++ b/fs/f2fs/segment.c @@ -1858,7 +1858,7
 @@ static int __f2fs_issue_discard_zone(st [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pfFIp-00HRB7-6y
Subject: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix alignment check to be correct in npo2 as well

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..46458085a8d0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1858,7 +1858,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 		sector = SECTOR_FROM_BLOCK(blkstart);
 		nr_sects = SECTOR_FROM_BLOCK(blklen);
 
-		if (sector & (bdev_zone_sectors(bdev) - 1) ||
+		if (sector % bdev_zone_sectors(bdev) ||
 				nr_sects != bdev_zone_sectors(bdev)) {
 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",

base-commit: d15180a8d1d72c7bddcb700d2c9ffdab7d2b9481
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
