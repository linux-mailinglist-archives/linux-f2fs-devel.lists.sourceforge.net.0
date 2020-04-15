Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0391A9081
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 03:34:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOWwe-0007WR-N0; Wed, 15 Apr 2020 01:34:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <akpm@linux-foundation.org>) id 1jOWwc-0007WI-SB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 01:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQeXrHMSB4muOGa9bIWb5FzCcoGTEEOSoGfj3H++h3E=; b=XWvKhqKpkyn0uIx0gLOkM4DG7n
 Y0p/q7AGQvl51cu4aizEKn6FXRGCAOPsh/YFU6gPp8ESTduQ9II8x7gVbQ6XSyGq6zEZYWWGK32Xt
 CYiPiuRJQiXRq3/QOkqAdFRJv36KSUJ+QJJTWOFpvEvXyAZIG8aWiYwre6FkXzwpFbJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQeXrHMSB4muOGa9bIWb5FzCcoGTEEOSoGfj3H++h3E=; b=hJBO1I9k0HWMDkUcKZjd08/wyq
 RmsmIL4QTUGY99E7w4oPT6yNMO7krZ2RnV1XMV5BajeGXke6EYhsG/r5ybIncWrWIubZopz3MYRbM
 BC0aEQbmpf7TPptzJ8yhz6JoX/CBkIfloZpqsf+iABzwM1un8gN5V48tCUGNtZPxlW6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOWwb-00FQpF-H6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 01:34:26 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CD58206D9;
 Wed, 15 Apr 2020 01:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586913426;
 bh=Z8t12Kri4dLkYoQfBj9LeTBHSVbJC29k8QLFe4WYAn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=trHGKNCxzakSMiiFFW7h7ipr5l5ZPqXMRMACUtk4YKpwd8Pg1RJ2PiBsRP5nCE9+1
 fCvzyZDvGOZsZH+JWcOhF2bmZOk4UdQ9IgBloKo9E4jlYJXAc0OSn746DXLsWt7WBJ
 s1ct6x0rSpHRCfj/HRWtfY1TDdkeieGLLTsLzoWE=
Date: Tue, 14 Apr 2020 18:17:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Message-Id: <20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
In-Reply-To: <20200414150233.24495-6-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-6-willy@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOWwb-00FQpF-H6
Subject: Re: [f2fs-dev] [PATCH v11 05/25] mm: Add new readahead_control API
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 14 Apr 2020 08:02:13 -0700 Matthew Wilcox <willy@infradead.org> wrote:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Filesystems which implement the upcoming ->readahead method will get
> their pages by calling readahead_page() or readahead_page_batch().
> These functions support large pages, even though none of the filesystems
> to be converted do yet.
> 
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +static inline unsigned int __readahead_batch(struct readahead_control *rac,
> +		struct page **array, unsigned int array_sz)

These are large functions.  Was it correct to inline them?

The batching API only appears to be used by fuse?  If so, do we really
need it?  Does it provide some functional need, or is it a performance
thing?  If the latter, how significant is it?

The code adds quite a few (inlined!) VM_BUG_ONs.  Can we plan to remove
them at some stage?  Such as, before Linus shouts at us :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
