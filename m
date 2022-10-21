Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E393606DCE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:32:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olhpv-0008PM-7y;
	Fri, 21 Oct 2022 02:32:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1olhpt-0008PG-6c
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsvLhV+cbznBpgyq6mtNJgNZycGH3T3tCrg6LonEOp4=; b=i7yJzJNptqry84atrXWeFmfDfg
 nO+oeZwQo51eO4zXI2U+ot92+RXvqLc0lQ6+Nup3HRj1D30PvFG/yhAdGsMUpKAB7sryDQwzhegSU
 +hEJ3ZMa46MHd9G7PDZMRbxfO3h7YiKlEib24ZioKyY7zVPSGkSbgY/cPfjhDckhROLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EsvLhV+cbznBpgyq6mtNJgNZycGH3T3tCrg6LonEOp4=; b=d
 Kwjl0nrykw+fgmui1DS8NkNv2OfrdFvSBw2O6e9IKn0kdc+ksTWv/AxczSUIK1GzpuLxUNAYMF7KV
 atrYt5XNSj49XLHdukwiuGB/y4QP88IhEmKKr/6+BIRLEfa+KIBlEL3Tbt+gw+fqhYC/gxCaAMx70
 uc2fQQGM1tfbXUU0=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1olhpp-00BfRq-0G for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:32:37 +0000
Received: by mail-pl1-f180.google.com with SMTP id k9so1045916pll.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Oct 2022 19:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EsvLhV+cbznBpgyq6mtNJgNZycGH3T3tCrg6LonEOp4=;
 b=j/PynzD1zbRkpecTxyYqHEf9VOlhdAnPFJOV+1z+gFkB1FSq6HINXXtTMGuFuIo6Ep
 wEQl2D20Ee1cv5aTkporTtwe1KX0xnjVB6MRsj5mecJRoCDoG0OyB663+yD0NRGrxC2n
 Wj61WEZrQUN9h6rOa7UpVVm+goCuZjsCSElc/VBeiDJvdjyNp6cFoc5JaZlCj6rKVBWe
 mrahL6X5dThTNxDZ0uSvimWvEHIM7ToHfEcJ4rD7Wqvc/AVQiiRkyq02KQ87OM7lzVt1
 1LKIjfxxR0cpcrkZS+dcv3HhTYsjuDY5Qf8G60IcL5OnioJ/qJr9awS47USK4Vsqa9Pq
 UrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EsvLhV+cbznBpgyq6mtNJgNZycGH3T3tCrg6LonEOp4=;
 b=yZzQuSAcquG4j9sXtqJ7WIUOSKR+CT1bISfHmcEc95voF4yBWl2nBo9fm4tBy9+YlO
 NN92oS2j6Jcw1IYnkUUBmtAjZJdD/hlJa7BpO0BydqXVo89X0W6/0H3M5kSS6pNYUlsq
 /eemfhmGVLQiOCIEqIjY/W+2dsNoPpgm7m9kaEDhcNSXVyL5OOnbdafulhIwuj2WzpsR
 WcMJLfn+gmyVFVXHEs4K4Zq20mOwRFSr35ah2pO7cYFvdOrS9sLoHPbIZt+1HZisxkz0
 Dhe4CrfNL4tXcm4/uztbZdRBay3IGhBkh8q0eRaBjULZ7dp4BUI+nu9dthhZnQK+tAGj
 5DvA==
X-Gm-Message-State: ACrzQf3opUUEEnSQ/HdIRluZLvzFIwKpuHdN27YIg/4foemgrz6ebKtD
 eN/NtUcsNbeuSh6uxeUOX88=
X-Google-Smtp-Source: AMsMyM7XIQHtE3EZUCPvUCzBIEy8P10eqv0oWue4UomJiecL9ou04VigPmr21N4CME/yWIltLfobfw==
X-Received: by 2002:a17:902:ed93:b0:185:4421:24b with SMTP id
 e19-20020a170902ed9300b001854421024bmr16735349plj.158.1666319547482; 
 Thu, 20 Oct 2022 19:32:27 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 v129-20020a626187000000b00565f4efbc0csm1291080pfb.49.2022.10.20.19.32.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Oct 2022 19:32:25 -0700 (PDT)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 21 Oct 2022 10:31:36 +0800
Message-Id: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Currently IPU policy for fdatasync is coupled with
 F2FS_IPU_FSYNC.
 Fix to apply it to all IPU policy. Signed-off-by: qixiaoyu1 --- fs/f2fs/data.c
 | 8 +++----- fs/f2fs/file.c | 4 +++- 2 files changed, 6 insertions(+), 6
 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1olhpp-00BfRq-0G
Subject: [f2fs-dev] [PATCH] f2fs: separate IPU policy for fdatasync from
 F2FS_IPU_FSYNC
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
Fix to apply it to all IPU policy.

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 fs/f2fs/data.c | 8 +++-----
 fs/f2fs/file.c | 4 +++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a71e818cd67b..fec8e15fe820 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
 			is_inode_flag_set(inode, FI_OPU_WRITE))
 		return false;
+	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
+	if (is_inode_flag_set(inode, FI_NEED_IPU))
+		return true;
 	if (policy & (0x1 << F2FS_IPU_FORCE))
 		return true;
 	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
@@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 			!IS_ENCRYPTED(inode))
 		return true;
 
-	/* this is only set during fdatasync */
-	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
-			is_inode_flag_set(inode, FI_NEED_IPU))
-		return true;
-
 	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
 		return true;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82cda1258227..08091550cdf2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 		goto go_write;
 
 	/* if fdatasync is triggered, let's do in-place-update */
-	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
+	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
+			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
 		set_inode_flag(inode, FI_NEED_IPU);
+
 	ret = file_write_and_wait_range(file, start, end);
 	clear_inode_flag(inode, FI_NEED_IPU);
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
