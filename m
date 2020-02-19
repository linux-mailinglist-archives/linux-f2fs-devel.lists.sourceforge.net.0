Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB11647A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 16:01:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Qqf-0003tA-4x; Wed, 19 Feb 2020 15:01:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4Qqe-0003sy-Ld
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 15:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dQq5UdvWp+QdydyVJRmEnvUTQNEYvIRUriwjl717Wo4=; b=ViJhCxAMAgE3Ev3yRCo+ixzItO
 RzReuK9N2N3xz6xTtRiTU2ByiiXUdnXvoWxJYRunbmYVn8Hf/S5shL+cFk5sYOWAc17gau1WWpMQt
 ikeBdIc6F/oig468G/QRsZtTyK5wTal3Rh14Alq+Et7vVGY3P+HTwXWAU1+B7s58POhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dQq5UdvWp+QdydyVJRmEnvUTQNEYvIRUriwjl717Wo4=; b=iinhKUAKKRXloaCDpf7YUOhC6o
 OwRQD4OA0RzGBA9dHOpXkA2+7T+Yd8DPIEQJ7AFf452WU4bt0ZtegL82Z2u+9vWU0Yn/UmrxqmLFl
 YirtcX4GRIWWDyj75xB02c4jsb9OfuE4w3dEWNeTvTLnuO2hWRANgSjhrMlH8lbalm0M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Qqd-008FX4-M7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 15:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dQq5UdvWp+QdydyVJRmEnvUTQNEYvIRUriwjl717Wo4=; b=FbVPGaVtVufC1cWxht/uSdu9LM
 u4inzXpj28Km884GMUnmZBZO/CLojvZi7gibEIxqwy5P16gRi74kIpFFlM3LmNzkK2VjQeGLm1PIN
 Ast9YJe2181MgGTKVtU4ay5LehVsSUfjLEqKWgKXAy8nNlOwI8zWX80DwX6CuU/UuAiBX+eo4CCHP
 Y81PP5VVxaEj/8tazt0cFvBWDXBOs9Ln2s3muutl3kguvTUKQ6dd4LkeHCQybnqB9Utkcyr9mBpK4
 yVPx2Lypjcjd5xEPJl6EzkzejWufd+ETMbK3W9ivGAB1WoW5AaZ+vd3KfWIaBSoF1nkRoP3ugUxQh
 XhutwZkQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4QqV-0003kJ-Mw; Wed, 19 Feb 2020 15:01:03 +0000
Date: Wed, 19 Feb 2020 07:01:03 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200219150103.GQ24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
 <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
 <20200219144117.GP24185@bombadil.infradead.org>
 <20200219145246.GA29869@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219145246.GA29869@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Qqd-008FX4-M7
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
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
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 06:52:46AM -0800, Christoph Hellwig wrote:
> On Wed, Feb 19, 2020 at 06:41:17AM -0800, Matthew Wilcox wrote:
> > #define readahead_for_each(rac, page)                                   \
> >         while ((page = readahead_page(rac)))
> > 
> > No more readahead_next() to forget to add to filesystems which don't use
> > the readahead_for_each() iterator.  Ahem.
> 
> And then kill readahead_for_each and open code the above to make it
> even more obvious?

Makes sense.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
