Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD31F9EE6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 19:58:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jktNG-0004w5-6F; Mon, 15 Jun 2020 17:58:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jktNF-0004vr-HU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 17:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/DVT1KKJsuUqFvkFf47xqYBDJ8or9vALjKMTx11OR0Q=; b=b9rueo5/h46OrInznM+9w/r7vd
 PApv/YQf2k5wJEUL39WdEsZVPv37CIXjvyB6V8lruTxDh9c6p/OQ+D744m3ELZSTWkq9KC/+nBvuN
 7mVqPKp7Z/xugGTqfqRLTz9UEMD9J0e7QLZJ0OwF79I+03pVW2WPNGr46gJPJHuHhLmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/DVT1KKJsuUqFvkFf47xqYBDJ8or9vALjKMTx11OR0Q=; b=UGjah5LuTbR9z5E9TvlrBJ2X5Z
 4dLN+0nmpHspIYvI2e6PTKvyycwS/42stQNYHjbNaXvu1MoeYw33QHbWryu5LnFfVTbsVo3tFJ+vu
 gG1cTUELLeMCA/1SeeM86C0fsi70F++k09yvuD3zRgb648EPQwsCtUrUvBoqJNxWxsi8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jktNC-006rj5-SJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 17:58:21 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70F16206F1;
 Mon, 15 Jun 2020 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592243881;
 bh=sNn6POHHZDQ9IACdImpskz4O92eeG7vzTpa1ghfyuIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vBF2Zxx90O2zggkzdqrAvirH4V7LShHUF+GDy3ptW5L7oxSbyT8KVN/EdksTccAvq
 uehEHRNxZHyTfjZ9B8RFvonWNW/QM+E0eGz2XLZ8mOvann9+NoXAHxcX/HlQLvQocE
 7gstnuq2N80VfOQLZgPpIUx6uS69D+ihemIeoGcI=
Date: Mon, 15 Jun 2020 10:58:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200615175800.GA117170@google.com>
References: <20200605181533.73113-1-efremov@linux.com>
 <20200609221446.24537-1-efremov@linux.com>
 <20200609222546.GA24766@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609222546.GA24766@sol.localdomain>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jktNC-006rj5-SJ
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
Cc: linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/09, Eric Biggers wrote:
> On Wed, Jun 10, 2020 at 01:14:46AM +0300, Denis Efremov wrote:
> > Use kfree() instead of kvfree() to free super in read_raw_super_block()
> > because the memory is allocated with kzalloc() in the function.
> > Use kfree() instead of kvfree() to free sbi, raw_super in
> > f2fs_fill_super() and f2fs_put_super() because the memory is allocated
> > with kzalloc().
> > 
> > Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
> > Signed-off-by: Denis Efremov <efremov@linux.com>
> 
> I don't think "Fixes" is appropriate here.

Agreed. I queued this Cl without it. :)
Thanks,

> 
> kvfree() still works on kmalloc'ed memory; it's just not preferred.
> 
> So this is more a cleanup than a fix.
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
