Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EDE8AFC57
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:59:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP6l-0003nO-0p;
	Tue, 23 Apr 2024 22:59:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP6e-0003n3-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vs2mxITFBV+nRdHIV1uS98AGVTfpM4tELm97x05ajm0=; b=exzGs42GuKZjHQLpQ1thBWEmfy
 J8f3OT36tnewstDS4aNhDS+BgIOClOKndErwmgOA27XRYQZE4xwK+P2OTLnYCKsPO2aLTLebK0+2i
 58ZQRHuyLrPdleB77GRaTMMyU9Iafilc2vaDdrdsn+dK2M36kUVsBzOjXj3xBl/ixxUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vs2mxITFBV+nRdHIV1uS98AGVTfpM4tELm97x05ajm0=; b=PntiTNLQn38CZj7r8zXhtCMRfP
 31Mdej2fmuK8mkmukgAeivRYolLrnwf5uHVyIlHPRYZRcMokZp8hoTgJR6IbUCRrDuU26Xn2C4nuG
 Zs+Opm39AByswcQ/5T5M0uUpTDl2Ja4dFJLzRXoAxgt3Kc5+YpTsm9qC/0wswDt2FSfU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP6d-0007Vu-Tw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vs2mxITFBV+nRdHIV1uS98AGVTfpM4tELm97x05ajm0=; b=NfHZ0wWx8GsndEQHkBQc5Ztki1
 +thI/9cbCmFDfsBKQdJhpY9sdYrV/3LG4b9EaxZ0lQ9V30/cPkhT3QlooLztHyMRN0CXpRp3xNP46
 x4cp4efIgNLFzO5QRLE3Q5J1Axh70ssti9HIPvCLDgDRJ6ZlOZMOIeD7MQdzG43fH26hzdZ6DeMnX
 iYYsZmvc+gaKlIlop7wT1ysPbtC6FwsO+/CDxp8D60K0LK8ef7xSNgaJzqYS8rfLG8Gwak/hUZuRt
 YFxaII764S2palC6DlSP+PhM5yULs8nvv0FSPVcWpRz6TmGmlLPH7/umzcJ+2ccIKSYRnRP2pgL4x
 qDIkZ1SQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP64-0000000HGFU-0pot;
 Tue, 23 Apr 2024 22:58:44 +0000
Date: Tue, 23 Apr 2024 23:58:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kairui Song <kasong@tencent.com>
Message-ID: <Zig9JCrhky9JieRS@casper.infradead.org>
References: <20240423170339.54131-1-ryncsn@gmail.com>
 <20240423170339.54131-4-ryncsn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423170339.54131-4-ryncsn@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 24, 2024 at 01:03:34AM +0800, Kairui Song wrote:
 > @@ -4086,8 +4086,7 @@ void f2fs_clear_page_cache_dirty_tag(struct page
 *page) > unsigned long flags; > > xa_lock_irqsave(&mapping->i_page [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzP6d-0007Vu-Tw
Subject: Re: [f2fs-dev] [PATCH v2 3/8] f2fs: drop usage of page_index
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Chris Li <chrisl@kernel.org>,
 Neil Brown <neilb@suse.de>, Minchan Kim <minchan@kernel.org>,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Yosry Ahmed <yosryahmed@google.com>,
 linux-mm@kvack.org, Barry Song <v-songbaohua@oppo.com>, "Huang,
 Ying" <ying.huang@intel.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 24, 2024 at 01:03:34AM +0800, Kairui Song wrote:
> @@ -4086,8 +4086,7 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
>  	unsigned long flags;
>  
>  	xa_lock_irqsave(&mapping->i_pages, flags);
> -	__xa_clear_mark(&mapping->i_pages, page_index(page),
> -						PAGECACHE_TAG_DIRTY);
> +	__xa_clear_mark(&mapping->i_pages, page->index, PAGECACHE_TAG_DIRTY);
>  	xa_unlock_irqrestore(&mapping->i_pages, flags);
>  }

I just sent a patch which is going to conflict with this:

https://lore.kernel.org/linux-mm/20240423225552.4113447-3-willy@infradead.org/

Chao Yu, Jaegeuk Kim; what are your plans for converting f2fs to use
folios?  This is getting quite urgent.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
