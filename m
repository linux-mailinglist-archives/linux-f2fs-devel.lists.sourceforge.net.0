Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6853506943
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 13:00:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nglb1-0004QX-Dy; Tue, 19 Apr 2022 11:00:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nglaz-0004Q9-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4LvUQiHQuZbq3+y9oGS90voMbGFx43rdOdvN/yWo2vI=; b=kUZBvGnGyeRvBjTmQy3VX9tsob
 CiGzruVLJLv5VMYBUjzWGVuKHbG338xGxrfmr7LEtRhiEcrxZGtaUNPXvZMXrqtKQQOBp5qiVLSlh
 E4Weom/E3PniuW6xIdnAcBTs65i5G39meYMDj+ob+EkUcPL3MjFCQRiwGIHV40xONhso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4LvUQiHQuZbq3+y9oGS90voMbGFx43rdOdvN/yWo2vI=; b=XBzENoHT3ZcpznNLtX9ofae5k6
 aPf+NjUM4N96tvis5fYZRKS11OYhulZxb6lFa5Q7Z8KvY7c5XySgcOWbMwzgGPJncNHoERyJf4U41
 RpXXIfvbpL95M/6ee/8tLHBxAWsciuJJiWK4wefLHzSTILdkn2jt6CXC20c68vpjSxFA=;
Received: from mail3.bemta32.messagelabs.com ([195.245.230.82])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nglau-003klg-Oz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1650365217; i=@fujitsu.com;
 bh=4LvUQiHQuZbq3+y9oGS90voMbGFx43rdOdvN/yWo2vI=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=ao26HRrlQaKtDPImAqAml+KuTJieC1e81R6RJISy54lToIcQ9oV2MWbIFyiM2crWn
 e2k778pGa9p83yhbDtcbWtLkSKwWjXo4FBLtw0S/8lqbjKD8ZR4itsIvORc768ViOH
 HnjfTwwYH+CW8+BRezNa2dyoWhbCCF/cXAPE3GxAOUbRvbeQvsbpyuG3AABzoDTJpH
 YrnDFbAejVXwaHCPJR0Vo9S5ElKSJwD3tChw7RUTM689yjQb6nkk8lnqo6tO+sm8gI
 rbDe3b0Utulm5ETUnPmJWmeBTJXWeT9lb+xl51QIsBnljuMpBSMwH+zs9bUQqGc0VE
 6obMZ6J4tGdVA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleJIrShJLcpLzFFi42Kxs+EI0VWYHJd
 k8GuFgcXrw58YLT7cnMRkcXrqWSaLLcfuMVpcfsJn8XPZKnaLS4vcLfbsPcliceHAaVaLXX92
 sFusfLyVyeL83+OsDjwepxZJeGxa1cnm8WLzTEaP3Qs+M3l83iTnsenJW6YAtijWzLyk/IoE1
 owvm86yFLzgrTjUu4S5gfE0dxcjJ4eQwGtGidaH8l2MXED2HkaJW8u/MoEk2AQ0JZ51LmAGsU
 UElCUW3DjGBmIzC3xgkph4sKqLkYNDWCBIYvuaAJAwi4CqxJpvuxlBbF4BD4mWV+1gtoSAgsS
 Uh+/BxnAKeEpsfPueBWKvh8T1w1uYIeoFJU7OfMICMV5C4uCLF8wQvYoSlzq+Qc2pkJg1q41p
 AiP/LCQts5C0LGBkWsVomVSUmZ5RkpuYmaNraGCga2hoqmusa2Gml1ilm6iXWqpbnlpcomuol
 1herJdaXKxXXJmbnJOil5dasokRGCcpxcxhOxj/9P7UO8QoycGkJMpbHxWXJMSXlJ9SmZFYnB
 FfVJqTWnyIUYaDQ0mCt3QCUE6wKDU9tSItMwcYszBpCQ4eJRHeyf1Aad7igsTc4sx0iNQpRl2
 OtQ0H9jILseTl56VKifOKtQAVCYAUZZTmwY2ApY9LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkY
 lYR5iyYBTeHJzCuB2/QK6AgmoCOqp8SCHFGSiJCSamAynjLFKGtG7eyP51ntE+V23nTmPlebI
 bjgXsMtIy3+76ft0xzOPc5c8sJYM9Zk4buewAO9dhb1fhsm7tBZa3Vxv+MEf41bj9esSGhNeP
 Radeayz1feFvZM371q8V3mWo5c5Tbp7IMRmxtVj/arV0tMY90Qm/645gbj9qJz5qUPN3yTaXx
 kUGaplvPaR9cw2qtH4PGiyknJrM2iT96s2rpkyd/Uk7F9yzxKX8xgfFZ+SOs9l+XpqXqb+DLf
 /Nu/f11d5x/jyuvrvDMDD73tDfJtS3POury3lP1LabfJwwmLfhl8lsvdcryKcXlXbdekmqap3
 0OEhTzOz/mn1dKx3GvWqR+ynnL3t3XNOJtZLv9NiaU4I9FQi7moOBEAMekPSpoDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1650365216!280278!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24417 invoked from network); 19 Apr 2022 10:46:56 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:46:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23JAkiuN014724
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 19 Apr 2022 11:46:44 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:46:38 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 19 Apr 2022 19:47:09 +0800
Message-ID: <1650368834-2420-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since xfs_generic_create only calls xfs_set_acl when enable
 this kconfig,
 we don't need to call posix_acl_create for the !CONFIG_XFS_POSIX_ACL
 case. The previous patch has added missing umask strip for tmpfile, so all
 creation paths handle umask in the vfs directly if the filesystem doesn't
 support or enable POSIX ACLs. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [195.245.230.82 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [195.245.230.82 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nglau-003klg-Oz
Subject: [f2fs-dev] [PATCH v4 3/8] xfs: only call posix_acl_create under
 CONFIG_XFS_POSIX_ACL
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

Since xfs_generic_create only calls xfs_set_acl when enable this kconfig, we
don't need to call posix_acl_create for the !CONFIG_XFS_POSIX_ACL case.

The previous patch has added missing umask strip for tmpfile, so all creation
paths handle umask in the vfs directly if the filesystem doesn't support or
enable POSIX ACLs.

So just put this function under CONFIG_XFS_POSIX_ACL and umask strip still works
well.

Also use unified rule for CONFIG_XFS_POSIX_ACL in this file, so use IS_ENABLED in
xfs_generic_create.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/xfs/xfs_iops.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index b34e8e4344a8..6b8df9ab215a 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -150,6 +150,7 @@ xfs_create_need_xattr(
 		return true;
 	if (default_acl)
 		return true;
+
 #if IS_ENABLED(CONFIG_SECURITY)
 	if (dir->i_sb->s_security)
 		return true;
@@ -169,7 +170,7 @@ xfs_generic_create(
 {
 	struct inode	*inode;
 	struct xfs_inode *ip = NULL;
-	struct posix_acl *default_acl, *acl;
+	struct posix_acl *default_acl = NULL, *acl = NULL;
 	struct xfs_name	name;
 	int		error;
 
@@ -184,9 +185,11 @@ xfs_generic_create(
 		rdev = 0;
 	}
 
+#if IS_ENABLED(CONFIG_XFS_POSIX_ACL)
 	error = posix_acl_create(dir, &mode, &default_acl, &acl);
 	if (error)
 		return error;
+#endif
 
 	/* Verify mode is valid also for tmpfile case */
 	error = xfs_dentry_mode_to_name(&name, dentry, mode);
@@ -209,7 +212,7 @@ xfs_generic_create(
 	if (unlikely(error))
 		goto out_cleanup_inode;
 
-#ifdef CONFIG_XFS_POSIX_ACL
+#if IS_ENABLED(CONFIG_XFS_POSIX_ACL)
 	if (default_acl) {
 		error = __xfs_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
 		if (error)
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
