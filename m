Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C882A24534
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Jan 2025 23:25:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tdzRm-0004S9-7D;
	Fri, 31 Jan 2025 22:25:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tdzRk-0004Rt-9J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Jan 2025 22:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juG8nUdV0WyyYnlPmmsUCrmKv5b3xnKpXZDvL3+zs6A=; b=AtDC/VUS7YKwWvN4LP3wV6EJ3u
 ybMTJslnkSw4X1AkYYvWhPbl39e+Z8Z9hE/7q1OxKl3GRAAbuzFP67WFcwkHPwb1d4j7nwPKhq6D8
 UN6QoI7vBzj/oiv0hK7Uw3Lje7KhPE18hbM/sMsx5cnRve+/sdK1yN8TfMB6fco9mNIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=juG8nUdV0WyyYnlPmmsUCrmKv5b3xnKpXZDvL3+zs6A=; b=d
 HmYkYh5y9T1KpzrVdRkwYTznX6sg0hNJsi1cp3wk7jwBu5Hvu9wWZkV+fNSdSfCQD8HkWHQZHcVja
 XXuclrlWE5VJg0L422utXAbap8hPPhopnRifi1uZvHsU8jrpiaFMNH8hc2sUugxo2S/cTFM1QJ74t
 LVW+l0nOE7DqFObc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdzRj-0003d8-KB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Jan 2025 22:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47B1E5C634D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 Jan 2025 22:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9109C4CED1;
 Fri, 31 Jan 2025 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738362302;
 bh=onDCTihKWJH6F+H8IdhFe7TFdJkEjG+vwnD/wYojOBQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VxVh/1OnEZtTWaN5CCIGEU4ar79eHlsqhbmSAdxi5H1j6wTDaHACBcaFzfVqHY9x6
 dSurFgTcM5AbVcoUHpgRH4PGoKxwjmJpVmojwt7umDY4Kxl5tydMyxGCP3DHFZXeOS
 qyYJVCXjyxQgojV59OTi38LHng2xAMRgpF3oZSgzgS6MxzC3DyzZA+di7z9AdPpzKn
 g7fiPvCNTA6sJVtwlgMQUOd3oCr/xEKBHgGgvkgK+dwDVNXi5P4UV481nQ2NE+MsSu
 UoRl29X9bJ+5D2gsuldtf/UCi6DukMeGcdivUClEEy/EgrrkRFFOIju1C1eSZHLO+w
 ajjRlg8G/2TTw==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 31 Jan 2025 22:24:56 +0000
Message-ID: <20250131222457.1634039-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
MIME-Version: 1.0
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fix a wrong kobject_put in the error path. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/sysfs.c | 3 ++- 1 file changed,
 2 insertions(+), 1 deletion(-) diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
 index d15c68b28952..001e97cd0a96 100644 --- a/fs/f2fs/sysfs.c +++
 b/fs/f2fs/sysfs.c
 @@ -1605,7 +1605,7 @@ int __init f2fs_init_sysfs(void) ret = kobject_ [...]
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdzRj-0003d8-KB
Subject: [f2fs-dev] [PATCH 1/2] f2fs: don't kobject_put in the error case
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix a wrong kobject_put in the error path.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index d15c68b28952..001e97cd0a96 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1605,7 +1605,7 @@ int __init f2fs_init_sysfs(void)
 	ret = kobject_init_and_add(&f2fs_feat, &f2fs_feat_ktype,
 				   NULL, "features");
 	if (ret)
-		goto put_kobject;
+		goto unregister_out;
 
 	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
 	if (!f2fs_proc_root) {
@@ -1616,6 +1616,7 @@ int __init f2fs_init_sysfs(void)
 	return 0;
 put_kobject:
 	kobject_put(&f2fs_feat);
+unregister_out:
 	kset_unregister(&f2fs_kset);
 	return ret;
 }
-- 
2.48.1.362.g079036d154-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
