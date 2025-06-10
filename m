Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A909AAD3C2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5fvPEZodeVa3Me74clYl+xSoton4DV+19eKguVsnGA=; b=YW/s17wndVdPXFjXHB2siIjWc9
	bP590BE7u86Mwa7zIMI+Jvg8ml6tOeqvqOM5ffVmC9CsMnm29juvZq0m+l1qsChgX6+XjsWzKqZ7T
	WzN0gImu2tR6pgvYogZnoM8u9/525EWrSdvo4y7Aq+xe5h1T5X/YFp78OjeBWEC+KpI0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0Xo-0007ui-54;
	Tue, 10 Jun 2025 15:05:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0Xm-0007uS-HE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ONWVZuAjxC8ZiagCjYNtzKsOygdZmyfqET1Utb8TyMA=; b=Af4hf5x2GDTpH0CUNsFydzmTtB
 Ydm72PQvXavSiwhZB23QEpsNSK4SqzYHd4GTN3MkToIItWEkmFkt+fbmRD8nPB9hRpHPinPC5nk/e
 9/YNS/Lrbq7sdeTPQGt2m30r0CIsiGNe3jpMGHykJ/kMbllh2ynj4roteQwp2L33YZHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ONWVZuAjxC8ZiagCjYNtzKsOygdZmyfqET1Utb8TyMA=; b=NPvk0i4vNIBLlMR2xYlCbUVF15
 7E9P0almKxvmpivE+Q6BNazL73CSo1ok1EixqcUfeV662F8n2wQ6fZqxTduATzjE/GkuYB5hu/Sad
 3nPHNKTG0yVEqWjypkghP7y3qEvEZTX3c4CwwTVvnggIKy7yjJ8dtWAOC5D3HYhHYMWg=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0Xm-0001zC-3a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:05:42 +0000
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a58e0b26c4so91153301cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749567931; x=1750172731; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONWVZuAjxC8ZiagCjYNtzKsOygdZmyfqET1Utb8TyMA=;
 b=e2iSVibZkLT+mTeyu67XBr/oWVsTSkq2z6gUSe037skZvgXwcj34uvSjqKeO//JNFG
 R2wbrQanX21LvvElDNR2exfZgxmtYCn2Lsd7tBzfAWyiRMSyIqQhyo1d0n5X7SKKSOyy
 LZeM2Wwsfvnzi3/TDTJMpBvrAQFT2wvZKlWCtcjmbQds0h+CGckod1qJMq7DbwYOGIK3
 +J9AdQ2mo+1ikJVJFLfgYcOHcQU8yfjQdd+zWuf96UJ+Z0tZKo7+PLjdT2NSyDts+v09
 xVANWZx6/5N3WHJcRP5V9srFkokFLsWLVJNb8ResKkOfQvgdrsNi5Tez2V9LQgVXQdmM
 8CQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749567931; x=1750172731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ONWVZuAjxC8ZiagCjYNtzKsOygdZmyfqET1Utb8TyMA=;
 b=NpHfnD46+lyKmitzkNDkPFUeSpBH2T9DAFMSXRHxFCI0IOKV5vsNlF5pGkwWDf2KxQ
 T+qHpIAXgNOmi1CKNUrfo5gU2NxfKEob+WreUkwfQ5zMORKbrjp8cPV1mNPVb6DqW9o2
 bdzlsMiNb0av60mjunwevWO4nhRH4tV8zkQBuugIzGBXQABPnwxpI9aXBm8tkVxGPvoC
 ovT58029sohgkCbs+NMcQoIMz+g1mMpqeAoBcLxXfIQC3RnxubshPFDQkAGDuy6IJBfi
 1m2aWa81DmljQp4aVClaURRu28hQyj9vn7zOWNyX4jyDNBVB/uPll4AFxA4Q/UBOa4q4
 FcOQ==
X-Gm-Message-State: AOJu0YxuTI/AoA0LpiNXrQ1OeTL97J7BomH7vHJ1cXsRcALmCe/hEkVJ
 OnoGN9WBhz/TcqO9v3MSu05ezHXoKGAudjH4v0ZW3fvnIWkuftw7MdjJ4A96wA==
X-Gm-Gg: ASbGnct/++Dk5DJzTDvH1x/YAy0AA81pdOgOl54wNMF+YQZtYt4RUH1oBXTk+ttG4g/
 5fJtrO78V02gpCUsf4oVTyxOLiU4WxDY5t6j2hLRVAaKYwlbTW1Yq2ioWbSGfkgCCT7HVRvZlkl
 EI+drac7XpQ/wBrI99IwbxjQ5VNRbRxFz4QpmCn6bkgBICPm5p8IRxY0RF4MhSyR/8IMRcAmGp4
 IZYPkHHKjZJllokIlx0wsq2QRt7OgvWdIl+J74XNIcbb/xc9C9cSZ5H0kvXmmz6xRwJX0iVsZoW
 EunfJAREypxcGSrvEAcm+QGlEwWTKAFfqrByWOwWEVUY1oA8ywb/p2UsMNI4Fj+i1hyF
X-Google-Smtp-Source: AGHT+IFW0OgYhXjHfLiujFcIDWIDPFG8XU0Ak9kwKA481G4jH6G20idIlTZn/qTGVS2Fp/iKkdPMXg==
X-Received: by 2002:a05:6a20:729f:b0:215:d611:5d9b with SMTP id
 adf61e73a8af0-21ee68a05d8mr23657801637.12.1749559131680; 
 Tue, 10 Jun 2025 05:38:51 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:51 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:35 +0800
Message-ID: <20250610123743.667183-26-shengyong1@xiaomi.com>
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
 tests/f_ssa_bad_ofs_in_node/README
 | 5 ++++ tests/f_ssa_bad_ofs_in_node/expect.in | 3 +++
 tests/f_ssa_bad_ofs_in_node/script
 | 36 +++++++++++++++++++++++++++ 3 files ch [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0Xm-0001zC-3a
Subject: [f2fs-dev] [RFC PATCH v2 25/32] tests: add fsck testcase of fixing
 sum entry ofs_in_node
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
 tests/f_ssa_bad_ofs_in_node/README    |  5 ++++
 tests/f_ssa_bad_ofs_in_node/expect.in |  3 +++
 tests/f_ssa_bad_ofs_in_node/script    | 36 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 tests/f_ssa_bad_ofs_in_node/README
 create mode 100644 tests/f_ssa_bad_ofs_in_node/expect.in
 create mode 100644 tests/f_ssa_bad_ofs_in_node/script

diff --git a/tests/f_ssa_bad_ofs_in_node/README b/tests/f_ssa_bad_ofs_in_node/README
new file mode 100644
index 000000000000..65fbf6aa4f1b
--- /dev/null
+++ b/tests/f_ssa_bad_ofs_in_node/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject ofs_in_node in the ssa entry of the blkaddr
+5. fsck fixes the ssa entry
diff --git a/tests/f_ssa_bad_ofs_in_node/expect.in b/tests/f_ssa_bad_ofs_in_node/expect.in
new file mode 100644
index 000000000000..3164031aebae
--- /dev/null
+++ b/tests/f_ssa_bad_ofs_in_node/expect.in
@@ -0,0 +1,3 @@
+Info: Force to fix corruption
+[ASSERT] (is_valid_ssa_data_blk: x)  --> Set data summary _SEGNO_ -> [_INO_] [0x0] [_OFS_IN_NODE_]
+Info: Force to fix corruption
diff --git a/tests/f_ssa_bad_ofs_in_node/script b/tests/f_ssa_bad_ofs_in_node/script
new file mode 100644
index 000000000000..1f5a60a2d342
--- /dev/null
+++ b/tests/f_ssa_bad_ofs_in_node/script
@@ -0,0 +1,36 @@
+#!/bin/bash
+
+DESC="ssa entry with invalid ofs_in_node"
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
+base=`echo "$node" | grep i_addr | head -n 1 | sed 's/i_addr\[\(0x[0-9a-f]\{1,\}\)\].*$/\1/g'`
+blkaddr=`get_mb_val "$node" 'i_addr\[0x100\]'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+$INJECT --ssa --blk $blkaddr --mb ofs_in_node --val 99 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+INO=`printf "0x%x" $ino`
+OFS_IN_NODE=`printf "0x%x" $((0x100 - base))`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_INO_/$INO/g" $TESTDIR/expect
+sed -i "s/_OFS_IN_NODE_/$OFS_IN_NODE/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
