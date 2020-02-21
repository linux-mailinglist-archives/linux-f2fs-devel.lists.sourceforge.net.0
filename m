Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B62801681CE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 16:36:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5ALK-0007iP-8w; Fri, 21 Feb 2020 15:35:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j5ALI-0007iH-A9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 15:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ZsaQJllFuL8jpNObDQrHmpdC/B73n9RqMvE0qPHxaM=; b=WLbTViXfKA5LCrfZ76DfKyoFnC
 nPrRX9Je5BcCzbg6hk2GpAD3ziMUE5etz+9KWJ5RX10RFcoZ07PgQ8b1G4R6XnFthWEGr1qsodZbR
 jP5HLehbDt9xMUbETPAu6vfn43Rjulw6Qd5Pf+UtV71VMN5w0FlKtoHmXOPAnalRXXdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+ZsaQJllFuL8jpNObDQrHmpdC/B73n9RqMvE0qPHxaM=; b=IgWFREgyJB+POVFmVCl8EVnp23
 PuwAlSbYlLwbPgAjlhtOoZEh46js/rgd6jMKH7zxucZB5kByKTYNqJojYZRPZB0t6NkQLboAe17MA
 6q2fD56N1+F3rC/jfNnMrxZKx1BqzWw4SXHLS9ASPOO4uG8q0p1wzsAMo+jyDowuNoVM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5ALE-003PUh-J2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 15:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+ZsaQJllFuL8jpNObDQrHmpdC/B73n9RqMvE0qPHxaM=; b=e19h/tTJERLUFpOL5Gva3Nh5/X
 wd0VH9aVgKh+1Blgs+9Q15ijaVkaoTLAy7WypYckq6maI2+/Qpa5TYpUzL45zkwW6/rKVd4gOa/Q3
 37XTTlJ3n85F+yMLVB8w0BnbSlS+Y+mVNSOJqRCX3b4kHG/mSGnd+/RHhL7LSbdq0PycpO3gHljyg
 1ePLpWP66QKkQwSW3hqI4AmWyW4KZvprzI+VqeFwh8xfQgZxihaUIj3MuUi6DWndVunwNc8HfQSPa
 cJzgSNpVLmszdlcuXvTGALnsMeU2uXmuwM6kJU9UgfbmbAX46oAsryhNENVSPO0btKS8JfbqGc1YR
 ErE1c+gA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5AL3-00062c-43; Fri, 21 Feb 2020 15:35:37 +0000
Date: Fri, 21 Feb 2020 07:35:37 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200221153537.GE24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-12-willy@infradead.org>
 <e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
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
X-Headers-End: 1j5ALE-003PUh-J2
Subject: Re: [f2fs-dev] [PATCH v7 11/24] mm: Move end_index check out of
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 20, 2020 at 07:50:39PM -0800, John Hubbard wrote:
> This tiny patch made me pause, because I wasn't sure at first of the exact
> intent of the lines above. Once I worked it out, it seemed like it might
> be helpful (or overkill??) to add a few hints for the reader, especially since
> there are no hints in the function's (minimal) documentation header. What
> do you think of this?
> 
> 	/*
> 	 * If we can't read *any* pages without going past the inodes's isize
> 	 * limit, give up entirely:
> 	 */
> 	if (index > end_index)
> 		return;
> 
> 	/* Cap nr_to_read, in order to avoid overflowing the ULONG type: */
> 	if (index + nr_to_read < index)
> 		nr_to_read = ULONG_MAX - index + 1;
> 
> 	/* Cap nr_to_read, to avoid reading past the inode's isize limit: */
> 	if (index + nr_to_read >= end_index)
> 		nr_to_read = end_index - index + 1;

A little verbose for my taste ... How about this?

        end_index = (isize - 1) >> PAGE_SHIFT;
        if (index > end_index)
                return;
        /* Avoid wrapping to the beginning of the file */
        if (index + nr_to_read < index)
                nr_to_read = ULONG_MAX - index + 1;
        /* Don't read past the page containing the last byte of the file */
        if (index + nr_to_read >= end_index)
                nr_to_read = end_index - index + 1;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
