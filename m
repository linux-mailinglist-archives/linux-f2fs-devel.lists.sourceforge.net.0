Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LpElJDruL2oHJQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 14:21:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A637668623D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 14:21:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=e4ZIJgys;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=FXEhJ067;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=cNUux9pn;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=SGK2nsR3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhY2XRfmDWhi048B7dqEhfFhSdNm0Tdhdg0nCoySW7Y=; b=e4ZIJgysEgzYj+WVcba3cKBIRO
	MZ3Ww6Vt7AGjdJNG6Qq4o9ub6G2cxDgNHhkbrU1IeFv5/bbfA/irJxMfFcYWh+JSlsNLE+r4y0f/t
	LUXTVsGPGS9hKya2GscP8YFZrotOfVqArnlnchNNWXV7hsOd1QvSZIGMWVXd6QhLnlE8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ6JM-0004SC-2N;
	Mon, 15 Jun 2026 12:21:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ6JK-0004S5-T3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 12:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGdpJvE7upTDCDLQwE6C14xVcWkijWssEGBG1Lyyuzk=; b=FXEhJ067Mhi8iYdfZRh6Al9jB+
 RnE/GIVb6Jjic1d8pB3mimY773XMz9Jisb7mkJHw7cw2g87PlNtKDD/gQc4jmXq26QETWZe0GjQId
 tVlZQHdLmY/mGiP/G5Af8aZ5JtFjjSd5AEdatacy7y368+Js0UjpJa/StDnheaioFn4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zGdpJvE7upTDCDLQwE6C14xVcWkijWssEGBG1Lyyuzk=; b=cNUux9pnBRaI1E7F7PoRlf9kzB
 jASshgEPqtG8fjiqev07imyUIu1eweQSiXqKYO1RVthH2oUdEdirOBl7Y2fiVUPYj7mON/UAbqp/C
 piVV5XIt1yMhGsB5tByTTWN8mIuNfV7YGXcVrY0T/dzeBbWidZw7z3ATMm2bcg/5jwoQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ6JI-0005rP-Es for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 12:21:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A0B743EF1;
 Mon, 15 Jun 2026 12:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A471F00A3A;
 Mon, 15 Jun 2026 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781526050;
 bh=zGdpJvE7upTDCDLQwE6C14xVcWkijWssEGBG1Lyyuzk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=SGK2nsR3cOqfAwmgdZr4gUXy/HHHcBemPCRps2/464JR038mPzfB/Vwemg90TwWaw
 NsIzv3OSFndJ3ZyWMbkRZ2ONQbUnbYEIKbtuCZpWRIjP8SJaoxqGxKm9MBH6L1DQzw
 hMgORUGmXbXX7YuOY1GtkC07NkwyMdX0IU4CqEy373dabmXWZXQKSfJ2eCuKzBkM9S
 IYkeMgPBl56CezNLrT5zjXFl2Ko+rWDtwsJCPD/SfF5tDgDbvP5vgC7XgzrQjsYv2u
 8yPzap6I2xNNTJQrzxNUKbHeljfHCQB0TDGGRweHjNBtiz/udQCPfjtWmAQ+91Rb+5
 9U9ihSfuxHMoA==
Message-ID: <8738e84f-6fef-479d-a100-7df0e130f75a@kernel.org>
Date: Mon, 15 Jun 2026 20:20:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/26 19:58, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl that
 allows userspace to > retrieve all cached read extents for a g [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ6JI-0005rP-Es
Subject: Re: [f2fs-dev] [PATCH RESEND 5/5] f2fs: add ioctl to export read
 extent cache to userspace for debug
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@gmail.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,xiaomi.com:email];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A637668623D

On 6/12/26 19:58, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl that allows userspace to
> retrieve all cached read extents for a given file. This uses a two-call
> pattern similar to fiemap: the first call with ext_count=0 queries the
> node_count, and the second call fetches the actual extent entries.

It looks a little bit heavy to maintain a debug purpose ioctl interface.

Maybe set ino via sysfs and dump extent cache via procfs? only enabled
if F2FS_CHECK_FS=y?

Jaegeuk, do you have any suggestion?

Thanks,

> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/extent_cache.c    | 70 +++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h            |  3 ++
>  fs/f2fs/file.c            | 11 ++++++
>  include/uapi/linux/f2fs.h | 21 ++++++++++++
>  4 files changed, 105 insertions(+)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index e141ffb64e5f..0c10d5639d68 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/fs.h>
>  #include <linux/f2fs_fs.h>
> +#include <uapi/linux/f2fs.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -1267,6 +1268,75 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
>  	atomic_set(&eti->total_ext_node, 0);
>  }
>  
> +int f2fs_get_read_cache_extents(struct inode *inode,
> +			struct f2fs_read_cache_extent __user *uarg)
> +{
> +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> +	struct f2fs_cache_extent_info *kbuf = NULL;
> +	struct f2fs_cache_extent_info largest = {};
> +	struct rb_node *node;
> +	struct extent_node *en;
> +	unsigned int capacity, count = 0;
> +	__u32 flags = 0;
> +	int ret = 0;
> +
> +	if (get_user(capacity, &uarg->ext_count))
> +		return -EFAULT;
> +
> +	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> +		flags |= F2FS_EXT_FL_NO_EXTENT;
> +
> +	if (!et || (flags & F2FS_EXT_FL_NO_EXTENT)) {
> +		if (put_user(0U, &uarg->ext_count) ||
> +		    put_user(flags, &uarg->flags) ||
> +		    put_user(0U, &uarg->node_count))
> +			return -EFAULT;
> +		return 0;
> +	}
> +
> +	if (capacity) {
> +		kbuf = f2fs_kvmalloc(F2FS_I_SB(inode), capacity * sizeof(*kbuf), GFP_KERNEL);
> +		if (!kbuf)
> +			return -ENOMEM;
> +	}
> +
> +	read_lock(&et->lock);
> +
> +	largest.fofs = et->largest.fofs;
> +	largest.blk = et->largest.blk;
> +	largest.len = et->largest.len;
> +	largest.last_access_mode = et->largest.last_access_mode;
> +
> +	for (node = rb_first_cached(&et->root); node; node = rb_next(node)) {
> +		if (count >= capacity)
> +			break;
> +		en = rb_entry(node, struct extent_node, rb_node);
> +
> +		kbuf[count].fofs = en->ei.fofs;
> +		kbuf[count].blk = en->ei.blk;
> +		kbuf[count].len = en->ei.len;
> +		kbuf[count].last_access_mode = en->ei.last_access_mode;
> +		count++;
> +	}
> +
> +	read_unlock(&et->lock);
> +
> +	if (count && copy_to_user(uarg->extents, kbuf,
> +				  count * sizeof(*kbuf))) {
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	if (put_user(count, &uarg->ext_count) ||
> +	    put_user(flags, &uarg->flags) ||
> +	    put_user((u32)atomic_read(&et->node_cnt), &uarg->node_count) ||
> +	    copy_to_user(&uarg->largest, &largest, sizeof(largest)))
> +		ret = -EFAULT;
> +out:
> +	kvfree(kbuf);
> +	return ret;
> +}
> +
>  void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
>  {
>  	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 1588b64d04a3..69641fc31c51 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -26,6 +26,7 @@
>  #include <linux/part_stat.h>
>  #include <linux/rw_hint.h>
>  
> +#include <uapi/linux/f2fs.h>
>  #include <linux/fscrypt.h>
>  #include <linux/fsverity.h>
>  
> @@ -4590,6 +4591,8 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
>  void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
>  				pgoff_t fofs, block_t blkaddr, unsigned int len,
>  				enum extent_access_mode access_mode);
> +int f2fs_get_read_cache_extents(struct inode *inode,
> +			struct f2fs_read_cache_extent __user *uarg);
>  unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
>  			int nr_shrink);
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index a3a5d499eadf..66ec9927d667 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3672,6 +3672,14 @@ static int f2fs_ioc_precache_extents(struct file *filp)
>  	return f2fs_precache_extents(file_inode(filp));
>  }
>  
> +static int f2fs_ioc_get_read_cache_extents(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +
> +	return f2fs_get_read_cache_extents(inode,
> +			(struct f2fs_read_cache_extent __user *)arg);
> +}
> +
>  static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> @@ -4744,6 +4752,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_get_dev_alias_file(filp, arg);
>  	case F2FS_IOC_IO_PRIO:
>  		return f2fs_ioc_io_prio(filp, arg);
> +	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
> +		return f2fs_ioc_get_read_cache_extents(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -5506,6 +5516,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_COMPRESS_FILE:
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
>  	case F2FS_IOC_IO_PRIO:
> +	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 795e26258355..6ff9003bc030 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -45,6 +45,8 @@
>  #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
>  #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
> +#define F2FS_IOC_GET_READ_CACHE_EXTENTS	_IOWR(F2FS_IOCTL_MAGIC, 28,	\
> +						struct f2fs_read_cache_extent)
>  
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.
> @@ -104,4 +106,23 @@ struct f2fs_comp_option {
>  	__u8 log_cluster_size;
>  };
>  
> +struct f2fs_cache_extent_info {
> +	__u32 fofs;		/* start file offset in blocks */
> +	__u32 blk;		/* start block address */
> +	__u32 len;		/* length in blocks */
> +	__u32 last_access_mode; /* last access mode of extent_node */
> +};
> +
> +/* flags for f2fs_read_cache_extent */
> +#define F2FS_EXT_FL_NO_EXTENT	0x1	/* extent cache disabled for this inode */
> +
> +struct f2fs_read_cache_extent {
> +	__u32 ext_count;	/* in: array capacity; out: mapped extent count */
> +	__u32 flags;		/* out: status flags */
> +	__u32 node_count;	/* out: total extent nodes in tree */
> +	__u32 reserved;
> +	struct f2fs_cache_extent_info largest;		/* out: largest extent */
> +	struct f2fs_cache_extent_info extents[];	/* out: extent array */
> +};
> +
>  #endif /* _UAPI_LINUX_F2FS_H */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
