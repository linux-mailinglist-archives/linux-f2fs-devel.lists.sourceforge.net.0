Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9F36C610
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 14:29:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbMq1-0002ie-Ml; Tue, 27 Apr 2021 12:29:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lbMpz-0002iU-O4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 12:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YtkxsqAlHaLg3Y/Ex6mgmE1+S7y+qLo09uDOf15n3RE=; b=eaqon/pZz76uOVALunxOl6PWCf
 nrBOS05fIVsdj7+6F072QGpRk73NJMQUY6GpW30k8gNP9+FRr/PvAR0qmrbXO9DOb82D3MLNZfTK5
 4pCBm3nQlHtJDQiVH/OvYPGFkbzsWfYT8Kvb4HGibcj680aiZlGoJZCNbvvjK34m7/ac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YtkxsqAlHaLg3Y/Ex6mgmE1+S7y+qLo09uDOf15n3RE=; b=XRyJxN/lGOAoOJr5rB8u+UDf2H
 VRifYgLljRGrjUqrzWUNYYQ2/7R2DSuc9nne0Gx5hcDnLzlwbqrgN//GlMCLkClO69a61D0zLb6v8
 rQCfCcJw1RegSxlsf5AOeAlCSpu+OcoFBgDvMxbfwGq4QMLjrD/ZuGUcMT+lf0gWwSQI=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbMpw-00GwlL-6D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 12:29:11 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FV1G70rK5z19Jw1;
 Tue, 27 Apr 2021 20:26:23 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 27 Apr
 2021 20:28:49 +0800
To: Fengnan Chang <changfengnan@vivo.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210422112515.1216-1-changfengnan@vivo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <755d653a-3fcd-b2be-f7c2-025dc24471cc@huawei.com>
Date: Tue, 27 Apr 2021 20:28:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210422112515.1216-1-changfengnan@vivo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lbMpw-00GwlL-6D
Subject: Re: [f2fs-dev] [PATCH] f2fs: add no compress extensions support
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

On 2021/4/22 19:25, Fengnan Chang wrote:
> When we create a directory with enable compression, all file write into
> directory will try to compress.But sometimes we may know, new file
> cannot meet compression ratio requirements.
> We need a nocompress extension to skip those files to avoid unnecessary
> compress page test.
> There are a few limits about no compress extensions:
> 1. The same extension name cannot not appear in both compress and
> non-compress extension at the same time.
> 2. If the compress extension specifies all files, the types specified by
> the non-compress extension will be treated as special cases and will
> not be compressed.
> 3. Don't allow the non-compress extension specifies all files.

Should add priority here and in doc?

> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   Documentation/filesystems/f2fs.rst |  9 ++++
>   fs/f2fs/f2fs.h                     |  2 +
>   fs/f2fs/namei.c                    | 19 +++++--
>   fs/f2fs/super.c                    | 81 ++++++++++++++++++++++++++++--
>   4 files changed, 103 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 63c0c49b726d..7cfcd8ee0270 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -297,6 +297,15 @@ inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
>   			 Documentation/block/inline-encryption.rst.
>   atgc			 Enable age-threshold garbage collection, it provides high
>   			 effectiveness and efficiency on background GC.
> +nocompress_extension=%s	 Support adding specified extension, so that f2fs can disable
> +            compression on those corresponding files, just contrary to compression extension.
> +            If you know exactly which files cannot be compressed, you can use this.
> +            The same extension name cannot not appear in both compress and non-compress

unneeded 'not'

> +            extension at the same time.
> +            If the compress extension specifies all files, the types specified by the
> +            non-compress extension will be treated as special cases and will not be
> +            compressed.
> +            Don't allow the non-compress extension specifies all files.

Description should align as other section, and it will be better to let
this stay with 'compress_extension', I mean relocate this section after
'compress_extension' one.

>   ======================== ============================================================
> 
>   Debugfs Entries
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 87d734f5589d..3d5d28a2568f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -150,8 +150,10 @@ struct f2fs_mount_info {
>   	unsigned char compress_level;		/* compress level */
>   	bool compress_chksum;			/* compressed data chksum */
>   	unsigned char compress_ext_cnt;		/* extension count */
> +	unsigned char nocompress_ext_cnt;		/* nocompress extension count */
>   	int compress_mode;			/* compression mode */
>   	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
> +	unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
>   };
> 
>   #define F2FS_FEATURE_ENCRYPT		0x0001
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 405d85dbf9f1..ab9370c3886f 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -279,14 +279,16 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>   						const unsigned char *name)
>   {
>   	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> +	unsigned char (*noext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).noextensions;
>   	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> -	unsigned int ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
>   	int i, cold_count, hot_count;
> 
>   	if (!f2fs_sb_has_compression(sbi) ||
> -			is_inode_flag_set(inode, FI_COMPRESSED_FILE) ||
>   			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
> -			!f2fs_may_compress(inode))
> +			!f2fs_may_compress(inode) ||
> +			(!ext_cnt && !noext_cnt))
>   		return;
> 
>   	down_read(&sbi->sb_lock);
> @@ -303,12 +305,21 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> 
>   	up_read(&sbi->sb_lock);
> 
> +	for (i = 0; i < noext_cnt; i++) {
> +		if (is_extension_exist(name, noext[i])) {
> +			f2fs_disable_compressed_file(inode);
> +			return;
> +		}
> +	}
> +
> +	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
> +		return;
> +
>   	ext = F2FS_OPTION(sbi).extensions;
> 
>   	for (i = 0; i < ext_cnt; i++) {
>   		if (!is_extension_exist(name, ext[i]))
>   			continue;
> -

Unrelated change.

>   		set_compress_context(inode);
>   		return;
>   	}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5020152aa8fc..04410a3831a2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -153,6 +153,7 @@ enum {
>   	Opt_atgc,
>   	Opt_gc_merge,
>   	Opt_nogc_merge,
> +	Opt_nocompress_extension,

Stay with Opt_compress_extension?

>   	Opt_err,
>   };
> 
> @@ -227,6 +228,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_atgc, "atgc"},
>   	{Opt_gc_merge, "gc_merge"},
>   	{Opt_nogc_merge, "nogc_merge"},
> +	{Opt_nocompress_extension, "nocompress_extension=%s"},

Ditto,

>   	{Opt_err, NULL},
>   };
> 
> @@ -473,6 +475,43 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
>   }
> 
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> +/*
> + * 1. The same extension name cannot not appear in both compress and non-compress extension
> + * at the same time.
> + * 2. If the compress extension specifies all files, the types specified by the non-compress
> + * extension will be treated as special cases and will not be compressed.
> + * 3. Don't allow the non-compress extension specifies all files.
> + */
> +static int f2fs_test_compress_extension(struct f2fs_sb_info *sbi)
> +{
> +	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> +	unsigned char (*noext)[F2FS_EXTENSION_LEN];
> +	int ext_cnt, noext_cnt, index = 0, no_index = 0;
> +
> +	ext = F2FS_OPTION(sbi).extensions;
> +	ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +	noext = F2FS_OPTION(sbi).noextensions;
> +	noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
> +
> +	if (!ext_cnt || !noext_cnt)
> +		return 0;
> +
> +	for (no_index = 0; no_index < noext_cnt; no_index++) {
> +		if (!strcasecmp("*", noext[no_index])) {
> +			f2fs_info(sbi, "Don't allow the non-compress extension specifies all files");
> +			return -EINVAL;
> +		}
> +		for (index = 0; index < ext_cnt; index++) {
> +			if (!strcasecmp(ext[index], noext[no_index])) {
> +				f2fs_info(sbi, "Don't allow the same extension %s appear in both compress and non-compress extension",
> +						ext[index]);
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
>   #ifdef CONFIG_F2FS_FS_LZ4
>   static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
>   {
> @@ -546,7 +585,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   	substring_t args[MAX_OPT_ARGS];
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> -	int ext_cnt;
> +	unsigned char (*noext)[F2FS_EXTENSION_LEN];
> +	int ext_cnt, noext_cnt;
>   #endif
>   	char *p, *name;
>   	int arg = 0;
> @@ -592,7 +632,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			break;
>   		case Opt_norecovery:
>   			/* this option mounts f2fs with ro */
> -			set_opt(sbi, NORECOVERY);
> +		set_opt(sbi, NORECOVERY);

Unneeded change.

>   			if (!f2fs_readonly(sb))
>   				return -EINVAL;
>   			break;
> @@ -1049,6 +1089,30 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			F2FS_OPTION(sbi).compress_ext_cnt++;
>   			kfree(name);
>   			break;
> +		case Opt_nocompress_extension:
> +			if (!f2fs_sb_has_compression(sbi)) {
> +				f2fs_info(sbi, "Image doesn't support compression");
> +				break;
> +			}
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +
> +			noext = F2FS_OPTION(sbi).noextensions;
> +			noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
> +
> +			if (strlen(name) >= F2FS_EXTENSION_LEN ||
> +				noext_cnt >= COMPRESS_EXT_NUM) {
> +				f2fs_err(sbi,
> +					"invalid extension length/number");
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +
> +			strcpy(noext[noext_cnt], name);
> +			F2FS_OPTION(sbi).nocompress_ext_cnt++;
> +			kfree(name);
> +			break;
>   		case Opt_compress_chksum:
>   			F2FS_OPTION(sbi).compress_chksum = true;
>   			break;
> @@ -1072,6 +1136,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		case Opt_compress_extension:
>   		case Opt_compress_chksum:
>   		case Opt_compress_mode:
> +		case Opt_nocompress_extension:

Stay with Opt_compress_extension?

>   			f2fs_info(sbi, "compression options not supported");
>   			break;
>   #endif
> @@ -1121,7 +1186,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		return -EINVAL;
>   	}
>   #endif
> -

Blank

> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_test_compress_extension(sbi)) {
> +		f2fs_err(sbi, "invalid compress or nocompress extension");
> +		return -EINVAL;
> +	}
> +#endif

Blank

>   	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
>   		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
>   			 F2FS_IO_SIZE_KB(sbi));
> @@ -1664,7 +1734,10 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>   		seq_printf(seq, ",compress_extension=%s",
>   			F2FS_OPTION(sbi).extensions[i]);
>   	}
> -

Blank

> +	for (i = 0; i < F2FS_OPTION(sbi).nocompress_ext_cnt; i++) {
> +		seq_printf(seq, ",nocompress_extension=%s",
> +			F2FS_OPTION(sbi).noextensions[i]);
> +	}

Blank

>   	if (F2FS_OPTION(sbi).compress_chksum)
>   		seq_puts(seq, ",compress_chksum");
> 
> --
> 2.29.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
