Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 133721C8428
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 10:02:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWbU9-00087N-DM; Thu, 07 May 2020 08:02:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jWbU1-00086F-7s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 08:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TV3dhiouaG9irHiZPTAmDTGRefQJcc+KN+sKXM7xwt4=; b=Kvt8ZIwm9+cYvAbicMuKAuj3rf
 c/9gKOw7kwf4UKAyPuqPTl2QDRDGB9Ik0vPTLwDZvGscqjLPnaTKLPno9KQLJp68+U/5WFxf7XmiA
 S58Zkg7u7KmWnP4TjftRAvNBK4ay7/U6GLr1b4cBORdU+C0LN51TTThOzOMBFKrCSftY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TV3dhiouaG9irHiZPTAmDTGRefQJcc+KN+sKXM7xwt4=; b=fgjpFz9/WsIba0dJtj/7pmSXV9
 gCrrw2V+Xv5E2l0Ra6Tw9ftU3diZdlG5eiEf43GCl/VphN+RqSIC7OUmm6pAAfLKuvOrpIYMwP/ZV
 0WDBERqEMGxgy8ZSFChV09UH1klmw/xbdfSTePgybMlTEP02yeoQs7hX4fuQ5zYNWb90=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWbTv-00HQwD-6X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 08:02:17 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 789012083B;
 Thu,  7 May 2020 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588838525;
 bh=5KW/p1GbhRBZezjeN6Jxtl3o/jDLJ8jnDdhbn7WS9zI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SUI0uGI4UpXv2rTaeWxVIAmqMXoCfCwc+fCMmUclotlv9JZ167jjDT8HxOo4WNyGT
 WaZijTF07p1quUYHyyg8X5af/6RawBkPjtrC5l97K0yz7hZW0CZMn6ChGBhKpHVyrR
 r80zLDH/MSgNwOLAUJahxyoPU5u6SKiElgcwXrgo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  7 May 2020 00:59:02 -0700
Message-Id: <20200507075905.953777-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507075905.953777-1-ebiggers@kernel.org>
References: <20200507075905.953777-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWbTv-00HQwD-6X
Subject: [f2fs-dev] [PATCH 1/4] f2fs: don't leak filename in
 f2fs_try_convert_inline_dir()
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
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, stable@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

We need to call fscrypt_free_filename() to free the memory allocated by
fscrypt_setup_filename().

Fixes: b06af2aff28b ("f2fs: convert inline_dir early before starting rename")
Cc: <stable@vger.kernel.org> # v5.6+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/inline.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4167e540815185..59a4b7ff11e17a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -559,12 +559,12 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 	ipage = f2fs_get_node_page(sbi, dir->i_ino);
 	if (IS_ERR(ipage)) {
 		err = PTR_ERR(ipage);
-		goto out;
+		goto out_fname;
 	}
 
 	if (f2fs_has_enough_room(dir, ipage, &fname)) {
 		f2fs_put_page(ipage, 1);
-		goto out;
+		goto out_fname;
 	}
 
 	inline_dentry = inline_data_addr(dir, ipage);
@@ -572,6 +572,8 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 	err = do_convert_inline_dir(dir, ipage, inline_dentry);
 	if (!err)
 		f2fs_put_page(ipage, 1);
+out_fname:
+	fscrypt_free_filename(&fname);
 out:
 	f2fs_unlock_op(sbi);
 	return err;
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
