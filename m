Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE106C0B1E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 20:32:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDv2D-0000Km-3B; Fri, 27 Sep 2019 18:32:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iDv29-0000KT-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 18:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H+b7t4CL+d0AivAGUx4OduTFQtjYfL6lRY7UDWytFXE=; b=UepUBgw57KU0G+ko6+ggLp1mqD
 8rCVWN1wvJ5Nl1vv2Yhd39DepV7tPuIda/KpBDvwdxue92TJ3BALVhRK1/kqNRb6qOwxU4XKNdlWk
 PNBeV0mnumoYIFW9v0rMx8lktzMZxVxn8+xCrkaKhi+dycWxdRNmK4z0se6TO+hvA48A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H+b7t4CL+d0AivAGUx4OduTFQtjYfL6lRY7UDWytFXE=; b=FWgFVJVW4qb1My/WCxIOCRO4un
 epCiPCW9X+V9QpYIH36WdcGweEOyWUIfgCM7J1z69pLQQwjmucjXMNYwMv1A0FUoOH50lYs4a6fF8
 BY8W2QZAhDAZuWWljkRz/sF/EJ3vv3/TbWRfd+M6Vd2YjA0DuPG6CvexbGHMTsEukU/4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDv26-00BdRy-7n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 18:32:01 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E055C21655;
 Fri, 27 Sep 2019 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569609111;
 bh=UNYxnX4ntOFxEKSdlmc5QQCfq4+Ba7pJxunUt3oMuws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kZVr6zCc/phZF094x9qSudrSwmAlQIGe7hgbRWWLe8ydALl1rW/o5ooTk5kAgqY4y
 IL8fqL9nBl9bA7u5n3G5MBTgiSQMYybOB9HVHGnRTHE98uhZ3NLdVyA3c5J7tleQls
 fNGHpQEJBaCAUPR+GzyOlQltbGZ8S9p3jhnAM+n0=
Date: Fri, 27 Sep 2019 11:31:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190927183150.GA54001@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190925093050.118921-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925093050.118921-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iDv26-00BdRy-7n
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix comment of f2fs_evict_inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On 09/25, Chao Yu wrote:
> evict() should be called once i_count is zero, rather than i_nlinke
> is zero.
> 
> Reported-by: Gao Xiang <gaoxiang25@huawei.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index db4fec30c30d..8262f4a483d3 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -632,7 +632,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>  }
>  
>  /*
> - * Called at the last iput() if i_nlink is zero

I don't think this comment is wrong. You may be able to add on top of this.

> + * Called at the last iput() if i_count is zero
>   */
>  void f2fs_evict_inode(struct inode *inode)
>  {
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
