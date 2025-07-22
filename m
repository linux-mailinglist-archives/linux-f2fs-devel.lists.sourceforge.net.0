Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2CB0D0B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 05:57:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65RhMFjNR9eFTq8KM6sGQJtGz1PgOxL2ZaALQULc4Cc=; b=eBazVQ2jvVeBL07ZW2FqtDoY9x
	3G03OeJHncrSQ6mrmTcn3Pg6wxB9RewQmdu2k2szoVRXJakJmk7Mp9dBO46Xk6N7XRrk676bm+WNH
	JiknwrRwNOTd7PSK/JiP2Y6wZoiPqtKP9iGa0CmT57Dubd2nP3q5jNvVAvcCXmS5ASS4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue47t-000752-ND;
	Tue, 22 Jul 2025 03:57:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue47s-00074t-AB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DqRsW4NufknZql5NDuk7opi2Bbn2KYQtwh78dRMOfyM=; b=IbJstKt8Avu9cki/UPftNCGnej
 KzLtZjj3pDwz/3Jit4qcP5mVA7dd9bHr34mxY/AwGo32DV1uDbYeaWpPDWZuLfUsj9u0uS6anoVwK
 MLldSQwar6wMeDbuV07j+Us8svbe6jwp50I032q0qeFIboARntDR3oKF2fC4Hq9gymhY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DqRsW4NufknZql5NDuk7opi2Bbn2KYQtwh78dRMOfyM=; b=JMBsPucfV9zPEinAFiV2iJ41f7
 58r7GPjhypB2LVlqAs19OIJusItDVEsBR6y7zFWFXTQMi3SQryxoCkUYprGXXuQfoG/jdcDxBs4rU
 waow65qyx9Jp1lOsci+E2FUr32QEQcTP/OxyrV3aIZ6L1W6WSorIfazVz6OU2e9m4kRw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue47r-0006W9-Te for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89AFA5C59C4;
 Tue, 22 Jul 2025 03:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22311C4CEF1;
 Tue, 22 Jul 2025 03:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753156621;
 bh=XXjqNY4eX+gG1Wzkx5jVH3Efas2zIJQsL2cm0SrIWoE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cnj+56xrEBRSztP9GL6FBsnCb5g6Xx1IiRoJ+hZ3jkgukMmu5PmqNIUit3OBx1O++
 f76Czu2wQO7yAuRtgd75/OuwDl3Jaovpxj1QwlyBHxC1PUkIVsxuUBcPp/hsENFfMn
 XYkiLYJNzm3Tx3uomVDpam+NfDn6++wzqDBvoAAnKbvAAZjjCgRnmBW/Jff1QfxZ4O
 o8icbBLRjppB/3mqPBNbl5Y4rpUO1RwfYGzt2IKBd+CN5TxMAm3xXfDESCKP1H7fjJ
 YMwNV4R/iOPqB3nR7UrxJRKAjeN4I53V2cMwdVw8X1yfeJBOyAoa59sR5Rz4motcNJ
 akvTrLliNRd6w==
Message-ID: <fed85e52-2965-41d0-9e73-8f2e15dbef06@kernel.org>
Date: Tue, 22 Jul 2025 11:56:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250721054135.1919-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250721054135.1919-1-yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/21/25 13:41, yohan.joung wrote: > pinfile is excluded
 as it operates with direct I/O pinfile can use buffer IO as well? Thanks,
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
X-Headers-End: 1ue47r-0006W9-Te
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: wait for inflight dio completion,
 excluding pinned files
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

On 7/21/25 13:41, yohan.joung wrote:
> pinfile is excluded as it operates with direct I/O

pinfile can use buffer IO as well?

Thanks,

> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4039ccb5022c..cac8c9650a7a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4844,7 +4844,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  
>  	/* In LFS mode, if there is inflight dio, wait for its completion */
>  	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
> -	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
> +	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
> +		!f2fs_is_pinned_file(inode))
>  		inode_dio_wait(inode);
>  
>  	if (f2fs_should_use_dio(inode, iocb, to)) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
