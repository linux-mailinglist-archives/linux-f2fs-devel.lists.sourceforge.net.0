Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBAD1188C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 10:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ujz84K0NERZexhNqBchtzkZOn+rFDnOqW4t//W3mRY=; b=MZBhCC7KGxE5cZaUcnA0zz1LAC
	zY9feZgyqp1FdVM/svMTNqknCj+nKwEY5Lp0/vNpGYWkeJ1T9mU+ER7Zi98wm6Hmxmz44jWtbNxG4
	Kshe6iifEMWa4PY+mFGFnHurKeW/MVoHWR7KYJ+Tekm9ZS0/3kCGzB7Yp2UtnLnoq3VY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfEOI-0001ks-3x;
	Mon, 12 Jan 2026 09:39:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfEOG-0001km-Kn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9VnfWVAT6TcKFFdeaZfGhTrIebb1WNiMXB+f8NQbZo=; b=mByHQLU7e5UOknXULpgTaykZ8s
 7MVtiWWioFQUpDQBMBs4jtae1PUtwKq2IfG09gDaaQY8nD/8LqRR1A1WJYgi3eY3C97bkau4dNZvt
 LMl10hCbHspfs/AoqsoPhSW1MO7n7VrSCETcoXyhVvtpBaNnYBxfIDsoNGj3wd1o1f9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b9VnfWVAT6TcKFFdeaZfGhTrIebb1WNiMXB+f8NQbZo=; b=l1Ug34brvdb5iA8Vp17K5VVYvz
 GnWUBV2I2gxfjEsEk7JjIGrIGy841e4l5Awgxcgj0YUYtziG/qEWo4QMLqDbjpDiIB+UXGbzI5pjo
 aj7wO0IQ2q6BP+dBgwn7spNXKWude2cRCBbf/r8MKQTpmCR035P3xp+qeAbtOitTNJsE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfEOF-0001Bt-Tv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43D0C6001D;
 Mon, 12 Jan 2026 09:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B4FC116D0;
 Mon, 12 Jan 2026 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768210741;
 bh=+h2DypXyg21e2X9nvz2hELmsn0mFc8PVBlFbXxOfqKw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BsTQBKXSUsoTsjZ/BOMwcHTUHt2DU8GBjnJTl1SScn8GGu8cQDZim55xHQ8chm6Mj
 GbjoDPFAw8q4nzKMigHuROdnnc+0Q9RqTkXgOaoxLp96mppFHpntztdawP/oCO0a4X
 o/ZliL43OoM/5WRcMaRhmTZ/mMvgT/JRSYO7SRs2QMsE0OkJCK3Tv3jh57wgm9sYxA
 9+H5NWTX9M5SJAzegB1J14lTadB80KO3GuzubLqdcIXJwWDURWk2Upt/xKFyoFX2fD
 CisQAfX/OuyOznatk6PrUnctkdo1bqrxSTDfSZqgDw37Ij3L1MqsA4BSdO3oe6bjCO
 RBB3kjA81rIKA==
Message-ID: <f8da654d-de14-4ed1-a86f-81d34d2048c1@kernel.org>
Date: Mon, 12 Jan 2026 17:39:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <wuboo@amazon.com>, jaegeuk@kernel.org
References: <20260112091958.39067-1-wuboo@amazon.com>
Content-Language: en-US
In-Reply-To: <20260112091958.39067-1-wuboo@amazon.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/12/2026 5:19 PM,
 Wu Bo wrote: > ADDRS_PER_INODE and ADDRS_PER_BLOCK
 are macros of a function, and if the > compiler does not optimize the code
 (-O0 for example), they would be > called in every s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfEOF-0001Bt-Tv
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: optimize the
 addrs_per_block/inode loop
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
Cc: wubo.oduw@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/12/2026 5:19 PM, Wu Bo wrote:
> ADDRS_PER_INODE and ADDRS_PER_BLOCK are macros of a function, and if the
> compiler does not optimize the code (-O0 for example), they would be
> called in every single loop, which could cause significant performance
> drops in some cases.
> 
> This scenario has been found before, refer to:
> Commit: 1bb669e ("fsck.f2fs: avoid unnecessary recalculation")
> 
> To avoid this performance drop as much as possible, I changed the
> function to 'inline' definition, which could mitigate such cases in
> the future.
> 
> Signed-off-by: Wu Bo <wuboo@amazon.com>
> ---
>   fsck/dump.c       |  5 +++--
>   fsck/fsck.c       | 15 ++++++++++-----
>   fsck/mount.c      |  4 +++-
>   include/f2fs_fs.h | 12 +++++++++++-
>   lib/libf2fs.c     | 11 -----------
>   5 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index f5c95de..a5f344b 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -495,7 +495,7 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>   {
>   	u32 i = 0;
>   	u64 ofs = 0;
> -	u32 addr_per_block;
> +	u32 addr_per_block, addr_per_inode;
>   	u16 type = le16_to_cpu(node_blk->i.i_mode);
>   	int ret = 0;
>   
> @@ -543,9 +543,10 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
>   	}
>   
>   	addr_per_block = ADDRS_PER_BLOCK(&node_blk->i);
> +	addr_per_inode = ADDRS_PER_INODE(&node_blk->i);
>   
>   	/* check data blocks in inode */
> -	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
> +	for (i = 0; i < addr_per_inode; i++, ofs++)
>   		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
>   			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), type);
>   
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index db44f9d..1627bd0 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -1516,8 +1516,9 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
>   	bool compressed = i_flags & F2FS_COMPR_FL;
>   	bool compr_rel = inode->i_inline & F2FS_COMPRESS_RELEASED;
>   	u32 cluster_size = 1 << inode->i_log_cluster_size;
> +	u32 addrs = ADDRS_PER_BLOCK(inode);
>   
> -	for (idx = 0; idx < ADDRS_PER_BLOCK(inode); idx++, child->pgofs++) {
> +	for (idx = 0; idx < addrs; idx++, child->pgofs++) {
>   		block_t blkaddr = le32_to_cpu(node_blk->dn.addr[idx]);
>   
>   		check_extent_info(child, blkaddr, 0);
> @@ -1617,6 +1618,7 @@ int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
>   {
>   	int i = 0;
>   	int need_fix = 0, ret = 0;
> +	u32 addrs = ADDRS_PER_BLOCK(inode);
>   
>   	fsck_reada_all_direct_node_blocks(sbi, node_blk);
>   
> @@ -1637,7 +1639,7 @@ int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
>   				FIX_MSG("Set double indirect node 0x%x -> 0", i);
>   			}
>   skip:
> -			child->pgofs += ADDRS_PER_BLOCK(inode) * NIDS_PER_BLOCK;
> +			child->pgofs += addrs * NIDS_PER_BLOCK;

I'm worried about that ADDRS_PER_BLOCK(inode) will change after we fixed
some fields of inode block in fsck_chk_node_blk().

Thanks,

>   		}
>   	}
>   
> @@ -3173,7 +3175,7 @@ static void fsck_disconnect_file_dnode(struct f2fs_sb_info *sbi,
>   {
>   	struct f2fs_node *node;
>   	struct node_info ni;
> -	u32 addr;
> +	u32 addr, addr_per_block;
>   	int i, err;
>   
>   	node = calloc(F2FS_BLKSIZE, 1);
> @@ -3187,7 +3189,8 @@ static void fsck_disconnect_file_dnode(struct f2fs_sb_info *sbi,
>   	release_block_cnt(sbi, dealloc);
>   	release_block(sbi, ni.blk_addr, dealloc);
>   
> -	for (i = 0; i < ADDRS_PER_BLOCK(inode); i++) {
> +	addr_per_block = ADDRS_PER_BLOCK(inode);
> +	for (i = 0; i < addr_per_block; i++) {
>   		addr = le32_to_cpu(node->dn.addr[i]);
>   		if (!addr)
>   			continue;
> @@ -3302,8 +3305,10 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
>   
>   	/* clear data counters */
>   	if (!(node->i.i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))) {
> +		u32 addrs = ADDRS_PER_INODE(&node->i);
> +
>   		ofs = get_extra_isize(node);
> -		for (i = 0; i < ADDRS_PER_INODE(&node->i); i++) {
> +		for (i = 0; i < addrs; i++) {
>   			block_t addr = le32_to_cpu(node->i.i_addr[ofs + i]);
>   			if (!addr)
>   				continue;
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 6f640a0..990f1e0 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -281,6 +281,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
>   	u32 namelen = le32_to_cpu(inode->i_namelen);
>   	int enc_name = file_enc_name(inode);
>   	int ofs = get_extra_isize(node);
> +	u32 addrs;
>   
>   	pretty_print_filename(inode->i_name, namelen, en, enc_name);
>   	if (name && en[0]) {
> @@ -350,7 +351,8 @@ void print_inode_info(struct f2fs_sb_info *sbi,
>   		}
>   	}
>   
> -	for (i = 0; i < ADDRS_PER_INODE(inode); i++) {
> +	addrs = ADDRS_PER_INODE(inode);
> +	for (i = 0; i < addrs; i++) {
>   		block_t blkaddr;
>   		char *flag = "";
>   
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 3095b59..d0877b9 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1660,7 +1660,6 @@ struct f2fs_configuration {
>   extern int utf8_to_utf16(char *, const char *, size_t, size_t);
>   extern int utf16_to_utf8(char *, const char *, size_t, size_t);
>   extern int log_base_2(uint32_t);
> -extern unsigned int addrs_per_page(struct f2fs_inode *, bool);
>   extern u64 f2fs_max_file_offset(struct f2fs_inode *);
>   extern __u32 f2fs_inode_chksum(struct f2fs_node *);
>   extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
> @@ -2212,4 +2211,15 @@ static inline bool __time_to_inject(int type, const char *func,
>   	return false;
>   }
>   
> +static inline unsigned int addrs_per_page(struct f2fs_inode *i, bool is_inode)
> +{
> +	unsigned int addrs = is_inode ? CUR_ADDRS_PER_INODE(i) -
> +		get_inline_xattr_addrs(i) : DEF_ADDRS_PER_BLOCK;
> +
> +	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
> +			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))
> +		return addrs;
> +	return ALIGN_DOWN(addrs, 1 << i->i_log_cluster_size);
> +}
> +
>   #endif	/*__F2FS_FS_H */
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 1a496b7..13e4d0d 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -516,17 +516,6 @@ opaque_seq:
>   	return __f2fs_dentry_hash(name, len);
>   }
>   
> -unsigned int addrs_per_page(struct f2fs_inode *i, bool is_inode)
> -{
> -	unsigned int addrs = is_inode ? CUR_ADDRS_PER_INODE(i) -
> -		get_inline_xattr_addrs(i) : DEF_ADDRS_PER_BLOCK;
> -
> -	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
> -			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))
> -		return addrs;
> -	return ALIGN_DOWN(addrs, 1 << i->i_log_cluster_size);
> -}
> -
>   u64 f2fs_max_file_offset(struct f2fs_inode *i)
>   {
>   	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
