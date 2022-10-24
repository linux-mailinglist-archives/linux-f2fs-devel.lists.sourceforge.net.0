Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBCB60B92B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 22:05:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on3hg-0000B4-0I;
	Mon, 24 Oct 2022 20:05:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1on3he-0000Aw-B8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 20:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rWeKahqjg8VAD1dtAEhE4rortSi/MmENxoyZPPFT3KA=; b=CaYxsUSDe3A7YHRDIVOBIpN3Rc
 N5q3tlq+xYLhxU+j/0jDaCJiZeFQ1VmoQFKTOEPsDF5y5YCuDfyq4Gy2sTP8NBUu6eY0ecGVN1JPm
 gIt43VLQ+m0oVFuGb1oHCL7+bOli+XofYzUUdBVu+PSktJfqdmQx5Iqt2E7kPiCwS0S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rWeKahqjg8VAD1dtAEhE4rortSi/MmENxoyZPPFT3KA=; b=YXCssLylzPiKpm/kX94LJxG8fH
 EaE8BNKF9pFJwhR+IPwwxL6q3FQbVNGCfpbI6irAyxq3uQK8mUja3m0oNNFYSfcYlXnLKPdh24uFK
 j1Nlh9UltYMYAgCccBNt6zc82Sd16dowNlYsdYN1i2S7tTDK6XjqRDy8OP6j6OZ/jM/A=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on3hV-0008Tx-K1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 20:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rWeKahqjg8VAD1dtAEhE4rortSi/MmENxoyZPPFT3KA=; b=p8A06p4YSjdkrVWvgA1JfWZjL8
 Q/fKS1i1qtNMepcvFZBlIOmLEnO9EOAC3/sxOsEXCrtAti4NI1wr1f8hte79v+XFrKL35DLtIB2GU
 zi3APTubBbGh8RjT75MjmkoXpdO8fQ0puFRQVMjWyEsmZaTEdK2OgDh7UkQiBfqJrU5dgT/vQveft
 bqGju8jkvOALt/LWfVuhxxcjVoDYmsza9cQK22J8wHRp0Rs5TMWJCQTQv77PrnmO27hvcBbBzNUFr
 jP28Z3Q2GEF5uZ0RW1UMTD0Bygxy4Uv0tShW3PXlM5lsL1KFSDM8we1Rokbv3PeoMrsL8HMoH4dqJ
 TM+W5AWA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on3Gy-00FgaS-Oq; Mon, 24 Oct 2022 19:38:08 +0000
Date: Mon, 24 Oct 2022 20:38:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <Y1bpoF9Flds1tHdl@casper.infradead.org>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-2-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017202451.4951-2-vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 01:24:29PM -0700,
 Vishal Moola (Oracle)
 wrote: > Add function filemap_grab_folio() to grab a folio from the page
 cache. > This function is meant to serve as a folio replacement [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1on3hV-0008Tx-K1
Subject: Re: [f2fs-dev] [PATCH v3 01/23] pagemap: Add filemap_grab_folio()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 01:24:29PM -0700, Vishal Moola (Oracle) wrote:
> Add function filemap_grab_folio() to grab a folio from the page cache.
> This function is meant to serve as a folio replacement for
> grab_cache_page, and is used to facilitate the removal of
> find_get_pages_range_tag().

I'm still not loving the name, but it does have historical precedent
and I can't think of a better one.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
