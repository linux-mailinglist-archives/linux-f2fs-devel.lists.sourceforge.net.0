Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97FAD3CBD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhaFwF3tKeCRmmHu9ZPJ0zCNiGteIh4EHWB4oY8eqo0=; b=Dja52qbDtldiZYlKHNhBknxhl/
	o/DHC4/WTg6p5oM7kX7eWbdApFFNDZ0Js7fe2OpXRlYda7zfqoJ/Zr+4F40ZVeX+5rBJICXLGWXfv
	lFC4o2rJ26VnWtQCKntiJSexuc0zJL2XYa6PW/k2IqQfMGj2L5CPcPZ6639TWm9NnQNU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0o7-0006Hm-6r;
	Tue, 10 Jun 2025 15:22:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0o4-0006Hg-TU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZqpKeTF7lzc6+zgM7ERKE8HwGmcq4UOoT90nUhiXPLA=; b=UFKtAa17lpQdpC/YkifeyK1hmc
 juvTB9LcJIGGBOhkcSc0jyyEoh6v3s/IbxNwB28QXwKySuo/yFIJYRlIGed/WADL7vx9px7hiHIys
 nFtpNjyQTCN/ISXZR1QnIPqU+7WoGVquFN5MXEfqF1AfzeIdBkhjOTdv0RGESf93iBjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZqpKeTF7lzc6+zgM7ERKE8HwGmcq4UOoT90nUhiXPLA=; b=JAB/qA17sNmHwDriDC15z0W4Du
 fWb+fkqPfdMKV2qQeZBLngS9H00WSaUVXjHAUkZp/056e00LgP7BYm/jvzFPXVpwMu7xisGU/jfjw
 qog0gfIHy78fpIzSwqoFVALxSbiFBEkLvvWLCWTRxOl5uAPSz8sWwY1diOmYXgnCf9AQ=;
Received: from mail-vk1-f169.google.com ([209.85.221.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0o4-0004Bn-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:22:32 +0000
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so3891673e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568941; x=1750173741; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqpKeTF7lzc6+zgM7ERKE8HwGmcq4UOoT90nUhiXPLA=;
 b=nGedDJrDjpwNg1MAwKWvYlYxuSMseXbDQ+r6zq7e5iFlPmnxezs6kUBmYrUJEhXXsA
 3nZhuiDQAaX/8sNH4q1EM8dQqh8lBiTtLhnUvTFdL9YmEzqNRsgzFR4CAt8LheKS1FVC
 oxUmAPz8q0gVvywUMeOAQJjJryd80b6uaPogOsdQ1kypmMPxdwv3jXt3S3q51HYYGM4t
 r4eRpBc5Fpq7+PGB23e5T0cbvubOQ7GIy6d5IAS5lVWid7DIttC2FIvXAkRc0d4XJvLW
 E4ZgnBoBbODzXmvnyTLIKQsRTx4SE0uJEDGvrE5SBNxpU78lRjiAhreRWtmvcCPiJOR2
 JbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568941; x=1750173741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqpKeTF7lzc6+zgM7ERKE8HwGmcq4UOoT90nUhiXPLA=;
 b=vRQLAyi8fqRIzcDKO0zzw86NlRQp/CLEUj2tC+uCXJlQYn5scV4xPYZHhd39u0XA+e
 3L4J3aakVHt3EJPMXEad4HfXzwLhaoEIUb/XdzgfnYIN6SiSH60VtY942/iPlA7O6Vbg
 CCci4Qr5CXhbCpBfGYROYUw+npiijRrUuCDvdG/CeXLQ7IR0AaIB3EtYTiKiXWHQpQ22
 I71R+SCu/P8NlCsIV3FlOxjo5ljYqmy2nZf0iiz6f5SAluu7zrEI1iIiTokho8d+/dcr
 f3r/EqX+kkEQuck8eJHRFog1VLupXTFuugQJNvBnC/ngQP8m/F9MLMkMdpSt0sYn4u+3
 0F0A==
X-Gm-Message-State: AOJu0Yw2dWagq+mhmELlfVqcvdA+0mgSjNHaC9GGj6kPXF6ZWSOUC7pR
 InFflfk8/aE9eJHku7MV5yzD020F5/uHQTpxDJqIZqDvY5hBEIh5PXQzcGvI/g==
X-Gm-Gg: ASbGncsIRTIe4cvKxDPovLzO0/fioKVQeKyVAK+qSmzJ6lGquxP1Br2Hx6XdY1Rh7oD
 hXd1Qrwt2EkNpnc6u2gvGRjCnONtzYfGNnZfSi6Nliv9MAN1pq0o4ElLUvUjaaLocjWqLz3lriS
 pa1HwjRow+QPOWp0DunJppLRgyGuveBh5oDweb6ab1F+PdIILCTCNyEDZHYRptt4sSQBHnuBKOh
 cHXoHtuxtmYRWVOuuG+CGZpubLx1WX5/H6aAyOTIwyGZtHFKntyzC+/hWJSFhgwgUVOK7dBQDdu
 /UayxgwsoooT/vOOdQv87q7FP0JbPb4Qn2m/IbaBHtJjJkLyiDI7QUXoKAatcMGd6PtXqncU22B
 nzuE=
X-Google-Smtp-Source: AGHT+IEBVD9iw1Kmr12ENyYB8Of4YRmjyLIlUFG1wCDeoKc0lNcJ97APdaDfeKgvFyaMV09nIn/2dA==
X-Received: by 2002:a05:6a00:c91:b0:742:a0cf:7753 with SMTP id
 d2e1a72fcca58-74827e4df46mr24975895b3a.3.1749559127783; 
 Tue, 10 Jun 2025 05:38:47 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:47 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:33 +0800
Message-ID: <20250610123743.667183-24-shengyong1@xiaomi.com>
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
 tests/f_ssa_bad_nid/README
 | 5 +++++ tests/f_ssa_bad_nid/expect.in | 3 +++ tests/f_ssa_bad_nid/script
 | 36 +++++++++++++++++++++++++++++++++++ 3 files changed, 44 inser [...] 
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
 [209.85.221.169 listed in wl.mailspike.net]
X-Headers-End: 1uP0o4-0004Bn-Fr
Subject: [f2fs-dev] [RFC PATCH v2 23/32] tests: add fsck testcase of fixing
 sum entry nid
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
 tests/f_ssa_bad_nid/README    |  5 +++++
 tests/f_ssa_bad_nid/expect.in |  3 +++
 tests/f_ssa_bad_nid/script    | 36 +++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 tests/f_ssa_bad_nid/README
 create mode 100644 tests/f_ssa_bad_nid/expect.in
 create mode 100644 tests/f_ssa_bad_nid/script

diff --git a/tests/f_ssa_bad_nid/README b/tests/f_ssa_bad_nid/README
new file mode 100644
index 000000000000..d30e41c77c63
--- /dev/null
+++ b/tests/f_ssa_bad_nid/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject nid in the ssa entry of the blkaddr with an unused nid
+5. fsck fixes the ssa entry
diff --git a/tests/f_ssa_bad_nid/expect.in b/tests/f_ssa_bad_nid/expect.in
new file mode 100644
index 000000000000..3164031aebae
--- /dev/null
+++ b/tests/f_ssa_bad_nid/expect.in
@@ -0,0 +1,3 @@
+Info: Force to fix corruption
+[ASSERT] (is_valid_ssa_data_blk: x)  --> Set data summary _SEGNO_ -> [_INO_] [0x0] [_OFS_IN_NODE_]
+Info: Force to fix corruption
diff --git a/tests/f_ssa_bad_nid/script b/tests/f_ssa_bad_nid/script
new file mode 100644
index 000000000000..a5322c85956a
--- /dev/null
+++ b/tests/f_ssa_bad_nid/script
@@ -0,0 +1,36 @@
+#!/bin/bash
+
+DESC="ssa entry with invalid nid"
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
+$INJECT --ssa --blk $blkaddr --mb nid --val $((ino + 100)) $META >> $LOG
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
