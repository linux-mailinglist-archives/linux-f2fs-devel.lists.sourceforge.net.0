Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 532EA3CF2EB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 05:55:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5gr4-0003BD-1n; Tue, 20 Jul 2021 03:55:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m5gr2-0003B2-Iu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 03:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jiSO5XMgBjtOmpPotMTpSGYFkvLGFUudaE2Ngmm0iGs=; b=mGU5RECQQJzaOdbiSuoBxrNSin
 9f9d4sNd8qeECk9SogqFosjRiyImvPDeHz3OsZzON7sgRj5iJK6eG4bGTwevaVCYz5MajrI/tEhFF
 ONdW/hfDf8fm9vslTx0t6M3j+t6WY4+Q5QYWUkRlNHyo2IgzhUL3bDR9qUnbBuMqJ6EE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jiSO5XMgBjtOmpPotMTpSGYFkvLGFUudaE2Ngmm0iGs=; b=A7U+wz5vd5663wBIZvQ68Dtnxs
 X6t42LNfpWbPxmk8Q5eDUBeY27PJhUaYUOHk4OhATqnjgFjiUk3LRvZDz+f29XUpLMBeo8kDaMDF2
 1/olyCNUkdjOVGLLRmdZruM2NgzwNfPhGMKs8OEZiP7xDMAVsC5uSLxsdUHV7wzPjaYk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5gqv-0005Yu-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 03:55:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BFAD60FDB;
 Tue, 20 Jul 2021 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626753322;
 bh=kFKVvFy4RAI5mFOrzECRRi0FXB54GHaZo886YVCFv/w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LJFPfsncKa2Cvivfhm8iO01mPvKYNSkczl/NRkpNE4JAIbfNcnLCB7+QIYxM1WxkZ
 9EqXTFSBWSapypr5PhqHEpdMQnpMjjf74E8qYhnrUyVeiTQvOeC8YeWzppSURBpCiR
 v55ZJ2HzsYhHZ2P4F/CNvjw+/0hMVa5w9t28/ZpAvt2UHHZf/eADfSd+fm27ltGsze
 L/WLABoAE8uF90t5CVqFnxDWBCW9uGPDx4KFgKcY5nSZM70hcqzlsc4z14XtI9WIb+
 +nsevM5O5hhyiRgGfUKVOeOs8dU9eAmmmzhpLZt8maRWVWtc8IbaTStFH/t6ZejstE
 gdJdARU/Xkz1A==
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20210719085227.172254-1-wangxiaojun11@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <64e6cd23-013d-7011-4f5a-40770f2ca4be@kernel.org>
Date: Tue, 20 Jul 2021 11:55:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719085227.172254-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5gqv-0005Yu-Pi
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: rebuild the quota inode if it
 is corrupted
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/19 16:52, Wang Xiaojun wrote:
> If the following process returns an error,
> the quota inode, not the quota file, is damaged.
> (fsck_chk_quota_node-->fsck_chk_node_blk-->sanity_check_nid)
> The fsck does not have a process to rebuild the quota inode.
> 
> Because sanity_check_nid is not passed, fsck->nat_area_bitmap
> can not be cleared, and then the NAT of quota will be nullify
> during fix_nat_entries.
> 
> During the next fsck check, the quota inode check fails
> because the address of the quota inode changes to 0.
> In addition, in fsck_chk_quota_files-->f2fs_filesize_update,
> data is written to address 0.
> 
> Therefore, when the quota inode is corrupted, we need to rebuild it.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> ---
> v1->v2:
> -Update footer.cp_ver based on CP_CRC_RECOVERY_FLAG.
> -Add debug message in f2fs_rebuild_qf_inode.
> -Add time_t parameter to the f2fs_init_qf_inode.
> ---
>   fsck/fsck.c        |  2 ++
>   fsck/fsck.h        |  1 +
>   fsck/node.c        | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   include/f2fs_fs.h  | 40 ++++++++++++++++++++++++++++++++++++++++
>   mkfs/f2fs_format.c | 34 +---------------------------------
>   5 files changed, 89 insertions(+), 33 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 6ca85f0..af6d332 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -1899,6 +1899,8 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
>   			ASSERT_MSG("wrong quota inode, qtype [%d] ino [0x%x]",
>   								qtype, ino);
>   			qf_szchk_type[qtype] = QF_SZCHK_ERR;
> +			if (c.fix_on)
> +				f2fs_rebuild_qf_inode(sbi, qtype);
>   		}
>   	}
>   	cur_qtype = -1;
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index d79afef..67390f0 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -286,6 +286,7 @@ void f2fs_alloc_nid(struct f2fs_sb_info *, nid_t *);
>   void set_data_blkaddr(struct dnode_of_data *);
>   block_t new_node_block(struct f2fs_sb_info *,
>   					struct dnode_of_data *, unsigned int);
> +int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype);
>   
>   /* segment.c */
>   struct quota_file;
> diff --git a/fsck/node.c b/fsck/node.c
> index c7988cb..e11f222 100644
> --- a/fsck/node.c
> +++ b/fsck/node.c
> @@ -40,6 +40,51 @@ void f2fs_release_nid(struct f2fs_sb_info *sbi, nid_t nid)
>   	f2fs_clear_bit(nid, nm_i->nid_bitmap);
>   }
>   
> +int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
> +{
> +	struct f2fs_node *raw_node = NULL;
> +	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> +	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
> +	struct f2fs_summary sum;
> +	struct node_info ni;
> +	nid_t ino = QUOTA_INO(sb, qtype);
> +	block_t blkaddr = NULL_ADDR;
> +	__u64 cp_ver = cur_cp_version(ckpt);
> +	int ret = 0;
> +
> +	raw_node = calloc(F2FS_BLKSIZE, 1);
> +	if (raw_node == NULL) {
> +		MSG(1, "\tError: Calloc Failed for raw_node!!!\n");
> +		return -ENOMEM;
> +	}
> +	f2fs_init_qf_inode(sb, raw_node, qtype, time(NULL));
> +
> +	if (is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
> +		cp_ver |= (cur_cp_crc(ckpt) << 32);
> +	raw_node->footer.cp_ver = cpu_to_le64(cp_ver);
> +
> +	get_node_info(sbi, ino, &ni);
> +	set_summary(&sum, ino, 0, ni.version);
> +	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
> +	if (ret)

MSG(1, "........");

Otherwise, it looks good to me, you can add below tag in next version:

Reivewed-by: Chao Yu <chao@kernel.org>

Thanks,

> +		goto err_out;
> +
> +	ret = write_inode(raw_node, blkaddr);
> +	if (ret < 0) {
> +		MSG(1, "\tError: While rebuilding the quota inode to disk!\n");
> +		goto err_out;
> +	}
> +	update_nat_blkaddr(sbi, ino, ino, blkaddr);
> +
> +	f2fs_clear_bit(ino, F2FS_FSCK(sbi)->nat_area_bitmap);
> +	f2fs_set_bit(ino, NM_I(sbi)->nid_bitmap);
> +	DBG(1, "Rebuild quota inode ([%3d] ino [0x%x]) at offset:0x%x\n",
> +						qtype, ino, blkaddr);
> +err_out:
> +	free(raw_node);
> +	return ret;
> +}
> +
>   void set_data_blkaddr(struct dnode_of_data *dn)
>   {
>   	__le32 *addr_array;
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 45f7257..69a4bf8 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -20,6 +20,7 @@
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> +#include <time.h>
>   #ifdef HAVE_CONFIG_H
>   #include <config.h>
>   #endif
> @@ -1554,6 +1555,45 @@ static inline void show_version(const char *prog)
>   #endif
>   }
>   
> +static inline void f2fs_init_qf_inode(struct f2fs_super_block *sb,
> +		struct f2fs_node *raw_node, int qtype, time_t mtime)
> +{
> +	raw_node->footer.nid = sb->qf_ino[qtype];
> +	raw_node->footer.ino = sb->qf_ino[qtype];
> +	raw_node->footer.cp_ver = cpu_to_le64(1);
> +	raw_node->i.i_mode = cpu_to_le16(0x8180);
> +	raw_node->i.i_links = cpu_to_le32(1);
> +	raw_node->i.i_uid = cpu_to_le32(c.root_uid);
> +	raw_node->i.i_gid = cpu_to_le32(c.root_gid);
> +
> +	raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
> +	raw_node->i.i_blocks = cpu_to_le64(1);
> +
> +	raw_node->i.i_atime = cpu_to_le32(mtime);
> +	raw_node->i.i_atime_nsec = 0;
> +	raw_node->i.i_ctime = cpu_to_le32(mtime);
> +	raw_node->i.i_ctime_nsec = 0;
> +	raw_node->i.i_mtime = cpu_to_le32(mtime);
> +	raw_node->i.i_mtime_nsec = 0;
> +	raw_node->i.i_generation = 0;
> +	raw_node->i.i_xattr_nid = 0;
> +	raw_node->i.i_flags = FS_IMMUTABLE_FL;
> +	raw_node->i.i_current_depth = cpu_to_le32(0);
> +	raw_node->i.i_dir_level = DEF_DIR_LEVEL;
> +
> +	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
> +		raw_node->i.i_inline = F2FS_EXTRA_ATTR;
> +		raw_node->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
> +	}
> +
> +	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
> +		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
> +
> +	raw_node->i.i_ext.fofs = 0;
> +	raw_node->i.i_ext.blk_addr = 0;
> +	raw_node->i.i_ext.len = 0;
> +}
> +
>   struct feature {
>   	char *name;
>   	u32  mask;
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 2132852..d6a92f8 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -1373,43 +1373,14 @@ static int f2fs_write_qf_inode(int qtype)
>   		MSG(1, "\tError: Calloc Failed for raw_node!!!\n");
>   		return -1;
>   	}
> +	f2fs_init_qf_inode(sb, raw_node, qtype, mkfs_time);
>   
> -	raw_node->footer.nid = sb->qf_ino[qtype];
> -	raw_node->footer.ino = sb->qf_ino[qtype];
> -	raw_node->footer.cp_ver = cpu_to_le64(1);
>   	raw_node->footer.next_blkaddr = cpu_to_le32(
>   			get_sb(main_blkaddr) +
>   			c.cur_seg[CURSEG_HOT_NODE] *
>   			c.blks_per_seg + 1 + qtype + 1);
> -
> -	raw_node->i.i_mode = cpu_to_le16(0x8180);
> -	raw_node->i.i_links = cpu_to_le32(1);
> -	raw_node->i.i_uid = cpu_to_le32(c.root_uid);
> -	raw_node->i.i_gid = cpu_to_le32(c.root_gid);
> -
> -	raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
>   	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
>   
> -	raw_node->i.i_atime = cpu_to_le32(mkfs_time);
> -	raw_node->i.i_atime_nsec = 0;
> -	raw_node->i.i_ctime = cpu_to_le32(mkfs_time);
> -	raw_node->i.i_ctime_nsec = 0;
> -	raw_node->i.i_mtime = cpu_to_le32(mkfs_time);
> -	raw_node->i.i_mtime_nsec = 0;
> -	raw_node->i.i_generation = 0;
> -	raw_node->i.i_xattr_nid = 0;
> -	raw_node->i.i_flags = FS_IMMUTABLE_FL;
> -	raw_node->i.i_current_depth = cpu_to_le32(0);
> -	raw_node->i.i_dir_level = DEF_DIR_LEVEL;
> -
> -	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
> -		raw_node->i.i_inline = F2FS_EXTRA_ATTR;
> -		raw_node->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
> -	}
> -
> -	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
> -		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
> -
>   	data_blk_nor = get_sb(main_blkaddr) +
>   		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg + 1;
>   
> @@ -1434,9 +1405,6 @@ static int f2fs_write_qf_inode(int qtype)
>   	for (i = 0; i < QUOTA_DATA(qtype); i++)
>   		raw_node->i.i_addr[get_extra_isize(raw_node) + i] =
>   					cpu_to_le32(data_blk_nor + i);
> -	raw_node->i.i_ext.fofs = 0;
> -	raw_node->i.i_ext.blk_addr = 0;
> -	raw_node->i.i_ext.len = 0;
>   
>   	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
>   	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
