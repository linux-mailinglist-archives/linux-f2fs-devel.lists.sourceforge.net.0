Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C25B3362
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Sep 2022 11:19:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oWa9o-0005WV-7Y;
	Fri, 09 Sep 2022 09:18:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1oWa98-0005Vq-7D
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Sep 2022 09:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dx5t/dTGvoGKEscckdF8xcdF360rcEQMSMg3N8LALlg=; b=FK2XBj4rVB4ThY96gSRAG9CtG4
 o0JMi2WyYDxBn6LPvNNrr92Mo+bxFNuFGnxzZkKlN7U8TO9brSzpN50JFCyRT9Hd3ShOdop1D5yCB
 qlmsMZdFWLxNELc5+oLF+Mnfxk3tCOMG5Lnoxe3i1gU1+GE/lY3FnI8OzEhIVpJI7tLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Dx5t/dTGvoGKEscckdF8xcdF360rcEQMSMg3N8LALlg=; b=H
 34XGmVyRSY9MK6Or9uM2ssmHMedxMV6FTqKgNmaAUFVx+ps5oy/w+9oOSiF6xz2iuAMauHQ3fgkKk
 IAt7ZtmLkVJXMdi06iwtHIw98vhP7Xm03fmdbYPhbUGls4G408spi+IvRNGUccUuu2WAUVmgMv6qP
 GP30sLHRSnjyzX+I=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oWa9I-0033IO-VG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Sep 2022 09:18:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 474B2CE225A;
 Fri,  9 Sep 2022 09:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A718C433D6;
 Fri,  9 Sep 2022 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662715072;
 bh=7SPpFIMznLWFbXGQe98BvU6feeTIeIVgm75sKLOIbuw=;
 h=From:To:Cc:Subject:Date:From;
 b=pk2dnxjHVdRpwtMfGNdKQloiwll5dDoopuJ8ByPG5nmtAGOVvzxR/H1OQSXmnqGD7
 NSLrkhYfRH9Z38SgGyW4EfKzXDLYPo05WjhP4v7WJ2uxBxTNgWOSzbVN8/KX98/yQ5
 Pp+1eyZj49jvCdnnaDWBd4p04/OWxNhmXZ3LChtDhnsKru2GZn4bW4B1jTro65zvUK
 m0gBNO0qFep5fRDdFO+H+6vDXglGrf4tfOGFeMj5RM979S1YXFTRGv84AH1AHBRcbJ
 SFImgFukzjSdHTiwsptHbyJngfY4L53k+0Qsh7TaQi74q7Z0lZl/w0WISvgSKgi/Gk
 kPTbKFqhkHdCQ==
From: Christian Brauner <brauner@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  9 Sep 2022 11:17:44 +0200
Message-Id: <20220909091744.933297-1-brauner@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966; i=brauner@kernel.org;
 h=from:subject; bh=7SPpFIMznLWFbXGQe98BvU6feeTIeIVgm75sKLOIbuw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRLs2wQYVx1rbn5Y+b/TRs21jRE68kv/av8apf5sVe+ajX+
 bgded5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEykfzLDXxm/s4sCPyTtL3WxKlkwv0
 9FKDXt7Y+2tQd4/WzmcFy48obhr1RTpvjV5EdnJPZ5p9/k9mo4ek7dQYrr0MQdsi/ddfM4eQE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  A while ago we introduced a dedicated vfs{g,u}id_t type in
 commit 1e5267cd0895 ("mnt_idmapping: add vfs{g,u}id_t"). We already switched
 over a good part of the VFS. Ultimately we will remove all legac [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oWa9I-0033IO-VG
Subject: [f2fs-dev] [PATCH] f2fs: port to vfs{g,
 u}id_t and associated helpers
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Seth Forshee <sforshee@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A while ago we introduced a dedicated vfs{g,u}id_t type in commit
1e5267cd0895 ("mnt_idmapping: add vfs{g,u}id_t"). We already switched
over a good part of the VFS. Ultimately we will remove all legacy
idmapped mount helpers that operate only on k{g,u}id_t in favor of the
new type safe helpers that operate on vfs{g,u}id_t.

Cc: Seth Forshee (Digital Ocean) <sforshee@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
 fs/f2fs/acl.c  | 2 +-
 fs/f2fs/file.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index eaa240b21f07..5bbc44a5216e 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -219,7 +219,7 @@ static int f2fs_acl_update_mode(struct user_namespace *mnt_userns,
 		return error;
 	if (error == 0)
 		*acl = NULL;
-	if (!in_group_p(i_gid_into_mnt(mnt_userns, inode)) &&
+	if (!vfsgid_in_group_p(i_gid_into_vfsgid(mnt_userns, inode)) &&
 	    !capable_wrt_inode_uidgid(mnt_userns, inode, CAP_FSETID))
 		mode &= ~S_ISGID;
 	*mode_p = mode;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce4905a073b3..d972cba3be40 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -871,9 +871,10 @@ static void __setattr_copy(struct user_namespace *mnt_userns,
 		inode->i_ctime = attr->ia_ctime;
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
-		kgid_t kgid = i_gid_into_mnt(mnt_userns, inode);
+		vfsgid_t vfsgid = i_gid_into_vfsgid(mnt_userns, inode);
 
-		if (!in_group_p(kgid) && !capable_wrt_inode_uidgid(mnt_userns, inode, CAP_FSETID))
+		if (!vfsgid_in_group_p(vfsgid) &&
+		    !capable_wrt_inode_uidgid(mnt_userns, inode, CAP_FSETID))
 			mode &= ~S_ISGID;
 		set_acl_inode(inode, mode);
 	}

base-commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
