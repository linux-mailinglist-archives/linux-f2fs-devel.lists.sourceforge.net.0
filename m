Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09762335B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Nov 2022 20:22:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osqe3-0007FJ-VT;
	Wed, 09 Nov 2022 19:21:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1osqe2-0007FC-1j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 19:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQ2vPUoDxUbbcy9diqgjC3Orai/rhdTHUsZfq/DDEpw=; b=QKngcu7jk7xcqb1CAucTUcHs/O
 NrU4u+chOlq0z/QIvazg78gzTGE9qF+AeBo9xgq/QU73lq5UQuMRP4kIydye00pPYiBMhtNQx9mjV
 ggJgAOFbgc2mgL9SU0+oEEn4nxDQQus4qDiQmFE8YVOMV3RVj/pI7i/odr0LUnlsaxlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQ2vPUoDxUbbcy9diqgjC3Orai/rhdTHUsZfq/DDEpw=; b=IF1aalSaiUdcHcKv8A+M3I2hON
 2UEEK2Z1nXjMjU/RJHYPvz8UR5VPu41eJiuGJAC6oT8aBXdi0nzWtP/09Kz3hGGvmPfBtfsGEPCBR
 PlV8ujEAfgGtcZl+LSMI8+x/uGabuBDPMddZzirHU+lnTBEp7iRajpb+2w/9P8f4yIJo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osqdy-0000Qa-6G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 19:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZQ2vPUoDxUbbcy9diqgjC3Orai/rhdTHUsZfq/DDEpw=; b=FhhabxTgJncNJEnewud2PD9ANd
 LFGrejsVxd/AAHK4Rl2XgoIINKNfyd1xajmnrteTPbfpvlfDvwTIELsl+Dovpu7KIbC+S92p3fCL5
 1sp3qOtUHKvkUIls5mjzrBb8NG+QBC3k9RhCEo5kWjn8c6i1pWJNppcBhz9GsxNoj5VWdOUjYJbtv
 UKWCIK+b7SFP0vsZT1Y5EZOAGV5ylSvrW2H3iPe+nNO4DGTJQAwY1HrR4YXPe+whrsmmUO7lwR3h2
 XWf8a9nF5NRoyt3nXNLnHm12iFtW3YZKZ5yfTmplds0kw1WPKH4e7b02UbYYFVMVvUhF7wUFlTzRX
 qWcgMG2g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1osqdZ-00BSTh-CT; Wed, 09 Nov 2022 19:21:25 +0000
Date: Wed, 9 Nov 2022 19:21:25 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y2v9tZEXxSyF0LnZ@casper.infradead.org>
References: <20221109183549.11012-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109183549.11012-1-frank.li@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 10, 2022 at 02:35:49AM +0800, Yangtao Li wrote:
 > +++ b/fs/f2fs/segment.c > @@ -486, 7 +486,
 17 @@ void f2fs_balance_fs_bg(struct
 f2fs_sb_info *sbi, bool from_bg) > static int __submit_flush [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1osqdy-0000Qa-6G
Subject: Re: [f2fs-dev] [PATCH] f2fs: support fault injection for flush
 submission error
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 10, 2022 at 02:35:49AM +0800, Yangtao Li wrote:
> +++ b/fs/f2fs/segment.c
> @@ -486,7 +486,17 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
>  static int __submit_flush_wait(struct f2fs_sb_info *sbi,
>  				struct block_device *bdev)
>  {
> -	int ret = blkdev_issue_flush(bdev);
> +	int ret;
> +
> +	if (time_to_inject(sbi, FAULT_FLUSH)) {
> +		f2fs_show_injection_info(sbi, FAULT_FLUSH);
> +		ret = -EIO;
> +		goto submit;

submit?  You don't submit anything at the 'submit' label.  it should
be called 'skip' or something.  But I think this is just badly written
and you don't need a goto at all.

What I don't understand about this patch is why you want it at all.
What failure are you simulating?  It appears to me that you're
simulating a bug in the filesystem, or maybe a bug in the device
firmware.  But why do you want to do that?

> +	}
> +
> +	ret = blkdev_issue_flush(bdev);
> +
> +submit:
>  
>  	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
>  				test_opt(sbi, FLUSH_MERGE), ret);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a43d8a46a6e5..3d3d22ac527b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>  	[FAULT_DQUOT_INIT]	= "dquot initialize",
>  	[FAULT_LOCK_OP]		= "lock_op",
>  	[FAULT_BLKADDR]		= "invalid blkaddr",
> +	[FAULT_FLUSH]		= "flush error",
>  };
>  
>  void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
> -- 
> 2.25.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
