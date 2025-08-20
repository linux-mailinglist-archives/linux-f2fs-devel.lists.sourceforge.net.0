Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DABB2DCCF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+iABiIlMGclXDj+S7eNX4YwJIiezPJohPD6J+jI8u4=; b=lSFzC8RYKChWrPN1DAxnr1T+Y/
	8SdspKjslhMV/lqrvbtdjx91xelmbCL8VXi0SYzNqKAymoewHc1tmxqmcymuYRdpqi608gUMI8XA5
	SDhwW36BpNBRskvJhYGPcjdR8no/d/1Xtjhwwt8EIKkrcanM9AQNl2qQO4DFDcLEG+PU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9n-0008Qp-Ck;
	Wed, 20 Aug 2025 12:43:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9m-0008Qh-CM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sit6NNi18cPslOQiTjSGB+JDFkXgpiipxdS+cntWjmE=; b=FIg4+udPeXkKbcZjvOCsIB9PWG
 UMV/i4U3Kdldn1B1x8J7+G7hhiI4/KZc45l1wkgz8RYEw2bzmatYTLZib8YNpT2Aqddp8pZbLGAuw
 UsRQAYx1Ei3pwniimO2xOGPiCcnZiPBCycINEsqNUk1y9Faylbor3oGSRNEeS/KzCiVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sit6NNi18cPslOQiTjSGB+JDFkXgpiipxdS+cntWjmE=; b=D9e5zL+VGrQkdUUHJrX/hl0ea1
 gEzKAQG8nkMROtEEBxQd1iKSC5SWMeHB30Xs2g6qirpIl5FBqqHp8KanF1OnUNR4/x3ABjDPq6EPf
 kEDuspPocCiGbRtG8xcFEITp9oBAdMjkA3HOUcXMK1LBItbvvBSzfb+N861L6xGmSKNY=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9l-0003lm-Rq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:10 +0000
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b471737b347so4399763a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693779; x=1756298579; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sit6NNi18cPslOQiTjSGB+JDFkXgpiipxdS+cntWjmE=;
 b=hXTP0qI22eCuOEgYOWdeOJTabUYUDvIRK7Ro/yrwd5ZT1s8Hv6QhG8Ew9fwFrT9NXX
 Tsp1jiez1thr8jzzQwSEm09HXwNN9CdFN3q5kybyCMCMTVlrx/bvU5zBpq1rSGAipbuD
 exQeOhDAWYbymHsskMTXV2Q7Jm+HOHbWEmEW0n9gcjfPM/ptostTX83luQGxB8g1i+QS
 KkXmzFvUk3UHbTljM4FtWft+97I8RxxzN5d/z+VDASKD1sSM2JTMijBc1SmUvIVcGgoy
 q5MsvwbqkbESM1wE5JgVJpc+lhR/g7ahgSUgLPPEgm3RkiP6LNoYql+e8/gML11FoTXz
 CP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693779; x=1756298579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sit6NNi18cPslOQiTjSGB+JDFkXgpiipxdS+cntWjmE=;
 b=tv49R63IziZtx5RlQRi//Aw74cnoQxDnQiZZMLY1e5v2NrVzXub7Jt472tePWP9uT6
 yforkMNj2Ew2DaZMj39kYCmQUN51JkjfydIctkVEomhyYyjEz9xgDC+J8SWhlitRg5oe
 nTfotgodlFtT0LJrQ8xVCYvAcnqv4sQW/WvNDkQwP66LO0mwB64zar9lgvWmhRLoXfJ6
 U3p2zRky6WsS5P7/69cApoKqk0gpQ2G+axWMZNV9eVVUA7w9tyB7Ywe1XWtSjxPujo/7
 +5HOI9/rD7rUx5xeZBQrC+a7MMZhRaray5kaiRMv3CbnkGaTSzElgs34coQrNE8qyLqw
 3hLQ==
X-Gm-Message-State: AOJu0YwE68YDDLlli1c3s5Qdnsy3iWOhCEiodmptgEphPTGORBXmVExR
 3wtdAjaxx3M3MdIfSlGeI9Q6Kq/qEfTR28xzXUoyMJkZsZCTQPEr+CKXq26lNQ==
X-Gm-Gg: ASbGncti64tt95A0mDJj/Xp/ptXnzkHheu0wI1hJqD0FgAJbQsG3QAaoKQlhuzOc79I
 XkdmgzBl7rsdgwWXUtRFDE/byakcp1gVeQgYoZ16FUFBK4GlSJD5vMP5AGWCVT06elfVCwLQwS3
 ISdAlglorn3eztErulv3AZ1AKRtlB2UmFgRUNdYn3T9OjRzVA2WqxK59Ona/O9+dJgcvAR6uDHy
 new5FCxMEy0DK0En00QnD/vPJKVPpcUr4hyzqf0jca+uwDoMWj446o9quA1xnVzSI273yuoGqVY
 SHCvnLSJsoEblp4SbmHeVqZ+VWu3IDeJAqv9QnmKoh5Ut0o3MGstoE4YAPdcP8VTYbD9+EZLX/i
 Jzl7rMMKNalqlScpMxDRYkeTNyIV9
X-Google-Smtp-Source: AGHT+IGHCYbrbse3t8Sv7j1Eydrf8jzfd8UqHe25M8sEV5m9lE79Ujn0MMiS200+4Scjqh2TjLmTAQ==
X-Received: by 2002:a17:902:e845:b0:240:2145:e51f with SMTP id
 d9443c01a7336-245ef0c382fmr32898815ad.3.1755693778776; 
 Wed, 20 Aug 2025 05:42:58 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:42:58 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:27 +0800
Message-ID: <20250820124238.3785621-3-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong In some scenario, such as autotest, it is
 not expected to answer question from fsck or dump. To simply answer no to
 all these questions, this patch adds an option `N' to do that. Signed-off-by:
 Sheng Yong --- v3: update manual --- fsck/dump.c | 3 +++ fsck/fsck.c | 2
 +- fsck/main.c | 14 +++++++++++--- include/f2fs_fs.h | 1 + man/dump.f2fs.8
 | 3 +++ man/fsck.f2fs.8 | 3 +++ 6 f [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uoi9l-0003lm-Rq
Subject: [f2fs-dev] [PATCH v3 02/13] f2fs-tools: add option N to answer no
 for all questions
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

In some scenario, such as autotest, it is not expected to answer
question from fsck or dump. To simply answer no to all these questions,
this patch adds an option `N' to do that.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
v3: update manual
---
 fsck/dump.c       |  3 +++
 fsck/fsck.c       |  2 +-
 fsck/main.c       | 14 +++++++++++---
 include/f2fs_fs.h |  1 +
 man/dump.f2fs.8   |  3 +++
 man/fsck.f2fs.8   |  3 +++
 6 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 66d6c791ae09..10df7e593bfe 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -681,6 +681,9 @@ static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
 	if (c.show_file_map)
 		return dump_inode_blk(sbi, ni->ino, node_blk);
 
+	if (c.answer_no)
+		return 0;
+
 	printf("Do you want to dump this %s into %s/? [Y/N] ",
 			S_ISDIR(imode) ? "folder" : "file",
 			base_path);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4c36dc1d0451..0b53c67e3b8a 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3848,7 +3848,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	}
 
 #ifndef WITH_ANDROID
-	if (nr_unref_nid && !c.ro) {
+	if (nr_unref_nid && !c.ro && !c.answer_no) {
 		char ans[255] = {0};
 		int res;
 
diff --git a/fsck/main.c b/fsck/main.c
index 324629ea531b..d034dc39218c 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -86,6 +86,7 @@ void fsck_usage()
 	MSG(0, "  -t show directory tree\n");
 	MSG(0, "  -q preserve quota limits\n");
 	MSG(0, "  -y fix all the time\n");
+	MSG(0, "  -N answer \"No\" for all questions\n");
 	MSG(0, "  -V print the version number and exit\n");
 	MSG(0, "  --dry-run do not really fix corruptions\n");
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
@@ -114,6 +115,7 @@ void dump_usage()
 	MSG(0, "  -f do not prompt before dumping\n");
 	MSG(0, "  -H support write hint\n");
 	MSG(0, "  -y alias for -f\n");
+	MSG(0, "  -N answer \"No\" for all questions\n");
 	MSG(0, "  -o dump inodes to the given path\n");
 	MSG(0, "  -P preserve mode/owner/group for dumped inode\n");
 	MSG(0, "  -L Preserves symlinks. Otherwise symlinks are dumped as regular files.\n");
@@ -266,7 +268,7 @@ void f2fs_parse_options(int argc, char *argv[])
 	}
 
 	if (!strcmp("fsck.f2fs", prog)) {
-		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyV";
+		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyNV";
 		int opt = 0, val;
 		char *token;
 		struct option long_opt[] = {
@@ -399,6 +401,9 @@ void f2fs_parse_options(int argc, char *argv[])
 				c.force = 1;
 				MSG(0, "Info: Force to fix corruption\n");
 				break;
+			case 'N':
+				c.answer_no = true;
+				break;
 			case 'q':
 				c.preserve_limits = atoi(optarg);
 				MSG(0, "Info: Preserve quota limits = %d\n",
@@ -452,7 +457,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:Vy";
+		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:VyN";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -530,6 +535,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 'f':
 				c.force = 1;
 				break;
+			case 'N':
+				c.answer_no = true;
+				break;
 			case 'r':
 				dump_opt.use_root_nid = 1;
 				break;
@@ -1372,7 +1380,7 @@ fsck_again:
 
 	f2fs_do_umount(sbi);
 
-	if (c.func == FSCK && c.bug_on) {
+	if (c.func == FSCK && c.bug_on && !c.answer_no) {
 		if (!c.ro && c.fix_on == 0 && c.auto_fix == 0 && !c.dry_run) {
 			char ans[255] = {0};
 retry:
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1686b9a29d4c..be2e85376c16 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1595,6 +1595,7 @@ struct f2fs_configuration {
 	int whint;
 	int aliased_devices;
 	uint32_t aliased_segments;
+	bool answer_no;
 
 	/* mkfs parameters */
 	int fake_seed;
diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
index 4035d57ad6e1..975aa9c091a1 100644
--- a/man/dump.f2fs.8
+++ b/man/dump.f2fs.8
@@ -96,6 +96,9 @@ Specify a block address to retrieve its metadata information.
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \-N
+Answer "No" for all questsions.
+.TP
 .SH AUTHOR
 Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.
 .SH AVAILABILITY
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index c20c43144897..e3e3b04bb5b0 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -67,6 +67,9 @@ Enable to show every directory entries in the partition.
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \-N
+Answer "No" for all questsions.
+.TP
 .BI \--nolinear-lookup
 Tune linear lookup fallback, must specify an argument, 0: enable linear lookup, 1: disable linear lookup. For android case, it will disable linear lookup by default.
 .TP
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
