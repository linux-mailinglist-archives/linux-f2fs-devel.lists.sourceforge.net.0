Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D920BAD3DC3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JkB7dK6xbPbfyjQstNAv0oMWpcpukv42KNfYB/M0Kc=; b=RETkxquTjg0UJYewvN81qDOXf6
	8xlU8eTvw0nu/z/Q5cn6Q1DaHl2ww+i0gxXd/RnvHgg1A/aqK32hLn24AgIPzSbOEzj9tigZbk0bL
	quj9q2KZL50wV0XOh0vY5dqBVjpyVrJ/h18j5UEkzTT38nSayrq6ohU708O4WZGmTzrI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP1Ao-0007AV-5l;
	Tue, 10 Jun 2025 15:46:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP1An-0007AC-3c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1086BviR+oImgXlsFqpY6zPEEkDZrQ9KrIVHCmPtDXs=; b=cnLkYM7pVa7O30RFb6zG8VIWd3
 E8MyWusn7flgpkm52jVrdFE/AcVbsAZZlx0JmJ7vcbNXVrlPGUIPdUvt34snkjN9vOIE0YMXOLE47
 y+9buFh0ng8TI1fIdcj89QMztubpo0A0l8ETnlgYGspA05BcyQC1OOQNCzw+IvRUPimw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1086BviR+oImgXlsFqpY6zPEEkDZrQ9KrIVHCmPtDXs=; b=hhzvsElvNEQkdjqpE5jY2sBooF
 5/ZTkLuW5wnc0b7TnHXu1MN9RyqNZ+2F7yCv5ltI2Q2ELECsg5fS0AQyF3YZ541AJbmWCFLlBzlCN
 yEC5yJMy+nN81w+GuMlTqQiR6CmilgXno3/nDiCsuI3V1Wn+WEOoH6q94EST1jDbLl9Q=;
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP1Am-00079O-Ee for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:46:01 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2db2f23f174so3229130fac.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749570350; x=1750175150; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1086BviR+oImgXlsFqpY6zPEEkDZrQ9KrIVHCmPtDXs=;
 b=lN54pDyFtsPYuqwEzIDE9rMff4cJfnIODMkqrf93uON2E1YgwJoqoicFHPuw4Ty1e6
 r+vUcjE6BDDRvYURM2funq+W+ICIHpHhchUA2B4vuT1w5WKxU736H97CVnbMjLo5rG/8
 fQTy/MbKKuBubBcnrNBHMu6xW5EjY+LvttgD02uFcZWsW24oPfUrvmDVWcgbKksDeFs3
 4+gLBxsO64Qi1jChyGFNK8yDh16l+OXGm5svySE4Gx5EiFkYLiVciJzayz4M4IW6VBHn
 myhFbIb3f9bRSpzXuQ4PEnCUM+SaJ7/A+gwW8SrNkPzjXcGkDBrmyVRzE0E3GjGEm8VT
 Snqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749570350; x=1750175150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1086BviR+oImgXlsFqpY6zPEEkDZrQ9KrIVHCmPtDXs=;
 b=GtiNxvn0aGIiR86D/lxc+Wmn8UHao071oO1jDJs7tCQ4lJTdv9zkHc78Pof7F8FGg9
 s9ExoBfJcVqyzTbILzmBeMMslZb1jHFl6cKpIqgWycJOx5W+FMYAUWwePH4m6ogTe+V/
 16LAUXUFrTYeIA2XGI7pcgcUyOR75DMgGRlMUllL8U8w7yqUXDm3kigtHpCQogiAstPh
 oS1Hs+Kzbz/qOVCxrGkirBOqpQVJ0a5PgYyFKFFdekO42Bl4qLQ/GDd+gbWYUi5ns4w+
 EpIhMm53GTwSSmmYh6xjYh+UcDrZoweI6UdOmzPaBR7nDkCIk3CYP6V1IIu28vQc5Z8f
 yGVA==
X-Gm-Message-State: AOJu0Yy7+VwRNqldRQFYAwbfKt6a6H0nDlVNtYnKl2/NOFPbaJinlyhn
 3ED61iENsqdQdwCOPFAdX+P2IcJRWkjJK1ftq4kfgI0qu8xluu+VG2BJ9P7QVA==
X-Gm-Gg: ASbGncu6Bo1ZpHaHaJUojkkuGA7w0+HvmZQIbPTojhlZArYkR1IgzEYL3oxerHCvlwn
 yhEkvMvpBjRYE4P85bLmY8u9Z/8dG1h5PGpRiiaeiLOyGgI8/m+osqbuyx5w2ytWqcLkn66xYLX
 RiEc2ZwtNJtuPAemtXf3aFO6HcE06uK4oWMzNaym089LKm5jYKKapjO2i+mxSHAtQcM1W55Yv3U
 sS/nFWpHUDIiFq5GszqCgE7K1vLvuM9zCtUAn9FC0mrTTJY4VmMst87FioC3Q5FOCT3MjRempF6
 1nsgt7VzYxlcuUK5p7r0m/1UfB2PJCpKtO01l62WqkoqOeVORbOIY9JWEPMaB0xfVtLA
X-Google-Smtp-Source: AGHT+IFMeTd6kDjc6bWZ33NBX30ZLcuemhP3ABCc0oD0FjtdBBTfnQe6VuRgBnieFgZqd/xol80vYw==
X-Received: by 2002:a05:6a20:431f:b0:203:bb65:995a with SMTP id
 adf61e73a8af0-21f78c60acfmr4422853637.30.1749559085848; 
 Tue, 10 Jun 2025 05:38:05 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:05 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:12 +0800
Message-ID: <20250610123743.667183-3-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong In some scenario, such as autotest, it is
 not expected to answer question from fsck or dump. To simply answer no to
 all these questions, this patch adds an option `N' to do that. Signed-off-by:
 Sheng Yong --- fsck/dump.c | 3 +++ fsck/fsck.c | 2 +- fsck/main.c | 14
 +++++++++++---
 include/f2fs_fs.h | 1 + 4 files changed, 16 insertions(+), 4 deletions(-)
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.44 listed in wl.mailspike.net]
X-Headers-End: 1uP1Am-00079O-Ee
Subject: [f2fs-dev] [RFC PATCH v2 02/32] f2fs-tools: add option N to answer
 no for all questions
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
 fsck/dump.c       |  3 +++
 fsck/fsck.c       |  2 +-
 fsck/main.c       | 14 +++++++++++---
 include/f2fs_fs.h |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)

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
index 4d05e1b4a21b..14677128dc2d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3834,7 +3834,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	}
 
 #ifndef WITH_ANDROID
-	if (nr_unref_nid && !c.ro) {
+	if (nr_unref_nid && !c.ro && !c.answer_no) {
 		char ans[255] = {0};
 		int res;
 
diff --git a/fsck/main.c b/fsck/main.c
index c5d41597934a..b01a22c8cf53 100644
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
@@ -263,7 +265,7 @@ void f2fs_parse_options(int argc, char *argv[])
 	}
 
 	if (!strcmp("fsck.f2fs", prog)) {
-		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyV";
+		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyNV";
 		int opt = 0, val;
 		char *token;
 		struct option long_opt[] = {
@@ -396,6 +398,9 @@ void f2fs_parse_options(int argc, char *argv[])
 				c.force = 1;
 				MSG(0, "Info: Force to fix corruption\n");
 				break;
+			case 'N':
+				c.answer_no = true;
+				break;
 			case 'q':
 				c.preserve_limits = atoi(optarg);
 				MSG(0, "Info: Preserve quota limits = %d\n",
@@ -449,7 +454,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:Vy";
+		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:VyN";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -527,6 +532,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 'f':
 				c.force = 1;
 				break;
+			case 'N':
+				c.answer_no = true;
+				break;
 			case 'r':
 				dump_opt.use_root_nid = 1;
 				break;
@@ -1369,7 +1377,7 @@ fsck_again:
 
 	f2fs_do_umount(sbi);
 
-	if (c.func == FSCK && c.bug_on) {
+	if (c.func == FSCK && c.bug_on && !c.answer_no) {
 		if (!c.ro && c.fix_on == 0 && c.auto_fix == 0 && !c.dry_run) {
 			char ans[255] = {0};
 retry:
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index f7268d1e90ff..5cd4ad666c06 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1593,6 +1593,7 @@ struct f2fs_configuration {
 	int whint;
 	int aliased_devices;
 	uint32_t aliased_segments;
+	bool answer_no;
 
 	/* mkfs parameters */
 	int fake_seed;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
