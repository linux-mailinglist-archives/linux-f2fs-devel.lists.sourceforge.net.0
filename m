Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F127EDB8A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Nov 2023 07:26:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3VpQ-0005Mz-KG;
	Thu, 16 Nov 2023 06:26:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r3VpK-0005Ms-Qb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 06:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iirx9aZ1jQB9H5aHSLV9cAcubZwnik+/CrJ/R53I8XA=; b=IV8FDQiDIV7/cyIDL2ZTwOaLkI
 7R4xLbyRI0ZWTfJG6e8fVQ9k8LHQMmRgdtV2f4THkqbX+Ogh3poewSaujALCuJ8WP7P7a1Ys9IbVt
 qR+MBRHpsOVnhCkVmW6is9WXXNLbU8wY5bzlvU9aF/kAr1Vjrst3vzZcvurNoYIPCXUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iirx9aZ1jQB9H5aHSLV9cAcubZwnik+/CrJ/R53I8XA=; b=FlBv7eqfnT4Z+fcu5e3CqSL4G7
 zk5JfGqunBJBRx+hmVJ/ewWR13hmRdfJDUP2Y+egE0mP593hBLVCGPAz5SAQd6zKc+niQSLZWOLcw
 tKZ3JfMX0F5CHocFte2i0jSOgIXT3QtOigzfwP7JZb1ZaMDMnvqyFb26sgeRmCTpJPWM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3VpK-0077Dm-AN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 06:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3E186188D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Nov 2023 06:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458B6C433C9;
 Thu, 16 Nov 2023 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700115964;
 bh=6rwiQ68wHhdsE6vY/Y31nFsyaYQ2rLgqDwN+2WxChEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XIuPwVvk8OAAiglh4l+yrHMbH+U1E4tlFGpj6dqWYdv6FlT3GEmLUnBx6u5qaJL8e
 8iiU1S03QdgwgH67BEn0CunhA2O/7XGyO+TJLDVXrS0Ql3NY3m1Cof+SADxmK+nv5d
 emPwLN/XIwrNwUkAvFbD9iuFt+Ki6Ba2hjNFIZ9cHqYYj/NKt1EafCbhU1bK5soqrD
 Ea2mNSi+m8H8h4HhaA7ikBwdDtfafQXtAvValMHkzvU3shabOifFaNoJHC+9wZ/0HY
 be8J/dOOZP8Db6Y33jBnwR5mM/h0WUtCm6gc5qZaHorKuzRJrCbxpj4bW6Z7b7T7G/
 Gc2skX6crDrYQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 16 Nov 2023 14:25:55 +0800
Message-Id: <20231116062556.2451839-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116062556.2451839-1-chao@kernel.org>
References: <20231116062556.2451839-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_fiemap() will only traverse metadata of inode, let's
 use shared inode lock for it to avoid unnecessary race on inode lock.
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 4 ++-- 1 file changed,
 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r3VpK-0077Dm-AN
Subject: [f2fs-dev] [PATCH 2/3] f2fs: use shared inode lock during
 f2fs_fiemap()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_fiemap() will only traverse metadata of inode, let's use shared
inode lock for it to avoid unnecessary race on inode lock.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e42b5f24deb..42f0f6184f73 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1992,7 +1992,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (ret)
 		return ret;
 
-	inode_lock(inode);
+	inode_lock_shared(inode);
 
 	maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
 	if (start > maxbytes) {
@@ -2112,7 +2112,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (ret == 1)
 		ret = 0;
 
-	inode_unlock(inode);
+	inode_unlock_shared(inode);
 	return ret;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
