Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A88AD3D93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWXMJR/C7Lv0cgmOpkTXh1S7xO3baU5HSRWPLbrM7RQ=; b=SFn/zxXfn6DM7NfL9u2GNFZ49A
	9jA318c0QjSFVzH46O+YuxstATYgrvLym8U/gxUeyII4cOMWU8eM+j+jMIYWqHLcXU1WCI9T8H/gS
	vCBjQOZPeMutyhczdfQcJx6HFJsNUtR9eienXJ0nKBT75av3z116cpf5Ga8ucFyZN5vg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP15a-0006xd-Q6;
	Tue, 10 Jun 2025 15:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP15Q-0006xQ-Dm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zWO1qREHpjZ3bVRsBYB1+61JEaUp7BD2y5lRIKZ6PZw=; b=EwCuUn2A1u+xOUqAas2D8k1Wia
 WI9stAxLAtr7sLVanfROnuyKi+w+oXjeWB6ZguNlC3b21qJfUTl4LYRcHPAM9Qc4nu4FoucxmEvv8
 YFIi7xjDSw8qd3JDL+1ZS+l46DeOjuw8LVwjxsEdyUaZSTEC3RHXEvwc606WWVxdugCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zWO1qREHpjZ3bVRsBYB1+61JEaUp7BD2y5lRIKZ6PZw=; b=CHzf162MFAyt/lgCLp2E9tasSW
 gpHQs0fu78lxee5U7TkYYhFbP2TGPHqa8SJewhUFSSJngddWEvB+1bh27/xiDA+JRoVV5Xqhr8vx6
 EyxkmqPi+jbH2efO8jhq1a7JN7RkTCZLGB3RJjFFXJ0TZq9yoEuW/+GgAcMuu4WFh8Ig=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP15P-0006T9-H3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:40:28 +0000
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4a5903bceffso72415681cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749570021; x=1750174821; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWO1qREHpjZ3bVRsBYB1+61JEaUp7BD2y5lRIKZ6PZw=;
 b=FjDuZy3hCsseH8YF2otKpL/zF4AtBDUiz2kc8yLTD7A8sS4OQaF5EyptqtcspoRlrh
 rXqsl7nyVRyC2dRclshE36dpdEJeOkYj9K9xi+lnXNChNA+z4gYCu9nAespBabjnGDYS
 hznAAjCKdlMS9cM0u4KRrNrQX5LvQ7ttHs9hrf4bz5uwccrIVLYzVosQc3uTWRMW7aIo
 eWFNkhDynI3dHb4p5LasYsFL3sXjklNhTgjtsaT4KaI9y4ecpSjIpDRupwC3LVcmRcZO
 vLoxoLE7YTGRjNCtwTcyUQDKIWw8Lu8npwXgete06ZIV2vejVrc9dggJNwO1JYDgvUfI
 7Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749570021; x=1750174821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWO1qREHpjZ3bVRsBYB1+61JEaUp7BD2y5lRIKZ6PZw=;
 b=CLCaCmMbxyTmSQt9xTnBNhWH/qUelsu8GHCPlHOrf3HP/2DlZHdJqMUBagaEJwXicf
 bsaTLXZgv2teTj7CX8x8sog+Mld7MlXLGX++na/IFSBpozGfPKpOGddZF+DAhD1Dk55j
 LnLjv4EJtZWxA7VXkVIscHa4F3TJhsLVA2gI0ZrxM304RPS/S3taSOlewxTaqYQjujG8
 mVfkuXqtyqyMhpo6REqbiHSKnTbTWu5s5l/V/AVT5OF/HhLVrdnBZZjnKYzAy5oHOhrk
 RWj/pZMvKAu4QSzyGdy38G+4aqjuPRObkSFDFa6kuOr/QNqfKZyp+vW5dJw69fvMg76f
 qdhw==
X-Gm-Message-State: AOJu0YxGtOwH3Gm1oWNzDja+JZvzxvt2bBamuWId1/xAullGT0Hnmr35
 KrrYsqglw6vMtxVPG9qV/aOWaN8BMMTemilyRN+IsGIyv1nnRwCSU41yc8k8ww==
X-Gm-Gg: ASbGnctOomFeuP4Ts0We30bRG8IJDfzD59r8lts8gfiPGttae4Q48rcaDCwxy0wKTg6
 P/s3ZTFS8SgrZ1Woa3t7q7HHpote+Wvu+QWPCHFokTXkH+deGFp/y+HxtqpYpVEOPCmXlgJfpRb
 e5epHNbelB/HxwtxQdtQ+a5+jw5h7t2JU5+8odTyzmSICjD+NIkFQQT9lF25GnidFaSLFI1yZ+x
 wxbD73lDHqv7MPs/ZvMaYlshMgJnSUBiZRLF/iixk/6Ipr2s2sSDEvscFo1Yc2MmogZGw+1nFaB
 jrsFvkHmcl07+L5fEtz8C/ZBN4OJvhpiNt77yqwWI7YpWQ82LbyZXRuJu1/5U3yTb7U2mpIy5ce
 bS4I=
X-Google-Smtp-Source: AGHT+IGzZV9QmNYqeJNiduzZ204+fUXWcq56nhDjU26pCu42lbjUCzqcaTI3r2BVZtpph7j7Opc01Q==
X-Received: by 2002:a05:6a21:50f:b0:21a:de8e:44b1 with SMTP id
 adf61e73a8af0-21ee686203dmr25610559637.34.1749559145836; 
 Tue, 10 Jun 2025 05:39:05 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:39:05 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:42 +0800
Message-ID: <20250610123743.667183-33-shengyong1@xiaomi.com>
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
 tests/i_node/README
 | 5 ++ tests/i_node/expect.in | 66 ++++++++++++++++ tests/i_node/script |
 166 +++++++++++++++++++++++++++++++++++++++++ 3 files changed, 237 inserti
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.177 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP15P-0006T9-H3
Subject: [f2fs-dev] [RFC PATCH v2 32/32] tests: add inject testcase of
 injecting node block
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
 tests/i_node/README    |   5 ++
 tests/i_node/expect.in |  66 ++++++++++++++++
 tests/i_node/script    | 166 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+)
 create mode 100644 tests/i_node/README
 create mode 100644 tests/i_node/expect.in
 create mode 100644 tests/i_node/script

diff --git a/tests/i_node/README b/tests/i_node/README
new file mode 100644
index 000000000000..c95f0d39df3c
--- /dev/null
+++ b/tests/i_node/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. inject members in node
+3. verify injected fields with dump.f2fs
+4. restore injected fields
+5. fsck checks f2fs image
diff --git a/tests/i_node/expect.in b/tests/i_node/expect.in
new file mode 100644
index 000000000000..17f3a2ff3c84
--- /dev/null
+++ b/tests/i_node/expect.in
@@ -0,0 +1,66 @@
+original nid:
+[dump_node: x] node_blk.footer.nid [_INO_]
+original ino:
+[dump_node: x] node_blk.footer.ino [_INO_]
+inject nid:
+[dump_node: x] node_blk.footer.nid [0x123450]
+inject ino:
+[dump_node: x] node_blk.footer.ino [0x123451]
+restore nid:
+[dump_node: x] node_blk.footer.nid [_INO_]
+restore ino:
+[dump_node: x] node_blk.footer.ino [_INO_]
+original i_mode:
+i_mode [_MODE_HEX_:_MODE_DEC_]
+original i_advise:
+i_advise [_ADVISE_HEX_:_ADVISE_DEC_]
+original i_inline:
+i_inline [_INLINE_HEX_:_INLINE_DEC_]
+original i_links:
+i_links [0x1:1]
+original i_size:
+i_size [0x201000:2101248]
+original i_blocks:
+i_blocks [_BLKS_HEX_:_BLKS_DEC_]
+original i_ext:
+i_ext:fofs:_EXT_FOFS_ blkaddr:_EXT_BLKADDR_ len:_EXT_LEN_
+original i_extra_isize:
+i_extra_isize [_EXTRA_HEX_:_EXTRA_DEC_]
+original i_nid[0]:
+i_nid[0] [0x0:0]
+inject i_mode:
+i_mode [0x1:1]
+inject i_advise:
+i_advise [0x2:2]
+inject i_inline:
+i_inline [0x3:3]
+inject i_links:
+i_links [0x4:4]
+inject i_size:
+i_size [0x5:5]
+inject i_blocks:
+i_blocks [0x6:6]
+inject i_ext:
+i_ext:fofs:7 blkaddr:8 len:9
+inject i_extra_isize:
+i_extra_isize [0xa:10]
+inject i_nid[0]:
+i_nid[0] [0xc:12]
+restore i_mode:
+i_mode [_MODE_HEX_:_MODE_DEC_]
+restore i_advise:
+i_advise [_ADVISE_HEX_:_ADVISE_DEC_]
+restore i_inline:
+i_inline [_INLINE_HEX_:_INLINE_DEC_]
+restore i_links:
+i_links [0x1:1]
+restore i_size:
+i_size [0x201000:2101248]
+restore i_blocks:
+i_blocks [_BLKS_HEX_:_BLKS_DEC_]
+restore i_ext:
+i_ext:fofs:_EXT_FOFS_ blkaddr:_EXT_BLKADDR_ len:_EXT_LEN_
+restore i_extra_isize:
+i_extra_isize [_EXTRA_HEX_:_EXTRA_DEC_]
+restore i_nid[0]:
+i_nid[0] [0x0:0]
diff --git a/tests/i_node/script b/tests/i_node/script
new file mode 100644
index 000000000000..2e98cfc56f05
--- /dev/null
+++ b/tests/i_node/script
@@ -0,0 +1,166 @@
+#!/bin/bash
+
+DESC="verify injecting node"
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
+orig_node=`$DUMP $DUMP_OPTS -i $ino -d 1 $META`
+echo "$orig_node" >> $LOG
+blkaddr=`get_mb_val "$orig_node" 'i_addr\[0x100\]'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+segno=`get_segno $blkaddr`
+
+# inject and restore nid and ino in node footer
+echo "original nid:" > $OUT
+echo "$orig_node" | grep 'node_blk\.footer\.nid' >> $OUT
+echo "original ino:" >> $OUT
+echo "$orig_node" | grep 'node_blk\.footer\.ino' >> $OUT
+$INJECT --node --nid $ino --mb nid --val 0x123450 $META >> $LOG
+$INJECT --node --nid $ino --mb ino --val 0x123451 $META >> $LOG
+cur_node=`$DUMP $DUMP_OPTS -i $ino -d 1 $META`
+echo "inject nid:" >> $OUT
+echo "$cur_node" | grep 'node_blk\.footer\.nid' >> $OUT
+echo "inject ino:" >> $OUT
+echo "$cur_node" | grep 'node_blk\.footer\.ino' >> $OUT
+$INJECT --node --nid $ino --mb nid --val $ino $META >> $LOG
+$INJECT --node --nid $ino --mb ino --val $ino $META >> $LOG
+cur_node=`$DUMP $DUMP_OPTS -i $ino -d 1 $META`
+echo "restore nid:" >> $OUT
+echo "$cur_node" | grep 'node_blk\.footer\.nid' >> $OUT
+echo "restore ino:" >> $OUT
+echo "$cur_node" | grep 'node_blk\.footer\.ino' >> $OUT
+
+# inject and restore inode members
+echo "original i_mode:" >> $OUT
+get_mb "$orig_node" i_mode >> $OUT
+orig_mode_val=`get_mb_val "$orig_node" i_mode`
+echo "original i_advise:" >> $OUT
+get_mb "$orig_node" i_advise >> $OUT
+orig_advise_val=`get_mb_val "$orig_node" i_advise`
+echo "original i_inline:" >> $OUT
+get_mb "$orig_node" i_inline >> $OUT
+orig_inline_val=`get_mb_val "$orig_node" i_inline`
+echo "original i_links:" >> $OUT
+get_mb "$orig_node" i_links >> $OUT
+orig_links_val=`get_mb_val "$orig_node" i_links`
+echo "original i_size:" >> $OUT
+get_mb "$orig_node" i_size >> $OUT
+orig_size_val=`get_mb_val "$orig_node" i_size`
+echo "original i_blocks:" >> $OUT
+get_mb "$orig_node" i_blocks >> $OUT
+orig_blocks_val=`get_mb_val "$orig_node" i_blocks`
+echo "original i_ext:" >> $OUT
+orig_ext=`get_mb "$orig_node" 'i_ext:'`
+echo "$orig_ext" >> $OUT
+orig_ext_fofs_val=`echo "$orig_ext" | sed "s/.*fofs:\([0-9a-fA-F]*\).*/0x\1/g"`
+orig_ext_blkaddr_val=`echo "$orig_ext" | sed "s/.*blkaddr:\([0-9a-fA-F]*\).*/0x\1/g"`
+orig_ext_len_val=`echo "$orig_ext" | sed "s/.*len:\([0-9a-fA-F]*\).*/0x\1/g"`
+echo "original i_extra_isize:" >> $OUT
+get_mb "$orig_node" i_extra_isize >> $OUT
+orig_extra_isize_val=`get_mb_val "$orig_node" i_extra_isize`
+echo "original i_nid[0]:" >> $OUT
+get_mb "$orig_node" 'i_nid\[0\]' >> $OUT
+orig_nid_val=0
+$INJECT --node --nid $ino --mb i_mode --val 0x1 $META >> $LOG
+$INJECT --node --nid $ino --mb i_advise --val 0x2 $META >> $LOG
+$INJECT --node --nid $ino --mb i_inline --val 0x3 $META >> $LOG
+$INJECT --node --nid $ino --mb i_links --val 0x4 $META >> $LOG
+$INJECT --node --nid $ino --mb i_size --val 0x5 $META >> $LOG
+$INJECT --node --nid $ino --mb i_blocks --val 0x6 $META >> $LOG
+$INJECT --node --nid $ino --mb i_ext.fofs --val 0x7 $META >> $LOG
+$INJECT --node --nid $ino --mb i_ext.blk_addr --val 0x8 $META >> $LOG
+$INJECT --node --nid $ino --mb i_ext.len --val 0x9 $META >> $LOG
+$INJECT --node --nid $ino --mb i_extra_isize --val 0xa $META >> $LOG
+$INJECT --node --nid $ino --mb i_inline_xattr_size --val 0xb $META >> $LOG
+$INJECT --node --nid $ino --mb i_nid --idx 0 --val 0xc $META >> $LOG
+cur_node=`$DUMP $DUMP_OPTS -i $ino -d 1 $META`
+echo "inject i_mode:" >> $OUT
+get_mb "$cur_node" i_mode >> $OUT
+echo "inject i_advise:" >> $OUT
+get_mb "$cur_node" i_advise >> $OUT
+echo "inject i_inline:" >> $OUT
+get_mb "$cur_node" i_inline >> $OUT
+echo "inject i_links:" >> $OUT
+get_mb "$cur_node" i_links >> $OUT
+echo "inject i_size:" >> $OUT
+get_mb "$cur_node" i_size >> $OUT
+echo "inject i_blocks:" >> $OUT
+get_mb "$cur_node" i_blocks >> $OUT
+echo "inject i_ext:" >> $OUT
+get_mb "$cur_node" 'i_ext:' >> $OUT
+echo "inject i_extra_isize:" >> $OUT
+get_mb "$cur_node" i_extra_isize >> $OUT
+echo "inject i_nid[0]:" >> $OUT
+get_mb "$cur_node" 'i_nid\[0\]' >> $OUT
+$INJECT --node --nid $ino --mb i_mode --val $orig_mode_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_advise --val $orig_advise_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_inline --val $orig_inline_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_links --val $orig_links_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_size --val $orig_size_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_blocks --val $orig_blocks_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_ext.fofs --val $orig_ext_fofs_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_ext.blk_addr --val $orig_ext_blkaddr_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_ext.len --val $orig_ext_len_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_extra_isize --val $orig_extra_isize_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_inline_xattr_size --val $orig_inline_xattr_size_val $META >> $LOG
+$INJECT --node --nid $ino --mb i_nid --idx 0 --val $orig_nid_val $META >> $LOG
+cur_node=`$DUMP $DUMP_OPTS -i $ino -d 1 $META`
+echo "restore i_mode:" >> $OUT
+get_mb "$cur_node" i_mode >> $OUT
+echo "restore i_advise:" >> $OUT
+get_mb "$cur_node" i_advise >> $OUT
+echo "restore i_inline:" >> $OUT
+get_mb "$cur_node" i_inline >> $OUT
+echo "restore i_links:" >> $OUT
+get_mb "$cur_node" i_links >> $OUT
+echo "restore i_size:" >> $OUT
+get_mb "$cur_node" i_size >> $OUT
+echo "restore i_blocks:" >> $OUT
+get_mb "$cur_node" i_blocks >> $OUT
+echo "restore i_ext:" >> $OUT
+get_mb "$cur_node" 'i_ext:' >> $OUT
+echo "restore i_extra_isize:" >> $OUT
+get_mb "$cur_node" i_extra_isize >> $OUT
+echo "restore i_nid[0]:" >> $OUT
+get_mb "$cur_node" 'i_nid\[0\]' >> $OUT
+
+$FSCK $FSCK_OPTS -f $META >> $LOG
+if [ $? -ne 0 ]; then
+	echo "fsck fail" >> $OUT
+fi
+
+hex=`printf "0x%x" $ino`
+sed "s/_INO_/$hex/g" $TESTDIR/expect.in > $TESTDIR/expect
+dec=$((orig_mode_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_MODE_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_MODE_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_advise_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ADVISE_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ADVISE_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_inline_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_INLINE_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_INLINE_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_blocks_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_BLKS_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_BLKS_DEC_/$dec/g" $TESTDIR/expect
+hex=`printf "%x" $((orig_ext_fofs_val))`
+sed -i "s/_EXT_FOFS_/$hex/g" $TESTDIR/expect
+hex=`printf "%x" $((orig_ext_blkaddr_val))`
+sed -i "s/_EXT_BLKADDR_/$hex/g" $TESTDIR/expect
+hex=`printf "%x" $((orig_ext_len_val))`
+sed -i "s/_EXT_LEN_/$hex/g" $TESTDIR/expect
+dec=$((orig_extra_isize_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_EXTRA_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_EXTRA_DEC_/$dec/g" $TESTDIR/expect
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
