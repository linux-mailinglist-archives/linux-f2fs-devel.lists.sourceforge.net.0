Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21027624544
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 16:12:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot9E3-00030y-BH;
	Thu, 10 Nov 2022 15:12:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1ot9Dv-00030q-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 15:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDS8SnZZcS0SPQ3hd4JtwYFgNgfG4Z6tO5Aqk4r9P7M=; b=d2+OeivNO3Zc8uddIoyH9BEqgk
 i1p4l7zmBBUxyTFovLZtiZpc9xoEn/DeOYxC8U6x2oPrED2Imq5XKPjE6uJYcsE1B0h20FfCqxCJz
 pthHN28zkHpqM5pczxOYAGzt2r9IaBTKeYaKcYar3B5cIxQcqVUXgc+HbnQVmL63sA9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GDS8SnZZcS0SPQ3hd4JtwYFgNgfG4Z6tO5Aqk4r9P7M=; b=m6cE2tWOeeuBdk7PscAWP/FLs3
 OnaMCfUk80jlnXodVoWzLNt+etgzO4r6EM5n25gJ/cNazC9xMCP9dv1Ih+jZ0E4k5NNBiCU6GOojt
 7UNptnx1gk/Shg+bVX393XOI4rrtqi6n+7dH3z3zYL4YHiLIQBmo8BrBn1i2Ibp691LE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot9Do-0002jT-UZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 15:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GDS8SnZZcS0SPQ3hd4JtwYFgNgfG4Z6tO5Aqk4r9P7M=; b=gLSOYkudMtjTwff6AEMIEbcIPL
 assZcfTyw/95zMEu+tf3Nw0TdYYucmP0ADqCUX0A9Th37boVIX1bQPLE67+/Fqs8bHBXqlFFue4ii
 wwnSLzxguQ1BTcXbRSrI9CiMdM+TeXsvpy7Xtth6T91zaKB+zJsohn7ioDLn8QcirNY9VQqLGwRqv
 dvCGU4TcDCkQtQtLovntDH0OiXsa/ZpOkXUSElJWalDEVvJIKUf4UURsOwDI2M8cp4iXZfrqdkLMN
 +Rq+wcOgYS7b1jebjW6Ena/n0/zQTj+Ov8kd6lMdpPS0vKQul8jkr48ixVAZIWGixPan1L0cweuAE
 eF8pcX/A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ot9DX-00CA5o-Rz; Thu, 10 Nov 2022 15:11:47 +0000
Date: Thu, 10 Nov 2022 15:11:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y20Us047HVn+dPUg@casper.infradead.org>
References: <20221110032522.64043-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110032522.64043-1-frank.li@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 10, 2022 at 11:25:22AM +0800, Yangtao Li wrote:
 > Since we now support read, write, and discard in FAULT_INJECT, > let's
 add support for flush. But _why_? There is a verifiable thing that didn't
 happen to the data if the read/write/discard fails. If flush fails ... how
 do you know? What do you do? Is this to test that the filesystem fails pro
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ot9Do-0002jT-UZ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support fault injection for flush
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

On Thu, Nov 10, 2022 at 11:25:22AM +0800, Yangtao Li wrote:
> Since we now support read, write, and discard in FAULT_INJECT,
> let's add support for flush.

But _why_?  There is a verifiable thing that didn't happen to the data
if the read/write/discard fails.  If flush fails ... how do you know?
What do you do?  Is this to test that the filesystem fails properly if
the block layer or the device returns a failure?  If so, why have this
code in each filesystem?  We should support that kind of error injection
at the block layer, not individual filesystems.

> This patch supports to inject fault into __submit_flush_wait() to
> simulate flush cmd io error.
> 
> Usage:
> a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or
> b) mount -o fault_type=524288 <dev> <mountpoint>
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  Documentation/filesystems/f2fs.rst |  1 +
>  fs/f2fs/f2fs.h                     |  1 +
>  fs/f2fs/segment.c                  | 12 +++++++++---
>  fs/f2fs/super.c                    |  1 +
>  4 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 6e67c5e6c7c3..316d153cc5fb 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -202,6 +202,7 @@ fault_type=%d		 Support configuring fault injection type, should be
>  			 FAULT_DQUOT_INIT	  0x000010000
>  			 FAULT_LOCK_OP		  0x000020000
>  			 FAULT_BLKADDR		  0x000040000
> +			 FAULT_FLUSH		  0x000080000
>  			 ===================	  ===========
>  mode=%s			 Control block allocation mode which supports "adaptive"
>  			 and "lfs". In "lfs" mode, there should be no random
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 04ef4cce3d7f..832baf08ecac 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -61,6 +61,7 @@ enum {
>  	FAULT_DQUOT_INIT,
>  	FAULT_LOCK_OP,
>  	FAULT_BLKADDR,
> +	FAULT_FLUSH,
>  	FAULT_MAX,
>  };
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index aa4be7f25963..a4813fa33c0f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -486,7 +486,13 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
>  static int __submit_flush_wait(struct f2fs_sb_info *sbi,
>  				struct block_device *bdev)
>  {
> -	int ret = blkdev_issue_flush(bdev);
> +	int ret;
> +
> +	if (time_to_inject(sbi, FAULT_FLUSH)) {
> +		f2fs_show_injection_info(sbi, FAULT_FLUSH);
> +		ret = -EIO;
> +	} else
> +		ret = blkdev_issue_flush(bdev);
>  
>  	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
>  				test_opt(sbi, FLUSH_MERGE), ret);
> @@ -1126,13 +1132,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		if (time_to_inject(sbi, FAULT_DISCARD)) {
>  			f2fs_show_injection_info(sbi, FAULT_DISCARD);
>  			err = -EIO;
> -			goto submit;
> +			goto skip;
>  		}
>  		err = __blkdev_issue_discard(bdev,
>  					SECTOR_FROM_BLOCK(start),
>  					SECTOR_FROM_BLOCK(len),
>  					GFP_NOFS, &bio);
> -submit:
> +skip:
>  		if (err) {
>  			spin_lock_irqsave(&dc->lock, flags);
>  			if (dc->state == D_PARTIAL)
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
