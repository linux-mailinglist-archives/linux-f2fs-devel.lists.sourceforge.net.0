Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAE3AD3D81
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9J+eBZIOOZXHd5TO32moVqI6Fm1nSvoAfTTN2oi2vE=; b=hgF5b5RZ/4eJYVHKvNG3dIdH72
	mylU0lSqXhwXmiG4A0aZ2WyAkjCXOhMuZDsq+pTrYT3fphZXu8buUWLqCAKRWZzJNe/0asYByCaeI
	GMjSMopsGvBzSI+lnAe0qdGWwbR5PJHJHkEYpZp8erjYkLNZmTML9CsRVQLsiS2kCO5Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP13b-0006rW-IS;
	Tue, 10 Jun 2025 15:38:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP13a-0006rQ-4G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTVI4FLOkJgR1IBTXntC0n6q7eWiu3bCMoeoLntJDfI=; b=iFieaB13pwz+vONDX5FglnosXX
 Gcz0yYkqKRFbH6ILuKebr/lw2G6cP6yjCUBxnQfRqA53StP+TXHxN2iU4v5l5j0W8F7rflpjhKJY/
 yyR36zWp9C8o14jklZLzJXu0UtXeYRr2eCSiYdTsX4eSYr4wGC7NiGQCGqTh3WSJvorc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cTVI4FLOkJgR1IBTXntC0n6q7eWiu3bCMoeoLntJDfI=; b=RLIe7mXggi7f/KAid20LCECzkD
 v8uamj1ybqAq3RPXrM5OOnkx9gO0kOJJMdSqMtSGfb3IYye1qqRFMSosa5qXoZnuZx1e8ot3i6EMI
 ylg6O0OIM13egUhMnvY4/G8XJ5u/LwrTx47sVxpBTJ8GZI5j8fX+AhN2KWKWrE+yjEaU=;
Received: from mail-qv1-f47.google.com ([209.85.219.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP13Z-0006AO-1m for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:38:34 +0000
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6fb0eb0f0fbso43478846d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569902; x=1750174702; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTVI4FLOkJgR1IBTXntC0n6q7eWiu3bCMoeoLntJDfI=;
 b=jkFwrDbhCIE6LUd3h7BDRpPzD2pXr5x34nDnJnb065zG2alccatxVQzO439hskhyqH
 FkOIsiqgWqsazrzS/vS9gW/sFlAmMKwKdaz57oDLVFpF1XOAgYwKg2YsZK2yEbdb6gg9
 JCxb2CaZ0uyJ5GyvqSL/2xownF92MFXGdZwao3rSxE8apt+t5Wijb1FJAs4/T43ZyleO
 olChca+8bXpHus3b2NXPEczMvfK93HPLL/7L8XXaxWtLcvja7OEm6sZPC9KgbLW+1bfQ
 OJ+bNDZEwVQSMzBaZmlSoMcg9sOjiDgs/qmeXCX8wz7MQDNM6LhFZ5rf5SRSA0nDLEyt
 8ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569902; x=1750174702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTVI4FLOkJgR1IBTXntC0n6q7eWiu3bCMoeoLntJDfI=;
 b=ZPId4repZ/DzE5NMM8mzAro9UwoqjPF1okpMbzBwxrjUGVV2Ci+OB7XLW8E6H9PJVx
 laf3wTRf74zRzsxuSMjvdE/oKOjvF4/7Jlbt8lSvyyUlJkw30cS3dWTN1f4uykC7dA7U
 /yM240D3F7Wk7pSBUg44M0aZHjTuNXUVQN/W4yWpeFcM3M6Q93QMkFITja1XbDumBoxp
 0/er7gJxuQbS9u9dqwy51YRPxonETXVON9xbDHX0XdwTp8g9ZX3lZQtpSa2dIYMSrwni
 n1YgP+nFfoR36+MXZQGhC9RUYoyj9DdBWCbJFO5NbwauzLcbGaDtgQr8B84EO55tf3hL
 N0Bg==
X-Gm-Message-State: AOJu0Yy3rTplHaVLXMZX+TrBFE/K5L7wubPwJdNduV/ofXiTXlh2RZQF
 Cmdg53E/R2howzJOMEExFEahNhdjGrTVsXxYTukSz0z4XLKLVYQVC8DHETYjsg==
X-Gm-Gg: ASbGnctPNl+nX+yAgfYTBbFWDmttHBCMJSQc6ILSUaTYoS/xVaq6wiTYXbGlzoYw2JZ
 mzaTy2Y/MROl2dNwdcD7A4FyedhpbQAQSZ3qGI8Un9DAraimF6T5AJxkjLaOBMrGUVDgCxkVPCo
 dHl0oYnDUxxqCy+oZ45DQxggIQ04O5lxZ8NbrgZC1RMD7Zc9ZJaCBUAkPJnlsi7AQhawZ9Lxjou
 JKIkeVvt8RBgjr038ILkC42QYwfk8y+s08tMJaaA2CUvMrzkdzE0VBch61Hcaolp51dpT44oJ+S
 xwHt0Yq7lzPJssA4z5zgKw4ghVFTWgph+5GdloIxczowJsJQlWeJpv0JL1o9jlOf+GKK
X-Google-Smtp-Source: AGHT+IGdidQ90Ri5s3SEMExfXpzPBmuD9ru1EJ1JKb3RnuSmFgacWFpYHX9BPQYA1yiyhmIgvfM0RQ==
X-Received: by 2002:a05:6a20:258d:b0:1f5:8cf7:de4b with SMTP id
 adf61e73a8af0-21f7693d1c1mr4796181637.16.1749559110062; 
 Tue, 10 Jun 2025 05:38:30 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:29 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:24 +0800
Message-ID: <20250610123743.667183-15-shengyong1@xiaomi.com>
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
 Content preview:  From: Sheng Yong This patch addes helper scripts for auto
 testcases, and testcases of fsck will be submitted in the following commits.
 The basic idea of these testcases are: 1. create f2fs image 2. corrupt the
 image by inject specific fields 3. fsck fixes the corrupted image 4. verify
 fsck output with expected message 
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
 [209.85.219.47 listed in wl.mailspike.net]
X-Headers-End: 1uP13Z-0006AO-1m
Subject: [f2fs-dev] [RFC PATCH v2 14/32] tests: prepare helper scripts for
 testcases
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

This patch addes helper scripts for auto testcases, and testcases of
fsck will be submitted in the following commits.

The basic idea of these testcases are:
 1. create f2fs image
 2. corrupt the image by inject specific fields
 3. fsck fixes the corrupted image
 4. verify fsck output with expected message

The helper scripts include:
 * test_config.in: is used to generate the basic configurations of all
                   testcases.
 * runtests.in: is used to generate `runtests'.
 * filter.sed: is used to remove unnecessary messages and cleanup
               arbitrary values.
 * helpers: provides helper functions

The usage of runtests:
 * run all testcases:
     runtests
 * run one testcase:
     runtests <testcase directory path>
 * cleanup previous results:
     runtests clean

Each testcase should have a sub-directory, where three files should be
included:
 * README: describe information of the testcase
 * script: testcase itself
 * expect.in: expected output message

New files are generated in the testcase directory after test:
 * log: output in detail
 * expect: derived from expect.in
 * out: output that will be compared with expect
 * PASS: testcase is passed
 * FAIL: testcase is failed
 * SKIP: testcase is skipped

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 .gitignore           |  14 +++
 Makefile.am          |   2 +-
 configure.ac         |   1 +
 tests/Makefile.am    |  26 +++++
 tests/filter.sed     |  69 +++++++++++
 tests/helpers        | 269 +++++++++++++++++++++++++++++++++++++++++++
 tests/runtests.in    |  48 ++++++++
 tests/test_config.in |  53 +++++++++
 8 files changed, 481 insertions(+), 1 deletion(-)
 create mode 100644 tests/Makefile.am
 create mode 100644 tests/filter.sed
 create mode 100644 tests/helpers
 create mode 100644 tests/runtests.in
 create mode 100644 tests/test_config.in

diff --git a/.gitignore b/.gitignore
index 49809446793d..68dbe1c407c5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,6 +46,8 @@ stamp-h1
 
 /mkfs/mkfs.f2fs
 /fsck/fsck.f2fs
+/fsck/dump.f2fs
+/fsck/inject.f2fs
 /tools/fibmap.f2fs
 /tools/parse.f2fs
 /tools/f2fscrypt
@@ -54,3 +56,15 @@ stamp-h1
 # cscope files
 cscope.*
 ncscope.*
+
+# testcase files
+tests/*/log
+tests/*/out
+tests/*/PASS
+tests/*/FAIL
+tests/*/SKIP
+tests/*/expect
+tests/meta.img
+tests/data.img
+tests/runtests
+tests/test_config
diff --git a/Makefile.am b/Makefile.am
index d2921d626e48..0c9ec66d02b6 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -2,4 +2,4 @@
 
 ACLOCAL_AMFLAGS = -I m4
 
-SUBDIRS = man lib mkfs fsck tools
+SUBDIRS = man lib mkfs fsck tools tests
diff --git a/configure.ac b/configure.ac
index ddfc3b0f30e2..a819dde93ed1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -265,6 +265,7 @@ AC_CONFIG_FILES([
 	fsck/Makefile
 	tools/Makefile
 	tools/f2fs_io/Makefile
+	tests/Makefile
 ])
 
 AC_CHECK_MEMBER([struct blk_zone.capacity],
diff --git a/tests/Makefile.am b/tests/Makefile.am
new file mode 100644
index 000000000000..1b4dfdc70e44
--- /dev/null
+++ b/tests/Makefile.am
@@ -0,0 +1,26 @@
+## Makefile.am
+
+noinst_SCRIPTS = test_config runtests
+EXTRA_DIST = test_config.in runtests.in
+
+test_config: $(srcdir)/test_config.in
+	@echo "Creating test_config script..."
+	@[ -f test_config ] && chmod u+w test_config || true
+	@echo "#!/bin/bash" > test_config
+	@echo "" >> test_config
+	@echo "TOPDIR=@top_srcdir@" >> test_config
+	@cat $(srcdir)/test_config.in >> test_config
+	@chmod +x-w test_config
+
+runtests: $(srcdir)/runtests.in
+	@echo "Creating runtests script..."
+	@[ -f runtests ] && chmod u+w runtests || true
+	@echo "#!/bin/bash" > runtests
+	@echo "" >> runtests
+	@echo "SRCDIR=@srcdir@" >> runtests
+	@cat $(srcdir)/runtests.in >> runtests
+	@chmod +x-w runtests
+
+clean-local:
+	@[ -f runtests ] && ${SHELL} runtests clean || true
+	@rm -f $(noinst_SCRIPTS)
diff --git a/tests/filter.sed b/tests/filter.sed
new file mode 100644
index 000000000000..b2161a55d454
--- /dev/null
+++ b/tests/filter.sed
@@ -0,0 +1,69 @@
+# output messages that could be removed or ignored
+#
+# Note that some sed only supports POSIX Basic Regular Expression (BRE)
+# syntax. In BRE, metacharacters, for example '|', '\s', '\+', are not
+# supported. So BRE is recommended in this file.
+
+# remove messages which start with "^Info: ", expect for:
+#  - Info: Automatic fix mode enabled
+#    indicate that fsck -a is used.
+#  - Info: Force to fix corruption
+#    indicate that fsck -f is used.
+#  - Info: No error was reported
+#    indicate that fsck does not detect any errors.
+#  - Info: checkpoint stop reason
+#  - Info: fs errors
+#    indicate that fsck detects error recorded in super block.
+/^Info: MKFS version/,+1d
+/^Info: FSCK version/,+2d
+/^Info: Host-managed zoned block device:/,+3d
+/^Info: /{
+	/Info: Automatic fix mode enabled/b out;
+	/Info: Force to fix corruption/b out;
+	/Info: No error was reported/b out;
+	/Info: checkpoint stop reason/b out;
+	/Info: fs errors/b out;
+	d
+}
+# e.g [update_block: 904] Info: Done to update superblock
+/^\[[a-zA-Z_][0-9a-zA-Z_]*:[[:space:]]*[0-9]\{1,\}\] Info: /d
+# e.g [INFO] (fsck_update_sb_flags:2389)  --> Casefold: linear_lookup [enable]
+/^\[INFO\]/d
+
+# remove fsck statistics messages
+# e.g [FSCK] valid_block_count matching with CP             [Ok..][0xc]
+/^\[FSCK\]/d
+
+# remove trivial messages
+/be careful to overwrite a mounted loopback file/d
+/^Done: [0-9\.]\{1,\} secs/d
+/^update nat(nid:.*) blkaddr \[.*\] in journal/d
+
+# some messages contain arbitrary numeric, ignore them
+# e.g [ASSERT] (is_valid_ssa_data_blk: 340) => [ASSERT] (is_valid_ssa_data_blk: x)
+s/\(\[ASSERT\] ([a-zA-Z_][0-9a-zA-Z_]*:[[:space:]]*\)[0-9]\{1,\})/\1x)/g
+# e.g [FIX] (nullify_nat_entry:3274) => [FIX] (nullify_nat_entry:x)
+s/\(\[FIX\] ([a-zA-Z_][0-9a-zA-Z_]*:[[:space:]]*\)[0-9]\{1,\})/\1x)/g
+# e.g [fsck_chk_quota_files:2242] => [fsck_chk_quota_files:x]
+s/^\(\[[a-zA-Z_][0-9a-zA-Z_]*:[[:space:]]*\)[0-9]\{1,\}\]/\1x\]/g
+
+# exceptions
+# the message is only shown on zoned device, but I don't find a better way
+# to keep this message in expect.in for both zoned and legacy UFS. So remove
+# it for now.
+/Reset write pointer of zone at segment/d
+
+# cut dump messages
+# e.g nid: 7 ino: 7 ver: 0 offset: 0 blkaddr: 28642878 pack:1 cp_ver:0xe42573115ffc7cfc =>
+#     nid: 7 ino: 7 ver: 0 offset: 0
+s/\(^nid:.*\) blkaddr:[0-9]\{1,\} pack:[12] cp_ver:0x[0-9a-fA-F]\{1,\}/\1/g
+# e.g segno: 55968 vblocks:512 seg_type:1 mtime:0 sit_pack:2 =>
+#     segno: 55968 vblocks:512 seg_type:1 mtime:0
+s/\(^segno:.*\) sit_pack:[12]/\1/g
+
+# keep the following at the end of the file
+:out
+# remove empty lines
+/^$/d
+# remove tail spaces
+s/[[:space:]]\{1,\}$//g
diff --git a/tests/helpers b/tests/helpers
new file mode 100644
index 000000000000..03853f803598
--- /dev/null
+++ b/tests/helpers
@@ -0,0 +1,269 @@
+#!/bin/bash
+
+OUT=$TESTDIR/out
+EXP=$TESTDIR/expect
+LOG=$TESTDIR/log
+
+# $1: string to be trimed
+trim_extra_space() {
+	local line=""
+	while IFS= read -r line; do
+		# trim multiple spaces as one
+		line=`echo "$line" | sed "s/[[:space:]]\{1,\}/ /g"`
+		# delete space in hex values
+		line=`echo "$line" | sed "s/0x /0x/g"`
+		# delete space before and after ":"
+		echo "$line" | sed "s/ *: */:/g"
+	done
+}
+
+# clean up temporary files
+cleanup() {
+	[ -f $TESTDIR/PASS ] && rm $TESTDIR/PASS || true
+	[ -f $TESTDIR/FAIL ] && rm $TESTDIR/FAIL || true
+	[ -f $TESTDIR/SKIP ] && rm $TESTDIR/SKIP || true
+	[ -f $TESTDIR/expect ] && rm $TESTDIR/expect || true
+	[ -f $OUT ] && rm $OUT || true
+	[ -f $LOG ] && rm $LOG || true
+}
+
+# check test result
+check_result() {
+	local NAME=`basename $TESTDIR`
+
+	if [ -e $TESTDIR/SKIP ]; then
+		echo "$NAME: $DESC: skip"
+		return
+	fi
+
+	if [ ! -e $EXP ]; then
+		cp "$EXP".in $EXP
+	fi
+	sed -f $FILTER -i $OUT
+	cmp -s $OUT $EXP
+	if [ x"$?" = x"0" ]; then
+		echo "$NAME: $DESC: pass"
+		touch $TESTDIR/PASS
+	else
+		echo "$NAME: $DESC: fail"
+		echo "diff $EXP $OUT"
+		diff $EXP $OUT > $TESTDIR/FAIL
+		exit
+	fi
+}
+
+# $1: dev path
+is_block_dev() {
+	if [ ! -e $1 ]; then
+		return 0
+	fi
+	local dev_real_path=`realpath $1`
+	if [ -b $dev_real_path ]; then
+		# dev is block device
+		return 1
+	fi
+	# dev is not block device
+	return 0
+}
+
+# $1: path of image file
+# $2: size in MB
+create_img_file() {
+	is_block_dev $1
+	if [ $? -eq 1 ]; then
+		# dev is block device, return directly
+		return
+	fi
+	truncate -s $2"M" $1
+}
+
+make_f2fs() {
+	local metasize=10
+	local datasize=118
+	local opts="$MKFS_OPTS"
+
+	if [ $SEGS_PER_SEC -gt 1 ]; then
+		metasize=$((3 * (SEGS_PER_SEC * 2)))
+		datasize=$((11 * (SEGS_PER_SEC * 2)))
+		opts="$MKFS_OPTS -s $SEGS_PER_SEC"
+	fi
+	if [ $MULTIDEV -eq 1 ]; then
+		create_img_file $META $metasize
+		create_img_file $DATA $datasize
+		opts = "$MKFS_OPTS -c $DATA"
+	else
+		create_img_file $META $((metasize + datasize))
+	fi
+
+	$MKFS $opts $META
+	if [ $? -ne 0 ]; then
+		echo "failed to format f2fs" >&2
+		exit
+	fi
+	$DUMP -d 1 $META
+}
+
+safe_mount() {
+	if [ $MULTIDEV -eq 1 ]; then
+		is_block_dev $DATA
+		if [ $? -eq 0 ]; then
+			# If multiple devices are used and DATA is not
+			# a block device, DATA should be associated to
+			# a loop device in advance.
+			# dump/fsck will check the path of the DATA
+			# device, to make them happy, replace devs[1].path
+			# with the loop device before mount, and restore
+			# it after umount.
+			local dev=`losetup -f`
+			losetup $dev $DATA
+			if [ $? -ne 0 ]; then
+				echo "cannot setup loop dev: losetup $dev $DATA" >&2
+				exit
+			fi
+			$INJECT --sb 1 --mb devs.path --idx 1 --str $dev $META
+		fi
+	fi
+
+	mount -t f2fs $*
+	if [ $? -ne 0 ]; then
+		echo "cannot mount f2fs image" >&2
+		exit
+	fi
+}
+
+# $1: mntpoint
+safe_umount() {
+	local max_retry=10
+	local dev=""
+	local i=0
+
+	umount $1
+	while [ $? -ne 0 ]; do
+		i=$((i + 1))
+		if [ $i -gt $max_retry ]; then
+			echo "cannot umount f2fs image" >&2
+			exit
+		fi
+		echo "cannot umount f2fs image, retry: $i"
+		sleep 1
+		umount $1
+	done
+
+	if [ ! -e $DATA ]; then
+		return
+	fi
+	dev=`losetup -j $DATA | cut -d ":" -f 1`
+	if [ x"$dev" != x"" ]; then
+		losetup -d $dev
+		# restore devs[1].path from $dev to $DATA
+		$INJECT --sb 1 --mb devs.path --idx 1 --str $DATA $META
+	fi
+}
+
+# $1: subject: cp, sb or node
+# $2: member of subject
+# $3: the number of output lines if there are multiple results, default is 1
+get_mb() {
+	if [ x"$3" = x"" ]; then
+		local nth=1
+	else
+		local nth=$3
+	fi
+	echo "$1" | grep "^$2" | awk "NR==$nth" | trim_extra_space
+}
+
+# $1: subject: cp, sb or node
+# $2: member of subject
+# $3: the number of output lines if there are multiple results, default is 1
+get_mb_val() {
+	if [ x"$3" = x"" ]; then
+		local nth=1
+	else
+		local nth=$3
+	fi
+	local val=`echo "$1" | grep "^$2" | awk "NR==$nth" | \
+		   sed "s/^$2[[:space:]]*\[\(.*\)\]$/\1/g"`
+	echo "$val" | grep ":" > /dev/null
+	if [ $? -eq 0 ]; then
+		val=`echo $val | sed "s/.*:[[:space:]]*\([0-9]\{1,\}\)$/\1/g"`
+	fi
+	echo $val
+}
+
+# $1: device
+get_sb() {
+	local sb_cp="`$DUMP $DUMP_OPTS -d 1 $1`"
+	local cut_here=`echo "$sb_cp" | awk '/^\| Checkpoint/ {print NR}'`
+	local sb="`echo "$sb_cp" | head -n $((cut_here - 2))`"
+	echo "$sb"
+}
+
+# $1: device
+get_cp() {
+	local sb_cp="`$DUMP $DUMP_OPTS -d 1 $1`"
+	local cut_here=`echo "$sb_cp" | awk '/^\| Checkpoint/ {print NR}'`
+	local cp="`echo "$sb_cp" | tail -n +$((cut_here - 2))`"
+	echo "$cp"
+}
+
+# $1: blkaddr
+get_segno() {
+	local sb=`get_sb $META`
+	local main_blkaddr=`get_mb_val "$sb" main_blkaddr`
+	local log_blks_per_seg=`get_mb_val "$sb" log_blocks_per_seg`
+	echo $((($1 - main_blkaddr) >> log_blks_per_seg))
+}
+
+# $1: segno
+start_block() {
+	local sb=`get_sb $META`
+	local main_blkaddr=`get_mb_val "$sb" main_blkaddr`
+	local log_blks_per_seg=`get_mb_val "$sb" log_blocks_per_seg`
+	echo $((main_blkaddr + ($1 << log_blks_per_seg)))
+}
+
+# $1: blkaddr
+offset_in_seg() {
+	local sb=`get_sb $META`
+	local main_blkaddr=`get_mb_val "$sb" main_blkaddr`
+	local log_blks_per_seg=`get_mb_val "$sb" log_blocks_per_seg`
+	echo $((($1 - main_blkaddr) % (1 << log_blks_per_seg)))
+}
+
+# reference INIT_FEATURE_TABLE
+# $1: feature
+test_sb_feature() {
+	local sb=`get_sb $META`
+	local feats=`get_mb_val "$sb" feature`
+	case $1 in
+		"encrypt")
+			return $((!!(feats & 0x1)));;
+		"blkzoned")
+			return $((!!(feats & 0x2)));;
+		"extra_attr")
+			return $((!!(feats & 0x8)));;
+		"project_quota")
+			return $((!!(feats & 0x10)));;
+		"inode_checksum")
+			return $((!!(feats & 0x20)));;
+		"flexible_inline_xattr")
+			return $((!!(feats & 0x40)));;
+		"quota")
+			return $((!!(feats & 0x80)));;
+		"inode_crtime")
+			return $((!!(feats & 0x100)));;
+		"lost_found")
+			return $((!!(feats & 0x200)));;
+		"verity")
+			return $((!!(feats & 0x400)));;
+		"sb_checksum")
+			return $((!!(feats & 0x800)));;
+		"casefold")
+			return $((!!(feats & 0x1000)));;
+		"compression")
+			return $((!!(feats & 0x2000)));;
+		"ro")
+			return $((!!(feats & 0x4000)));;
+	esac
+	return 0
+}
diff --git a/tests/runtests.in b/tests/runtests.in
new file mode 100644
index 000000000000..29db79a4a95c
--- /dev/null
+++ b/tests/runtests.in
@@ -0,0 +1,48 @@
+#!/bin/bash
+#
+# run testcases
+#
+# run all testcases:
+#   runtests
+#
+# run one testcase:
+#   runtests <testcase directory path>
+#
+# cleanup:
+#   runtests clean
+#
+
+# clean temporary files
+if [ x"$1" = x"clean" ]; then
+	find $SRCDIR \( -name FAIL -o -name PASS -o -name SKIP -o \
+			-name expect -o -name log -o -name out -o \
+			-name meta.img -o -name data.img \) -exec rm -f {} \;
+	exit
+fi
+
+TEST_CONFIG=$SRCDIR/test_config
+. $TEST_CONFIG
+
+# $1: path of testcase path
+run_one_test() {
+	local subdir=`realpath $1`
+	local name=`basename $subdir`
+	echo "Run testcase: $name ..."
+	TESTDIR=$subdir
+	. $subdir/script
+	echo ""
+}
+
+# run one testcase
+# $1: testcase path
+if [ x"$1" != x"" ]; then
+	run_one_test $1
+	exit
+fi
+
+# run all testcases
+TESTS=`find ./ -type f -name script`
+for testcase in ${TESTS[@]}; do
+	subdir=`dirname $testcase`
+	run_one_test $subdir
+done
diff --git a/tests/test_config.in b/tests/test_config.in
new file mode 100644
index 000000000000..41ce50052197
--- /dev/null
+++ b/tests/test_config.in
@@ -0,0 +1,53 @@
+#!/bin/bash
+#
+# Test Configuration
+#
+
+check_executable() {
+	file $1 | grep ELF > /dev/null
+	[ $? -ne 0 ] && { echo "ERROR: $1 not ELF"; exit; }
+}
+
+check_diff() {
+	diff $1 $2 > /dev/null
+	[ $? -ne 0 ] && { echo "WARNING: $1 and $2 differ"; }
+}
+
+# path of devices
+# If multiple devices are used, META is the first device and DATA is the
+# second device. If there is only one device, META is used only.
+META=`realpath $TOPDIR/tests/meta.img`
+DATA=`realpath $TOPDIR/tests/data.img`
+
+# path of tools
+MKFS="$TOPDIR/mkfs/mkfs.f2fs"
+FSCK="$TOPDIR/fsck/fsck.f2fs"
+DUMP="$TOPDIR/fsck/dump.f2fs"
+INJECT="$TOPDIR/fsck/inject.f2fs"
+F2FS_IO="$TOPDIR/tools/f2fs_io/f2fs_io"
+FILTER="$TOPDIR/tests/filter.sed"
+[ ! -e $MKFS ] && { echo "$MKFS not exist"; exit; }
+[ ! -e $FSCK ] && { echo "$FSCK not exist"; exit; }
+check_executable $FSCK
+[ ! -e $DUMP ] && { cp $FSCK $DUMP; }
+check_executable $DUMP
+check_diff $FSCK $DUMP
+[ ! -e $F2FS_IO ] && { echo "$F2FS_IO not exist"; exit; }
+[ ! -e $INJECT ] && { cp $FSCK $INJECT; }
+check_executable $INJECT
+check_diff $FSCK $INJECT
+
+# config of mkfs
+F2FS_FEATURES="encrypt,quota,project_quota,extra_attr,verity,compression"
+MKFS_OPTS="-O $F2FS_FEATURES -f"
+MULTIDEV=0
+SEGS_PER_SEC=1
+
+# config of fsck
+FSCK_OPTS="--no-kernel-check -N"
+
+# config of dump
+DUMP_OPTS="-N"
+
+# config of mount
+MNT_OPTS=""
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
