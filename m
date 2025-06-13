Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595AAD7FAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 02:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BizL0+AU+rtQNk5B6HJRKU3jVAQAvbovWMYT22hqENc=; b=b4uHJqqWPFykPEyJS3+d+1Y5Ux
	RVherdB2xGu8IwNCETFTlv2vAWkAWOHa6JFCFsgPVI0DBo9HomjvNthumQ2ydJhynFpVqjxg2yVLr
	IjrjRn1hKNFHKJaQfeZbutAGqo1vVWIcx0dlJTbtdDZ7RFvfygUBpm2aBBsY/VrHQ9lg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPsUK-0004Fw-94;
	Fri, 13 Jun 2025 00:41:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPsUJ-0004Fq-AT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 00:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ONdj2QFfHp95yApIQjwkWiYX65SXhzcpSi3kq7VI/7w=; b=RUAcWL6Ksn7LYzA9X4tEYHFkWu
 tFmczKTI/3hXlSSi3T7eppG6P1/ppFUnekLsGCUkWVwYqiQtARtYIBq7wtZ2Y0d8XHoaFPNEQ9VDF
 79EdHbqQOFocAQdFjxgg2U34C8AEonerie8fFmW/kfC+36DzhRef5ba1SHGl2LKBkqXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ONdj2QFfHp95yApIQjwkWiYX65SXhzcpSi3kq7VI/7w=; b=A875BxKLBSHqX/2IbzGral/BFA
 Pi9VMP3vEUeL2OsdX6KOJTxESrBpXcPeUUkOvk3qZ2rnH8pjqQ+zGwMqU8c0MnvqAMFJnwh2gukYa
 YOAr5BSYeWHdNUG7exYPaRpb1tu7jkDSuvLU/o5b/G14LC3ZuOtoxUCYAWxWdObgo5qY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPsUI-0004HN-Mw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 00:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6CE9629D1;
 Fri, 13 Jun 2025 00:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FB7C4CEEA;
 Fri, 13 Jun 2025 00:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749775291;
 bh=h0dTag/f2Tf1Jb1EmZHoJhgiudzt8TPEN9QKw1XND5c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=A6SqmxmYNzHDsNm47GY+Y9MGSWa4MKctOiMLbemix20NShU7NFsq9d4koWGl74TFN
 9saNIwJVBVnYtNKIXIJQ/aq1Z7FvvxEOYO5lJMqGRIdGznOrVFxaAnxt4J0cBDElFJ
 kFIHt7O14TzxxoBRtrCqyt79Eiiky6aW1Ksq9bCk0XpxOWnnvQcjlrO6+rm1V+lziM
 hcKmBTEE2zmYsl3jQFLi+bsbbgAThi7tN/kwNBdwgL9H5ujWsznM4osnfmc05rcedp
 uU6BpRKpNO80bWpVbWhWGbeC83RPTAquTiFoexkvOD5oPNIcTIL0OkKE9CpbtGp1bC
 I6nM+c7ERz1vg==
Message-ID: <376f506f-becd-457a-8cad-294396acd1da@kernel.org>
Date: Fri, 13 Jun 2025 08:41:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250611233706.572784-1-chullee@google.com>
 <20250611233706.572784-2-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250611233706.572784-2-chullee@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/12 7:37,
 Daniel Lee wrote: > Bio flags like REQ_PRIO, 
 REQ_META, and REQ_FUA, determined by > f2fs_io_flags(), were not being applied
 to direct I/O (DIO) writes. > This meant that DIO writes [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPsUI-0004HN-Mw
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Apply bio flags to direct I/O
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/12 7:37, Daniel Lee wrote:
> Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined by
> f2fs_io_flags(), were not being applied to direct I/O (DIO) writes.
> This meant that DIO writes would not respect filesystem-level hints
> (for REQ_META/FUA) or inode-level hints (like F2FS_IOPRIO_WRITE).
> 
> This patch refactors f2fs_io_flags() to use a direct inode pointer
> instead of deriving it from a page. The function is then called from
> the DIO write path, ensuring that bio flags are handled consistently
> for both buffered and DIO writes.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>   fs/f2fs/data.c |  8 ++++----
>   fs/f2fs/f2fs.h |  2 ++
>   fs/f2fs/file.c | 12 ++++++++++++
>   3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..966cea75874c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>   	return 0;
>   }
>   
> -static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>   {
>   	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> -	struct folio *fio_folio = page_folio(fio->page);
>   	unsigned int fua_flag, meta_flag, io_flag;
>   	blk_opf_t op_flags = 0;
>   
> @@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>   	if (BIT(fio->temp) & fua_flag)
>   		op_flags |= REQ_FUA;
>   
> -	if (fio->type == DATA &&
> -	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> +	if (fio->inode && fio->type == DATA &&

It seems that it changes the logic, if fio->inode is NULL we will not tag
op_flags w/ REQ_PRIO, path like GC? do we need to assign fio.inode for all
paths?

Thanks,

> +	    F2FS_I(fio->inode)->ioprio_hint == F2FS_IOPRIO_WRITE)
>   		op_flags |= REQ_PRIO;
>   
>   	return op_flags;
> @@ -2783,6 +2782,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>   	int err = 0;
>   	struct f2fs_io_info fio = {
>   		.sbi = sbi,
> +		.inode = inode,
>   		.ino = inode->i_ino,
>   		.type = DATA,
>   		.op = REQ_OP_WRITE,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..162d79a3c1a5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1233,6 +1233,7 @@ enum iostat_type {
>   
>   struct f2fs_io_info {
>   	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
> +	struct inode *inode;
>   	nid_t ino;		/* inode number */
>   	enum page_type type;	/* contains DATA/NODE/META/META_FLUSH */
>   	enum temp_type temp;	/* contains HOT/WARM/COLD */
> @@ -3972,6 +3973,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
>   struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
>   		block_t blk_addr, sector_t *sector);
>   int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
> +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio);
>   void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>   void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>   int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..4fd45e94661a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5015,6 +5015,18 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>   	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
>   	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
>   
> +	/* if fadvise set to hot, override the temperature */
> +	struct f2fs_io_info fio = {
> +		.sbi = sbi,
> +		.inode = inode,
> +		.type = DATA,
> +		.op = REQ_OP_WRITE,
> +		.temp = file_is_hot(inode) ? HOT : temp,
> +		.op_flags = bio->bi_opf,
> +		.page = NULL,
> +	};
> +	bio->bi_opf |= f2fs_io_flags(&fio);
> +
>   	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>   	submit_bio(bio);
>   }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
