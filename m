Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2813D324F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:47:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6m9n-0001r1-VL; Fri, 23 Jul 2021 03:47:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chaoliu719@gmail.com>) id 1m6m8z-0001m9-55
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=; b=mXClmzbrfbbueO7WrWUYmRU4Gb
 VdHesUCvYLzZcEjyK/gKLwF4oIsP36/FwSwJ8y4Q8bCBU0zyG4dAXxmNcxboetQk9sZwyXIaGiRry
 5tY4LDRkssVeRTliMN0gMAuBNmeUe52j/yPlOF09bF/NHhzqsTkMM7e9zQU8o3deqdj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=; b=d
 biZ3muSRocC12VBqzDXw31z1VTkIyi+Uph1rJ67VrUOVRZ5KXhg3l2kbwDQifyeGCR3p7rwSWgFkS
 MAV5CpWtBVKGrsG0+ZVDc5IBw9DQCLzuzFTz5W/vA2LSND/Nu5LJkugsCQUOdk9xShKTUKlzs0+RC
 d2QmyxxMWZNTk+qo=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6m8v-0003pm-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:46:37 +0000
Received: by mail-pl1-f176.google.com with SMTP id k1so1548650plt.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 20:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=;
 b=iAQ6k8veZVRfwPug4/1OBTNdEWKkRPxAxSyZ/f8mpMOfNfAJyVjdEP2F9ULLfJlLOB
 x1uWSB4lt4IxACeCX9BTksIm0Z9W+4vf2Dkz1ndTta9AHh4QbUW3uLBdL8QrVprreLqm
 vLlIogBn3tTdgxzcj5BUeDYtXcNCpfB0uAa6ppI39lwvqSXDjQ/g6foQAjoBAikT0I7F
 M+uJsMPjUdvGAM2AXQYY5cFahqciraWSrimVdLtMgCnGWAX7PXOUrAAgjPKe0K/ugtFX
 jeaoIj7xu+Z8Q+0QFW7c24H4lbKdRkbDxF8Lq2F/Bc6qo/mWLFEVrwK0xgsJvtPth4w/
 ztkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=;
 b=HoN9J9nNWZgnXXyjVmL2dYFkTWC9FvuUK8DHZw/zUcBGeUaS1tMX/6T2pqAMrK4sco
 e4bNO0+YLAdWEgssXeV2NGnMhf8VMcHfN991gEyhCWyQyjlChTh3Zo14Y4DvyW1g7zmI
 +jh9HO0JK/HT6qbjJj3S4jaLPWVGJIbDXNa6YNu9mYXWNMS5iOBzb0Ea283hqoRfjxWf
 PiYJZsY/m0lsV1I7ZrQyAqAAZnsZWEL12n/blyGu28Xbl+9Kn6ydvcqJom48fyezNcvj
 gn7AtjDwUxffKkjZVRXT/Goaasgg1ybjtERB2jUJzWAwv662/Yl6nrhUeqPEmcOGMcvf
 zizQ==
X-Gm-Message-State: AOAM530EpyHsaqfZ/4+jvSX99MpiYlokB571MVeyZqRuQvSCoATzwpeM
 M5QE8SfeRdlF15FUoXks1xs=
X-Google-Smtp-Source: ABdhPJwmKxsx4jDBZRVi9I3PIQPRWdwBZWIVPipFmkZQNC48qTp+VlbMI8W3VuNL8VUbnXePDU7yNQ==
X-Received: by 2002:a65:5684:: with SMTP id v4mr3057869pgs.388.1627011988015; 
 Thu, 22 Jul 2021 20:46:28 -0700 (PDT)
Received: from liuchao12-Ubuntu.xiaomi.com ([209.9.72.214])
 by smtp.gmail.com with ESMTPSA id k189sm35860899pgk.14.2021.07.22.20.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 20:46:27 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
X-Google-Original-From: Chao Liu <liuchao12@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 23 Jul 2021 11:46:22 +0800
Message-Id: <20210723034622.1820891-1-liuchao12@xiaomi.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (chaoliu719[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.176 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (chaoliu719[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6m8v-0003pm-Gg
Subject: [f2fs-dev] [PATCH] resize.f2fs: add option to manually specify new
 overprovision
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Make.f2fs supports manually specifying overprovision, and we expect
resize.f2fs to support it as well.

This change add a new '-o' option to manually specify overprovision.

Signed-off-by: Chao Liu <liuchao12@xiaomi.com>
---
 fsck/main.c   | 8 ++++++--
 fsck/resize.c | 9 ++++++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 260ff29..06253e2 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -124,7 +124,8 @@ void resize_usage()
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
-	MSG(0, "  -s safe resize (Does not resize metadata)");
+	MSG(0, "  -o overprovision percentage [default:auto]\n");
+	MSG(0, "  -s safe resize (Does not resize metadata)\n");
 	MSG(0, "  -t target sectors [default: device size]\n");
 	MSG(0, "  -V print the version number and exit\n");
 	exit(1);
@@ -529,7 +530,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:fst:iV";
+		const char *option_string = "d:fst:io:V";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -563,6 +564,9 @@ void f2fs_parse_options(int argc, char *argv[])
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
index 78d578e..85a53c5 100644
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
 
+	MSG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
+	MSG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
+					get_cp(overprov_segment_count),
+					c.new_reserved_segments);
+
 	free_segment_count = get_free_segments(sbi);
 	new_segment_count = get_newsb(segment_count_main) -
 					get_sb(segment_count_main);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
