Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC347171EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:47:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q493l-0007Ce-NJ;
	Tue, 30 May 2023 23:47:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q493k-0007CY-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BErKxpIJHmretHfTezLo3vpZ40e49dMG/jKG62GZMrg=; b=RiiHBVcwUYqTu+wu4/AO/RC7q/
 7faE/S8EKFxTDl6gfoSpynW3yGRn3uSoc0ylizSHISwIx0DnLi7VAbHbAj2YYf890JfLD5+35bLsp
 ISTh0AvFtMdTefOoQ35WJwkFLh/YRttW+Vw9wXEysWNWADs823MoSlx2wZTaxy8dNkuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BErKxpIJHmretHfTezLo3vpZ40e49dMG/jKG62GZMrg=; b=Z4QhBp1ON3bRchMtGG2OYDaQUY
 Z29AhPTCHYChtPMrOvBZs/cS4dwscYjoGJEipeX+A1I2q5eWjrnWpYz12UlODUMDTVzrQJy8TW5Wz
 mBGFW03OxD8c8LtqddKEvuwuvY7ZJvvBqUyvfbbCqDkn1s06cfa2GWFuFqV0d6U0RAV4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q493j-0000Y4-JN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:47:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37205602E8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83467C433D2;
 Tue, 30 May 2023 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685490437;
 bh=H6t6Au1we9raGSZBZ/rpw68g11Z0sU/WR+jWClBWDVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hm++Lmys5ts5c1Xt88j2DE5Mpep4lufExhU14kfcU3Ir2yJQLL/d6XWrzt9wFHFae
 Zytc3fm1axrP+6R6jeOZlyi0X1XLZpyt4rsx5jclD8fn41l18c0X/EJg+VGZRHAcfv
 U6MtlQ8g38rSP2Zcl0XAUwovYGjavKcwqdMAXUZyh5HuRTeg56z92r0MBFaUHpYw4C
 C0PCxB4pHtvJCM7W/GaRQaeiTyMAgTYiSb7k6RnkgD4wW2HXsyvlzsZc+mJnjiep7i
 HvOHIoRKUYJjYorVTQENk91+yHRWPpg4GJJyfQdXo+slpGaEVkpRcwsmpJDu7jyRFK
 ghXaM1pDFsNuA==
Date: Tue, 30 May 2023 16:47:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZHaLA9+7Qr1aj3ei@google.com>
References: <20230526235423.3591350-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526235423.3591350-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/27, Chao Yu wrote: > Introduce alloc_next_free_block()
 to wrap below openned codes: > > blkaddr = get_sb(main_blkaddr) + >
 c.cur_seg[curseg_type]
 * c.blks_per_seg + > c.curseg_offset[curseg_type [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q493j-0000Y4-JN
Subject: Re: [f2fs-dev] [PATCH v3 3/4] mkfs.f2fs: cleanup w/
 alloc_next_free_block()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/27, Chao Yu wrote:
> Introduce alloc_next_free_block() to wrap below openned codes:
> 
> 	blkaddr = get_sb(main_blkaddr) +
> 			c.cur_seg[curseg_type] * c.blks_per_seg +
> 			c.curseg_offset[curseg_type];
> 
> Meanwhile add curseg_offset field in f2fs_configuration to record
> last blkaddr in each log.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - rebase the code
>  include/f2fs_fs.h  |   2 +
>  mkfs/f2fs_format.c | 101 +++++++++++++++++++--------------------------
>  2 files changed, 45 insertions(+), 58 deletions(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 8475645..05d27ba 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -603,6 +603,8 @@ struct f2fs_configuration {
>  
>  	/* compression support for sload.f2fs */
>  	compress_config_t compress;
> +
> +	block_t curseg_offset[6];
>  };
>  
>  #ifdef CONFIG_64BIT
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 620f779..2ca5f48 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -1230,11 +1230,24 @@ static int f2fs_discard_obsolete_dnode(void)
>  }
>  #endif
>  
> +static block_t alloc_next_free_block(int curseg_type, int blkcnt)
> +{
> +	block_t blkaddr;
> +
> +	blkaddr = get_sb(main_blkaddr) +
> +		c.cur_seg[curseg_type] * c.blks_per_seg +
> +		c.curseg_offset[curseg_type];
> +
> +	c.curseg_offset[curseg_type] += blkcnt;
> +
> +	return blkaddr;
> +}
> +
>  static int f2fs_write_root_inode(void)
>  {
>  	struct f2fs_node *raw_node = NULL;
> -	uint64_t data_blk_nor;
> -	uint64_t main_area_node_seg_blk_offset = 0;
> +	block_t data_blkaddr;
> +	block_t node_blkaddr;
>  
>  	raw_node = calloc(F2FS_BLKSIZE, 1);
>  	if (raw_node == NULL) {
> @@ -1248,24 +1261,15 @@ static int f2fs_write_root_inode(void)
>  	if (c.lpf_ino)
>  		raw_node->i.i_links = cpu_to_le32(3);
>  
> -	raw_node->footer.next_blkaddr = cpu_to_le32(
> -			get_sb(main_blkaddr) +
> -			c.cur_seg[CURSEG_HOT_NODE] *
> -			c.blks_per_seg + 1);
> -
> -	data_blk_nor = get_sb(main_blkaddr) +
> -		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg;
> -	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blk_nor);
> -
> -	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
> -	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
> -					c.blks_per_seg;
> -
> -	DBG(1, "\tWriting root inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
> -			get_sb(main_blkaddr),
> -			c.cur_seg[CURSEG_HOT_NODE],
> -			c.blks_per_seg, main_area_node_seg_blk_offset);
> -	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
> +	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA, 1);
> +	raw_node->i.i_addr[get_extra_isize(raw_node)] =
> +				cpu_to_le32(data_blkaddr);
> +
> +	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
> +	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
> +
> +	DBG(1, "\tWriting root inode (hot node), offset 0x%x\n", node_blkaddr);
> +	if (write_inode(raw_node, node_blkaddr) < 0) {
>  		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
>  		free(raw_node);
>  		return -1;
> @@ -1349,8 +1353,8 @@ static int f2fs_write_default_quota(int qtype, unsigned int blkaddr,
>  static int f2fs_write_qf_inode(int qtype, int offset)
>  {
>  	struct f2fs_node *raw_node = NULL;
> -	uint64_t data_blk_nor;
> -	uint64_t main_area_node_seg_blk_offset = 0;
> +	block_t data_blkaddr;
> +	block_t node_blkaddr;
>  	__le32 raw_id;
>  	int i;
>  
> @@ -1366,14 +1370,10 @@ static int f2fs_write_qf_inode(int qtype, int offset)

I removed "int offset" which os obsolete. Please check dev-test branch.

>  	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
>  	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
>  
> -	raw_node->footer.next_blkaddr = cpu_to_le32(
> -			get_sb(main_blkaddr) +
> -			c.cur_seg[CURSEG_HOT_NODE] *
> -			c.blks_per_seg + 1 + qtype + 1);
> +	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
> +	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
>  
> -	data_blk_nor = get_sb(main_blkaddr) +
> -		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg + 1
> -		+ offset * QUOTA_DATA(i);
> +	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA, QUOTA_DATA(i));
>  
>  	if (qtype == 0)
>  		raw_id = raw_node->i.i_uid;
> @@ -1385,24 +1385,17 @@ static int f2fs_write_qf_inode(int qtype, int offset)
>  		ASSERT(0);
>  
>  	/* write two blocks */
> -	if (f2fs_write_default_quota(qtype, data_blk_nor, raw_id)) {
> +	if (f2fs_write_default_quota(qtype, data_blkaddr, raw_id)) {
>  		free(raw_node);
>  		return -1;
>  	}
>  
>  	for (i = 0; i < QUOTA_DATA(qtype); i++)
>  		raw_node->i.i_addr[get_extra_isize(raw_node) + i] =
> -					cpu_to_le32(data_blk_nor + i);
> +					cpu_to_le32(data_blkaddr + i);
>  
> -	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
> -	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
> -					c.blks_per_seg + offset + 1;
> -
> -	DBG(1, "\tWriting quota inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
> -			get_sb(main_blkaddr),
> -			c.cur_seg[CURSEG_HOT_NODE],
> -			c.blks_per_seg, main_area_node_seg_blk_offset);
> -	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
> +	DBG(1, "\tWriting quota inode (hot node), offset 0x%x\n", node_blkaddr);
> +	if (write_inode(raw_node, node_blkaddr) < 0) {
>  		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
>  		free(raw_node);
>  		return -1;
> @@ -1492,8 +1485,8 @@ static block_t f2fs_add_default_dentry_lpf(void)
>  static int f2fs_write_lpf_inode(void)
>  {
>  	struct f2fs_node *raw_node;
> -	uint64_t main_area_node_seg_blk_offset;
> -	block_t data_blk_nor;
> +	block_t data_blkaddr;
> +	block_t node_blkaddr;
>  	int err = 0;
>  
>  	ASSERT(c.lpf_ino);
> @@ -1510,28 +1503,20 @@ static int f2fs_write_lpf_inode(void)
>  	raw_node->i.i_namelen = le32_to_cpu(strlen(LPF));
>  	memcpy(raw_node->i.i_name, LPF, strlen(LPF));
>  
> -	raw_node->footer.next_blkaddr = cpu_to_le32(
> -			get_sb(main_blkaddr) +
> -			c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
> -			1 + c.quota_inum + 1);
> +	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
> +	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
>  
> -	data_blk_nor = f2fs_add_default_dentry_lpf();
> -	if (data_blk_nor == 0) {
> +	data_blkaddr = f2fs_add_default_dentry_lpf();
> +	if (data_blkaddr == 0) {
>  		MSG(1, "\tError: Failed to add default dentries for lost+found!!!\n");
>  		err = -1;
>  		goto exit;
>  	}
> -	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blk_nor);
> -
> -	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
> -	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
> -		c.blks_per_seg + c.quota_inum + 1;
> +	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blkaddr);
>  
> -	DBG(1, "\tWriting lost+found inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
> -			get_sb(main_blkaddr),
> -			c.cur_seg[CURSEG_HOT_NODE],
> -			c.blks_per_seg, main_area_node_seg_blk_offset);
> -	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
> +	DBG(1, "\tWriting lost+found inode (hot node), offset 0x%x\n",
> +								node_blkaddr);
> +	if (write_inode(raw_node, node_blkaddr) < 0) {
>  		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
>  		err = -1;
>  		goto exit;
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
