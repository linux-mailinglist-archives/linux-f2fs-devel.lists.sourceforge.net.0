Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8735FFA1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Apr 2021 03:32:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWqrp-0000l0-1V; Thu, 15 Apr 2021 01:32:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lWqrn-0000kj-Dn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Apr 2021 01:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+6rOsBXZAESM5i6bJ0IPP2w3gpfgR8GqZJYJ0pkiReM=; b=jccHkpk7XdJw+kl87vZ/+GFdZS
 hqFeGoUZGqKSJ0dWkYHC6dxQPcmBP1ohFsbjqU/l83GGOhw7aIpemn89esNtAcpHQvfcoLjQyNiKr
 ZrZ+gkOgU7QUqx3kDkX9K7Ujj/tRTp6VYuPjGjwYoGbsx5FMUbKaoTy6GJ7tX8TpRBQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+6rOsBXZAESM5i6bJ0IPP2w3gpfgR8GqZJYJ0pkiReM=; b=hbd5p1CNqZQTGQKf6cz5NW4dpq
 oXQRb2Nw6Ruq0EV+H5WRo76q1+nBCZ3ESCitq+5um4Dhs1ASQhgtWMtDl0dGz/T61nLC7Z23G5lv3
 QqUt1G++U7igMsB44SR1daa4ReeglZMqiSbD/GX6Hdj2DMNaoQFrhG/5bbY1+TCo8hRk=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lWqrd-006e1k-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Apr 2021 01:32:23 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FLMFK2KYBzPqH5;
 Thu, 15 Apr 2021 09:29:09 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 15 Apr
 2021 09:31:57 +0800
To: Fengnan Chang <changfengnan@vivo.com>
References: <20210414094716.884-1-changfengnan@vivo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1afb380c-b527-3deb-bdc5-e6aa9055d203@huawei.com>
Date: Thu, 15 Apr 2021 09:31:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210414094716.884-1-changfengnan@vivo.com>
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
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lWqrd-006e1k-Sc
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: add no compress extensions support
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Fengnan,

On 2021/4/14 17:47, Fengnan Chang wrote:
> When we create a directory with enable compression, all file write into
> directory will try to compress.But sometimes we may know, new file cannot
> meet compression ratio requirements.
> We need a nocompress extension to skip those files to avoid unnecessary
> compress page test.

Could you please elaborate your detail usage scenario? something like in
which directory, what kind of specified extension do you want to disable?

It's a bit complicated for below cases:
compress_extension = "abc" and nocompress_extension = "abc" or
compress_extension = "*" and nocompress_extension = "abc" or
compress_extension = "abc" and nocompress_extension = "*"

Thanks,

> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/f2fs.h  |  2 ++
>   fs/f2fs/namei.c | 12 +++++++++++-
>   fs/f2fs/super.c | 35 +++++++++++++++++++++++++++++++++--
>   3 files changed, 46 insertions(+), 3 deletions(-)
> 
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
> index 405d85dbf9f1..09b76a7f048a 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -280,15 +280,25 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>   {
>   	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
>   	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> +	unsigned char (*noext)[F2FS_EXTENSION_LEN];
>   	unsigned int ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +	unsigned int noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
>   	int i, cold_count, hot_count;
> 
>   	if (!f2fs_sb_has_compression(sbi) ||
> -			is_inode_flag_set(inode, FI_COMPRESSED_FILE) ||
>   			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
>   			!f2fs_may_compress(inode))
>   		return;
> 
> +	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE)) {
> +		noext = F2FS_OPTION(sbi).noextensions;
> +		for (i = 0; i < noext_cnt; i++) {
> +			if (is_extension_exist(name, noext[i]))
> +				f2fs_disable_compressed_file(inode);
> +		}
> +		return;
> +	}
> +
>   	down_read(&sbi->sb_lock);
> 
>   	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5020152aa8fc..b5a9ba8ea869 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -153,6 +153,7 @@ enum {
>   	Opt_atgc,
>   	Opt_gc_merge,
>   	Opt_nogc_merge,
> +	Opt_nocompress_extension,
>   	Opt_err,
>   };
> 
> @@ -227,6 +228,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_atgc, "atgc"},
>   	{Opt_gc_merge, "gc_merge"},
>   	{Opt_nogc_merge, "nogc_merge"},
> +	{Opt_nocompress_extension, "nocompress_extension=%s"},
>   	{Opt_err, NULL},
>   };
> 
> @@ -546,7 +548,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   	substring_t args[MAX_OPT_ARGS];
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> -	int ext_cnt;
> +	unsigned char (*noext)[F2FS_EXTENSION_LEN];
> +	int ext_cnt, noext_cnt;
>   #endif
>   	char *p, *name;
>   	int arg = 0;
> @@ -1049,6 +1052,30 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
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
> @@ -1072,6 +1099,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		case Opt_compress_extension:
>   		case Opt_compress_chksum:
>   		case Opt_compress_mode:
> +		case Opt_nocompress_extension:
>   			f2fs_info(sbi, "compression options not supported");
>   			break;
>   #endif
> @@ -1664,7 +1692,10 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>   		seq_printf(seq, ",compress_extension=%s",
>   			F2FS_OPTION(sbi).extensions[i]);
>   	}
> -
> +	for (i = 0; i < F2FS_OPTION(sbi).nocompress_ext_cnt; i++) {
> +		seq_printf(seq, ",nocompress_extension=%s",
> +			F2FS_OPTION(sbi).noextensions[i]);
> +	}
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
