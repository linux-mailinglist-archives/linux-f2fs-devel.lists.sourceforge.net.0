Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAFAD3C80
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEPTqUieJse1Es1fwapeZ6/XmdvPoZXYrY0wK5C6R5U=; b=YgmbZDj4jqp3SARFsi/H+bV/2o
	fuMW3hzR4HeS11xLfu3iOHHpdcziDvD+8UR3qt06nMgtiYy6WdPpQMs4Xrj9pGB1M46DHWKbC9pdc
	b+MEwVo9ZjMTd7MXN/CunYP0RVQbjObmN1I+y9cmtwMzSbLGnWLDkOwizWRSWYRWUqwY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0j1-0003Cs-7l;
	Tue, 10 Jun 2025 15:17:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0iz-0003Cc-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HrXGevSpkqQGJt6hJc3wfUeGw8/a6fFht5XxIsZZ9o4=; b=hdZO0LZfETtAdyG3vkAEINMGUT
 NB9Dxo8iNae9tJ0qx75rtfpDg4urKgxiDeQn9Cf9wpFRz07Q7TprSraeKYzUuC4ETWw2Ic3oym61n
 r4uguvRV3ts4fPunEz4yReAcykRvKmpABYLFunAcvU9Yw9mAopn93u1joQ7AJ+9o0lv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HrXGevSpkqQGJt6hJc3wfUeGw8/a6fFht5XxIsZZ9o4=; b=GcGXaRX4mcqTDKlE9sNZHMHDnt
 5OW1ukTwh2GH4Ll7W2ECI0MTzc9pTixvpgiyPQb3LcPwC5CInlh1kzz43Dl5KbykIy6a1FkWs3PPS
 XQ1Xv7weQzs+zUnNGNwDQqg6PDHmdr2feuJEC8yMS1yg5Dn1F24Y9ZXTGKtzyJp99m+Y=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0iz-0003Nt-Fn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:17:17 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2352400344aso48745335ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568627; x=1750173427; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrXGevSpkqQGJt6hJc3wfUeGw8/a6fFht5XxIsZZ9o4=;
 b=nE1jo45GDFOmt9KvX21R38TDbxu+JoUdVVUlBOQZnJKsh6FEsCfonZPRs7Dv7ORU5b
 NbKJ3gWgUXfrZ7si3I81ut8piYAJXPTDZbcJGARLqB7nQ0UrzzGuAOnGEAkvrKMeG0sG
 IU1KFBE3WWtJXzVYhYKZAMNc6l68tYP9+4yDE3HgTLaB1qjgXUgMK8jEarb3ez7iToZA
 0ML3iahY/AyJC7+mrsi7lT9eVKukWCMbaaXhiF1rEjkaGxVBGMwp9kboGuhaRZM2GviU
 8TxpCkPnUsO6nSLuMoArl7sljVKqWZewQcdFa6mcKKPeEWvUnG72WJKEpA7WXMa48r9D
 JC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568627; x=1750173427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrXGevSpkqQGJt6hJc3wfUeGw8/a6fFht5XxIsZZ9o4=;
 b=jCe5cV30qs0Mdrp4VnCM3yhLFJK+FbSBlvmaAl2GE7P+ztr1KoxNaF9duAz4JY+Rrd
 Nqg1dAQ+lWmCKK3V0vk8WXrxSLUi3F8UdDeizhK8dQ2mr+bhTkpjTJaxBC4VcV4ezmC9
 oMRS6KnCerx+UGdjKEI4ZjZkXIM2y8VJb7jK+seYK/fJEIOW+Ebf42d7M53x57UYjHrX
 og9f9Z5KWjR8iq5OKGEWIoVOe8IZ5n2+eqZMSrS8tMOwIm+XHqhGOT72cO+dwLw2Lnwl
 It3AmIot0gGUNUi1BSKVxB0DZlSLMBeph4/X5wXJSOuWh/oFIFtbyTLt+1BwtJWmzEE2
 Rouw==
X-Gm-Message-State: AOJu0YyAaPf4Zk9vZ/oj5+sswNqLbEt0wDNNb29d8MexKYMgvF4fCj2D
 9qMZ1o83wJ6rlri0UTb4PWAviQnWog57ebdzEdL1VxH9rVyWAsfPARzzfm6lnA==
X-Gm-Gg: ASbGncsse2wOpeIDqYsEttYByK3SHbiaIhuRrXE4/gKNnLgQqkgActAwcnYYxhq7opI
 oRFHj6FewbWRR0r/Er5ufx3dRgLXOsNH1NqsUus5vvZoF1ZL+sRPEbqAyI5/lC0+wij+Tpr7uad
 9ao9bJHIGHAZ6fcC+LUmHWHFMMp9aQntpGAiUV/AEiplU1eCdgjXBDiUwcaVWr+49EYPt3HVmbx
 730h9WHMdlG90ANu46FaBFhz93meEgZEZk3ntfwwWb4vFgBGo9AO96aDXRXUWX/njDbokPL0e+v
 +jDhR0Kc2rR5JKwyNeESNLZIQzYp4vxJ/+wN1R8E8AFK4SfKXKozcU+4n/nCYdFm1mYt
X-Google-Smtp-Source: AGHT+IFjUV6+1BpuEEkdChFxN4QuygtkQi37tntgniBiGVtU9am9pIWflJz/fRaLZkJSPF4izOltwA==
X-Received: by 2002:a05:6a21:9988:b0:215:e1a0:805f with SMTP id
 adf61e73a8af0-21ee685cd85mr21196407637.31.1749559137577; 
 Tue, 10 Jun 2025 05:38:57 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:57 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:38 +0800
Message-ID: <20250610123743.667183-29-shengyong1@xiaomi.com>
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
 tests/f_dentry_lost_dots/README
 | 7 ++++++ tests/f_dentry_lost_dots/expect.in | 16 +++++++++++++
 tests/f_dentry_lost_dots/script
 | 37 ++++++++++++++++++++++++++++++ 3 f [...] 
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
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0iz-0003Nt-Fn
Subject: [f2fs-dev] [RFC PATCH v2 28/32] tests: add fsck testcase of fixing
 lost dots
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
 tests/f_dentry_lost_dots/README    |  7 ++++++
 tests/f_dentry_lost_dots/expect.in | 16 +++++++++++++
 tests/f_dentry_lost_dots/script    | 37 ++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 tests/f_dentry_lost_dots/README
 create mode 100644 tests/f_dentry_lost_dots/expect.in
 create mode 100644 tests/f_dentry_lost_dots/script

diff --git a/tests/f_dentry_lost_dots/README b/tests/f_dentry_lost_dots/README
new file mode 100644
index 000000000000..f07a1165b8cc
--- /dev/null
+++ b/tests/f_dentry_lost_dots/README
@@ -0,0 +1,7 @@
+1. create f2fs image
+2. mount f2fs
+3. create a directory, and create a file in it
+4. inject dot dentry in the directory by invalidating its valid bit
+5. fsck fixes by adding a new dot dentry
+6. inject dotdot dentry in the directory by invalidating its valid bit
+7. fsck fixes by adding a new dotdot dentry
diff --git a/tests/f_dentry_lost_dots/expect.in b/tests/f_dentry_lost_dots/expect.in
new file mode 100644
index 000000000000..c024e683908d
--- /dev/null
+++ b/tests/f_dentry_lost_dots/expect.in
@@ -0,0 +1,16 @@
+Info: Force to fix corruption
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
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 1, dotdot: 0
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '..' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+Info: Force to fix corruption
diff --git a/tests/f_dentry_lost_dots/script b/tests/f_dentry_lost_dots/script
new file mode 100644
index 000000000000..38bfd36f0266
--- /dev/null
+++ b/tests/f_dentry_lost_dots/script
@@ -0,0 +1,37 @@
+#!/bin/bash
+
+DESC="directory missing dot or dotdot"
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
+# inject dot
+$INJECT --dent --nid $ino --mb d_bitmap --dots 1 --val 0 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+
+# inject dotdot
+$INJECT --dent --nid $ino --mb d_bitmap --dots 2 --val 0 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+INO_HEX=`printf "0x%x" $ino`
+sed "s/_INO_HEX_/$INO_HEX/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_INO_DEC_/$ino/g" $TESTDIR/expect
+sed -i "s/_PINO_DEC_/$pino/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
