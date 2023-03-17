Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA176BE03F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Mar 2023 05:42:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pd1ur-0004lD-Dk;
	Fri, 17 Mar 2023 04:42:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pd1uq-0004l0-7O
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Mar 2023 04:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bKzs6ie9jGyq5vPlXlQ+VCASdpfrk5dRG/RQ1bs+T3s=; b=Ex6BknxuxZ4kP9UyYGY52KAdhu
 g0KrkTqEpy5Ldy5gaeXTbejj3cm9WOxPDefhap476urAMsTu1/CCAd2S00utf7Kf4za8qWRkDvvCM
 +1m6R3XJCEdBBvvW3ywUqgL0CeQSOHXP6Ap573Be1aiOayNclr+cwAWojHp3DeqgWau4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bKzs6ie9jGyq5vPlXlQ+VCASdpfrk5dRG/RQ1bs+T3s=; b=D
 VpIZlaNtuwpHzv+QXji5IRI8BwIXHRM71937DdUGcAQFM4pZNi3RLQU06OcypxHpiPnODgds1TT0q
 lKwGlnJWTNObAa0OlnGl2Yl4lFaUxysHYaiozBT92sBPC57n8zMXOEpJu7Ccvm8C4x+ruEe9SbacH
 GLUCOZn/bpIVrNVs=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pd1um-00BWD0-0q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Mar 2023 04:42:08 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230317044153epoutp03d1621214ae164afca4306c00274f2cbe~NGyxvw6Fx0404504045epoutp03P
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Mar 2023 04:41:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230317044153epoutp03d1621214ae164afca4306c00274f2cbe~NGyxvw6Fx0404504045epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679028113;
 bh=bKzs6ie9jGyq5vPlXlQ+VCASdpfrk5dRG/RQ1bs+T3s=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=G/V5ggd6hemv8rI0I4HLVwRJHzTNYv77wNmjzb/V5Tq8C+Azn66O6INShW1Cbgqrr
 bpu+BKiiFnYJcvnAmC5M4L4GEp+jF5SwRNp13cw2aBiyLHKWvITMpEgODGSufTZPyx
 8pHXrtJAIuKfClJl3hhfiEVcP5LjI7VajsF04w5A=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230317044152epcas2p246dd93436bd94013b3e612497ee4f0c3~NGyw4PvqD1112911129epcas2p2v;
 Fri, 17 Mar 2023 04:41:52 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.69]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4PdBL80z35z4x9Pp; Fri, 17 Mar
 2023 04:41:52 +0000 (GMT)
X-AuditID: b6c32a46-4e1ff70000007a4b-25-6413ef8f00b4
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 38.E3.31307.F8FE3146; Fri, 17 Mar 2023 13:41:51 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230317044151epcms2p5872591b638dab3261a9dd563253f1b94@epcms2p5>
Date: Fri, 17 Mar 2023 13:41:51 +0900
X-CMS-MailID: 20230317044151epcms2p5872591b638dab3261a9dd563253f1b94
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7bCmqW7/e+EUgwMnpC1WPQi3eLJ+FrPF
 pUXuFidXvGCxWNUxl9Fi6vkjTA5sHptWdbJ57F7wmcmjb8sqxgDmqGybjNTElNQihdS85PyU
 zLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKC1SgpliTmlQKGAxOJiJX07m6L8
 0pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjJfTmpgKPnhVLPn2hrWB
 cYdNFyMnh4SAicTX54+Yuxi5OIQEdjBKHD19lK2LkYODV0BQ4u8OYZAaYQF3iRk3t7KD2EIC
 ShLXDvSyQMT1JTYvXgYWZxPQlfi7YTk7yBwRgRZGiQkffzCBOMwC8xklJt86zQyxjVdiRvtT
 FghbWmL78q2MELaGxI9lvVA1ohI3V79lh7HfH5sPVSMi0XrvLFSNoMSDn7uh4pISiw6dZ4Kw
 8yX+rrjOBmHXSGxtaIOK60tc69gItpdXwFdiyre9YPNZBFQl1t6cygrysISAi0TzgwSQMLOA
 vMT2t3OYQcLMApoS63fpQ1QoSxy5xQJRwSfRcfgvO8xTO+Y9gVqkJrF502ZWCFtG4sLjNqgj
 PSSutV1hhgRhoETr2gdsExgVZiECehaSvbMQ9i5gZF7FKJZaUJybnlpsVGAEj9vk/NxNjOAE
 qOW2g3HK2w96hxiZOBgPMUpwMCuJ8IazCKQI8aYkVlalFuXHF5XmpBYfYjQFengis5Rocj4w
 BeeVxBuaWBqYmJkZmhuZGpgrifNK255MFhJITyxJzU5NLUgtgulj4uCUamCa8Wnir2UWz9w7
 tj6f72P/rLUgMzfj0ZMEA7GD5649nsujkpV/+8ab3clXDOx47jI41y383TSn1K1haf7s47dV
 7eVPdN3IXajb086Uwbg+bebM22tmL9p+qcmo+1RDEX/LvvMfpxwwW9aXLe5j4L21991Jd8uE
 XIXt5Xu4JjDabDgZpXqvcW1Otcyqb7/60hRyPixNnfJ/q3BDy81/25cICzewcewqOT2JzdpP
 hyXv0c+45t9tARvq/i7w5Q3+HiDzavu0aRv3nKx7tbxZ4lRiifut60XmJpUzPT2i93jUav1Y
 8ltivaUi54wt0x8sMjC5+Erl+0yhqc3m4Tqza9MutJzdwh7OHy3x98BtXgt+JZbijERDLeai
 4kQAlA8wYQkEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230317044151epcms2p5872591b638dab3261a9dd563253f1b94
References: <CGME20230317044151epcms2p5872591b638dab3261a9dd563253f1b94@epcms2p5>
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
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pd1um-00BWD0-0q
Subject: [f2fs-dev] [PATCH v1] mkfs.f2fs: Introduce configurable reserved
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
    - config rsvd: mkfs.f2fs <conv null_blk> -c <seq null_blk> -m 8 -o 2.965
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
 lib/libf2fs.c           | 22 ++++++++++++++++++++++
 man/mkfs.f2fs.8         |  9 +++++++--
 mkfs/f2fs_format.c      | 29 +++++++++++++++++++++++------
 mkfs/f2fs_format_main.c |  5 +++--
 5 files changed, 75 insertions(+), 12 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 333ae07a5ebd..1d41e9f8397e 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -375,6 +375,10 @@ static inline uint64_t bswap_64(uint64_t val)
 
 #define LPF "lost+found"
 
+/* one for gc buffer, the other for node */
+#define MIN_RSVD_SECS	(uint32_t)(NR_CURSEG_TYPE + 2)
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
index f63307a42a08..b5644ff6ebdd 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1069,6 +1069,28 @@ int get_device_info(int i)
 				dev->nr_rnd_zones);
 		MSG(0, "      %zu blocks per zone\n",
 				dev->zone_blocks);
+		if (c.conf_reserved_sections) {
+			if (c.conf_reserved_sections < MIN_RSVD_SECS) {
+				MSG(0, "      Too small sections are reserved(%u secs)\n",
+				    c.conf_reserved_sections);
+				c.conf_reserved_sections =
+					max(c.conf_reserved_sections, MIN_RSVD_SECS);
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
+		} else {
+			MSG(0,
+				"      0 reserved sections are received.\n"
+				"      Reserved sections are calculating\n");
+		}
 	}
 #endif
 	/* adjust wanted_total_sectors */
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index a6249f6ef6ed..800c4c79bf37 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -43,6 +43,7 @@ mkfs.f2fs \- create an F2FS file system
 ]
 [
 .B \-m
+.I #-of-reserved-sections
 ]
 [
 .B \-o
@@ -152,8 +153,12 @@ Enable extended node bitmap.
 .BI \-l " volume-label"
 Specify the volume label to the partition mounted as F2FS.
 .TP
-.BI \-m
-Specify f2fs filesystem to supports the block zoned feature.
+.BI \-m " #-of-reserved-sections"
+Specify f2fs filesystem to supports the block zoned feature and reserved sections.
+If specified to non-zero, reserved segments count is set to the larger size
+between 8 sections and the input value.  If specified to zero, the best number
+will be assigned automatically according to the partition size. If overprovision-ratio-percentage
+is not specifed, it will set to default 3.0%.
 Without it, the filesystem doesn't support the feature.
 .TP
 .BI \-o " overprovision-ratio-percentage"
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f4a49acc498c..22e53be5003d 100644
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
@@ -765,11 +763,30 @@ static int f2fs_write_check_point_pack(void)
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
+	 } else
+		set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
+				2 * get_sb(segs_per_sec));
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
 		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index f50971c4591c..a4accda91780 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -61,7 +61,7 @@ static void mkfs_usage()
 	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
 	MSG(0, "  -l label\n");
 	MSG(0, "  -U uuid\n");
-	MSG(0, "  -m support zoned block device [default:0]\n");
+	MSG(0, "  -m support zoned block device, # of reserved sections [default:0]\n");
 	MSG(0, "  -o overprovision percentage [default:auto]\n");
 	MSG(0, "  -O feature1[,feature2,...] e.g. \"encrypt\"\n");
 	MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
@@ -176,7 +176,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:";
+	static const char *option_string = "qa:c:C:d:e:E:g:hil:m:o:O:rR:s:S:z:t:T:U:Vfw:";
 	static const struct option long_opts[] = {
 		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
 		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
@@ -235,6 +235,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 			break;
 		case 'm':
 			c.zoned_mode = 1;
+			c.conf_reserved_sections = atoi(optarg);
 			break;
 		case 'o':
 			c.overprovision = atof(optarg);
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
