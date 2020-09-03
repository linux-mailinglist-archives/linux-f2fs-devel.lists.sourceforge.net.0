Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E855925C82D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 19:40:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDtDl-0000Av-UA; Thu, 03 Sep 2020 17:40:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kDtDk-0000Ak-1H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 17:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YMb0Xjf85gD6BhNCEqTuHmQatgbgEA7NCUMhXpA8jHQ=; b=fnN3hB63DEFEDVj0Ifi4LGBDE3
 Zf9O7YesDOZY5E1PucFihN1ODvyszoUgXaAMRsGcIWJ0MZn7Z4Ap9jbk5uP2D3RcPUerBePIxYYWo
 P+Mu2oxN5GDQdanIOXdkG0XmAf+AY6ppagNXgoiOagbIkjnaJT8hhAKqfMEBm6WLrq9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YMb0Xjf85gD6BhNCEqTuHmQatgbgEA7NCUMhXpA8jHQ=; b=Gax2KTFj5xAda7eqTl1AjAybDN
 LFWzKV3u6dyuL/KQmICw0Q7KjxWJdc9kh3oj1yM1EKWwLG0YjNhUA+fxR9DV8TPKc3wjB/ajqzLsw
 CW9TTZ8T0zE87kBrbAMmKFdRhqBMCiLxeABWF1PtgTZ2ZvH8grZ+J418K08LRf1WcPeM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDtDe-00AoyB-6J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 17:40:23 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E692620722;
 Thu,  3 Sep 2020 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599154808;
 bh=he/icALJc5nxcmM8oVZBySI9LjdCFoBo+OczlPqUxkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nzCsy3xVMtMVKsfdqUr58p7DNzmt/RChq1Nup4j1boBs2CpaBeZOyBPJLtypL0k0o
 3bwHzfsh8AalyuKNtr9tOeDrjRqgFFekkbLYvHxID3SoeNcIgsTzdbqoObs1/yK3iv
 gY6JI3E6k0uQ6RQA4DZnd2me70ySJhiuu+yKVXQk=
Date: Thu, 3 Sep 2020 10:40:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20200903174007.GA3619770@google.com>
References: <96f99afb-c54e-8f46-ebac-80a62f65b876@infradead.org>
 <20200903103027.4c8d0b07@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903103027.4c8d0b07@lwn.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kDtDe-00AoyB-6J
Subject: Re: [f2fs-dev] [PATCH] f2fs: Documentation edits/fixes
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
Cc: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/03, Jonathan Corbet wrote:
> On Wed, 2 Sep 2020 17:08:31 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > From: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Correct grammar and spelling.
> > 
> > Drop duplicate section for resize.f2fs.
> > 
> > Change one occurrence of F2fs to F2FS for consistency.
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Cc: Chao Yu <yuchao0@huawei.com>
> > Cc: linux-f2fs-devel@lists.sourceforge.net
> > ---
> >  Documentation/filesystems/f2fs.rst |   53 +++++++++++----------------
> >  1 file changed, 23 insertions(+), 30 deletions(-)
> 
> So this, I guess, needs to go through the f2fs tree since it doesn't apply
> to docs-next currently.

Yup, I applied in f2fs tree.
Thanks,

> 
> Thanks,
> 
> jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
