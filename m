Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 141631256B1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 23:27:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihhnE-0003X6-DZ; Wed, 18 Dec 2019 22:27:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ihhnC-0003Wp-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 22:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BfIJsnA6Ml6/yokZsRP0F31P7i5RYdglmuaj82rgNfo=; b=TnmcJBQnJYjLLuQMSnhMo9yGeG
 XU8G19fJ3msKOQiWqTpwI1AycvCu8v5Fu/I9FNQpPa2BSiGCbp9YTfw5uWAY7VVEiW9LCbtiK4rd7
 L0WmiM9EMvluz1oTwvl9PttUbfENAixurl9XpU9tYRsHiwEon2g/tJw5e9QjJA/tc4RM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BfIJsnA6Ml6/yokZsRP0F31P7i5RYdglmuaj82rgNfo=; b=Ljshy3UsEWLjYg3EMLOrvE/Tj6
 JRSQRrV1sJJGMReodDJ0mInsfnEFqsj0aea68sExu7gqMt2MfqR2x95A7kQLhn7J0gNCRM/bMSMOa
 6HiX6G9dV/VTsiPwMiFbPFFhCgqft/AYBEn42Gvl8e5GCw4nuxg8ez5kEe+E9qTha1MU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihhn9-0097Ib-6z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 22:27:42 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64E652082E;
 Wed, 18 Dec 2019 22:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576708048;
 bh=o7ngMB3x98VTTgkfiZtHSRbzMlQgbTWT/i52kLguSiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejOCM73UI0+1N/sJ9nYSoNO/OfQJ03EACQbtWn4J87NE/6ll5ayLk55m3ox2OKeQC
 HgPzXi9FGNhpGKPYTE4Ui97/imrJbiNqO1xo4jwnZiZFvWSzvQk8iQwbysEQiFrczV
 X2v68LmTPcM7l+ZfsedbX9c3YpZ9ycitDC0wF0CU=
Date: Wed, 18 Dec 2019 14:27:26 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20191218222726.GC47399@gmail.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1y2v9e37b.fsf@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihhn9-0097Ib-6z
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: linux-scsi@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 04:25:28PM -0500, Martin K. Petersen wrote:
> 
> Darrick,
> 
> >> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> >> +	struct bio_crypt_ctx	*bi_crypt_context;
> >> +#endif
> >
> > This grows struct bio even if we aren't actively using bi_crypt_context,
> > and I thought Jens told us to stop making it bigger. :)
> 
> Yeah. Why not use the bio integrity plumbing? It was explicitly designed
> to attach things to a bio and have them consumed by the device driver.
> 

There's not really any such thing as "use the bio integrity plumbing".
blk-integrity just does blk-integrity; it's not a plumbing layer that allows
other features to be supported.  Well, in theory we could refactor and rename
all the hooks to "blk-extra" and make them delegate to either blk-integrity or
blk-crypto, but I think that would be overkill.

What we could do, though, is say that at most one of blk-crypto and
blk-integrity can be used at once on a given bio, and put the bi_integrity and
bi_crypt_context pointers in union.  (That would require allocating a
REQ_INLINECRYPT bit so that we can tell what the pointer points to.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
