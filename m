Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7362EFE5F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9AO-0004D6-JE; Sat, 09 Jan 2021 08:00:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9AN-0004Cy-6O
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FE3pBOXfUc8Y0Q6oY0kg9ooKWzqlaaBoUPObjExCJxE=; b=R4LM+PqR9ELH1fwK4rWca2MD0j
 jFccM3nrmNgVF6PNShAT99DEvl+XayYBsfah40YFsFja2Ja2WkDrN57EhiaOJQ2nzbiKIwhH2Ij+V
 VCf3MvmYt2quhZbGXCzfUmfjgaewE2IsZZ7OcXzcsHvopHTK4kJIDJH1mFO9zMFxTyyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FE3pBOXfUc8Y0Q6oY0kg9ooKWzqlaaBoUPObjExCJxE=; b=PupAKhmUwzrkxF880jB4rzAKCh
 rr1ZBtEw26bjolCIGrSoncFa/PAL0vYH0JE3ufGzpwNjzYA993N36SKA+kSUoppQJKD4JhRHcvea7
 7jQ46i2rsZRXiNthHlnLxJm3HI/nIzX922WjjwGtIS27u91ZHd+qXOEB7ChSwmxGkt30=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AA-002qXn-2n
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A4D023A5B;
 Sat,  9 Jan 2021 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179184;
 bh=r+iSj8HBgvEzfJp78mWo1kCacxf8t3pr0DVy9t0EPKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PzwNpXPgzzhKMQZWWgDwsQPa8KffMcjNGPEaHSRXHIdDVvkTCc1tkTwLsQZgfzg71
 84kj5xvzn6qcxO6wc/u0ZFxyNVfATA0XY849ko+2s2WWiIJEWvee7qgb/nyr7z9Rv2
 2d2aDeJbgtqdWOVD5MiJ0gFX/ckdkChPtlgMpFQgPc5Cj0UlJaKkKB+eEqNows1uqY
 SxJIWPAKdn6JVzXk38xPen8V/5iryIKn2Zf9WUqOHa662DbtNnuypkL0i1ofbK6UMz
 4WVuyQ6Ddm3zz6l9R7o884+vHAK805R3dESA1NBRaA2noYYkhcP83g5t0aGKeWs17l
 JA3uG2Bn29ncQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:58:53 -0800
Message-Id: <20210109075903.208222-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AA-002qXn-2n
Subject: [f2fs-dev] [PATCH v2 02/12] fs: correctly document the inode dirty
 flags
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The documentation for I_DIRTY_SYNC and I_DIRTY_DATASYNC is a bit
misleading, and I_DIRTY_TIME isn't documented at all.  Fix this.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fs.h | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index fd47deea7c176..45a0303b2aeb6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2084,8 +2084,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 /*
  * Inode state bits.  Protected by inode->i_lock
  *
- * Three bits determine the dirty state of the inode, I_DIRTY_SYNC,
- * I_DIRTY_DATASYNC and I_DIRTY_PAGES.
+ * Four bits determine the dirty state of the inode: I_DIRTY_SYNC,
+ * I_DIRTY_DATASYNC, I_DIRTY_PAGES, and I_DIRTY_TIME.
  *
  * Four bits define the lifetime of an inode.  Initially, inodes are I_NEW,
  * until that flag is cleared.  I_WILL_FREE, I_FREEING and I_CLEAR are set at
@@ -2094,12 +2094,20 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
  * Two bits are used for locking and completion notification, I_NEW and I_SYNC.
  *
  * I_DIRTY_SYNC		Inode is dirty, but doesn't have to be written on
- *			fdatasync().  i_atime is the usual cause.
- * I_DIRTY_DATASYNC	Data-related inode changes pending. We keep track of
+ *			fdatasync() (unless I_DIRTY_DATASYNC is also set).
+ *			Timestamp updates are the usual cause.
+ * I_DIRTY_DATASYNC	Data-related inode changes pending.  We keep track of
  *			these changes separately from I_DIRTY_SYNC so that we
  *			don't have to write inode on fdatasync() when only
- *			mtime has changed in it.
+ *			e.g. the timestamps have changed.
  * I_DIRTY_PAGES	Inode has dirty pages.  Inode itself may be clean.
+ * I_DIRTY_TIME		The inode itself only has dirty timestamps, and the
+ *			lazytime mount option is enabled.  We keep track of this
+ *			separately from I_DIRTY_SYNC in order to implement
+ *			lazytime.  This gets cleared if I_DIRTY_INODE
+ *			(I_DIRTY_SYNC and/or I_DIRTY_DATASYNC) gets set.  I.e.
+ *			either I_DIRTY_TIME *or* I_DIRTY_INODE can be set in
+ *			i_state, but not both.  I_DIRTY_PAGES may still be set.
  * I_NEW		Serves as both a mutex and completion notification.
  *			New inodes set I_NEW.  If two processes both create
  *			the same inode, one of them will release its inode and
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
