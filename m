Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA817AD3CD5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3svGxHo7pSQGKtdKZ7N9987biHAT5+UwnISDUMN8lDE=; b=dwnAhC3PyQDhHwoGfoeT4YvuiV
	jUyIr/ZE6woYHGSxANsSz30wT/huy56lLrv0ZJ6HzeWks/XN+zgohJNgZofM4aXIM5ddbppJEuC5G
	x5x6bJRuXO/GGxU/4tUqi8XodvQxce2pSTryX8Tu6QY4cR5ot7pLtFM19EyatOvR8TmQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0px-00007O-Oj;
	Tue, 10 Jun 2025 15:24:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0pw-00007C-9G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yj9vOGcmdPzxNfGj1IFrDLl+gZsDLM6h+ZKFW+8SRhk=; b=eChkdpEEQWMUjG1bWjmcti3Esm
 FyAL+T9c3Dm7l+NfUqhtftxEi5/K9FzdY1y4wz1wOmO5ggK1gTGXRwt5QvfJIDDOohLFn1MAhpHYt
 hJ+JJJq1rHOCCmQeJocy7zJHMDYZtdCtUsyiW8BrUdQpUajloFbMzpg+YddA8Ck9/+e8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yj9vOGcmdPzxNfGj1IFrDLl+gZsDLM6h+ZKFW+8SRhk=; b=P41yfTmV5XqIa3900KSqeyvaqX
 DCL1U6gkyKTvXcIiSsHNCUIFBrtU7SVyYWgvIrScJtN/aWy64vv5728QW3sHQieHFCTGh5hkZxBcO
 D8a2NM/7zgd1YIGj7demM3sINKC/bSNvr7bk5QMD3Uu6QMAU4iAUvLWzHKpUx3Mx4Ubw=;
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0pv-0004VU-TM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:24:28 +0000
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4a5851764e1so108418501cf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569057; x=1750173857; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yj9vOGcmdPzxNfGj1IFrDLl+gZsDLM6h+ZKFW+8SRhk=;
 b=aSDyOVFR07r6+0SxNIjxkZKDvj8mvAL41ZXyxs5LjY58Xqsxjclg4GGRQWu7mSNWnh
 ESsVuVlw0bt7x7NfKtvPQiBXLUNsriI+/f21Dp8wNYm2bSwSwRr9qa4B+7+sa7yZUqTL
 66AZVZ1E2cEL8kxLD7JcHeC/sw3yOT7qle5WraoVnZWZ0i7FGC10/oZFnrmek4dkZJvG
 CFZv3F6tKrKrEemfnp0SpPDYMG/ptZjCuTqgMTF9jYxVRTl+IX33MZGzpa8rc386Mdh6
 XEnnfOkg1uFUGV2S2xfEek4jJiwFO5+AN9suWn5ZbFrPDGgw8g+UjRtajL6B4Wak+KpA
 c1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569057; x=1750173857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yj9vOGcmdPzxNfGj1IFrDLl+gZsDLM6h+ZKFW+8SRhk=;
 b=dUZVkBGOc4odkTUSxHE4RQUjKX9jm1+QQL9errspL0ui13xlr5pO0Gq4CLyawMuhLt
 coitVnjy6GuSm0Za3lGf9ybocn1wPS8qdX9p1WSBvGY9COyghPTQzJuYm7BZoDk3bH9A
 HHAAaAcoy6F1ZcnrlUlnlV4iK2J9XpsdRkfg1yPGJM21iw58c+HT+qBXxSk1pE+v54Aq
 tu78b+c1JcHbY4H0Viu6Dedeh8om9wwrOWB4+Cn/vd8cAWasnR3DAEe6TNppEvmg6XwK
 PMqA7U3aHdtMemAXB9ZGgdqprKI6ixfN8D763rVoreuXZJ+1jWLycrQCuy5zyy6BVTQP
 MJ/w==
X-Gm-Message-State: AOJu0Ywudmv3wdZqj6arGgI65ZywbxRdH0tgQqhImPvl68kwnjm5o4Bw
 gpnFwoOvwzPUmiWUYQneu7Ix6enQx9Hl/jjYQv2svFwKiqt2wviW3SHbHd4XIQ==
X-Gm-Gg: ASbGnctmT4bs1R9Y1Guxu14F2PmPlhJn4MyncmPEHp5LW7dro0DKUNC3A/nSK8Uwglw
 wqV4YIpb2lZXTjS7ZC1IqjYYwNQcb00ZEIMFXMtJh88LOQLauIbFk2/CGyUswGxEc7AIca/LRoA
 QbdDAlPTWwABvxLKRRRGsDRnq2+nuRWwv3wAdIxnQFYWaN2awo4vaj6cnpygCzhparTkuRxZQme
 JAiusZXAUb6OKuKYmJbjTAZh0hkNTVEC0GEi296duDsTtrZMaQRgMqhX0forhqLOfYtqQXqonRf
 jD5cprx+JFQHMnHNNEUkcfwvg0FFUVbc+wsXtT1mPOjloBo/i+pAZZ5HMd2p+oOKmyq/
X-Google-Smtp-Source: AGHT+IHuochTA92cO7Wm5RBw+3pblnw8P2D+xhn7zvQOjmqG2nBbneWIOoj4wziQgH6GHhK9o+tOnA==
X-Received: by 2002:a05:6a00:9a3:b0:747:b043:41e8 with SMTP id
 d2e1a72fcca58-74827f12808mr21242791b3a.15.1749559121959; 
 Tue, 10 Jun 2025 05:38:41 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:41 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:30 +0800
Message-ID: <20250610123743.667183-21-shengyong1@xiaomi.com>
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
 tests/f_sit_bad_type/README
 | 5 +++++ tests/f_sit_bad_type/expect.in | 3 +++ tests/f_sit_bad_type/script
 | 38 ++++++++++++++++++++++++++++++++++ 3 files changed, 46 ins [...] 
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
 [209.85.160.176 listed in wl.mailspike.net]
X-Headers-End: 1uP0pv-0004VU-TM
Subject: [f2fs-dev] [RFC PATCH v2 20/32] tests: add fsck testcase of fixing
 sit entry type
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
 tests/f_sit_bad_type/README    |  5 +++++
 tests/f_sit_bad_type/expect.in |  3 +++
 tests/f_sit_bad_type/script    | 38 ++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 tests/f_sit_bad_type/README
 create mode 100644 tests/f_sit_bad_type/expect.in
 create mode 100644 tests/f_sit_bad_type/script

diff --git a/tests/f_sit_bad_type/README b/tests/f_sit_bad_type/README
new file mode 100644
index 000000000000..e0a1726528c0
--- /dev/null
+++ b/tests/f_sit_bad_type/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject type in the sit entry of the blkaddr and change its type to NODE
+5. fsck fixes the type to DATA
diff --git a/tests/f_sit_bad_type/expect.in b/tests/f_sit_bad_type/expect.in
new file mode 100644
index 000000000000..b207ff7c6c22
--- /dev/null
+++ b/tests/f_sit_bad_type/expect.in
@@ -0,0 +1,3 @@
+Info: Force to fix corruption
+[FIX] (check_sit_types:x)  --> Wrong segment type [_SEGNO_] 3 -> 1
+Info: Force to fix corruption
diff --git a/tests/f_sit_bad_type/script b/tests/f_sit_bad_type/script
new file mode 100644
index 000000000000..a1c7c402181d
--- /dev/null
+++ b/tests/f_sit_bad_type/script
@@ -0,0 +1,38 @@
+#!/bin/bash
+
+DESC="sit entry with invalid type"
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
+SIT_VBLOCKS_SHIFT=10
+SIT_VBLOCKS_MASK=$(((1 << SIT_VBLOCKS_SHIFT) - 1))
+val=`$INJECT --dry-run --sit 0 --blk $blkaddr --mb vblocks $META | \
+	grep "inject sit entry vblocks" | awk '{print $(NF-2)}'`
+vblocks=$((val & SIT_VBLOCKS_MASK))
+val=$((vblocks | (0x3 << SIT_VBLOCKS_SHIFT)))
+
+$INJECT --sit 0 --blk $blkaddr --mb vblocks --val $val $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
