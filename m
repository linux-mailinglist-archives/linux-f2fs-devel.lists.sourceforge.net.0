Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BF83E5CC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 23:46:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTUxQ-0008DH-Jy;
	Fri, 26 Jan 2024 22:45:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3yS-0ZQYKAC4NbYcOXQYYQVO.MYW@flex--drosen.bounces.google.com>)
 id 1rTUxG-0008DA-0U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 22:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSq78qMx8Os5AUW/bptijhfa380Gdb4GcsrJ9cvirqg=; b=e1RD730R54+e7cO7iajLnEXtZd
 TAfiMej9fTHx0NpOrKBwig76i7PCumcH/TPGa/TWKypAFXXXe6WfmiU7/zOLaslDrcBedHT+PbiDw
 OGD6R5rTC7vlsxvJEvAnOCYDjMj+D6aQvJ2naizVUHAPa8XjR+H6M/KklOqVrLbU/7ng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BSq78qMx8Os5AUW/bptijhfa380Gdb4GcsrJ9cvirqg=; b=m1PgRctCNE9xUE01QeruBGJaPw
 jMGQXOvFxz3n24gXUL1K+65a8Q7iYbKlbGdkTA08/lhzdnGle9H4qQDOhOGAotu+IZXUAaxVxh0Tl
 tmPrTaTmQ6yDD5kx+VOetGaN8Y7HvNgRGZ3HdG2ZlAco2Qh8ZZ1ik9Ib4+K1Mg+iUWtU=;
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTUxA-0002Bp-TA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 22:45:45 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-5ffac5f7afeso16040257b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 14:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706309136; x=1706913936;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BSq78qMx8Os5AUW/bptijhfa380Gdb4GcsrJ9cvirqg=;
 b=nVU4f9BsF8N/qB0cvIWZ99mJaPe1WRYU4RM+F/bKBGjuFdVd7MTYjx1u8N1O3En/KX
 MhpU6A4ApFHzozpV+3V0a/4jebIHkhtYoZOkKvZv0mrqfGj3DoYhDYGKqlT7C+hXZ0FH
 Ne4clYXE6f14961HCNXUYYkuED7Efm6/WO6UJbnP2VsCt+0yzxVdP14YrUe3q1Hm/wEg
 qz8b4FWTQzo9jup9Te9AOo68QxkgjzgWwexahDwTgWCkATsd6m2s/pf7Ady/tGEC2aYC
 qXIzbO0QuCNmbqoIzKFXDx7dplRmA7ouxIrfetVrVDz69IwGhg6O2n5ubQC+MpqXNH/m
 RhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706309136; x=1706913936;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BSq78qMx8Os5AUW/bptijhfa380Gdb4GcsrJ9cvirqg=;
 b=EI8LXPqqQaopf8xjhJhh2z83plJ+dBXL58CotvxSud1b0ZBX6ApWV6aG8lCL3wmqsK
 w/gQIVwh8NvpbyQ7fbhmfxYdMxxZYOEvrZ7xVYAFHT7hanICPfb7WtKeDKrQu0ohYSde
 n3UmQI+vquMye7ikqMATqhur3wgGzIWqu1u0f1mu3GoSPPho3a00L59A4GnGqbbfbMrv
 xkypIqTB4o1y2ocgMBsANCVzhUG1td2o7RkfHE5/8MNIAzqPu8v8RsgN5ZcemWRCD+IE
 hr/pcov8u3wfmuQ3XvuWqFJ66YZtmG/ZEJKSlhDYc5TZ+y4mGreX6TG/VdPJAFNP08Zz
 uZ+w==
X-Gm-Message-State: AOJu0Yws9Bi/aphK1dodDoSoXg+bXmbiv2p09Oybpptvp1asduw0HQEN
 HYa61c/4Y6Ok9ho4rSfgQtz8NcXz8l9/9dNmyR6gRCFXy3GvtLdXHfgLCsLmMhBhXoiB/kbbIRj
 XjvNex+K5UFep+8x9yyfCV2PWTlyGdTbG8eT7va3I6nmuwsdu7cQNRfwuvpzTz3MmqO94JkWmDh
 1/o/pXyb7p64v/m36+pzICxp8it91i6n9rXDH3LQh6geZyoODzL2tMVg==
X-Google-Smtp-Source: AGHT+IEUdejLXFTbT7pevX9aNZSfN919Ei1YO5HmGTRXYyOYfO2v+B17m43hJWqEMnlcWJss8z2O2yzovL8=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:2056:76c7:fa0d:88ae])
 (user=drosen job=sendgmr) by 2002:a81:57d5:0:b0:5f8:b9b8:aa19 with SMTP id
 l204-20020a8157d5000000b005f8b9b8aa19mr205963ywb.2.1706307529976; Fri, 26 Jan
 2024 14:18:49 -0800 (PST)
Date: Fri, 26 Jan 2024 14:18:45 -0800
In-Reply-To: <20240126221845.265859-1-drosen@google.com>
Mime-Version: 1.0
References: <20240126221845.265859-1-drosen@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240126221845.265859-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If sparse files is set along with multiple devices,
 we initialize
 sparse file data multiple times without freeing the previously allocated
 data. This skips the initialization for subsequent devices, a [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.202 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rTUxA-0002Bp-TA
Subject: [f2fs-dev] [PATCH 2/2] libf2fs: Fix possible memleak with Sparse
 Files
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If sparse files is set along with multiple devices, we initialize
sparse file data multiple times without freeing the previously allocated
data. This skips the initialization for subsequent devices, as sparse
file mode currently only deals with device 0 anyways.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 lib/libf2fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 2451201..13f2b07 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -974,7 +974,7 @@ int get_device_info(int i)
 
 	dev->fd = fd;
 
-	if (c.sparse_mode) {
+	if (c.sparse_mode && i == 0) {
 		if (f2fs_init_sparse_file()) {
 			free(stat_buf);
 			return -1;
@@ -1221,7 +1221,7 @@ int get_device_info(int i)
 	c.sectors_per_blk = F2FS_BLKSIZE / c.sector_size;
 	c.total_sectors += dev->total_sectors;
 
-	if (c.sparse_mode && f2fs_init_sparse_file())
+	if (c.sparse_mode && i==0 && f2fs_init_sparse_file())
 		return -1;
 	return 0;
 }
-- 
2.43.0.429.g432eaa2c6b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
