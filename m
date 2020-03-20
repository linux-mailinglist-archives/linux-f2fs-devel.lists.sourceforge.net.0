Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA918D5DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 18:31:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFLU8-0006t5-LM; Fri, 20 Mar 2020 17:31:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jFLU6-0006so-RW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 17:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGITiyVmaO8X73R6wVMfMGWLW2W7neAq/9meuj1VHqo=; b=dSOgs9IeDVYFyCZSgD4bs0n6H/
 a7etJXuQSnbb3bYXsWdPqPgbVdgh994C3VY8tUiy6Z2U3hh1nlLVrmuz1WuGtD0saT7I+vfA6viVS
 843KF3qH9eDgGrqdM3gHUcG+0ehyo+VrdkiW59m09WmaPwym9p7xXhrK1LN9HrQ9+GXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UGITiyVmaO8X73R6wVMfMGWLW2W7neAq/9meuj1VHqo=; b=eZ8SARoUw+/7q+ONPRs7q04jUn
 WyYS/b3f0zIyvwSzbpUDA7UCa77DF9j/kJF8cHwhuCDSutSVlroMpGcOG/rfba1DOLJZxpPj7RSCH
 fgZ2Ot5GhDWcSxwNpkRwrXRv1WH/fMEh6463BThWGrAne7/kjbPIxQ2w+GoLCSEy38vU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFLU2-001WXU-38
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 17:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UGITiyVmaO8X73R6wVMfMGWLW2W7neAq/9meuj1VHqo=; b=EGKIuDKu0tjZuVECGtavPDxi0D
 O6qg1HxEZ5HTL6SQ+HnHGiXg3uMjLMXJy/QxU+RUtVkogm3OV1OoYySDKdd0TNCl75RNBRD/yIw4o
 r5B74nN9dCjwBJMpXdmIQPMo0Dtd++oHnpRNcQiIMtN+2/YTHKBLp/Yz4yXCj69SdRRm0YxhO6rSh
 QXAUKzLbScpAtIooOgBnixq+3fxkEPx9tp3sn8jy4Vs+FM4MKzh0fM6tnnEsYlBa1E1lxlobx/VwW
 F43ky5cdb9YLYKc01lCcZou/2CPPrIQSZW4GwTB3CgHdAptXVKYA1oettmTxaZQrltP3u3grDMdAI
 dACn5xZg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jFLTk-0003g5-Sd; Fri, 20 Mar 2020 17:30:40 +0000
Date: Fri, 20 Mar 2020 10:30:40 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200320173040.GB4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-13-willy@infradead.org>
 <20200320165828.GB851@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320165828.GB851@sol.localdomain>
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
X-Headers-End: 1jFLU2-001WXU-38
Subject: Re: [f2fs-dev] [PATCH v9 12/25] mm: Move end_index check out of
 readahead loop
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 09:58:28AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> > +	/* Avoid wrapping to the beginning of the file */
> > +	if (index + nr_to_read < index)
> > +		nr_to_read = ULONG_MAX - index + 1;
> > +	/* Don't read past the page containing the last byte of the file */
> > +	if (index + nr_to_read >= end_index)
> > +		nr_to_read = end_index - index + 1;
> 
> There seem to be a couple off-by-one errors here.  Shouldn't it be:
> 
> 	/* Avoid wrapping to the beginning of the file */
> 	if (index + nr_to_read < index)
> 		nr_to_read = ULONG_MAX - index;

I think it's right.  Imagine that index is ULONG_MAX.  We should read one
page (the one at ULONG_MAX).  That would be ULONG_MAX - ULONG_MAX + 1.

> 	/* Don't read past the page containing the last byte of the file */
> 	if (index + nr_to_read > end_index)
> 		nr_to_read = end_index - index + 1;
> 
> I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so that
> 'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.
> 
> Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >= end_index',
> since otherwise nr_to_read can be increased by 1 rather than decreased or stay
> the same as expected.

Ooh, I missed the overflow case here.  It should be:

+	if (index + nr_to_read - 1 > end_index)
+		nr_to_read = end_index - index + 1;

Let's say index comes in at ULONG_MAX - 2, end_index is ULONG_MAX - 1
and nr_to_read is 8.  The first condition triggers and nr_to_read is
reduced to 3.  But then the second condition wouldn't trigger because
ULONG_MAX - 2 + 3 is 0.

With the rewrite I have in this message, ULONG_MAX - 2 + 3 - 1 is ULONG_MAX,
which is > ULONG_MAX - 1.  So the condition triggers and nr_to_read becomes
(ULONG_MAX - 1) - (ULONG_MAX - 2) + 1.  Which is -1 + 2 + 1, which is 2.
Which is the right answer because we want to read two pages; the one
at ULONG_MAX - 2 and the one at ULONG_MAX - 1.

Thank you!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
