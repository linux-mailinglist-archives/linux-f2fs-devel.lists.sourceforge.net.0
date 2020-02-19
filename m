Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFBA163B97
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:47:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4GL7-0005LO-4g; Wed, 19 Feb 2020 03:47:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4GL5-0005LG-Q6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i/xcm0BfIZoUOgtJ9Kb7+ENMgRO8MVFTO+YgYUUmnnU=; b=B6CQLbcdQ0dZm6r7AYdP0l4esG
 0HDkd2mxRCq5FuRABAU6WPPXUt+1ieFQpU6xJcELPnk3DilPxu6PPovjMA3Km+LGDA+n3Q44yihZs
 kktSTkBc9oS26L7DY/ANM8HPKUdcFNzfX+xTGGdAD2g06DITU2TycS9bWobpvFfl+OFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i/xcm0BfIZoUOgtJ9Kb7+ENMgRO8MVFTO+YgYUUmnnU=; b=aDzIzJQh+HiA7h3MZxCoAxVR7P
 6kOCX/JJ39/2IRpqbESb817fzNIAOd8uFzssdq8XW0RJx3veG9BaR0ZZKu4mc3yPFOCfLz3BNLkLf
 O55ZxXB/5SwS8n+nevBzNNMrcPDdVsf8CyMIEiWsBKqYPWFxDZNI6Gs+ReG1qCr8g5Os=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4GL4-007t9S-Js
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i/xcm0BfIZoUOgtJ9Kb7+ENMgRO8MVFTO+YgYUUmnnU=; b=sMeTw1fz0AtXWv4h5McRaI0hCC
 OIeMYm4j5TaxU6/S+PNsormwo6Bir4wd3qqGXl+GGGR9ekz3hzBXljkYHgg49p+g8cXAmtP2rs6k3
 69dcsD1yVpFMMZPVBgJM2M6dUtwSbV8XzDOOXM1+rQ8x8Tgn7iTWBfWCzxF5LPjzKG8tHjIZgCd5o
 o+iDKzs+iuYHb0nWK7CgfwUKvGVxa1DpfmuaYH6dzHmEMJGYSROvOuIy/F02GpS2f4BnOSoK7htCK
 dj9wRqSeArzQt/ea/tpsDBkyItAgPHmM8u//+U1zx2sHOilh75WFAwV2VrYfOZ/IlTmzStwZqicCC
 ZgaRjdug==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4GKs-0001V5-0u; Wed, 19 Feb 2020 03:47:42 +0000
Date: Tue, 18 Feb 2020 19:47:41 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200219034741.GK24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-18-willy@infradead.org>
 <20200219032826.GB1075@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219032826.GB1075@sol.localdomain>
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
X-Headers-End: 1j4GL4-007t9S-Js
Subject: Re: [f2fs-dev] [PATCH v6 10/19] fs: Convert mpage_readpages to
 mpage_readahead
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
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 18, 2020 at 07:28:26PM -0800, Eric Biggers wrote:
> On Mon, Feb 17, 2020 at 10:45:58AM -0800, Matthew Wilcox wrote:
> > diff --git a/include/linux/mpage.h b/include/linux/mpage.h
> > index 001f1fcf9836..f4f5e90a6844 100644
> > --- a/include/linux/mpage.h
> > +++ b/include/linux/mpage.h
> > @@ -13,9 +13,9 @@
> >  #ifdef CONFIG_BLOCK
> >  
> >  struct writeback_control;
> > +struct readahead_control;
> >  
> > -int mpage_readpages(struct address_space *mapping, struct list_head *pages,
> > -				unsigned nr_pages, get_block_t get_block);
> > +void mpage_readahead(struct readahead_control *, get_block_t get_block);
> >  int mpage_readpage(struct page *page, get_block_t get_block);
> >  int mpage_writepages(struct address_space *mapping,
> >  		struct writeback_control *wbc, get_block_t get_block);
> 
> Can you name the 'struct readahead_control *' parameter?

What good would that do?  I'm sick of seeing 'struct page *page'.
Well, no shit it's a page.  Unless there's some actual information to
convey, leave the argument unnamed.  It should be a crime to not name
an unsigned long, but not naming the struct address_space pointer is
entirely reasonable.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
