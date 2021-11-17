Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF84540D9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Nov 2021 07:23:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mnEM6-00081k-Ow; Wed, 17 Nov 2021 06:23:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1mnEM4-00081e-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Nov 2021 06:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFZklISTh+TfMqu98bk8qGSgFz87dXK4Hx0CM0DMRZg=; b=lUh5D4J4pwRrk5a0ujPcyWPkxy
 s1RwFeBQVvJm2D4TMcqgn8tIvxbJwtLuAMt+9l5DInobBg4GFSMYe94ynlzouiDwbWyOjAWI7Ci06
 92t6Yhnjy+S5Z3p0W8i2qfsS7NVdeqQWsgiC6yh2UnE6Ujyd3Flloif2UkdHP/cf6Gd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FFZklISTh+TfMqu98bk8qGSgFz87dXK4Hx0CM0DMRZg=; b=GGprEGMF8uq22AV/VFV4fUCiqX
 MrrIjq8RSElpwal0L0nNeUkvDwS7Tg8pKd793ZZrDp27ATQGpV+Axoeyr62IKyMsXb6WxfnyOHLll
 W90B1MkIUe5LazgM5w4xAlcXsL18GRCx9amHWL1BHmw+UjvJzOra7IU9PqxVvqpy9F7g=;
Received: from mail109.syd.optusnet.com.au ([211.29.132.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mnEM0-00047h-6T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Nov 2021 06:23:36 +0000
Received: from dread.disaster.area (pa49-195-103-97.pa.nsw.optusnet.com.au
 [49.195.103.97])
 by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id EC51AA46A9;
 Wed, 17 Nov 2021 16:53:13 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1mnDsd-009nSO-AO; Wed, 17 Nov 2021 16:53:11 +1100
Date: Wed, 17 Nov 2021 16:53:11 +1100
From: Dave Chinner <david@fromorbit.com>
To: NeilBrown <neilb@suse.de>
Message-ID: <20211117055311.GS449541@dread.disaster.area>
References: <163712329077.13692.12796971766360881401@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <163712329077.13692.12796971766360881401@noble.neil.brown.name>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=619498ca
 a=fP9RlOTWD4uZJjPSFnn6Ew==:117 a=fP9RlOTWD4uZJjPSFnn6Ew==:17
 a=kj9zAlcOel0A:10 a=vIxV3rELxO4A:10 a=7-415B0cAAAA:8
 a=WAyi4Cf-4lf-hVXyuRgA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 17, 2021 at 03:28:10PM +1100, NeilBrown wrote:
 > > Various places in the kernel - largely in filesystems - respond to a
 > memory allocation failure by looping around and re-trying. ..... > [...]
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [211.29.132.80 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1mnEM0-00047h-6T
Subject: Re: [f2fs-dev] [PATCH] MM: introduce memalloc_retry_wait()
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
Cc: linux-nfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 17, 2021 at 03:28:10PM +1100, NeilBrown wrote:
> 
> Various places in the kernel - largely in filesystems - respond to a
> memory allocation failure by looping around and re-trying.
.....
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index aca874d33fe6..f2f2a5b28808 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -214,6 +214,27 @@ static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
>  static inline void fs_reclaim_release(gfp_t gfp_mask) { }
>  #endif
>  
> +/* Any memory-allocation retry loop should use
> + * memalloc_retry_wait(), and pass the flags for the most
> + * constrained allocation attempt that might have failed.
> + * This provides useful documentation of where loops are,
> + * and a central place to fine tune the waiting as the MM
> + * implementation changes.
> + */
> +static inline void memalloc_retry_wait(gfp_t gfp_flags)
> +{
> +	gfp_flags = current_gfp_context(gfp_flags);
> +	if ((gfp_flags & __GFP_DIRECT_RECLAIM) &&
> +	    !(gfp_flags & __GFP_NORETRY))
> +		/* Probably waited already, no need for much more */
> +		schedule_timeout_uninterruptible(1);
> +	else
> +		/* Probably didn't wait, and has now released a lock,
> +		 * so now is a good time to wait
> +		 */
> +		schedule_timeout_uninterruptible(HZ/50);
> +}

The existing congestion_wait() calls io_schedule_timeout() under
TASK_UNINTERRUPTIBLE conditions.

Does changing all these calls just to a plain
schedule_timeout_uninterruptible() make any difference to behaviour?
At least process accounting will appear different (uninterruptible
sleep instead of IO wait), and I suspect that the block plug
flushing in io_schedule() might be a good idea to retain for all the
filesystems that call this function from IO-related routines.

Cheers,

Dave.

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
