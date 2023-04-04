Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5B6D58AF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 08:21:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pja2m-00046C-I2;
	Tue, 04 Apr 2023 06:21:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pja2k-000466-6y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 06:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNeAT4LJkGBpLpeEzrm+tLr4gKPKdx4SirCmwKDyg4o=; b=KeZPgdHa0cNo5Nu3a6q2i5uT+y
 x4ghJcgcZQ40+yBt0WFSju0/tEQCCGZFhq+5NHy0EvdGFywgOsjgKiP/hW7dwZQd3SqFdqgA86QIa
 PkZ4Wb1dvQzEiIWAjNu+PHo48AGE7EH4sYwjQ3ofQygDUYVdHa+bl5P7tny9Mmg1jCBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zNeAT4LJkGBpLpeEzrm+tLr4gKPKdx4SirCmwKDyg4o=; b=bnNv2Niu7SLaLxhpbJ7IEshHep
 Stq7pWY3LgY6HgNmeL2mrvuOcFMOOgzC6jciXSg5w0XUfIoI5LyTCelhKCtiB/zq4Ym2hopFM8Td2
 N8gFqOOGF84l7e0bAIWnzOvfdkGKf1vWUmHqrsoknclVlu1q5HSoDmbSC44LrQre9POo=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pja2d-00ESrM-9N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 06:21:21 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230404062105epoutp0246946f45bef106d8d3599c24020a79ef~SpwhV4CvT0224102241epoutp025
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Apr 2023 06:21:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230404062105epoutp0246946f45bef106d8d3599c24020a79ef~SpwhV4CvT0224102241epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680589265;
 bh=zNeAT4LJkGBpLpeEzrm+tLr4gKPKdx4SirCmwKDyg4o=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=eKGQhNL8H76T+8Bha0QryLqEUMBRIpWexnyi0PLrdk6oco+j9rdVllj7v7Ifez1BD
 7yH6B5RHYt11kB0vVpslim2YaUnoBcwWy8U5NEOugc/BXri5ajsiuCuj0JOhPgkyo6
 bQsEiqCo73eYYDXPORx/aSi74hGP+txsSbo5bWlc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230404062104epcas2p1ab52250d34ee732ddda4c0df7f0cc7aa~Spwg0JeD31956319563epcas2p1B;
 Tue,  4 Apr 2023 06:21:04 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.89]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4PrHhJ09XZz4x9Pp; Tue,  4 Apr
 2023 06:21:04 +0000 (GMT)
X-AuditID: b6c32a45-8bdf87000001f1e7-c5-642bc1cf0455
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 4D.B1.61927.FC1CB246; Tue,  4 Apr 2023 15:21:03 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20230328080601epcms2p3853fec730598eb10f10117b0b375014f@epcms2p3>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230404062103epcms2p24f82d2807090ec9ca260bfa70c372bda@epcms2p2>
Date: Tue, 04 Apr 2023 15:21:03 +0900
X-CMS-MailID: 20230404062103epcms2p24f82d2807090ec9ca260bfa70c372bda
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmue75g9opBidum1usehBu8WT9LGaL
 S4vcLU6ueMFisapjLqPF1PNHmBzYPDat6mTz2L3gM5NH35ZVjAHMUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGe/fHWct+O1VsXrzO6YG
 xs02XYycHBICJhJt6y4zdjFycQgJ7GCU+Ni4hr2LkYODV0BQ4u8OYZAaYQF3iR9LN7GC2EIC
 ShLXDvSyQMT1JTYvXsYOYrMJ6Er83bAczBYRqJZ4t/Y5mM0sUCLRMHkxM8QuXokZ7U9ZIGxp
 ie3LtzKCrOIU8JO48g+qREPix7JeKFtU4ubqt+ww9vtj8xkhbBGJ1ntnoWoEJR783A0Vl5RY
 dOg8E4SdL/F3xXU2CLtGYmtDG1RcX+Jax0awE3gFfCUWz5wG9haLgKrE4nXPoU5zkTjcNZMV
 4nx5ie1v5zCDnMksoCmxfpc+iCkhoCxx5BYLRAWfRMfhv+wwD+6Y9wRqk5rE5k2bWSFsGYkL
 j9ugrvSQuNZ2hXkCo+IsRDDPQrJrFsKuBYzMqxjFUguKc9NTi40KDOExm5yfu4kRnPy0XHcw
 Tn77Qe8QIxMH4yFGCQ5mJRFe1S6tFCHelMTKqtSi/Pii0pzU4kOMpkBfTmSWEk3OB6bfvJJ4
 QxNLAxMzM0NzI1MDcyVxXmnbk8lCAumJJanZqakFqUUwfUwcnFINTNUcZ5xieeZ72YQE/Nr/
 Z9Om/yqJtQtaSiab3L6dmhvnnJGQ2HNeKW3u1V2Pwyo/Tnu5zuzT5mXFDSH3uSU+MH/keWJm
 J3F6Umqw3OPI/F4zyd4myZM9BXsmGV0MDWmTY4vPvsdd5TWZ19U++IdnqMWTw0cbT0dfVnO5
 wWLPP9sz7dPTouk82fd2LzwqUmeiMTFLL0q+RsanYOpXhVXm5/2zDgQpKmh2pU2QVth27ujn
 vpQHV88nHrF9W7XulM+vz8/m5/lVX+pc8d9lw3eGW/Ffu46fzSqXC1Wbs9FwDYsQ577ZVt8N
 Kx0Xv/LRlHn3Zm/0kaVLMz7qxoZf2qy3aRf7/jNmT9dfP3J+jtjyrUosxRmJhlrMRcWJAL+I
 xQYHBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230317044151epcms2p5872591b638dab3261a9dd563253f1b94
References: <20230328080601epcms2p3853fec730598eb10f10117b0b375014f@epcms2p3>
 <ZCIKIzPmJyjA44JK@google.com>
 <20230317044151epcms2p5872591b638dab3261a9dd563253f1b94@epcms2p5>
 <CGME20230317044151epcms2p5872591b638dab3261a9dd563253f1b94@epcms2p2>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Overview ======== This option allows zoned block device users
 to configure GC reserved and overprovision area manually according to their
 demands on performance of sustained write latency and WAF. Problem =======
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pja2d-00ESrM-9N
Subject: [f2fs-dev] [PATCH v2] mkfs.f2fs: Introduce configurable reserved
 sections
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
Reply-To: yonggil.song@samsung.com
Cc: Seokhwan Kim <sukka.kim@samsung.com>, Jorn Lee <lunar.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Overview
========

This option allows zoned block device users to configure GC reserved and
overprovision area manually according to their demands on performance of
sustained write latency and WAF.

Problem
=======

The overprovision segments that mkfs generates are mostly occupied by GC
reserved. This degrades WAF performance.

Experiment
==========

The following experiment evaluated the application of configurable reserved.
The experimental environment is as follows.

  System info
    - 4.2Ghz, 8 core CPU
    - 64GiB Memory
  Device info
    - a conventional null_blk with 448MiB capacity(meta area) and
    - a sequential null_blk with 953 zones of 64MiB
  Format
    - as-is (find out ovp ratio): mkfs.f2fs <conv null_blk> -c <seq null_blk> -m
        Info: Overprovision ratio = 3.700%
        Info: Overprovision segments = 1152 (GC reserved = 1088)
    - config rsvd: mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 2.965
        Info: Overprovision ratio = 2.965%
        Info: Overprovision segments = 1152 (GC reserved = 256)
  Mount
    - mount <conv null_blk> <mount point>
  Fio script
    - fio --rw=randwrite --bs=4k --ba=4k --filesize=58630m --norandommap --overwrite=1 --name=job1 --filename=<mount point>/sustain --time_based --runtime=2h
  WAF calculation
    - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs

Conclusion
==========

In the experiment, it can be shown that reducing the reserved segments
decreases WAF to 10% (from 222 to 23) although it triggers checkpoint more
frequently during gc. With direct IO, the WAF of as-is gets much higher.
In other words, a user can configure more reserved segments for lower GC
latency or allocate less reserved segments for lower WAF on the same number
of OP segments.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 include/f2fs_fs.h       | 22 ++++++++++++++++++++--
 lib/libf2fs.c           | 18 ++++++++++++++++++
 man/mkfs.f2fs.8         | 12 ++++++++++++
 mkfs/f2fs_format.c      | 30 ++++++++++++++++++++++++------
 mkfs/f2fs_format_main.c | 11 ++++++++++-
 5 files changed, 84 insertions(+), 9 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 333ae07a5ebd..5d74dcc0dc11 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -375,6 +375,10 @@ static inline uint64_t bswap_64(uint64_t val)
 
 #define LPF "lost+found"
 
+/* one for gc buffer, the other for node */
+#define MIN_RSVD_SECS	(NR_CURSEG_TYPE + 2U)
+#define CONFIG_RSVD_DEFAULT_OP_RATIO	3.0
+
 enum f2fs_config_func {
 	MKFS,
 	FSCK,
@@ -460,6 +464,7 @@ typedef struct {
 #define ALIGN_UP(addrs, size)	ALIGN_DOWN(((addrs) + (size) - 1), (size))
 
 struct f2fs_configuration {
+	uint32_t conf_reserved_sections;
 	uint32_t reserved_segments;
 	uint32_t new_reserved_segments;
 	int sparse_mode;
@@ -1614,6 +1619,20 @@ extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
 #define ZONE_ALIGN(blks)	SIZE_ALIGN(blks, c.blks_per_seg * \
 					c.segs_per_zone)
 
+static inline double get_reserved(struct f2fs_super_block *sb, double ovp)
+{
+	double reserved;
+	uint32_t usable_main_segs = f2fs_get_usable_segments(sb);
+	uint32_t segs_per_sec = round_up(usable_main_segs, get_sb(section_count));
+
+	if (c.conf_reserved_sections)
+		reserved = c.conf_reserved_sections * segs_per_sec;
+	else
+		reserved = (100 / ovp + 1 + NR_CURSEG_TYPE) * segs_per_sec;
+
+	return reserved;
+}
+
 static inline double get_best_overprovision(struct f2fs_super_block *sb)
 {
 	double reserved, ovp, candidate, end, diff, space;
@@ -1631,8 +1650,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 	}
 
 	for (; candidate <= end; candidate += diff) {
-		reserved = (100 / candidate + 1 + NR_CURSEG_TYPE) *
-				round_up(usable_main_segs, get_sb(section_count));
+		reserved = get_reserved(sb, candidate);
 		ovp = (usable_main_segs - reserved) * candidate / 100;
 		if (ovp < 0)
 			continue;
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index f63307a42a08..8dcc33bda0b5 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1069,6 +1069,24 @@ int get_device_info(int i)
 				dev->nr_rnd_zones);
 		MSG(0, "      %zu blocks per zone\n",
 				dev->zone_blocks);
+
+		if (c.conf_reserved_sections) {
+			if (c.conf_reserved_sections < MIN_RSVD_SECS) {
+				MSG(0, "      Too small sections are reserved(%u secs)\n",
+				    c.conf_reserved_sections);
+				c.conf_reserved_sections = MIN_RSVD_SECS;
+				MSG(0, "      It is operated as a minimum reserved sections(%u secs)\n",
+				    c.conf_reserved_sections);
+			} else {
+				MSG(0, "      %u sections are reserved\n",
+				c.conf_reserved_sections);
+			}
+			if (!c.overprovision) {
+				c.overprovision = CONFIG_RSVD_DEFAULT_OP_RATIO;
+				MSG(0, "      Overprovision ratio is set to default(%.1lf%%)\n",
+				    c.overprovision);
+			}
+		}
 	}
 #endif
 	/* adjust wanted_total_sectors */
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index a6249f6ef6ed..474c40131bae 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -92,6 +92,10 @@ mkfs.f2fs \- create an F2FS file system
 [
 .B \-V
 ]
+[
+.B \-Z
+.I #-of-reserved-sections
+]
 .I device
 .I [sectors]
 .SH DESCRIPTION
@@ -265,6 +269,14 @@ Number of sectors. Default is determined by device size.
 .BI \-V
 Print the version number and exit.
 .TP
+.BI \-Z " #-of-reserved-sections"
+Specify the number of GC reserved sections for zoned device. If specified
+to non-zero, reserved segments count is set to the larger size between 8
+sections and the input value. If specified to zero, the best number will be
+assigned automatically according to the partition size.
+If overprovision-ratio-percentage is not specified, it will set to default
+3.0%. Without '-m' option, the filesystem doesn't support the feature.
+.TP
 .BI \-h,\ \-\-help
 Print usage and exit.
 .SH AUTHOR
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f4a49acc498c..d3bb62222024 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -483,9 +483,7 @@ static int f2fs_prepare_super_block(void)
 	if (c.overprovision == 0)
 		c.overprovision = get_best_overprovision(sb);
 
-	c.reserved_segments =
-			(100 / c.overprovision + 1 + NR_CURSEG_TYPE) *
-			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
+	c.reserved_segments = get_reserved(sb, c.overprovision);
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
 		c.overprovision = 0;
@@ -765,11 +763,31 @@ static int f2fs_write_check_point_pack(void)
 			get_cp(rsvd_segment_count)) *
 			c.overprovision / 100);
 
-	if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
+	if (!(c.conf_reserved_sections) &&
+	    get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
 		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
 
-	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-			2 * get_sb(segs_per_sec));
+	/*
+	 * If conf_reserved_sections has a non zero value, overprov_segment_count
+	 * is set to overprov_segment_count + rsvd_segment_count.
+	 */
+	if (c.conf_reserved_sections) {
+		/*
+		 * Overprovision segments must be bigger than two sections.
+		 * In non configurable reserved section case, overprovision
+		 * segments are always bigger than two sections.
+		 */
+		if (get_cp(overprov_segment_count) < 2 * get_sb(segs_per_sec)) {
+			MSG(0, "\tError: Not enough overprovision segments (%u)\n",
+			    get_cp(overprov_segment_count));
+			goto free_cp_payload;
+		}
+		set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
+				get_cp(rsvd_segment_count));
+	 } else {
+		set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
+				2 * get_sb(segs_per_sec));
+	 }
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
 		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index f50971c4591c..07995b350a70 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -75,6 +75,7 @@ static void mkfs_usage()
 	MSG(0, "  -w wanted sector size\n");
 	MSG(0, "  -z # of sections per zone [default:1]\n");
 	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  -Z # of reserved sections [default:auto]\n");
 	MSG(0, "sectors: number of sectors [default: determined by device size]\n");
 	exit(1);
 }
@@ -176,7 +177,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:";
+	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
 	static const struct option long_opts[] = {
 		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
 		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
@@ -295,6 +296,9 @@ static void f2fs_parse_options(int argc, char *argv[])
 			}
 			c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
 			break;
+		case 'Z':
+			c.conf_reserved_sections = atoi(optarg);
+			break;
 		default:
 			MSG(0, "\tError: Unknown option %c\n",option);
 			mkfs_usage();
@@ -490,6 +494,11 @@ int main(int argc, char *argv[])
 		goto err_format;
 	}
 
+	if (c.conf_reserved_sections && !c.zoned_mode) {
+		MSG(0, "\tError: Reserved area can't be specified on non zoned device\n");
+		goto err_format;
+	}
+
 	if (f2fs_format_device() < 0)
 		goto err_format;
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
