Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96624653A9E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Dec 2022 03:28:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8BK5-0004Lt-Bt;
	Thu, 22 Dec 2022 02:28:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <raj.khem@gmail.com>) id 1p8BK4-0004Ln-8m
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 02:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJjx1P6uTGc0MvAfR+qnHnZ3YF2ePGv2gUWGfttFHPI=; b=bBrmMYf4v7F3dXz79DbtOhYYjZ
 6JqjmcCELvr+g9SYfboloU38xcg/BAGZXXwXwJLNwnvYqa9jFEvxYa3YN5LVyARkQ1l/pUFTO2nUV
 xfliLW3N9X4WZBbbJzgrnvMo2nza3mjAdo/2ilPnrT8mAlOBw+Nf/yyNAnpeH1JxX5eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJjx1P6uTGc0MvAfR+qnHnZ3YF2ePGv2gUWGfttFHPI=; b=V1rsTVlVPSD5bMA60RyzJKYJYE
 Cy7vBWtSrWCv3F0uwxLTrt/zhvHaQKLYnh0/I3mq+Uy6sI828ENXtVqVIrJ9OR6Rjez445LitfHDw
 FEDxj9UZXHgXahaJ7h4iui6mN9/U5glpvTjQ5afs4xdk18TW5eHpyLWbWqBLZ4YyYjQI=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p8BK3-007OJv-J6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 02:28:40 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so4304964pje.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 18:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJjx1P6uTGc0MvAfR+qnHnZ3YF2ePGv2gUWGfttFHPI=;
 b=ZGUsuvRI1XgADXNGbovzZpD/Z0LIYDtoWlUA8oxL8MYNxUzcMcqwN7q269/hWdgEzd
 SWJoI0S1AXIEwuOMZQdqXUk17V5DgaFEnypnkQPJtKZ5lSkbH7snMv+gkV7SdPyVjPFw
 6dUzxY3RZUeOZGEWsKNVPiDBj3e5ABp7yN6WswFd+hxQTy78BgeU+0sfQn2fdJU5lnLS
 Adgtl3+YCzs7JDBtKVZl8gA8/8/5z1gbCtxVzxaZcTYKQ0XX5z9TBks152HMYeiM15sz
 afsZxuJjE9rpakSc49BM4IyrxmLZKqC6lQUewsbgSAZpYdNF2MPR8x9n/53hx21TPnVb
 lsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJjx1P6uTGc0MvAfR+qnHnZ3YF2ePGv2gUWGfttFHPI=;
 b=RpsimZRAuZsnqnEV7y/a11fOL3vVPIdtytTLL43wULIrAqk7iDC56biwTCIUuU8XxB
 Yd5DLtV8hthVP6OHe0jXVFcX4kqzsR4WXrZAKmnC2oeV39HOrH9V3rsGh7dEK23Qq5pY
 laINN0majuunYbWALvtZZ7+3+Sp/YQjyo6CyC8TuZb63eYwqVgA7CK2LJD3phIG6rtJX
 m/nkTcSNZKuU0R9K9JXzbhC8uP1A6iDRrJJ6y2UwrFlUz6c44vtzOLw9KOEb9/jOG3Dx
 8anLXqWIc2XV4tjXmutCiVGMY9EKnqa8eKGyuz74LxcMQKyUP/t/g8zC6Jfg4ARHKxB7
 8lnw==
X-Gm-Message-State: AFqh2ko2GdXIaBnEDKTHUymJ/IBBgSE532TDXsrKSh9F1UlNXfxBWqmJ
 fI8D+O+VuR3UarRzHdCr8B0kzXqn6JU=
X-Google-Smtp-Source: AMrXdXsfviNqBBMiICWtseY4ZrWgdvdiIA4ezkIPhWXjlDEgjkPRqvhp++rhlvqwWiR6bPqQ7KnYbg==
X-Received: by 2002:a05:6a21:3949:b0:a7:9022:5d5e with SMTP id
 ac9-20020a056a21394900b000a790225d5emr5248001pzc.2.1671676113649; 
 Wed, 21 Dec 2022 18:28:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a638f14000000b00478c48cf73csm10521278pgd.82.2022.12.21.18.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 18:28:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Dec 2022 18:28:30 -0800
Message-Id: <20221222022830.976309-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222022830.976309-1-raj.khem@gmail.com>
References: <20221222022830.976309-1-raj.khem@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove _LARGEFILE64_SOURCE,
 this is redundant when _FILE_OFFSET_BITS=64
 additionally it fixes build with musl because the detection logic for lseek64
 fails because when using _LARGEFILE64_SOURCE musl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [raj.khem[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.47 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p8BK3-007OJv-J6
Subject: [f2fs-dev] [PATCH 2/2] f2fs_io: Define _FILE_OFFSET_BITS=64
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
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove _LARGEFILE64_SOURCE, this is redundant when _FILE_OFFSET_BITS=64
additionally it fixes build with musl because the detection logic for
lseek64 fails because when using _LARGEFILE64_SOURCE musl also define's
lseek64 as an alias to lseek

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/libf2fs_io.c        | 4 +++-
 tools/f2fs_io/f2fs_io.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 1a8167d..abb43a3 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -11,7 +11,9 @@
  *
  * Dual licensed under the GPL or LGPL version 2 licenses.
  */
-#define _LARGEFILE64_SOURCE
+#ifndef _FILE_OFFSET_BITS
+#define _FILE_OFFSET_BITS 64
+#endif
 
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6dcd840..cb99039 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -12,8 +12,8 @@
 #ifndef _LARGEFILE_SOURCE
 #define _LARGEFILE_SOURCE
 #endif
-#ifndef _LARGEFILE64_SOURCE
-#define _LARGEFILE64_SOURCE
+#ifndef _FILE_OFFSET_BITS
+#define _FILE_OFFSET_BITS 64
 #endif
 #ifndef O_LARGEFILE
 #define O_LARGEFILE 0
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
