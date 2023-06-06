Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE0F724A6C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 19:40:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6af1-00029y-Kh;
	Tue, 06 Jun 2023 17:40:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1q6aez-00029r-MS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 17:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FC01jxOBSLY7ZKXPg/UOaGu8vDRxRyeIgOBpQX22Jyc=; b=WdHFlQFNIyAIoE1pI0+aOp5D8b
 NT49sq32WG+/wPEUOxB72FNMJt3feK1FeSGShFRxuQ4rHb3rM1W91nBCKtu+8h30vjVwIn0Qo82Vb
 2ajDbidxiMwVeJ6u3eLFec/0nYaAei5ekG9hcg2hanXFEPFJ3oU3DMmIM34b7q1VLWmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FC01jxOBSLY7ZKXPg/UOaGu8vDRxRyeIgOBpQX22Jyc=; b=m
 PMcU0+HGx4YvlmOOhiuuthTfU0nZ4zqqwyCEhE4Unn8cXC94tSVPsBBcnJHq0bgp0yPgXlUT26sS+
 vno6qz75b/pqbg9p9KiuON8PF0WbKvbCIx4FzPrBBDpTOm92kHLfvw3bCRAlSZCTW2MNc85714z7E
 bQppMyzttfn0kFjg=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6af0-00CwmC-03 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 17:39:58 +0000
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-543d32eed7cso844641a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686073192; x=1688665192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FC01jxOBSLY7ZKXPg/UOaGu8vDRxRyeIgOBpQX22Jyc=;
 b=CAbk5mQi2P1KsDiLqmuh5rlEyijisBivA760hzTefSWQWlpw7TJLIzVvN5RklboRtr
 14WgBjG8JrA44rskY7oEjPRK+eM720JDUaRgRt/RHP1BfaikiT8inDBh8px4ddQV7PHV
 1FTrHIHe8fZ6jEvpRMymIi0PuyUvITmn4VgPfRYcYhqcn8H9/cDqPBOqAUuC7nZmtDXv
 7IV48/6OP5xb9YYNkDdmfpTuHeEnAIPtcHxLWkSHAoDuAweACUKWYIfA8MdYTysegZR9
 DiIzTKvdjwbzK9qpMp1ZUm1MwVspB91+FcsCnX3iYNDvOy17uBwn9Xu4H2NS+KVWsbqg
 oTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686073192; x=1688665192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FC01jxOBSLY7ZKXPg/UOaGu8vDRxRyeIgOBpQX22Jyc=;
 b=dhB+MCrlwFdKwPkj3Qnu/ZsedM95H/VMyACj9Ao3q0xY8HISM6LylEtMw8HqYPfqVh
 HE0IRQNsq9nn8K4FjN7R3VdxLFYmf9lnTTBKZ05JV3k6ywxClAjaTnTI8Og5kyYznTK7
 9aIM0U9RSaG+SpSc1MQrTt0mb7M9Iek8QN+30xF+CnmcVvmQHxYfgSvI/mO+g4mAgkdE
 OE6krUQ95Tzgg45khMOyKQPIZrzklGz+/9stW/o0cD6Bx0PsdXEWN4afUbaeRjXS0i0z
 1NWFIWkN7CeYSfRDv3h48PdYLXu2s6IbFZQlL30EczweJo1uS4vGcXoUFYE7ER6cogPt
 9a1A==
X-Gm-Message-State: AC+VfDxk2GsymH9dcLbLoYrjx7nedph4PX9alsdAPcLaHPbh1uM8Drrg
 hqdGhUFP4XmVkmkKh1duosQ=
X-Google-Smtp-Source: ACHHUZ67KIg/Mm9NMPhjTlayFjlenoLJPI4NEBi4xLY/i14s1DBOxzAioMCWtn7d/RPKGoOH81NjfQ==
X-Received: by 2002:a05:6a20:3d93:b0:10c:34af:a469 with SMTP id
 s19-20020a056a203d9300b0010c34afa469mr425310pzi.16.1686073192178; 
 Tue, 06 Jun 2023 10:39:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:72aa:6329:65da:3ad3])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b001ae7fad1598sm8818368plk.29.2023.06.06.10.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 10:39:51 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  6 Jun 2023 10:39:48 -0700
Message-ID: <20230606173948.3390215-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Do not check F2FS_ZONED_HM for the whole
 device. We need to do this for each area of devices. Signed-off-by: Daeho
 Jeong --- fsck/mount.c | 6 +++--- 1 file changed, 3 insertions(+),
 3 deletions(-)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q6af0-00CwmC-03
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix wrong write pointer check for
 non-zoned areas
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

Do not check F2FS_ZONED_HM for the whole device. We need to do this for
each area of devices.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 851a62b..0ebbfcf 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2868,9 +2868,6 @@ static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	int ret, j;
 
-	if (c.zoned_model != F2FS_ZONED_HM)
-		return true;
-
 	for (j = 0; j < MAX_DEVICES; j++) {
 		if (!c.devices[j].path)
 			break;
@@ -2882,6 +2879,9 @@ static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
 	if (j >= MAX_DEVICES)
 		return false;
 
+	if (c.devices[j].zoned_model != F2FS_ZONED_HM)
+		return true;
+
 	sector = (block - c.devices[j].start_blkaddr) << log_sectors_per_block;
 	ret = f2fs_report_zone(j, sector, &blkz);
 	if (ret)
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
