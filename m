Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2302A3B00
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 04:23:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZmuQ-000218-Hw; Tue, 03 Nov 2020 03:22:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZmuO-00020t-Vc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 03:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ABvtw8gmF3tADTX0qV3CGcGsNdI7BuYbbhJJ0kg7XC4=; b=TCgLlp2XFkoCyOzoe0Ew3PePq2
 dYE4L+Ye6MB+b7h/s1yIp13gilRhtwZyzuMdQprayIV9sRQ7GTk1FbvBI/c+rpnhogi/z8AbbldOA
 eNQZUCcze3oOQAsdu7AvOFSZvAbOsrLSZp9+8fgVTxjbPNem2BUUC+m8pTl637yVU/Ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ABvtw8gmF3tADTX0qV3CGcGsNdI7BuYbbhJJ0kg7XC4=; b=mp9JSVx/g5C1n7E2M/H7Zw6j/n
 /D0Ut5lRjC+6KWD9WaQnxDu3mNC+qa67L8ynqqvom1La+mwsXCVWJzccU0QkTw9GhgJom7A4pZygO
 hFVAADRSWiMmkRqMCVGFXLMd9hoRFy0C67zvGqUvVop+mQdeTEL8goA47Q6QKfdqLoqE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZmuE-007EZq-K9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 03:22:56 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 140A0207BB;
 Tue,  3 Nov 2020 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604373756;
 bh=7aFgfXQwxuCN6CihcO+o9uIp6HKkf3hnQvxiwlMdqW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1tSP/XlAhjfm/smjFoMIvolMvFvjAk4pBWrgGp1ydvgiHjZ1FDzuNEdnn6LMNEi2
 h8t2VSiQnVH4cyzuToFx7aD/qS6m2p1jcgRvsjcGagUyHqfvibV5mAGjOagYMVzD+b
 jFRhc4NpyP8skgEJAJfsqhKVZHra2D7/GAf4bbo8=
Date: Mon, 2 Nov 2020 19:22:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201103032234.GB2875@sol.localdomain>
References: <20201102062131.14205-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102062131.14205-1-yuchao0@huawei.com>
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
X-Headers-End: 1kZmuE-007EZq-K9
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: move ioctl interface definitions to
 separated file
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

On Mon, Nov 02, 2020 at 02:21:31PM +0800, Chao Yu wrote:
> +#define F2FS_IOC_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
> +						struct f2fs_move_range)
[...]
> +#define F2FS_IOC_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,	\
> +						struct f2fs_gc_range)
[...]
> +
> +struct f2fs_gc_range {
> +	__u32 sync;
> +	__u64 start;
> +	__u64 len;
> +};
[...]
> +struct f2fs_move_range {
> +	__u32 dst_fd;		/* destination fd */
> +	__u64 pos_in;		/* start position in src_fd */
> +	__u64 pos_out;		/* start position in dst_fd */
> +	__u64 len;		/* size to move */
> +};

These two structs are weird because there is implicit padding between the __u32
field and the following __u64 field on some 32-bit architectures (e.g. x86_32)
but not others (e.g. arm32).

But f2fs_compat_ioctl() doesn't handle these two ioctls specially, but rather
just calls through to f2fs_ioctl().  That's wrong, and it means that
F2FS_IOC_MOVE_RANGE and F2FS_IOC_GARBAGE_COLLECT_RANGE won't work when called
from an x86_32 binary on an x86_64 kernel.

So something needs to be fixed.  I wonder if it's safe to just explicitly add
the padding field after the fact.  If no one is actually using these two ioctls
in a case where both userspace and the kernel lack the implicit padding (e.g.,
x86_32 userspace with x86_32 kernel), it should be fine...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
