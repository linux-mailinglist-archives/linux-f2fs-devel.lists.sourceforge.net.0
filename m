Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DADAD3D75
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03C10NAzyy32YL8T81IMaUchO037SGmsxshiH3bx9Rc=; b=Tr+rZ1Dkj+YkwegrI9ZxjogEfB
	kS0SmG3WPPhjPqdNd4sMRS9ZEARp6ifY5DuZEjaHvnN8R8DaI1J6jwKjP/Y7EDF8dIUj8UT8HagJP
	nO21QsFSxLV4umHmY5OEWVJHLIWWvivfy7dX36j/d9mzIUanuw6raTVlX4RyUr8zTnBY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP12X-0000bN-23;
	Tue, 10 Jun 2025 15:37:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP12V-0000bH-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=75nM+ZWGk/UcziH+fLt7f8HTsqMXf5oLWLlXgUA/bpM=; b=Wu8tgVoCcHWOCjvcJm/fdHEqbB
 El5gTlgmpCZEtXz52c4VEqkn9nYj+zlqwTYxSTXBmJJ77FJdV35QGFZkIWWn4/rbJa/j57nMETdy8
 LGbJ+mlwDIzXJ7WwSX9mVegKxaRDEpuAhhAjQNzXvtzA8Xwj6EmecM1rGAN6ogWkdv98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=75nM+ZWGk/UcziH+fLt7f8HTsqMXf5oLWLlXgUA/bpM=; b=COx0Etl45xJrtVKglUgMbUfMdi
 Qjg5oQz/t/h4JT11Q5EeLNaJs4oc12gLLQBy9uo7Z0K7pME/yDrN5G3tmhvUPJlC2V8WPyenl1Kz8
 Mhf8XW7vONqxGTPqNibOQ2Sd/i1eqYLO0fH0WEaGx9HKedGz3O6Wj6tL9WG+M19trkmM=;
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP12V-00063T-1o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:37:27 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-72bc3987a05so3582649a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569836; x=1750174636; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75nM+ZWGk/UcziH+fLt7f8HTsqMXf5oLWLlXgUA/bpM=;
 b=bobQH72qP805U/wWmFF1Zt9CfY602Jj7C5KHXfOedJ7dqxe0udr7SJCVZvuLfeMres
 YDqDelgpjU7dbxPqPCgRZGudC4IG1MK4GOeLnt8iSnTEPwEKV+KzhPuB5LqLGsZN3W0V
 LWun7t1Bip9OPP2+tFWFBNsPu84ENmpBx60SMazIsgZgoaPuVK691/qofkP4PvmCHzP4
 gU76qjg1nYXv+lTTjZYVLWsEnkPtCOLCV6rvmIHUCrf60B0rSsELeV1YJucn+5N2Cjcz
 mTDgjahmZfIt3fGnVrXcfezLSYgs2Mdt4jdW7+YwRf8CLcIPwJG0z48ZI6XVx246nzcl
 a7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569836; x=1750174636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75nM+ZWGk/UcziH+fLt7f8HTsqMXf5oLWLlXgUA/bpM=;
 b=J3EvYs/etNbBeIZOIPWoTrHwCnvPvEMeDdT9ostscqqaqxiOC1LpS/FyRysW3E9ycj
 uWcczBvMeIfceqnG7yn+SQEGS8XgaG/WLa+htNzHUCU7Dvyh7VI2gO2Hn8ZrXJQqYuEW
 0uSMnzCYy2jcfNmRgMNYhUhbS/gJjl5yoPo/2Fl3JqCCjvjA9qPv2VgLZl+FJUsAFV/P
 mW+9OsWCo7KsAungvUbI9RI/RyMqbH8r+uFN+POTVtCtFtNS1nEEClnVG0rIiLg9OB7t
 xacqjGSbMXiQFShsWLD8eLukVc1R7JRGuq8jDQglWLLrb/exHDCk7J2t8DwpZDnAyH5m
 OFoQ==
X-Gm-Message-State: AOJu0YwKJKNXIsPmd9caNfZema4gdBII9cYFXyKHiZlOhKI8KE939K4U
 AzyM6tHCtBJl2Ea4wv2XAQQfrEstALCDYmWC0qkrzR415O6gxl6NVfFJ/eHNIQ==
X-Gm-Gg: ASbGncupWepaKCevmEE3O9h/4v9bARrEXTltrxFn7ZkpVG6C91LPSkQwY7KAYfycdky
 GsLLxxNvqS23uV+nmCDF8/fMntc5dQu8FOwFKzyQZZHwvrPeMEn1wOj3DFXRfo0CtJjgiNuMerv
 k3egPQ0VN7kjzIqmJjNPhiuB9N5/TpJmDnuOjs6BxB8OcRODPfcJfzox1MwaQwhFUcwUl9ENoPk
 7UOJt8mLVqRStur10D+BRIM0J60Z4R0HAt+2WoxmGXNTmgvp1R0iLFQEeLzYyMa1dhqR9+EoUrA
 +TlT2EFMpRNzweUfyuPz/6Dl4bF6Zfzmoe5EUsVV6aievc09tWyhqnNN8GzvdD3S0IgB
X-Google-Smtp-Source: AGHT+IEoCU724MpkHckKAKbz30e5mDgGVXnA/R8Vg/MC6uhviA5weYCL8rcjsS2VdjCi7pgsmpwmWw==
X-Received: by 2002:a05:6a20:158a:b0:21d:98c:12c9 with SMTP id
 adf61e73a8af0-21f769bbabcmr5214182637.21.1749559125871; 
 Tue, 10 Jun 2025 05:38:45 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:45 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:32 +0800
Message-ID: <20250610123743.667183-23-shengyong1@xiaomi.com>
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
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong ---
 tests/f_sit_bad_valid_map/README
 | 5 ++++ tests/f_sit_bad_valid_map/expect.in | 4 +++
 tests/f_sit_bad_valid_map/script
 | 43 +++++++++++++++++++++++++++++ 3 files change [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP12V-00063T-1o
Subject: [f2fs-dev] [RFC PATCH v2 22/32] tests: add fsck testcase of fixing
 sit entry valid_map
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
 tests/f_sit_bad_valid_map/README    |  5 ++++
 tests/f_sit_bad_valid_map/expect.in |  4 +++
 tests/f_sit_bad_valid_map/script    | 43 +++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 tests/f_sit_bad_valid_map/README
 create mode 100644 tests/f_sit_bad_valid_map/expect.in
 create mode 100644 tests/f_sit_bad_valid_map/script

diff --git a/tests/f_sit_bad_valid_map/README b/tests/f_sit_bad_valid_map/README
new file mode 100644
index 000000000000..5306bdd31ae5
--- /dev/null
+++ b/tests/f_sit_bad_valid_map/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject bitmap in the sit entry of the blkaddr by clearing its bit
+5. fsck fixes the bitmap
diff --git a/tests/f_sit_bad_valid_map/expect.in b/tests/f_sit_bad_valid_map/expect.in
new file mode 100644
index 000000000000..b9929839707e
--- /dev/null
+++ b/tests/f_sit_bad_valid_map/expect.in
@@ -0,0 +1,4 @@
+Info: Force to fix corruption
+[ASSERT] (check_block_count:x)  --> Wrong SIT valid blocks: segno=_SEGNO_, 512 vs. 511
+[ASSERT] (fsck_chk_data_blk:x)  --> SIT bitmap is 0x0. blk_addr[_BLKADDR_]
+Info: Force to fix corruption
diff --git a/tests/f_sit_bad_valid_map/script b/tests/f_sit_bad_valid_map/script
new file mode 100644
index 000000000000..8ce0b2016a9c
--- /dev/null
+++ b/tests/f_sit_bad_valid_map/script
@@ -0,0 +1,43 @@
+#!/bin/bash
+
+DESC="sit entry with invalid valid_map"
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
+offs=`offset_in_seg $blkaddr`
+idx=$((offs >> 3))
+mask=$((1 << (7 - (offs & 0x7))))
+
+val=`$INJECT --dry-run --sit 0 --blk $blkaddr --mb valid_map --idx $idx $META | \
+	grep "inject sit entry valid_map" | awk '{print $(NF-2)}'`
+echo "valid_map:$val mask:$mask" >> $LOG
+val=$((val & (~mask & 0xff)))
+echo "corrupt_map:$val" >> $LOG
+
+$INJECT --sit 0 --blk $blkaddr --mb valid_map --idx $idx --val $val $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+BLKADDR=`printf "0x%x" $blkaddr`
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_BLKADDR_/$BLKADDR/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
