Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB373B1E41
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jun 2021 18:03:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lw5LS-0001xs-UX; Wed, 23 Jun 2021 16:03:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lw5LS-0001xl-7j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 16:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O/Ae5zJ11jXtDD9dBG8z2njZY4DFOtdZHJkvbV3kLTg=; b=RqVm/eRwURYet4QktCkgv2v5o0
 8jAM3XXZSmH5AKNP0VFgOQ8BSUi6SAtfQPjwb1WKOhwkpwKWPSOsVD/dOkO82YkhRTo9z+VZCwfOW
 4dEcVEWUUoBL0dnEaLiBwDatVi1mgPvR82zgLTPJ2amoPat6+zqI1uJFzLJLXV5N1AuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O/Ae5zJ11jXtDD9dBG8z2njZY4DFOtdZHJkvbV3kLTg=; b=IKzd3rvRoKMkPRdAZh3zq4AhZ7
 jUtgOnPLsy+P2V3WRX1j4+aB6JD3aDgY9ZJawUVkzPJGHeT36HJYWCYXSwZBFBjbHiTDCU3E86JbD
 JOeVhtN9qKbCUDLhehz30NPXeRPS3aSUYgcBbNgvAS4FtIzbvYfcJqK7+M5wCl7lW8S8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lw5LV-009RTn-1n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 16:03:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C68B611CB;
 Wed, 23 Jun 2021 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464195;
 bh=ak+k9oFHELaPJY9NjXIJUBQnes7eeRhOoN81+x+Jz9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jl36BWlOeP2ywyE3JXKnypAHZAXk1K1HQoE3niJ5lYE/njrE03TiFdwBP5hKWVIST
 GrGrqc6NAIa5ISeYLzvcToUbcco1cMA9hq5hNCJLRce5AO+sgaKtqtZyu8U1H9jt/5
 aJV+gqICzHXLCWP6n6jR1Hx5k5Q0kenpCZ1gQFt5DutoLZX9wPkbsrv+K8BVKcbTIE
 XQbeydNnxB+3Uoacxr0obi1g2cZ2ZvXi1vYPWERGlrOicB2MEBtjyAu9cc2a2feYwF
 3hrlg261hGZKN/O4zMNWRyRl5TB6Bkx1hCi3076xGKlZT0JZOeGynZAMkyp8ZqUI3D
 yNED7S5Fxi6Hg==
Date: Wed, 23 Jun 2021 09:03:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YNNbQrkiwyimBd8+@google.com>
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
 <20210621023939.1510591-3-jaegeuk@kernel.org>
 <e94edf00-e8bb-9bbf-fc01-d4caea138249@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e94edf00-e8bb-9bbf-fc01-d4caea138249@kernel.org>
X-Spam-Score: -0.5 (/)
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lw5LV-009RTn-1n
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs-tools: fix wrong file offset
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/23, Chao Yu wrote:
> On 2021/6/21 10:39, Jaegeuk Kim wrote:
> > This fixes wrong file offset updates.
> 
> Better to describe why the file offset is wrong in original
> code...

Added.

> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
