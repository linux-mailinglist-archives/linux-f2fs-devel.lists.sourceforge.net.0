Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D61FC1BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 00:36:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlKC9-0005cn-JC; Tue, 16 Jun 2020 22:36:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1jlKC7-0005ce-Jj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 22:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pjA7zgwqv80y4xmAR3IWOMUOAyE53XKax4l1DtqqEck=; b=fNqUNpSQbebGAtuEVJ9Ha9FkNL
 pjrI+mM8h6BGCiO1uJXmiXPJ0BZbJD7CwxRFDmdRZaPNdswps+c1OKfxbR25qkyXwlO2HoPYVcPZ/
 p29o38Ov50I4dero3sR5MkmBGpF4DiAh71KL7asACQI96Ce3kHK8TXiZl3a9d6Zi7GKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pjA7zgwqv80y4xmAR3IWOMUOAyE53XKax4l1DtqqEck=; b=FVn4UDIAty8LwQOpPBkWl89CU6
 eono51944Mtdx94AI0VeT35GLKlmptS/+FlwSNCsQrzinHC8fkPszET+/HNwekXn17C13DeORYXju
 vZ2xXJdDBt8hsn5W16ZpZ49/Yl4PBVkOnzvByY3M5nplcVD6XMIm0E8IkaPxnizVMAJs=;
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jlKC3-005wh8-5s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 22:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592346989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pjA7zgwqv80y4xmAR3IWOMUOAyE53XKax4l1DtqqEck=;
 b=F+ZCKP/pO88AJj755FSRxWuieNVWxHCCsztlYyIB2knySypa6BSFBNzg6YoBhvzR4nkjs6
 898OCMNDJ+BwO50vK+6MIsFzwdTJCxMRXXaSLWeSDZtvAdBBxPmOpJEp9Qo2TIAPAZQFK+
 Qia28yr+FTWe5+zvGSdQJ4GcLRHPkpM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-K_xZZD75MAKeZOzPhoYMhw-1; Tue, 16 Jun 2020 18:36:25 -0400
X-MC-Unique: K_xZZD75MAKeZOzPhoYMhw-1
Received: by mail-ot1-f69.google.com with SMTP id v26so162998ote.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2020 15:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pjA7zgwqv80y4xmAR3IWOMUOAyE53XKax4l1DtqqEck=;
 b=kiX3XVu1A/GeS++t99R43ogHyX3ISE4C+t/6DppnzD7MrcTbfp63lvsyWhNXTTCYPb
 vqlZG0KJym0W/SwMn+PgVsRvjzxHncGpLkiZ2aJ9rHjRTkLoil1n7VlwXJFkQrCMSn+7
 CPseSNaCU5VpAzPay56EQoqCQi6eQM1FDXc3TaayWMWjfD/FTfMgim7jm8e83RlXQv40
 v8fcD+eE5iKgkXvNUXG0dy/9lkI3V5ZPQCrbH95JE1L4gmU3cFwhPTQaJ6rfcwdguZyb
 SlpfV3OwdtDYD/6IDR0TqhKDPYg689PO84mq8fWQ+hUMAefT/8hYEYTbURQEEYGSyzPx
 wtcg==
X-Gm-Message-State: AOAM533jTtUWbb4qbt6B0IAXM0VzjSHRha2tJuTtAEWHMPDZJxlnq1m/
 o7eOh5Pwo3PxhPqMX/7L8Wr4nW6hMMFWzpI4Z5SwDnrx1qfAYrS0JQmQ64kV949oGA25T1NG9KK
 YNFnVniArdDfDQSmJTwgvSztW2vRF4f3yIToEMDiqRmhcIn0jSTMcjA==
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr4427253otr.58.1592346984858; 
 Tue, 16 Jun 2020 15:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoYNEk859HKJnIJ4XSJZ0fYGYB8IyuHx9XmftKrB9TO1HP0sg3cpUFv1zd47ilgV+zJ3II6JUZaM7vtE9AC3A=
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr4427227otr.58.1592346984642; 
 Tue, 16 Jun 2020 15:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
In-Reply-To: <20200414150233.24495-17-willy@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 17 Jun 2020 00:36:13 +0200
Message-ID: <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [205.139.110.120 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlKC3-005wh8-5s
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v11 16/25] fs: Convert
 mpage_readpages to mpage_readahead
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 Steven Whitehouse <swhiteho@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 Linux-MM <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
 Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> Implement the new readahead aop and convert all callers (block_dev,
> exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.

This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.

Our lock hierarchy is such that the inode cluster lock ("inode glock")
for an inode needs to be taken before any page locks in that inode's
address space. However, the readahead address space operation is
called with the pages already locked. When we try to grab the inode
glock inside gfs2_readahead, we'll deadlock with processes that are
holding that inode glock and trying to lock one of those same pages.

One possible solution is to use a trylock on the glock in
gfs2_readahead, and to give up the readahead in case of a locking
conflict. I have no idea how this is going to affect performance.

Any other ideas?

Thanks,
Andreas



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
