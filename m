Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67810A735
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Nov 2019 00:44:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZkVh-0003lw-KH; Tue, 26 Nov 2019 23:44:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iZkVg-0003lQ-A6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 23:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgC6IPTOwRQhk5kbYzvXjLxiDyLX8e1Nqy6KmUia0ig=; b=i/OCAI4XVurdONenp5qUutaKCM
 eJ/2TD1n9rdTndbuuF9LcqjgvSNi1A4IQL2x653OO2DScQuqnj6hd7shj75WJhT2JFXnMoYpMfmHZ
 cT0KuavntoZWUt3D5BPRYFSIdJ1jllPbE3iiq2Bk3zvo/lKL7Ek1v/pFHc77t0N18Jho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XgC6IPTOwRQhk5kbYzvXjLxiDyLX8e1Nqy6KmUia0ig=; b=PyYpVdA2RqLKe82MT11HqF913l
 YAYQWeCp5w0jWsgDE/5n4A5fWMMx7IUEtINMGml6KK7FJQ/JFQoJ4B/DukBEAXIsDnXQ55U6j1nRv
 eoMdLiGSMHLPlvJf/HTATioZQh2+ybdsbRXbvaJhabzxDm6ixE/d8ZSjf0HHNaafYe5w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZkVc-006wVh-5W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 23:44:44 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EE86206CC;
 Tue, 26 Nov 2019 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574811869;
 bh=8xObk1JKbn0x2uZoqD8XspYaUE5uHmLiYAZWiWl2MKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nTjei7PsgJjFFf3C8lRoDuexiqvwf+EJKVyb6Od9Mce5lglMIR9i61jU1l385RVQI
 QFhxNOSi9poeYC+U6AA4Ps0vMJ+aYa4Xc1uIs5cUgZJHV8JXEKHsP5zKN5gR2nUzZV
 TEE9NRhNJxCbhAqDbKV/VzTOq/4finL657urgNcU=
Date: Tue, 26 Nov 2019 15:44:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126075719.1046485-1-damien.lemoal@wdc.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iZkVc-006wVh-5W
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: Javier Gonzalez <javier@javigon.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/26, Damien Le Moal wrote:
> f2fs_preallocate_blocks() identifies direct IOs using the IOCB_DIRECT
> flag for a kiocb structure. However, the file system direct IO handler
> function f2fs_direct_IO() may have decided that a direct IO has to be
> exececuted as a buffered IO using the function f2fs_force_buffered_io().
> This is the case for instance for volumes including zoned block device
> and for unaligned write IOs with LFS mode enabled.
> 
> These 2 different methods of identifying direct IOs can result in
> inconsistencies generating stale data access for direct reads after a
> direct IO write that is treated as a buffered write. Fix this
> inconsistency by combining the IOCB_DIRECT flag test with the result
> of f2fs_force_buffered_io().
> 
> Reported-by: Javier Gonzalez <javier@javigon.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  fs/f2fs/data.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5755e897a5f0..8ac2d3b70022 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>  	int flag;
>  	int err = 0;
>  	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
> +	bool do_direct_io = direct_io &&
> +		!f2fs_force_buffered_io(inode, iocb, from);
>  
>  	/* convert inline data for Direct I/O*/
>  	if (direct_io) {
> @@ -1081,7 +1083,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>  			return err;
>  	}
>  
> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
> +	if (do_direct_io && allow_outplace_dio(inode, iocb, from))

It seems f2fs_force_buffered_io() includes allow_outplace_dio().

How about this?
---
 fs/f2fs/data.c | 13 -------------
 fs/f2fs/file.c | 35 +++++++++++++++++++++++++----------
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a034cd0ce021..fc40a72f7827 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1180,19 +1180,6 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
 	int err = 0;
 	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
 
-	/* convert inline data for Direct I/O*/
-	if (direct_io) {
-		err = f2fs_convert_inline_inode(inode);
-		if (err)
-			return err;
-	}
-
-	if (direct_io && allow_outplace_dio(inode, iocb, from))
-		return 0;
-
-	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
-		return 0;
-
 	map.m_lblk = F2FS_BLK_ALIGN(iocb->ki_pos);
 	map.m_len = F2FS_BYTES_TO_BLK(iocb->ki_pos + iov_iter_count(from));
 	if (map.m_len > map.m_lblk)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c0560d62dbee..6b32ac6c3382 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3386,18 +3386,33 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				ret = -EAGAIN;
 				goto out;
 			}
-		} else {
-			preallocated = true;
-			target_size = iocb->ki_pos + iov_iter_count(from);
+			goto write;
+		}
 
-			err = f2fs_preallocate_blocks(iocb, from);
-			if (err) {
-				clear_inode_flag(inode, FI_NO_PREALLOC);
-				inode_unlock(inode);
-				ret = err;
-				goto out;
-			}
+		if (is_inode_flag_set(inode, FI_NO_PREALLOC))
+			goto write;
+
+		if (iocb->ki_flags & IOCB_DIRECT) {
+			/* convert inline data for Direct I/O*/
+			err = f2fs_convert_inline_inode(inode);
+			if (err)
+				goto out_err;
+
+			if (!f2fs_force_buffered_io(inode, iocb, from))
+				goto write;
+		}
+		preallocated = true;
+		target_size = iocb->ki_pos + iov_iter_count(from);
+
+		err = f2fs_preallocate_blocks(iocb, from);
+		if (err) {
+out_err:
+			clear_inode_flag(inode, FI_NO_PREALLOC);
+			inode_unlock(inode);
+			ret = err;
+			goto out;
 		}
+write:
 		ret = __generic_file_write_iter(iocb, from);
 		clear_inode_flag(inode, FI_NO_PREALLOC);
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
