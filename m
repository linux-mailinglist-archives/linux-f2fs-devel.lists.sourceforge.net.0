Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6813C34E0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jul 2021 16:40:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2E9Z-0003i7-Bv; Sat, 10 Jul 2021 14:40:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <wangshilong1991@gmail.com>) id 1m2E9X-0003hw-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 14:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+yimJR30/m003w+X6EtV4f+C8eFTWX5UIfbOmwRmtQs=; b=I+sD06vDhTRkf7DBuB8/PwlzGN
 85/lCFExTcz3aeXYFMSxoNjtkwarhItPQFd17bxT2q7V3drXs5uoKy88NQeF7ZGh9tvG0QG3PlclL
 kJB0lMG27pduben8v1qORYEo1CxyJXgh+HDCZfSXQMw0iyVZS63oYmjBHgflQpBLwqV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+yimJR30/m003w+X6EtV4f+C8eFTWX5UIfbOmwRmtQs=; b=F
 S4A6y5u+xt/hjD1z2jTlS2J5fiXnCEnefdw3weNzVRA4zaqfza+QEjiJFUYJVBxO9gN6+DQeMucIa
 8XPeuV3GfDreSMikixKBfeijs0DpWpWUDJoow6M1PPyezftM/mr5XHoQ/hQRGXQjviwGW9h79+B24
 Utx3vAonFExX93lI=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2E9R-003Nab-B5
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 14:40:23 +0000
Received: by mail-pg1-f176.google.com with SMTP id k20so6087219pgg.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 10 Jul 2021 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+yimJR30/m003w+X6EtV4f+C8eFTWX5UIfbOmwRmtQs=;
 b=PxAEsun23B3n5dHrbV5KgjU5Fhef1rxdLf16NZHBKGQmPot9TNxOWeR/nL79VFkgbt
 ZtddKv54iqib5p+KkB/l11LbmrwwDmR+Hxm3V32BlpnS+V85gcPib8M/yxYGBwE6sFR0
 wmgcos1NZjbIM+yagFzoE+SZ3BLBtVLGmyEeJGpdOC6T4AELNpnETF9kWeE/A/VB9k5D
 C1lEQg3p1kuAWLZ36UfOdjM/+7iQZzhAvmCguDbUOTLoafUeaITb865if/bVBCjtaFHe
 /0SS31+pyk+w94eda9BTwkap4w0GkIJjXp6IUAM8L0dbdP/5QKCxNq9iBec5S3KLy8T8
 Zhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+yimJR30/m003w+X6EtV4f+C8eFTWX5UIfbOmwRmtQs=;
 b=d+goAwK4yLDEobDusKcAhbrCEd/L3y8iLxfIPJ0jOSqYEuvz7BEP5XJJnuRraw9Iqj
 HIIvyipccguNKHpRjD/oIsUyVg6GSsXFmIzlEAR/2SsneT9aO+E9R6R9m3jVV0VeVkMg
 qo2rrOLMjr9Z6Uovzi7M4/5e9wk+J/iNGqu9mZnfZOvkDJQk1/7aEYrImvdZKaMLrTUh
 BZB5EXK1FLyq23LX/XYi6wieeZtW4LULj30Wo2eEUIEh/xYZFRM5yE5KcB5DPN4qxYTo
 UXuMis12Abl7c8H2ZoKHYB5C76Shux2HixFyCafh17smEeoin26tBcSWjJt9t2CfseDk
 2oeA==
X-Gm-Message-State: AOAM532HrpZQSZ22zJ3QPhvTnQ2kxlo5stEYVSYDLPKjkLrmkvdfaUbh
 7TBEly4QAGlPZakmhYrIio8=
X-Google-Smtp-Source: ABdhPJwWoLk6xMEbLIO8DZJApSRhwgvnHfI8HTsI8CKg34R4XD36Y42oIQFO7/h6kQjmLV2d6lq9Pg==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id
 b10-20020a056a000a8ab029030ca10b3e3fmr43492003pfl.40.1625928011764; 
 Sat, 10 Jul 2021 07:40:11 -0700 (PDT)
Received: from localhost.localdomain ([114.99.217.112])
 by smtp.gmail.com with ESMTPSA id v25sm10860513pga.35.2021.07.10.07.40.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 10 Jul 2021 07:40:11 -0700 (PDT)
From: Wang Shilong <wangshilong1991@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Sat, 10 Jul 2021 22:39:59 +0800
Message-Id: <20210710143959.58077-1-wangshilong1991@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (wangshilong1991[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ddn.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (wangshilong1991[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2E9R-003Nab-B5
Subject: [f2fs-dev] [PATCH v4] fs: forbid invalid project ID
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Wang Shilong <wshilong@ddn.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wang Shilong <wshilong@ddn.com>

fileattr_set_prepare() should check if project ID
is valid, otherwise dqget() will return NULL for
such project ID quota.

Signed-off-by: Wang Shilong <wshilong@ddn.com>
---
v3->v3:
only check project Id if caller is allowed
to change and being changed.

v2->v3: move check before @fsx_projid is accessed
and use make_kprojid() helper.

v1->v2: try to fix in the VFS
 fs/ioctl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 1e2204fa9963..d4fabb5421cd 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -817,6 +817,14 @@ static int fileattr_set_prepare(struct inode *inode,
 		if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
 				FS_XFLAG_PROJINHERIT)
 			return -EINVAL;
+	} else {
+		/*
+		 * Caller is allowed to change the project ID. If it is being
+		 * changed, make sure that the new value is valid.
+		 */
+		if (old_ma->fsx_projid != fa->fsx_projid &&
+		    !projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
+			return -EINVAL;
 	}
 
 	/* Check extent size hints. */
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
