Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A6B9A17F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Oct 2024 03:41:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1FVc-0005yZ-CP;
	Thu, 17 Oct 2024 01:41:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t1FVa-0005yM-Qn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 01:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rdixPcA4LkTFWOLydnN0afWyQWy0VkG4XqSVVMMrkQc=; b=ORMCqRDKgCne/latRXsz+8FfHy
 mb//SxdrgSzNFv4C+dRsw8tUAmfsoRYR/lvZtuz+V0xL9wtq1s6UKqulL/IBav/ELvN7DBf67MoWi
 SfAAA/YFJ96tAHInKUZodJftbjX80gkS6+oog/Dmk3KYJUJukUKOEz2HYDM2ez5//wMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rdixPcA4LkTFWOLydnN0afWyQWy0VkG4XqSVVMMrkQc=; b=nJuMJwaaf8yad94f+Uv0eiTfLO
 ov+v8OerjKj+BHzHKnTSX6i7YW4pghXVjz263wwfNsmPteSy6Oqtd3QiGla85lh87ufNIthlIT13H
 QYB5ySXCWKlUcZV0mNCJrHa5pSyqB+lxNCuyk2fFw7xQ6pkPUNPl0b03OIRyZlTzHZJo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1FVZ-0002N4-OD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 01:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 11FC8A40A40;
 Thu, 17 Oct 2024 01:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B252CC4CEC5;
 Thu, 17 Oct 2024 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729129246;
 bh=QBXcG8AaOaKQI4kAu38K3G1Kq1jpuYIb4ZPbCp3Xfws=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cEhqY/L1ESt4MqVjweqmgPElvjAIA5ZuHQ1fUbg7XoX2XIo9P/dstqqqCfiOzyj0s
 EgiDOkqWCSQvrc1LWkNTPzS/Y/5u9q/YHhqpDfQvtifxf4EpgnihTg1INqau4AzuZU
 T+On3+2YVkmn6k2/cRNQUqVd2v1lJdwsoWRObabKNb6k72eTBvu46NITWtgO1ku/ha
 NiTC2Pbh/qKTuJKnfMb+EdsNi7X6TCS5iA1r4OymcXfmt8ewf6flcDlKtX1jl3kXQ/
 wYadhlFofB/xXFfSrgvFe756ZfoFnf2jlMmooAXTXoD1vRMSaGFQlOq86rIt8E/6df
 BWQeMArdSvGqQ==
Message-ID: <52de7b11-e118-433d-b187-0642e81428ef@kernel.org>
Date: Thu, 17 Oct 2024 09:40:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Sun <yi.sun@unisoc.com>
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
 <20241016052758.3400359-3-yi.sun@unisoc.com>
Content-Language: en-US
In-Reply-To: <20241016052758.3400359-3-yi.sun@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/16 13:27, Yi Sun wrote: > When doing truncate,
 consecutive blocks in the same segment > can be processed at the same time.
 So that the efficiency of > doing truncate can be improved. > > Ad [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1FVZ-0002N4-OD
Subject: Re: [f2fs-dev] [RFC PATCH 2/2] f2fs: introduce
 f2fs_invalidate_consecutive_blocks()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 jaegeuk@kernel.org, hao_hao.wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/16 13:27, Yi Sun wrote:
> When doing truncate, consecutive blocks in the same segment
> can be processed at the same time. So that the efficiency of
> doing truncate can be improved.
> 
> Add f2fs_invalidate_compress_pages_range() only for doing truncate.
> Add check_f2fs_invalidate_consecutive_blocks() only for doing
> truncate and to determine whether the blocks are continuous and
> belong to the same segment.
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>
> ---
>   fs/f2fs/compress.c | 14 ++++++++++++++
>   fs/f2fs/f2fs.h     |  5 +++++
>   fs/f2fs/file.c     | 34 +++++++++++++++++++++++++++++++++-
>   fs/f2fs/segment.c  | 25 +++++++++++++++++++++++++
>   4 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7f26440e8595..70929a87e9bf 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -2014,6 +2014,20 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
>   	} while (index < end);
>   }
>   
> +void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> +					block_t blkaddr, int cnt)
> +{
> +	if (!sbi->compress_inode)
> +		return;
> +
> +	if (cnt < 1) {
> +		f2fs_bug_on(sbi, 1);
> +		cnt = 1;
> +	}
> +
> +	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr + cnt - 1);
> +}
> +
>   int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
>   {
>   	struct inode *inode;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ce00cb546f4a..99767f35678f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3716,6 +3716,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
>   int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
>   void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
> +void f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi, block_t addr, int cnt);
>   bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
>   int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
>   void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
> @@ -4375,6 +4376,8 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>   bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>   								block_t blkaddr);
>   void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
> +void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> +					block_t blkaddr, int cnt);
>   #define inc_compr_inode_stat(inode)					\
>   	do {								\
>   		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
> @@ -4432,6 +4435,8 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
>   				struct page *page, block_t blkaddr) { return false; }
>   static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
>   							nid_t ino) { }
> +static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> +						block_t blkaddr, int cnt) { }
>   #define inc_compr_inode_stat(inode)		do { } while (0)
>   static inline int f2fs_is_compressed_cluster(
>   				struct inode *inode,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7057efa8ec17..634691e3b5f1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -612,6 +612,18 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>   	return finish_preallocate_blocks(inode);
>   }
>   
> +static bool check_f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi,
> +					block_t blkaddr1, block_t blkaddr2)
> +{
> +	if (blkaddr2 - blkaddr1 != 1)
> +		return false;
> +
> +	if (GET_SEGNO(sbi, blkaddr1) != GET_SEGNO(sbi, blkaddr2))
> +		return false;
> +
> +	return true;
> +}
> +
>   void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> @@ -621,6 +633,9 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   	int cluster_index = 0, valid_blocks = 0;
>   	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>   	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
> +	block_t con_start;
> +	bool run_invalid = true;
> +	int con_cnt = 1;
>   
>   	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
>   
> @@ -652,7 +667,24 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>   				valid_blocks++;
>   		}
>   
> -		f2fs_invalidate_blocks(sbi, blkaddr);
> +		if (run_invalid)
> +			con_start = blkaddr;
> +
> +		if (count > 1 &&
> +			check_f2fs_invalidate_consecutive_blocks(sbi, blkaddr,
> +				le32_to_cpu(*(addr + 1)))) {
> +			run_invalid = false;
> +
> +			if (con_cnt++ == 1)
> +				con_start = blkaddr;
> +		} else {
> +			run_invalid = true;
> +		}
> +
> +		if (run_invalid) {
> +			f2fs_invalidate_consecutive_blocks(sbi, con_start, con_cnt);
> +			con_cnt = 1;
> +		}
>   
>   		if (!released || blkaddr != COMPRESS_ADDR)
>   			nr_free++;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index f118faf36d35..edb8a78985ba 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2570,6 +2570,31 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
>   	up_write(&sit_i->sentry_lock);
>   }
>   
> +void f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi, block_t addr, int cnt)
> +{
> +	unsigned int segno = GET_SEGNO(sbi, addr);
> +	unsigned int segno2 = GET_SEGNO(sbi, addr + cnt - 1);
> +	struct sit_info *sit_i = SIT_I(sbi);
> +
> +	f2fs_bug_on(sbi, addr == NULL_ADDR || segno != segno2);
> +	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
> +		return;
> +
> +	f2fs_truncate_meta_inode_pages(sbi, addr, cnt);
> +	f2fs_invalidate_compress_pages_range(sbi, addr, cnt);
> +
> +	/* add it into sit main buffer */
> +	down_write(&sit_i->sentry_lock);
> +
> +	update_segment_mtime(sbi, addr, 0);
> +	update_sit_entry(sbi, addr, -cnt);
> +
> +	/* add it into dirty seglist */
> +	locate_dirty_segment(sbi, segno);
> +
> +	up_write(&sit_i->sentry_lock);

I think it needs to clean up this patchset, what about expanding
f2fs_invalidate_blocks() to support invalidating block address extent?

Something like this:

void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t blkaddr,
						unsigned int len)
{
	struct sit_info *sit_i = SIT_I(sbi);
	int i;

	/* TODO: do sanity check on blkaddr extent */

	down_write(&sit_i->sentry_lock);

	/* TODO: expand f2fs_invalidate_internal_cache() to invalidate blkaddr extent */
	f2fs_invalidate_internal_cache(sbi, blkaddr, len);

	for (i = 0; i < len; i++) {
		update_segment_mtime(sbi, blkaddr, 0);
		update_sit_entry(sbi, blkaddr, -1);

		/* add it into dirty seglist */
		locate_dirty_segment(sbi, GET_SEGNO(sbi, blkaddr));
	}

	up_write(&sit_i->sentry_lock);
}

Thanks,

> +}
> +
>   bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
>   {
>   	struct sit_info *sit_i = SIT_I(sbi);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
