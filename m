Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DE1A0511
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 04:59:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLeSS-0003AJ-V5; Tue, 07 Apr 2020 02:59:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jLeSR-0003AB-B5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 02:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+bJUzPPztbAq//Vd+qvihD+LlMRyT7IQThvcZrzn+mQ=; b=cl+01CsEGZ2O7rD+uMne5IJ6eQ
 xMcjXnAxCOXuvjUqI7YYsY6dy45+ub0D2pGe2KzIBBBYBPizuuzgEd+LDVNQ0NsEZF7SQt5IhuWSj
 AYz96X20gDuLU5FZrRBOJbARqEtgf2Vea+GRehM6AvrTQLwsbXwYJ9EEofLcrjI/xjz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+bJUzPPztbAq//Vd+qvihD+LlMRyT7IQThvcZrzn+mQ=; b=OJPiZF+EjGqcm3POpAwDVCAzUG
 2s4P+/JKa2jcOayFryi624DBd1RU6A9wHG+eiB7juts7TKiIx3duOK+4Z36BAVJc8Z38nIp/D9DRg
 q/5AyLavuBcCCW6MG1+/joMVuDoapRryL5WBZeKUl97m19QPZAGZIbjBtF542thtyHHQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLeSN-0064R7-4S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 02:59:23 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E9EB206B8;
 Tue,  7 Apr 2020 02:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586228353;
 bh=uCEYpsh9Jd3K0aQzSvHvZohM9flM5mt0gbSjnm7/fRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F83BPuKRPnc+n9k++4IHrZRu3SWw4fwo5TjPh13e8iM/wXxKm5WFfFFFnnjkQFJau
 aFpwsHskvObGjROB/ii3oJuow/hRFM33NFCqiNkxnBy5ILTP/iFKw8isnzyS5Vrzwo
 CFyL86GW53bNQppJ7R0T0+KC+R0rKNAWnJJs9+qY=
Date: Mon, 6 Apr 2020 19:59:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200407025913.GB137081@google.com>
References: <20200403161249.68385-1-jaegeuk@kernel.org>
 <0e627c29-7fb0-5bd6-c1d9-b96a94df62ae@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e627c29-7fb0-5bd6-c1d9-b96a94df62ae@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jLeSN-0064R7-4S
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce sysfs/data_io_flag to attach
 REQ_META/FUA
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/07, Chao Yu wrote:
> On 2020/4/4 0:12, Jaegeuk Kim wrote:
> > This patch introduces a way to attach REQ_META/FUA explicitly
> > to all the data writes given temperature.
> > 
> > -> attach REQ_FUA to Hot Data writes
> > 
> > -> attach REQ_FUA to Hot|Warm Data writes
> > 
> > -> attach REQ_FUA to Hot|Warm|Cold Data writes
> > 
> > -> attach REQ_FUA to Hot|Warm|Cold Data writes as well as
> >           REQ_META to Hot Data writes
> 
> Out of curiosity, what scenario it is used for?

It's testing purpose to compare the bandwidths per different IO flags.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
