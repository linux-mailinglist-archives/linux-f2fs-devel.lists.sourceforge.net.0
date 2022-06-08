Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B7D54391D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 18:32:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyybt-0000Bo-SM; Wed, 08 Jun 2022 16:32:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nyybr-0000Bh-U5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 16:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yuOErhko23VBUcg027gdjVhvOvMdHidC/agADdmeN/Y=; b=KdxXy8N/Vv1xYBo21zUoTWk4T3
 VMc7ixczls1Yfx5ol19Fb6s11RHfg0b+CzVRAtKUBe/MAVIlvDIp8wuyBZrJfKPYnVYp5HWsJpvpU
 XPKTmvrD3th3W8Jh3eGFJjiTYmDUgTaw2V0KhOyjQ1JjVdIgF6JZpMs5exyv9VczGmpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yuOErhko23VBUcg027gdjVhvOvMdHidC/agADdmeN/Y=; b=KqMEP8axwE5QErqh5v9PA3mtbc
 I1wc5KEAJTYToEhrAe8X3Py4+r9KWYt4ES4iHeH3hEAP7aA7cstO22UTlyldpI6NzeKQKHoyyz1It
 nCn/1GZr+Cjontl3pfQOmeNNV1hPpHPCddYmBymeiK9IMUhaWtZkbB+dmghiQgcoGmWs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyybq-0001nY-K9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 16:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yuOErhko23VBUcg027gdjVhvOvMdHidC/agADdmeN/Y=; b=nK+QsAgyGVY4TqcqJIoqZb6pH6
 YH1l2lYZf2/HITuH4w313bKJpwgqgeL/Ajc+m5rAf7pnUDHd5+MIIqK9hox1IXUCjje8LUpumKfOs
 QEjG/a+V60NeULTByNwEGajh4NfgcD085VL6n+uTDiZlJ4QoXsBzw1tu8Uz6cY8dMROHVuLQLYmqG
 qmgcxmIS8DTwPbCCgU89ftwLODb+/P6u3LKC47leSNnpJ713XKmla3pD/TAZxU/Z/KXlxhXOgy684
 zB+mPggGwK2XDitwHO4afJMsYTpIn0LQ8rEaDkJNUysQjD3kPC6FQJOHcCHCSsAkws+g1Sq8TP2wI
 T8qDvWvw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyybi-00CnSF-VW; Wed, 08 Jun 2022 16:32:35 +0000
Date: Wed, 8 Jun 2022 17:32:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YqDPIv5IgNHK/pJT@casper.infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
 <20220605193854.2371230-9-willy@infradead.org>
 <YqBYxNPu3tLiN5kI@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqBYxNPu3tLiN5kI@infradead.org>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 01:07:32AM -0700, Christoph Hellwig
 wrote: > On Sun, Jun 05, 2022 at 08:38:52PM +0100, Matthew Wilcox (Oracle)
 wrote: > > Change the guts of check_move_unevictable_pages() over [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyybq-0001nY-K9
Subject: Re: [f2fs-dev] [PATCH 08/10] vmscan: Add
 check_move_unevictable_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 08, 2022 at 01:07:32AM -0700, Christoph Hellwig wrote:
> On Sun, Jun 05, 2022 at 08:38:52PM +0100, Matthew Wilcox (Oracle) wrote:
> > Change the guts of check_move_unevictable_pages() over to use folios
> > and add check_move_unevictable_pages() as a wrapper.
> 
> The changes here look fine, but please also add patches for converting
> the two callers (which looks mostly trivial to me).

I do want to get rid of pagevecs entirely, but that conversion isn't
going to happen in time for the next merge window.  for_each_sgt_page()
is a little intimidating.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
