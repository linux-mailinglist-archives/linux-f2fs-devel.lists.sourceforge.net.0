Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8593C76E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 18:53:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX1if-0007bu-16;
	Thu, 25 Jul 2024 16:53:32 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sX1id-0007bn-46
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 16:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuUZaTOyPRZX5ZrT+PYS/qA8lns1mnbr1m8XbgdPpSg=; b=AMdktBVtfnYBZpOubEaQpKjBIQ
 YBB6hS+gZ+ypyjagDHY6+BaRmtuK1M2VgW8uyujHFp/7WaX86qXqZk4qpmhP5JhPaFa2aCkE3TvpE
 WdTn9cFv0w07Vtb1gcgRN6AGDHPaPgYAW5G60myrgIuGdsSF8YxXLeDM57Bk0HNVF8QI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TuUZaTOyPRZX5ZrT+PYS/qA8lns1mnbr1m8XbgdPpSg=; b=i6ncdGj4GcFMjtizkM+RbZFf7r
 j1/iuxcV3V+cjr5H5yrcIdD1jeQNxk2qVTSusZoyKoMQ4Qyd9B5cNbr4LrV+FKeybdCMMxn/m1dZ1
 XwdUxM066DqSRlj4xTEjYmtpGHfA1AdgBn2sSDBuqaUoHlr7RWGEXZkcPFu9BIvwoBMI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX1ib-0005Ws-EN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 16:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 399A3CE136B;
 Thu, 25 Jul 2024 16:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC589C116B1;
 Thu, 25 Jul 2024 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721926401;
 bh=+4LlKYDTgAhPZmYC0SMXOXNTQ6Qeoe1ZKAUx/gCLEp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bh+dgbAvSjID/AhQ1jSSZiMZO6mGq8NpoZ/91FphQd9ok/ugXlvEV8SAXRvILTBWh
 ztVRAk+37960TOTmWMU/Z4cGgguWJnDhxlqmrUzYaScWGB3LoDDf1S1MrAlGM1qKD7
 MKoxHjqQneX2R4RaUqkFsYAULPI0ETl9VqvhijU5WlgmFhW5eOuzf9fuwny0oAqtXz
 7ohPizIk0PoneOeXGgcKPhh6+u3kn1z4H1qCGwIp1dMxx6iQAi7PnBgmxQ7QHqauOA
 nbLWCzg44pPUBiUPr6cwLK9cV711YbCGupsDd554bBehWo09bmogxIjelHWMBTDp0S
 cTsGKK43lQruQ==
Date: Thu, 25 Jul 2024 16:53:19 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Message-ID: <ZqKC_wqbe_1qqQmf@google.com>
References: <1721295366-21008-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1721295366-21008-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/18, Zhiguo Niu wrote: > This is a supplement to commit
 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes") > for some missed cases, 
 also cleanup redundant code in f2fs_llseek. > > Cc: Chengguan [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX1ib-0005Ws-EN
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use per-inode maxbytes and
 cleanup
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/18, Zhiguo Niu wrote:
> This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes")
> for some missed cases, also cleanup redundant code in f2fs_llseek.
> 
> Cc: Chengguang Xu <cgxu519@mykernel.net>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/data.c   | 2 +-
>  fs/f2fs/file.c   | 7 ++-----
>  fs/f2fs/verity.c | 5 +++--
>  3 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 6457e5b..1d41d99 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2064,7 +2064,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  static inline loff_t f2fs_readpage_limit(struct inode *inode)
>  {
>  	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
> -		return inode->i_sb->s_maxbytes;
> +		return max_file_blocks(inode) << F2FS_BLKSIZE_BITS;

F2FS_BLK_TO_BYTES(max_file_blocks(inode))?

>  
>  	return i_size_read(inode);
>  }
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index effbaa6..e6411d5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -431,7 +431,7 @@ static bool __found_offset(struct address_space *mapping,
>  static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
>  {
>  	struct inode *inode = file->f_mapping->host;
> -	loff_t maxbytes = inode->i_sb->s_maxbytes;
> +	loff_t maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
>  	struct dnode_of_data dn;
>  	pgoff_t pgofs, end_offset;
>  	loff_t data_ofs = offset;
> @@ -513,10 +513,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
>  static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
>  {
>  	struct inode *inode = file->f_mapping->host;
> -	loff_t maxbytes = inode->i_sb->s_maxbytes;
> -
> -	if (f2fs_compressed_file(inode))
> -		maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
> +	loff_t maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
>  
>  	switch (whence) {
>  	case SEEK_SET:
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index f7bb0c5..7fc787c 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -74,7 +74,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
>  	struct address_space *mapping = inode->i_mapping;
>  	const struct address_space_operations *aops = mapping->a_ops;
>  
> -	if (pos + count > inode->i_sb->s_maxbytes)
> +	if (pos + count > (max_file_blocks(inode) << F2FS_BLKSIZE_BITS))
>  		return -EFBIG;
>  
>  	while (count) {
> @@ -237,7 +237,8 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  	pos = le64_to_cpu(dloc.pos);
>  
>  	/* Get the descriptor */
> -	if (pos + size < pos || pos + size > inode->i_sb->s_maxbytes ||
> +	if (pos + size < pos ||
> +	    pos + size > (max_file_blocks(inode) << F2FS_BLKSIZE_BITS) ||
>  	    pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
>  		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
>  		f2fs_handle_error(F2FS_I_SB(inode),
> -- 
> 1.9.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
