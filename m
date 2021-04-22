Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA536842F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 17:48:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZbYr-0002mL-If; Thu, 22 Apr 2021 15:48:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1lZbYp-0002mD-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 15:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UdV/xsRrw93wPeJQm6RKQW5H8PJQYFUytR36G8I3Ovs=; b=H4Nra5ykUzZ4loK3wbCUwCpHVv
 BwRJxf/OjMsp73payusJ5uyBtcxRDifdsxsG5KLlq5itfCIo4JIGoTG+C0DVie/bK3miLWQPzi43S
 g7AThf09zgxzmX4pUmx0lVCVBCTvowMn62bqZinTqKhgW0hVL6DNL38LMm+NWWicbkSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UdV/xsRrw93wPeJQm6RKQW5H8PJQYFUytR36G8I3Ovs=; b=i
 t+I8w8Sx+mwOlBesGUpnFh/6RbCIHX/TXGyhfxJl0Ty4KjioK6+BTr1CLcMYalIrGvJ6gNMIKrAL9
 lprkNXTL4H0KonUThT5yf452avXp7xA52FCIHOBH6zecCZfofb6yKYmUtyG60kmedqyXctHLV/f95
 KsmvER6tcetF2QfM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lZbYl-0000Fr-9H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 15:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=UdV/xsRrw93wPeJQm6RKQW5H8PJQYFUytR36G8I3Ovs=; b=GInvtbQpV+q1DfmdVS3oUS6+UZ
 oJOQpNnMhVadvMnLboc/BgbyGoaS2y/02q4Dvr5qx00RrWraMLUi6FpXwt/Qdeon62s0vQIQDJOaF
 j1fHHu/tF67JR3OMAf0DukLYxweRgxgMIHTjK3xuPYX5oy/Knhm5wQaG8Mplvv6MjpnEwQZFRxjrg
 ffTLs1D2KBaCfaWOTp0rv5HjkS3k+Jo7LxPAneC6YHV7+OjjNQ/aRxi7XbDLSsc0GWStnE1m78AXN
 Lh8jH79P0t+0OQCsRvHUf0n2RhSrHFvtbjBosTi7TuuejFtDisiTxJMBlpTjhoufpLKH20HcozL2M
 uVuyaThw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lZbXl-000Tl5-4W; Thu, 22 Apr 2021 15:47:29 +0000
Date: Thu, 22 Apr 2021 16:47:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Message-ID: <20210422154705.GO3596236@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lZbYl-0000Fr-9H
Subject: [f2fs-dev] [RFC] Reclaiming PG_private
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We're perenially short of page flags, and I don't really see the need
for PG_private to exist.  We have 32/64 bits available in page->private,
and we don't seem to need the extra bit.

Most users store a pointer in page->private, and so PagePrivate() being
implemented as page->private != 0 is appropriate.

Some users simply SetPagePrivate() and don't touch page->private.
Those users could instead set page->private to 1.

Do we have any users which want to SetPagePrivate() and want to put a
meaningful zero value in page->private?

AFS stores a pair of integers in page->private, but the second integer
must be greater than the first one, so they can't both be zero.  btrfs
stores a real or fake pointer.  buffer_head filesystems generally store
a buffer_head pointer.  fscrypt stores a pointer.  erofs stores a real or
fake pointer.  f2fs does set PagePrivate and also set the pointer to NULL,
but it's not clear whether that's intentional.  iomap stores a pointer.
jfs stores a pointer.  nfs stores a pointer.  ntfs stores a pointer.
orangefs stores a pointer.

So ... what's going on with f2fs?  Does it need to distinguish between
a page which has f2fs_set_page_private(page, 0) called on it, and a page
which has had f2fs_clear_page_private() called on it?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
