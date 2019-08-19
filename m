Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AB91B43
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 04:56:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzXpw-0006Vn-69; Mon, 19 Aug 2019 02:56:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hzXpu-0006Vg-KA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 02:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sevtnnXljTDvGvL/820Oy7d6A10nqk2JwaGH+vy38YE=; b=dMHq9UPw5HbWn73m9ayJIDJxUW
 OjkB4PQFTpjqSdQmxV/7hY6mBvkCfh6e1NCwjkMLizCps4hw/2ZETxbCNppSNImwqp9pMWVLm582D
 GfRrGkv3iXoSR2TJBYmPHDtQaLDGzdAXmVekJpWo/pE8l82A0izuQz/6PU8Duumdp+5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sevtnnXljTDvGvL/820Oy7d6A10nqk2JwaGH+vy38YE=; b=LNfaufrz6CwwwwmTh7T2/eErf7
 FcWK8mJ+5LFlBFjnnJjSrRbGwvtyrViFy0Ahg78cvrHjuKvex93tw4yWEmwTNEOBmXW+3qTJvvayu
 0wm9vQxkPqicYvWPf8G2aWnSjmX6QniHkn7SnRCRHMqOQWo7XjCvAzFQdfRy/DWJrj1Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzXpt-007ooc-FX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 02:55:58 +0000
Received: from zzz.localdomain (unknown [67.218.105.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D9A220B7C;
 Mon, 19 Aug 2019 02:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566183349;
 bh=eUPSHmZRE/Y46Ws09HXAW1Wmr15lGBm4UlPQZwCscio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exsDF0GUZ8RPaTi3hWlUhR0dBznwnNvlPLdtFCYtZo/q1hKK+lSaX+7biH7MhFDyq
 la7GyEcWu40+OkXce81Oogw9NVyGn98DAB0n9iYBn9x1dROY6rM8pFy7Wkx1DHr+zl
 I+D+0kk5A44/BTe+kT5aWNUheMXX2DAl5JGny4y0=
Date: Sun, 18 Aug 2019 19:55:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190819025545.GA1223@zzz.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190816055539.30420-1-ebiggers@kernel.org>
 <20190816055539.30420-3-ebiggers@kernel.org>
 <d6022f8b-2d75-4e9d-882e-038551684c37@huawei.com>
 <20190818154138.GA1118@sol.localdomain>
 <3f3fa304-2ce0-7773-7335-30f8e3c5b5d5@huawei.com>
 <808dc7d9-01c3-7883-431a-8f3532adec09@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <808dc7d9-01c3-7883-431a-8f3532adec09@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hzXpt-007ooc-FX
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: fix copying too many bytes in
 FS_IOC_SETFSLABEL
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 19, 2019 at 09:58:30AM +0800, Chao Yu wrote:
> On 2019/8/19 9:33, Chao Yu wrote:
> > On 2019/8/18 23:41, Eric Biggers wrote:
> >> On Fri, Aug 16, 2019 at 02:59:37PM +0800, Chao Yu wrote:
> >>> On 2019/8/16 13:55, Eric Biggers wrote:
> >>>> From: Eric Biggers <ebiggers@google.com>
> >>>>
> >>>> Userspace provides a null-terminated string, so don't assume that the
> >>>> full FSLABEL_MAX bytes can always be copied.>
> >>>> Fixes: 61a3da4d5ef8 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
> >>>
> >>> It may only copy redundant zero bytes, and will not hit security issue, it
> >>> doesn't look like a bug fix?
> >>>
> >>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
> >>>
> >>> Anyway, it makes sense to me.
> >>>
> >>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> >>>
> >>
> >> It's not clear that userspace is guaranteed to provide a full FSLABEL_MAX bytes
> >> in the buffer.  E.g. it could provide "foo\0" followed by an unmapped page.
> > 
> > You're right, thanks for your explanation.
> 
> One more question, there is no validation check on length of user passed buffer,
> 
> So in most ioctl interfaces, user can pass a buffer which has less size than we
> defined intentionally/unintentionally.
> 
> E.g.
> 
> user space:
> 
> struct f2fs_defragment_user {
> 	unsigned long long start;
> //	unsigned long long len;
> };
> 
> main()
> {
> 	struct f2fs_defragment_user *df;
> 
> 	df = malloc();
> 	
> 	ioctl(fd, F2FS_IOC_DEFRAGMENT, df);
> }
> 
> kernel:
> 
> f2fs_ioc_defragment()
> {
> ...
> 	if (copy_from_user(&range, (struct f2fs_defragment __user *)arg,
> 							sizeof(range)))
> 		return -EFAULT;
> }
> 
> Is that a common issue?
> 

No, but that's different because that only involves a fixed-length struct.

My concern was that since FS_IOC_SETFSLABEL takes in a string, users might do:

	ioctl(fd, FS_IOC_SETFSLABEL, "foo");

Rather than:

	char label[FSLABEL_MAX] = "foo";

	ioctl(fd, FS_IOC_SETFSLABEL, label);

At least that's how I understand the ioctl; AFAICS it does not have a man page,
so I'm not sure what was intended.  Assuming the buffer is always FSLABEL_MAX
bytes seems like a really bad idea though, since if users pass a conventional
string (as is the natural thing to do; open() doesn't require a buffer of length
PATH_MAX, for example...) it will succeed/fail at random depending on whether
the following page is mapped or not.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
