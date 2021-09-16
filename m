Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E96640D66D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 11:42:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQnuE-0007z1-U7; Thu, 16 Sep 2021 09:42:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mQnuC-0007yo-PN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 09:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OLtoXOHXKre0fp3CwyVjSyVEc2GFjGwqbu03K0Uq+a8=; b=EPfKFmyz7ElEYzS+fe765UlRwv
 8oZTqWkU5qcVZlt5B+gX4vNE2gDiI9i5VQVrWzndir2YsyCP49/4V9URQIVCAPwPo+MfSRL0qGKbU
 v+e1TND9E2uY3lQ6eILKw2vW6udu6h73oIDpW8KCzeJ5dE3v984/7J2BCvnzD1+JzYdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OLtoXOHXKre0fp3CwyVjSyVEc2GFjGwqbu03K0Uq+a8=; b=gQ9jgfNDH4rR8BrRHfm+GywJjD
 gqZK+xRFpAUFPBZqekDvgquyvy9v7dK26EKa0Q1GSCd3NGjoVs+vtl/jVRirA/ltu/mQ00KL75HCP
 w4x1fwVX3GHNZiQFEZTSVwo/aNilJtjBMgiH1aZglxNnoCBnyLqi7f0crGpLEFaIaPsA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQnu7-00Cayp-HC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 09:42:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53CEC60EB2;
 Thu, 16 Sep 2021 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631785318;
 bh=85dA2XyjoY542QEmjgXn4UFfziCeIubbSdkj/bi8v5E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mVuWXwRCAjg64D5w94FYhtprYgk8y+oVi1NAg6/ZrvxCyl5Es6WgS6Scjud2FP5Xf
 0aipPJW38/GwWtb2Z/5BJ5NMsyWqOnShgGrTGO/NwYjFzic5WE0AJVjdXf1sLiPTI1
 eKVVDED/GWmyXgp7q52UWcsFwM7ZJBbFbOfPJpGgIuJ8HzfVW2BMXZAONQ6zoK+3QZ
 Kh/s4GbByc3Ma0DieS36S76K61WJGd1RlrIZxd/d1TBCFgIqrdkc8Mr88V5gGFqKwe
 hJbl/Z5Eum+2xfgnkVM8uj07Gq0MPH48lTg/0JR1It7JI3cbX1nxpBAgjKr/W13Wzp
 h1KPC9ZSnP7CA==
To: Fengnan Chang <fengnanchang@gmail.com>, jaegeuk@kernel.org
References: <20210912015058.14063-1-fengnanchang@gmail.com>
 <20210912015058.14063-2-fengnanchang@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <65c81c0c-1799-9154-b588-ff34c427defa@kernel.org>
Date: Thu, 16 Sep 2021 17:41:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912015058.14063-2-fengnanchang@gmail.com>
Content-Language: en-US
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/12 9:50, Fengnan Chang wrote: > From: Fengnan Chang
 <changfengnan@vivo.com> > > For now, overwrite file with direct io use inplace
 policy, but > not counted, fix it. > > Signed-off-by: Fengn [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mQnu7-00Cayp-HC
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/12 9:50, Fengnan Chang wrote:
> From: Fengnan Chang <changfengnan@vivo.com>
> 
> For now, overwrite file with direct io use inplace policy, but
> not counted, fix it.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c | 7 ++++++-
>   fs/f2fs/f2fs.h | 7 +++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c1490b9a1345..b5d488c9f9f9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1491,6 +1491,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>   		if (flag == F2FS_GET_BLOCK_DIO)
>   			f2fs_wait_on_block_writeback_range(inode,
>   						map->m_pblk, map->m_len);
> +		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> +				map->m_may_create)
> +			stat_add_inplace_blocks(sbi, map->m_len, true);
>   		goto out;
>   	}
>   
> @@ -1553,7 +1556,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>   				goto sync_out;
>   			blkaddr = dn.data_blkaddr;
>   			set_inode_flag(inode, FI_APPEND_WRITE);
> -		}
> +		} else if (!create && !f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> +				map->m_may_create)
> +			stat_inc_inplace_blocks(sbi, true);

So, it's better to use stat_add_inplace_blocks(sbi, 1, ) instead of
stat_inc_inplace_blocks(sb, )?

Thanks,

>   	} else {
>   		if (create) {
>   			if (unlikely(f2fs_cp_error(sbi))) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3d4ee444db27..49230115d241 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3792,6 +3792,13 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   		else								\
>   			(atomic_inc(&(sbi)->inplace_count[1]));		\
>   	} while (0)
> +#define stat_add_inplace_blocks(sbi, count, direct_io)			\
> +	do {								\
> +		if (direct_io)						\
> +			(atomic_add(count, &(sbi)->inplace_count[0]));  \
> +		else								\
> +			(atomic_add(count, &(sbi)->inplace_count[1]));	\
> +	} while (0)
>   #define stat_update_max_atomic_write(inode)				\
>   	do {								\
>   		int cur = F2FS_I_SB(inode)->atomic_files;	\
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
