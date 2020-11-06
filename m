Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692B2A9F42
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Nov 2020 22:40:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kb9TL-00019R-GD; Fri, 06 Nov 2020 21:40:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kb9TK-00019K-Nl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 21:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1IakWaVWHu/PlnUaTj6YhxLu7kCOeSevxWVPvS/GsWA=; b=WRNstIO34YAQVTzgzTAGfpxGkq
 qPp/92J21GanBCMrpv1RdQdVXMeNXAaGr8MtbIwqbkipbuilRDHQGBaOJaWe1ifKb5rFzxx3NixWf
 F9SdmpmfU3nUGXzyBg7OcQFFSBFpx3JKD/n61WQSBk7MSzQdgfhnCMHZedqUwpZ0phDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1IakWaVWHu/PlnUaTj6YhxLu7kCOeSevxWVPvS/GsWA=; b=Q+4mZwsMOqOAd57rWK+m1Q7T2e
 6wPE46X4ztYcCX5Ma9pXs/bqWxIO7Q31jXBuXgQPhhqx7/Ch9mb1tKrYsGCUDlvEG201jFDy+f+nJ
 FHQmBvthSgzz61LLMHKHbaqFpuuJUw+AloEoLmHcEQO4aHaV1PZ9eVQmtvKS4XOkvYOk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kb9TH-003i7E-Oz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 21:40:38 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED58E2087E;
 Fri,  6 Nov 2020 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604698830;
 bh=EXn63RuGCpoJGdLb/5y1K5hHO36Xfe1tSY2d1ul+gZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ftLtJCm/twpaXWfNQPk94EBUr8cWoeRcyqL+FAwedcXomx7o6Dn354ya1jzpuOAvm
 6k3EJxCM6n6qP+hW9ZlptggvhZi/HB5NQXZy2pcrMjo6I3gaJ3QmfaCH6K1yjiQ88Y
 yQKe+Ydv5FrFgKJNR17eNsZikAjC0rzvHgH1QGNM=
Date: Fri, 6 Nov 2020 13:40:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201106214028.GC1474936@google.com>
References: <20201105010934.16018-1-yuchao0@huawei.com>
 <20201106000550.GD2555324@gmail.com>
 <07454135-539d-a159-deb8-ff29df7e22de@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07454135-539d-a159-deb8-ff29df7e22de@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kb9TH-003i7E-Oz
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/06, Chao Yu wrote:
> On 2020/11/6 8:05, Eric Biggers wrote:
> > This patch is marked 2/2, but it seems you sent it out on its own.  Patch series
> > are supposed to be resend in full; otherwise people can see just one patch and
> > have no context.
> 
> That's a historical problem, as in last many years, we (f2fs community) don't have
> other long-term reviewers except Jaegeuk and me, so we have unwritten rule: only
> resending changed patch in patchset.
> 
> IMO, that helps to skip traversing unchanged patches, and focusing reviewing on the
> real change lines, and certainly we have its context in mind.
> 
> Personally, I prefer to revise, resend or review patch{,es} of patchset have real
> change line in f2fs mailing list, anyway we can discuss about the rule here.

Chao, I think we need to change this to resend whole patch-set again, since
it's a bit difficult to catch which part of patches were the latest one.

> 
> > 
> > On Thu, Nov 05, 2020 at 09:09:34AM +0800, Chao Yu wrote:
> > > Eric reported a ioctl bug in below link:
> > > 
> > > https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/
> > > 
> > > That said, on some 32-bit architectures, u64 has only 32-bit alignment,
> > > notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
> > > in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
> > > compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
> > > due to mismatched value of ioctl command in between binary and f2fs
> > > module, similarly, F2FS_IOC_MOVE_RANGE will fail too.
> > > 
> > > In this patch we introduce two ioctls for compatibility of above special
> > > 32-bit binary:
> > > - F2FS_IOC32_GARBAGE_COLLECT_RANGE
> > > - F2FS_IOC32_MOVE_RANGE
> > > 
> > 
> > It would be good to add a proper reported-by line, otherwise it's not clear who
> > "Eric" is (there are lots of Erics):
> > 
> > Reported-by: Eric Biggers <ebiggers@google.com>
> Sure, although I attached the link includes original report email, in where it
> points out who "Eric" is.
> 
> > 
> > > +static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
> > >   {
> > > -	struct inode *inode = file_inode(filp);
> > > -	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > > -	struct f2fs_gc_range range;
> > > +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> > >   	u64 end;
> > >   	int ret;
> > > +	if (unlikely(f2fs_cp_error(sbi)))
> > > +		return -EIO;
> > > +	if (!f2fs_is_checkpoint_ready(sbi))
> > > +		return -ENOSPC;
> > 
> > These two checkpoint-related checks weren't present in the original version.
> > Is that intentional?
> 
> Quoted
> 
> > It would be better to have __f2fs_ioc_gc_range() handle the f2fs_cp_error(),
> > f2fs_is_checkpoint_ready(), capable(), and f2fs_readonly() checks, so that they
> > don't have to be duplicated in the native and compat cases.
> 
> > Similarly for "move range".
> 
> I missed to check the detail, and just follow, I can clean up it.
> 
> > 
> > > +static int __f2fs_ioc_move_range(struct file *filp,
> > > +				struct f2fs_move_range *range)
> > >   {
> > > -	struct f2fs_move_range range;
> > > +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> > >   	struct fd dst;
> > >   	int err;
> > > +	if (unlikely(f2fs_cp_error(sbi)))
> > > +		return -EIO;
> > > +	if (!f2fs_is_checkpoint_ready(sbi))
> > > +		return -ENOSPC;
> > > +
> > 
> > Likewise here.
> > 
> > > diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> > > index f00199a2e38b..8c14e88a9645 100644
> > > --- a/include/uapi/linux/f2fs.h
> > > +++ b/include/uapi/linux/f2fs.h
> > > @@ -5,6 +5,10 @@
> > >   #include <linux/types.h>
> > >   #include <linux/ioctl.h>
> > > +#ifdef __KERNEL__
> > > +#include <linux/compat.h>
> > > +#endif
> > > +
> > >   /*
> > >    * f2fs-specific ioctl commands
> > >    */
> > > @@ -65,6 +69,16 @@ struct f2fs_gc_range {
> > >   	__u64 len;
> > >   };
> > > +#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
> > > +struct compat_f2fs_gc_range {
> > > +	u32 sync;
> > > +	compat_u64 start;
> > > +	compat_u64 len;
> > > +};
> > > +#define F2FS_IOC32_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,\
> > > +						struct compat_f2fs_gc_range)
> > > +#endif
> > > +
> > >   struct f2fs_defragment {
> > >   	__u64 start;
> > >   	__u64 len;
> > > @@ -77,6 +91,17 @@ struct f2fs_move_range {
> > >   	__u64 len;		/* size to move */
> > >   };
> > > +#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
> > > +struct compat_f2fs_move_range {
> > > +	u32 dst_fd;
> > > +	compat_u64 pos_in;
> > > +	compat_u64 pos_out;
> > > +	compat_u64 len;
> > > +};
> > > +#define F2FS_IOC32_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
> > > +					struct compat_f2fs_move_range)
> > > +#endif
> > > +
> > >   struct f2fs_flush_device {
> > >   	__u32 dev_num;		/* device number to flush */
> > >   	__u32 segments;		/* # of segments to flush */
> > > -- 
> > 
> > Did you consider instead putting these compat definitions in an internal kernel
> > header, or even just in the .c file, to avoid cluttering up the UAPI header?
> 
> Better.
> 
> I can move them before their use.
> 
> > 
> > - Eric
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
