Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DAF4640
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 12:41:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT2dn-0000Ul-I3; Fri, 08 Nov 2019 11:41:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iT2dm-0000UP-4N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jZqnFSQNrPSzTtchDubMqpuh1o4yxsx2y4wQ8WvwHc=; b=P6EEWIfZqaOvQ/wZI/xBhgYzEg
 Wzl7hyOqAePl7QTofBoU3KXQsaGl8ueOpedKD5Of9yRRNw0p0e2lhxq5L2uSqYEaPR/el/nGs0yrF
 CxhnLff9PJISU2KgNXiwa7+0a7evcGo06Hj9Zr4rCz8fP+HwhXIbCihcnGmUOcwTFPVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jZqnFSQNrPSzTtchDubMqpuh1o4yxsx2y4wQ8WvwHc=; b=IADn6rmMamsq3NGXx/nYZ1KpXi
 J0LSugvtEjNYAhP8waPslo4Qvk3Z/n97rP8EGBA+1s1W2l7SRBMfYHPkCawrBNteFUTapuVkW6kGL
 2AMYKLk1WPJ57948UA2nUshmOvVJLXHxVHyEGEmof8DHVrxoYI0tyK3mwLQKnlOXr2oY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT2dk-004ygs-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:41:22 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E384A222C4;
 Fri,  8 Nov 2019 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573213274;
 bh=KBCPrtaK8CUF7LqGnIIJRU4tEy3EaC6ukV+sjBbT34A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wx7cEvQPuV9PYv6mhZjEiEsJbAdwWD/UgZ3gTsegSqSowLX/on8Y16Hhgjf8k+5kq
 AHVns+34Od5XdK4wqZdbhyFPyNLR1K9zwGv4G3nWnXJ32G1/MWEDPrvaRzMwHyAjhM
 wsLgV0Ea6ogNVLGNdr/uzQMB5vcTnOZzoHGHhQEU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  8 Nov 2019 06:36:43 -0500
Message-Id: <20191108113752.12502-136-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iT2dk-004ygs-Pt
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 136/205] f2fs: fix setattr project
 check upon fssetxattr ioctl
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
Cc: Sasha Levin <sashal@kernel.org>, Wang Shilong <wshilong@ddn.com>,
 Wang Shilong <wangshilong1991@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wang Shilong <wangshilong1991@gmail.com>

[ Upstream commit c8e927579e00a182eda07e4c45df9c8c699c8ded ]

Currently, project quota could be changed by fssetxattr
ioctl, and existed permission check inode_owner_or_capable()
is obviously not enough, just think that common users could
change project id of file, that could make users to
break project quota easily.

This patch try to follow same regular of xfs project
quota:

"Project Quota ID state is only allowed to change from
within the init namespace. Enforce that restriction only
if we are trying to change the quota ID state.
Everything else is allowed in user namespaces."

Besides that, check and set project id'state should
be an atomic operation, protect whole operation with
inode lock.

Signed-off-by: Wang Shilong <wshilong@ddn.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/file.c | 60 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6972c6d7c3893..c7ea122997695 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2618,34 +2618,26 @@ static int f2fs_ioc_setproject(struct file *filp, __u32 projid)
 	if (projid_eq(kprojid, F2FS_I(inode)->i_projid))
 		return 0;
 
-	err = mnt_want_write_file(filp);
-	if (err)
-		return err;
-
 	err = -EPERM;
-	inode_lock(inode);
-
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
-		goto out_unlock;
+		return err;
 
 	ipage = f2fs_get_node_page(sbi, inode->i_ino);
-	if (IS_ERR(ipage)) {
-		err = PTR_ERR(ipage);
-		goto out_unlock;
-	}
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
 
 	if (!F2FS_FITS_IN_INODE(F2FS_INODE(ipage), fi->i_extra_isize,
 								i_projid)) {
 		err = -EOVERFLOW;
 		f2fs_put_page(ipage, 1);
-		goto out_unlock;
+		return err;
 	}
 	f2fs_put_page(ipage, 1);
 
 	err = dquot_initialize(inode);
 	if (err)
-		goto out_unlock;
+		return err;
 
 	transfer_to[PRJQUOTA] = dqget(sb, make_kqid_projid(kprojid));
 	if (!IS_ERR(transfer_to[PRJQUOTA])) {
@@ -2659,9 +2651,6 @@ static int f2fs_ioc_setproject(struct file *filp, __u32 projid)
 	inode->i_ctime = current_time(inode);
 out_dirty:
 	f2fs_mark_inode_dirty_sync(inode, true);
-out_unlock:
-	inode_unlock(inode);
-	mnt_drop_write_file(filp);
 	return err;
 }
 #else
@@ -2737,6 +2726,30 @@ static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
 	return 0;
 }
 
+static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
+{
+	/*
+	 * Project Quota ID state is only allowed to change from within the init
+	 * namespace. Enforce that restriction only if we are trying to change
+	 * the quota ID state. Everything else is allowed in user namespaces.
+	 */
+	if (current_user_ns() == &init_user_ns)
+		return 0;
+
+	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
+		return -EINVAL;
+
+	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
+		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
+			return -EINVAL;
+	} else {
+		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -2764,19 +2777,20 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 		return err;
 
 	inode_lock(inode);
+	err = f2fs_ioctl_check_project(inode, &fa);
+	if (err)
+		goto out;
 	flags = (fi->i_flags & ~F2FS_FL_XFLAG_VISIBLE) |
 				(flags & F2FS_FL_XFLAG_VISIBLE);
 	err = __f2fs_ioc_setflags(inode, flags);
-	inode_unlock(inode);
-	mnt_drop_write_file(filp);
 	if (err)
-		return err;
+		goto out;
 
 	err = f2fs_ioc_setproject(filp, fa.fsx_projid);
-	if (err)
-		return err;
-
-	return 0;
+out:
+	inode_unlock(inode);
+	mnt_drop_write_file(filp);
+	return err;
 }
 
 int f2fs_pin_file_control(struct inode *inode, bool inc)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
