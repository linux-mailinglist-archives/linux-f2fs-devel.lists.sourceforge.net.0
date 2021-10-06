Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EF424529
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Oct 2021 19:49:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mYB2g-0003Vu-59; Wed, 06 Oct 2021 17:49:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mYB2e-0003Vo-Qk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Oct 2021 17:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4HcW2GcpsNNL2RNx+V2pvD6LIqeWbRwK56YKpdUfUhs=; b=PNixYZ25CTlX8Ej/RAtUebDmY1
 9qrpo3hjmEpp9gOtcbPxroNhPqQybkHsReS3hImHJL84G81tX7cyqVixqAW212jfKlu3WV5xwNJuu
 ik/+BElrGxtL7n5dXDRNMlAgVPvwGo4oiPCUuAc1XhUjbZx/JETjb/aCpJdLa0MZTBCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4HcW2GcpsNNL2RNx+V2pvD6LIqeWbRwK56YKpdUfUhs=; b=Y
 FBncLMlqoaYylDmRMjb14Rc9MxN0jwtsQt8j40qUWOOEwJdVy8ri29yK5POc3z4UvMox0EHwVXY0/
 7QAsM5WwanQIag6ts0vNPUlRXeiHdN53V9fFxNvkTpp4pORDiS04cJR0cTJgeev6xqN3M5rZgG+9S
 p+9Xga5zxb/YltPk=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mYB2e-009CFD-5K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Oct 2021 17:49:20 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so5004762pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Oct 2021 10:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4HcW2GcpsNNL2RNx+V2pvD6LIqeWbRwK56YKpdUfUhs=;
 b=gswwGM44VO0kIjdkDXWhjtflwIMLmTLf6OqX8tmV1DAnYMWArNF8/BNv8L4wyA8pV5
 Sf9oOXYIAsCAHTh4bg1GMiXy+pSuiym0F3AgopjW4dURiusNl3UuLvF/QfVdijJaoth2
 7VQSHpYX6ZZsslgKJiihIA9z11E/YUCxDvwdyWYMSmbtrBXdIbiOOgSm1qHv5McHR6qg
 f6JKhkw9FHdWCz76a45863+kV7LsC5b4OCtdc72b6riu1GMEhY748UJ0VNzySybGkgXy
 u+zh5cckCJaDR/vNHxP2XoA9uR4Yz0aAbrhlRmzfBAdM9Q3K1rp+zrMdaJG7PVLcUZuP
 0a8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4HcW2GcpsNNL2RNx+V2pvD6LIqeWbRwK56YKpdUfUhs=;
 b=nD0RFb5PfW55ed0Q9AlBZIfls/S1PDEUrdrbMO3TKZdfF7RLI33lnt04iFBzsnLGvD
 8dw4759WeD5oMoHhoecsI7jf3CRLldOXbFuZjzWkko6UvCjhDMJKOR1SG5TFuE9WVWnH
 tAxgYCOeRHNy/lR5nqPLhgF2oEeSssh/9TOH0p13Exh460iuT7HEEkjfbXjKenZBX/CM
 N/CihzrW67RZxa2hNUJYRai095OvGVZ39jSsBxFFaKLCI+A8OsOBj+LmBn3A3tExq9eK
 GJGjBnQZMBQa1Qgwx251Rv/EngqGnTgRF0misIqjmMBf67eeuNU1kkd61pm85LGeJXCt
 s+9g==
X-Gm-Message-State: AOAM532sAXQTlWzWg5VZOGMAFohSO2ErlneI9pAlRyLzags5R9zQ6+Ee
 rlfnNn8CzI807ZEDJgb3b4AUFWJ5aQM=
X-Google-Smtp-Source: ABdhPJyQFhGksSNRCJjvOaq5f9X7UwV1Difk/RELkxVheHp1T5Zr/27kUa/bMc3TtYDkwqO5/6EIOw==
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr1636pjb.24.1633542554531; 
 Wed, 06 Oct 2021 10:49:14 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:4a09:1ff8:fcd9:33e6])
 by smtp.gmail.com with ESMTPSA id s2sm20981068pfe.215.2021.10.06.10.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:49:13 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  6 Oct 2021 10:49:10 -0700
Message-Id: <20211006174910.2964885-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Need to include non-compressed blocks in
 compr_written_block to estimate average compression ratio more accurately.
 Signed-off-by: Daeho Jeong --- fs/f2fs/compress.c | 1 + 1 file changed, 1
 insertion(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mYB2e-009CFD-5K
Subject: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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

Need to include non-compressed blocks in compr_written_block to
estimate average compression ratio more accurately.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c1bf9ad4c220..9b663eaf4805 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1530,6 +1530,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	if (cluster_may_compress(cc)) {
 		err = f2fs_compress_pages(cc);
 		if (err == -EAGAIN) {
+			add_compr_block_stat(cc->inode, cc->cluster_size);
 			goto write;
 		} else if (err) {
 			f2fs_put_rpages_wbc(cc, wbc, true, 1);
-- 
2.33.0.882.g93a45727a2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
