Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F63B0D174
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 07:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJhdmx4ThKxbKrnewJWo2kZQ71F0A94vJcUTs85OTmk=; b=HvkHHeQBw0fSZX1eP8xE0GwlzI
	CiftTRoPUXyygY5Qmg6MzqhqKGnSA6hQsgQmIooEXrTpP+xGL3iwOSs66SBIJsdQWjZQFurbFuM1g
	EheSn6FusOX6tQiSujpKFS6LJWXNO6nhAOOSbdGEvOA4s/ZzYB1/a5BRzJ2lizMyFKMs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue5v2-0003Te-Mh;
	Tue, 22 Jul 2025 05:52:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue5v1-0003TW-KJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 05:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZHA5kBMI2csyFXuPRXQmEcNqDGl6+pJLZDX0iwHy0g=; b=JrDKeoCEZL93LN12/GQvoaGCfH
 oTrIh1HrWapNDlNNcfwQe2frDUVwKPrdvTWZmvT9BCmH2HmlgtGvnfgwG1rhfRm9XwQwLQLI7t4wN
 MXHxvOnpMZFfBxO9V1P7Yq2LkT0pv99NFTZeoF3wOeXM86ngbTO6apNKrzcpc9F/n0IE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sZHA5kBMI2csyFXuPRXQmEcNqDGl6+pJLZDX0iwHy0g=; b=BBX90C2TYd61OgcjZq9mcK10TM
 20Y0HT2HNuQhvPex8ViupSJUdDIU30pJ4/lQl0VZIhItDeZBJZl0Tm+EGhS7OnaUR4nM+Z051TxiP
 cCk/GQ3WX5j3ERvDmLHO63ZQBA8DBMdS9thuvllIjYddB1MkXD30VDtk0nZ0tA//IYag=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue5v1-00033J-8l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 05:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E56F54194A;
 Tue, 22 Jul 2025 05:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9042AC4CEEB;
 Tue, 22 Jul 2025 05:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753163517;
 bh=ZBaWQtduHodYlO4mYxwXFmcc2F7X42TbHmgOgciFSwQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AtcuZvEZk8YTs501SYNkZ+WHbd5Lvv9JzypLnMdXxJ8qnBU6FSnFPUPTzqUuWvl9e
 xYboZowGVJ4x6qWyjFgROCPdcx0yKMMFGZtvjxVutgnENxkjSx68VujWwHcTnB8TIP
 o3TrCjjfGaYGZPW/1664YBS3N1feVG1vR9DJgco4bVPK6uaeS4/arr0teFHA7E1ybX
 39MtwFBb5CRbBlidpJm0jCvmZSTa0mt6UrxC2YuiPBlq74sAZ/oCffe2qDMISz4N/Z
 IlCcgt1P3ruU8G5lyy1xqbkYtEpo7+wnpN4duCI4bE9FnX7DyUxnO9WI82FPve3Uiy
 kFNZa19Vb29aw==
Message-ID: <33e75ec8-9bf4-4c45-b706-a2e6b6cd8413@kernel.org>
Date: Tue, 22 Jul 2025 13:51:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250722052046.1445-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250722052046.1445-1-yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/22/25 13:20, yohan.joung wrote: > read for the pinfile
 using Direct I/O do not wait for dio write. > > Signed-off-by: yohan.joung
 <yohan.joung@sk.com> > --- > fs/f2fs/file.c | 8 ++++++-- > 1 file [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ue5v1-00033J-8l
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: zone: wait for inflight dio
 completion, excluding pinned files read using dio
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/22/25 13:20, yohan.joung wrote:
> read for the pinfile using Direct I/O do not wait for dio write.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/file.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4039ccb5022c..2b7e5c46c1ae 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4834,6 +4834,7 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	struct inode *inode = file_inode(iocb->ki_filp);
>  	const loff_t pos = iocb->ki_pos;
>  	ssize_t ret;
> +	bool dio;
>  
>  	if (!f2fs_is_compress_backend_ready(inode))
>  		return -EOPNOTSUPP;
> @@ -4842,12 +4843,15 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
>  					iov_iter_count(to), READ);
>  
> +	dio = f2fs_should_use_dio(inode, iocb, to);
> +
>  	/* In LFS mode, if there is inflight dio, wait for its completion */
>  	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
> -	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
> +	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
> +		!(f2fs_is_pinned_file(inode) && dio))

How about?

(!f2fs_is_pinned_file(inode) || !dio)

Thanks,

>  		inode_dio_wait(inode);
>  
> -	if (f2fs_should_use_dio(inode, iocb, to)) {
> +	if (dio) {
>  		ret = f2fs_dio_read_iter(iocb, to);
>  	} else {
>  		ret = filemap_read(iocb, to, 0);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
