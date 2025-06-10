Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74CAD3D2C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5dw6yAlgt/j/98qNzqG6t6TtC/KnefqYKBfbQXzyV8=; b=I1rpDAsFclXFkdl4/MwDOCzcAY
	20viPgJmtZKrLzKck/JHIitltPTXV8BjyOGlBPPJR0RZKUN3u5RQboIQrK6jbcr5kx623zZ23Kcfm
	ugrfJh8dqa0F2Iru8FsCqdwVDZ3h4iIIH627uPcK4eAbvv2cmOp/aJkOcwvsSw37JT0g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0wr-0006Xv-QN;
	Tue, 10 Jun 2025 15:31:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0wr-0006Xp-Cb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuM1yYVu3d4NCtavNOOJqvhWDJzeRxpGr7fulxKYB0Y=; b=Vw0f4nIi52hR18yI4ZAHiXwpsE
 F/W6PA8mkH1UDmrbbvRGunIwgJGJSPpCq5v61In11D4MYx9ZWGgxMqmO8eMXOk3giLE0EIg0OYYRc
 dcK/HpWftCY7mBbyQ5lxOR2jBRmS+Gk4t0bRohOwIXTN1BTP+GMY3X3h2kCLCPrYmBHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TuM1yYVu3d4NCtavNOOJqvhWDJzeRxpGr7fulxKYB0Y=; b=XDw3xTyaOsYgPTsvZlLW1V0NDE
 KhCIQgqD4rJKSbBL7sqJiJJRWHvRBHp0F1WhN6Qypg30tuuSQ35GbZaG6CaMlB2sS/Y2QeKBtXVeR
 Qmh2Be//zzxzdP/rMfpLeqf4tijR7P+xCpncXDONhZDClV8pSazVWm5a4oGNy+VKlRwY=;
Received: from mail-oa1-f49.google.com ([209.85.160.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0wq-0005H5-01 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:36 +0000
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2d0d25cebfeso4501907fac.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569485; x=1750174285; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TuM1yYVu3d4NCtavNOOJqvhWDJzeRxpGr7fulxKYB0Y=;
 b=MjSJuStkooCPM/66vk19XR95HqOBDGk+RRkDwjoGlKTDrbVLYJM0BDUGliD3BI9fOh
 qKeY+ZDBKntMRicVi0hlbOJhw6JQmzCkhCgKHRVlYi0ADArHXSJsZJsR6ML0VOw0Vlfx
 Lx+K0iBgOALG3ABQQTCw4Y8IoMFKmNomkF5pLVHwaEb4ZahDn0n6QmsaXqLQ23SvHR/C
 E9F3wjAJWLZ/OlNGq+7iece8Z0ItlsMvSSHuT4+JfDxEIFksSJl3uOvcSizbAHl7PHSz
 vUTKr/Oib1UiahV5B13+pgWZ3q180Il0ZWVEJzz6cep3bDI3xIZF/PQolqPcyJOUgOaS
 /vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569485; x=1750174285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TuM1yYVu3d4NCtavNOOJqvhWDJzeRxpGr7fulxKYB0Y=;
 b=bXpVhHb+lmVZydpYc3zCYUSrPlidCKBXbnjVusgkKLDquLRGAvdO2Lo2vtTnRz+83z
 QOZMaGEem/URyfc4wmS6HmhWqy2lzqC5WhHizYipi+19IhTGtWxLRQQNUWu2rCct2ivM
 ty4MqiXRLdwnFzkPMi97a+kEFXQRDxyVS5MjIb64dZ0d4rwVwi05J7lFcd8/Y9LpZaXZ
 wzdrdV4Puxj85ng3QKfOojgshzP8gLgm7ksbeTa3n8tY69hAOJmNi9dqF5CEnO3YXfcT
 Mz+U9kSirjpA2MLQS6xFUGPcT7MCHr0nzg5BJJiGxSpUcYbVD8n8Jq31VwFOMyDyyLvA
 ehtA==
X-Gm-Message-State: AOJu0YxbttacVzjFOtbHpsqDWB670swVf+1pKFR1IjGjZrfJ54aM5dcY
 TUP6Vfjsg3m994BAX46F+oczLSLI/l+b0bMOVMSNyIIrJZ8Jhxiy6o3aI5QXGg==
X-Gm-Gg: ASbGncvEChtlvyV07ZtTPiORVRZ9dNWdMIC0slJdelHd06mqn/DH/yrMzI0JLi4TYXg
 YiEZgmVy0i5ZwzvfqYbznVULX7PMTR9JgvVIxVY4JD+R6s1Ctq9xj4yi5M90+KQrBfDLzUJnipt
 CfjHM5kx18+b5XTkv3zCk3MWRy0nFT4PD6UsxBSY9VVhIhI7JGQWpSgAlzkKD3DNo6i4GehQWWh
 ofVmaCbPppz/SvQRIqvIV57byGLONhGt2Uj8+UcZyvrGhOyCR7I8YQueo2h4GoBU6IrkGu+U1cn
 ijlYozSiwO+dSXiPPMclwSbNUB4tuNq0qHoUig2KQ2HvN+5lvMZ0HG4RC/AtwBLNa/q3
X-Google-Smtp-Source: AGHT+IFdCKR0cTY/MPo4slEUvcYZL6qDwz8R7w7QHHvhnA7lP3iN1oG16cDEHCUQOrcbYjHUVtutIQ==
X-Received: by 2002:a05:6a00:848:b0:73d:fa54:afb9 with SMTP id
 d2e1a72fcca58-74827e7f02emr23053991b3a.7.1749559141515; 
 Tue, 10 Jun 2025 05:39:01 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:39:01 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:40 +0800
Message-ID: <20250610123743.667183-31-shengyong1@xiaomi.com>
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
 tests/f_loop_fsync_dnodes/README
 | 5 ++++ tests/f_loop_fsync_dnodes/expect.in | 6 ++++
 tests/f_loop_fsync_dnodes/script
 | 46 +++++++++++++++++++++++++++++ 3 files chang [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.49 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0wq-0005H5-01
Subject: [f2fs-dev] [RFC PATCH v2 30/32] tests: add fsck testcase of fixing
 loop fsync dnodes
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
 tests/f_loop_fsync_dnodes/README    |  5 ++++
 tests/f_loop_fsync_dnodes/expect.in |  6 ++++
 tests/f_loop_fsync_dnodes/script    | 46 +++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 tests/f_loop_fsync_dnodes/README
 create mode 100644 tests/f_loop_fsync_dnodes/expect.in
 create mode 100644 tests/f_loop_fsync_dnodes/script

diff --git a/tests/f_loop_fsync_dnodes/README b/tests/f_loop_fsync_dnodes/README
new file mode 100644
index 000000000000..4e864fa8c874
--- /dev/null
+++ b/tests/f_loop_fsync_dnodes/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create 10 regular files with O_SYNC
+3. shutdown f2fs without writing checkpoint
+4. inject fsync dnodes to generate a loop
+5. fsck fixes fsync dnodes by breaking the loop
diff --git a/tests/f_loop_fsync_dnodes/expect.in b/tests/f_loop_fsync_dnodes/expect.in
new file mode 100644
index 000000000000..23b7fbfc7e82
--- /dev/null
+++ b/tests/f_loop_fsync_dnodes/expect.in
@@ -0,0 +1,6 @@
+Info: Force to fix corruption
+Info: checkpoint stop reason: shutdown(1)
+[ASSERT] (sanity_check_node_chain:x)  --> 	detect looped node chain, blkaddr:_BLKADDR_
+[FIX] (loop_node_chain_fix:x)  --> Fix looped node chain on blkaddr _BLKADDR_
+Info: Force to fix corruption
+Info: checkpoint stop reason: shutdown(1)
diff --git a/tests/f_loop_fsync_dnodes/script b/tests/f_loop_fsync_dnodes/script
new file mode 100644
index 000000000000..b6f64f384a0e
--- /dev/null
+++ b/tests/f_loop_fsync_dnodes/script
@@ -0,0 +1,46 @@
+#!/bin/bash
+
+DESC="recover loop fsync dnodes"
+
+. $TOPDIR/tests/helpers
+
+# if device is a zoned device, this testcase should be skipped
+test_sb_feature blkzoned
+if [ $? -ne 0 ]; then
+	touch $TESTDIR/SKIP
+	check_result
+	return
+fi
+
+cleanup
+make_f2fs > $LOG
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG
+mkdir $TESTDIR/mntdir/testdir
+touch $TESTDIR/mntdir/testdir/testfile
+$F2FS_IO checkpoint $TESTDIR/mntdir/testdir/testfile >> $LOG
+i=0
+while [ $i -lt 10 ]; do
+	# write one all zero 4K chunk to file with O_SYNC
+	$F2FS_IO write 1 0 1 zero osync $TESTDIR/mntdir/testdir/testfile.$i >> $LOG
+	i=$((i + 1))
+done
+$F2FS_IO shutdown 2 $TESTDIR/mntdir/testdir/testfile >> $LOG
+safe_umount $TESTDIR/mntdir >> $LOG
+rm -rf $TESTDIR/mntdir
+
+addr1=`$INJECT --dry-run --cp 0 --mb next_blkaddr --idx 6 --val 0 $META | \
+	grep "\[.*1\] blkaddr:" | cut -d ":" -f 3`
+addr2=`$INJECT --dry-run --cp 0 --mb next_blkaddr --idx 6 --val 0 $META | \
+	grep "\[.*6\] blkaddr:" | cut -d ":" -f 3`
+echo "addr1:$addr1, addr2:$addr2" >> $LOG
+$INJECT --cp 0 --mb next_blkaddr --idx 6 --val $addr1 $META >> $LOG
+
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+sed "s/_BLKADDR_/$((addr2))/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
