Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4F5F46D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 17:41:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofk37-0000e9-Tk;
	Tue, 04 Oct 2022 15:41:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ofk37-0000e3-6P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 15:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D1EH0PgLmXsOPSptNHFJPYWzn2cKC/orclIk+F+N8cc=; b=W9eCus+NYfY4otrS1hGJFpZgOM
 b3o1JMaKCekbm52PgkDD5MrPnUXSHW/JTT+K2eioP95gWQ8CeKKH5mxtWmMLCM7gjCGlg2+ldP0pi
 45TzVPhTbLPC/nLbqttXoOU1DJRPMEZNF0u6Mde7b/UudXVgwj5FjGD2eT8FaibEK+dE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D1EH0PgLmXsOPSptNHFJPYWzn2cKC/orclIk+F+N8cc=; b=BJEyKFOhGbwsj2U2OzhmzAlvSh
 sIfDVKW/cLOe1nJ2XYnp/2jYgmy41J8vuOudDXrp/IeZozkwJ3pez3VJRG115b1cyHyQRHcecSAG2
 ZewDsHhnuaiJUmTMUpEQa+/Wt6m9gWG3nhm63XmS9Nja9RUnT6emZgUiRyIKW5yBrWRY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofk3H-0002Ps-Dn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 15:41:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C41361494;
 Tue,  4 Oct 2022 15:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAEEC433C1;
 Tue,  4 Oct 2022 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664898096;
 bh=P44hUj+idhBMNAf0TO7tFSAmItXg2jgFuF6nRwWxmcc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NmVUwlO/fVwXuMR8Oa+BndDftDN/VMXqwwOcWpMRJfTkWPVMAIQqvKP+2Y/KEh+wr
 T8BOIXwC+B8yVwepGgjB4ehExsV7Xxwu/Xc7ra7KBjomG9S8VSsFD6nTim5rW8BjW2
 D/AI1y+74XPvY+s5zrag92Jj9qKo0XksGWmDZT+SmD0a7bPpd7ru1oHyIwgDm7D6z/
 Ilvm+edfvoxMzgcJYo7mgLLn4Iq4P2rMZnJcqz6c+pAdMcdQHA6SZ6A13WZ1L3bmNd
 6DmdconVHl26K/d8ZnwQe8kR2py42CS0LSiGkWjfE6F5TRzF4gEEJV7hyy/N5ShJ5N
 GX9Ue5Clf1xEA==
Message-ID: <85cc583c-279c-2d65-4cfd-ebd54468c6f5@kernel.org>
Date: Tue, 4 Oct 2022 23:41:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20221004001050.3269377-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221004001050.3269377-1-daeho43@gmail.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/4 8:10, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We need to make sure i_size doesn't change until
 atomic write commit is > successful and restore it when commit is [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ofk3H-0002Ps-Dn
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: correct i_size change for
 atomic writes
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/4 8:10, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We need to make sure i_size doesn't change until atomic write commit is
> successful and restore it when commit is failed.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v3: make sure inode is clean while atomic writing
> ---
>   fs/f2fs/f2fs.h    |  1 +
>   fs/f2fs/file.c    | 18 +++++++++++-------
>   fs/f2fs/inode.c   |  3 +++
>   fs/f2fs/segment.c |  4 +++-
>   4 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index dee7b67a17a6..539da7f12cfc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -821,6 +821,7 @@ struct f2fs_inode_info {
>   	unsigned int i_cluster_size;		/* cluster size */
>   
>   	unsigned int atomic_write_cnt;
> +	loff_t original_i_size;		/* original i_size before atomic write */
>   };
>   
>   static inline void get_extent_info(struct extent_info *ext,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5efe0e4a725a..ce2336d2f688 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1989,6 +1989,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct inode *pinode;
> +	loff_t isize;
>   	int ret;
>   
>   	if (!inode_owner_or_capable(mnt_userns, inode))
> @@ -2047,7 +2048,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>   		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>   		goto out;
>   	}
> -	f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
> +
> +	f2fs_write_inode(inode, NULL);
> +
> +	isize = i_size_read(inode);
> +	fi->original_i_size = isize;
> +	f2fs_i_size_write(fi->cow_inode, isize);
>   
>   	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
>   	sbi->atomic_files++;
> @@ -2087,16 +2093,14 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
>   
>   	if (f2fs_is_atomic_file(inode)) {
>   		ret = f2fs_commit_atomic_write(inode);
> -		if (ret)
> -			goto unlock_out;
> -
> -		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
>   		if (!ret)
> -			f2fs_abort_atomic_write(inode, false);
> +			ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
> +
> +		f2fs_abort_atomic_write(inode, ret);
>   	} else {
>   		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
>   	}
> -unlock_out:
> +
>   	inode_unlock(inode);
>   	mnt_drop_write_file(filp);
>   	return ret;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index cde0a3dc80c3..64d7772b4cd9 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -30,6 +30,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
>   	if (f2fs_inode_dirtied(inode, sync))
>   		return;
>   
> +	if (f2fs_is_atomic_file(inode))
> +		return;
> +
>   	mark_inode_dirty_sync(inode);
>   }
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 460048f3c850..143b7ea0fb8e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -193,8 +193,10 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>   	if (!f2fs_is_atomic_file(inode))
>   		return;
>   
> -	if (clean)
> +	if (clean) {
>   		truncate_inode_pages_final(inode->i_mapping);
> +		f2fs_i_size_write(inode, fi->original_i_size);

inode has atomic_write flag, it can not be set dirtied here, how
about writing i_size ater clear_inode_flag(inode, FI_ATOMIC_FILE)?

Thanks,

> +	}
>   	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>   	iput(fi->cow_inode);
>   	fi->cow_inode = NULL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
