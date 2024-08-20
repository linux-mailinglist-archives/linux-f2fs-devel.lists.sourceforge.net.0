Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14B957B53
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 04:09:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgEJX-0004Z6-DQ;
	Tue, 20 Aug 2024 02:09:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgEJW-0004Z0-6i
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 02:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n5gUIYm0ftLm58Q1poEIxgmBZd1dDKJob+wHSMFBAzA=; b=Sb8Q16z5PjudR31NkH+alG9esJ
 eyD9X6+bCJX1Uj7XQOmt3Sj00AuENqTI1dExJCwGyUzx+sgnnQjMG/dZ7m+prX6GlGm+UCP070/3E
 3XqfkjropZ33IzGqtyPsUtTerR77tZ8aWcrsvWKQYlD/ngmhgHT9MsoTD1BQ9QGMpiS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n5gUIYm0ftLm58Q1poEIxgmBZd1dDKJob+wHSMFBAzA=; b=QF5LyqDKcQgSsFCw/jFmFE/Vqx
 78a1tf33SUgZAWuNc71aDZ9tNh0x9S5IfeDFnwb7B2IpA1Is2/gzHwmAn9Ao49ueANVa2Ttu7+EXz
 9Z/u+0EjDRH6/pH9dDgvpfPAFhPsDDpV7vJ7z2cy3gQHsxNy+Zs+sX/j6if6f4t5jhqo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgEJU-00013s-UL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 02:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94AE96068C;
 Tue, 20 Aug 2024 02:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052F5C4AF09;
 Tue, 20 Aug 2024 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724119766;
 bh=hPjlTpQPeXctC1ks/ybaHTT4qdOGBPfiE0hnBchvAOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FGfkeZDqudzSARiYoAhN6eiVGtXxfta5ZsA44nicPsQj9lHQcUgLCQ1Kh+n5xGstP
 yWZkD1cxW+Cr9QShGd+9m8NM7bNFxEWMBK1Hu/MwKSDTE0XJbMNiBpm11MtAd56KJm
 5aRzkHCrsUmf4v4VNVnAjqnSHyEqVoQ4gHBhpFosWPjw0CR4RIs2zZdX2fIcDVo0w9
 vexKfEwbZk3VVVLULRAZf6gC4+W6augELYKtdwizgZos2LFK4iehDDluJNHqs1cb9p
 +/KOPJ43PLOy6cBWzcsv/ssLdM7xcu/42dYCngUJBDe+DDDZ8vvTm+rQN2vXucfe1i
 ek34FEzhy0jag==
Message-ID: <173ad2f9-94cd-41e0-9759-baf337019221@kernel.org>
Date: Tue, 20 Aug 2024 10:09:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240816040703.736887-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240816040703.736887-1-shinichiro.kawasaki@wdc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/16 12:07,
 Shin'ichiro Kawasaki wrote: > As the helper
 function f2fs_bdev_support_discard() shows, f2fs checks if > the target block
 devices support discard by calling > bdev_max_discard_sect [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgEJU-00013s-UL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: check discard support for
 conventional zones
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
Cc: Christoph Hellwig <hch@infradead.org>, Damien Le Moal <dlemoal@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/16 12:07, Shin'ichiro Kawasaki wrote:
> As the helper function f2fs_bdev_support_discard() shows, f2fs checks if
> the target block devices support discard by calling
> bdev_max_discard_sectors() and bdev_is_zoned(). This check works well
> for most cases, but it does not work for conventional zones on zoned
> block devices. F2fs assumes that zoned block devices support discard,
> and calls __submit_discard_cmd(). When __submit_discard_cmd() is called
> for sequential write required zones, it works fine since
> __submit_discard_cmd() issues zone reset commands instead of discard
> commands. However, when __submit_discard_cmd() is called for
> conventional zones, __blkdev_issue_discard() is called even when the
> devices do not support discard.
> 
> The inappropriate __blkdev_issue_discard() call was not a problem before
> the commit 30f1e7241422 ("block: move discard checks into the ioctl
> handler") because __blkdev_issue_discard() checked if the target devices
> support discard or not. If not, it returned EOPNOTSUPP. After the
> commit, __blkdev_issue_discard() no longer checks it. It always returns
> zero and sets NULL to the given bio pointer. This NULL pointer triggers
> f2fs_bug_on() in __submit_discard_cmd(). The BUG is recreated with the
> commands below at the umount step, where /dev/nullb0 is a zoned null_blk
> with 5GB total size, 128MB zone size and 10 conventional zones.
> 
> $ mkfs.f2fs -f -m /dev/nullb0
> $ mount /dev/nullb0 /mnt
> $ for ((i=0;i<5;i++)); do dd if=/dev/zero of=/mnt/test bs=65536 count=1600 conv=fsync; done
> $ umount /mnt
> 
> To fix the BUG, avoid the inappropriate __blkdev_issue_discard() call.
> When discard is requested for conventional zones, check if the device
> supports discard or not. If not, return EOPNOTSUPP.
> 
> Fixes: 30f1e7241422 ("block: move discard checks into the ioctl handler")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
