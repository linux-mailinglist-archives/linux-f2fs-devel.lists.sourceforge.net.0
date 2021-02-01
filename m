Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC830A6CE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 12:48:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6Xgn-0002v5-AD; Mon, 01 Feb 2021 11:48:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6Xgm-0002uq-Iv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 11:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/GyMrZIJMYa4hWkLXbLjixtU8s2LOA6drIR1e6+hZdE=; b=ZDglxzfRMjgEPOrO2lAKc3H3VB
 QSGvJ9FMu5BIe1K/J8Kv+tVjLcPEtJg7ASd4bpicFqwtnxkC6OLXSnBs2agJdYRCI84pDthMxk6TU
 +3XM8DwmVgzcFyYKpQL748ij1Sdjy2oKf6YHB+ux6tYVBpQOAdm+8YOlrna1Oip5d6Cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/GyMrZIJMYa4hWkLXbLjixtU8s2LOA6drIR1e6+hZdE=; b=l
 1mjvh0S7kk01BzxgK0BQa/Ncjr54DiysTtyEiMmvYeSIMzczncziWotQSMu2ReU4w25SPYFYgPfjE
 2Npob8nwb1m4oZlOijt/YcyRovWkOsF6r5DxXTojaS/nWQiCWbWfc7eGnTCuajabAGyAH7O65+xDR
 Rs0HaEHyKb5giGK8=;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6Xga-0000Ru-Og
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 11:48:16 +0000
Received: by mail-oi1-f175.google.com with SMTP id x71so18433001oia.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 03:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/GyMrZIJMYa4hWkLXbLjixtU8s2LOA6drIR1e6+hZdE=;
 b=vZ2dyIKBpxc5iexyZO9GvuWFrZfEra0Govh3FQGQxYfnWoi5k7ySTtxd9BGs1/B1OO
 sXgV4IeVQmGe9mHdchY6x7pyoearfug7tLMU7SCtMgSU6JjXyEISXs1x5G2iqz1/2Et5
 yIzoDU1QAxvYXuzL6pHh/bnJHr1mmyYeF0DjwimSU/eGoZdQbkRx511W1xCYr3Vpknqj
 ywf33fNx8NpjWk/1flBwj0mgJ/e+snOGz+hIxOB/+VqL/5BcKEkqleBAT1WHfUYI6k5M
 j2tBLlz5NuDiCdZMVSbVuEnwFmOwpzgCvf8Gkc6lyiwauuHwax3ZVOmM1DScHHFJwCwT
 tNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/GyMrZIJMYa4hWkLXbLjixtU8s2LOA6drIR1e6+hZdE=;
 b=UqKSCeiXU/rFcxUq/VtP41Exr2uvLsobTVOYmVzxJuEAYQWBpiDmfPfcYCFqwoJL1n
 zlyng8lYV1P6e1PC4CFmoGD5la56yji+eBz7epP/hSG5VXW7xn+VCFXIP8Qv3w1g7U/0
 VSsAq7XbeDMr6eqfSw1R2z/vtc4x+mlPMTp+08p2B3ineTsWxlcNgEk0vF+NBpjqO7DZ
 kuX8kQjHqwVi8KFmAH88qwYcpBx8WMpioStrmmW+WmRnSr5E4uAMEnwzlMdqsLZCRwEP
 VNJ6BF4T47weydB4uukTK8Q/h1rGaZ2CivoSRPrf/kMQKVfmQZDA5ANR2o9DPDXToFTF
 tBWA==
X-Gm-Message-State: AOAM533kn84ASQzTqouu+1EMdxXVb/IwxmBrh+j4vliHCTzd4PVhrzxX
 7qf/xwXIvNQQQx46GEGeLcTo/jc7BVI=
X-Google-Smtp-Source: ABdhPJz5XtjkCjTVC1c7AaZfb3CpLURfPrzg1hkc9gWukuIjOmchtvE/UPY0ZLsnaFGZaFHLjuNcZQ==
X-Received: by 2002:a17:90b:3104:: with SMTP id
 gc4mr4419257pjb.151.1612137975635; 
 Sun, 31 Jan 2021 16:06:15 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:3d90:5212:5281:e85d])
 by smtp.gmail.com with ESMTPSA id 16sm13317903pjc.28.2021.01.31.16.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 16:06:15 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Feb 2021 09:06:06 +0900
Message-Id: <20210201000606.2206740-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l6Xga-0000Ru-Og
Subject: [f2fs-dev] [PATCH] f2fs: fix checkpoint mount option wrong
 combination
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

As checkpoint=merge comes in, mount option setting related to
checkpoint had been mixed up. Fixed it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 56696f6cfa86..8231c888c772 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -930,20 +930,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				return -EINVAL;
 			F2FS_OPTION(sbi).unusable_cap_perc = arg;
 			set_opt(sbi, DISABLE_CHECKPOINT);
+			clear_opt(sbi, MERGE_CHECKPOINT);
 			break;
 		case Opt_checkpoint_disable_cap:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
 			F2FS_OPTION(sbi).unusable_cap = arg;
 			set_opt(sbi, DISABLE_CHECKPOINT);
+			clear_opt(sbi, MERGE_CHECKPOINT);
 			break;
 		case Opt_checkpoint_disable:
 			set_opt(sbi, DISABLE_CHECKPOINT);
+			clear_opt(sbi, MERGE_CHECKPOINT);
 			break;
 		case Opt_checkpoint_enable:
 			clear_opt(sbi, DISABLE_CHECKPOINT);
+			clear_opt(sbi, MERGE_CHECKPOINT);
 			break;
 		case Opt_checkpoint_merge:
+			clear_opt(sbi, DISABLE_CHECKPOINT);
 			set_opt(sbi, MERGE_CHECKPOINT);
 			break;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -1142,12 +1147,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 
-	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
-			test_opt(sbi, MERGE_CHECKPOINT)) {
-		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
-		return -EINVAL;
-	}
-
 	/* Not pass down write hints if the number of active logs is lesser
 	 * than NR_CURSEG_PERSIST_TYPE.
 	 */
-- 
2.30.0.365.g02bc693789-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
