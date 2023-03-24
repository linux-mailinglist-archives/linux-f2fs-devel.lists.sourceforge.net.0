Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA466C7E72
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 14:08:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfh9I-00012A-FL;
	Fri, 24 Mar 2023 13:08:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1pfh9G-00011t-Bn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 13:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ML7VBv7XlyCu7FAut6rRzjQeV7yr72fXHIIMk8RclWk=; b=VaLX3Bnmf0tHh+ck+pOwdlsmNX
 WnV4HOTSzYm2sM+E0171RsoIwonBqT5UYyFtoWP2cNpIZTZBXp2rdTA7x6WIb4QdsUsJSaE8Vs8Ru
 ly7jGm7ZPf1VGdqjT7GBTLGblm3s39KJdPDOwZXxF6z/HATUTSC0TMeaczRfVjOzeisY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ML7VBv7XlyCu7FAut6rRzjQeV7yr72fXHIIMk8RclWk=; b=czWPr+Orde3rnqcoh1b14HJC0K
 MvM4+bOhxD50u2L4EiPx/v2kzAb0L8lcgoDtlDox/jcMOb6D0VPpntR+7W8FB0U3Lj30cI5FOGasI
 yzlntrDJCLeBY+++xsx6TCFa+dWzeK1bP6p10h0XmlfY3x+I/zEiz6VSMha0Ne+M3qlY=;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pfh9E-0000kw-R3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 13:08:02 +0000
Received: by mail-pg1-f171.google.com with SMTP id s19so1069397pgi.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Mar 2023 06:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679663275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ML7VBv7XlyCu7FAut6rRzjQeV7yr72fXHIIMk8RclWk=;
 b=mfWseLTSCbOBB+sSAr5vN/irU+vs2TOjW9ljyOFopToQR18sDQigO4UZdXn97oJ8go
 ISTlF4ZuIFAel06Z0s5OfTSRpczkqKdIKyM8gV8MSLOH0PZm28F3dnpv2uMM94BknmUM
 FkcIfDkztBDpDruWEpdjixZle3KoeViAXyAet+Ges4nwUPXYKECPr6tUj8L9e4xr2Krq
 x8GyItMO8NafsYSSrerh1tVtoPrVhsg5x9yuqT9KOpB0OpzUDvnIcxpru/qZfSZq7C7p
 yhMaXfeXYGYMKU7M5w9qPPkGBUrh8RtP/PLwYkXMIWfj+aXyLAY7Ut3Nb8hbLkapVigR
 QlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679663275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ML7VBv7XlyCu7FAut6rRzjQeV7yr72fXHIIMk8RclWk=;
 b=kxn59n6In6s9Jn7PP2CI2p7k29Uk1a9hPwPNVdSyE7tWntjFC3ogkLhswlrDONfkIM
 FwlRF0GHlTKGXHyOZmHBudjrh4pkXQvecV7WUWPH3c+9DdMKFyh4Xj+soY6Sb+xJWccw
 ySR67G7a3zuuZzqvOt0cddlloQwT7zGwj4ojh/YOodqjzlInxrm7YovjSWJeecpjbdjJ
 4WX6Ykzr8vLSB5Z7qIzn15ag81sYPGqkT7+xzP3J71kxtpnWaICRuJcWclz2LWSGb/j0
 mPn9l0p3yYD/PhcqzeAcgzQS6XqlVN7v68LCvwvNnyZG1H/GZbTLUydKPUiRvd9ynghE
 A4wA==
X-Gm-Message-State: AAQBX9cVwhgjuzF+P2Ya2BY1UGtMfD/n8cwD6c/KS+Q/qMeT0uUvqM8g
 D2p05nCIhLxZTl54Hc9A6rs=
X-Google-Smtp-Source: AKy350awoE/Mfx31AyNqUQ0MW8ZHQLZjcZ9TVqVIFJQa3De1zZ/eJqj8JlErfsgbbcmpb23ogieGNA==
X-Received: by 2002:aa7:9908:0:b0:5a8:a0df:a624 with SMTP id
 z8-20020aa79908000000b005a8a0dfa624mr2604869pff.22.1679663275065; 
 Fri, 24 Mar 2023 06:07:55 -0700 (PDT)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a62ab12000000b005809d382016sm4141966pff.74.2023.03.24.06.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 06:07:54 -0700 (PDT)
From: Yohan Joung <jyh429@gmail.com>
To: jaegeuk@kernel.org
Date: Fri, 24 Mar 2023 22:07:47 +0900
Message-Id: <20230324130747.523-1-jyh429@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZBzlJ36kO5KvxODB@google.com>
References: <ZBzlJ36kO5KvxODB@google.com>
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix alignment check to be correct in npo2 as well
 Signed-off-by:
 Yohan Joung --- fs/f2fs/segment.c | 5 +++-- 1 file changed, 3 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
 055e70e77aa2..f4a22a065277
 100644 --- a/fs/f2fs/segment.c +++ b/fs/f2fs/segment.c @@ -1842,6 +1842,7
 @@ static int __f2fs_issue_discard_zone(st [...] 
 Content analysis details:   (2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.171 listed in list.dnswl.org]
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
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.171 listed in wl.mailspike.net]
X-Headers-End: 1pfh9E-0000kw-R3
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
Cc: lkp@intel.com, jyh429@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix alignment check to be correct in npo2 as well

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 055e70e77aa2..f4a22a065277 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1842,6 +1842,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	sector_t sector, nr_sects;
 	block_t lblkstart = blkstart;
 	int devi = 0;
+	u32 remainder = 0;
 
 	if (f2fs_is_multi_device(sbi)) {
 		devi = f2fs_target_device_index(sbi, blkstart);
@@ -1857,9 +1858,9 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
 		sector = SECTOR_FROM_BLOCK(blkstart);
 		nr_sects = SECTOR_FROM_BLOCK(blklen);
+		div_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);
 
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
