Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD33D32C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:58:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6mKs-0006LX-FK; Fri, 23 Jul 2021 03:58:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chaoliu719@gmail.com>) id 1m6mKq-0006LQ-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=; b=TSpQeXx/IHs0ChngcqS/XZ0TNZ
 ttqYODN3Xp+GWCojYLtQcHbvQRwbFvkYjUO+cgWDRbMn8Ou/wJ00Hy90uGIBTBpLlcwNQtJsAP9B7
 2A8FmoQ5zz4GyVfD136t21Xy6bMCdNQ1kaBrfw2JWx2H4aJzrSgOwPWGkevGed+2FKfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=; b=O
 ZUGeYfaCMEdaiTqn8INVT2UVuj2anxid7qGGbVZlGGFGunw02ol6L8bgJe1aS3HdmhhTCo0mI/HCy
 Q1M0/FBDeiQdPMn7wxKJZdeo9roqqseL8cNkzs7jNwEbWDk8XRanaofI7rNEPavMANBhvqSAxmseR
 d8oBgVbMjFDGpVoM=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6mKp-00HTtd-9d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:58:52 +0000
Received: by mail-pl1-f171.google.com with SMTP id k1so1574957plt.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=;
 b=Zbs/2a6fQawK/CttSHM+tr2A79wyGBgbeXhuuOJLULOF14Nw1VYVjzO/8YcyLa+cXY
 ALoICMmLFg71PiIbbyBShV6mYQceCxLyYlrSmZoxwVpB1Pa30pDY6K5I/rqtL69spztX
 cep9NOSEN9uBdDtq7RsAfVTC8E8ECzsGOQBgywDGB7ieYXHi3SXDODIFof/cxJK6ZlfA
 hGVcBmJ2CxfYTFb6nJDdkcQxFjfTYanZ9SVJXqASwnS16VSTBGh/W2+mR966mSp1+OJr
 exBSR+Z0nMwBIHgoTq6JUqlXmGc0SmLKb8FqW4aADnCp+rc/3DCI6TxgIVT8DxDW5RJi
 B4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=un8J5f50KlXoN8UBa4hsGQdCO3pR6zbgd+IL6vlgdIA=;
 b=grBBkeEVI7UVlKyL457ujaKgcvN0fM0JtSxU2/HOw6JaGm2mjSPUgl3Tzu6Z+Jcoem
 WthUrJvmF2VQ1DFJ7q7lbMtcsblHF9xjjvJR+iwXlo44Uzb4IOoLbYMdtuijMz0ef4HC
 Arn2VnIEAnx+1KDeQjSMlwFx3RF9Ry4hByfrk2ArD3nyR7NCrtdN/UAdpzB3qphjwVYK
 IoalzoE/8TCT7wMtcxrVwGywazwtLEO+QQPCshZKd9OkSn9yuIlXVUYi/28tdMcrr6Ty
 15NBtuSybjP1NUPEiGY5HfnPMfQsUE9Uc1WfJ0sOm+cf/HVlpgxb0fII3eYF7BHvvtaO
 nDTw==
X-Gm-Message-State: AOAM531XZnAPvkPp0CR67K3Wqb62ffXY+735bDF0zmihXAYR685raiWb
 oXkpxxdrwFje870ZgJTFQz622hOY3et1VPzi
X-Google-Smtp-Source: ABdhPJw60JjpiyduZTVSwtK0+21UlfAsWzjv4g9tsxF57a7UL3pFL5+sybvri7NujsaWjUN6iv7ODw==
X-Received: by 2002:a17:90a:b28a:: with SMTP id
 c10mr11587363pjr.59.1627012725726; 
 Thu, 22 Jul 2021 20:58:45 -0700 (PDT)
Received: from liuchao12-Ubuntu.xiaomi.com ([209.9.72.214])
 by smtp.gmail.com with ESMTPSA id x40sm32710755pfu.176.2021.07.22.20.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 20:58:45 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
X-Google-Original-From: Chao Liu <liuchao12@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 23 Jul 2021 11:58:41 +0800
Message-Id: <20210723035841.1829101-1-liuchao12@xiaomi.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (chaoliu719[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (chaoliu719[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6mKp-00HTtd-9d
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
