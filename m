Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F710AD3CB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJ66mE/A/WZkTT1ovGpuLwj7j1Vb8kwnAL1HoN7uCzk=; b=BsyTaiA5k9y1CqV/fXSojcQpUA
	/O4jSAENfhI7jf1ePS/KKelqHla/3zp9PzC5xqEZu83iW6mGB5kYYHLz0Fm4aHU9/bFzbqbsCbSyj
	Q8cnW0alNdDaUDqXMvPormtziyha2hxVV9/I9xegtAi3MT5l17LNBubB1AQ9ONnkmrBs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0nV-0003iT-4e;
	Tue, 10 Jun 2025 15:21:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0nU-0003hS-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3gCMTKNi77CA/eM6isaHiq32av1/cgavzeRb84Y1dkc=; b=SVEH6U7r1/w+gvf4e92As1ErFD
 uvfk3sKGoE2GDNQBbztsqystgQZFS4V5ZuC1vtU21I4yJevpnvk85ZEBxnfTOPedN9uNkZ+2RpnMC
 rh8mImUdeRvlVYZ3hAACsZ9mNFJDOLoAqTvmjMsuoL4vRaSJ6TyVo9o5TOPHXFw8pqwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3gCMTKNi77CA/eM6isaHiq32av1/cgavzeRb84Y1dkc=; b=Xs+Ld/yy0EYRcnSgWCvTPJtDg/
 MoWok3sKnXgWhk4w6VvUBjbKK8RU2gXNumOJqa6itV5L3WgVedyLXXFe4wxvBqwTgzwhdkdUA8Bjx
 XTF/TZemTVERqo17bmpfcuOaxhCE2jgx7GTAzI0Yrk+XFmo+Xw+8Dg/wrdfI+F2TtHBk=;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0nJ-00045M-Kq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:21:47 +0000
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4e7949d9753so849864137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568895; x=1750173695; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gCMTKNi77CA/eM6isaHiq32av1/cgavzeRb84Y1dkc=;
 b=BNWZff6IOK5+pBW3R4VRRHKcJp924eJwwqyk04ph/5jfugy2wfw86nhl+EZtHBYbO4
 1dTqV8U4PMwdwiHw3bbZL8wYGyAxDGGqhHglfrofzBar2PcBly29lbRGQNYNDkCyq1us
 ITQaRHUcr2ETLyNoz/wumpOHu9swgGMtJQvs10VWXXI0p6Lm8pkclOur2jO8GrzBU1jx
 TK6TEPsurquaE3aneAuWoH631TX9Nl6mwk9virvcwREWYHc6V8YJlNSuLLxkAV5xP9B+
 xVG0JoTNHQaBU/r02doP7FsHtB1Y2sU4drhrBIof+gCYUt/wvrPNBd0MtruL0Vj4xJPf
 Ihtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568895; x=1750173695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gCMTKNi77CA/eM6isaHiq32av1/cgavzeRb84Y1dkc=;
 b=iraCBwFJw9tKqT1qBonw02O+i85AgGgiZm/ivHuYECfFrg4Q64fMzM2JGfAXLFOAp4
 w6QQv/c85QfhKwV+e/JSthN+OTF0c2rEu1mnMpHngoT1isdx2KQ8JZwBQ9y8egorTNhD
 aZO0LGROqGx3zWRLhhF1+NnQFkQWg+85RS6BKGoFw3gVMAbUI+j2BJEf1ZaMvARcqDbq
 htpEueW6uQzRi75VVYNk/k7WgjX3MBcEA/cn/ZXzlGSB6LD/zn4MCOFRN/i+VN7u1+SC
 9JtYOlKDWEHVi6hm/DApUFzVn+b9nrFHGUnKkC5G8ux4+kuvuuP2ngW/zDJGbu8pOl+J
 G8kQ==
X-Gm-Message-State: AOJu0YyUJdgiGeCNgeZ0o1GXzDpSisnbhOuAGpHs0agWZPULCdpx8Lz/
 7chap7TOcleNtG9fEfazxCqKZxv3FxHz9YUgK3jdBNoHbX+jwdLEejjddmoOOA==
X-Gm-Gg: ASbGncuoSEmX2L93qBkv4M214iG+dBWzBKp0tStcWULyvt/qXZKcib9wdFBJilTlk3S
 jfJ8SRXILiD1LLl5B6pUFQ8XpEoh1HoNS5pHtF+L3ykt+ifm8lFeElaoHs6PT9MRLXidBTh29HI
 6WGIs5xcs741MaajcnsdU4iJ09jSHdeAXixXFMkeWsqI4CttpCcVcTf1G30IeXvTpcwk5imXc5Y
 buGvqGjFljEuP8Ty0Sq2KvSFhTNm0diBAnIEuVKAHjj3iT0FnxZcHYey0kTtHQEot4Rj8hqX9dD
 vbxwmbitr1fK+DUQIZbWT7yr7iuq5SNQyoA9fDc8WypHdxx4fuHPgjfZHkBZh3lVfVnuQRgmR9b
 PISU=
X-Google-Smtp-Source: AGHT+IFlb7OOGw4y0ruykjlOkHtEj5ShNE5SAxs/fTDPYLVXdHsEhpEND2Gz2TQY1ykx257JAJ+hWw==
X-Received: by 2002:a05:6a00:3cc8:b0:740:9c57:3907 with SMTP id
 d2e1a72fcca58-74827f15b4dmr24679283b3a.19.1749559143651; 
 Tue, 10 Jun 2025 05:39:03 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:39:03 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:41 +0800
Message-ID: <20250610123743.667183-32-shengyong1@xiaomi.com>
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
 tests/i_meta/README
 | 5 + tests/i_meta/expect.in | 60 ++++++++++++ tests/i_meta/script | 212
 +++++++++++++++++++++++++++++++++++++++++ 3 files changed, 277 insertions(+
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.46 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
X-Headers-End: 1uP0nJ-00045M-Kq
Subject: [f2fs-dev] [RFC PATCH v2 31/32] tests: add inject testcase of
 injecting META area
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
 tests/i_meta/README    |   5 +
 tests/i_meta/expect.in |  60 ++++++++++++
 tests/i_meta/script    | 212 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 tests/i_meta/README
 create mode 100644 tests/i_meta/expect.in
 create mode 100644 tests/i_meta/script

diff --git a/tests/i_meta/README b/tests/i_meta/README
new file mode 100644
index 000000000000..2ad5bd5d90c5
--- /dev/null
+++ b/tests/i_meta/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. inject members in META area
+3. verify injected fields with dump.f2fs
+4. restore injected fields
+5. fsck checks f2fs image
diff --git a/tests/i_meta/expect.in b/tests/i_meta/expect.in
new file mode 100644
index 000000000000..f9a306eaa918
--- /dev/null
+++ b/tests/i_meta/expect.in
@@ -0,0 +1,60 @@
+original feature:_ORIG_FEATURE_
+inject feature:feature [0x12345:74565]
+restore feature:_ORIG_FEATURE_
+original devs.path:devs[i].path [_ORIG_PATH_]
+inject devs.path:devs[i].path [_INJECT_PATH_]
+restore devs.path:devs[i].path [_ORIG_PATH_]
+original checkpoint_ver:
+checkpoint_ver [_ORIG_CPVER_HEX_:_ORIG_CPVER_DEC_]
+original ckpt_flags:
+ckpt_flags [_ORIG_FLAGS_HEX_:_ORIG_FLAGS_DEC_]
+original cur_node_segno[1]:
+cur_node_segno[1] [_ORIG_CUR_NODE_SEGNO_HEX_:_ORIG_CUR_NODE_SEGNO_DEC_]
+original cur_node_blkoff[1]:
+cur_node_blkoff[1] [_ORIG_CUR_NODE_BLKOFF_HEX_:_ORIG_CUR_NODE_BLKOFF_DEC_]
+original cur_data_segno[2]:
+cur_data_segno[2] [_ORIG_CUR_DATA_SEGNO_HEX_:_ORIG_CUR_DATA_SEGNO_DEC_]
+original cur_data_blkoff[2]:
+cur_data_blkoff[2] [_ORIG_CUR_DATA_BLKOFF_HEX_:_ORIG_CUR_DATA_BLKOFF_DEC_]
+original elapsed_time:
+elapsed_time [_ORIG_ELAPSED_TIME_HEX_:_ORIG_ELAPSED_TIME_DEC_]
+inject checkpoint_ver:
+checkpoint_ver [0xffffffffffffff0:1152921504606846960]
+inject ckpt_flags:
+ckpt_flags [0x12345:74565]
+inject cur_node_segno[1]:
+cur_node_segno[1] [0x1:1]
+inject cur_node_blkoff[1]:
+cur_node_blkoff[1] [0x2:2]
+inject cur_data_segno[2]:
+cur_data_segno[2] [0x3:3]
+inject cur_data_blkoff[2]:
+cur_data_blkoff[2] [0x4:4]
+inject elapsed_time:
+elapsed_time [0xffff0000:4294901760]
+restore checkpoint_ver:
+checkpoint_ver [_ORIG_CPVER_HEX_:_ORIG_CPVER_DEC_]
+restore ckpt_flags:
+ckpt_flags [_ORIG_FLAGS_HEX_:_ORIG_FLAGS_DEC_]
+restore cur_node_segno[1]:
+cur_node_segno[1] [_ORIG_CUR_NODE_SEGNO_HEX_:_ORIG_CUR_NODE_SEGNO_DEC_]
+restore cur_node_blkoff[1]:
+cur_node_blkoff[1] [_ORIG_CUR_NODE_BLKOFF_HEX_:_ORIG_CUR_NODE_BLKOFF_DEC_]
+restore cur_data_segno[2]:
+cur_data_segno[2] [_ORIG_CUR_DATA_SEGNO_HEX_:_ORIG_CUR_DATA_SEGNO_DEC_]
+restore cur_data_blkoff[2]:
+cur_data_blkoff[2] [_ORIG_CUR_DATA_BLKOFF_HEX_:_ORIG_CUR_DATA_BLKOFF_DEC_]
+restore elapsed_time:
+elapsed_time [_ORIG_ELAPSED_TIME_HEX_:_ORIG_ELAPSED_TIME_DEC_]
+original nat entry:
+nid:_INO_ ino:_INO_ ver:0 offset:0
+inject nat entry:
+nid:_INO_ ino:_INO_ ver:18 offset:0
+restore nat entry:
+nid:_INO_ ino:_INO_ ver:0 offset:0
+original sit entry:
+segno:_SEGNO_ vblocks:512 seg_type:1 mtime:0
+inject sit entry:
+segno:_SEGNO_ vblocks:512 seg_type:1 mtime:74565
+restore sit entry:
+segno:_SEGNO_ vblocks:512 seg_type:1 mtime:0
diff --git a/tests/i_meta/script b/tests/i_meta/script
new file mode 100644
index 000000000000..c1484bf470f5
--- /dev/null
+++ b/tests/i_meta/script
@@ -0,0 +1,212 @@
+#!/bin/bash
+
+DESC="verify injecting fields in META area"
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
+segno=`get_segno $blkaddr`
+echo "ino:$ino blkaddr:$blkaddr segno:$segno" >> $LOG
+
+## inject super block
+# member "magic", "s_stop_reason" and "s_errors" are verified by
+# f_sb_bad_magic and f_sb_errors
+
+orig_sb=`get_sb $META`
+orig_feats_val=`get_mb_val "$orig_sb" feature`
+orig_path_str=`get_mb_val "$orig_sb" 'devs\[i\]\.path'`
+
+# inject and restore feature
+orig_feats=`echo "$orig_sb" | grep "^feature" | trim_extra_space`
+echo "original feature:$orig_feats" > $OUT
+$INJECT --sb 0 --mb feature --val 0x12345 $META >> $LOG
+cur_sb=`get_sb $META`
+cur_feats=`echo "$cur_sb" | grep "^feature" | trim_extra_space`
+echo "inject feature:$cur_feats" >> $OUT
+$INJECT --sb 0 --mb feature --val $orig_feats_val $META >> $LOG
+cur_sb=`get_sb $META`
+cur_feats=`echo "$cur_sb" | grep "^feature" | trim_extra_space`
+echo "restore feature:$cur_feats" >> $OUT
+
+# inject and restore the first devs.path
+orig_path=`echo "$orig_sb" | grep '^devs\[i\]\.path' | awk "NR==1" | trim_extra_space`
+if [ x"$orig_path" = x"" ]; then
+	echo "original devs.path:devs[i].path []" >> $OUT
+	echo "inject devs.path:devs[i].path []" >> $OUT
+	echo "restore devs.path:devs[i].path []" >> $OUT
+else
+	echo "original devs.path:$orig_path" >> $OUT
+	new_meta_path=$TESTDIR/new_meta
+	rm -f $new_meta_path
+	ln -s $META $new_meta_path
+	$INJECT --sb 0 --mb devs.path --idx 0 --str $new_meta_path $META >> $LOG
+	cur_sb=`get_sb $new_meta_path`
+	cur_path=`echo "$cur_sb" | grep '^devs\[i\]\.path' | awk "NR==1" | trim_extra_space`
+	echo "inject devs.path:$cur_path" >> $OUT
+	$INJECT --sb 0 --mb devs.path --idx 0 --str $orig_path_str $new_meta_path >> $LOG
+	cur_sb=`get_sb $META`
+	cur_path=`echo "$cur_sb" | grep '^devs\[i\]\.path' | awk "NR==1" | trim_extra_space`
+	echo "restore devs.path:$cur_path" >> $OUT
+fi
+
+## inject checkpoint
+# member "next_blkaddr" and "crc" are verified by f_loop_fsync_dnodes and
+# f_cp_bad_crc
+
+# inject and restore cp members
+orig_cp=`get_cp $META`
+echo "original checkpoint_ver:" >> $OUT
+get_mb "$orig_cp" checkpoint_ver >> $OUT
+orig_cpver_val=`get_mb_val "$orig_cp" checkpoint_ver`
+echo "original ckpt_flags:" >> $OUT
+get_mb "$orig_cp" ckpt_flags >> $OUT
+orig_flags_val=`get_mb_val "$orig_cp" ckpt_flags`
+echo "original cur_node_segno[1]:" >> $OUT
+get_mb "$orig_cp" 'cur_node_segno\[1\]' >> $OUT
+orig_cur_node_segno_val=`get_mb_val "$orig_cp" 'cur_node_segno\[1\]'`
+echo "original cur_node_blkoff[1]:" >> $OUT
+get_mb "$orig_cp" 'cur_node_blkoff\[1\]' >> $OUT
+orig_cur_node_blkoff_val=`get_mb_val "$orig_cp" 'cur_node_blkoff\[1\]'`
+echo "original cur_data_segno[2]:" >> $OUT
+get_mb "$orig_cp" 'cur_data_segno\[2\]' >> $OUT
+orig_cur_data_segno_val=`get_mb_val "$orig_cp" 'cur_data_segno\[2\]'`
+echo "original cur_data_blkoff[2]:" >> $OUT
+get_mb "$orig_cp" 'cur_data_blkoff\[2\]' >> $OUT
+orig_cur_data_blkoff_val=`get_mb_val "$orig_cp" 'cur_data_blkoff\[2\]'`
+echo "original elapsed_time:" >> $OUT
+get_mb "$orig_cp" 'elapsed_time' >> $OUT
+orig_elapsed_time_val=`get_mb_val "$orig_cp" elapsed_time`
+$INJECT --cp 0 --mb checkpoint_ver --val 0xffffffffffffff0 $META >> $LOG
+$INJECT --cp 0 --mb ckpt_flags --val 0x12345 $META >> $LOG
+$INJECT --cp 0 --mb cur_node_segno --idx 1 --val 1 $META >> $LOG
+$INJECT --cp 0 --mb cur_node_blkoff --idx 1 --val 2 $META >> $LOG
+$INJECT --cp 0 --mb cur_data_segno --idx 2 --val 3 $META >> $LOG
+$INJECT --cp 0 --mb cur_data_blkoff --idx 2 --val 4 $META >> $LOG
+$INJECT --cp 0 --mb elapsed_time --val 0xffff0000 $META >> $LOG
+cur_cp=`get_cp $META`
+echo "inject checkpoint_ver:" >> $OUT
+get_mb "$cur_cp" checkpoint_ver >> $OUT
+echo "inject ckpt_flags:" >> $OUT
+get_mb "$cur_cp" ckpt_flags >> $OUT
+echo "inject cur_node_segno[1]:" >> $OUT
+get_mb "$cur_cp" 'cur_node_segno\[1\]' >> $OUT
+echo "inject cur_node_blkoff[1]:" >> $OUT
+get_mb "$cur_cp" 'cur_node_blkoff\[1\]' >> $OUT
+echo "inject cur_data_segno[2]:" >> $OUT
+get_mb "$cur_cp" 'cur_data_segno\[2\]' >> $OUT
+echo "inject cur_data_blkoff[2]:" >> $OUT
+get_mb "$cur_cp" 'cur_data_blkoff\[2\]' >> $OUT
+echo "inject elapsed_time:" >> $OUT
+get_mb "$cur_cp" 'elapsed_time' >> $OUT
+$INJECT --cp 0 --mb checkpoint_ver --val $orig_cpver_val $META >> $LOG
+$INJECT --cp 0 --mb ckpt_flags --val $orig_flags_val $META >> $LOG
+$INJECT --cp 0 --mb cur_node_segno --idx 1 --val $orig_cur_node_segno_val $META >> $LOG
+$INJECT --cp 0 --mb cur_node_blkoff --idx 1 --val $orig_cur_node_blkoff_val $META >> $LOG
+$INJECT --cp 0 --mb cur_data_segno --idx 2 --val $orig_cur_data_segno_val $META >> $LOG
+$INJECT --cp 0 --mb cur_data_blkoff --idx 2 --val $orig_cur_data_blkoff_val $META >> $LOG
+$INJECT --cp 0 --mb elapsed_time --val $orig_elapsed_time_val $META >> $LOG
+cur_cp=`get_cp $META`
+echo "restore checkpoint_ver:" >> $OUT
+get_mb "$cur_cp" checkpoint_ver >> $OUT
+echo "restore ckpt_flags:" >> $OUT
+get_mb "$cur_cp" ckpt_flags >> $OUT
+echo "restore cur_node_segno[1]:" >> $OUT
+get_mb "$cur_cp" 'cur_node_segno\[1\]' >> $OUT
+echo "restore cur_node_blkoff[1]:" >> $OUT
+get_mb "$cur_cp" 'cur_node_blkoff\[1\]' >> $OUT
+echo "restore cur_data_segno[2]:" >> $OUT
+get_mb "$cur_cp" 'cur_data_segno\[2\]' >> $OUT
+echo "restore cur_data_blkoff[2]:" >> $OUT
+get_mb "$cur_cp" 'cur_data_blkoff\[2\]' >> $OUT
+echo "restore elapsed_time:" >> $OUT
+get_mb "$cur_cp" 'elapsed_time' >> $OUT
+
+## inject nat entry
+# member "ino" and "block_addr" are verified by f_nat_bad_ino and
+# f_nat_bad_blkaddr
+
+# inject and restore version
+rm -f dump_nat
+$DUMP $DUMP_OPTS -n $ino~$((ino + 1)) $META >> $LOG
+echo "original nat entry:" >> $OUT
+cat dump_nat | trim_extra_space >> $OUT
+orig_ver=0 # orig_ver must be 0 in this testcase
+$INJECT --nat 0 --nid $ino --mb version --val 0x12 $META >> $LOG
+$DUMP $DUMP_OPTS -n $ino~$((ino + 1)) $META >> $LOG
+echo "inject nat entry:" >> $OUT
+cat dump_nat | trim_extra_space >> $OUT
+$INJECT --nat 0 --nid $ino --mb version --val $orig_ver $META >> $LOG
+$DUMP $DUMP_OPTS -n $ino~$((ino + 1)) $META >> $LOG
+echo "restore nat entry:" >> $OUT
+cat dump_nat | trim_extra_space >> $OUT
+
+## inject sit entry
+# member "type", "valid_map" and "vblocks" are verified by f_sit_bad_type,
+# f_sit_bad_valid_blocks and f_sit_bad_vblocks
+
+# inject and restore mtime
+rm -f dump_sit
+$DUMP $DUMP_OPTS -s $segno~$((segno + 1)) $META >> $LOG
+echo "original sit entry:" >> $OUT
+orig_sit=`grep "segno:" dump_sit | trim_extra_space`
+echo "$orig_sit" >> $OUT
+orig_mtime=`echo $orig_sit | sed 's/.* mtime:\([0-9]\{,1\}\) .*/\1/'`
+$INJECT --sit 0 --blk $blkaddr --mb mtime --val 0x12345 $META >> $LOG
+$DUMP $DUMP_OPTS -s $segno~$((segno + 1)) $META >> $LOG
+echo "inject sit entry:" >> $OUT
+grep "segno:" dump_sit | trim_extra_space >> $OUT
+$INJECT --sit 0 --blk $blkaddr --mb mtime --val $orig_mtime $META >> $LOG
+$DUMP $DUMP_OPTS -s $segno~$((segno + 1)) $META >> $LOG
+echo "restore sit entry:" >> $OUT
+grep "segno:" dump_sit | trim_extra_space >> $OUT
+
+## run fsck to check if there are any errors
+$FSCK $FSCK_OPTS -f $META >> $LOG
+if [ $? -ne 0 ]; then
+	echo "fsck fail" >> $OUT
+fi
+
+sed "s/_ORIG_FEATURE_/$orig_feats/g" $TESTDIR/expect.in > $TESTDIR/expect
+# escape '\' in path
+new_meta_path_str=`echo $new_meta_path | sed 's/\\//\\\\\//g'`
+orig_path_str=`echo $orig_path_str | sed 's/\\//\\\\\//g'`
+sed -i "s/_ORIG_PATH_/$orig_path_str/g" $TESTDIR/expect
+sed -i "s/_INJECT_PATH_/$new_meta_path_str/g" $TESTDIR/expect
+dec=$((orig_cpver_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_CPVER_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_CPVER_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_flags_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_FLAGS_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_FLAGS_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_cur_node_segno_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_CUR_NODE_SEGNO_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_CUR_NODE_SEGNO_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_cur_node_blkoff_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_CUR_NODE_BLKOFF_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_CUR_NODE_BLKOFF_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_cur_data_segno_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_CUR_DATA_SEGNO_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_CUR_DATA_SEGNO_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_cur_data_blkoff_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_CUR_DATA_BLKOFF_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_CUR_DATA_BLKOFF_DEC_/$dec/g" $TESTDIR/expect
+dec=$((orig_elapsed_time_val)); hex=`printf "0x%x" $dec`
+sed -i "s/_ORIG_ELAPSED_TIME_HEX_/$hex/g" $TESTDIR/expect
+sed -i "s/_ORIG_ELAPSED_TIME_DEC_/$dec/g" $TESTDIR/expect
+sed -i "s/_INO_/$ino/g" $TESTDIR/expect
+sed -i "s/_SEGNO_/$segno/g" $TESTDIR/expect
+
+check_result
+rm -f $new_meta_path dump_nat dump_sit
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
