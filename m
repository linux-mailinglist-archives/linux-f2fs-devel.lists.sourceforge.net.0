Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE501E9BEC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 05:04:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfakD-0000QD-MS; Mon, 01 Jun 2020 03:04:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jfakC-0000Q6-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 03:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HadkBgfXSvOfA9Fsm3GngQ/GKJaEcnZZDK/WEOwrtLQ=; b=dp70pNiAByMH+JdIjfgpUiOrKg
 hyBUHtydahvHztu/aOdFQGqtSQn50WrDK6vPSOuJYmFlcxY5rNjc9tVfnJ0zC0+XZxDFSoZ3xgFY3
 dYf7CivNa5b0KVfi9lWyTGnDhRTR11E1td/QgVkSPxwqn0BrZvlvtrCbPlB1CllhG2ow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HadkBgfXSvOfA9Fsm3GngQ/GKJaEcnZZDK/WEOwrtLQ=; b=l
 3hkiaT8ZrgG5xnvgY+MdbM+QL9tixZjyrikKT4vIDekKApb8XaH4F0ARiA6lB9yGHx7xUvcFKipY4
 ow7idSmo818i/cmijSPtLI6vsEt8IdRnOn1O/eGFXYQQGKyLgbK4OJ+hCfBn3/5DsWfEIDf3spvAl
 SONdPJdgEClT1cjM=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfakA-002ej8-FL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 03:04:08 +0000
Received: by mail-pj1-f66.google.com with SMTP id nm22so3659892pjb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 May 2020 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HadkBgfXSvOfA9Fsm3GngQ/GKJaEcnZZDK/WEOwrtLQ=;
 b=E+nVziuPYFDx9OPuREfXXWQ3zM3OZkXI7nyBKlK2dCE83jGCQ6GM9qdl9YCy6hkQme
 VKD9VQFLWtaG0H98z3XMEnsunY32HRSyHk1vTuWd07zz/8XIZgbkGTbJZOYIELO1PQlq
 v7Iy+E4/LPQN5AM2F81SFoDbieOULD0hbLQHKHQ26Cj0Qx7nysTZJAm8esDTIfhbWFqC
 YuVYE1yGiPEjE/kME1raCRwcxcPoDdmft/9Lia9J4DheGLuJxpDpGRem/0KHR2Kss8GA
 mFu5iufKaxRW8EmtdofajikX+qtPyQsHykLO0NghYpsmrX5D1ee+dddcjBQCV0ODp0Hc
 MHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HadkBgfXSvOfA9Fsm3GngQ/GKJaEcnZZDK/WEOwrtLQ=;
 b=ZU/psb/9VP6JvafebLB9vZZWOJmwdB52OHSOMWVzBJAY18OfUIwzdVU++4jvadgQAS
 TRl71iDwt9/l6MQ5ZRC9xCNqyp+gSA56/zgEjdpH3DZ6NrGPfkDvp+VJpoJnGa7CP3vv
 V2Fv/xCNyMbpHHHYtlyHcxFatZYq8gpyqXLlfXcKaHidGlex8QCHJZ4JbpenV+yXpRMS
 IohXpm5rPoiZhI/2kGGt4Br6fCd7m3NNmEKWfmsdFu/UYngn1M/NMX5SYzFHP/lr9Gno
 9/mURWj03VfiB9/0WuAFwVXg7pX8XLyRdOVwqXD+NJES7xsba1mPeOlRPU9zs8PKwYC4
 hpEQ==
X-Gm-Message-State: AOAM533rX1VM3GwodZnTXoNi6l+UidYN8c03Hw5Vppl8zKUSFyC5IBmq
 O+Qkbc2l0uvaYOO7nHk4XUU=
X-Google-Smtp-Source: ABdhPJwxtN/vAjXXA+l8/UtASUXUx/s/K35KFUO3vjZQcIlpVB5qCr6eFRZboIt3GPFfWb5G9bysYg==
X-Received: by 2002:a17:90a:64ce:: with SMTP id
 i14mr20986083pjm.48.1590980633691; 
 Sun, 31 May 2020 20:03:53 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id l23sm12589084pff.80.2020.05.31.20.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 20:03:53 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Jun 2020 12:03:47 +0900
Message-Id: <20200601030347.112984-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jfakA-002ej8-FL
Subject: [f2fs-dev] [PATCH] f2fs: protect new segment allocation in
 expand_inode_data
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Found a new segemnt allocation without f2fs_lock_op() in
expand_inode_data(). So, when we do fallocate() for a pinned file
and trigger checkpoint very frequently and simultaneously. F2FS gets
stuck in the below code of do_checkpoint() forever.

  f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
  /* Wait for all dirty meta pages to be submitted for IO */
                                                <= if fallocate() here,
  f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META); <= it'll wait forever.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f7de2a1da528..14ace885baa9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1660,7 +1660,11 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 		down_write(&sbi->pin_sem);
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
+
+		f2fs_lock_op(sbi);
 		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
+		f2fs_unlock_op(sbi);
+
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
 		up_write(&sbi->pin_sem);
 
-- 
2.27.0.rc0.183.gde8f92d652-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
