Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 243E8CF75D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 09:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C21dUA/gzfFWWGveVWsiLSKf7ThIgiYFVGJxO4jsIZU=; b=bShQZRieUPbSBTDZvAzb41ebnt
	qGF2LXrpCia1qGsWFyGca1C6s7Xha4ylvAooeaEPwcqMJnp3GXh7TpV0yhO3DJWWj7cBv3+OOiY/u
	cjhOnhfhjrjTPicrN7ZhdalFjhXpeOYwUHiiFjaN6vibC0SMPV+RVASZo6LXenG7XuJk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd2pI-0004sG-EU;
	Tue, 06 Jan 2026 08:54:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd2pH-0004s9-IR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDM4iSSyyXbWnUZj5zE2IBFk/2w9i2fXCYa7r0XTmuY=; b=fzN8CcACcFaKUiideAIcY0B0QY
 gCmopr+b/9ZeCEYuAVKxKiIUbkK9dykDwYkZrQUoQZJSJtAMjJ88lmRhsNFO/yW6Tn5F1Izdb/cCW
 mM2zL3NySxLQYh90FGnjpBO3sc5krg+H79UgSrhsf5tzD8+gvCGuooH/6dXu/+YnpRaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zDM4iSSyyXbWnUZj5zE2IBFk/2w9i2fXCYa7r0XTmuY=; b=QiE2oB3qHzWuASQxkvTuCzIJa5
 tv6ImkQbuTJm6ZPgb1zu/Xk5M13Sdt19V/mo6F+dP68KN3cRPMSaMxXzOCEuBTHONhLcnr29AT9kh
 9cuYlNKHSO6KZEhswheyFoO7qan1ar97UIgmOkHJ03Mzu3ZYCBi8fp23HSKz2ZJXSxq0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd2pG-0000Ku-UO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D72D40762;
 Tue,  6 Jan 2026 08:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C888BC116C6;
 Tue,  6 Jan 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767689632;
 bh=0wQZg/gGiFq8a2Wf5H+GrdVFiF4+e3Wok0vo8HNhEF8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=m4If+Kkdz6yiDveK7x4icfBy1IWrKLfUI7QFIL34pkv2RilaKhbwWgEIPpdaDMEpr
 iHMPcRsTWhNoqWDWw9p7PaFKtglt8Vewy1P0ftKbdSXTzkvTzdN65hcj5A5Nh+RNiB
 hmlfy/lrII4hmG+AdgOcqOg7iiFrKtKeCRq25wuGgAzrsx/ibwnTR4uizAxV3LF5Cs
 CULyvX9SoiwOhvMLHDFg6RJ2GZ/5jTSN+451AWzOtC1pzG7yhDlYYvHHNfLAdKimFR
 irsTZvBwJm3yX8Bo/DbtGWpgSAY8HWejV7oVme8l9II1TkZU5PCQklyaFOELmB4KGr
 XX4FxLe4kS9aA==
Message-ID: <5a541cbd-f09c-4416-bf42-6ae29b188947@kernel.org>
Date: Tue, 6 Jan 2026 16:53:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty.pavel.devel@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
Content-Language: en-US
In-Reply-To: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/31/2025 9:54 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > Some f2fs sysfs attributes suffer from
 out-of-bounds memory access and > incorrect handling of integer v [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd2pG-0000Ku-UO
Subject: Re: [f2fs-dev] [PATCH RESEND 1/2] f2fs: fix out-of-bounds access in
 sysfs attribute read/write
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/31/2025 9:54 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Some f2fs sysfs attributes suffer from out-of-bounds memory access and
> incorrect handling of integer values whose size is not 4 bytes.
> 
> For example:
> vm:~# echo 65537 > /sys/fs/f2fs/vde/gc_pin_file_thresh
> vm:~# cat /sys/fs/f2fs/vde/gc_pin_file_thresh

It seems the root cause here is we check w/ wrong sysfs filename.

I fixed this in a separated patch below:

https://lore.kernel.org/linux-f2fs-devel/20260106063117.29975-1-chao@kernel.org

> 65537
> vm:~# echo 4294967297 > /sys/fs/f2fs/vde/atgc_age_threshold
> vm:~# cat /sys/fs/f2fs/vde/atgc_age_threshold
> 1
> 
> gc_pin_file_thresh maps to {struct f2fs_sb_info}->gc_pin_file_threshold,
> which is a 16-bit integer. However, the sysfs interface allows setting
> it to a value larger than SHRT_MAX, resulting in an out-of-range update.
> 
> atgc_age_threshold maps to {struct atgc_management}->age_threshold,
> which is a 64-bit integer, but its sysfs interface cannot correctly set
> values larger than UINT_MAX.
> 
> The root causes are:
> 1. __sbi_store() treats all default values as unsigned int, which
> prevents updating integers larger than 4 bytes and causes out-of-bounds
> writes for integers smaller than 4 bytes.
> 
> 2. f2fs_sbi_show() also assumes all default values are unsigned int,
> leading to out-of-bounds reads and incorrect access to integers larger
> than 4 bytes.
> 
> This patch introduces {struct f2fs_attr}->size to record the actual size
> of the integer associated with each sysfs attribute. With this
> information, sysfs read and write operations can correctly access and
> update values according to their real data size, avoiding memory
> corruption and truncation.
> 

Need to add Cc and Fixes tag?

> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/sysfs.c | 60 ++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 52 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index c42f4f979d13..e6a98ddd73b3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -58,6 +58,7 @@ struct f2fs_attr {
>   			 const char *buf, size_t len);
>   	int struct_type;
>   	int offset;
> +	int size;
>   	int id;
>   };
>   
> @@ -344,11 +345,30 @@ static ssize_t main_blkaddr_show(struct f2fs_attr *a,
>   			(unsigned long long)MAIN_BLKADDR(sbi));
>   }
>   
> +static ssize_t __sbi_show_value(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf,
> +		unsigned char *value)
> +{
> +	switch (a->size) {
> +	case 1:
> +		return sysfs_emit(buf, "%u\n", *(u8 *)value);
> +	case 2:
> +		return sysfs_emit(buf, "%u\n", *(u16 *)value);
> +	case 4:
> +		return sysfs_emit(buf, "%u\n", *(u32 *)value);
> +	case 8:
> +		return sysfs_emit(buf, "%llu\n", *(u64 *)value);
> +	default:
> +		f2fs_bug_on(sbi, 1);
> +		return sysfs_emit(buf,
> +				"show sysfs node value with wrong type\n");
> +	}
> +}
> +
>   static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   			struct f2fs_sb_info *sbi, char *buf)
>   {
>   	unsigned char *ptr = NULL;
> -	unsigned int *ui;
>   
>   	ptr = __struct_ptr(sbi, a->struct_type);
>   	if (!ptr)
> @@ -428,9 +448,30 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   				atomic_read(&sbi->cp_call_count[BACKGROUND]));
>   #endif
>   
> -	ui = (unsigned int *)(ptr + a->offset);
> +	return __sbi_show_value(a, sbi, buf, ptr + a->offset);
> +}
>   
> -	return sysfs_emit(buf, "%u\n", *ui);
> +static void __sbi_store_value(struct f2fs_attr *a,
> +			struct f2fs_sb_info *sbi,
> +			unsigned char *ui, unsigned long value)
> +{
> +	switch (a->size) {
> +	case 1:
> +		*(u8 *)ui = value;
> +		break;
> +	case 2:
> +		*(u16 *)ui = value;
> +		break;
> +	case 4:
> +		*(u32 *)ui = value;
> +		break;
> +	case 8:
> +		*(u64 *)ui = value;
> +		break;
> +	default:
> +		f2fs_bug_on(sbi, 1);
> +		f2fs_err(sbi, "store sysfs node value with wrong type");
> +	}
>   }
>   
>   static ssize_t __sbi_store(struct f2fs_attr *a,
> @@ -906,7 +947,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> -	*ui = (unsigned int)t;
> +	__sbi_store_value(a, sbi, ptr + a->offset, t);
>   
>   	return count;
>   }
> @@ -1053,24 +1094,27 @@ static struct f2fs_attr f2fs_attr_sb_##_name = {		\
>   	.id	= F2FS_FEATURE_##_feat,				\
>   }
>   
> -#define F2FS_ATTR_OFFSET(_struct_type, _name, _mode, _show, _store, _offset) \
> +#define F2FS_ATTR_OFFSET(_struct_type, _name, _mode, _show, _store, _offset, _size) \
>   static struct f2fs_attr f2fs_attr_##_name = {			\
>   	.attr = {.name = __stringify(_name), .mode = _mode },	\
>   	.show	= _show,					\
>   	.store	= _store,					\
>   	.struct_type = _struct_type,				\
> -	.offset = _offset					\
> +	.offset = _offset,					\
> +	.size = _size						\
>   }
>   
>   #define F2FS_RO_ATTR(struct_type, struct_name, name, elname)	\
>   	F2FS_ATTR_OFFSET(struct_type, name, 0444,		\
>   		f2fs_sbi_show, NULL,				\
> -		offsetof(struct struct_name, elname))
> +		offsetof(struct struct_name, elname),		\
> +		sizeof_field(struct struct_name, elname))
>   
>   #define F2FS_RW_ATTR(struct_type, struct_name, name, elname)	\
>   	F2FS_ATTR_OFFSET(struct_type, name, 0644,		\
>   		f2fs_sbi_show, f2fs_sbi_store,			\
> -		offsetof(struct struct_name, elname))
> +		offsetof(struct struct_name, elname),		\
> +		sizeof_field(struct struct_name, elname))
>   
>   #define F2FS_GENERAL_RO_ATTR(name) \
>   static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
