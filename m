Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3ED3BDF45
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jul 2021 00:07:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0tDf-00009f-At; Tue, 06 Jul 2021 22:07:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>) id 1m0tDd-00009R-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 22:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1wfjeeW9xv5JxDXd+N4LOxrVb+XRNJYNZmohOySDnI4=; b=eHk/g5y9HZAWIVNzpblvhEYg0g
 CYIQbY+nMyL1X1IXSoaQORmBkzl6nYmeNQLCMsN4YAPy7aLuTKcl7+r6aHp2Z1JksdX4b+ojbVPb3
 lCR3Ji5WmUq3pmffqmEk4/lgrGUksdW/iabr60CtzylOuANA4vpreieEgkyAMJ4wGuXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1wfjeeW9xv5JxDXd+N4LOxrVb+XRNJYNZmohOySDnI4=; b=Pna89LUlez5RUW+yHCFj50KR1T
 wlgyu/UZtfXca8nMJrd1KKAdQiL6uEbfSEQEcTFktlQMqUwyE+UAP5JWyhTp40JvMHq/geMsBZHrx
 tiwz6ro+dmUKEJcNueHSGg5vJB1ZEij+MVbwvagQpkBosM0UEns3ruHRC7Dyi2i+covE=;
Received: from mail107.syd.optusnet.com.au ([211.29.132.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1m0tDU-00Cqmf-R7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 22:07:05 +0000
Received: from dread.disaster.area (pa49-179-204-119.pa.nsw.optusnet.com.au
 [49.179.204.119])
 by mail107.syd.optusnet.com.au (Postfix) with ESMTPS id C796E7177;
 Wed,  7 Jul 2021 08:06:47 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1m0tDK-003Yhh-JT; Wed, 07 Jul 2021 08:06:46 +1000
Date: Wed, 7 Jul 2021 08:06:46 +1000
From: Dave Chinner <david@fromorbit.com>
To: Wang Shilong <wangshilong1991@gmail.com>
Message-ID: <20210706220646.GO664593@dread.disaster.area>
References: <20210702140243.3615-1-wangshilong1991@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702140243.3615-1-wangshilong1991@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0
 a=Xomv9RKALs/6j/eO6r2ntA==:117 a=Xomv9RKALs/6j/eO6r2ntA==:17
 a=kj9zAlcOel0A:10 a=e_q4qTt1xDgA:10 a=lB0dNpNiAAAA:8 a=7-415B0cAAAA:8
 a=5GLb7GpSppZt8VVZA_8A:9 a=CjuIK1q_8ugA:10 a=c-ZiYqmG3AbHTdtsH08C:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1m0tDU-00Cqmf-R7
Subject: Re: [f2fs-dev] [PATCH v3] fs: forbid invalid project ID
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 02, 2021 at 10:02:43AM -0400, Wang Shilong wrote:
> fileattr_set_prepare() should check if project ID
> is valid, otherwise dqget() will return NULL for
> such project ID quota.
> 
> Signed-off-by: Wang Shilong <wshilong@ddn.com>
> ---
> v2->v3: move check before @fsx_projid is accessed
> and use make_kprojid() helper.
> 
> v1->v2: try to fix in the VFS
> ---
>  fs/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 1e2204fa9963..d7edc92df473 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -806,6 +806,8 @@ static int fileattr_set_prepare(struct inode *inode,
>  	if (err)
>  		return err;
>  
> +	if (!projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
> +		return -EINVAL;
>  	/*
>  	 * Project Quota ID state is only allowed to change from within the init
>  	 * namespace. Enforce that restriction only if we are trying to change

I still don't think this is correct - read the comment directly
below where you put this. That was the code block I was referring to
early:

        /*
         * Project Quota ID state is only allowed to change from within the init
         * namespace. Enforce that restriction only if we are trying to change
         * the quota ID state. Everything else is allowed in user namespaces.
         */
        if (current_user_ns() != &init_user_ns) {
                if (old_ma->fsx_projid != fa->fsx_projid)
                        return -EINVAL;
                if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
                                FS_XFLAG_PROJINHERIT)
                        return -EINVAL;
        }

IOWs: if we are not changing the projid, then we should not be
checking it for validity because of the way the whole get/set
interface works.

The reason for this is that this interface is a get/set pair, where
you first have to get the values from the filesystem, then modify
them and send the set back to the filesystem. If the filesystem
sends out fsx_projid = -1 (for whatever reason), the caller must
send that same value back into the filesystem if they are not
modifying the project ID. Hence we have to accept any projid from
the caller that matches the current filesystem value, regardless of
whether it is an invalid value or not.

Therefore, we should only be checking if fa->fsx_projid is valid if
it is different to the current filesystem value *and* we are allowed
to change it. So:

        /*
         * Project Quota ID state is only allowed to change from within the init
         * namespace. Enforce that restriction only if we are trying to change
         * the quota ID state. Everything else is allowed in user namespaces.
         */
        if (current_user_ns() != &init_user_ns) {
                if (old_ma->fsx_projid != fa->fsx_projid)
                        return -EINVAL;
                if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
                                FS_XFLAG_PROJINHERIT)
                        return -EINVAL;
        } else {

		/*
		 * Caller is allowed to change the project ID. If it is being
		 * changed, make sure that the new value is valid.
		 */
                if (old_ma->fsx_projid != fa->fsx_projid &&
		    !projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
			return -EINVAL;
	}

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
