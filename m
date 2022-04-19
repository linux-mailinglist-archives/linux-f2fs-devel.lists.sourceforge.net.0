Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B2D506944
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 13:00:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nglb3-0004dw-LY; Tue, 19 Apr 2022 11:00:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nglb2-0004dq-Lg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pzuZqnMKiL4erT/FsIYrH8hrYItIQ0ZRX22uC8lIbQ=; b=F2kzrMWXTdvy3QxzTvdK/8R7hR
 cKln59FDk/6uiw1XWntKWiA7n2k1/cePJrK40SWBJk8GMAUMdY+HYL1EnI9zQCr2UgPQ0c1zatXCn
 KDfD1zRXA+4iLtDTiMDb7OT0XlOXEn+St5XxK+x1FhP/+ZX4IA9zGydSesjIw+xLbTu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pzuZqnMKiL4erT/FsIYrH8hrYItIQ0ZRX22uC8lIbQ=; b=POwhksnGh99/p4TRC36BzblVZB
 e5iKEMxoFTbOTZU/0YCYKOfQj9cdRj6f3ji8KXdk4sw4jD4DnQtfdVBpl5O2km1Yrd+wc4sFW4Gtm
 WnNsCXVdGtrCmXwm8xnYaRgpfh+CJwz/jhTXD5WPgH/FlcMJhZyhR8LHrMCfzM6qok4E=;
Received: from mail1.bemta32.messagelabs.com ([195.245.230.2])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nglb1-003klm-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1650365242; i=@fujitsu.com;
 bh=0pzuZqnMKiL4erT/FsIYrH8hrYItIQ0ZRX22uC8lIbQ=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=hIwfAuc69Xx8K25DwcOytVfnY2HcBlHnpYAGbO4CnypR85lQ5SFVuTh/tkIJQY6Ou
 2AUfaSP0Uy2wkPcWyRMeT8JKKenGQPKsey63y6p3NOtsZL0gyTvAK35vkwzo2Nsd60
 FB6Lyt3Ztlp5nqmYSWLYvPiQCpODFdh0pwWJmlxRbvWBbqEHhN4V8xIQp1hmxrcf14
 EOOjwwtJo6M1zZuCRPbn9scL9ZwmIaFXx4ClIc3Z9gHSUVwYXGIWcCJaqy2kEZ+vXQ
 RXiFScjVnMIlMh9cHzIL+/14Si/jT8/nytq21b9Xrgl9LH5depfT0QxihYaSaXwZtA
 zkM1J0kBbT+lQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRWlGSWpSXmKPExsViZ8ORqGs5OS7
 JYEu3hMXrw58YLT7cnMRkcXrqWSaLLcfuMVpcfsJn8XPZKnaLS4vcLfbsPcliceHAaVaLXX92
 sFusfLyVyeL83+OsDjwepxZJeGxa1cnm8WLzTEaP3Qs+M3l83iTnsenJW6YAtijWzLyk/IoE1
 owlXy+xFuwUrdj1cjZ7A+NkoS5GLg4hgS2MEp1bpjJBOAuYJI78eczcxcgJ5OxhlDj0VhnEZh
 PQlHjWuQAsLiKgLLHgxjE2kAZmgTNMEpeuLWEESQgL+Ev8fv4WyObgYBFQlZg0PRckzCvgIXF
 t2QqwEgkBBYkpD9+DzeEU8JTY+PY9C8QuD4nrh7cwQ9QLSpyc+QQsziwgIXHwxQtmiF5FiUsd
 36DmVEjMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2BkWsVolVSUmZ5RkpuYmaNraGCga2hoqgskT
 U30Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECoyulmGHWDsZZfT/1DjFKcj
 ApifLWR8UlCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgLZ0AlBMsSk1PrUjLzAFGOkxagoNHSYR
 3cj9Qmre4IDG3ODMdInWKUVFKnFesBSghAJLIKM2Da4Mll0uMslLCvIwMDAxCPAWpRbmZJajy
 rxjFORiVhHmbJgJN4cnMK4Gb/gpoMRPQ4uopsSCLSxIRUlINTBMil3oo5px9M+P21/9NC85/d
 fxqPvfMjN2PDk5jNq2KdnZnsNp99NFylynms66ZMf6cd9twjjzbhcbneX/1HTQWGM+7Glh9at
 JGyW+eU9ayfLZ9Gt66Ri3ploKHrken1j22j+Ffda7cn6Bu3tGb4nRrx4clF8InLVxTf3lrnOn
 iK2yKXwTSNb88m3LgXO7bxR2nowVzrI2v7On8Fbsh+67S67b2pYK5U0KtJ79rD73CYmd9h3vx
 rF8JPousU0O0pEqZ6l++/ZwnFHHobhTjCZmSSBkR9/CVLnwp129LB0zck2MtwxnN/TvJ0rtr9
 fSsXbz1P7KVGV2X/p4arHnH/wGvwG6+eMtep/NREmbfFZVYijMSDbWYi4oTAfUjQSGpAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1650365241!273698!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29673 invoked from network); 19 Apr 2022 10:47:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
 by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:47:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9AF6F1001A1;
 Tue, 19 Apr 2022 11:47:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 805B6100196;
 Tue, 19 Apr 2022 11:47:20 +0100 (BST)
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:47:01 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 19 Apr 2022 19:47:10 +0800
Message-ID: <1650368834-2420-4-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since nfs3_proc_create/nfs3_proc_mkdir/nfs3_proc_mknod these
 rpc ops are called by nfs_create/nfs_mkdir/nfs_mkdir these inode ops, so
 they are all in control of vfs. nfs3_proc_setacls does nothing in the
 !CONFIG_NFS_V3_ACL
 case, so we put posix_acl_create under CONFIG_NFS_V3_ACL and it also doesn't
 affect sattr->ia_mode value because vfs has did umask strip. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [195.245.230.2 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [195.245.230.2 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nglb1-003klm-KJ
Subject: [f2fs-dev] [PATCH v4 4/8] NFSv3: only do posix_acl_create under
 CONFIG_NFS_V3_ACL
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
Cc: linux-nfs@vger.kernel.org, Yang Xu <xuyang2018.jy@fujitsu.com>,
 djwong@kernel.org, david@fromorbit.com, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, jlayton@kernel.org, ceph-devel@vger.kernel.org,
 ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since nfs3_proc_create/nfs3_proc_mkdir/nfs3_proc_mknod these rpc ops are called
by nfs_create/nfs_mkdir/nfs_mkdir these inode ops, so they are all in control of
vfs.

nfs3_proc_setacls does nothing in the !CONFIG_NFS_V3_ACL case, so we put
posix_acl_create under CONFIG_NFS_V3_ACL and it also doesn't affect
sattr->ia_mode value because vfs has did umask strip.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/nfs/nfs3proc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/nfs3proc.c b/fs/nfs/nfs3proc.c
index 1597eef40d54..9ab93427db30 100644
--- a/fs/nfs/nfs3proc.c
+++ b/fs/nfs/nfs3proc.c
@@ -337,7 +337,7 @@ static int
 nfs3_proc_create(struct inode *dir, struct dentry *dentry, struct iattr *sattr,
 		 int flags)
 {
-	struct posix_acl *default_acl, *acl;
+	struct posix_acl *default_acl = NULL, *acl = NULL;
 	struct nfs3_createdata *data;
 	struct dentry *d_alias;
 	int status = -ENOMEM;
@@ -361,9 +361,11 @@ nfs3_proc_create(struct inode *dir, struct dentry *dentry, struct iattr *sattr,
 		data->arg.create.verifier[1] = cpu_to_be32(current->pid);
 	}
 
+#if IS_ENABLED(CONFIG_NFS_V3_ACL)
 	status = posix_acl_create(dir, &sattr->ia_mode, &default_acl, &acl);
 	if (status)
 		goto out;
+#endif
 
 	for (;;) {
 		d_alias = nfs3_do_create(dir, dentry, data);
@@ -580,7 +582,7 @@ nfs3_proc_symlink(struct inode *dir, struct dentry *dentry, struct page *page,
 static int
 nfs3_proc_mkdir(struct inode *dir, struct dentry *dentry, struct iattr *sattr)
 {
-	struct posix_acl *default_acl, *acl;
+	struct posix_acl *default_acl = NULL, *acl = NULL;
 	struct nfs3_createdata *data;
 	struct dentry *d_alias;
 	int status = -ENOMEM;
@@ -591,9 +593,11 @@ nfs3_proc_mkdir(struct inode *dir, struct dentry *dentry, struct iattr *sattr)
 	if (data == NULL)
 		goto out;
 
+#if IS_ENABLED(CONFIG_NFS_V3_ACL)
 	status = posix_acl_create(dir, &sattr->ia_mode, &default_acl, &acl);
 	if (status)
 		goto out;
+#endif
 
 	data->msg.rpc_proc = &nfs3_procedures[NFS3PROC_MKDIR];
 	data->arg.mkdir.fh = NFS_FH(dir);
@@ -711,7 +715,7 @@ static int
 nfs3_proc_mknod(struct inode *dir, struct dentry *dentry, struct iattr *sattr,
 		dev_t rdev)
 {
-	struct posix_acl *default_acl, *acl;
+	struct posix_acl *default_acl = NULL, *acl = NULL;
 	struct nfs3_createdata *data;
 	struct dentry *d_alias;
 	int status = -ENOMEM;
@@ -723,9 +727,11 @@ nfs3_proc_mknod(struct inode *dir, struct dentry *dentry, struct iattr *sattr,
 	if (data == NULL)
 		goto out;
 
+#if IS_ENABLED(CONFIG_NFS_V3_ACL)
 	status = posix_acl_create(dir, &sattr->ia_mode, &default_acl, &acl);
 	if (status)
 		goto out;
+#endif
 
 	data->msg.rpc_proc = &nfs3_procedures[NFS3PROC_MKNOD];
 	data->arg.mknod.fh = NFS_FH(dir);
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
