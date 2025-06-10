Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF8AD3D1E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WDl8XPUoKUlFXEVvCw75Z9SMU9a5+RN4N3og4tPJw4=; b=ml8oh7GgtICvf4sxrp+28L1dnJ
	c+ahCigrptfdjuqqnsJWSabCYtYMBL/pUlzj5WBFJhL9mMY43F02V9FIgn2v+hDGqwD8IXHbaucRi
	reiBbYCs5kLC58Iq3/XZUnysin0bMrIPIaJVj8K9qajFoS7ceROfr/GY+dFoazMdH2iY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0vZ-00088e-A8;
	Tue, 10 Jun 2025 15:30:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0vP-00088K-2t
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJFbTBmDlEg0ux/1WwUCkV4agohXALZA3Lm6OECcADc=; b=RVxbcQtawpaEDgsXduTXZvjRJ0
 Got0Tv1TynvPx4+7tFLh6OlcWmwBMRNS09oQNO6pmUK6LMoVq5W1RDq82rvD3bbWp+PK5IA4OIgGl
 aeNnU5RSrTnNCG71tp8vvOc/CmsaMNhhXSB4c9fLxK4jbmxj1B4IcfVfVf7cQuad95Fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pJFbTBmDlEg0ux/1WwUCkV4agohXALZA3Lm6OECcADc=; b=YXLmmGr2Rh5ku4enf6l5MgUmir
 qpZIEslyFIHmKNz+/ZK+Y4U1I1Q4aKBVhtaoN9eK2pRyoHC+aVekDrERgVBPuEoO7cT1OJEHcNqRh
 zFBKXAPZV2J4xO6M14bri+diIGe+dVYVvakgIdqla1hdgc4VNxKJc4vwZFO2e4N+uipw=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0vO-00056K-LB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:30:07 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4a43cbc1ab0so69460331cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569396; x=1750174196; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJFbTBmDlEg0ux/1WwUCkV4agohXALZA3Lm6OECcADc=;
 b=nTEgM43WstlITm+wNeJ3WLNBYCKYMx830I1aC/ViJ5fzQoKC/V0jWQIy2BNsK/7uSa
 pFVmS+X5ceDg0QLNmlqD/eQlASN0Z4jwW0utXRPPH5qan2wPQ58HOug4bOE0biGZnOrT
 yBSMAl8v6OIVhq8Bcpn1OCDpE541mXqxw1EUkGljPjKB06p5w9rqCeopRkW9mdT6u4VN
 4qwrpeFmTFi7XK8oBXrfkuBJJqr+aX0VArumQ13CuYaVXS6J8arLKvUxIOFQY7O8tREK
 CTxzPtKx6gqY6xfm7skex1vtxx2P0DtHViLD5zwKlmjGpeI26IUuTM55On1LMgfuQSWC
 mdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569396; x=1750174196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJFbTBmDlEg0ux/1WwUCkV4agohXALZA3Lm6OECcADc=;
 b=R1yyGQP1sFv81rzOZEYS0E6s+jzbccoemM6MDoyVG4Fa1RpxSJd2RMZCbHfZzDsB5Q
 6FjSvt20koDwpv0DZ6NIBlfvkC2Bzj6fifdc0//wzpfVG6yeDn+v+1FCQ/iGv37xJhRH
 4hSwZZp+TTng/+qCmQ2KB5LkImhww4GwUicMwXFAwyYMVccamyXsFO0OX+oQDOELf0ps
 XKl+YGwXo03OV39Mc/G0g7JKF89mqRFNQGLLmN5tSuXVPgh5NK+cPrjaVKE9PG2KmgCT
 zmTA35ZwOyX2S5eKPRFPSkj/Ge9qzN/V51am8hC5wSFZPtWJkNQBIDJUkqGH0dFTm1mu
 H49Q==
X-Gm-Message-State: AOJu0YxPwGvBW4FRxNbFZub1KdagQ2UZSqDc88au3ZdvhUHPBndzWL/V
 VgLVAUX5VxpBGvhR42g7ZokVp8SMoPjBS7uV/06PoWZhmDsYnvDFs2z8nrnj3g==
X-Gm-Gg: ASbGnct/cxKyDrWH4x9kK2wQgBO0tPHyOIxRTTt5A7JlfO1O1orqFweqP0Y4UMI4eKO
 6lZDPL/1xNaMN9K8/6sm+HgVO8EuLAImHElET0GicMhuP5bUfbA8UQOwWZ7Aa8KA8wIOHD1CfJJ
 SnMIrA1Y4zigUUIf1vRyAyP2tx0Q9EPo7RJrAgPhaMl6O+OtJ0nXZ13oQ+ziJT6qug0RCuhYQTV
 HQ/wT4TyEkGpX5mFQCIkrcBFMbPSjB8zYJQ8fNHDaSOXUY1NQqA7NGW8L7BB41Rk2yl05fIYAcN
 zPlb7TyKNcLbNM4Pt4szEoFeq92xyjnUHrNcH0O0e/owUyGnkijpx8NfT62imbaPaDaz
X-Google-Smtp-Source: AGHT+IG4xIXqvQhSMICGOpLzhucS1bU2YmduU+LOPtC26tZl3kEGDgmZNysXrfNdQ7nfuvQX2h/i2A==
X-Received: by 2002:a05:6a00:1390:b0:742:a77b:8bc with SMTP id
 d2e1a72fcca58-74827e4e02bmr21371146b3a.2.1749559133630; 
 Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:36 +0800
Message-ID: <20250610123743.667183-27-shengyong1@xiaomi.com>
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
 tests/f_inode_bad_iaddr/README
 | 6 ++++ tests/f_inode_bad_iaddr/expect.in | 13 ++++++++
 tests/f_inode_bad_iaddr/script
 | 50 +++++++++++++++++++++++++++++++ 3 files chan [...] 
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
 [209.85.160.171 listed in wl.mailspike.net]
X-Headers-End: 1uP0vO-00056K-LB
Subject: [f2fs-dev] [RFC PATCH v2 26/32] tests: add fsck testcase of fixing
 inode invalid i_addr
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
 tests/f_inode_bad_iaddr/README    |  6 ++++
 tests/f_inode_bad_iaddr/expect.in | 13 ++++++++
 tests/f_inode_bad_iaddr/script    | 50 +++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 tests/f_inode_bad_iaddr/README
 create mode 100644 tests/f_inode_bad_iaddr/expect.in
 create mode 100644 tests/f_inode_bad_iaddr/script

diff --git a/tests/f_inode_bad_iaddr/README b/tests/f_inode_bad_iaddr/README
new file mode 100644
index 000000000000..5ada3226ab5d
--- /dev/null
+++ b/tests/f_inode_bad_iaddr/README
@@ -0,0 +1,6 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject i_addr[0x100] of the inode with an invalid value
+5. fsck fixes the inode by nullify i_addr[0x100]
+6. check if i_addr[0x100] is 0
diff --git a/tests/f_inode_bad_iaddr/expect.in b/tests/f_inode_bad_iaddr/expect.in
new file mode 100644
index 000000000000..4a79f671a651
--- /dev/null
+++ b/tests/f_inode_bad_iaddr/expect.in
@@ -0,0 +1,13 @@
+Info: Force to fix corruption
+[ASSERT] (fsck_chk_data_blk:x)  --> blkaddress is not valid. [0x12345]
+[FIX] (fsck_chk_inode_blk:x)  --> [_INO_] i_addr[256] = NULL_ADDR
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_ has wrong ext: [pgofs:_PGOFS_, blk:_BLK_, len:_LEN_]
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_ has i_blocks: 0x00000202, but has 0x201 blocks
+[FIX] (fsck_chk_inode_blk:x)  --> [_INO_] i_blocks=0x00000202 -> 0x201
+[fsck_chk_quota_files:x] Fixing Quota file ([  0] ino [0x4])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x4] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  1] ino [0x5])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x5] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  2] ino [0x6])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x6] in NAT
+Info: Force to fix corruption
diff --git a/tests/f_inode_bad_iaddr/script b/tests/f_inode_bad_iaddr/script
new file mode 100644
index 000000000000..7c9e67d0eccc
--- /dev/null
+++ b/tests/f_inode_bad_iaddr/script
@@ -0,0 +1,50 @@
+#!/bin/bash
+
+DESC="inode with invalid i_addr"
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
+ext=`get_mb "$node" 'i_ext:'`
+pgofs=`echo $ext | sed 's/.*fofs:\([0-9a-fA-F]\{1,\}\).*/0x\1/g'`
+blk=`echo $ext | sed 's/.*blkaddr:\([0-9a-fA-F]\{1,\}\).*/0x\1/g'`
+len=`echo $ext | sed 's/.*len:\([0-9a-fA-F]\{1,\}\).*/0x\1/g'`
+echo "ino:$ino blkaddr:$blkaddr ext:$ext" >> $LOG
+
+$INJECT --node --nid $ino --mb i_addr --idx 0x100 --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+INO=`printf "0x%x" $ino`
+PGOFS=$((pgofs))
+BLK=$((blk))
+LEN=$((len))
+sed "s/_INO_/$INO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_PGOFS_/$PGOFS/g" $TESTDIR/expect
+sed -i "s/_BLK_/$BLK/g" $TESTDIR/expect
+sed -i "s/_LEN_/$LEN/g" $TESTDIR/expect
+
+node=`$DUMP $DUMP_OPTS -i $ino $META`
+echo "$node" >> $LOG
+new_blkaddr=`get_mb_val "$node" 'i_addr\[0x100\]'`
+
+# if i_addr is 0, dump.f2fs hides this i_addr slot
+if [ x"$new_blkaddr" != x"" ]; then
+	echo "old_blkaddr: $blkaddr" >> $OUT
+	echo "new_blkaddr: $new_blkaddr" >> $OUT
+fi
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
