Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D590C236
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 05:04:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJP99-0004bW-2v;
	Tue, 18 Jun 2024 03:04:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJP97-0004bP-I4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 03:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ks1eXCGRXSzM2UF4QmVA9y4YRM6SsWWtm06UMYRX1Hs=; b=ECvYKZiiBfIAemWD26CLJn/W6I
 cznymI/G9v+F9fIV5eM2vlckdjS4P9gaXwYZVhq1wN3VNwdXVt2lOy0YjBwux+csHeqH+bFQiV/xj
 7amqOFV7TeFK3EAqKZ9UaT22o+AGGYP8kUa4cXDstxcTMEQOaRjM1d8Kd0eUn1+/LX2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ks1eXCGRXSzM2UF4QmVA9y4YRM6SsWWtm06UMYRX1Hs=; b=dj8gHnzHjR+8hgj4uCeYRhiK0b
 NirasZFOD2LPN4MTHGii8lPYALnvdDJOBYc4U9dVhNM/7u1FhNdeQX/QpaKV0W8+wS487fvaPw442
 bIJXDgxN6ifs/pij47sU1mcRY5fPviEOjCdBPu1zIjKYtLdxi/hIcYPvZQBoS9TCcfiI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJP97-0002yK-JV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 03:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C304CE1934;
 Tue, 18 Jun 2024 03:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F0FC2BD10;
 Tue, 18 Jun 2024 03:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718679860;
 bh=6zex10JdKWI5HrbQOQXxplme+gazghXqPQBVPelLR6I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=svnjFOU38R19vv3gxeJw12auHkOaxS1O6gLaA9aYS5h9VQgGKhqRSCHhVaOa6yXJv
 gJOlSo5wDHtAVt1MXkDODjSS5KcVfQdAts6IXlXmwEmLUhDXtIyuDwbL3IMGcuVf/6
 DQaI51JP23y6Uxm+Z5tUfbpR+C4qBTBK28aTzAhMgN1/2y50VKhcjX34ehyo8VJPD7
 I4d9u3ZZmw+qCxT4r7njBrAkkZi4iFykeLDTBz59Hb2Phy3fDgWvYaB8kiglJZoZdK
 PduNOTEboLt4yi0rs7TQhRBWgwbicoaTnxtnjwlkCsTsdZ1jmQXT5GrYpBNlmZGA8H
 631SZlbGUfoDw==
Message-ID: <04825e07-04d4-4eef-8b06-1e2329880612@kernel.org>
Date: Tue, 18 Jun 2024 11:04:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240617071114.150721-1-xiuhong.wang@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240617071114.150721-1-xiuhong.wang@unisoc.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/17 15:11,
 Xiuhong Wang wrote: > When using the f2fs_io tool to set_verity,
 it will fail as follows: > unisc:/data # ./f2fs_io set_verity
 file > FS_IOC_ENABLE_VERITY: Inappropriate ioctl for [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJP97-0002yK-JV
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix do_set_verity ioctl fail
 issue
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hao_hao.wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/17 15:11, Xiuhong Wang wrote:
> When using the f2fs_io tool to set_verity, it will fail as follows:
> unisc:/data # ./f2fs_io set_verity file
> FS_IOC_ENABLE_VERITY: Inappropriate ioctl for device
> this is because commit: 95ae251fe828 ("f2fs: add fs-verity support"),
> the passed parameters do not match the latest kernel version.
> 
> After patch:
> unisoc:/data # ./f2fs_io set_verity file
> Set fsverity bit to file
> unisoc:/data # ./f2fs_io getflags file
> get a flag on file ret=0, flags=verity
> 
> Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   include/android_config.h |  1 +
>   tools/f2fs_io/f2fs_io.c  |  9 ++++++---
>   tools/f2fs_io/f2fs_io.h  | 20 ++++++++++++++++++--
>   3 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/include/android_config.h b/include/android_config.h
> index 05b686e..9c8b163 100644
> --- a/include/android_config.h
> +++ b/include/android_config.h
> @@ -13,6 +13,7 @@
>   #define HAVE_LINUX_XATTR_H 1
>   #define HAVE_LINUX_FS_H 1
>   #define HAVE_LINUX_FIEMAP_H 1
> +#define HAVE_LINUX_VERITY_H 1
>   #define HAVE_MNTENT_H 1
>   #define HAVE_STDLIB_H 1
>   #define HAVE_STRING_H 1
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index a7b593a..2447490 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -182,16 +182,19 @@ static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
>   static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
>   {
>   	int ret, fd;
> +	struct fsverity_enable_arg args = {.version = 1};
> +
> +	args.hash_algorithm = FS_VERITY_HASH_ALG_SHA256;
> +	args.block_size = 4096;
>   
>   	if (argc != 2) {
>   		fputs("Excess arguments\n\n", stderr);
>   		fputs(cmd->cmd_help, stderr);
>   		exit(1);
>   	}
> +	fd = open(argv[1], O_RDONLY);
>   
> -	fd = open(argv[1], O_RDWR);

It needs write permission?

Thanks,

> -
> -	ret = ioctl(fd, FS_IOC_ENABLE_VERITY);
> +	ret = ioctl(fd, FS_IOC_ENABLE_VERITY, &args);
>   	if (ret < 0) {
>   		perror("FS_IOC_ENABLE_VERITY");
>   		exit(1);
> diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> index b5c82f5..e55db5f 100644
> --- a/tools/f2fs_io/f2fs_io.h
> +++ b/tools/f2fs_io/f2fs_io.h
> @@ -16,6 +16,9 @@
>   #ifdef HAVE_LINUX_FS_H
>   #include <linux/fs.h>
>   #endif
> +#ifdef HAVE_LINUX_VERITY_H
> +#include <linux/fsverity.h>
> +#endif
>   
>   #include <sys/types.h>
>   
> @@ -136,8 +139,21 @@ struct fscrypt_get_policy_ex_arg {
>   #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
>   #define F2FS_IOC_GET_ENCRYPTION_PWSALT	FS_IOC_GET_ENCRYPTION_PWSALT
>   
> -#define FS_IOC_ENABLE_VERITY		_IO('f', 133)
> -
> +#ifndef FS_IOC_ENABLE_VERITY
> +#define FS_IOC_ENABLE_VERITY    _IOW('f', 133, struct fsverity_enable_arg)
> +#define FS_VERITY_HASH_ALG_SHA256       1
> +struct fsverity_enable_arg {
> +	__u32 version;
> +	__u32 hash_algorithm;
> +	__u32 block_size;
> +	__u32 salt_size;
> +	__u64 salt_ptr;
> +	__u32 sig_size;
> +	__u32 __reserved1;
> +	__u64 sig_ptr;
> +	__u64 __reserved2[11];
> +};
> +#endif
>   /*
>    * Inode flags
>    */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
