Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7B32DF2B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Mar 2021 02:38:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHzPl-0003nZ-Le; Fri, 05 Mar 2021 01:38:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lHzPk-0003nR-3S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 01:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pm9GuDXk/EwSEdPAW48x1IBFeg8rjrXH3zYuzGL7hIE=; b=HckB8RiRxgEzBzZvMJ0M31J+9D
 F9iVoGrN8H8ftznHOOds7zNAAs3SDGYOgvORnAlBt6Q0/Yn8kNfyV6A+aQYPC/cLp+AI0nOiHxZXc
 ERYV92IByFYr0WoSXi6NB96dQRNYEPLpOAOyw/B0nTZi6gOvA+5mvKIDSDX4dJNS12H0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pm9GuDXk/EwSEdPAW48x1IBFeg8rjrXH3zYuzGL7hIE=; b=WIsCIDnHVEaYcRmhjV3cGElRec
 +gObRbsPpd2n0hz3vplg24NX9Y66K3uWQeTKbOcHxhplNDyInEaUH3g5QctprY/rFERmegD7gaJdW
 6QrjkU6TahISTKKej6EhCarU+ekYkvFbD4cn1iwn4SoQogsSsVZg+wHknm4OCWNHkgn8=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lHzPS-00ETtx-HL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Mar 2021 01:37:59 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ds9LJ4wR4zjVb1;
 Fri,  5 Mar 2021 09:36:08 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 5 Mar 2021
 09:37:27 +0800
To: Eric Biggers <ebiggers@kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210302200420.137977-1-ebiggers@kernel.org>
 <20210302200420.137977-3-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9980e263-aa25-cf50-5a94-9f63a5ae667e@huawei.com>
Date: Fri, 5 Mar 2021 09:37:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210302200420.137977-3-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lHzPS-00ETtx-HL
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix error handling in
 f2fs_end_enable_verity()
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
Cc: linux-fscrypt@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/3 4:04, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs didn't properly clean up if verity failed to be enabled on a file:
> 
> - It left verity metadata (pages past EOF) in the page cache, which
>    would be exposed to userspace if the file was later extended.
> 
> - It didn't truncate the verity metadata at all (either from cache or
>    from disk) if an error occurred while setting the verity bit.
> 
> Fix these bugs by adding a call to truncate_inode_pages() and ensuring
> that we truncate the verity metadata (both from cache and from disk) in
> all error paths.  Also rework the code to cleanly separate the success
> path from the error paths, which makes it much easier to understand.
> 
> Reported-by: Yunlei He <heyunlei@hihonor.com>
> Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>   fs/f2fs/verity.c | 61 ++++++++++++++++++++++++++++++++----------------
>   1 file changed, 41 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 054ec852b5ea4..2db89967fde37 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -160,31 +160,52 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>   	};
>   	int err = 0;
>   
> -	if (desc != NULL) {
> -		/* Succeeded; write the verity descriptor. */
> -		err = pagecache_write(inode, desc, desc_size, desc_pos);
> +	/*
> +	 * If an error already occurred (which fs/verity/ signals by passing
> +	 * desc == NULL), then only clean-up is needed.
> +	 */
> +	if (desc == NULL)
> +		goto cleanup;
>   
> -		/* Write all pages before clearing FI_VERITY_IN_PROGRESS. */
> -		if (!err)
> -			err = filemap_write_and_wait(inode->i_mapping);
> -	}
> +	/* Append the verity descriptor. */
> +	err = pagecache_write(inode, desc, desc_size, desc_pos);
> +	if (err)
> +		goto cleanup;
>   
> -	/* If we failed, truncate anything we wrote past i_size. */
> -	if (desc == NULL || err)
> -		f2fs_truncate(inode);
> +	/*
> +	 * Write all pages (both data and verity metadata).  Note that this must
> +	 * happen before clearing FI_VERITY_IN_PROGRESS; otherwise pages beyond
> +	 * i_size won't be written properly.  For crash consistency, this also
> +	 * must happen before the verity inode flag gets persisted.
> +	 */
> +	err = filemap_write_and_wait(inode->i_mapping);
> +	if (err)
> +		goto cleanup;
> +
> +	/* Set the verity xattr. */
> +	err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
> +			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
> +			    NULL, XATTR_CREATE);
> +	if (err)
> +		goto cleanup;
> +
> +	/* Finally, set the verity inode flag. */
> +	file_set_verity(inode);
> +	f2fs_set_inode_flags(inode);
> +	f2fs_mark_inode_dirty_sync(inode, true);
>   
>   	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
> +	return 0;
>   
> -	if (desc != NULL && !err) {
> -		err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
> -				    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
> -				    NULL, XATTR_CREATE);
> -		if (!err) {
> -			file_set_verity(inode);
> -			f2fs_set_inode_flags(inode);
> -			f2fs_mark_inode_dirty_sync(inode, true);
> -		}
> -	}
> +cleanup:
> +	/*
> +	 * Verity failed to be enabled, so clean up by truncating any verity
> +	 * metadata that was written beyond i_size (both from cache and from
> +	 * disk) and clearing FI_VERITY_IN_PROGRESS.
> +	 */
> +	truncate_inode_pages(inode->i_mapping, inode->i_size);
> +	f2fs_truncate(inode);

Eric,

Truncation can fail due to a lot of reasons, if we fail in f2fs_truncate(),
do we need to at least print a message here? or it allows to keep those
meta/data silently.

One other concern is that how do you think of covering truncate_inode_pages &
f2fs_truncate with F2FS_I(inode)->i_gc_rwsem[WRITE] lock to avoid racing with
GC, so that page cache won't be revalidated after truncate_inode_pages().

Thanks,

> +	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS); >   	return err;
>   }
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
