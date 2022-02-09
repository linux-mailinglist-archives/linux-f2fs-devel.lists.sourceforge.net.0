Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E554B0003
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Feb 2022 23:18:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHvI2-0004Ad-OU; Wed, 09 Feb 2022 22:18:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nHvHx-0004AM-PN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Feb 2022 22:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNtEwMzqAPenp9awgINMfVTrglP2wdyxVgejNEgGRus=; b=GwF6/s1O4IV+Jn2Y+KMqcK7fOb
 3NYqzKYepaZo/PknZ4r/K5j1QKyLTbM4fxxiAdUrfSSKQanCM2Pms9+oFhmEEwa3WP4JV/IfMI6PI
 NiMSby48OKhcJacU3GgyfLIivV5XKAfeeV19eXYG4iN+xvULyEgBc23IUyrRN+Q3EagE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aNtEwMzqAPenp9awgINMfVTrglP2wdyxVgejNEgGRus=; b=EVuP2mQS1BzB9I0WCLpd4eqLcK
 LXI7V4L4V8V0p6JpLJ/AgIy7INVWwGSn5goeNlPLsuYXa2N2e0gSl/AeL+Ri5tZ91LqnDI8SFU/Ie
 fw5oglPlGjn8B8/0IHcVHqt9iWsKlKERz8TrYx1dsA3pIrbN5n5xDIjjH/mAmE7PISgw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHvHv-0008FA-AW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Feb 2022 22:18:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8ECA761BC2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Feb 2022 22:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E49C340E7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Feb 2022 22:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644445077;
 bh=8mnUqKbp85afIc7zRsu7b8jw2puPZ3515ShLDAry7vc=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=k4v9cfQSWki8fBRXNlgIt20KkbrigS8lxtO1yl2G1wnidixxUBl4ODF68/hLxnjCx
 HAPF1I+N359Z/P1dmcGzA7BUVYFrICYOdmngzJVJRRfiltSxJJhvIRRB37H64xCXkL
 N6P9zHlfwdsH3FP20n+cQ/R4+dG0IFEX/Z9R2ACuig8s5+pldTxKNhO/BCcw41PA6W
 rYX96Xc2+lhdutdG9foHO+7/v+zTn+pAN6jDZyKFiZziplyJ1TgZVmRpJ+qv+p25Rj
 Zct3dXwR+j4mHo62J8/B0CUKpqpEiPbOfUpB4Ng5fBnsBznAVj4TR5rDORMSS5ESBa
 XNavfbjMstPyg==
Date: Wed, 9 Feb 2022 14:17:55 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YgQ9k+D3YawF2XX6@google.com>
References: <20220203174458.3598593-1-jaegeuk@kernel.org>
 <YgL/HK2aGhFUQhtZ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgL/HK2aGhFUQhtZ@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With this patch, "-g android" enables project quota only by
 default, if the kernel is over v4.14. Otherwise, it enables usr/grp/proj
 all together. 1) -O quota : enables usr/grp 2) -O project_quota -O extra_attr
 : enabled prj 3) -O quota -O project_quota -O extra_attr : enables
 usr/grp/proj
 4) -g android : enables proj (4.14+), usr/grp/proj (old [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHvHv-0008FA-AW
Subject: Re: [f2fs-dev] [PATCH v3] mkfs.f2fs: set project quota by default
 for -g android
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

With this patch, "-g android" enables project quota only by default, if the
kernel is over v4.14. Otherwise, it enables usr/grp/proj all together.

1) -O quota : enables usr/grp
2) -O project_quota -O extra_attr : enabled prj
3) -O quota -O project_quota -O extra_attr : enables usr/grp/proj
4) -g android : enables proj (4.14+), usr/grp/proj (old kernel)
5) -g android -O project_quota -O extra_attr : enables usr/grp/proj

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
Change log from v2:
 - disable usr/grp for old kernels below 4.14

Change log from v1:
 - enable all quotas to keep backward compatibility

 mkfs/f2fs_format_main.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 8d4dbe1a28b1..6efe35fff2d2 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -31,6 +31,9 @@
 #include "quota.h"
 #include "f2fs_format_utils.h"
 
+#ifdef HAVE_SYS_UTSNAME_H
+#include <sys/utsname.h>
+#endif
 #ifdef WITH_ANDROID
 #include <sparse/sparse.h>
 extern struct sparse_file *f2fs_sparse_file;
@@ -104,11 +107,34 @@ static void f2fs_show_info()
 		MSG(0, "Info: Enable Compression\n");
 }
 
+#if defined(ANDROID_TARGET) && defined(HAVE_SYS_UTSNAME_H)
+static bool kernel_version_over(unsigned int min_major, unsigned int min_minor)
+{
+	unsigned int major, minor;
+	struct utsname uts;
+
+	if ((uname(&uts) != 0) ||
+			(sscanf(uts.release, "%u.%u", &major, &minor) != 2))
+		return false;
+	if (major > min_major)
+		return true;
+	if (major == min_major && minor >= min_minor)
+		return true;
+	return false;
+}
+#else
+static bool kernel_version_over(unsigned int UNUSED(min_major),
+				unsigned int UNUSED(min_minor))
+{
+	return false;
+}
+#endif
+
 static void add_default_options(void)
 {
 	switch (c.defset) {
 	case CONF_ANDROID:
-		/* -d1 -f -O encrypt -O quota -O verity -w 4096 -R 0:0 */
+		/* -d1 -f -w 4096 -R 0:0 */
 		c.dbg_lv = 1;
 		force_overwrite = 1;
 		c.wanted_sector_size = 4096;
@@ -118,8 +144,12 @@ static void add_default_options(void)
 		if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
 			return;
 
+		/* -O encrypt -O project_quota,extra_attr,{quota} -O verity */
 		c.feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);
-		c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
+		if (!kernel_version_over(4, 14))
+			c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
+		c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
+		c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
 		c.feature |= cpu_to_le32(F2FS_FEATURE_VERITY);
 		break;
 	}
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
