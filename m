Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715828C88C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 08:12:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSDXk-0002X9-Am; Tue, 13 Oct 2020 06:12:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kSDXf-0002Wy-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 06:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M9/lLwnBF7yXNwHohRYwGNffSmSATQf7C7Ez4C3qndE=; b=OCNkQgMj4uGO7vHfIcAW0Qflgj
 YoDIMMfml4akfV74tg8tvIJMKB8T1OQ59HnLLimadLoN1zGVAfEgvuns8rmYlzdXG0guXObyZ/nJE
 fAxiGO39fiA/SF+xY1H9webVjigsQ4NSlraz0sqfinJeM9dxCArfJZPZ5pKjgn+yTnmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M9/lLwnBF7yXNwHohRYwGNffSmSATQf7C7Ez4C3qndE=; b=Py5Dfl1BJ1uuCoP1Fwnbbg0/qv
 NYP8uXkqnjHhistvqB7zZ83Gfz0w/CMfOqVztm150Rjf5JchfvejA+aqXiwCcFnBYgM1SYsJ1n3yo
 pUHM61Tp7Dn6T6pF8kBKgW4IlsHBVblYotgmtmeQR5uMTXlC5JpWKbH/LFL8rIZdKSI0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSDXY-008Itl-Ql
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 06:12:11 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F404208D5;
 Tue, 13 Oct 2020 06:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602569512;
 bh=RdcM42RUsQgguE+mIVddBaOAVmC+EXsrSMwUWlEemcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dvQLuMcn0duMSVgVY9alkWGVdxZK6COUr8i+kqrKvo/2LbZZRDPt3b+Pd1W2xrntr
 Q9LgG383D6Aexv1HMTNm24LTYZU5RPmLyqhnBGyKv0G/bZui/I4VVA6BLDJEyl+H7J
 OXB5B+BRP4lIbLQiDgnyPb3LeE8CHGmUa1dQMoQY=
Date: Mon, 12 Oct 2020 23:11:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201013061150.GC1062@sol.localdomain>
References: <20201013022429.454161-1-daeho43@gmail.com>
 <20201013022429.454161-2-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013022429.454161-2-daeho43@gmail.com>
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
X-Headers-End: 1kSDXY-008Itl-Ql
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
 ioctl
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

On Tue, Oct 13, 2020 at 11:24:29AM +0900, Daeho Jeong wrote:
> +static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_comp_option option;
> +	int ret;
> +	int writecount;
> +
> +	if (!f2fs_sb_has_compression(sbi))
> +		return -EOPNOTSUPP;
> +
> +	if (!f2fs_compressed_file(inode) || IS_IMMUTABLE(inode))
> +		return -EINVAL;
> +
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;

f2fs_readonly() is redundant with mnt_want_write_file().

Also, shouldn't this require a writable file descriptor?  As-is, this ioctl can
be called on a file owned by another user, as long as the caller has read
access.

Note: if you change this to require a writable file descriptor, then
f2fs_readonly(), mnt_want_write_file(), and IS_IMMUTABLE() all would no longer
be needed.

> +
> +	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
> +				sizeof(option)))
> +		return -EFAULT;
> +
> +	if (option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> +			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
> +			option.algorithm >= COMPRESS_MAX)
> +		return -EINVAL;

What if f2fs_cops[options.algorithm] == NULL, e.g. COMPRESS_LZ4 without
CONFIG_F2FS_FS_LZ4?  Shouldn't the caller get an error then?

> +
> +	ret = mnt_want_write_file(filp);
> +	if (ret)
> +		return ret;
> +
> +	inode_lock(inode);
> +
> +	writecount = atomic_read(&inode->i_writecount);
> +	if ((filp->f_mode & FMODE_WRITE && writecount != 1) ||
> +			(!(filp->f_mode & FMODE_WRITE) && writecount)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}

I don't think the check for i_writecount == 1 accomplishes anything because it
just means there are no *other* writable file descriptors.  It doesn't mean that
some other thread isn't concurrently trying to write to this same file
descriptor.  So the lock needs to be enough.  Is it?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
