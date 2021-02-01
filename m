Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3A30A5C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 11:49:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6Wlr-0003Hj-4f; Mon, 01 Feb 2021 10:49:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6Wlp-0003HB-I3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 10:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0gRcVEeV6nGqliN47YBX62tljuHs3/rhZ5XnTs5IdQ=; b=HsWLavc2nWGlu6/CemnoAVfNmD
 ELJqhmkLdNL9pXB/M/6rqe88YsmuEDCxsxCaajFcyXUcx56Bh1JlV1N7V1G/6z5P5m5v3e73Iumhv
 hF4dIZ4Og/RcHUde+/65Qq9YVVb+M6Vds9005wnE282m0TJwYGyCTqgsotsVNv6m7dGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/0gRcVEeV6nGqliN47YBX62tljuHs3/rhZ5XnTs5IdQ=; b=h
 /zZofEfV83RRYEw2W9b0svJS6SagDJ8hfk1D5M6xpG11nRQ/xU4vms1zpj1hoijPwLcqAToNDXAvQ
 M6f+b9QTb/tziY0SoF7UbBnpRay9SEfzmAOVRY+Yv4kWBmU0buI9Yj0g2frOth9poMYsgKnHkkmEW
 hqvBathlqZDVi1lQ=;
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6Wlh-0003yx-SG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 10:49:25 +0000
Received: by mail-io1-f41.google.com with SMTP id d13so16834856ioy.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0gRcVEeV6nGqliN47YBX62tljuHs3/rhZ5XnTs5IdQ=;
 b=vPtgppTigwEDjlMnvlfXOBT+rhGArs6+qUQ1QklRcYLpqr+chl/rod3Fgbx6LBmOiF
 kTyNnXkOHSPPt4aLOww4SNI9Rff59x8Jy9Cba0rqBvstfl2kIoqg70RjmHVLRSol7dMY
 hjIOGQ8noN02/j7L6HtWvdDArrKvVFWpzkDsHD9CqpAwF/fdVxrqXA0UIEdBTRHPrJOJ
 0xR145ZXXfgcQLS5gFLJK7Go6D/bnxx0vwXyXF/7+aKusuigOcvW8N1Xtep7oCz2ooIS
 HpHmlDJEQBzU02azajmbeWsG4+O2XFkra8t2tjKDLT3b5TOsYzfiCVBsR2qzAy94yNRr
 PVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0gRcVEeV6nGqliN47YBX62tljuHs3/rhZ5XnTs5IdQ=;
 b=EDOB9rqMQqUyzP7fAmIHkVtZVMSH29N57uqbHXjIGNW2/YSAnEzC7t4OZTEmTY47gU
 WdhkvFrpy3p6WX29gCJsRq0LuppZpoihcuorIDr5oENAOWl7Ej0iN60rSkfxM97QT00g
 Nq2bAPyD72omTsgiL/IWj/avjjF8d6rXgj/8rfDjGz9lLyij7RW+yG3z2tVErK5TFb3d
 wWBKq5B6rGdl5ibVKxAm+aA/VT0WpffNC63Y0aqT2E7u+TNow6TJK3V3C4CmTAdWZP5Q
 w0Mhdy0LcY/QN+ZdxcOsJXIu09vvd7osH7nVuIVxRUPwfVxhMQRVPfDNZfrzpy1p/WBs
 xmPQ==
X-Gm-Message-State: AOAM533p6hwgJwsCFnhVVDia26i1NcIVwOkvwt8eRJSE2WUZFIZ7vaxq
 ubC5tw+U+wq2UREnD2GDAi75IW4dGQw=
X-Google-Smtp-Source: ABdhPJw1vc98IBtozranx8UMm4Jlgj9NVX2pMJ6l6aKMDQ+grZlBV1Y5kdLyrLAlNrRKw2Pce2ITwQ==
X-Received: by 2002:a65:6547:: with SMTP id a7mr14384815pgw.50.1612141076531; 
 Sun, 31 Jan 2021 16:57:56 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:3d90:5212:5281:e85d])
 by smtp.gmail.com with ESMTPSA id 24sm12719797pgs.90.2021.01.31.16.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 16:57:55 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Feb 2021 09:57:49 +0900
Message-Id: <20210201005749.2980575-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l6Wlh-0003yx-SG
Subject: [f2fs-dev] [PATCH] f2fs: prevent setting ioprio of thread not in
 merge mode
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

It causes a crash to change the ioprio of checkpoint thread not in
checkpoint=merge. I fixed that to prevent setting the ioprio of the
thread when checkpoint=merge is not enabled.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 100608bcd517..e38a7f6921dd 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -357,8 +357,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 
 		cprc->ckpt_thread_ioprio = IOPRIO_PRIO_VALUE(class, data);
-		ret = set_task_ioprio(cprc->f2fs_issue_ckpt,
-				cprc->ckpt_thread_ioprio);
+		if (test_opt(sbi, MERGE_CHECKPOINT)) {
+			ret = set_task_ioprio(cprc->f2fs_issue_ckpt,
+					cprc->ckpt_thread_ioprio);
+			if (ret)
+				return ret;
+		}
 
 		return count;
 	}
-- 
2.30.0.365.g02bc693789-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
