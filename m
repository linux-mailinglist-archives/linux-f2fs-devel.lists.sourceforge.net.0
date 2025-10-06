Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E01BBDB2A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 12:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oQoftrKrzkkmK/GhSJlWDIY+mrJDJgqJmf8FF0d02g=; b=LXRjE3xjiM+ecFGw2xSQDmKchq
	PHHAVkA9wtkqp2DhAMGBkecQ3YN3GG4OlwmSxojZXLW9hxvua+tppEM8RVDd5k0gJ4ZniD2wy86UZ
	l69GIWQGu8MyAcRew7DRo1GIFk4+AcpfIeBMtS1DQSmaIwXGFS8JXykU6N5CX933E8VY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5iVQ-0000oJ-1h;
	Mon, 06 Oct 2025 10:31:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1v5iVO-0000oD-7f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 10:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gToyt//LrPp0ROEL4gWMPCEwbVkZg/TKQKf+z8S8XFU=; b=RZtrDm9cM8Nj1GpVWdeYKVUDlS
 iwGTRJb0nQMtN5ZtWAVZEvn9vGLu27MqAU6Vx2xNMFwgFqDmTWpvNKMJFUqk1V7bw4ZMRQydHd7OR
 wI5eDBCK0KW6R3gw3nNrvJkDMAJV1FVyTyUDfSiLRI/0qb8AxLg+/iihI6k21WXKtum0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gToyt//LrPp0ROEL4gWMPCEwbVkZg/TKQKf+z8S8XFU=; b=Gn7w6rkhnf2svHNRhlW71zD5vs
 0+v2CJ0PMnQCqUHUh5ZDavnBwcMtokKT/RMgSUczFycgSDWAbZqLUF/k/v1U8JWTuopNxm28Agrhf
 AVrBDNcOoc3jiVX8oU8msx6HMy98IJ8XxpnYB3Q3qHejEENxnnG13dmomHZf5Nm+pHKI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v5iVN-0006Kq-MS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 10:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57EA8447E2;
 Mon,  6 Oct 2025 10:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF7AC4CEF5;
 Mon,  6 Oct 2025 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759746695;
 bh=cG36zcMsqBxk2WJ2EVZoOITToowjiuE8hiD3wFiNkKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JiOpXpLX1LOti/71X2UY6glPDDySKuuiLbKds+cJJHu0B1lKcZpieTyywhNJwGyE3
 eXIQGEKdFFgQ955uRo8h9VPQr+NGSUISfwLhN7OpNU8QxYJebWD2rKAB2lWg30g1Ri
 P21jCrkS0KGwVUGnoD6kECgMatJl7mnewiAo9TVuIfBiuY06ihWPPbrcGBXoDQhgy7
 aJ2iIL5m4R+10hJD19JsyvaasBoEOSGFgBSLO7jUKzHX7s6kB23SaNYfwZEqp1qY5R
 w4tWBg5qfQz6MgAlnVxmZ7nlZnn5JiNCz238vF5GWTJDh78sUjIbFVH/ADKbnJLcfB
 hfDxUZ3MbpfNQ==
To: Julian Sun <sunjunchao@bytedance.com>
Date: Mon,  6 Oct 2025 12:30:44 +0200
Message-ID: <20251006-exhumieren-staub-bbd9b043162d@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929111349.448324-1-sunjunchao@bytedance.com>
References: <20250929111349.448324-1-sunjunchao@bytedance.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=brauner@kernel.org;
 h=from:subject:message-id; bh=cG36zcMsqBxk2WJ2EVZoOITToowjiuE8hiD3wFiNkKw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ8nlX/0Jvr3gGB1U+cVD/bOZmZhZ/Zqn9B+WvB+U6zF
 KZpPi+Pd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEwk+jAjw8qd51l/at8+xuU3
 e0Hd3EPTu6JebI0xStikH9h9cJnw8ScM/2z/sHCHmyuJGqS7vu+vmb3+6kYehrkssi19t6seP1d
 04gEA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 29 Sep 2025 19:13:49 +0800, Julian Sun wrote: > The
 logic in wbc_to_tag() is widely used in file systems, so modify this > function
 to be inline and use it in file systems. > > This patch has [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v5iVN-0006Kq-MS
Subject: Re: [f2fs-dev] [PATCH v2] fs: Make wbc_to_tag() inline and use it
 in fs.
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 tytso@mit.edu, agruenba@redhat.com, linux-fsdevel@vger.kernel.org,
 jack@suse.cz, willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 clm@fb.com, adilger.kernel@dilger.ca, dsterba@suse.com, jaegeuk@kernel.org,
 idryomov@gmail.com, xiubli@redhat.com, ceph-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 29 Sep 2025 19:13:49 +0800, Julian Sun wrote:
> The logic in wbc_to_tag() is widely used in file systems, so modify this
> function to be inline and use it in file systems.
> 
> This patch has only passed compilation tests, but it should be fine.
> 
> 

Folding:

diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index dde77d13a200..1e60d463f226 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -196,6 +196,13 @@ static inline void wait_on_inode(struct inode *inode)
                       !(READ_ONCE(inode->i_state) & I_NEW));
 }

+static inline xa_mark_t wbc_to_tag(struct writeback_control *wbc)
+{
+       if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
+               return PAGECACHE_TAG_TOWRITE;
+       return PAGECACHE_TAG_DIRTY;
+}
+
 #ifdef CONFIG_CGROUP_WRITEBACK

 #include <linux/cgroup.h>
@@ -240,13 +247,6 @@ static inline void inode_detach_wb(struct inode *inode)
        }
 }

-static inline xa_mark_t wbc_to_tag(struct writeback_control *wbc)
-{
-       if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
-               return PAGECACHE_TAG_TOWRITE;
-       return PAGECACHE_TAG_DIRTY;
-}
-
 void wbc_attach_fdatawrite_inode(struct writeback_control *wbc,
                struct inode *inode);

since wbc_to_tag() cannot be conditional on cgroup writeback.

---

Applied to the vfs-6.19.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.19.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.19.misc

[1/1] fs: Make wbc_to_tag() inline and use it in fs.
      https://git.kernel.org/vfs/vfs/c/48b6926673f7


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
