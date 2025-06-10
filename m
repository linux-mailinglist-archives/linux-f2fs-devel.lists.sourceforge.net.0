Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB12AD3DBA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpo/eb9KJJ3ykWwlwgQU8Sso1x17q+H6wEst1U4531Y=; b=h9QGSrvcig3B+epQP7Ze1LHBD0
	EOslqNV2cDMi1dxkgc61ZSBfEM3D1GB9Q4IyiI213IJ7LAQdEKtg6ifJCfxYJnAEkVBqJnm7rdIZB
	aXdTksYSrsnzAxGv/ncONBsayIyXX/KZ++GvwCekgJyqX9mBmCyBqAkGSUXKfCrzUAwc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP19F-00075Z-OF;
	Tue, 10 Jun 2025 15:44:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP19E-00075S-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0x3b1l5jy79qRM5TPd5aERH5PA0eFVVgOVd3JdlBtZs=; b=glTFzuI4XEDXFqF3uRbHpnikPg
 ELrTnlFaKcoYJceqf+o9pwo9B6Uzle8MgphF+06w940Vl9A1aVg/APQvuBSx3S0qZaG5KfFFq1yo/
 RUF99/3ARM9I8QkA4X5vmyxnAmotUafXNWrtr5eOSHlgGD3Om0zWsp4enm5LP2P5804s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0x3b1l5jy79qRM5TPd5aERH5PA0eFVVgOVd3JdlBtZs=; b=K0+7fqyDbToflLDxX4x49R5HpW
 z+14AO1zu9p744LXf0kKaDMO6584aAz3qscxtxq5fdagwuTPBpLRVOY8cxphElXbWK64jmCsxO+KJ
 0NWwzC64Z7GaUEUYs5pGkaRUekfJswJVbRBMDJ1GwA8u8W2zrEUzfrg6bzTV7TS0XIxU=;
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP19E-0006wL-9i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:44:24 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2cc89c59cc0so3786289fac.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749570253; x=1750175053; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0x3b1l5jy79qRM5TPd5aERH5PA0eFVVgOVd3JdlBtZs=;
 b=hTzp3ucXiUPTNLRN+ssYjOnUD1pIPx0SN9SqcJwvqmx+ZbuAc3A0yhV8jdOs4BQChg
 hRYjqxvavEqCX3kxHR7G2uxUhmgxoDrebkVSDTnOdRDBVQLU8i+bCzlTc8Ylfdmyu2Bm
 9rJiYnUqmxQGN6BbG4+v8feo8X53kTbqHBhcPa/jaIRS2EKPl6SXkX/X4RilhUwacWtl
 eQszmxkB/hCLGVZcJ6N9AhkFxRDbFt1tmSyqBtXPpBstZmXhk9VBmoRpxdxfdF7RhV0w
 3BCCNb5rpH51IZ/kCcP1HEJyfKf/WUh3kuDB3oSvV6BdMBoPvIQ7iDt4BsSjCcsb0jmT
 B+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749570253; x=1750175053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0x3b1l5jy79qRM5TPd5aERH5PA0eFVVgOVd3JdlBtZs=;
 b=RKZZOij98puw/P6GgzeKbY3h9VhNREjCK7fj86TBNxxuC8fSCy7y+4U79NU2yTcgzc
 sNNgdzxMFR7mWOXTyBHBQg02Ck4+xaKo4HmctthfLU22QYEH3bxnb1OyF1J4JFJ3T2Sp
 BeqEhWbUGhLa1HrVLCK7BiOcLxDidfE2eh/h09wdv1ven2J9osdK/dEm2bsLmebDfpXu
 j52hdtTQfcz8TGA3cRUH+Rwx/PQrI6Q1JEvKTNYdNO43QYHjR6VHJLc23nDXonmKd9oE
 oj73Y/5wM3gl+nphyvx3GSTAZcAjAPNOOENe9KjZ7KWn1ImVItE+esRSXEG/CGOs4Auf
 cQ2Q==
X-Gm-Message-State: AOJu0Yz/kEfm9HhBnDKp22lZgKELhBlEpliOhs38zfIaBa8QtMT23spd
 W7sMziYRg947iPGYuIAnS4NqvywqZjxLAMBba0+fJzpGE9wip4TcZC/Q5VMnQg==
X-Gm-Gg: ASbGncvKgdClrDhP2msdBI+qGh5gw4k13QyJ3TMuVS5uzVG2gHe0AOBels3WKFmzAv/
 CnP+j5Lhb+7xDTbwEFuDfO4erOQpUP4+wqNlVjPE04lvdhB0AurseKltKwH8lRWhODmtSepZfCL
 7M5NvecrJ9hKRu0ySfStll9OqTEqwQkQawSwxoVSz4u6A1Po+fF5uD+dPzQKhheLgmG2U2qFI4d
 kYAfNxjNJxIFpvJgtw4YuvVmmW2nA5l/cXtXhCkaAlm5BmcfWBV3EXlTugEYe16LbnMsPhFPuEk
 hqF+Ie3QTHoVwYATorGAmxprRqICa1K4Xm2JWF87SnirPya2aQGAy1LuH5KjjCImvmMaSrrXLGW
 jCIU=
X-Google-Smtp-Source: AGHT+IF+7QK0B1WG44egfQOWzdR7Hd0GZuiWqlkD2wym8bm4CN4qDB0AEn3EyOY+i23I4u8j3hOv6A==
X-Received: by 2002:a05:6a00:4f81:b0:746:1c67:f6cb with SMTP id
 d2e1a72fcca58-7485ea435f8mr4566748b3a.5.1749559117809; 
 Tue, 10 Jun 2025 05:38:37 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:37 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:28 +0800
Message-ID: <20250610123743.667183-19-shengyong1@xiaomi.com>
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
 tests/f_nat_bad_ino/README
 | 4 ++++ tests/f_nat_bad_ino/expect.in | 12 ++++++++++++
 tests/f_nat_bad_ino/script
 | 31 +++++++++++++++++++++++++++++++ 3 files changed, 47 [...] 
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
 [209.85.160.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP19E-0006wL-9i
Subject: [f2fs-dev] [RFC PATCH v2 18/32] tests: add fsck testcase of fixing
 nat entry with invalid ino
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
 tests/f_nat_bad_ino/README    |  4 ++++
 tests/f_nat_bad_ino/expect.in | 12 ++++++++++++
 tests/f_nat_bad_ino/script    | 31 +++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 tests/f_nat_bad_ino/README
 create mode 100644 tests/f_nat_bad_ino/expect.in
 create mode 100644 tests/f_nat_bad_ino/script

diff --git a/tests/f_nat_bad_ino/README b/tests/f_nat_bad_ino/README
new file mode 100644
index 000000000000..b97015297b25
--- /dev/null
+++ b/tests/f_nat_bad_ino/README
@@ -0,0 +1,4 @@
+1. create f2fs image
+2. mount f2fs and create a regular file
+3. inject ino in nat entry with value 0x12345 of the regular file
+4. fsck fixes the nat entry by nullifying it
diff --git a/tests/f_nat_bad_ino/expect.in b/tests/f_nat_bad_ino/expect.in
new file mode 100644
index 000000000000..4a70b0b27cff
--- /dev/null
+++ b/tests/f_nat_bad_ino/expect.in
@@ -0,0 +1,12 @@
+Info: Force to fix corruption
+[ASSERT] (sanity_check_nid: x)  --> nid[_INO_] nat_entry->ino[0x12345] footer.ino[_INO_]
+[FIX] (__chk_dentries:x)  --> Unlink [_INO_] - testfile len[0x8], type[0x1]
+[fsck_chk_quota_files:x] Fixing Quota file ([  0] ino [0x4])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x4] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  1] ino [0x5])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x5] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  2] ino [0x6])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x6] in NAT
+NID[_INO_] is unreachable, blkaddr:_BLK_
+[FIX] (nullify_nat_entry:x)  --> Remove nid [_INO_] in NAT
+Info: Force to fix corruption
diff --git a/tests/f_nat_bad_ino/script b/tests/f_nat_bad_ino/script
new file mode 100644
index 000000000000..ded5b2a602fb
--- /dev/null
+++ b/tests/f_nat_bad_ino/script
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+DESC="nat entry with invalid ino"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+touch $TESTDIR/mntdir/testfile
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG
+rm -rf $TESTDIR/mntdir
+
+blk=`$DUMP $DUMP_OPTS -i $ino -d 1 $META | grep nat_entry.block_addr | \
+	sed 's/.*nat_entry\.block_addr[[:space:]]*\[\(0x[0-9a-f]\{1,\}\)\]/\1/g'`
+
+echo "ino:$ino blk:$blk" >> $LOG
+
+$INJECT --nat 0 --nid $ino --mb ino --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+INO=`printf "0x%x" $ino`
+sed "s/_INO_/$INO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_BLK_/$blk/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
