Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 999552A9B86
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Nov 2020 19:03:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kb65Q-0002jr-O9; Fri, 06 Nov 2020 18:03:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kb65P-0002jf-1h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 18:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aUPdH8lqF1U5xqwtezkqrwLs2bAokk4ppnb97Ju/z64=; b=cCV4Rf7XACx7hPqENSZFwUher6
 S3aUq+Z0bcmhxfNq2ZBNQLgsO1mvFnTw8/kPB1pOpxZx10GfhNPVISNQBmeLZG7621ncgbHiyxVny
 XPrRh3sG7/vjy7W1XkRcQigDNx8LcZsGOAkgL+Dxe5a3alnPvl1BDi+BJWkDigSPxlJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aUPdH8lqF1U5xqwtezkqrwLs2bAokk4ppnb97Ju/z64=; b=BAMR+BMjDh+j/ogeL8AtqblnpO
 AeYcCmS40o/eXYzvgqPt/xa+SoPKb4cP4LhUbfM4w0aRGrfvpxwODZOt8tvAB6ugZFKpLuILQnUHO
 k1XDMzZbTlCFu4mdb03J6e6/vk1zJQpXrtYUgBTqlwQV21PlTyLkxORqDVTUfn6lcUwg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kb65L-00BosN-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 18:03:43 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 175C4206FA;
 Fri,  6 Nov 2020 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604685806;
 bh=c1ZlbAy1XM/jjZj1v4QY9q6mR0aO6Q1rz0TZUyEWckE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gI78ZZSZ/W0SrbT6UwXYvyuQNl3AOtI+Tj6hwuWBh+K0nvt9kVyRNkGJiYOc9nCyT
 Y2vGkrdAaQQTunN+qlGgCVNKr6N2ojO+bR5BhkB28Rna6qavd0ocabTxphfxl7Uvtr
 1SjmvjpbZt+r/ARA+sFdhtq0OoMKLbcdTpwZVles=
Date: Fri, 6 Nov 2020 10:03:24 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201106180324.GA78548@sol.localdomain>
References: <20201106065331.76236-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106065331.76236-1-yuchao0@huawei.com>
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
X-Headers-End: 1kb65L-00BosN-1Z
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 06, 2020 at 02:53:31PM +0800, Chao Yu wrote:
> +#if defined(__KERNEL__)
> +struct compat_f2fs_gc_range {
> +	u32 sync;
> +	compat_u64 start;
> +	compat_u64 len;
> +};

There's no need to use '#if defined(__KERNEL__)' in kernel source files.

Likewise for compat_f2fs_move_range.

> +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
> +	struct compat_f2fs_gc_range __user *urange;
> +	struct f2fs_gc_range range;
> +	int err;
> +
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return -EIO;
> +	if (!f2fs_is_checkpoint_ready(sbi))
> +		return -ENOSPC;

I still don't understand why this checkpoint-related stuff is getting added
here, and only to the compat versions of the ioctls.  It wasn't in the original
version.  If they are needed then they should be added to __f2fs_ioc_gc_range()
and __f2fs_ioc_move_range() (preferably by a separate patch) so that they are
done for both the native and compat versions of these ioctls.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
