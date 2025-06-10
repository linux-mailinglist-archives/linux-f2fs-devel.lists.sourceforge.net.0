Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4792AD3D25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0TSQySNK4V5nSnni3v0o7/7fSX/WC28v63k9i9JPO0=; b=XKcl5DSfkp/GS1YHanA50bfvwl
	uVFKtl/xTbKcWAF2BdrMSi2gq7fCi8ZttZmi4cJFRgBmb1VVgz+zAAK6cgpsQ9BPDIcH6teZUHzLs
	pasqnfPpweSneJJnMqQ8z6OV1Btravonvr7rfQzhP7rVBmhv98FT/b/8HEYu7qVz1YOk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0w6-0000L0-FL;
	Tue, 10 Jun 2025 15:30:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0w4-0000Ks-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUVftHKR6DeD8bmWL1tMcDlBI42NuJKlFF8lwSZU4zM=; b=aVOUje4aPNY2dCcP2RSNlkGn20
 Ik7O+Yr8u1SVd9zKp6LkqwetSDMozl4AE7gMJbAPxFIqU9VYHEqTw8oZmsS8SEXBO/V7+gErXTDWg
 rHOGyLj/0gIBXJHzVd6zaUv7P68uR9SWKbcyLWITC+cWCtgRxRDtLwoK+fVqaOvlRVRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUVftHKR6DeD8bmWL1tMcDlBI42NuJKlFF8lwSZU4zM=; b=G+uwVZu6A8U1MCJOeoaklFyHSR
 VqX1RWpxwk6Z7RUR0xgWLRKgPJreX+RbrCJrJaq02WvTVUYLdP6yhd9Dc1pIsvKA3rnKN3nb5KFVR
 ExmhfCyREfVVLgNY6cjbTKCpSK9dbifqxsb3Zhx3ki+4BHsYOALHdJXfGmovH8c9GMDg=;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0w3-0005BH-Kf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:30:48 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-72ecc0eeb8bso1898036a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569442; x=1750174242; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUVftHKR6DeD8bmWL1tMcDlBI42NuJKlFF8lwSZU4zM=;
 b=l/e7Ng+Fh4NPMF/E+XhpQ6dM4Q7E1Pql5roBM/wfjsEAlP2ytWk7zzUpB/bngS2HB+
 U+lWKed3eQaWA5HLeyazMap57qvRYGoh0J9AU7sOl5eQFWOOG8qGPCha9FLI4glzELEW
 qrf/UxbglWsbu+3yqkN52oE+h3OvgrIo7FWzNVcX58aAvl3i3zOHKHFtrClbL91xx96f
 13EItJBE092dGJQr5fwdOwOZvgDAZqG9SbT4YWEEYqrv+kqki+Ivo8xTXYJ3xcUcgDvZ
 P/WB8MyWEI+/35hJDaXywpW2dWAhR2G595JeJonf85sPj7EGdjIqKpe77BHDQXtdq5O2
 SBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569442; x=1750174242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUVftHKR6DeD8bmWL1tMcDlBI42NuJKlFF8lwSZU4zM=;
 b=SKDja6cQXsa2qDJ5s2TNqeOslmZtQGV5FiVbWxj75hafJgwuEDG7DNb9+Z63gFeCHV
 /XR5stuvvs3tRC8ZzKKZke24GSDot47Xd4eXa/Pnkx4TyyvsFKTagDElwUkBme/oCrKY
 BR04hTtUFxhKGQ9zYlpiWgaRuUPu8O4bv/gJzeCQ8cGWG0g8oHfsuExmfsxOQD+j6BX4
 SgaMRqpaO9L28eG+JSAj+h/IVGa2IIp0fKS6Opo6vJ3A5tJeJBTPs5ed0f6QH0kdbFhB
 1mEvObGcdU9cNBRhrqGeii2EEeef+pKTnYBSkBIn6TugbHijPnt6U6pE+t6/8SbBYxMX
 ysqA==
X-Gm-Message-State: AOJu0YwzVN2Y4dhpLDMLB/1sU/RMKuRTkwWVC3uSlaOpaSKGCUguofI9
 6u+mhVft35r8HNHSHP0mXXTmSK8UDnH96OnbCcSQtXSpa8Dcyfd1h5N6D+cb1Q==
X-Gm-Gg: ASbGnctmQtCe23k6zrC81tdp94qQOlqvSfGL4eDtDF+OrJJq+flPew3UYLOsIZaGDNI
 dcc7dmHoWyJvX4fWd+Hp2OVatCNFv9v9bM9zBIhDtwNzsT6mMxcnZN20sO39CkvAewwA3zer96f
 +4jtdCiQ2h1sDPcSkVnf554wWv6KbhWjfM3utQyRDGhgDTtB3W62SYJz7a6DJmfKdEdn/0dnSsv
 mw8218YsDj1m50TnamKO0O7o8jg2wIFb6FYQ2B9CiNApl61zfUsjMo4QiMA8u+NKOQexhdEFRTd
 IHnASOvQqZEdvLH3OctRH/mQ8CajZQiA4QFlZ8eG18K5iJMGU3zKA40vr6otqtPAI1gNzdM1bmx
 mc1k=
X-Google-Smtp-Source: AGHT+IFC+Yhl1YwhiJ3GbLCxXghnMsGe+K/SIp3ifm8sucIsbPcwb03G+ri9EpcZdnVSvtARi01hWg==
X-Received: by 2002:a05:6a00:ace:b0:73d:ff02:8d83 with SMTP id
 d2e1a72fcca58-748617de51cmr3524599b3a.3.1749559115927; 
 Tue, 10 Jun 2025 05:38:35 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:35 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:27 +0800
Message-ID: <20250610123743.667183-18-shengyong1@xiaomi.com>
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
 tests/f_cp_bad_crc/README
 | 5 +++++ tests/f_cp_bad_crc/expect.in | 4 ++++ tests/f_cp_bad_crc/script
 | 38 ++++++++++++++++++++++++++++++++++++ 3 files changed, 47 insert [...]
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
 [209.85.210.48 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0w3-0005BH-Kf
Subject: [f2fs-dev] [RFC PATCH v2 17/32] tests: add fsck testcase of fixing
 cp crc
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
 tests/f_cp_bad_crc/README    |  5 +++++
 tests/f_cp_bad_crc/expect.in |  4 ++++
 tests/f_cp_bad_crc/script    | 38 ++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 tests/f_cp_bad_crc/README
 create mode 100644 tests/f_cp_bad_crc/expect.in
 create mode 100644 tests/f_cp_bad_crc/script

diff --git a/tests/f_cp_bad_crc/README b/tests/f_cp_bad_crc/README
new file mode 100644
index 000000000000..250ece3f8b5a
--- /dev/null
+++ b/tests/f_cp_bad_crc/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. create a new file
+3. inject crc in current cp with value 0x12345
+4. fsck fixes bad cp by copying backup cp
+5. compare cp1 version with cp2 version, both cp should have the same version
diff --git a/tests/f_cp_bad_crc/expect.in b/tests/f_cp_bad_crc/expect.in
new file mode 100644
index 000000000000..d21fdab7304a
--- /dev/null
+++ b/tests/f_cp_bad_crc/expect.in
@@ -0,0 +1,4 @@
+Info: Automatic fix mode enabled.
+	Invalid CP CRC: offset:_OFFS_, crc:0x12345, calc:_CRC_
+Info: Automatic fix mode enabled.
+Info: No error was reported
diff --git a/tests/f_cp_bad_crc/script b/tests/f_cp_bad_crc/script
new file mode 100644
index 000000000000..b5181614f537
--- /dev/null
+++ b/tests/f_cp_bad_crc/script
@@ -0,0 +1,38 @@
+#!/bin/bash
+
+DESC="current cp with invalid crc"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+touch $TESTDIR/mntdir/testfile
+safe_umount $TESTDIR/mntdir >> $LOG
+rm -rf $TESTDIR/mntdir
+
+cp=`get_cp $META`
+offs=`get_mb_val "$cp" checksum_offset`
+crc=`get_mb_val "$cp" '\<checksum\>'`
+
+echo "crc:$crc offs:$offs" >> $LOG
+
+$INJECT --cp 0 --mb crc --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -a $META > $OUT
+$FSCK $FSCK_OPTS -a $META >> $OUT
+
+cp1_ver=`$INJECT --cp 1 --mb checkpoint_ver --val 0 --dry-run $META | grep "inject checkpoint_ver of cp" | awk '{print $(NF-2)}'`
+cp2_ver=`$INJECT --cp 2 --mb checkpoint_ver --val 0 --dry-run $META | grep "inject checkpoint_ver of cp" | awk '{print $(NF-2)}'`
+if [ $((cp1_ver)) -ne $((cp2_ver)) ]; then
+	echo "cp1_ver: $cp1_ver" >> $OUT
+	echo "cp2_ver: $cp2_ver" >> $OUT
+fi
+cat $OUT >> $LOG
+
+CRC=`printf "0x%x" $crc`
+sed "s/_CRC_/$CRC/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_OFFS_/$offs/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
