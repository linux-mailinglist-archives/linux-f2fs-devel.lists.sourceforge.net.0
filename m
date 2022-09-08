Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A214A5B124E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 04:02:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oW6rt-0006AG-7R;
	Thu, 08 Sep 2022 02:02:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oW6rr-0006A9-Vf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 02:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tlo6Ums2EjKq/dcLi3ijs7h2ee6ClZk5rM4FvVGN9b0=; b=fwB0bBOjXwXxChVd8DMfbd8SSi
 XLa2lTdSCkod/q9KOmjB/bnDIiuxlPaZBW/CBJUk0KQq43RPQ3eh03lXVDkfmiwX0NXUgu0zYW0Mj
 cx1+uUlf96ct95kExL/wtAsI8NX7hEbDINu3p0b1zT7nmyg1d5t/gNPoT/N9sF9H+lwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tlo6Ums2EjKq/dcLi3ijs7h2ee6ClZk5rM4FvVGN9b0=; b=KivtQxs5jkHjZmKdC8sX68ldKF
 0U6Re6T3zb+0IqKds0uQViiA/SNxBZOB6NOdLz9eT41LjE9ADcOz4LA0aFRPLV1R3rZoRKnbU+2BV
 Fl1dhM2jNwEJ4BcJOgnkr9cVw0j8HctNB5X827+JWPHDYcwdYwQzm7bi9qPNGj9PG594=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oW6rr-001go3-40 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 02:02:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DAB28B81110;
 Thu,  8 Sep 2022 02:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82621C433C1;
 Thu,  8 Sep 2022 02:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662602523;
 bh=+YqEBpewnsYL0n5QFDpeysQRnsa0xFYmJAOlu5RQWOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJ+zFzxRs5Dr3gGV66lk/RxiSYeorPn/IIrUxYMTZx04ofZr2dEcELq59bQndkPUS
 835XkId/CeodIOQK/sDnglANmtYRQVQ/dheX0ZQYmZzHPoqvOSxlyHmHFqVJVHIWgh
 NlwQSd/FaYZ9ouAENzMH9yEbXssBE0BqOmaKJOwvADUfDVWFsVUYxPWImjtl2TKlZI
 Z2vW04yP1XXzgr2RjWxYDt7LHrCuq2ANJvlfll60wPY16wojZjBITvKAJluTe81Auq
 dGVlFQIDsOXzVMIfMIskARemwgHpVloWFbxx5U8pAloQz42VmtQS4xa59NBG+Iz5ds
 soWOL3YWPt4Dw==
Date: Wed, 7 Sep 2022 19:02:01 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YxlNGeh6Sr4isEFf@google.com>
References: <20220830225358.300027-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830225358.300027-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/31, Chao Yu wrote: > From: Chao Yu <chao.yu@oppo.com>
 > > Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
 > meta inode, node inode or compressed inode, and add f2fs_check_n [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oW6rr-001go3-40
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to disallow getting inner inode
 via f2fs_iget()
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

On 08/31, Chao Yu wrote:
> From: Chao Yu <chao.yu@oppo.com>
> 
> Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
> meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
> in f2fs_iget() to avoid getting inner inode from external interfaces.

So, we don't want to check the range of inner inode numbers? What'd be the
way to check it's okay?

> 
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
> v2:
> - don't override errno from f2fs_check_nid_range()
> - fix compile error
>  fs/f2fs/compress.c |  2 +-
>  fs/f2fs/f2fs.h     |  1 +
>  fs/f2fs/inode.c    | 13 ++++++++++++-
>  fs/f2fs/super.c    |  4 ++--
>  4 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 730256732a9e..c38b22bb6432 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1947,7 +1947,7 @@ int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
>  	if (!test_opt(sbi, COMPRESS_CACHE))
>  		return 0;
>  
> -	inode = f2fs_iget(sbi->sb, F2FS_COMPRESS_INO(sbi));
> +	inode = f2fs_iget_inner(sbi->sb, F2FS_COMPRESS_INO(sbi));
>  	if (IS_ERR(inode))
>  		return PTR_ERR(inode);
>  	sbi->compress_inode = inode;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 408d8034ed74..35f9e1a6a1bf 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3467,6 +3467,7 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
>  void f2fs_set_inode_flags(struct inode *inode);
>  bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
>  void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
> +struct inode *f2fs_iget_inner(struct super_block *sb, unsigned long ino);
>  struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
>  struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
>  int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 6d11c365d7b4..965f87c1dd63 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -480,7 +480,7 @@ static int do_read_inode(struct inode *inode)
>  	return 0;
>  }
>  
> -struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> +struct inode *f2fs_iget_inner(struct super_block *sb, unsigned long ino)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	struct inode *inode;
> @@ -568,6 +568,17 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>  	return ERR_PTR(ret);
>  }
>  
> +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> +{
> +	int ret;
> +
> +	ret = f2fs_check_nid_range(F2FS_SB(sb), ino);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return f2fs_iget_inner(sb, ino);
> +}
> +
>  struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
>  {
>  	struct inode *inode;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b8e5fe244596..a5f5e7483791 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4157,7 +4157,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto free_xattr_cache;
>  
>  	/* get an inode for meta space */
> -	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
> +	sbi->meta_inode = f2fs_iget_inner(sb, F2FS_META_INO(sbi));
>  	if (IS_ERR(sbi->meta_inode)) {
>  		f2fs_err(sbi, "Failed to read F2FS meta data inode");
>  		err = PTR_ERR(sbi->meta_inode);
> @@ -4265,7 +4265,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto free_nm;
>  
>  	/* get an inode for node space */
> -	sbi->node_inode = f2fs_iget(sb, F2FS_NODE_INO(sbi));
> +	sbi->node_inode = f2fs_iget_inner(sb, F2FS_NODE_INO(sbi));
>  	if (IS_ERR(sbi->node_inode)) {
>  		f2fs_err(sbi, "Failed to read node inode");
>  		err = PTR_ERR(sbi->node_inode);
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
