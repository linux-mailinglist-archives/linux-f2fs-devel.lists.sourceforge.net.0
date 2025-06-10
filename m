Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4696AD3D83
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBqNXmfgm8IXVVaoAZsLI7w/hf14MvBFOnR6RgYNtdc=; b=Kdk6qssOAHsP1CMVirGYcOPQ21
	2ZIDZ0FkYx1YoIzcOhqVldR7tGNghJcx4H3t14z1P9XRBzMIjMbrBT3fsNeq+MYiqe+g8hzLlWNCK
	1GRXzU9pPf6dvOaovocMjkvB5h0B4g/KUk4UOPTz8MUGlgIB49/DVvtYwraBn9UjhZ9M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP13o-0004yr-PH;
	Tue, 10 Jun 2025 15:38:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP13n-0004yf-Aj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TatYBFF4EQY4FVsr1eUsJdTcW6iVGtz/p6vtXugeSW0=; b=g7eW5wzkte6zpvtmF/XoM1X5QH
 rMzcOrky5Vw7BOWCA8huMn4hVj4STMUnp5TLotXp0QKZGySoX0NXxf2DwaJJR+vHx18tdo7W2w8FQ
 7aai9lschWcfctkkNMc4ZXgY0vo1Con0pGufrspNCyy6zJK2dMU7Hoc22S30C38gXvOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TatYBFF4EQY4FVsr1eUsJdTcW6iVGtz/p6vtXugeSW0=; b=bN/vFDI8c/bCNfgKgEMI7A96rD
 0PmfB4iqhxeMMYknFDyE/rzJGBljbmEfzSfP5bowJP/lNObdTN7MMa8ZrhLcidyHLXBhZLca1AkaR
 AXcwyp31t54RMg39VbhtXGbGWDm3IFzs1DFqqRZBXJ2LYhZex6c+j+JNQhilM12t/cjM=;
Received: from mail-qv1-f42.google.com ([209.85.219.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP13m-0006CS-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:38:47 +0000
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6fad79433bbso51259176d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569916; x=1750174716; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TatYBFF4EQY4FVsr1eUsJdTcW6iVGtz/p6vtXugeSW0=;
 b=C4DdFVDHbb1CvTSFzkhQ+5BO7o+IbvRL4AM2sRG8650/0ixanLPhgFDK1LXda3EQaq
 kWL93nDBpgOQfCeySLsJIMbADZNWMkJgDqwIASghwwh84LeqdZUnTP3ydHWuReS8vVO6
 uoJalJLVBtDsdsfwEQaHI3LQYUqAU+F6ilERbQDtEDjlnNYydX6WC06YVZ2zMc7XXUVS
 UKOh7z8ffhSraAs8Zs/wuUsPlD0SGM0gWduJs4G/+bFlIrLGjB93msat2HPYLAyUfSPn
 CaoTpOWB4rsSKmgKy5pevc7clXP6+9W0kLYsFduvy5Z8d9kJxLm7rJ+ftXCyAcAcOBBw
 E9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569916; x=1750174716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TatYBFF4EQY4FVsr1eUsJdTcW6iVGtz/p6vtXugeSW0=;
 b=LB6kyyHkjbD7z7qJHEhnCVZEI+Xw5Y5NWQUYoNpzFqeeDAQVK5+Z4jFftrC5P45rm6
 67QVQddb/fhbaupLkRuMTHhvjJPAkRwUHLytCkdieSe0O8C+wgIvqmPgkF7emsTpHpbc
 8PahtledluNGkr//PY5JRAU+WH4dMLXFcsW9DDv5xKx8oh1x3IhujxiC9njNCizwIUyC
 MPfBn5hqw1KIOdeUaaSXGXfHMnfBt29M6HFHtE6D//aPFNcSSih3Ek0hKAO2mK+4X86p
 RB3luxqlC4fR9Mfc4W4heo8h/UXx9ptFankwBeIniLWIJdGHMHA1DrAcmBhHhZM6GdMZ
 42Xw==
X-Gm-Message-State: AOJu0YwSQLfSk29AEyapTZlNLjxqrBeMNnovUCdiRXVTALvCdgminW9E
 u/coWK+oBId3UR3jCr77H35xnvSJxGmpMupBebGPQ8nCcqOgtCmttW3oz5aZpw==
X-Gm-Gg: ASbGncv0CqlAJ77j+YFa7d0ldBXSJ3OjqKyOW9nJp74nGw7qXXhoHJ/XE2gVFal10Uk
 nkyhb3pW0g7b6383nZLSxVzFelwlsIrIu8kML1wQwnGdfA9zRnWwiQ0Qs7pdTBZ6VlXq8E5XDXN
 83NOPHDr+Wtb6PCttt++lbjfUKCDbKe+BKHJbMT0xytfFuZ3ERfE5TQYOtjAqZL2ExbxQJdszvb
 QLNvITtXa3PNocsADRDBbuStCsnoOzGjtsamp8TPky6/T1+hm3X4qv9KS7VvfWVIEndEkmGpAE7
 VZYWFP4JgH5YMVV3Vp3gSMUF8UXJh1TfHf6W2UA7/hOYccpL43WQt0XjvDH+jAu6M3bZ
X-Google-Smtp-Source: AGHT+IHep98VOv2OTCOyan37B6ziTa4xBJk0f62H9wPuieHSkZPNT+1s6ytj3Yp5ImCSFTboES3dDQ==
X-Received: by 2002:a05:6a00:1882:b0:740:b5f8:ac15 with SMTP id
 d2e1a72fcca58-74827e7b394mr20648701b3a.10.1749559123913; 
 Tue, 10 Jun 2025 05:38:43 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:43 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:31 +0800
Message-ID: <20250610123743.667183-22-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong ---
 tests/f_sit_bad_vblocks/README
 | 5 ++++ tests/f_sit_bad_vblocks/expect.in | 3 +++
 tests/f_sit_bad_vblocks/script
 | 38 +++++++++++++++++++++++++++++++ 3 files changed, 4 [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.42 listed in wl.mailspike.net]
X-Headers-End: 1uP13m-0006CS-Tx
Subject: [f2fs-dev] [RFC PATCH v2 21/32] tests: add fsck testcase of fixing
 sit entry vblocks
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

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 tests/f_sit_bad_vblocks/README    |  5 ++++
 tests/f_sit_bad_vblocks/expect.in |  3 +++
 tests/f_sit_bad_vblocks/script    | 38 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 tests/f_sit_bad_vblocks/README
 create mode 100644 tests/f_sit_bad_vblocks/expect.in
 create mode 100644 tests/f_sit_bad_vblocks/script

diff --git a/tests/f_sit_bad_vblocks/README b/tests/f_sit_bad_vblocks/README
new file mode 100644
index 000000000000..4ca21c766b2d
--- /dev/null
+++ b/tests/f_sit_bad_vblocks/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject vblocks in the sit entry of the blkaddr by subtracting 1
+5. fsck fixes the vblocks
diff --git a/tests/f_sit_bad_vblocks/expect.in b/tests/f_sit_bad_vblocks/expect.in
new file mode 100644
index 000000000000..9e31f38c458b
--- /dev/null
+++ b/tests/f_sit_bad_vblocks/expect.in
@@ -0,0 +1,3 @@
+Info: Force to fix corruption
+[ASSERT] (check_block_count:x)  --> Wrong SIT valid blocks: segno=_SEGNO_, 511 vs. 512
+Info: Force to fix corruption
diff --git a/tests/f_sit_bad_vblocks/script b/tests/f_sit_bad_vblocks/script
new file mode 100644
index 000000000000..6dd684555011
--- /dev/null
+++ b/tests/f_sit_bad_vblocks/script
@@ -0,0 +1,38 @@
+#!/bin/bash
+
+DESC="sit entry with invalid vblocks"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+dd if=/dev/zero of=$TESTDIR/mntdir/testfile bs=4K count=513 status=none
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG
+rm -rf $TESTDIR/mntdir
+
+node=`$DUMP $DUMP_OPTS -i $ino $META`
+echo "$node" >> $LOG
+blkaddr=`get_mb_val "$node" 'i_addr\[0x100\]'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+SIT_VBLOCKS_SHIFT=10
+SIT_VBLOCKS_MASK=$(((1 << SIT_VBLOCKS_SHIFT) - 1))
+val=`$INJECT --dry-run --sit 0 --blk $blkaddr --mb vblocks $META | \
+	grep "inject sit entry vblocks" | awk '{print $(NF-2)}'`
+vblocks=$((val & SIT_VBLOCKS_MASK))
+val=$(((val & ~SIT_VBLOCKS_MASK) | (vblocks - 1)))
+
+$INJECT --sit 0 --blk $blkaddr --mb vblocks --val $val $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
