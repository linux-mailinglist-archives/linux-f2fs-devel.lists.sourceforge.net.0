Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475814F566
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Feb 2020 01:26:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixgbp-0007nM-NG; Sat, 01 Feb 2020 00:26:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ixgbo-0007n5-8d
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 00:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fpw6+UEhfuhuXeKhNiLAOcNkyHMzaziNThRDurB0olw=; b=f+dWWDnTEBLdPtjcNKYUGOLfYI
 GlnPDuJ9GAvwZCQUuwXXTNfpmDZne9pGjW/b9shqUgn5u47HWRm4TyxEMWpTvPq4gGhe9SZyJbSfx
 UoVaZt8JJUrkyQHX9XgcjgImx7BRD7UXi6qtSPtYXgGd9+MQUg8IwC9QfhEyeGhklU9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fpw6+UEhfuhuXeKhNiLAOcNkyHMzaziNThRDurB0olw=; b=Z4KXy6cBN+JYP0JT++pkwtJNNb
 HqFfj2dLd67o7hY2SlX+l6CVaNr314SWLcSdh49ZAYi5mRjUqkBnOoTMS6KrXdIIkrvSjQvI172Rr
 HbEAoaDZ6FErDlZJDSOzaieZkvVHrh6O7HJoMF8OxuJwTzYrG22NBgS8m9dsm4KiSawU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixgbm-00CdOI-CE
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 00:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fpw6+UEhfuhuXeKhNiLAOcNkyHMzaziNThRDurB0olw=; b=QxOHj2pZg+W0B5HIBaNQ2a1dF
 X0NQclBE2kGZleLQjTuffWwMMANrl04KeOOHt8+bcQ6CQD6k2oHx72uYHBStQflRNHip10UsC+bUF
 Fg7POZ4hQfjJ8LdBtpUUHaKx+Rje32bllb90LUXDP3WyQ/fVujZZviLRgFeAT7YsCrvLqGXY/BB/w
 XtqUGknjOioO7AGDFc7lDe+R24v4E+kG9joislUUkwVb8+Hoia9E/hsFJJBvG1VKjELdCeSa0PDu1
 rNSDke9vxTqSCLFjMRvKxnwwh4Y0P6CGwh+9iPiDkrlTR0ogML9akzWOAnGVQjmF854vphMnQomW5
 k9hsWWB1Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ixgbW-0005u5-47; Sat, 01 Feb 2020 00:25:42 +0000
Date: Fri, 31 Jan 2020 16:25:42 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200201002542.GA20648@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
 <20200125013553.24899-5-willy@infradead.org>
 <4e28eb80-d602-47e6-51ec-63bb39e1a296@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e28eb80-d602-47e6-51ec-63bb39e1a296@infradead.org>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixgbm-00CdOI-CE
Subject: Re: [f2fs-dev] [PATCH 04/12] mm: Add readahead address space
 operation
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 07:57:40PM -0800, Randy Dunlap wrote:
> > +``readahead``
> > +	called by the VM to read pages associated with the address_space
> > +	object.  The pages are consecutive in the page cache and are
> > +        locked.  The implementation should decrement the page refcount after
> > +        attempting I/O on each page.  Usually the page will be unlocked by
> > +        the I/O completion handler.  If the function does not attempt I/O on
> > +        some pages, return the number of pages which were not read so the
> > +        common code can unlock the pages for you.
> > +
> 
> Please use consistent indentation (tabs).

This turned out to be not my fault.  The vim rst ... mode?  plugin?
Whatever it is, it's converting tabs to spaces!  To fix it, I had to
rename the file to .txt, make the edits, then rename it back.  This is
very poor behaviour.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
