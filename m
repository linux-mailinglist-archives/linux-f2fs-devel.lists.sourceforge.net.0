Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6C15FBED
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Feb 2020 02:16:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2m3x-00013v-3E; Sat, 15 Feb 2020 01:16:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j2m3u-00013m-LC
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Feb 2020 01:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLBAYvHDyQG068qFXc4PKikpMZL0O5lvrEMnkVr84hY=; b=P1+D02WpMHiZJQTHpCCr1we7sP
 d6vJ4ZvMzSmso0KmNoa2dEjCpWn97SwvRCTK2PqDGRwhT34D0otzQx+CWG9TdC6q7Fwvu3wlNIXX3
 1YUTsFcucEC2xlJcbNtKDLwzX6O9bUnUWePFdAYqWlnGvwOOEbc4gRirOPXp1PGcaGYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rLBAYvHDyQG068qFXc4PKikpMZL0O5lvrEMnkVr84hY=; b=hWrlyjP1xpEbdDeo/UNYYIAgIq
 u7yKdo8TiEGJpgViuheuSQJ/jebS1n3v/++fszfpQg2pjb9z4lc/dmGZTku8ZVXToEaLWJaDqs2N0
 l0h1IfUjUtfu16YFeMrX6GiU8AGY4tbbu19XfdRRWe2z78YFmC+tDox1TGKomUf1tWyg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2m3s-004ROm-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Feb 2020 01:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rLBAYvHDyQG068qFXc4PKikpMZL0O5lvrEMnkVr84hY=; b=pp4+jYrdtIiCu1ZmQd3UA6AYr/
 85A+NhPrb4RLR40lY3uBj4FXFTAWs54cubURwUY781EoXTIC1BHmzzNCBvBY8CryBQxMU/K9kCyDD
 Uej9VEruUNuHLfKPM4kfSaYvl7cRuRpvE6a4DUQXDHXn67rTy5ieMKlxLHoaPREJTum8bIQ9MN9Gw
 zdza5RTyE51eZi3yeNdHM+vbtFO0NAVQHI+/F7pxpuo7utWxpPvSsEQWVwOfY7b3Djjfu7uYZbJKq
 pEcZMax/EA/FGJvJyodBK0tcSq1rmhd9c8O3RFfEaCuHnm/yRy6hPamomhAD6zwSpAIRbrf8oTm28
 VPquc2zA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j2m3k-00083J-V5; Sat, 15 Feb 2020 01:15:52 +0000
Date: Fri, 14 Feb 2020 17:15:52 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200215011552.GE7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-4-willy@infradead.org>
 <b0cdd7b4-e103-a884-d8f7-2378905f7b3b@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0cdd7b4-e103-a884-d8f7-2378905f7b3b@nvidia.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j2m3s-004ROm-Oq
Subject: Re: [f2fs-dev] [PATCH v5 03/13] mm: Put readahead pages in cache
 earlier
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 13, 2020 at 07:36:38PM -0800, John Hubbard wrote:
> I see two distinct things happening in this patch, and I think they want to each be
> in their own patch:
> 
> 1) A significant refactoring of the page loop, and
> 
> 2) Changing the place where the page is added to the page cache. (Only this one is 
>    mentioned in the commit description.)
> 
> We'll be more likely to spot any errors if these are teased apart.

Thanks.  I ended up splitting this patch into three, each hopefully
easier to understand.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
