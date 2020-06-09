Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D13BE1F495A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2020 00:26:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jimgz-0008TA-2F; Tue, 09 Jun 2020 22:26:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jimgx-0008T3-6O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 22:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVSqZcFDrvuWqqH0JoEFm+NZ+Gi/zDN4ufFn+YTMaGA=; b=W2Ai8tblpOjcWhqZFbEts9BIyI
 w6WqIM51D8H1n9HmSWQuVKPt1+r40hqDEgEFqH9mVEjTED0CyfWnq/kNJIv9hhiXe+QVB7vlXCN4I
 b4WFFzYgNxRGixf4xlOssLWMx1TYAA00T8u/tFl6S1lqnIazdk12iZOVf5UEsDQISBZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eVSqZcFDrvuWqqH0JoEFm+NZ+Gi/zDN4ufFn+YTMaGA=; b=HZSpJeIGmifLDiBmDLcLRhPTye
 64Mb8Oe0Nz9W3hY5ZuB8qAzH6aDxhXJVtuVbqgSEJOOED/6mnWHrsLNBE3PkPkqYSh89YQ6cBF9wU
 1LoiQ32koZ+zMgDeYg1n2vQ3JokPyeDlXCIjn5KE+uP4KBYSEreol1VvZ/qzsgPZKOGU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jimgr-00F5xt-CW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 22:25:59 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2A942076A;
 Tue,  9 Jun 2020 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591741548;
 bh=ZiGAAxqcuhhxs9PvbPCqFEGjRFXCgrcwJReQFO7XA/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YSnJYXuAPyspiryhmezalX+GIx2SO/+uaN8GXwI1F2HabMRxXr0kjFyK6SOXCtjK9
 wUUslCpX28JCbXSpwFWhWHKxElpHpvfGN0jX723t5Us5YaPPi7d1O05X8dNh0za+bg
 bL6MZVZY/YwT6XSFVsshHn3CYHyZ3dHYOaMH9Ayk=
Date: Tue, 9 Jun 2020 15:25:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Denis Efremov <efremov@linux.com>
Message-ID: <20200609222546.GA24766@sol.localdomain>
References: <20200605181533.73113-1-efremov@linux.com>
 <20200609221446.24537-1-efremov@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609221446.24537-1-efremov@linux.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jimgr-00F5xt-CW
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: use kfree() instead of kvfree() to
 free superblock data
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 10, 2020 at 01:14:46AM +0300, Denis Efremov wrote:
> Use kfree() instead of kvfree() to free super in read_raw_super_block()
> because the memory is allocated with kzalloc() in the function.
> Use kfree() instead of kvfree() to free sbi, raw_super in
> f2fs_fill_super() and f2fs_put_super() because the memory is allocated
> with kzalloc().
> 
> Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
> Signed-off-by: Denis Efremov <efremov@linux.com>

I don't think "Fixes" is appropriate here.

kvfree() still works on kmalloc'ed memory; it's just not preferred.

So this is more a cleanup than a fix.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
