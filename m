Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB69A0F46
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2024 18:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t16Vu-0003Sj-4T;
	Wed, 16 Oct 2024 16:04:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t16Vs-0003Sd-I6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 16:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/eAehQdV1w2SG2q2Irr0NX+CVQE3QPSalvqzt24aFX0=; b=RrGuf6ZMaMuznH0ItH2ECCB6Nd
 k0pTmbYig5515moZ8vranbA/EvYHNEL6OISlIVScQzdnwmnHYnEnJ+fKsfW64fcri5eX6Sx+ffWSB
 E2AMNyAeMGc6LBmqNDez/cVrfNJ/NoA+v2IvRS1KDQlgaAojAuL8Rw9bhUxZZdbVFXk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/eAehQdV1w2SG2q2Irr0NX+CVQE3QPSalvqzt24aFX0=; b=mNE3s9E4UDqRCIFGVmtzQmKRyr
 n/uDMoKFietE6RssO7ufG5xqtrib9j2C0rbw3CTvrk2qm3IvHPKqCupdXiUJHF+hZXLncxH/oGBSz
 mAMKRZzHmWZqKenq+7AaerJf3BmijBb3X1/tJLxKz/6V5Hy6l8yjPb0hERj+3zJbzX0A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t16Vr-0007KV-Km for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 16:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C39855C5C56;
 Wed, 16 Oct 2024 16:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74751C4CECE;
 Wed, 16 Oct 2024 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729094668;
 bh=zuOSy95G7mDcuWKPvFJYP2uNmIQJLYkDJb2JZ/9eicQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UmMgAQKCgYgOyDg1JwnEM5XDeTw8054VjwarH8AowFAe0y8P9kdZUdg55EGRt83Vv
 YazuM0y28B5xMwMRx3KmrpwO7tS8kiJl0IKInGiktmQCSV15ZOvxusFA69DpqaaYqZ
 P2cM7DLg5ncX2vn0blWozDG6jUMKHN/gIVpVHS1p0ys8wtM6g9G16U3i42tmEW8pM+
 7lWaFiE1u2itvZm9fCRXRDiZ7ohPJyydAVm2HN+hVWALEkRzBwzrRf5vtKqbJPi0MC
 o1fOn6eUfp7GD+OoQblfqk6Ix9MuixOH2OlQb7WaLn0zCgE3TfJuTLcq2ChxstrvHq
 RsSxukwe00/qQ==
Date: Wed, 16 Oct 2024 16:04:26 +0000
To: Yi Sun <yi.sun@unisoc.com>
Message-ID: <Zw_kCu3J7f7iQrFF@google.com>
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
 <20241016052758.3400359-3-yi.sun@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016052758.3400359-3-yi.sun@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 2573 void f2fs_invalidate_consecutive_blocks(struct
 f2fs_sb_info
 *sbi, block_t addr, int cnt) 2574 { 2575 unsigned int segno = GET_SEGNO(sbi,
 addr); 2576 unsigned int segno2 = GET_SEGNO(sbi, addr + cn [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t16Vr-0007KV-Km
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

2573 void f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi, block_t addr, int cnt)
2574 {
2575         unsigned int segno = GET_SEGNO(sbi, addr);
2576         unsigned int segno2 = GET_SEGNO(sbi, addr + cnt - 1);
2577         struct sit_info *sit_i = SIT_I(sbi);
2578
2579         f2fs_bug_on(sbi, addr == NULL_ADDR || segno != segno2);

This hits a panic here while running fsstress.

On 10/16, Yi Sun wrote:
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
>  fs/f2fs/compress.c | 14 ++++++++++++++
>  fs/f2fs/f2fs.h     |  5 +++++
>  fs/f2fs/file.c     | 34 +++++++++++++++++++++++++++++++++-
>  fs/f2fs/segment.c  | 25 +++++++++++++++++++++++++
>  4 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7f26440e8595..70929a87e9bf 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -2014,6 +2014,20 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
>  	} while (index < end);
>  }
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
>  int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
>  {
>  	struct inode *inode;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ce00cb546f4a..99767f35678f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3716,6 +3716,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
>  int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
>  void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
> +void f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi, block_t addr, int cnt);
>  bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
>  int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
>  void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
> @@ -4375,6 +4376,8 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>  bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>  								block_t blkaddr);
>  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
> +void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> +					block_t blkaddr, int cnt);
>  #define inc_compr_inode_stat(inode)					\
>  	do {								\
>  		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
> @@ -4432,6 +4435,8 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
>  				struct page *page, block_t blkaddr) { return false; }
>  static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
>  							nid_t ino) { }
> +static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> +						block_t blkaddr, int cnt) { }
>  #define inc_compr_inode_stat(inode)		do { } while (0)
>  static inline int f2fs_is_compressed_cluster(
>  				struct inode *inode,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7057efa8ec17..634691e3b5f1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -612,6 +612,18 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>  	return finish_preallocate_blocks(inode);
>  }
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
>  void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> @@ -621,6 +633,9 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  	int cluster_index = 0, valid_blocks = 0;
>  	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>  	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
> +	block_t con_start;
> +	bool run_invalid = true;
> +	int con_cnt = 1;
>  
>  	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
>  
> @@ -652,7 +667,24 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  				valid_blocks++;
>  		}
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
>  		if (!released || blkaddr != COMPRESS_ADDR)
>  			nr_free++;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index f118faf36d35..edb8a78985ba 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2570,6 +2570,31 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
>  	up_write(&sit_i->sentry_lock);
>  }
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
> +}
> +
>  bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
>  {
>  	struct sit_info *sit_i = SIT_I(sbi);
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
