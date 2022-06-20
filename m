Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28C5517E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 13:57:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3G1x-0002sM-UD; Mon, 20 Jun 2022 11:57:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qxy65535@gmail.com>) id 1o3G1w-0002s8-FM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 11:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fspGpbF+a/tNC1sNSTA/NSolNIjuZW10eZcuVG52+qI=; b=G7M9Q3eq3bJ/AwOtc6nLizEsOg
 6S9Y6Zi2EYW6tB5aUE9wi1YAP/0HS6KSklJOtYwCwvxzI0LYejfNqiqfjJYwRggq+85w3FlT1vSnZ
 sspEkBMeJ8L0P6/T3iFcknl+mNK5lTNH3zBPan7NjtWKMKs2lbDXW9FGx9GoJWr/3vL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fspGpbF+a/tNC1sNSTA/NSolNIjuZW10eZcuVG52+qI=; b=L4jBRFSKV0gwcGWIploioDuZls
 hb0rcSe4uzAecPw0Uhixr7uSfERmJWkzG6EHHQQff44smcvGxFzriWJt15hjGwRZ3BhiWsIOrHkKX
 J1g4uUVYQBPxlZlkrt7qXvf3zZDtp3YfKzsXvEvGmiI+qQaweV7oS7dxftlacir/nAJY=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o3G1r-00089e-Gs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 11:57:20 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso10077392pjh.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jun 2022 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fspGpbF+a/tNC1sNSTA/NSolNIjuZW10eZcuVG52+qI=;
 b=nDA9AxaJXkSw4h/423thk9/K+swFT7dC4J0doqPwQxKqklzzggoB/0sE1fLQwnmnph
 R/Mca/oYREnoJzMn6FCQlY+a8r5ZUDTYRZ9DUCKGykDVtpTgwOelo0mYBQfODVC17oxr
 2whc8bUGZ3Uf63wCW/TCYM0Q4oqahPWeYX1GvMmLAirCgnarYInaOwmdfRTqFy+7NdlZ
 fdqpKZjdsoE3hqe53K06hBnLi3ICjBGMZsuAItI715alDkNeL/USie3quNHNwsG1/ota
 l366q46liN0agQJBZoC8sWUkd1qk2xJuCOSMLpGKb6YrN934MBn5JQ02g/OqPe5VSGDW
 jmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fspGpbF+a/tNC1sNSTA/NSolNIjuZW10eZcuVG52+qI=;
 b=E29wSmoW6Ek1zvyfgap4DC5r3rZP6Y5HqTPOkwJYZwc69zpPiEqXJSbFKw25f2sZIQ
 /XpccxhStpHtroijpMPHnxexJ1a/itn1eGCUCyrDRByWoIbsaILp+hwdpD4NDtSObOcc
 Qf6xej8gRffDJy8ge4GJUgj0fgTkCbnZpbvPFYqY0g0yTxqOx3cIBdrq/KevKNMKlqgV
 K1Nu4/f1OQRXHtNXVfSR4yf7RQbJ0DJcPuTEje7IrmEdbxvGjdG2e5wqG3on/3h/g9Um
 Bommci5ntofMLjvMxH+7IgDimH0bezAOj2zFxi0E9yLxxvkeH+ArKCx8PBVLI3LSlIh0
 3xxQ==
X-Gm-Message-State: AJIora+CLgyy4WpEeZgGwjXjtcQMT88vhGaZNYf9vE5KweBqb5CaeKQn
 pa6AtQHQha3MK7JkpEgb7W8=
X-Google-Smtp-Source: AGRyM1t0+MI3KijEuW3nC/Cff77T+NSYR2+WTfmcGO8La3flzJPImRe/aqeqT9b4P6W/iTnWJ0H9Eg==
X-Received: by 2002:a17:90b:388f:b0:1e8:5a44:8205 with SMTP id
 mu15-20020a17090b388f00b001e85a448205mr38161790pjb.221.1655726229869; 
 Mon, 20 Jun 2022 04:57:09 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.250])
 by smtp.gmail.com with ESMTPSA id
 mm21-20020a17090b359500b001ec86a0490csm4539154pjb.32.2022.06.20.04.57.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jun 2022 04:57:09 -0700 (PDT)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Date: Mon, 20 Jun 2022 19:56:28 +0800
Message-Id: <20220620115629.9169-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <5627a654-d605-6840-a133-e583c804aadd@kernel.org>
References: <5627a654-d605-6840-a133-e583c804aadd@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: liuchao12 Make.f2fs supports manually specifying
 overprovision, 
 and we expect resize.f2fs to support it as well. This change add a new '-o'
 option to manually specify overprovision, and fix to check free space before
 grow. Otherwise, after grow, kernel may report below error message when we
 mount the image if -o [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o3G1r-00089e-Gs
Subject: [f2fs-dev] [PATCH v3 1/2] resize.f2fs: add option to manually
 specify new overprovision
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 liuchao12@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liuchao12 <liuchao12@xiaomi.com>

Make.f2fs supports manually specifying overprovision, and we expect
resize.f2fs to support it as well.

This change add a new '-o' option to manually specify overprovision,
and fix to check free space before grow. Otherwise, after grow,
kernel may report below error message when we mount the image if -o
parameter is specified during resize:

F2FS-fs (loop0): invalid crc_offset: 0
F2FS-fs (loop0): Wrong valid_user_blocks: 16404, user_block_count: 13312
F2FS-fs (loop0): Failed to get valid F2FS checkpoint
mount(2) system call failed: Structure needs cleaning.

Signed-off-by: liuchao12 <liuchao12@xiaomi.com>
Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---

  Change log from v2:
    - Sorry for miss liuchao12 mistakenly when merge the two patches...

  Change log from v1:
    - merged fix to check free space before grow
    - delete unessassary check of "c.new_overprovision == 0"
    - update man page

 fsck/main.c       |  8 ++++++--
 fsck/resize.c     | 45 ++++++++++++++++++++++++++++++++-------------
 man/resize.f2fs.8 |  9 +++++++++
 3 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index aef797e..3b4da0f 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -121,7 +121,8 @@ void resize_usage()
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
-	MSG(0, "  -s safe resize (Does not resize metadata)");
+	MSG(0, "  -o overprovision percentage [default:auto]\n");
+	MSG(0, "  -s safe resize (Does not resize metadata)\n");
 	MSG(0, "  -t target sectors [default: device size]\n");
 	MSG(0, "  -V print the version number and exit\n");
 	exit(1);
@@ -527,7 +528,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:fst:iV";
+		const char *option_string = "d:fst:io:V";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -561,6 +562,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 'i':
 				c.large_nat_bitmap = 1;
 				break;
+			case 'o':
+				c.new_overprovision = atof(optarg);
+				break;
 			case 'V':
 				show_version(prog);
 				exit(0);
diff --git a/fsck/resize.c b/fsck/resize.c
index f1b7701..3d8ea46 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -146,7 +146,9 @@ safe_resize:
 						get_sb(segs_per_sec));
 
 	/* Let's determine the best reserved and overprovisioned space */
-	c.new_overprovision = get_best_overprovision(sb);
+	if (c.new_overprovision == 0)
+		c.new_overprovision = get_best_overprovision(sb);
+
 	c.new_reserved_segments =
 		(2 * (100 / c.new_overprovision + 1) + 6) *
 						get_sb(segs_per_sec);
@@ -476,6 +478,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
 						get_cp(rsvd_segment_count));
 
+	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
+	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
+					get_cp(overprov_segment_count),
+					c.new_reserved_segments);
+
 	free_segment_count = get_free_segments(sbi);
 	new_segment_count = get_newsb(segment_count_main) -
 					get_sb(segment_count_main);
@@ -591,6 +598,26 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	DBG(0, "Info: Done to rebuild checkpoint blocks\n");
 }
 
+static int f2fs_resize_check(struct f2fs_sb_info *sbi, struct f2fs_super_block *new_sb)
+{
+	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	block_t user_block_count;
+	unsigned int overprov_segment_count;
+
+	overprov_segment_count = (get_newsb(segment_count_main) -
+			c.new_reserved_segments) *
+			c.new_overprovision / 100;
+	overprov_segment_count += c.new_reserved_segments;
+
+	user_block_count = (get_newsb(segment_count_main) -
+			overprov_segment_count) * c.blks_per_seg;
+
+	if (get_cp(valid_block_count) > user_block_count)
+		return -1;
+
+	return 0;
+}
+
 static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -608,6 +635,9 @@ static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
 	if (get_new_sb(new_sb))
 		return -1;
 
+	if (f2fs_resize_check(sbi, new_sb) < 0)
+		return -1;
+
 	/* check nat availability */
 	if (get_sb(segment_count_nat) > get_newsb(segment_count_nat)) {
 		err = shrink_nats(sbi, new_sb);
@@ -651,11 +681,8 @@ static int f2fs_resize_shrink(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_super_block new_sb_raw;
 	struct f2fs_super_block *new_sb = &new_sb_raw;
-	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 	block_t old_end_blkaddr, old_main_blkaddr;
 	block_t new_end_blkaddr, new_main_blkaddr, tmp_end_blkaddr;
-	block_t user_block_count;
-	unsigned int overprov_segment_count;
 	unsigned int offset;
 	int err = -1;
 
@@ -666,15 +693,7 @@ static int f2fs_resize_shrink(struct f2fs_sb_info *sbi)
 	if (get_new_sb(new_sb))
 		return -1;
 
-	overprov_segment_count = (get_newsb(segment_count_main) -
-			c.new_reserved_segments) *
-			c.new_overprovision / 100;
-	overprov_segment_count += c.new_reserved_segments;
-
-	user_block_count = (get_newsb(segment_count_main) -
-			overprov_segment_count) * c.blks_per_seg;
-
-	if (get_cp(valid_block_count) > user_block_count)
+	if (f2fs_resize_check(sbi, new_sb) < 0)
 		return -1;
 
 	/* check nat availability */
diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
index 463eca5..a4b6cd7 100644
--- a/man/resize.f2fs.8
+++ b/man/resize.f2fs.8
@@ -13,6 +13,10 @@ resize.f2fs \- resize filesystem size
 .B \-d
 .I debugging-level
 ]
+[
+.B \-o
+.I overprovision-ratio-percentage
+]
 .I device
 .SH DESCRIPTION
 .B resize.f2fs
@@ -35,6 +39,11 @@ Specify the size in sectors.
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \-o " overprovision-ratio-percentage"
+Specify the percentage of the volume that will be used as overprovision area.
+This area is hidden to users, and utilized by F2FS cleaner. If not specified, the
+best number will be assigned automatically according to the partition size.
+.TP
 .SH AUTHOR
 This version of
 .B resize.f2fs
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
