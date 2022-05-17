Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D694752AA70
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 20:18:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nr1mF-0004dZ-LW; Tue, 17 May 2022 18:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nr1mD-0004dT-TU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 18:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ms7wK3YdSmeqqSbo5Mk97msT9LRUFNQy7KldKFIWyIE=; b=cf3zM6rN+YCZ3hDTAWG481m4A6
 AtisYhSlGGYO8AXH8ryoz8djwwaOEyvwvtJRDQm2soyxG+c9w7pPKfpcP9/FLmahwsyV1eUsDz+8X
 Ss3XIjWpBd4Z8FS43YVtzH8wnSsOfUbBdrgQ6FTsQgaTDw4c4kdeRB0RvrDpvUW34ZAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ms7wK3YdSmeqqSbo5Mk97msT9LRUFNQy7KldKFIWyIE=; b=Xl2a3LdpuYjzj0CbAAwtWsWQKI
 VmHvumvbVdlUjC8dtSW5UN3+V3gEIssVnc+mKj9Bm5jdbbRgE9+yiDEwRhjWz3sE1Ed/ZApErOdWS
 BwrcvHQcq+oOQ9s9jVfca24Tnc1R5gZn0YjNz7vxf1EGYzAT25UECqcDN61lD1DUdZdU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nr1mD-004dhd-A0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 18:18:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA12A61551;
 Tue, 17 May 2022 18:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293B7C385B8;
 Tue, 17 May 2022 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652811507;
 bh=2LCmXWONhKrPy7V/HFUdgxZKavcQYloErhSK6XQD1tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=okiCUjDmTLzdZyWXfepJpPbdx1gK30/Wqd0sXKdy6X/Naod/JEIiHeCGOBbjFrYj+
 rHbGIXINnXvx3NrlrP1LntVd2nEQZJJT3ivOs6NnPOmt7eSX9mfARpztaHWBN7pJSA
 LxYGDl3HSnAjiNZTZWlyivpAxw4W8jarJC1mFpvMJYEYmcMrk2KzUFHG8eNIDab32j
 bfTTchj1nBXJxXtaL7H6oV/kL+e31N18OP4nb22uj26EUjgVX4frSybpvStSl9VUw1
 PrSd3ULmI+V+M83nEXjta4iZZeql8zQue2Uze4r87DZzNtxUOCurCcRd0Kt31cmPsH
 d30YIf/xo/9dQ==
Date: Tue, 17 May 2022 11:18:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YoPm8UI61eKtKPB8@google.com>
References: <20220517033120.3564912-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517033120.3564912-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/17, Chao Yu wrote: > Yanming reported a kernel bug in
 Bugzilla kernel [1], which can be > reproduced. The bug message is: > > The
 kernel message is shown below: > > kernel BUG at fs/inode.c:611! [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nr1mD-004dhd-A0
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix to do sanity check for inline
 inode
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/17, Chao Yu wrote:
> Yanming reported a kernel bug in Bugzilla kernel [1], which can be
> reproduced. The bug message is:
> 
> The kernel message is shown below:
> 
> kernel BUG at fs/inode.c:611!
> Call Trace:
>  evict+0x282/0x4e0
>  __dentry_kill+0x2b2/0x4d0
>  dput+0x2dd/0x720
>  do_renameat2+0x596/0x970
>  __x64_sys_rename+0x78/0x90
>  do_syscall_64+0x3b/0x90
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=215895
> 
> The bug is due to fuzzed inode has both inline_data and encrypted flags.
> During f2fs_evict_inode(), as the inode was deleted by rename(), it
> will cause inline data conversion due to conflicting flags. The page
> cache will be polluted and the panic will be triggered in clear_inode().
> 
> Try fixing the bug by doing more sanity checks for inline data inode in
> sanity_check_inode().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Ming Yan <yanming@tju.edu.cn>
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
> v4:
> - introduce and use f2fs_post_read_required_ondisk() only for

Can we do like this?

---
 fs/f2fs/f2fs.h   |  1 +
 fs/f2fs/inline.c | 30 +++++++++++++++++++++++++-----
 fs/f2fs/inode.c  |  3 +--
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e9e32bc814df..000468bf06ca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4019,6 +4019,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
  * inline.c
  */
 bool f2fs_may_inline_data(struct inode *inode);
+bool f2fs_sanity_check_inline_data(struct inode *inode);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index a578bf83b803..daf8c0e0a6b6 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -14,21 +14,41 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
-bool f2fs_may_inline_data(struct inode *inode)
+static bool support_inline_data(struct inode *inode)
 {
 	if (f2fs_is_atomic_file(inode))
 		return false;
-
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
-
 	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
 		return false;
+	return true;
+}
 
-	if (f2fs_post_read_required(inode))
+bool f2fs_may_inline_data(struct inode *inode)
+{
+	if (!support_inline_data(inode))
 		return false;
 
-	return true;
+	return !(f2fs_encrypted_file(inode) || fsverity_active(inode) ||
+		f2fs_compressed_file(inode));
+}
+
+bool f2fs_sanity_check_inline_data(struct inode *inode)
+{
+	if (!f2fs_has_inline_data(inode))
+		return false;
+
+	if (!support_inline_data(inode))
+		return true;
+
+	/*
+	 * used by sanity_check_inode(), when disk layout fields has not
+	 * been synchronized to inmem fields.
+	 */
+	return (S_ISREG(inode->i_mode) &&
+		(file_is_encrypt(inode) || file_is_verity(inode) ||
+		(F2FS_I(inode)->i_flags & F2FS_COMPR_FL)));
 }
 
 bool f2fs_may_inline_dentry(struct inode *inode)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2fce8fa0dac8..938961a9084e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_has_inline_data(inode) &&
-			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
+	if (f2fs_sanity_check_inline_data(inode)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
