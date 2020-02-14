Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6083B15F724
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 20:51:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2gzU-00039j-LO; Fri, 14 Feb 2020 19:51:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j2gzT-00039S-M9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 19:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3womVZzJfvJ/ZynJrzvKSuPFFEQ+5OZC1GleOd63lI=; b=kdPHgnkkPgTpWTQKFKfYuW3cqP
 4uGrkSbIMcLLYXH6wotxAarN9GlCPwBFfXstzZEQpsehqkBmG3tbIaap+qNu2Vrbe3/flMAhROfZ+
 4IAYZcl838sX2QyABPtXCPS9yVe23zbnuJb//O5kYZrPmlHf5TXo36ebJ2kCOA1tVxlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v3womVZzJfvJ/ZynJrzvKSuPFFEQ+5OZC1GleOd63lI=; b=Fpz5l/DO+WSk7zUGpX+GgN61ii
 1FBW/myl+jQiNO21KvYLu6/6+eVSlOo6N0sHkRSMvy4vIJ/R9qR5g/zy+hq8nuFxqbLOTmw8gyrYO
 P47wnlUf3tcw1lurvk6uUp8QKLpq2OxU2sPJEAmdbIm1yyS587+oMK+hjQBA5j9gnFQQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2gzP-004GTG-VZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 19:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v3womVZzJfvJ/ZynJrzvKSuPFFEQ+5OZC1GleOd63lI=; b=mys1IIw2ciRDnnOg1+a/L/beW1
 7357IOcpU71f4WaOx5BF1LNC2w+18SN0vPkn0BAx47JJT1ekmHmdX8FSwWkmEYlpgtTfg19s9Abjz
 C63qA8m0b0CEy2AU9q7BlUDy99a16ZDwgMirXJrhg4DHrx0SPqZfihei8HMA11pjNBbVUpwLheoUP
 jvjy8FNDkU4VCt+tgQUnXJCoHFertNTu6iJOjBK/+hVJcmhn8+NpTpozWdqIMq0dPCfOJZW/tcUNw
 +8WmZZnCzebTqfb9kxxclwCAtZbdVOz7PFPt4fNiEzN9DwwuCPfQtrzfGXQYwl5+/DdizCTTOIeUg
 sfUqC+fA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j2gz8-0001km-Ao; Fri, 14 Feb 2020 19:50:46 +0000
Date: Fri, 14 Feb 2020 11:50:46 -0800
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Message-ID: <20200214195046.GC7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-2-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211010348.6872-2-willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j2gzP-004GTG-VZ
Subject: Re: [f2fs-dev] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 10, 2020 at 05:03:36PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> ra_submit() which is a wrapper around __do_page_cache_readahead() already
> returns an unsigned long, and the 'nr_to_read' parameter is an unsigned
> long, so fix __do_page_cache_readahead() to return an unsigned long,
> even though I'm pretty sure we're not going to readahead more than 2^32
> pages ever.

I was going through this and realised it's completely pointless -- the
returned value from ra_submit() and __do_page_cache_readahead() is
eventually ignored through all paths.  So I'm replacing this patch with
one that makes everything return void.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
