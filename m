Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8F8AABA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 00:52:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxJAy-0007kO-2e; Mon, 12 Aug 2019 22:52:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hxJAx-0007kI-76
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsBRCgj8xPiNfwQEIamFghoZjfLPK/XhqQqGeJWjv1U=; b=mocD3Be9IStz+jWa6+yBcfbHWE
 d60p51KNHT/7VEsrTNmK6bbOAmYXx0Olp+EZjy4WlibJrDKTvPjm9H2P5b+XLgRW5lu08YAHdmOhw
 /Ad8S+Kdg7q8tMobKBSfsX17nXrMs7aW2BH2NwlX7rP0sFkaCGqkDF4AqwClXXHbeybM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EsBRCgj8xPiNfwQEIamFghoZjfLPK/XhqQqGeJWjv1U=; b=F
 4R+edLsMrB7x9euVQUOeVF77QDOulXT7rLb38c9Hw9mO8aFbrP8lJjhgdCRBblUYuGDRsT5hMk6Z+
 pP8cPO3W5sUJoB5VtRHi0qmC6ap7G0r2Vps87spLDd+nUqd4qnB47e7zsYoZXSOo/cdee4vKX+94t
 ycxn4ZLmev1fnQIk=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxJAw-001Ynt-1K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:52:27 +0000
Received: by mail-pg1-f177.google.com with SMTP id n9so43991520pgc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Aug 2019 15:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsBRCgj8xPiNfwQEIamFghoZjfLPK/XhqQqGeJWjv1U=;
 b=doFSVmaLg7naxQOABaXVuu6dl0hZk4eoajvQ9OsInydXu+g8Pb3dGaL0bcqUjk9RTO
 hgKYj62fF3c15lGwZ5dySNNA+RtMFFhhLrkNZI1HEg2lkY2zPuQRbSykiIhXb0V5bm2T
 yesn2CETqddWmg5fe/SHXCWHGrU7YrzpGJHwloduluR+rWyaOBaPbtTrAAzxC/rOWD+d
 IASmfSkvJT1U0wOF+HtmkftczVrn7dhBCa6v5TcmLUaXI6z9BgRpjDCHPpfcwilqRMvg
 lmE2+ay8r089b66HTJsXWEiqimQzUn5qoh9e7LLCqpqo7+8boGrpfYPgiMD0jpZ/Ajnl
 pwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsBRCgj8xPiNfwQEIamFghoZjfLPK/XhqQqGeJWjv1U=;
 b=J1EXd/+SFP41Wiq63kFQAjfiDS2cHXgn9PWRg4MbkGaFUM2w5qKw9yxx7CrUKbMf4v
 7XeV9K6nUPoDjRMg7VuSDufycfxNnO9YhYiwex2DPQ2Y4QiaMxs0EGI4cTdfzRfLPULz
 2H80pytKh9G7mTuLIsIe3RREMhVWbPoP+eHIsTnnLNWJNQlfox4xjJylXoAXRH9ATffi
 RckkV7a06NtOxsJ72YMKBEJ8MhLtRV1lB6BGzfzW8MwrXIkfUl+xuCqdHZ6zXSfw4eLf
 +Gu8jLMr4z9eO7wfZxzdZHVa49W/LWVoif3LTJHafMOtQ1lXcZcMrdoxz5MG2856rWgW
 F/YA==
X-Gm-Message-State: APjAAAVUOf5W2ETLyUPwuTlJjYo00SUlb3MtnOo/kT1ptUFQMSpO4ldE
 HVLE7zXLPymZoOISDJ56D5tFBrHLCT1Azw==
X-Google-Smtp-Source: APXvYqwGcphskT8FTlv6+2263Y3GJEAFR4v9Re6lfDBTXTo9OicBDgGOLe+2qKu+q1xFa4ETs1ynRA==
X-Received: by 2002:a17:90a:aa98:: with SMTP id
 l24mr451879pjq.64.1565650339737; 
 Mon, 12 Aug 2019 15:52:19 -0700 (PDT)
Received: from localhost.localdomain ([165.246.149.139])
 by smtp.gmail.com with ESMTPSA id 5sm45698246pgh.93.2019.08.12.15.52.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 15:52:19 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Aug 2019 07:52:10 +0900
Message-Id: <20190812225211.1737-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.177 listed in list.dnswl.org]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hxJAw-001Ynt-1K
Subject: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: add "zip" to cold data types
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A lot of Linux users have big, cold "zip" files.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 mkfs/f2fs_format.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 9402619..37d82c3 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -66,6 +66,7 @@ const char *media_ext_lists[] = {
 	"webp",
 
 	/* archives */
+	"zip",
 	"jar",
 	"deb",
 	"iso",
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
