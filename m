Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C6027F17
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 16:07:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hToN4-0007q2-7k; Thu, 23 May 2019 14:07:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hToN1-0007pG-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/23A9FrdktIRuh+PBxrnJISgI0oWF+f1vioKZtkvazg=; b=U6Ws9PC0OtdJ7nzzaIROU7Uz5p
 RmXax7k0YI3dBaYQEqsdcMg636U4M3G6tmRJXSJN4Nlj+cGyQ3y5HWkpJaiXhEfak4IeQDlQGAo8d
 2m+lcuBbvaO/hxAe48Pi3UoHpRvlxU5i2NW3IbT6s0wjY6oag2OJBULOLvcWKOZTuHpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/23A9FrdktIRuh+PBxrnJISgI0oWF+f1vioKZtkvazg=; b=bIZp3Fa0fCcM76MbpgEDfyLsCU
 lrJTYL7R1lL9zAdotNhrNiUfrTg8jy/sEuD54xanXFfeiZrNT3DRZASvoQyxz9s0e6bvpkEypdPZq
 laBHwTTmmGPRE1Rj+87nVGTR/LJgIjK2YLkLY63Cf3EpA08vs7DcoQll5cxQ7RQZ+AEM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hToMx-002Q2X-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:06:59 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DF0F2133D;
 Thu, 23 May 2019 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558620410;
 bh=yofAkuO3oZzRvvqq5kG2GDeskEKQSmQTEizV/SzhN4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SAfBYJHG3KlTOphWdnGYnm5SsRKuGuX62xESRZY43Oa0iZGdAB7IKn+hXruCGinlJ
 DNxWBhSlCB8l3eMfL64ASJ+TfZfJVPz9jaDQYRF8gQt7kbJmx3Ll/iBvB8+prrww5z
 DdGgGV4rsuzcrWp8VpsLLTuxgy1qCK5IQ0yr+X3Y=
Date: Thu, 23 May 2019 07:06:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190523140649.GA10954@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190521180606.10461-1-jaegeuk@kernel.org>
 <20190522175035.GB81051@jaegeuk-macbookpro.roam.corp.google.com>
 <14672901-54a2-120f-a2ce-52f7d6fb3008@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14672901-54a2-120f-a2ce-52f7d6fb3008@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hToMx-002Q2X-Vk
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add missing sysfs entries in
 documentation
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

On 05/23, Chao Yu wrote:
> On 2019-5-23 1:50, Jaegeuk Kim wrote:
> > This patch cleans up documentation to cover missing sysfs entries.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> > + reserved_blocks	      This parameter indicates the number of blocks that
> > +			      f2fs reserves internally for root.
> > +
> 
> I mean we can move below entry here.

Ah, I'd like to keep the order defined in sysfs.c.

> 
> current_reserved_blocks	      This shows # of blocks currently reserved.
> 
> > + reserved_blocks	      This shows # of blocks currently reserved.
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
