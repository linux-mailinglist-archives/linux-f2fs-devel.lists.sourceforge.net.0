Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E818D350
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 16:50:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFJuL-0003Tv-BW; Fri, 20 Mar 2020 15:50:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFJuK-0003T3-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 15:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yv3+8ZkU2Zz1CbunuLGJeGnn9drqQp5L7ufoWQwK5wk=; b=Bx+0lobMBf48OKaAAUH+Usd/6i
 7V5zntSWPf9AsPJ2lT2lbGDWVhbGHy5f0Rua8n37rRbGHLN1UK7XkqTfwrGmPzpMMd3kFI5MsHLkk
 sRKo8/ELrKBi/jqqxigvoLpAzfUDPNGB/rA7OgRw0XOAbmVdYNBeyX5S/gFWQji0HC04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yv3+8ZkU2Zz1CbunuLGJeGnn9drqQp5L7ufoWQwK5wk=; b=cuGrTd1a5cQzRAmXq0z50Q0J/A
 skbzG6I2mmZpuJynykUrC4Ugc+7qa7rsMr7xPvSdJuxHZmG0aept4DMLG5KLTyzKxR6LE/Uw1DxAr
 KSvZRzfEXfzJgTuJJ4+uc2fxjXmvxEIGuyAlKBrmclZ7U2DLnVPlGd1AD9qJVKVlQTi0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFJuF-00AD1k-DZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 15:50:00 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6F6D20709;
 Fri, 20 Mar 2020 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584719388;
 bh=Uz+GOfTY3xVPYbPvmBj0Q46/bG8WiXLabIZgP/U3PuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZNJKwF3S/8xjDQE0c9QfVDZ7VmIbpmiT3XYz8EKVJdjKJSFVC9GqjDwywiw70PUex
 l3OPhTGMP1ByEOb6ZayrsPKyxNzggfVBRyNk7dqQs7Dh5dZ8iZtsBXDVvxKoiuWppB
 u1W2Q6vJUPPxEOpPW+X5/hJ2DERCRqxtZ8bcN+us=
Date: Fri, 20 Mar 2020 08:49:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320154947.GA851@sol.localdomain>
References: <20200320142932.GA4971@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320142932.GA4971@bombadil.infradead.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFJuF-00AD1k-DZ
Subject: Re: [f2fs-dev] Fwd: Add page_cache_readahead_unbounded
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Matthew,

On Fri, Mar 20, 2020 at 07:29:32AM -0700, Matthew Wilcox wrote:
> 
> I'm a little disappointed to have received no feedback on these patches
> from those who were involved with creating the ugly situation in the
> first place.
> 
> There are other ext4/f2fs patches in this patch series for which it
> would also be nice to get reviewed-by tags.
> 
> ----- Forwarded message from Matthew Wilcox <willy@infradead.org> -----
> 
> Date: Fri, 20 Mar 2020 07:22:19 -0700
> From: Matthew Wilcox <willy@infradead.org>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
> 	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
> 	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
> 	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
> 	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
> 	ocfs2-devel@oss.oracle.com, linux-xfs@vger.kernel.org, Christoph
> 	Hellwig <hch@lst.de>, William Kucharski <william.kucharski@oracle.com>
> Subject: [PATCH v9 13/25] mm: Add page_cache_readahead_unbounded
> X-Mailer: git-send-email 2.21.1
> 
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> ext4 and f2fs have duplicated the guts of the readahead code so
> they can read past i_size.  Instead, separate out the guts of the
> readahead code so they can call it directly.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>

I actually did look at this patch last month and it looked fine.  Thanks for
doing this.

To be clear, we'd be fine with maintaining filesystem-specific code that does
the setup necessary to call ext4_mpage_readpages() and f2fs_mpage_readpages()
properly.  And that was the original intent, so that nothing would leak into the
VFS.  But I understand that the new readahead calling convention is different
and a bit more complex, and it's annoying to have multiple callers.  So if
page_cache_readahead_unbounded() makes things easier for you, it's fine with me.

I'll take a closer look at your v9 series today and provide Reviewed-by on this
patch and others.  Sorry for not doing so earlier.

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
