Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0824A29F098
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Oct 2020 16:55:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYAGg-0003Os-Ix; Thu, 29 Oct 2020 15:55:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kYAGf-0003OU-K1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 15:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4K455W0ep1zflq5MHyazQVv2UbLiu6nKDQy+au0GSo=; b=F4x9heahSFW8aFHvmYcMB8+b3b
 2NDfAxEd3Hx6G1Gn93GTSpeKKqUIWGefdZsFUxXw2ARcGb+ydUjLZtI4nnETeXWviC92Uw86pc20j
 z/6izFTmJLKcCzP9YjbN4JByk6BLFRVQpNj+jCstgkeVPf2m86cDEeL3VRRMT1dUIC64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c4K455W0ep1zflq5MHyazQVv2UbLiu6nKDQy+au0GSo=; b=Q9/J/WN05zufNOfqDZB7y9FeYN
 AJfGhWz5v4hJgiHXD7wGbfJAnG24Jhinc3sHDdP+R0A4E78Bj4FWH6EQJmUF3KY2XUhOttiAZVJBD
 hd0LSWjI/var0BiGErzeBN7X42Weavh5+X2rugKcuxcDFPpeD1WOoi1DUXhbgtr0BeYs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYAGS-00Bk8V-TT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 15:55:12 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A8C0206B2;
 Thu, 29 Oct 2020 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603986895;
 bh=87aI4/JSMDDksYiET/w/mskCfHBQKdtbdR1IFIz2HlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UBHEU8f0aEe2A/0HMk7c+LCoGolhLfFyok4S0WPt/8F4nJvewDoafydRcDs9V+Tbn
 0G8iqUnYBYI9na/qMiiHNaV8IBESTZ1sVK3+tw8Q455FAx+c7PRi1qORc3/mHApK5X
 mRZDf2MVLaM6nVZkpr88N7YI+4sSDCs968KKURAY=
Date: Thu, 29 Oct 2020 08:54:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201029155453.GB849@sol.localdomain>
References: <20201029041538.4165209-1-daeho43@gmail.com>
 <20201029041538.4165209-2-daeho43@gmail.com>
 <92f4da8e-27a1-7577-84f9-39038eaa88cb@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92f4da8e-27a1-7577-84f9-39038eaa88cb@huawei.com>
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
X-Headers-End: 1kYAGS-00Bk8V-TT
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 29, 2020 at 03:29:17PM +0800, Chao Yu wrote:
> > +static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> > +{
> > +	struct inode *inode = file_inode(filp);
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > +	struct f2fs_comp_option option;
> > +	int ret = 0;
> > +
> > +	if (!f2fs_sb_has_compression(sbi))
> > +		return -EOPNOTSUPP;
> > +
> > +	if (!(filp->f_mode & FMODE_WRITE))
> > +		return -EBADF;
> > +
> > +	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
> > +				sizeof(option)))
> > +		return -EFAULT;
> > +
> > +	if (!f2fs_compressed_file(inode) ||
> > +			option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> > +			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
> > +			option.algorithm >= COMPRESS_MAX)
> > +		return -EINVAL;
> > +
> > +	file_start_write(filp);
> > +	inode_lock(inode);
> > +
> > +	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	if (inode->i_size != 0) {
> > +		ret = -EFBIG;
> > +		goto out;
> > +	}
> 
> Hmm...
> 
> Shouldn't it be:
> 
> if (algorithm >= COMPRESS_MAX) {
> 	ret = -ENOPKG;
> 	goto out;
> }
> 
> if (!f2fs_cops[algorithm])
> 	f2fs_warn(...);

Note that my intent with recommending ENOPKG was for it to be returned in the
!f2fs_cops[algorithm] case, similar to how opening an encrypted file when the
encryption algorithm is recognized but not supported by the kernel returns
ENOPKG.  For a truly unrecognized algorithm (algorithm >= COMPRESS_MAX), EINVAL
would probably be more appropriate.  So if !f2fs_cops[algorithm] is now allowed,
then ENOPKG should no longer be among the error codes this ioctl returns.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
