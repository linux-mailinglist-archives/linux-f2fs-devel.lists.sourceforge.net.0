Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722F6B097
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jul 2019 22:46:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnULW-0006m3-5x; Tue, 16 Jul 2019 20:46:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hnULV-0006lw-FC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 20:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Of563W2gOUa6YeUVitbXM1FRja4ju4wwMgmeuQ+Udtw=; b=d9tztg8//UrIULwW89G5X1AVSF
 F2SqaUnbgW6xf2/IGqbFMl2M6OSgOTdgT4DxJdwI1bpfYkN8W23xk/zFmEE5RQyd/Zsy6w8req80X
 mdwJVVehqhiTD4EpYvFsMmOTWu0wt3nw/YMppS/pQJZ0iWVarKPwfyuUmm9DbzqZDfP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Of563W2gOUa6YeUVitbXM1FRja4ju4wwMgmeuQ+Udtw=; b=inpwE4nf2mwDFCC/iZgj3TvUE8
 l55o+Nz+M92T8kDpOvzEUQsqKp9UbwwmXtqdpoGGxB8FU6XO+048OvkrQwX4nK4yHe9TKnmBpravG
 KKoUax+SFsM2UrGU9u6PxTupb7n4ZQAsr76sDUdst0GtLTNm1m4kFvZW/v9hNWbdzxf8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnULQ-004DgG-OK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 20:46:45 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFE272145D;
 Tue, 16 Jul 2019 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563309995;
 bh=hf1kHilRo2b86FKLdptr/FM84ElXk/6EL+6g3vp0Hjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RRTxJiHNC+o/fh1xF0OFHblVJbQAxWfGn2Wd23Cj+bdMMwzaUlxNJ+PDUZaHsDfMG
 xOU2DsQcoVXmqjc96P5VB1FRo8b5cMJdrxjFh8smu4X7GUdGtANYCuaoAR2/XsCP76
 6AWgXNkNkpVr9qBRwoON4W+Sol6kLtmV71Q1QUrY=
Date: Tue, 16 Jul 2019 13:46:34 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20190716204634.GB99092@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190711204556.120381-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711204556.120381-1-drosen@google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hnULQ-004DgG-OK
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: include charset encoding
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daniel,

Could you please rebase you patch set?
e.g., f2fs_msg() was replaced with f2fs_err|info|...

On 07/11, Daniel Rosenberg wrote:
> Add charset encoding to f2fs to support casefolding. It is modeled after
> the same feature introduced in commit c83ad55eaa91 ("ext4: include charset
> encoding information in the superblock")
> 
> Currently this is not compatible with encryption, similar to the current
> ext4 imlpementation. This will change in the future.
> 
> >From the ext4 patch:
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
> index 06b89a9862ab2..0e101f699eccd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -150,6 +150,7 @@ struct f2fs_mount_info {
>  #define F2FS_FEATURE_LOST_FOUND		0x0200
>  #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
>  #define F2FS_FEATURE_SB_CHKSUM		0x0800
> +#define F2FS_FEATURE_CASEFOLD		0x1000
>  
>  #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>  	((raw_super->feature & cpu_to_le32(mask)) != 0)
> @@ -1162,6 +1163,10 @@ struct f2fs_sb_info {
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
> @@ -3565,6 +3570,7 @@ F2FS_FEATURE_FUNCS(quota_ino, QUOTA_INO);
>  F2FS_FEATURE_FUNCS(inode_crtime, INODE_CRTIME);
>  F2FS_FEATURE_FUNCS(lost_found, LOST_FOUND);
>  F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
> +F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6b959bbb336a3..a346f5a01370b 100644
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
> @@ -211,6 +212,36 @@ void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...)
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
>  	block_t limit = (sbi->user_block_count << 1) / 1000;
> @@ -812,6 +843,13 @@ static int parse_options(struct super_block *sb, char *options)
>  		return -EINVAL;
>  	}
>  #endif
> +#ifndef CONFIG_UNICODE
> +	if (f2fs_sb_has_casefold(sbi)) {
> +		f2fs_msg(sb, KERN_ERR,
> +			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
> +		return -EINVAL;
> +	}
> +#endif
>  
>  	if (F2FS_IO_SIZE_BITS(sbi) && !test_opt(sbi, LFS)) {
>  		f2fs_msg(sb, KERN_ERR,
> @@ -1110,6 +1148,9 @@ static void f2fs_put_super(struct super_block *sb)
>  	destroy_percpu_info(sbi);
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>  		kvfree(sbi->write_io[i]);
> +#ifdef CONFIG_UNICODE
> +	utf8_unload(sbi->s_encoding);
> +#endif
>  	kvfree(sbi);
>  }
>  
> @@ -3157,6 +3198,42 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
> +			f2fs_msg(sb, KERN_ERR,
> +				 "Can't mount with encoding and encryption");
> +			goto free_options;
> +		}
> +
> +		if (f2fs_sb_read_encoding(raw_super, &encoding_info,
> +					  &encoding_flags)) {
> +			f2fs_msg(sb, KERN_ERR,
> +				 "Encoding requested by superblock is unknown");
> +			goto free_options;
> +		}
> +
> +		encoding = utf8_load(encoding_info->version);
> +		if (IS_ERR(encoding)) {
> +			f2fs_msg(sb, KERN_ERR,
> +				 "can't mount with superblock charset: %s-%s "
> +				 "not supported by the kernel. flags: 0x%x.",
> +				 encoding_info->name, encoding_info->version,
> +				 encoding_flags);
> +			goto free_options;
> +		}
> +		f2fs_msg(sb, KERN_INFO, "Using encoding defined by superblock: "
> +			 "%s-%s with flags 0x%hx", encoding_info->name,
> +			 encoding_info->version?:"\b", encoding_flags);
> +
> +		sbi->s_encoding = encoding;
> +		sbi->s_encoding_flags = encoding_flags;
> +	}
> +#endif
>  
>  #ifdef CONFIG_QUOTA
>  	sb->dq_op = &f2fs_quota_operations;
> @@ -3511,6 +3588,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
