Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA4627B308
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Sep 2020 19:23:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kMwsT-0003UK-Eq; Mon, 28 Sep 2020 17:23:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kMwsR-0003Sz-EI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 17:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3KMAWSEKq7H09MfVihSBQMAUZXAAwDdewBeHU1AqHjw=; b=iqJI5rqUQ1QEmtipTpy7ZjDdl5
 Shg8TcltQABtV8y6vDOcnJOKsUmM9bgp0yZZjrWLvlnP8hkgXo4k59RW/QhY0tHDp1zSZ1GgLJAnD
 3kbiPvMtfR0vnBvNmK69UK8gWy6I4O8kyaV15sh8GhT2Tnx+MfZE6aComyVRZv/4oSRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3KMAWSEKq7H09MfVihSBQMAUZXAAwDdewBeHU1AqHjw=; b=D4fxk2+RKq5RpAd/rY06nPPl7P
 oJ//7/7m9kF4RBCzseYXa5gdM2wze5WSH1PWsf7P9k+jPK+miNn4Za1zPDuOmMd9nwIUEKHdxUQgw
 U+543nycRAQaOfhK922sbyYAgfzPOm07gg1J/3dUiFSijHDp7Y+B0EJijGPAFIPIOC3o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kMws5-00Bo3J-6y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 17:23:43 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DB7B2080A;
 Mon, 28 Sep 2020 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601313796;
 bh=3KMAWSEKq7H09MfVihSBQMAUZXAAwDdewBeHU1AqHjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZt0JYPX83WpCKydjEkOeffBj9RV0jwQ9/+0Hg8GfP2lE+Vy46hIXTWXBH9oGgw/I
 PzkKKEW73gtNWg8isLLeI1VcpoZV42+Q9YjkF0r/taQTow2p+1MlIxETbEcXpFffg9
 R+HMp5982g1J5NOy4qi4DU3WZ9eAriFd6ai6H5aE=
Date: Mon, 28 Sep 2020 10:23:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200928172314.GB169646@gmail.com>
References: <20200928094239.66221-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928094239.66221-1-yuchao0@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kMws5-00Bo3J-6y
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 segment/section count
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

On Mon, Sep 28, 2020 at 05:42:39PM +0800, Chao Yu wrote:
> As syzbot reported:

Please include the Reported-by line that the syzbot report said to include.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
