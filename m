Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Q20JrAfMGpIOQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:52:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8154687E9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:52:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Pg8ZY2F1;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fsMVraIr;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=k5EO5gVz;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=gnH8q6Jq;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EkBQUqhbaIx2lNE9DmG1srXo6YOIrpxLyIXNOfFkXk=; b=Pg8ZY2F1DYOb77cE5EPCTnv6l5
	B3wclztrM6jhNQG4rituy7VtdFJdG7BG7V2oxP0s0/wangG09Grc0SIc9NPADvuKlpIzcFKf9F8d+
	2hNduvSoXSHA8Z85pf+3jQzccMt+LrEQbHsBYBPAZnrovWFT3zTyTFBIzqViDyJAwClI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9bb-00063t-Hx;
	Mon, 15 Jun 2026 15:52:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZ9bZ-00063g-NP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i3PHX3YhmYx5IUXzivGPU0J+kzZvhb/igWU6Z27SlGk=; b=fsMVraIrPt+Z6wEEHo1d6RepWk
 0FF3SSkWolB6SocSjZXbrYPDPqv9UAxG+NIK3rK2DDvusE+18eBBzFJBha26nyDMQUsaoXuc5R/wf
 Xrl+2KajUAwHKeikHAiTuYW/TaJMUCtDOWRv1IlT01fplVLm18ayrq7bjwvNig6wrEeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i3PHX3YhmYx5IUXzivGPU0J+kzZvhb/igWU6Z27SlGk=; b=k5EO5gVzNCP2AwdlZpzIcKZzKi
 J/cMsQkf0IELuuv4L9M6S66RISdznxPHjLSmzQiW/OZeUabNSDNV/PHsspymtpZYmbs+JnjglQaSL
 sdg4pTvA0R48NjsaLTd8ZIU2poq6b8ZKzCq/fH/L+hPFuhcyK5AyqFVuxVYXw+pb+gRE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9bY-0007Wq-If for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:52:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB9DE43526;
 Mon, 15 Jun 2026 15:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A1A1F000E9;
 Mon, 15 Jun 2026 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781538714;
 bh=i3PHX3YhmYx5IUXzivGPU0J+kzZvhb/igWU6Z27SlGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gnH8q6JqE9JCINpAeMSoUIVTaWwV5zCu6FI05Oslwn6cldzgr0/Te6Na3JuHl65nn
 RxdFauUhwtxadpq6yPKvgLhiyN3HaeAukGw1jaRmlNT0syR8TTh1ND6xjH7vrikLIW
 TE9pgBzAzxbllaOC4dAlgnPsFxycOgmK4nhdo1mLwvJ72Rt6tvPbblE1UEbwuZBDRM
 4gZfJH0+NhdkgPDEFBUq7UEa2PAB8/6Ypr4UXRxvgRrfoav3K0r/PN3IGBVzE+0piP
 fK8BseOCGDw0QWxmBzlZeo7wMnZASKMO8Ww3dvX/cXeG2DehBF65CesArt4EC0hvFJ
 MCRnZvys+4GhQ==
Date: Mon, 15 Jun 2026 15:51:52 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ajAfmEHCgHAh1E0I@google.com>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
 <8738e84f-6fef-479d-a100-7df0e130f75a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8738e84f-6fef-479d-a100-7df0e130f75a@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/15, Chao Yu via Linux-f2fs-devel wrote: > On 6/12/26
 19:58, Yongpeng Yang wrote: > > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
 > > > > Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl that allows u [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ9bY-0007Wq-If
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:yangyongpeng.storage@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,gmail.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8154687E9E

On 06/15, Chao Yu via Linux-f2fs-devel wrote:
> On 6/12/26 19:58, Yongpeng Yang wrote:
> > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> > 
> > Add F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl that allows userspace to
> > retrieve all cached read extents for a given file. This uses a two-call
> > pattern similar to fiemap: the first call with ext_count=0 queries the
> > node_count, and the second call fetches the actual extent entries.
> 
> It looks a little bit heavy to maintain a debug purpose ioctl interface.
> 
> Maybe set ino via sysfs and dump extent cache via procfs? only enabled
> if F2FS_CHECK_FS=y?
> 
> Jaegeuk, do you have any suggestion?

Agreed, and even not sure we need sysfs or procfs. Can we dump the extents
via fsck?

> 
> Thanks,
> 
> > 
> > Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> > ---
> >  fs/f2fs/extent_cache.c    | 70 +++++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/f2fs.h            |  3 ++
> >  fs/f2fs/file.c            | 11 ++++++
> >  include/uapi/linux/f2fs.h | 21 ++++++++++++
> >  4 files changed, 105 insertions(+)
> > 
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > index e141ffb64e5f..0c10d5639d68 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -14,6 +14,7 @@
> >  
> >  #include <linux/fs.h>
> >  #include <linux/f2fs_fs.h>
> > +#include <uapi/linux/f2fs.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -1267,6 +1268,75 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
> >  	atomic_set(&eti->total_ext_node, 0);
> >  }
> >  
> > +int f2fs_get_read_cache_extents(struct inode *inode,
> > +			struct f2fs_read_cache_extent __user *uarg)
> > +{
> > +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> > +	struct f2fs_cache_extent_info *kbuf = NULL;
> > +	struct f2fs_cache_extent_info largest = {};
> > +	struct rb_node *node;
> > +	struct extent_node *en;
> > +	unsigned int capacity, count = 0;
> > +	__u32 flags = 0;
> > +	int ret = 0;
> > +
> > +	if (get_user(capacity, &uarg->ext_count))
> > +		return -EFAULT;
> > +
> > +	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> > +		flags |= F2FS_EXT_FL_NO_EXTENT;
> > +
> > +	if (!et || (flags & F2FS_EXT_FL_NO_EXTENT)) {
> > +		if (put_user(0U, &uarg->ext_count) ||
> > +		    put_user(flags, &uarg->flags) ||
> > +		    put_user(0U, &uarg->node_count))
> > +			return -EFAULT;
> > +		return 0;
> > +	}
> > +
> > +	if (capacity) {
> > +		kbuf = f2fs_kvmalloc(F2FS_I_SB(inode), capacity * sizeof(*kbuf), GFP_KERNEL);
> > +		if (!kbuf)
> > +			return -ENOMEM;
> > +	}
> > +
> > +	read_lock(&et->lock);
> > +
> > +	largest.fofs = et->largest.fofs;
> > +	largest.blk = et->largest.blk;
> > +	largest.len = et->largest.len;
> > +	largest.last_access_mode = et->largest.last_access_mode;
> > +
> > +	for (node = rb_first_cached(&et->root); node; node = rb_next(node)) {
> > +		if (count >= capacity)
> > +			break;
> > +		en = rb_entry(node, struct extent_node, rb_node);
> > +
> > +		kbuf[count].fofs = en->ei.fofs;
> > +		kbuf[count].blk = en->ei.blk;
> > +		kbuf[count].len = en->ei.len;
> > +		kbuf[count].last_access_mode = en->ei.last_access_mode;
> > +		count++;
> > +	}
> > +
> > +	read_unlock(&et->lock);
> > +
> > +	if (count && copy_to_user(uarg->extents, kbuf,
> > +				  count * sizeof(*kbuf))) {
> > +		ret = -EFAULT;
> > +		goto out;
> > +	}
> > +
> > +	if (put_user(count, &uarg->ext_count) ||
> > +	    put_user(flags, &uarg->flags) ||
> > +	    put_user((u32)atomic_read(&et->node_cnt), &uarg->node_count) ||
> > +	    copy_to_user(&uarg->largest, &largest, sizeof(largest)))
> > +		ret = -EFAULT;
> > +out:
> > +	kvfree(kbuf);
> > +	return ret;
> > +}
> > +
> >  void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
> >  {
> >  	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 1588b64d04a3..69641fc31c51 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -26,6 +26,7 @@
> >  #include <linux/part_stat.h>
> >  #include <linux/rw_hint.h>
> >  
> > +#include <uapi/linux/f2fs.h>
> >  #include <linux/fscrypt.h>
> >  #include <linux/fsverity.h>
> >  
> > @@ -4590,6 +4591,8 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
> >  void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
> >  				pgoff_t fofs, block_t blkaddr, unsigned int len,
> >  				enum extent_access_mode access_mode);
> > +int f2fs_get_read_cache_extents(struct inode *inode,
> > +			struct f2fs_read_cache_extent __user *uarg);
> >  unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
> >  			int nr_shrink);
> >  
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index a3a5d499eadf..66ec9927d667 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3672,6 +3672,14 @@ static int f2fs_ioc_precache_extents(struct file *filp)
> >  	return f2fs_precache_extents(file_inode(filp));
> >  }
> >  
> > +static int f2fs_ioc_get_read_cache_extents(struct file *filp, unsigned long arg)
> > +{
> > +	struct inode *inode = file_inode(filp);
> > +
> > +	return f2fs_get_read_cache_extents(inode,
> > +			(struct f2fs_read_cache_extent __user *)arg);
> > +}
> > +
> >  static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
> >  {
> >  	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> > @@ -4744,6 +4752,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> >  		return f2fs_ioc_get_dev_alias_file(filp, arg);
> >  	case F2FS_IOC_IO_PRIO:
> >  		return f2fs_ioc_io_prio(filp, arg);
> > +	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
> > +		return f2fs_ioc_get_read_cache_extents(filp, arg);
> >  	default:
> >  		return -ENOTTY;
> >  	}
> > @@ -5506,6 +5516,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >  	case F2FS_IOC_COMPRESS_FILE:
> >  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
> >  	case F2FS_IOC_IO_PRIO:
> > +	case F2FS_IOC_GET_READ_CACHE_EXTENTS:
> >  		break;
> >  	default:
> >  		return -ENOIOCTLCMD;
> > diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> > index 795e26258355..6ff9003bc030 100644
> > --- a/include/uapi/linux/f2fs.h
> > +++ b/include/uapi/linux/f2fs.h
> > @@ -45,6 +45,8 @@
> >  #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
> >  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
> >  #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
> > +#define F2FS_IOC_GET_READ_CACHE_EXTENTS	_IOWR(F2FS_IOCTL_MAGIC, 28,	\
> > +						struct f2fs_read_cache_extent)
> >  
> >  /*
> >   * should be same as XFS_IOC_GOINGDOWN.
> > @@ -104,4 +106,23 @@ struct f2fs_comp_option {
> >  	__u8 log_cluster_size;
> >  };
> >  
> > +struct f2fs_cache_extent_info {
> > +	__u32 fofs;		/* start file offset in blocks */
> > +	__u32 blk;		/* start block address */
> > +	__u32 len;		/* length in blocks */
> > +	__u32 last_access_mode; /* last access mode of extent_node */
> > +};
> > +
> > +/* flags for f2fs_read_cache_extent */
> > +#define F2FS_EXT_FL_NO_EXTENT	0x1	/* extent cache disabled for this inode */
> > +
> > +struct f2fs_read_cache_extent {
> > +	__u32 ext_count;	/* in: array capacity; out: mapped extent count */
> > +	__u32 flags;		/* out: status flags */
> > +	__u32 node_count;	/* out: total extent nodes in tree */
> > +	__u32 reserved;
> > +	struct f2fs_cache_extent_info largest;		/* out: largest extent */
> > +	struct f2fs_cache_extent_info extents[];	/* out: extent array */
> > +};
> > +
> >  #endif /* _UAPI_LINUX_F2FS_H */
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
