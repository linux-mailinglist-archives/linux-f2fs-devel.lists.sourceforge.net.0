Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8371C6922
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 08:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWDk1-0005fN-WA; Wed, 06 May 2020 06:41:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWDjv-0005f3-6n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 06:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2/vxKWO/vPwI1BSSqF+geZ7m2NMm9WfcyqmaDwiXlw=; b=ak6CJZMP8XLAKf91xWymVaRD2p
 ftyyo4mq3aRF7Wi1t1euKiyb260nBi887EbFcroXfXOmmXogm+I0DNCVzjRSn843xHqvzk94LCsKL
 cqiKftY7Lredgr1R3morb7cuIMNZiRVkGhMliuwVdADeK0PZBnRd18cxa73DZzqc0evo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N2/vxKWO/vPwI1BSSqF+geZ7m2NMm9WfcyqmaDwiXlw=; b=KrDPm9YfpCgU8ls3VfIZipijJ2
 jAasBF7NtVvOT8wOzEPQuddi5U6u25oywLAvGdwHiPZ1jHhbPI/e6BZWsfu5besVt3NIcS0Nxb098
 2XGKWMotIFhlw/VVahA00Q3AurtY9Gxdeacbpd7rAOMLUP36Xs/uUM2hMG0Y+tgRm/hQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWDjt-009KU2-5G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 06:41:07 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 87C078332E4F60FA081F;
 Wed,  6 May 2020 14:40:55 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 6 May 2020
 14:40:52 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200502002920.76569-1-jaegeuk@kernel.org>
 <20200502002920.76569-3-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <38429e30-cd8c-6169-2d4f-90e56a9d202f@huawei.com>
Date: Wed, 6 May 2020 14:40:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200502002920.76569-3-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWDjt-009KU2-5G
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs_io: show more flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/2 8:29, Jaegeuk Kim wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  tools/f2fs_io/f2fs_io.c | 28 ++++++++++++++++++++++++++++
>  tools/f2fs_io/f2fs_io.h | 12 ++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 9be99f0..d1889ff 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -186,6 +186,10 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
>  "f2fs_io getflags [file]\n\n"					\
>  "get a flag given the file\n"					\
>  "flag can show \n"						\
> +"  encryption\n"						\
> +"  nocow(pinned)\n"						\
> +"  inline_data\n"						\
> +"  verity\n"							\
>  "  casefold\n"							\
>  "  compression\n"						\
>  "  nocompression\n"
> @@ -222,6 +226,30 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
>  		printf("nocompression");
>  		exist = 1;
>  	}
> +	if (flag & FS_ENCRYPT_FL) {
> +		if (exist)
> +			printf(",");
> +		printf("encrypt");
> +		exist = 1;
> +	}
> +	if (flag & FS_VERITY_FL) {
> +		if (exist)
> +			printf(",");
> +		printf("verity");
> +		exist = 1;
> +	}
> +	if (flag & FS_INLINE_DATA_FL) {
> +		if (exist)
> +			printf(",");
> +		printf("inline_data");
> +		exist = 1;
> +	}
> +	if (flag & FS_NOCOW_FL) {
> +		if (exist)
> +			printf(",");
> +		printf("nocow(pinned)");
> +		exist = 1;
> +	}
>  	if (!exist)
>  		printf("none");
>  	printf("\n");
> diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> index c6ea7ff..2c828bc 100644
> --- a/tools/f2fs_io/f2fs_io.h
> +++ b/tools/f2fs_io/f2fs_io.h
> @@ -110,6 +110,18 @@ typedef u32	__be32;
>  #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
>  #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
>  
> +#ifndef FS_ENCRYPT_FL
> +#define FS_ENCRYPT_FL			0x00000800 /* Encrypted file */
> +#endif
> +#ifndef FS_VERITY_FL
> +#define FS_VERITY_FL			0x00100000 /* Verity protected inode */
> +#endif
> +#ifndef FS_INLINE_DATA_FL
> +#define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */

/* Inline data regular/symlink */

> +#endif
> +#ifndef FS_NOCOW_FL
> +#define FS_NOCOW_FL			0x00800000 /* Do not cow file */
> +#endif
>  #ifndef FS_NOCOMP_FL
>  #define FS_NOCOMP_FL			0x00000400 /* Don't compress */
>  #endif
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
