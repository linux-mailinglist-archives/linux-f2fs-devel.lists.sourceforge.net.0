Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7ADAD3CAE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTa2az92XEguJRQ8rIh9eRElEDucbK+nqfFwS4ynxq0=; b=O5NsAKzqXQitVC3QMsnJnlvwDl
	VA7105ppPqA1p0iDd4b30B/+M3gbEGVLAJrfmTMeX+z3GOdDL6E794zexjVha+trHh6hWaxgA2Xbt
	NZ0tq4QvrKQJ33SsIOzTGAGshonp3UsMXkpGuOrKK0u01qgUNhO2F6JSTWhk4wYS8OBI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0n4-0006EK-1N;
	Tue, 10 Jun 2025 15:21:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0n2-0006EC-9O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jUihtedqGG7Eltxntk1PdtIBYi3N4bQKIHs5UFNNgAk=; b=b18GNJ3QYpRDLNFe4jPaAdbPtN
 QybIa0MaK7Y+qlWcsISFhP4xUor3lI2aL50pNeM5/5aKNkjw1HF8uEx5ywHcZiM7jygVIZPo910UQ
 6eFB4/sQph73faX4lHmtbVw58x9deHqpFTP/JTvI0qSts7Pj1recuML74g/9f5vHIgM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jUihtedqGG7Eltxntk1PdtIBYi3N4bQKIHs5UFNNgAk=; b=AhGyE+e11pcyHdZi0zv/Rvptun
 PcJFbOfdNqzWifSbWbmYaGpcp0+wQpq5sO/jlFwWYU1Bf6yMtGdwFDZDK+C1zqKeyWdr7nxEPqrCT
 U6Cm7YF6mWyk8+SDWB2Y3MraPRJCUGyqcy7ZbN8n6v4WkI74Z5OcYUWr1IwWceXfaKUM=;
Received: from mail-yw1-f172.google.com ([209.85.128.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0n1-00043R-SB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:21:28 +0000
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7113ac6d4b3so4701337b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568877; x=1750173677; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUihtedqGG7Eltxntk1PdtIBYi3N4bQKIHs5UFNNgAk=;
 b=kCKwP+6/zaMrRx0PQGu4FRP0rzyNUapmkLZIhWfMlDXvoH8gFuGwwdvi68kxp8OPsO
 WjMbDA4GU/p2TdGw6hoVh9VhDFC3TzwT1Uvr/zmW0fFm17F6uP5gBbiGCvDteoH8OZVs
 UU6pCWBCaVC7IT1ouTiLKdh6MLeb2iykzN3++QNdE2JOWaSsNJtA0JTuAFVyfdRBeAOE
 T7eXXCQ0SUdSYP0lTKx7OOUBcpVNZRGYeckp97nibX2A0PasrkyoAZMK1srUKs5nSrcS
 IX2HeZ/EotB84vtDro80K717912Zl6lfJmRp1R3Rh5Ml0kR7Cs4soNAqiuo43khQPe2M
 rMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568877; x=1750173677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUihtedqGG7Eltxntk1PdtIBYi3N4bQKIHs5UFNNgAk=;
 b=jNzaUvvmtKnw1X3gZlAYqz9qEc05taZuQtiZEfPWQeJr/30EEMEpjJr6Ny5gYY0n+r
 Ia2466/ykBv4IoTkVw7EhGwGFcMxV1xooYLzPXwIO0xNNpuHMeAG0sWBOAMtlQve7ceh
 pWggXCZPnhArCQZpSiOgbuEOAEjX/g7PlVvcIUZMNbr9ZEabGvZPy285aIlKVy8WyY6j
 62kMLbH6kttD1yLEB4LfkN80CUw9Qv5ihGkW9WqkSIbuX9BMfJ+kXOCn0lxfdNRt9sgA
 qQQMuQeYK72nsnJEHwgSfs8+HCF20s05NqJzbu5EwNbcrAOvAdtg4pghoA6uWeWLs+18
 goEg==
X-Gm-Message-State: AOJu0YwA5OyCM5Q3V6BZC/2Xh9TtsiIBw+oFPxPN8FxEisEAI1bc6OWG
 oI2FBLn5MJKVTJFYBd4XgQXeT5uasjggXqTCX3hfSF3RQPRHimHRK7fLVr1pKg==
X-Gm-Gg: ASbGnctIiFyxmoUxNviqqNKiGJcyTBtqfJIYv6W2lm9OIJWGpIgfc7pcabuc/xbBj7J
 SyyI7tPEGPLtzFtPT1s1aCUau3sBytv9LEzenuXULlZSLaIXxpte/dsx3h/Hs8kGRAZ5OStSYBj
 hup4Ys9dK7zo8XDUYZY4r7iAMnu0Jay5SMDTPuYC41rQPDQy9hhftCoaPDhYUcqDz4FD0gne+/r
 Gfs8u/UWXqv+MGFwIr0qe5YRzJwt+yzL4wHTTmx5Ut9KI9oly0FdyappPa4KGQQqFTF42oMNQSx
 zrgUKiyc8AX09Gv6vurX/9JdGot3kOJbeDqyQSe+n3i9KkKwYRxukz2OYMSQu89QXP1+
X-Google-Smtp-Source: AGHT+IEFWEqR1I8ZH05V+Vt8JKfpoLb0SzCx8I7HKdHSxc5BiOkHHEG3/mVBvxDYAkKn7oMFiOUdNQ==
X-Received: by 2002:a05:6a00:4f95:b0:747:accb:773c with SMTP id
 d2e1a72fcca58-74827ea574fmr22363653b3a.13.1749559119951; 
 Tue, 10 Jun 2025 05:38:39 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:39 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:29 +0800
Message-ID: <20250610123743.667183-20-shengyong1@xiaomi.com>
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
 tests/f_nat_bad_blkaddr/README
 | 4 ++++ tests/f_nat_bad_blkaddr/expect.in | 12 ++++++++++++
 tests/f_nat_bad_blkaddr/script
 | 25 +++++++++++++++++++++++++ 3 files change [...] 
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
 [209.85.128.172 listed in wl.mailspike.net]
X-Headers-End: 1uP0n1-00043R-SB
Subject: [f2fs-dev] [RFC PATCH v2 19/32] tests: add fsck testcase of fixing
 nat entry with invalid blkaddr
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
 tests/f_nat_bad_blkaddr/README    |  4 ++++
 tests/f_nat_bad_blkaddr/expect.in | 12 ++++++++++++
 tests/f_nat_bad_blkaddr/script    | 25 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 tests/f_nat_bad_blkaddr/README
 create mode 100644 tests/f_nat_bad_blkaddr/expect.in
 create mode 100644 tests/f_nat_bad_blkaddr/script

diff --git a/tests/f_nat_bad_blkaddr/README b/tests/f_nat_bad_blkaddr/README
new file mode 100644
index 000000000000..1545fb0fb342
--- /dev/null
+++ b/tests/f_nat_bad_blkaddr/README
@@ -0,0 +1,4 @@
+1. create f2fs image
+2. mount f2fs and create a regular file
+3. inject block_addr in nat entry with value 0x12345 of the regular file
+4. fsck fixes the nat entry by nullifying it
diff --git a/tests/f_nat_bad_blkaddr/expect.in b/tests/f_nat_bad_blkaddr/expect.in
new file mode 100644
index 000000000000..321aa14887ba
--- /dev/null
+++ b/tests/f_nat_bad_blkaddr/expect.in
@@ -0,0 +1,12 @@
+Info: Force to fix corruption
+[ASSERT] (sanity_check_nat: x)  --> blkaddress is not valid. [0x12345]
+[FIX] (__chk_dentries:x)  --> Unlink [_INO_] - testfile len[0x8], type[0x1]
+[fsck_chk_quota_files:x] Fixing Quota file ([  0] ino [0x4])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x4] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  1] ino [0x5])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x5] in NAT
+[fsck_chk_quota_files:x] Fixing Quota file ([  2] ino [0x6])
+[FIX] (nullify_nat_entry:x)  --> Remove nid [0x6] in NAT
+NID[_INO_] is unreachable, blkaddr:0x12345
+[FIX] (nullify_nat_entry:x)  --> Remove nid [_INO_] in NAT
+Info: Force to fix corruption
diff --git a/tests/f_nat_bad_blkaddr/script b/tests/f_nat_bad_blkaddr/script
new file mode 100644
index 000000000000..d3ac65fb4f51
--- /dev/null
+++ b/tests/f_nat_bad_blkaddr/script
@@ -0,0 +1,25 @@
+#!/bin/bash
+
+DESC="nat entry with invalid block_addr"
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
+$INJECT --nat 0 --nid $ino --mb block_addr --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+INO=`printf "0x%x" $ino`
+sed "s/_INO_/$INO/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
