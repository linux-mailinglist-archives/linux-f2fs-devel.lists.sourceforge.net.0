Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 271CC6B961
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2019 11:39:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hngPE-0003Uk-7N; Wed, 17 Jul 2019 09:39:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hngPB-0003Uc-Rc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 09:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TGKk0HeKZ0ggMdUOqPcYb9n0lm0htz6AnLRycY+RtV8=; b=NA8uD91hYwA5U4Uez+pfsSLQ98
 JjzH3yIMsEdl7tQl/21rz0EyWGCElSY/PNzVwhB5B+iq9tZZB9JXNY4no9cXB4j3slkafCtsjzQqo
 2rVPOseNK4XZxIMu2/9YPZeTfL37qdEr/vHW8pWpbVwZUlX5rC73o/1C/ivtOfg/MwM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TGKk0HeKZ0ggMdUOqPcYb9n0lm0htz6AnLRycY+RtV8=; b=hzvl1lvtgjVNk4+BXWbieXulsJ
 FibljGPMc6J4SGPlh02AzINO+SZdPkuxcepLuFJwSeEt82NqNvt+g9DmT/q6I19a0iglzhZgwgXjI
 HHkNN4CgCZswnPyEOPXAWtIRGBYmisDbJEzJ/BFRcer4Vxud+16CF+9y58DVlKFgHWg0=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hngP9-004Dkq-6O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 09:39:21 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C4BB120A60E0232F5525;
 Wed, 17 Jul 2019 17:39:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 17 Jul
 2019 17:39:09 +0800
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190717031408.114104-1-drosen@google.com>
 <20190717031408.114104-2-drosen@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <201eff19-869d-1d9f-018a-e2a60fbe1943@huawei.com>
Date: Wed, 17 Jul 2019 17:39:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190717031408.114104-2-drosen@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hngP9-004Dkq-6O
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: include charset encoding
 information in the superblock
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/17 11:14, Daniel Rosenberg wrote:
> Add charset encoding to f2fs to support casefolding. It is modeled after
> the same feature introduced in commit c83ad55eaa91 ("ext4: include charset
> encoding information in the superblock")
> 
> Currently this is not compatible with encryption, similar to the current
> ext4 imlpementation. This will change in the future.
> 
>>From the ext4 patch:
> """
> The s_encoding field stores a magic number indicating the encoding
> format and version used globally by file and directory names in the
> filesystem.  The s_encoding_flags defines policies for using the charset
> encoding, like how to handle invalid sequences.  The magic number is
> mapped to the exact charset table, but the mapping is specific to ext4.
> Since we don't have any commitment to support old encodings, the only
> encoding I am supporting right now is utf8-12.1.0.
> 
> The current implementation prevents the user from enabling encoding and
> per-directory encryption on the same filesystem at the same time.  The
> incompatibility between these features lies in how we do efficient
> directory searches when we cannot be sure the encryption of the user
> provided fname will match the actual hash stored in the disk without
> decrypting every directory entry, because of normalization cases.  My
> quickest solution is to simply block the concurrent use of these
> features for now, and enable it later, once we have a better solution.
> """
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/f2fs.h          |  6 +++
>  fs/f2fs/super.c         | 81 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/f2fs_fs.h |  9 ++++-
>  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 17382da7f0bd9..c6c7904572d0d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -153,6 +153,7 @@ struct f2fs_mount_info {
>  #define F2FS_FEATURE_LOST_FOUND		0x0200
>  #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
>  #define F2FS_FEATURE_SB_CHKSUM		0x0800
> +#define F2FS_FEATURE_CASEFOLD		0x1000
>  
>  #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>  	((raw_super->feature & cpu_to_le32(mask)) != 0)
> @@ -1169,6 +1170,10 @@ struct f2fs_sb_info {
>  	int valid_super_block;			/* valid super block no */
>  	unsigned long s_flag;				/* flags for sbi */
>  	struct mutex writepages;		/* mutex for writepages() */
> +#ifdef CONFIG_UNICODE
> +	struct unicode_map *s_encoding;
> +	__u16 s_encoding_flags;
> +#endif
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> @@ -3562,6 +3567,7 @@ F2FS_FEATURE_FUNCS(quota_ino, QUOTA_INO);
>  F2FS_FEATURE_FUNCS(inode_crtime, INODE_CRTIME);
>  F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
>  F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
> +F2FS_FEATURE_FUNCS(casefold, CASEFOLD);

It needs to change sysfs.c like we did for other features, you can refer to
d440c52d3151 ("f2fs: support superblock checksum").

>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6de6cda440315..7927071ef5e95 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -23,6 +23,7 @@
>  #include <linux/f2fs_fs.h>
>  #include <linux/sysfs.h>
>  #include <linux/quota.h>
> +#include <linux/unicode.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -222,6 +223,36 @@ void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...)
>  	va_end(args);
>  }
>  
> +#ifdef CONFIG_UNICODE
> +static const struct f2fs_sb_encodings {
> +	__u16 magic;
> +	char *name;
> +	char *version;
> +} f2fs_sb_encoding_map[] = {
> +	{F2FS_ENC_UTF8_12_1, "utf8", "12.1.0"},
> +};
> +
> +static int f2fs_sb_read_encoding(const struct f2fs_super_block *sb,
> +				 const struct f2fs_sb_encodings **encoding,
> +				 __u16 *flags)
> +{
> +	__u16 magic = le16_to_cpu(sb->s_encoding);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(f2fs_sb_encoding_map); i++)
> +		if (magic == f2fs_sb_encoding_map[i].magic)
> +			break;
> +
> +	if (i >= ARRAY_SIZE(f2fs_sb_encoding_map))
> +		return -EINVAL;
> +
> +	*encoding = &f2fs_sb_encoding_map[i];
> +	*flags = le16_to_cpu(sb->s_encoding_flags);
> +
> +	return 0;
> +}
> +#endif
> +
>  static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
>  {
>  	block_t limit = min((sbi->user_block_count << 1) / 1000,
> @@ -798,6 +829,13 @@ static int parse_options(struct super_block *sb, char *options)
>  		return -EINVAL;
>  	}
>  #endif
> +#ifndef CONFIG_UNICODE
> +	if (f2fs_sb_has_casefold(sbi)) {
> +		f2fs_err(sbi,
> +			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
> +		return -EINVAL;
> +	}
> +#endif
>  
>  	if (F2FS_IO_SIZE_BITS(sbi) && !test_opt(sbi, LFS)) {
>  		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
> @@ -1089,6 +1127,9 @@ static void f2fs_put_super(struct super_block *sb)
>  	destroy_percpu_info(sbi);
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>  		kvfree(sbi->write_io[i]);
> +#ifdef CONFIG_UNICODE
> +	utf8_unload(sbi->s_encoding);
> +#endif
>  	kvfree(sbi);
>  }
>  
> @@ -3126,6 +3167,42 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	sb->s_maxbytes = sbi->max_file_blocks <<
>  				le32_to_cpu(raw_super->log_blocksize);
>  	sb->s_max_links = F2FS_LINK_MAX;
> +#ifdef CONFIG_UNICODE
> +	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
> +		const struct f2fs_sb_encodings *encoding_info;
> +		struct unicode_map *encoding;
> +		__u16 encoding_flags;
> +
> +		if (f2fs_sb_has_encrypt(sbi)) {
> +			f2fs_err(sbi,
> +				"Can't mount with encoding and encryption");

Should set error number.

> +			goto free_options;
> +		}
> +
> +		if (f2fs_sb_read_encoding(raw_super, &encoding_info,
> +					  &encoding_flags)) {
> +			f2fs_err(sbi,
> +				 "Encoding requested by superblock is unknown");

Ditto

> +			goto free_options;
> +		}
> +
> +		encoding = utf8_load(encoding_info->version);
> +		if (IS_ERR(encoding)) {
> +			f2fs_err(sbi,
> +				 "can't mount with superblock charset: %s-%s "
> +				 "not supported by the kernel. flags: 0x%x.",
> +				 encoding_info->name, encoding_info->version,
> +				 encoding_flags);

Ditto

> +			goto free_options;
> +		}
> +		f2fs_info(sbi, "Using encoding defined by superblock: "
> +			 "%s-%s with flags 0x%hx", encoding_info->name,
> +			 encoding_info->version?:"\b", encoding_flags);
> +
> +		sbi->s_encoding = encoding;
> +		sbi->s_encoding_flags = encoding_flags;
> +	}
> +#endif

How about wrapping these codes into function?

Thanks,

>  
>  #ifdef CONFIG_QUOTA
>  	sb->dq_op = &f2fs_quota_operations;
> @@ -3477,6 +3554,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  free_bio_info:
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>  		kvfree(sbi->write_io[i]);
> +
> +#ifdef CONFIG_UNICODE
> +	utf8_unload(sbi->s_encoding);
> +#endif
>  free_options:
>  #ifdef CONFIG_QUOTA
>  	for (i = 0; i < MAXQUOTAS; i++)
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 65559900d4d76..b7c9c7f721339 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -36,6 +36,11 @@
>  
>  #define F2FS_MAX_QUOTAS		3
>  
> +#define F2FS_ENC_UTF8_12_1	1
> +#define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
> +#define f2fs_has_strict_mode(sbi) \
> +	(sbi->s_encoding_flags & F2FS_ENC_STRICT_MODE_FL)
> +
>  #define F2FS_IO_SIZE(sbi)	(1 << F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
>  #define F2FS_IO_SIZE_KB(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 2)) /* KB */
>  #define F2FS_IO_SIZE_BYTES(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 12)) /* B */
> @@ -109,7 +114,9 @@ struct f2fs_super_block {
>  	struct f2fs_device devs[MAX_DEVICES];	/* device list */
>  	__le32 qf_ino[F2FS_MAX_QUOTAS];	/* quota inode numbers */
>  	__u8 hot_ext_count;		/* # of hot file extension */
> -	__u8 reserved[310];		/* valid reserved region */
> +	__le16  s_encoding;		/* Filename charset encoding */
> +	__le16  s_encoding_flags;	/* Filename charset encoding flags */
> +	__u8 reserved[306];		/* valid reserved region */
>  	__le32 crc;			/* checksum of superblock */
>  } __packed;
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
