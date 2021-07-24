Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D503D459F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jul 2021 09:20:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7Bx8-0006q0-LI; Sat, 24 Jul 2021 07:20:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+9bd8c5f57f2c93d0ca7c+6544+infradead.org+hch@casper.srs.infradead.org>)
 id 1m7Bx5-0006pt-JO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 07:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O/XU7BaOJ1uvC1EkMCQUlQz3U2U8xvRd2MbfcwD2IpA=; b=bLoe5z6GGVLy430KAr7ZNcp2Rn
 EUwDnVtoB/ewoCOPHUMTnRdwghck3euS3PS7qg0hzsmC90yF8DMNSwpKkbvyxRRIAyjfBoc1sYrk5
 ZRXNizoQ401gZmt8XM+Ze3TzMP92+UC6x+gD+TJLEihmXC9a9Owi4OBvlyk9h3b120j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O/XU7BaOJ1uvC1EkMCQUlQz3U2U8xvRd2MbfcwD2IpA=; b=laVHdO/m7vDafWXL1APEWUSbik
 dWz6UKRSJr7td7ZcB+HL6JPsvW/FUdigZrvFjCu5SUuSwPw7bNyGjaFZIy2qvX6QKtg5fjv/+mQbc
 TuBYlQEKwruCNwhNBiOqD5JNQZS0mfp+ATUW8fyGex/hnkIDvsUeOsRjPFYaDWfVO6pw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m7Bx1-000zWg-QY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Jul 2021 07:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O/XU7BaOJ1uvC1EkMCQUlQz3U2U8xvRd2MbfcwD2IpA=; b=MDgreUOWODAfOvefRAPYEl3Oia
 dHU4LYmu8cbdWaaqhowrU9J6cLhO6rLSUkrKQy0hsdL3ePEwcProggNMwZU75a92cRzyw6YUByyPQ
 5Y9tgXQqRw4Dlqh6wGhbGvJGcbVMxiFloSSZdc4WjU1y9Z0a0eStaG+OMLSPdiTV1bn6NuTRM9ZDF
 xUDXHwdc8arrh21Zj74m9ppkAhoqn0v6yJpyIxNTnNmDMOjsSClzfb7I+oUFSrsBHY15IW2yzWR66
 XSg8y9K9nagTX9+/MW2gvdnz6aUoY0TbQxc1iUbHC92XmfQd0Tym2t+KeBL/HI4T3iAfcR6zWo6OI
 ElGynbeA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m7BwJ-00C4tG-OZ; Sat, 24 Jul 2021 07:19:17 +0000
Date: Sat, 24 Jul 2021 08:19:15 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YPu+88KReGlt94o3@infradead.org>
References: <20210604210908.2105870-1-satyat@google.com>
 <20210604210908.2105870-6-satyat@google.com>
 <YPs1jlAsvXLomSJJ@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPs1jlAsvXLomSJJ@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1m7Bx1-000zWg-QY
Subject: Re: [f2fs-dev] [PATCH v9 5/9] block: Make bio_iov_iter_get_pages()
 respect bio_required_sector_alignment()
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 23, 2021 at 02:33:02PM -0700, Eric Biggers wrote:
> I do still wonder if we should just not support that...  Dave is the only person
> who has asked for it, and it's a lot of trouble to support.
> 
> I also noticed that f2fs has always only supported direct I/O that is *fully*
> fs-block aligned (including the I/O segments) anyway.  So presumably that
> limitation is not really that important after all...
> 
> Does anyone else have thoughts on this?

There are some use cases that really like sector aligned direct I/O,
what comes to mind is some data bases, and file system repair tools
(the latter on the raw block device).  So it is nice to support, but not
really required.

So for now I'd much prefer to initially support inline encryption for
direct I/O without that if that simplifies the support.  We can revisit
the additional complexity later.

Also note that for cheap flash media pretending support for 512 byte
blocks is actually a bit awwkward, so just presenting the media as
having 4096 sectors in these setups would be the better choice anyway.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
