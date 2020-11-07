Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 331412AA6DA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Nov 2020 18:17:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kbRpr-0006uS-Ap; Sat, 07 Nov 2020 17:17:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kbRpp-0006ty-2f
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Nov 2020 17:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C4lQpV/c1bF5WWl58x7Te9DBvP/DX6Mdw9Z4cvospjY=; b=b3urmbbSPSgP8avdkyHS+cC1xs
 6hck8vD6qalPp7MB4l5TqvEhrLmBBpaUD0Lagf7cXf5NjHvfZl6q2Tn5xbVi+SQhIZ8sbwrgL3Dta
 hYBPrOzPQRm2dAVUI+R17lkr9alk6mk9o/XWua1T1XS6wWoyO5FOIQAzgxh5sXsIl658=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C4lQpV/c1bF5WWl58x7Te9DBvP/DX6Mdw9Z4cvospjY=; b=iGtl9uIVyTSlIs5VmHBsEoqRbs
 OUkLvSuD1XwL8QGLnMZaPH7mTmpC9TisGph/OJUDNW6bB2eYQK6tFmLMOL9frpET6JNZX+F0P4GWp
 JL/4Ulx9igdaAu2eoyhCYs6leWiWB9333muOjjhc7t0IBoE5rr8lmwqj4KsAPc1x/6E0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kbRpZ-00CeUE-JL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Nov 2020 17:17:04 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA66920878;
 Sat,  7 Nov 2020 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604769397;
 bh=VMqMnbjzVosHlpvEbYLFq0+HfLfBtdYGJjT4bgAoHwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2ui2PMqzN7ca8Nvf247liiW9Wo9Ev9y9RKgduhAAE7ePQEy/9u/ZCaeqZo1TEG3Hn
 2ppqn5AxFu2mu8oB0jzJIzyI68sr3m6vuJSfiRrdBbDURRJ9A8biG/YMQZU7a72gAF
 tudE7+nsHEas5RborIZ10LGVZLpKlJu3BblKxiRA=
Date: Sat, 7 Nov 2020 09:16:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20201107171635.GA841@sol.localdomain>
References: <20201106065331.76236-1-yuchao0@huawei.com>
 <20201106180324.GA78548@sol.localdomain>
 <a7e78b61-021a-444d-eb36-68ce7aae133e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7e78b61-021a-444d-eb36-68ce7aae133e@kernel.org>
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
X-Headers-End: 1kbRpZ-00CeUE-JL
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

On Sat, Nov 07, 2020 at 05:25:23PM +0800, Chao Yu wrote:
> On 2020/11/7 2:03, Eric Biggers wrote:
> > On Fri, Nov 06, 2020 at 02:53:31PM +0800, Chao Yu wrote:
> > > +#if defined(__KERNEL__)
> > > +struct compat_f2fs_gc_range {
> > > +	u32 sync;
> > > +	compat_u64 start;
> > > +	compat_u64 len;
> > > +};
> > 
> > There's no need to use '#if defined(__KERNEL__)' in kernel source files.
> > 
> > Likewise for compat_f2fs_move_range.
> 
> Correct.
> 
> > 
> > > +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
> > > +{
> > > +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
> > > +	struct compat_f2fs_gc_range __user *urange;
> > > +	struct f2fs_gc_range range;
> > > +	int err;
> > > +
> > > +	if (unlikely(f2fs_cp_error(sbi)))
> > > +		return -EIO;
> > > +	if (!f2fs_is_checkpoint_ready(sbi))
> > > +		return -ENOSPC;
> > 
> > I still don't understand why this checkpoint-related stuff is getting added
> > here, and only to the compat versions of the ioctls.  It wasn't in the original
> > version.  If they are needed then they should be added to __f2fs_ioc_gc_range()
> > and __f2fs_ioc_move_range() (preferably by a separate patch) so that they are
> 
> If so, cp-related stuff will be checked redundantly in both f2fs_ioctl() and
> __f2fs_ioc_xxx() function for native GC_RANGE and MOVE_RANGE ioctls, it's
> not needed.
> 

Oh I see, the cp-related checks are at the beginning of f2fs_ioctl() too.

In that case a much better approach would be to add __f2fs_ioctl() which is
called by f2fs_ioctl() and f2fs_compat_ioctl(), and have f2fs_ioctl() and
f2fs_compat_ioctl() do the cp-related checks but not __f2fs_ioctl().

I feel that's still not entirely correct, because ENOTTY should take precedence
over EIO or ENOSPC from the cp-related stuff.  But at least it would be
consistent between the native and compat ioctls, and the cp-related checks
wouldn't have to be duplicated in random ioctls...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
