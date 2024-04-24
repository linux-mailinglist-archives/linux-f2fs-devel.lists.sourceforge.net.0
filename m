Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F98B1798
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 01:59:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzmWH-0002Rj-Fz;
	Wed, 24 Apr 2024 23:59:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzmWE-0002RY-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 23:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vNG9QqElHBsq1h44jED4ysNt8/35kOzYfpgTExkMc2E=; b=kVq2KOVR5lGNgaBp6v6nhH71DV
 zUfQn40XYNr4pUCrCUjEb+RUkMeOdd7yMqMiqs2QeZsygA27n0n9qqgpFh04gPV1I6V2a2/LLqaH0
 0FDB59EQTWd6WPBBrkdEdW8tcHOofia0aYa+JbOjFMsK5nLMU4pcq4EkPGOVLVOcuVWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vNG9QqElHBsq1h44jED4ysNt8/35kOzYfpgTExkMc2E=; b=Hn5RNOV5lCxeU72OQOC2ljVcAe
 VaVcyOXhiNXdwszLa+QKKcy7ZqSuXm7r9iKeg+aGGASyUSO9UQSbTmPwDcvA213+aV1E0pVOQ9/12
 yasRhTDp9ESAIuQjXLy/DYhSUmaKx2nHGaw/lDDZVlhX59Ba3fL9islwXvx10Pnc6bCA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzmWE-0006Lo-7L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 23:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vNG9QqElHBsq1h44jED4ysNt8/35kOzYfpgTExkMc2E=; b=igcTIqHM0RfUK1MeyaDix1TNP0
 ZwowTxoD2j9tUNWIzPpqEVnl0G0D8+fvjPtAQC8fzyCq1Pv1/maLu8N4Safh1O9uOrq1zcuQBGKmX
 qYCETvKlaZI+4P5NYWghu05eTa/CAO+ol1z2xNzWYc5Yg03deYfxaLzB7xQpU+DIPecm9S5Xj/lvJ
 zsPSyLcgVJ2SdZ/S4gA69JKH/dVLPaKvuf5Dnweg3281KfEc3BbXBLDUwAIAoiQ3vXnF1WfpMmCiN
 lRJqCz8/9lC2FTBiBDf+VWYofEBq7JK2luLR8SxZh3UpR+tEDhXVYXxW7mKm4/IHYvuTM+z6JcU0F
 UAjQCT0g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzmVz-00000001wNo-0OuB;
 Wed, 24 Apr 2024 23:59:04 +0000
Date: Thu, 25 Apr 2024 00:59:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <ZimcxvN1fyYfpRVl@casper.infradead.org>
References: <20240423225552.4113447-1-willy@infradead.org>
 <20240423225552.4113447-7-willy@infradead.org>
 <7c52ae2a-8f72-4c3c-b4b3-24b50bdb5486@redhat.com>
 <20240424163423.ad6e23a984deb731e2de497c@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424163423.ad6e23a984deb731e2de497c@linux-foundation.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 24, 2024 at 04:34:23PM -0700,
 Andrew Morton wrote: > For some reason,
 > > mm/hugetlb.c: In function 'hugetlb_page_mapping_lock_write':
 > mm/hugetlb.c:2164:41: error: implicit declaration o [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [90.155.50.34 listed in list.dnswl.org]
X-Headers-End: 1rzmWE-0006Lo-7L
Subject: Re: [f2fs-dev] [PATCH 6/6] mm: Remove page_mapping()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 24, 2024 at 04:34:23PM -0700, Andrew Morton wrote:
> For some reason,
> 
> mm/hugetlb.c: In function 'hugetlb_page_mapping_lock_write':
> mm/hugetlb.c:2164:41: error: implicit declaration of function 'page_mapping'; did you mean 'page_mapped'? [-Werror=implicit-function-declaration]
>  2164 |         struct address_space *mapping = page_mapping(hpage);
>       |                                         ^~~~~~~~~~~~
>       |                                         page_mapped
> mm/hugetlb.c:2164:41: error: initialization of 'struct address_space *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
> 
> 
> I'll disable "mm: Remove page_mapping()" pending review of the below,
> please.

Looks pretty similar to
https://lore.kernel.org/linux-mm/20240412193510.2356957-7-willy@infradead.org/

Sorry, I thought you'd picked up that series; I think it's fully
reviewed by now?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
