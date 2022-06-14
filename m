Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6054AF83
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 13:50:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o153s-0003eO-Jn; Tue, 14 Jun 2022 11:50:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qxy65535@gmail.com>) id 1o153s-0003eI-1q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 11:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7USdEj51HE+B1W75ZrU25EJ9oEbMG9WGuwAFaI6L8WI=; b=JfcU/qNtIwl5+52TLmCsx1hCux
 fdqqrWLkYVt8/4yXcxpBwCMtTqzY5GXs9u5TTCH8QZMYZpocMigBUV4tM0z9/dtqvlJNBxGhGg5Av
 GGX/rtZ0zynAQDs7RpiVtK0yiyVSC4DlKW338RDP3Qb/cO/IOcUM0uBvQ/613KCT7BgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7USdEj51HE+B1W75ZrU25EJ9oEbMG9WGuwAFaI6L8WI=; b=S
 pT3h2AK8y5VpAefq8OcrumHvZYXLDSbjtxG/Y4iUlbSPQG0/RQD/3LfudB+IFgNLojCZ/YN0jbjGO
 Ct0fD4HcapJwcta0yZhJjFE3pff6mkxzWP2tLEmyaSaZk7YQoZaDAxWJ8HnGCehcahW+T+xpBTiQo
 /TWrEhPNWGfTuYbk=;
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o153n-001FS5-HD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 11:50:20 +0000
Received: by mail-pg1-f174.google.com with SMTP id h192so8301627pgc.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jun 2022 04:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7USdEj51HE+B1W75ZrU25EJ9oEbMG9WGuwAFaI6L8WI=;
 b=SHDYoBfQEbpxLJf9QLOz5WYVuhOqKagBsWr2lKNJC5ivL+lqvNOb5rhAaCrOMyQie9
 kzJJercKHSZodWdYSA3z1AmTaPCjl935BN8b9HeN3XvZ9pCTi8UnF+5mq1wlzS+6S/b0
 tnEbqlJjK8YPELkWyofXdseg7vYRSL3y+/PPErFJ2eIOl4A+sYIuqp/MSOB53IoMC73N
 iHUeSEA+gxgWixbbPOvivMy8r920+AhT83Ps2WUdikycbYR6J+jlB81CBTep4auVyyyn
 5fwWBsK10wJPlWpoRlN6YtKRylNBWsWYG34P9gj56q3pVdRYg8lzH93zR79NydS3jjdi
 FTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7USdEj51HE+B1W75ZrU25EJ9oEbMG9WGuwAFaI6L8WI=;
 b=a9uQ4bwwa4/QCORQfDXMqdTnZ2qMhNbMr0GRWRbJo+MsPDw5qeWIMG2uoEjb20sOnZ
 5tPhZZ/wj5Sqj9q3REhTIrsQ3/x7bGhSnls9CbsPKypuXbcqGUW0blNuqXZKOeg8sMHR
 //+1YPg6D51BK6CKY5tN65dT5j8dz41bh3agQkZGe3LBDhwv94e5JYlMCvvFDXfXhFRv
 FGBhQ3Ap4RRfM37KrZuPdEurwUBAiQIozBtSgCi7av1wzCdj1hG2sCXdxmA3FUI3XMez
 pOj/5RflyQIy2oBJkdvye/L/ptYfftckdHJE6bKb3fDZciRy9PZTrTOvdC5F+G2QSDbD
 CPNw==
X-Gm-Message-State: AOAM531DHzCsSyOADqV2V2JbMHKYmhmXKrNTo/gQBqlIfCZRHRdPh4Jl
 ZNWmVOtB8Vfa3FgL85tDggpoSEpNvB8cVg==
X-Google-Smtp-Source: ABdhPJz2uVsUMAAG8G/cswub01WoridQVs3LbPbqALCem8eTfK5OBpikxbeU18hETFsqc+A7X5jnPA==
X-Received: by 2002:a05:6a00:1145:b0:4f6:3ebc:a79b with SMTP id
 b5-20020a056a00114500b004f63ebca79bmr4419369pfm.41.1655207409855; 
 Tue, 14 Jun 2022 04:50:09 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.250])
 by smtp.gmail.com with ESMTPSA id
 ay21-20020a056a00301500b0051bc3a2355csm7291268pfb.64.2022.06.14.04.50.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jun 2022 04:50:08 -0700 (PDT)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: jaegeuk@kernel.org
Date: Tue, 14 Jun 2022 19:49:28 +0800
Message-Id: <20220614114929.6897-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
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
 option to manually specify overprovision. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.174 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o153n-001FS5-HD
Subject: [f2fs-dev] [PATCH 1/2] resize.f2fs: add option to manually specify
 new overprovision
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
Cc: liuchao12 <liuchao12@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liuchao12 <liuchao12@xiaomi.com>

Make.f2fs supports manually specifying overprovision, and we expect
resize.f2fs to support it as well.

This change add a new '-o' option to manually specify overprovision.

Signed-off-by: liuchao12 <liuchao12@xiaomi.com>
---
 fsck/main.c   |  8 ++++++--
 fsck/resize.c | 12 ++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

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
index f1b7701..d19c6fa 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -146,12 +146,15 @@ safe_resize:
 						get_sb(segs_per_sec));
 
 	/* Let's determine the best reserved and overprovisioned space */
-	c.new_overprovision = get_best_overprovision(sb);
+	if (c.new_overprovision == 0)
+		c.new_overprovision = get_best_overprovision(sb);
+
 	c.new_reserved_segments =
 		(2 * (100 / c.new_overprovision + 1) + 6) *
 						get_sb(segs_per_sec);
 
-	if ((get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
+	if (c.new_overprovision == 0 ||
+		(get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
 		get_sb(segment_count_main) * blks_per_seg >
 						get_sb(block_count)) {
 		MSG(0, "\tError: Device size is not sufficient for F2FS volume, "
@@ -476,6 +479,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
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
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
