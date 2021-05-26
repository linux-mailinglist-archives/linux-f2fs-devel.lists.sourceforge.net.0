Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89D3913E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 11:42:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llq3g-0002Hg-9c; Wed, 26 May 2021 09:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1llq3e-0002HY-Gb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 09:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Lt/Akf8eTKI9iEu/KyVAbsLqHNdnKA0yy1prVLTNJA=; b=Nz5yOMsv5La3w2hy8zLPqQJVoa
 VPd+NG5G7SxpfRK6+lElN/FxXL81S5cBi0mIHjiUbfh5b/bgduo8/7UWcpr4BafRXj6no6ANjwFhS
 nM0K4aNSQgcnvv5tp+6qK8pVQX6aEw+RU8zFI5AQ4r/D0q/eKy/0TnJHj76pn/Z4xXIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Lt/Akf8eTKI9iEu/KyVAbsLqHNdnKA0yy1prVLTNJA=; b=jtTCzjj9zzwFzFHPLFk03wIDjH
 pd52fhq3GYvCdC82hPeOP8wayOW0Y9DFZ4lDBJagUaYPStQjDIPVZTspaTSJmnl2jiezzbVMnSASO
 xiJjDA3tUnvY6HORckbi0hWnFRduvQW+7EKH+gFxfQoPgl3V3MKp7pfjBEQaabitwH0I=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1llq3V-0004oT-3E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 09:42:35 +0000
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FqmB55VPpzkXFd;
 Wed, 26 May 2021 17:39:25 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 17:42:17 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 17:42:16 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210521190217.2484099-1-jaegeuk@kernel.org>
 <20210521190217.2484099-2-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <984caf0c-ddec-930a-cbc6-084c8a9b67e5@huawei.com>
Date: Wed, 26 May 2021 17:42:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210521190217.2484099-2-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx702-chm.china.huawei.com (10.1.199.49) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1llq3V-0004oT-3E
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support RO feature
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/22 3:02, Jaegeuk Kim wrote:
> Given RO feature in superblock, we don't need to check provisioning/reserve
> spaces and SSA area.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/f2fs.h    |  2 ++
>   fs/f2fs/segment.c |  3 +++
>   fs/f2fs/super.c   | 35 +++++++++++++++++++++++++++++++----
>   3 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c0bead0df66a..2c6913261586 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -168,6 +168,7 @@ struct f2fs_mount_info {
>   #define F2FS_FEATURE_SB_CHKSUM		0x0800
>   #define F2FS_FEATURE_CASEFOLD		0x1000
>   #define F2FS_FEATURE_COMPRESSION	0x2000
> +#define F2FS_FEATURE_RO			0x4000
>   
>   #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>   	((raw_super->feature & cpu_to_le32(mask)) != 0)
> @@ -939,6 +940,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
>   #define	NR_CURSEG_DATA_TYPE	(3)
>   #define NR_CURSEG_NODE_TYPE	(3)
>   #define NR_CURSEG_INMEM_TYPE	(2)
> +#define NR_CURSEG_RO_TYPE	(2)
>   #define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
>   #define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8668df7870d0..67cec8f858a2 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4674,6 +4674,9 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>   {
>   	int i;
>   
> +	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
> +		return 0;

We need to skip this sanity check because .next_blkoff may point to end position
of image?

> +
>   	/*
>   	 * In LFS/SSR curseg, .next_blkoff should point to an unused blkaddr;
>   	 * In LFS curseg, all blkaddr after .next_blkoff should be unused.
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b29de80ab60e..312bfab54693 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1819,7 +1819,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   static void default_options(struct f2fs_sb_info *sbi)
>   {
>   	/* init some FS parameters */
> -	F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
> +	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
> +		F2FS_OPTION(sbi).active_logs = NR_CURSEG_RO_TYPE;
> +	else
> +		F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
> +
>   	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
>   	F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
>   	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
> @@ -1994,6 +1998,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	err = parse_options(sb, data, true);
>   	if (err)
>   		goto restore_opts;
> +
> +	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO) &&
> +					!(*flags & SB_RDONLY))

err = -EROFS; ?

> +		goto restore_opts;
> +
>   	checkpoint_changed =
>   			disable_checkpoint != test_opt(sbi, DISABLE_CHECKPOINT);
>   
> @@ -3137,16 +3146,18 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>   	ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
>   	reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
>   
> +	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
> +		goto no_reserved;
>   	if (unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
>   			ovp_segments == 0 || reserved_segments == 0)) {
>   		f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
>   		return 1;
>   	}

Well, why not:

if (!F2FS_HAS_FEATURE(, RO) && unlikely()) {
}

> -
> +no_reserved:
>   	user_block_count = le64_to_cpu(ckpt->user_block_count);
>   	segment_count_main = le32_to_cpu(raw_super->segment_count_main);
>   	log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
> -	if (!user_block_count || user_block_count >=
> +	if (!user_block_count || user_block_count >

Does this change related to RO feature? if so, let's split condition for
RO feature here?

>   			segment_count_main << log_blocks_per_seg) {
>   		f2fs_err(sbi, "Wrong user_block_count: %u",
>   			 user_block_count);
> @@ -3175,6 +3186,10 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>   		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
>   			le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
>   			return 1;
> +
> +		if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
> +			goto check_data;
> +
>   		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
>   			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
>   				le32_to_cpu(ckpt->cur_node_segno[j])) {
> @@ -3185,10 +3200,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>   			}
>   		}
>   	}
> +check_data:
>   	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
>   		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
>   			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
>   			return 1;
> +
> +		if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
> +			goto skip_cross;
> +
>   		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
>   			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
>   				le32_to_cpu(ckpt->cur_data_segno[j])) {
> @@ -3210,7 +3230,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>   			}
>   		}
>   	}
> -
> +skip_cross:
>   	sit_bitmap_size = le32_to_cpu(ckpt->sit_ver_bitmap_bytesize);
>   	nat_bitmap_size = le32_to_cpu(ckpt->nat_ver_bitmap_bytesize);
>   
> @@ -3703,6 +3723,13 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	if (err)
>   		goto free_options;
>   
> +	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO) &&
> +					!f2fs_readonly(sbi->sb)) {
> +		f2fs_info(sbi, "Allow to mount readonly mode only");
> +		err = -EINVAL;
> +		goto free_options;
> +	}

How about relocating this to parse_options() like other features did, then
we don't need to handle this in both fill_super() and remount()?

Thanks,

> +
>   	sb->s_maxbytes = max_file_blocks(NULL) <<
>   				le32_to_cpu(raw_super->log_blocksize);
>   	sb->s_max_links = F2FS_LINK_MAX;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
