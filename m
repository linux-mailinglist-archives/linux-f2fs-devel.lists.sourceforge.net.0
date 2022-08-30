Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2E5A6BCF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Aug 2022 20:10:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oT5h8-0000LF-Aa;
	Tue, 30 Aug 2022 18:10:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oT5h7-0000L9-2M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 18:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVCO4gtFwu3s+L3RLtHIy2F4LyorzRKmnxxBc6Kbo3M=; b=cCeXPYVWD/YUmvfNP8QpCVKmgA
 m+g8QV88Jce1CN1a13DHnGljV4G4Rc3pqAhe9Zqs78ZxBmYF6AEkr6A/fBGhxKjTynP4Tu+5qZsPD
 qsnqIEQMxRQ8kL+278+yKVX6uHhX3ZyOIGk3CcoMpPNWG7ks/Qldxr0oQJc9RPNwrO5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zVCO4gtFwu3s+L3RLtHIy2F4LyorzRKmnxxBc6Kbo3M=; b=MDiZET4mJP+1KgZhx29hye5b1W
 xyQlLugZFSmMwelwZIoMZxwOTAAZ8J+77QtQootoF+5f94oey/sJJ+i9SawXMQLr4jklc6yPOtv7i
 aC/yIOrU1RAIDf6jxvnVdBG71QcMiZrylfISbXWRbLTCn2/wLfTzcUuemwEvKZveYuQw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oT5gl-0000SG-QK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 18:10:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4085261576;
 Tue, 30 Aug 2022 18:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A82C433B5;
 Tue, 30 Aug 2022 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661882998;
 bh=FTf0fk3Y8UdccBmEPJWLfwBJ6gjV8U0LCPFcXhyZWtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=atVoL2keyCWWlK717vJHwSGjd44gbivT0eXbtMHWf6NT4/uudPwdfAR+8rozEXIbF
 r53dDL1CruHAeSP/YbRbruezGnFyqNsbYy+WLn6bK3DR7Bfqghie0k/3L6NuBMXWEw
 Hz8A+jzBzhAlQF/2mgEPVk0hY84uCcrtZUPcw9fMN827GNXbDVsa63hbrJNwW6qoq0
 t+VbRibt19GvDyEW5yCyp513jTOl763F5HAzZpNXVvmHY/JA0M5/lQT0oLZwZCHT2I
 Tbv6le/WYRf4zHyDyUjDX4l9Gr8fi4xhCLKznDTrLLxMTCvG8FdymTemqXNuH9+J6S
 qIwnlAFhgcySA==
Date: Tue, 30 Aug 2022 11:09:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yw5SdK5ItK9P/NUj@google.com>
References: <20220830103625.79034-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830103625.79034-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/30, Chao Yu wrote: > From: Chao Yu <chao.yu@oppo.com>
 > > Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
 > meta inode, node inode or compressed inode, and add f2fs_check_n [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oT5gl-0000SG-QK
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to disallow getting inner inode
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

On 08/30, Chao Yu wrote:
> From: Chao Yu <chao.yu@oppo.com>
> 
> Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
> meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
> in f2fs_iget() to avoid getting inner inode from external interfaces.
> 
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
>  fs/f2fs/compress.c |  2 +-
>  fs/f2fs/f2fs.h     |  1 +
>  fs/f2fs/inode.c    | 10 +++++++++-
>  fs/f2fs/super.c    |  4 ++--
>  4 files changed, 13 insertions(+), 4 deletions(-)
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
> index 6d11c365d7b4..0ab3ae9b2110 100644
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
> @@ -568,6 +568,14 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>  	return ERR_PTR(ret);
>  }
>  
> +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> +{
> +	if (f2fs_check_nid_range(F2FS_SB(sb), ino))
> +		return -EINVAL;

EINVAL or EFSCORRUPTED used in f2fs_check_nid_range?
Do we have a report on this before?

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
