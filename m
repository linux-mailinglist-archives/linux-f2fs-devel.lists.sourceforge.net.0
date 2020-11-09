Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB442AC368
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Nov 2020 19:12:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcBeT-0001Yk-Cr; Mon, 09 Nov 2020 18:12:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kcBeR-0001YX-Iu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 18:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R96JuBMLrFTBQG/c0iLhS/HZJQT+Dg307Dz2jWPuHus=; b=aYcyHhaUnt+t3eoOvmVWfjMcNw
 K9NWP/IkoLrcnMVQHbYBjtK4itOxOqZvEmVBDN1Za4EyUc8KH4bRse9ZG2djW4JE5tK33uld07PZ5
 rxGuk6JC2G1NIzcftz1veH6BehS9Uwdso7MizhZ9fjQbTOFx6xWBFERJTPEx4yJrhSsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R96JuBMLrFTBQG/c0iLhS/HZJQT+Dg307Dz2jWPuHus=; b=N7N4rJ7uHj+HVrL9fEykxXEHUS
 YFORJc8CESoqRbfOOLjQBbMkXQKCAkrBnww4pID5GLjlwkoaM54rHmP+sxDRynL8htULpLM+3VejD
 7EaRjrDeUrVYbhSi88HiZ40iQTrKJVYLvLA7dYSKZpzBivztmZO/Bmr14L0DK9PjwkqE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcBeL-00EY3O-K4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 18:12:23 +0000
Received: from gmail.com (unknown [104.132.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BDC320644;
 Mon,  9 Nov 2020 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604945526;
 bh=tsjnf5mmTj0EScyRB7zrXWKWdSc7EtXrjBjYMukdyA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wk08W6kNcA29qf+RsYjb2LrGwZhhwDSeAhmCxNJn4RCzUGW5OUYPn655TQLeJMlVe
 ZndxtRZ8w2JIvhUauqKK0mf7xb4MpXDIYPENdxJcNOVmX1OfStAU92kXQ3F0UA+zDA
 0wFNS0tflmZ2otx2JfzzijCE/b9ciaSYQmuy5HsA=
Date: Mon, 9 Nov 2020 10:12:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201109181204.GA1232946@gmail.com>
References: <20201106065331.76236-1-yuchao0@huawei.com>
 <20201106180324.GA78548@sol.localdomain>
 <a7e78b61-021a-444d-eb36-68ce7aae133e@kernel.org>
 <20201107171635.GA841@sol.localdomain>
 <63efaa5c-bc19-4b16-653d-840bc6a6d9d1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63efaa5c-bc19-4b16-653d-840bc6a6d9d1@huawei.com>
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
X-Headers-End: 1kcBeL-00EY3O-K4
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

On Mon, Nov 09, 2020 at 10:29:25AM +0800, Chao Yu wrote:
> > Oh I see, the cp-related checks are at the beginning of f2fs_ioctl() too.
> > 
> > In that case a much better approach would be to add __f2fs_ioctl() which is
> > called by f2fs_ioctl() and f2fs_compat_ioctl(), and have f2fs_ioctl() and
> > f2fs_compat_ioctl() do the cp-related checks but not __f2fs_ioctl().
> 
> Will this cleanup make sense to you?

I think it would be better to do it the way I suggested.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
