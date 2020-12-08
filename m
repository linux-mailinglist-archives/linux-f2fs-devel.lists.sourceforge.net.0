Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B72D257B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 09:15:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmY9C-0007dy-9j; Tue, 08 Dec 2020 08:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kmY95-0007dc-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 08:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X1Fz0yq5QOWZGHX6crMbhCYX2GPoKckcY3/RN3rhSp8=; b=UJdbPT6jbXOB1cmMQ42g/XiIES
 ZeDl1KKpSheAG0z+YYMMYpQwiVm+eURhGqCi/EqWurLEwy5am957H3c6tvQ1Ze03CvEcTIbtvgjps
 zONP2NdBDM9xBlIhrEac6rkowE0zPz/044yoWhF9Ad4pQp/FhXA/cYL+qk+0P2b8swrk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X1Fz0yq5QOWZGHX6crMbhCYX2GPoKckcY3/RN3rhSp8=; b=YAvjzGobADVmBXirIIAEQmFHQX
 C9PYbwx+Z62mDJY2AI56x8bM8+xbn2FknXS8aB0RCbMpexDxzhgGnL3k71nYG5ykIkCdMCQwZZYWr
 s8eBPwaeoF0UAlZ/ScZ3qJF2cnFrQvLiSD9ksasD2Wm+/E3mLA2vhZmktPmz9/sW4ONI=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmY93-0039ya-P4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 08:14:51 +0000
Received: by mail-pf1-f171.google.com with SMTP id q22so13162435pfk.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Dec 2020 00:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X1Fz0yq5QOWZGHX6crMbhCYX2GPoKckcY3/RN3rhSp8=;
 b=LYcl97eWcyp36GTTmFA630p01xUrXCDfNOigwz2I/OMi9Yi/XnQ12k2r5aXhgo+AN9
 3ZsxxLEDUjkNhZe4t4GXT7ForPbCasMHNakE1GinbIjV5uzN4I4XXndGh80RsoMd8sIU
 pp79PgS8q4g/U5jnDM+StBZewDvDaW4s/ffbn/LT/w6rcsg1Ojn1dl0pVjw+hO+PNkCF
 FY7I5lF7JmEt2e4DzZie82mYQf6zuItUD4z6gKx2w1j6kjcvUvwWm0tiOePplMF8gMQ8
 ReCaD/kZDZKnKoY1SRcZG4Wm11U5TUa4uZyMLKF9vjb2ali+rGWxsS21o1vT5lyk39E9
 lJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1Fz0yq5QOWZGHX6crMbhCYX2GPoKckcY3/RN3rhSp8=;
 b=HF/VnG6g/y90RGbJCEo8vdHmWFaetJBpfpI4rqDI5Sk5TLL30P2cE+7q8K4dSykp1o
 hTQX9sc9A8woML+XKAF+L25PPDsh38CpohSltlV2DoCwtp2VNBJgxtt8ApN5MkAQndyf
 vVoss1yqg9zd/yYWW/vjp7hJ+nfZaYg05dmi44f4ngD+5rC+AGCjLvYPVrrz6T37Tmza
 PWrlDv+jCZphQTKP6/prH1Cu4c/UEXlq6rWqH/5w6Dl0jvPhqmFecioz/vMX/lGjjEFo
 fF0efqGrQ9pKQQ2RWOe7VtFIo/hs0A9WuKNNOdBh0oNKB7OnSiNfrzC81PnHnyIt6v6+
 Ogwg==
X-Gm-Message-State: AOAM532rgVL2EcUKUFsCNGScC4SThYjT/Q+MAj/Rn9+LmLGBvUUDCPTW
 Iza/SXcnBJTHXq8NISHY/llepumlQIE=
X-Google-Smtp-Source: ABdhPJxBXk46n3SDMmXeBCsRrmKRkx57VGxxBE11dFj+he8rrDP78jbjlA1yj3fZvOLON/zq+wz/zg==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id
 k6mr3193611pjd.204.1607415284080; 
 Tue, 08 Dec 2020 00:14:44 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id 19sm2665387pfu.85.2020.12.08.00.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:14:43 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Tue,  8 Dec 2020 16:13:42 +0800
Message-Id: <20201208081344.652430-2-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201208081344.652430-1-robinh3123@gmail.com>
References: <20201208081344.652430-1-robinh3123@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kmY93-0039ya-P4
Subject: [f2fs-dev] [PATCH 1/3] f2fs-tools: Added #ifdef WITH_func
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Add proprocessor defines (options) 'WITH_func',
where func = DUMP, DEFRAG, RESIZE, or SLOAD

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 fsck/main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fsck/main.c b/fsck/main.c
index e70048b..b20498f 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -345,6 +345,7 @@ void f2fs_parse_options(int argc, char *argv[])
 				break;
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
+#ifdef WITH_DUMP
 		const char *option_string = "d:i:n:s:Sa:b:V";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
@@ -426,7 +427,9 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 
 		c.private = &dump_opt;
+#endif
 	} else if (!strcmp("defrag.f2fs", prog)) {
+#ifdef WITH_DEFRAG
 		const char *option_string = "d:s:Sl:t:iV";
 
 		c.func = DEFRAG;
@@ -484,7 +487,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+#endif
 	} else if (!strcmp("resize.f2fs", prog)) {
+#ifdef WITH_RESIZE
 		const char *option_string = "d:st:iV";
 
 		c.func = RESIZE;
@@ -526,7 +531,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+#endif
 	} else if (!strcmp("sload.f2fs", prog)) {
+#ifdef WITH_SLOAD
 		const char *option_string = "C:d:f:p:s:St:T:V";
 #ifdef HAVE_LIBSELINUX
 		int max_nr_opt = (int)sizeof(c.seopt_file) /
@@ -595,6 +602,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			if (err != NOERROR)
 				break;
 		}
+#endif /* WITH_SLOAD */
 	}
 
 	if (err == NOERROR) {
@@ -707,6 +715,7 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	return FSCK_ERRORS_LEFT_UNCORRECTED;
 }
 
+#ifdef WITH_DUMP
 static void do_dump(struct f2fs_sb_info *sbi)
 {
 	struct dump_option *opt = (struct dump_option *)c.private;
@@ -733,7 +742,9 @@ static void do_dump(struct f2fs_sb_info *sbi)
 	print_cp_state(flag);
 
 }
+#endif
 
+#ifdef WITH_DEFRAG
 static int do_defrag(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -782,7 +793,9 @@ out_range:
 				c.defrag_target);
 	return -1;
 }
+#endif
 
+#ifdef WITH_RESIZE
 static int do_resize(struct f2fs_sb_info *sbi)
 {
 	if (!c.target_sectors)
@@ -796,7 +809,9 @@ static int do_resize(struct f2fs_sb_info *sbi)
 
 	return f2fs_resize(sbi);
 }
+#endif
 
+#ifdef WITH_SLOAD
 static int do_sload(struct f2fs_sb_info *sbi)
 {
 	if (!c.from_dir) {
@@ -808,6 +823,7 @@ static int do_sload(struct f2fs_sb_info *sbi)
 
 	return f2fs_sload(sbi);
 }
+#endif
 
 #if defined(__APPLE__)
 static u64 get_boottime_ns()
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
