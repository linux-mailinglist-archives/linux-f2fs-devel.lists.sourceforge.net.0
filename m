Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14907354B49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Apr 2021 05:40:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lTcZO-0004He-98; Tue, 06 Apr 2021 03:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lTcZM-0004Gu-8n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Apr 2021 03:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AoZZ4eyVyAAbW2XzSyEc9mF+Knfhpj0laXHS7ZG4+tU=; b=UaVVZwQKe3SgV8NEz4f2odmJ2L
 FEgzsor/0DOnnViNHWs9lw4ZFscKkSV4y4gS1soonPMQByecLMTr9AwFAVEUW0drrQ2WVcZYKxtB0
 /KpWuwicUQuOFYYPe8ReSty3Q44sJN+fKV4iG2dHSe//fzW63FIBkf9cuV2hX9/l47No=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AoZZ4eyVyAAbW2XzSyEc9mF+Knfhpj0laXHS7ZG4+tU=; b=b5UcH39hOvXBGH0uJsTW5C4Qcn
 s/ARPnd+cBcDjCfomMhW7b8c+lbK54v5Q/fmAYX/dSJYEx9x2FyFUsl7IKDWs4wfT3DBckcE7sF/9
 n1oDu6mTPcqjsSZH+eM5uUI/7TN0YAAxd64umzwDPqZu6zYALguhVnYAGxrSaHxmHnZg=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lTcZG-008XGX-LY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Apr 2021 03:40:00 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FDtWd4Sv6z9wdv
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Apr 2021 11:37:33 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 6 Apr 2021
 11:39:40 +0800
To: Park Ju Hyung <qkrwngud825@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210405084056.63423-1-qkrwngud825@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4402d1a5-1e22-c010-3ad7-abd16737a273@huawei.com>
Date: Tue, 6 Apr 2021 11:39:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210405084056.63423-1-qkrwngud825@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lTcZG-008XGX-LY
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent mounting devices with
 unsupported features
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

Hi Ju Hyung,

On 2021/4/5 16:40, Park Ju Hyung wrote:
> Mounting f2fs devices with future options leads to unwanted behaviors
> incurring errors and data destruction.
> 
> Implement a long overdue safeguard to prevent mounting devices with
> unsupported features.
> 
> This can be further extended to allow read-only mounts on certain
> incompatible features, but that doesn't seem necessary for now with
> how f2fs features has been added.

Thanks for the patch!

I have a RFC patch for this issue, but the patch doesn't being merged,
IIRC, Jaegeuk and I have divergence on implementation details, maybe we
could continue the discussion and work right now. :)

https://lkml.org/lkml/2019/7/29/623

Thanks,

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> ---
>   fs/f2fs/f2fs.h  | 11 +++++++++++
>   fs/f2fs/super.c | 10 ++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e2d302ae3a46..12d274492d6f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -153,6 +153,9 @@ struct f2fs_mount_info {
>   	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
>   };
>   
> +/*
> + * All features listed here should be appended to F2FS_SUPPORTED_FEATURES
> + */
>   #define F2FS_FEATURE_ENCRYPT		0x0001
>   #define F2FS_FEATURE_BLKZONED		0x0002
>   #define F2FS_FEATURE_ATOMIC_WRITE	0x0004
> @@ -168,6 +171,14 @@ struct f2fs_mount_info {
>   #define F2FS_FEATURE_CASEFOLD		0x1000
>   #define F2FS_FEATURE_COMPRESSION	0x2000
>   
> +/* Currently supported features by this version of f2fs */
> +#define F2FS_SUPPORTED_FEATURES \
> +	(F2FS_FEATURE_ENCRYPT | F2FS_FEATURE_BLKZONED | F2FS_FEATURE_ATOMIC_WRITE | \
> +	 F2FS_FEATURE_EXTRA_ATTR | F2FS_FEATURE_PRJQUOTA | F2FS_FEATURE_INODE_CHKSUM | \
> +	 F2FS_FEATURE_FLEXIBLE_INLINE_XATTR | F2FS_FEATURE_QUOTA_INO | F2FS_FEATURE_INODE_CRTIME | \
> +	 F2FS_FEATURE_LOST_FOUND | F2FS_FEATURE_VERITY | F2FS_FEATURE_SB_CHKSUM | \
> +	 F2FS_FEATURE_CASEFOLD | F2FS_FEATURE_COMPRESSION)
> +
>   #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>   	((raw_super->feature & cpu_to_le32(mask)) != 0)
>   #define F2FS_HAS_FEATURE(sbi, mask)	__F2FS_HAS_FEATURE(sbi->raw_super, mask)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 82592b19b4e0..91d77985cf9b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3610,6 +3610,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	int recovery, i, valid_super_block;
>   	struct curseg_info *seg_i;
>   	int retry_cnt = 1;
> +	__le32 unsupported;
>   
>   try_onemore:
>   	err = -EINVAL;
> @@ -3647,6 +3648,15 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	sb->s_fs_info = sbi;
>   	sbi->raw_super = raw_super;
>   
> +	/* check supported features */
> +	unsupported = raw_super->feature & ~F2FS_SUPPORTED_FEATURES;
> +	if (unsupported) {
> +		f2fs_err(sbi, "unsupported features: 0x%x\n", unsupported);
> +		f2fs_err(sbi, "please update your kernel or adjust the mkfs.f2fs option\n", unsupported);
> +		err = -EOPNOTSUPP;
> +		goto free_sb_buf;
> +	}
> +
>   	/* precompute checksum seed for metadata */
>   	if (f2fs_sb_has_inode_chksum(sbi))
>   		sbi->s_chksum_seed = f2fs_chksum(sbi, ~0, raw_super->uuid,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
