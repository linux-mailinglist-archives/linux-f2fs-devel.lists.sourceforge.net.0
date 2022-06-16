Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920054D90B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 05:59:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1gen-0008Kk-MB; Thu, 16 Jun 2022 03:58:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <y.w.zhang14@gmail.com>) id 1o1gei-0008Ka-Pc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 03:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y7tHgNjdjBTX+WouNjPGMUNaP1Lg7qQgm3Qb9GfUMy0=; b=K6A8LTCTRUCXCuyUE2tzf/EVfp
 k67XDrXoTWs3pTGiZpxKmZccfJ+iUHKHz6KCMWOrhVja+bqUAxo4O6ihh120GVeL+kZ018ms7A6Wl
 gpErvt06nZjTQl6CzknqVQ0VS/3ruDUBoFCfHmOZKcp+8nluq//pMDzyOxcafc9rlqYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Y7tHgNjdjBTX+WouNjPGMUNaP1Lg7qQgm3Qb9GfUMy0=; b=l
 3wl+IGVRe7w6PyST44G8RthVJWzF+7LARzsB1iyTt5oDphQYhkKpFwakgtdAhWz1OEa8/iy9KJl99
 F+aLSOxzAh41BSWMvmkFv0OuTTsIkak7ISLBkRMGg+OWwqFsJHlUcyj+scENuNhc3zSgnzwZGmrO1
 JokRNaOS9pe98SCw=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o1ged-003Yio-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 03:58:51 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so665941pjm.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Jun 2022 20:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y7tHgNjdjBTX+WouNjPGMUNaP1Lg7qQgm3Qb9GfUMy0=;
 b=WiPIMiADPSiYM6js8i8FVXHBJR/kVabsnM9uyQvd7J0M80r5zFc2STxq9B+wHHKY08
 0ormFg8HkGJtt/R/M4ShbdEE9of5sjVsULgQrxXSfr8jVjUEJtjkvMTBPu7M2oYKj+l0
 E0yyS39p3ENmedoiUkzuKaweQy21Ls9OpN/qxEbs71HcCllSHQ6zae3zqzs2rHpeMlnq
 cOMiy/uH/YQ6+QOEeBBJEP3GhpqTgeH9dcSkxqxdY0z4cPF0Bh8iS7O4e6rXIoeRwHdF
 QrH0kyO5zJhxp7/PqtB2V2oCRPl06ZQIClCrv7V1hR3pxSvahDNm1rDEBd/2yCX5DE0o
 82NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y7tHgNjdjBTX+WouNjPGMUNaP1Lg7qQgm3Qb9GfUMy0=;
 b=6g5mQe8oVXQE0MAGvlSt/nFQ/qqFB0AjhY2qNqbDpksEoXtLxkhMKJwc8JRJVkkwiO
 fIw482QYWNSkfCovVGFtfDnl/9oEe5vJdgWHWQQGipaqGaYN+nW8YmhFio0e1FvGP4zS
 fueKuWY90dEOnRvNZlLFg8hqcLEYB+Z4EBK6gkkW3bjEMTYcunrLg2G3g1wUfL1iX+Bo
 mleGlYccoXvNq+R1x414otCWjn0glOI3brsOeFFodb+FWXHsSIgaec2LUuosvZeUbNGz
 hrJdKRJpbrLGU2QmxLCY7vafoWpM+kTwUbfcu+DHykqRm602fxCFNLD767qlQZiCp9p6
 CMDA==
X-Gm-Message-State: AJIora+trBvjwwVpNLDDd9CG1VVHuAn+630IIjoNEr2TkZDlTevv652M
 Y3vwnZtsvYMIgBMu0N+1JXBKP4JmFhDThg==
X-Google-Smtp-Source: AGRyM1v+sas/n/X42eaQMtUesG/iQT9woyGfLqoMa/saar+vKdAN25OY2o+jJ3stI58itLAMb8LXyA==
X-Received: by 2002:a17:90a:6941:b0:1e2:f37a:f889 with SMTP id
 j1-20020a17090a694100b001e2f37af889mr14002085pjm.160.1655351921454; 
 Wed, 15 Jun 2022 20:58:41 -0700 (PDT)
Received: from localhost.localdomain (211-23-25-229.hinet-ip.hinet.net.
 [211.23.25.229]) by smtp.googlemail.com with ESMTPSA id
 m18-20020a17090b069200b001e2ff3a1221sm376172pjz.33.2022.06.15.20.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 20:58:41 -0700 (PDT)
From: Dylan Chang <y.w.zhang14@gmail.com>
X-Google-Original-From: Dylan Chang <dylan.chang@oneplus.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 16 Jun 2022 11:58:06 +0800
Message-Id: <20220616035806.1663-1-dylan.chang@oneplus.com>
X-Mailer: git-send-email 2.35.0.windows.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fibmap: Fix file too large causing file_pos overflow fibmap
 show file_pos with incorrectly value when passing a large file. Before: 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [y.w.zhang14[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [y.w.zhang14[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o1ged-003Yio-8Z
Subject: [f2fs-dev] [PATCH] Fix file too large causing overflow
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
Cc: Dylan Chang <dylan.chang@oneplus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fibmap: Fix file too large causing file_pos overflow

fibmap show file_pos with incorrectly value when passing a large file.

Before:

----------------file info-------------------
/data/media/0/data1 :
--------------------------------------------
dev       [254:18]
ino       [0x    4db1 : 19889]
mode      [0x    81b0 : 33200]
nlink     [0x       1 : 1]
uid       [0x    280e : 10254]
gid       [0x     3ff : 1023]
size      [0x1b3dca314 : 7312548628]
blksize   [0x    1000 : 4096]
blocks    [0x  da2530 : 14296368]
--------------------------------------------

file_pos   start_blk     end_blk        blks
       0     3197602     3198463         862
 3530752     3197509     3197509           1
 3534848     3197557     3197578          22
 3624960     3198464     3396701      198238
815607808     3396703     3632480      235778
1781354496     3632482     3652095       19614
1861693440     3396702     3396702           1
1861697536     3632481     3632481           1
1861701632     1514948     1514948           1
1861705728     1518774     1518774           1
1861709824     2543104     2543125          22
...
1862111232     2457813     2457813           1
1862115328     3652096     3878168      226073
-1506856960     3878170     4133725      255556
-460099584     1510048     1510052           5

Patched:
----------------file info-------------------
/data/media/0/data1 :
--------------------------------------------
dev       [254:18]
ino       [0x    4db1 : 19889]
mode      [0x    81b0 : 33200]
nlink     [0x       1 : 1]
uid       [0x    280e : 10254]
gid       [0x     3ff : 1023]
size      [0x1b3dca314 : 7312548628]
blksize   [0x    1000 : 4096]
blocks    [0x  da2530 : 14296368]
--------------------------------------------

file_pos   start_blk     end_blk        blks
       0     3197602     3198463         862
 3530752     3197509     3197509           1
 3534848     3197557     3197578          22
 3624960     3198464     3396701      198238
815607808     3396703     3632480      235778
1781354496     3632482     3652095       19614
1861693440     3396702     3396702           1
1861697536     3632481     3632481           1
1861701632     1514948     1514948           1
1861705728     1518774     1518774           1
1861709824     2543104     2543125          22
...
1862111232     2457813     2457813           1
1862115328     3652096     3878168      226073
2788110336     3878170     4133725      255556
3834867712     1510048     1510052           5

Change-Id: Ic2486e25ea03114d4dbf3651650c6a2399db0714
Signed-off-by: Dylan Chang <dylan.chang@oneplus.com>
---
 tools/fibmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/fibmap.c b/tools/fibmap.c
index 3238f29..3217600 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -47,7 +47,7 @@
 #endif
 
 struct file_ext {
-	__u32 f_pos;
+	__u64 f_pos;
 	__u32 start_blk;
 	__u32 end_blk;
 	__u32 blk_count;
@@ -56,9 +56,9 @@ struct file_ext {
 void print_ext(struct file_ext *ext)
 {
 	if (ext->end_blk == 0)
-		printf("%8d    %8d    %8d    %8d\n", ext->f_pos, 0, 0, ext->blk_count);
+		printf("%8llu    %8lu    %8lu    %8lu\n", ext->f_pos, 0, 0, ext->blk_count);
 	else
-		printf("%8d    %8d    %8d    %8d\n", ext->f_pos, ext->start_blk,
+		printf("%8llu    %8lu    %8lu    %8lu\n", ext->f_pos, ext->start_blk,
 					ext->end_blk, ext->blk_count);
 }
 
@@ -209,7 +209,7 @@ int main(int argc, char *argv[])
 			ext.blk_count++;
 		} else {
 			print_ext(&ext);
-			ext.f_pos = i * st.st_blksize;
+			ext.f_pos = (__u64)i * st.st_blksize;
 			ext.start_blk = blknum;
 			ext.end_blk = blknum;
 			ext.blk_count = 1;
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
