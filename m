Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB3952BB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2024 12:13:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seXTS-0008Km-JT;
	Thu, 15 Aug 2024 10:12:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seXTR-0008Kd-7y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 10:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BihJTPtqP2SFhTm/yGFSb21PbM1/doR7l/ZrHAbq6k8=; b=UA2k9SiX6Gm2JhVgRlcDHrIZoR
 ZCNXJqJtUzFE7AJMzhvWz6+FyXvrOI7vJxqwWFEzM1jmbWJA+H9eki95dn58kbEFfFWCH3DVzr89F
 wvFrV+1mj5woPUfsOYPtF0DGN2K+p4JgYFK2/l5DifPAhSdcIytUQrPs9ysZYtSkG2qA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BihJTPtqP2SFhTm/yGFSb21PbM1/doR7l/ZrHAbq6k8=; b=Qvu/jcEoz2OhH0JEbFKugEZHIq
 g4oBrgCDlNCGI0DxzUcLe6jOsY+8pLD+uLbKaDqCjtbo6Df+4w21OeqBYmyv5LendyEUN02QRdp51
 SnTzN9J6iWDWDud0nj5Xa4FcimQzfsJYbg2+iEGK5yhFX9r+IhjR/swJgejP32VbkNnw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seXTP-0006Oe-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Aug 2024 10:12:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F58661DA5;
 Thu, 15 Aug 2024 10:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6830AC32786;
 Thu, 15 Aug 2024 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723716766;
 bh=szI6GiNI6wD3w8Kk9EYmdy5gcQs6K0KSnyYmtTGRPZw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qKbQ6JxvK/RC/9bhrdtZLAclqZVM0O21sq1Wot9M6zfUt3BI9TI+uMr8VtRhPshYz
 vbfC+YJLOdgB4F4i/aMf7IeU4cZdCOCpQeqs76tkHp65ZVS8Lkkw/SuuRQCnXnG9U/
 5R7T2dcv12o/BCx7HAkftyyZc/mvjWGSttFKpWXA3972qoWpZiZkK8MZIEQSVqFr4y
 QOUw/zjVCr8XqVGvEG3L6jxt84Jc41Ixh7/9pRwJGdWZ46qAQG6OHsAoA1HSm9c+WB
 03RX//s7+mtAQZhbOsdfJZ//SF8wfDf76xVXkcratzYrdIY/N39ZLWHKHamD1Mhbdu
 Qqe4nu1KPa4Kw==
Message-ID: <8dbdca2c-0ef9-4e93-87ca-db275675017f@kernel.org>
Date: Thu, 15 Aug 2024 18:12:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yeongjin Gil <youngjin.gil@samsung.com>, jaegeuk@kernel.org
References: <CGME20240813061105epcas1p4898159104ce2ee12ef6c203c4ab828ff@epcas1p4.samsung.com>
 <20240813061104.1052-1-youngjin.gil@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240813061104.1052-1-youngjin.gil@samsung.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/13 14:11,
 Yeongjin Gil wrote: > In f2fs_do_write_data_page, 
 when the data block is NULL_ADDR, it skips > writepage considering that it
 has been already truncated. > This results in an infini [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seXTP-0006Oe-Lf
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't redirty sparse cluster
 during {, de}compress
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Jaewook Kim <jw5454.kim@samsung.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/13 14:11, Yeongjin Gil wrote:
> In f2fs_do_write_data_page, when the data block is NULL_ADDR, it skips
> writepage considering that it has been already truncated.
> This results in an infinite loop as the PAGECACHE_TAG_TOWRITE tag is not
> cleared during the writeback process for a compressed file including
> NULL_ADDR in compress_mode=user.
> 
> This is the reproduction process:
> 
> 1. dd if=/dev/zero bs=4096 count=1024 seek=1024 of=testfile
> 2. f2fs_io compress testfile
> 3. dd if=/dev/zero bs=4096 count=1 conv=notrunc of=testfile
> 4. f2fs_io decompress testfile

Good catch!

> 
> To prevent the problem, let's check whether the cluster is fully
> allocated before redirty its pages.
> 
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Tested-by: Jaewook Kim <jw5454.kim@samsung.com>
> Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>

Need a fixes line?

> ---
>   fs/f2fs/compress.c | 34 ++++++++++++++++++++++++++--------
>   fs/f2fs/f2fs.h     | 12 ++++++++++++
>   fs/f2fs/file.c     | 39 +++++++++++++++++++++------------------
>   3 files changed, 59 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 990b93689b46..09b91d725807 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -945,7 +945,7 @@ static int __f2fs_get_cluster_blocks(struct inode *inode,
>   	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
>   	int count, i;
>   
> -	for (i = 1, count = 1; i < cluster_size; i++) {
> +	for (i = 0, count = 0; i < cluster_size; i++) {
>   		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
>   							dn->ofs_in_node + i);
>   
> @@ -956,8 +956,8 @@ static int __f2fs_get_cluster_blocks(struct inode *inode,
>   	return count;
>   }
>   
> -static int __f2fs_cluster_blocks(struct inode *inode,
> -				unsigned int cluster_idx, bool compr_blks)
> +static int __f2fs_cluster_blocks(struct inode *inode, unsigned int cluster_idx,
> +				enum cluster_check_type type)
>   {
>   	struct dnode_of_data dn;
>   	unsigned int start_idx = cluster_idx <<
> @@ -978,10 +978,12 @@ static int __f2fs_cluster_blocks(struct inode *inode,
>   	}
>   
>   	if (dn.data_blkaddr == COMPRESS_ADDR) {
> -		if (compr_blks)
> -			ret = __f2fs_get_cluster_blocks(inode, &dn);
> -		else
> +		if (type == COMPR_BLKS)
> +			ret = 1 + __f2fs_get_cluster_blocks(inode, &dn);
> +		else if (type == COMPR_CLUSTER)
>   			ret = 1;
> +	} else if (type == DECOMPR_BLKS) {
> +		ret = __f2fs_get_cluster_blocks(inode, &dn);
>   	}
>   fail:
>   	f2fs_put_dnode(&dn);
> @@ -991,7 +993,14 @@ static int __f2fs_cluster_blocks(struct inode *inode,
>   /* return # of compressed blocks in compressed cluster */
>   static int f2fs_compressed_blocks(struct compress_ctx *cc)
>   {
> -	return __f2fs_cluster_blocks(cc->inode, cc->cluster_idx, true);
> +	return __f2fs_cluster_blocks(cc->inode, cc->cluster_idx, COMPR_BLKS);
> +}
> +
> +/* return # of raw blocks in non-compressed cluster */
> +static int f2fs_decompressed_blocks(struct inode *inode,
> +				unsigned int cluster_idx)
> +{
> +	return __f2fs_cluster_blocks(inode, cluster_idx, DECOMPR_BLKS);
>   }
>   
>   /* return whether cluster is compressed one or not */
> @@ -999,7 +1008,16 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
>   {
>   	return __f2fs_cluster_blocks(inode,
>   		index >> F2FS_I(inode)->i_log_cluster_size,
> -		false);
> +		COMPR_CLUSTER);
> +}
> +
> +/* return whether the cluster is filled with raw blocks */
> +bool f2fs_is_non_sparse_cluster(struct inode *inode, pgoff_t index)

f2fs_is_sparse_cluster()?

> +{
> +	unsigned int cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size;
> +
> +	return f2fs_decompressed_blocks(inode, cluster_idx) ==
> +		F2FS_I(inode)->i_cluster_size;
>   }
>   
>   static bool cluster_may_compress(struct compress_ctx *cc)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 51fd5063a69c..6f26c8cb8857 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4302,6 +4302,11 @@ static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
>    * compress.c
>    */
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> +enum cluster_check_type {
> +	COMPR_CLUSTER,
> +	COMPR_BLKS,
> +	DECOMPR_BLKS

How about?

CLUSTER_IS_COMPR,
CLUSTER_COMPR_BLKS,
CLUSTER_RAW_BLKS

> +};

Can you please add some comments for these enums?

>   bool f2fs_is_compressed_page(struct page *page);
>   struct page *f2fs_compress_control_page(struct page *page);
>   int f2fs_prepare_compress_overwrite(struct inode *inode,
> @@ -4328,6 +4333,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>   						struct writeback_control *wbc,
>   						enum iostat_type io_type);
>   int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
> +bool f2fs_is_non_sparse_cluster(struct inode *inode, pgoff_t index);
>   void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
>   				pgoff_t fofs, block_t blkaddr,
>   				unsigned int llen, unsigned int c_len);
> @@ -4414,6 +4420,12 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
>   static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
>   							nid_t ino) { }
>   #define inc_compr_inode_stat(inode)		do { } while (0)
> +static inline int f2fs_is_compressed_cluster(
> +				struct inode *inode,
> +				pgoff_t index) { return 0; }
> +static inline bool f2fs_is_non_sparse_cluster(
> +				struct inode *inode,
> +				pgoff_t index) { return false; }
>   static inline void f2fs_update_read_extent_tree_range_compressed(
>   				struct inode *inode,
>   				pgoff_t fofs, block_t blkaddr,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 270c32e3385f..fba8b5f216f9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4220,9 +4220,8 @@ static int f2fs_ioc_decompress_file(struct file *filp)
>   	struct inode *inode = file_inode(filp);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	pgoff_t page_idx = 0, last_idx;
> -	int cluster_size = fi->i_cluster_size;
> -	int count, ret;
> +	pgoff_t page_idx = 0, last_idx, cluster_idx;
> +	int ret;
>   
>   	if (!f2fs_sb_has_compression(sbi) ||
>   			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
> @@ -4257,10 +4256,15 @@ static int f2fs_ioc_decompress_file(struct file *filp)
>   		goto out;
>   
>   	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> +	last_idx >>= fi->i_log_cluster_size;
> +
> +	for (cluster_idx = 0; cluster_idx < last_idx; cluster_idx++) {
> +		page_idx = cluster_idx << fi->i_log_cluster_size;
> +
> +		if (!f2fs_is_compressed_cluster(inode, page_idx))
> +			continue;
>   
> -	count = last_idx - page_idx;
> -	while (count && count >= cluster_size) {
> -		ret = redirty_blocks(inode, page_idx, cluster_size);
> +		ret = redirty_blocks(inode, page_idx, fi->i_cluster_size);
>   		if (ret < 0)
>   			break;
>   
> @@ -4270,9 +4274,6 @@ static int f2fs_ioc_decompress_file(struct file *filp)
>   				break;
>   		}
>   
> -		count -= cluster_size;
> -		page_idx += cluster_size;
> -
>   		cond_resched();
>   		if (fatal_signal_pending(current)) {
>   			ret = -EINTR;
> @@ -4299,9 +4300,9 @@ static int f2fs_ioc_compress_file(struct file *filp)
>   {
>   	struct inode *inode = file_inode(filp);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	pgoff_t page_idx = 0, last_idx;
> -	int cluster_size = F2FS_I(inode)->i_cluster_size;
> -	int count, ret;
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	pgoff_t page_idx = 0, last_idx, cluster_idx;
> +	int ret;
>   
>   	if (!f2fs_sb_has_compression(sbi) ||
>   			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
> @@ -4335,10 +4336,15 @@ static int f2fs_ioc_compress_file(struct file *filp)
>   	set_inode_flag(inode, FI_ENABLE_COMPRESS);
>   
>   	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> +	last_idx >>= fi->i_log_cluster_size;
>   
> -	count = last_idx - page_idx;
> -	while (count && count >= cluster_size) {
> -		ret = redirty_blocks(inode, page_idx, cluster_size);
> +	for (cluster_idx = 0; cluster_idx < last_idx; cluster_idx++) {
> +		page_idx = cluster_idx << fi->i_log_cluster_size;
> +
> +		if (!f2fs_is_non_sparse_cluster(inode, page_idx))

if (f2fs_is_sparse_cluster())
	continue;

Thanks,

> +			continue;
> +
> +		ret = redirty_blocks(inode, page_idx, fi->i_cluster_size);
>   		if (ret < 0)
>   			break;
>   
> @@ -4348,9 +4354,6 @@ static int f2fs_ioc_compress_file(struct file *filp)
>   				break;
>   		}
>   
> -		count -= cluster_size;
> -		page_idx += cluster_size;
> -
>   		cond_resched();
>   		if (fatal_signal_pending(current)) {
>   			ret = -EINTR;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
