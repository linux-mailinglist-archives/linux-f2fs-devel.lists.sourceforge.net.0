Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1BAD3CAB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dmw8agDG44Hm3dfDL06yukLFr3L6lo2HBoVZezubafA=; b=RibXYfJaEKOIdfabqwxRV7wMra
	TyeL2+CVJjCvV1Q6xhV/SjI0LR1E910GXn575YkhOy497n6vj8bLGaFy5AOqi+y5qx111eMkH4tdw
	kKQ4GOw6FEurnZODeMWf6NJI2NGd3g2VU0/sAZxAcTalQVXbrdR/oyazp5eacy1mP5J4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0mZ-0007qN-Ri;
	Tue, 10 Jun 2025 15:20:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0mY-0007qB-3g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9QSikTGJPCNN+TYa621bI/6gjoqFqeD728gxzetz50M=; b=ltNlxs7QE0qTUeeTV6JBDMWuWL
 g8+92yapkrvhX8vjEigTegMVZcldX27IvhuMrUeGw331nn9YXxE4O3B6fYO0VP0zH7pRlRYhH8384
 jMoi579KcKhVWFDvJbUFaYjJGNFmEprae8wVEYuFtEVxJCb6LMjEu+5EdsCY8pEwsWbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9QSikTGJPCNN+TYa621bI/6gjoqFqeD728gxzetz50M=; b=jcmUDmTOHp7wuzch3eh8+pryqz
 vqFhQISaG3DMM0z+cijCprt5H9AB+jV2sURI3fKXa3TTeNbqAyp13aKjd7U4CTBOvKaC9yTP13JZ3
 Uppaldd7/ZAG1f1BjL11eu5qi1JRh1P1pRrMEZWguzommPXrjpVNvlzj2P7yBw3z1llA=;
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0mX-0003zZ-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:20:58 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2ea2fee5471so1689072fac.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568847; x=1750173647; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QSikTGJPCNN+TYa621bI/6gjoqFqeD728gxzetz50M=;
 b=DkTResMGGkTxSA9bo+vrUpOyO/KSDhBMuegANvqtluZFeY1ruaUzRp2ZogH2z4Plj0
 Dy4pHgB9aMJfIetE6gH84AfxeH/7lzNmzUsQksbqPIhrUjOEqLfYkLXqmJKMr3PunstC
 Ze+7rzv6hkayWUatxAuw1JLkiMufwtCytwDQ7fx7q0WnwFZbCR/yvgj1Ox7XgJ7VMsHC
 HO1KDjXBQEWn6YA+y2tPEZlEurXL9VrRn73mRiaZukYc03CusyndewRmueR65avCgfju
 MNDjAqszTf5Fxwc/hiixdRj98g4M0lfL28jP/5B/xloirdOKz8XGzEhwxadK/8xrcC+i
 6p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568847; x=1750173647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QSikTGJPCNN+TYa621bI/6gjoqFqeD728gxzetz50M=;
 b=d0qbY3m8EgnjYC/Dpew4nAVPhHgV2HSYKgogW3MGXm5Idxj8jnQ8TUfRyIaB388tNJ
 G7fFy2JohUOJVrulCEhmnByD6OOlDZDuewkcQegW/QWxqGFShBHFXQSZ+U8aV/LyrsZe
 91drFacJyFvF5iZC4JHTALrvsTF5zYjABAlGaSiT04RoljLurykq0DFQ97/wY8+FxqCG
 ql3xPuZfktZUgKhbEWOo9vKJ/xDBUv5oISu3KSihpDW8CvmLkyNkxH8zbDxuDJ4KE5h7
 v7Fvz6ayhUmo7UVLfDDHhPygeWfuhF8I+JG5apBLDF4Evak8A2I9FC+oDNkpT7Dvj9Ki
 cr7Q==
X-Gm-Message-State: AOJu0YwPrBdFXeIi2OVIcxoUmHavkImoBHLeHduhbRkKzygxH9Qp02V7
 ujCnuv9CFj4tgijWbiJAmNwJ34dNRFtaMTa2bRl7UYdzmmqKFu0UOXj2YxJZNQ==
X-Gm-Gg: ASbGncuERwSqnqnTcFfvhrNWHRCMU9INaLBe0HzLvGwPVQ6sHjjC6cKisnDkkB1cUwt
 0fGtShIrogDDFRn2np62LL43PvkI+CFIPHJcFoZI3mqY2VBFvZKzCEyl+Z9QEFEkVPXrpXlz+Ev
 E2+IouXZOt0bIxGDvvDdd86lU3AH7yvg6IJTnZtrhVRbnMHE/Sds8y4RV3DqzErtP0wjMENKVgU
 zg1iKFLhrRq83HCIO9rq9dSIN+KcW6a1TExEiUkp6MqdTUrhBBW94rPOrWFQD4XyTNeXvZkMazr
 xVfri3LyTHtnFmhjixoNMHbY5r10BFYHDoC3XMnHcDECBt/+W8Lnhekgbe76NJ+NJqU+
X-Google-Smtp-Source: AGHT+IG9MrtVMRw/X7PvC0ZwleXQWZBPYqSRPKulKjB0hEcaHGrfoMW4d/QzhXxZl0mweM3jPniPUw==
X-Received: by 2002:a05:6a00:1822:b0:736:5969:2b6f with SMTP id
 d2e1a72fcca58-7485ea624c9mr4216784b3a.6.1749559139476; 
 Tue, 10 Jun 2025 05:38:59 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:59 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:39 +0800
Message-ID: <20250610123743.667183-30-shengyong1@xiaomi.com>
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
 tests/f_dentry_dup_dots/README
 | 11 +++++++ tests/f_dentry_dup_dots/expect.in | 26 ++++++++++++++++
 tests/f_dentry_dup_dots/script
 | 49 +++++++++++++++++++++++++++++++ [...] 
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
 [209.85.160.47 listed in wl.mailspike.net]
X-Headers-End: 1uP0mX-0003zZ-J0
Subject: [f2fs-dev] [RFC PATCH v2 29/32] tests: add fsck testcase of fixing
 duplicated dots
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
 tests/f_dentry_dup_dots/README    | 11 +++++++
 tests/f_dentry_dup_dots/expect.in | 26 ++++++++++++++++
 tests/f_dentry_dup_dots/script    | 49 +++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 tests/f_dentry_dup_dots/README
 create mode 100644 tests/f_dentry_dup_dots/expect.in
 create mode 100644 tests/f_dentry_dup_dots/script

diff --git a/tests/f_dentry_dup_dots/README b/tests/f_dentry_dup_dots/README
new file mode 100644
index 000000000000..e36526625ca6
--- /dev/null
+++ b/tests/f_dentry_dup_dots/README
@@ -0,0 +1,11 @@
+1. create f2fs image
+2. mount f2fs
+3. create a directory, and create a file in it
+4. inject dot dentry in the directory by changing its d_ino to the dotdot's ino
+5. fsck fixes the dot's d_ino
+6. inject dotdot dentry in the directory by changing its d_ino to the dot's ino
+7. fsck fixes the dotdot's d_ino
+8. inject dot dentry in the directory by changing its filename to ".."
+9. fsck fixes it by deleting duplicated dotdot dentry and adding a new dot dentry
+10. inject dotdot dentry in the directory by changing its filename to "."
+11. fsck fixes it by deleting duplicated dot dentry and adding a new dotdot dentry
diff --git a/tests/f_dentry_dup_dots/expect.in b/tests/f_dentry_dup_dots/expect.in
new file mode 100644
index 000000000000..5af443df7d12
--- /dev/null
+++ b/tests/f_dentry_dup_dots/expect.in
@@ -0,0 +1,26 @@
+Info: Force to fix corruption
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_PINO_HEX_] for '.', parent_ino is [_INO_HEX_]
+Info: Force to fix corruption
+Info: Force to fix corruption
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_INO_HEX_] for '..', parent parent ino is [_PINO_HEX_]
+Info: Force to fix corruption
+Info: Force to fix corruption
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_INO_HEX_] for '..', parent parent ino is [_PINO_HEX_]
+[ASSERT] (__chk_dentries:x)  --> More than one '..', should delete the extra one, i: 1, ino:_PINO_DEC_
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 0, dotdot: 1
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '.' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+[fsck_chk_quota_files:x] Fixing Quota file ([  0] ino [0x4])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x4] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  1] ino [0x5])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x5] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  2] ino [0x6])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x6] in NAT
+Info: Force to fix corruption
+Info: Force to fix corruption
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_PINO_HEX_] for '.', parent_ino is [_INO_HEX_]
+[ASSERT] (__chk_dentries:x)  --> More than one '.', should delete the extra one, i: 1, ino:_INO_DEC_
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 1, dotdot: 0
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '..' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+Info: Force to fix corruption
diff --git a/tests/f_dentry_dup_dots/script b/tests/f_dentry_dup_dots/script
new file mode 100644
index 000000000000..881bb50f8705
--- /dev/null
+++ b/tests/f_dentry_dup_dots/script
@@ -0,0 +1,49 @@
+#!/bin/bash
+
+DESC="directory duplicated dot or dotdot"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+mkdir $TESTDIR/mntdir/testdir
+touch $TESTDIR/mntdir/testdir/testfile
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir`
+pino=`stat -c "%i" $TESTDIR/mntdir/testdir/..`
+safe_umount $TESTDIR/mntdir >> $LOG
+rm -rf  $TESTDIR/mntdir
+
+echo "ino:$ino pino:$pino" >> $LOG
+
+# inject dot's d_ino
+$INJECT --dent --nid $ino --mb d_ino --dots 1 --val $pino $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+
+# inject dotdot's d_ino
+$INJECT --dent --nid $ino --mb d_ino --dots 2 --val $ino $META >> $LOG
+$FSCK $FSCK_OPTS -f $META >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+
+# inject dot's filename
+$INJECT --dent --nid $ino --mb filename --dots 1 --str ".." $META >> $LOG
+$FSCK $FSCK_OPTS -f $META >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+
+# inject dotdot's filename
+$INJECT --dent --nid $ino --mb filename --dots 2 --str "." $META >> $LOG
+$FSCK $FSCK_OPTS -f $META >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+INO_HEX=`printf "0x%x" $ino`
+PINO_HEX=`printf "0x%x" $pino`
+sed "s/_INO_DEC_/$ino/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_PINO_DEC_/$pino/g" $TESTDIR/expect
+sed -i "s/_INO_HEX_/$INO_HEX/g" $TESTDIR/expect
+sed -i "s/_PINO_HEX_/$PINO_HEX/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
