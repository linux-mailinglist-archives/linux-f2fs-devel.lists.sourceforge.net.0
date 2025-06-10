Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65EAD3C9A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvaZ5ZoxdbRYIfYRqyP5GmQOGs9jGAJgNsro/iAbZv0=; b=UinPJioFvBkuluzsWJmGnMiUEy
	PIcf3m3IJm4wIwVPUDF0CtttXHAWFqBBlaIxBsPiMwKmTgDILJYBgdEZG18xo7Ke+c4egX1F7U0rm
	y3mOd9WUp9VjVfkHYhBEOY09uxm6cp4sVZIq1WiCMiGz+KtDra4Tsqg1z5Pd5xkE1byo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0lY-0008N5-IQ;
	Tue, 10 Jun 2025 15:19:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0lW-0008Mx-Es
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/BOAsnrpdwH9p2BSd1xV2qsVLMUpXMmCEUXFEKJJJTw=; b=k2ke8XaPq38IY0tiGzKRt9sHSY
 XY9NZIAAf89JBHbf3qw0OUCfdWzQgyn55Bf3+YSlKQDtsUQmJm26+xJ/qBCXM7Y/niSXJcY+qzIrA
 BuM4hO+KRPP85cMzUcsyz4OH89i/DIXUT1dIJHu189CaQED5krC8gqEA77YLnmUdleCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/BOAsnrpdwH9p2BSd1xV2qsVLMUpXMmCEUXFEKJJJTw=; b=T4BCfsAjjr9CPFjCSLKFsbBKkc
 q0dOHlyiOiFRwMxKdeLTjElsXFM78GFK0gdMFlM+9Gwt0E7cbzDoAwAHwkcGi1WL2D+p1PfXW9f/K
 s6Oo3fX4V3OmgDuKq9g5z6SP7uV6qkZzEx8Rrj5yRw5pKcvHKdaRIPDpxhhg3QdsEcn8=;
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0lV-0003rf-OM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:19:54 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-710bbd7a9e2so48466057b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568783; x=1750173583; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/BOAsnrpdwH9p2BSd1xV2qsVLMUpXMmCEUXFEKJJJTw=;
 b=JezD8JdVkEKS6AdjSQXEVBMgKgnOLe3cgFbolSm7u668/9jABCfZnjOXr//V6yc52e
 FmlsPuoeaSo0YNV3OKG8gl1TkeNlmlbQF+grUX4gZ90+cNb/N6un9HUpS7Zh2ulQ0taj
 dS0K+znwf3I0eQOln+Ps8HUc7/Dk3GmJcWEpwJLZD4hticRv68eLL7WMOIc20TLYrkT3
 3TG1jzVRlO0pW/UTvp7owOKUyCZddO9PLrZs+iDcmSm8UZ7j8X+2lzwkP/oXScWLKfo1
 ebmmA37brq0KvDT5phm/asp21tgGsUUaAB8de1FZCT4bbu1pw/9NE9NaPqWyI0bR3QzA
 CLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568783; x=1750173583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/BOAsnrpdwH9p2BSd1xV2qsVLMUpXMmCEUXFEKJJJTw=;
 b=oCykGbuyx5BApN+S9h3WDd+gCh1Fx2BvbBAAeFxG79b97tBKvjl6bYKjM154GxGOJe
 2kdhMFTBE8Ef7G2VFRDcfV5zrvufiiXdu83ThngIB5T17GTbqEEXZuAR9ZSYY/jYxvjL
 ps0rQRCqcm8P3STnZ78XYvyaCsclrxPD2PXuijZJEiNpTQuqgiPnQBKqymgMYuyfI2E0
 50aZZPS/eOV+8fT9DzB0uPiwRIfJVlkl9eUknS6hHxFRYuFgmkPNcvvKF5rcFhks2Q1+
 JJY8+4Ig5ksaJ8nT6Fmf+I7KHMvrShcHVF4aCYjrMufVDTxr17uIoANERn0ua2Z9vAMu
 rMkg==
X-Gm-Message-State: AOJu0YwNLOMdWwJm88BxMr8BlO9gdau1y5MowhYCz2M6ARD9s9tY4Esl
 ++zouj9W+9l49R2JuUHKHC353Ny6tFPAfbNniMZkso0RYoWtc5JI3Xjoj8UrGQ==
X-Gm-Gg: ASbGncs4BStVI5OtnwC4uvKW/DBqL56ahMTbLxchyEn+cFjaJKCOfBWH1YFTAFYkqfg
 jFBmzBZysi5r8mlD1kCKROWZycvjb7thHVlbPHWKVsmZdCfioQFGLD756dZW66lPoT279OwWwtw
 Ya3/xIsW9sYM89l+8o5qaMyfBFlUK6fMZXS0ZQ4TMiwJS8WMVgLnh+2duZyks6EMjzZyki2cLIp
 yYIUYVzs2qqnnJiaaZNT9lbE+kqMw2svsFzPMaJ4sNgtTn53e8Ro4gxWZZRIpYW8fon438tTjlJ
 su2nEUIjLluBrgpvVHKOExkK2mObGbQOe2XeBtn5IGDK972Z08zfIo0D753POWsDbhKS
X-Google-Smtp-Source: AGHT+IFFlYXbF/CDau4WYqQBCVgHFgTdbs30DxqLVCa6i1D95eIwqHrM0pJLYTUe1o0bjsyO9X0+Jw==
X-Received: by 2002:a05:6a00:2d04:b0:736:339b:8296 with SMTP id
 d2e1a72fcca58-74827f10b52mr23042901b3a.18.1749559129736; 
 Tue, 10 Jun 2025 05:38:49 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:49 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:34 +0800
Message-ID: <20250610123743.667183-25-shengyong1@xiaomi.com>
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
 tests/f_ssa_bad_type/README
 | 5 +++++ tests/f_ssa_bad_type/expect.in | 3 +++ tests/f_ssa_bad_type/script
 | 31 +++++++++++++++++++++++++++++++ 3 files changed, 39 insert [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.180 listed in wl.mailspike.net]
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
X-Headers-End: 1uP0lV-0003rf-OM
Subject: [f2fs-dev] [RFC PATCH v2 24/32] tests: add fsck testcase of fixing
 sum footer type
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
 tests/f_ssa_bad_type/README    |  5 +++++
 tests/f_ssa_bad_type/expect.in |  3 +++
 tests/f_ssa_bad_type/script    | 31 +++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 tests/f_ssa_bad_type/README
 create mode 100644 tests/f_ssa_bad_type/expect.in
 create mode 100644 tests/f_ssa_bad_type/script

diff --git a/tests/f_ssa_bad_type/README b/tests/f_ssa_bad_type/README
new file mode 100644
index 000000000000..358c0c5ab284
--- /dev/null
+++ b/tests/f_ssa_bad_type/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject footer entry_type in the summary block of the blkaddr and change it to NODE
+5. fsck fixes the footer
diff --git a/tests/f_ssa_bad_type/expect.in b/tests/f_ssa_bad_type/expect.in
new file mode 100644
index 000000000000..0b6cd6684a32
--- /dev/null
+++ b/tests/f_ssa_bad_type/expect.in
@@ -0,0 +1,3 @@
+Info: Force to fix corruption
+[ASSERT] (is_valid_ssa_data_blk: x)  --> Summary footer indicates a data segment: _SEGNO_
+Info: Force to fix corruption
diff --git a/tests/f_ssa_bad_type/script b/tests/f_ssa_bad_type/script
new file mode 100644
index 000000000000..31c237779d13
--- /dev/null
+++ b/tests/f_ssa_bad_type/script
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+DESC="ssa block footer with invalid type"
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
+$INJECT --ssa --blk $blkaddr --mb entry_type --val 1 $META >> $LOG
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
