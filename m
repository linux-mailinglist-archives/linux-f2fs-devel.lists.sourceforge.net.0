Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E564AE1B7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2019 14:57:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNGCi-00054J-PY; Wed, 23 Oct 2019 12:57:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iNGCh-00054C-G4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 12:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2cQJDoUTRUcJk4WJHtfIvuEu/pcOoRpz7qkEPnP9rM=; b=Riy4e/znNSsuZXISHM0cb7qF2C
 gzJYnFpd4RumH7VOHI5BiDQRqwSbVCJ3huLV1dLtpQ28gFe1x3pa9oJ44WdQyLkUPU18ds9rKX6z0
 vSlh6Cw0pw0pIWHWu28K8k6RTcHS58MOYK8hiLyrB/hiT4du30N2iOCtHO7viPam1PIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l2cQJDoUTRUcJk4WJHtfIvuEu/pcOoRpz7qkEPnP9rM=; b=B3KS/hs0BPDVVoifLtbZ3GbS0q
 pMaC4897oJv1XqVCPHuzJkjCYsvIa0YooYiJGXJrHO4PLXY7KL9TGT19fgpkjtWB/p83pxELGL8eX
 L9Evp7qhRfZIeBlwsM5YxdZ8AkPWlbJZoNFiZYa6q2d7kZGwD8qbXyM7ScCHfvbP/qvo=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNGCf-000JHl-Hs
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Oct 2019 12:57:31 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9NCv1VA016128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 08:57:02 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3FF4B420456; Wed, 23 Oct 2019 08:57:01 -0400 (EDT)
Date: Wed, 23 Oct 2019 08:57:01 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191023125701.GA2460@mit.edu>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
 <20191022133001.GA23268@mit.edu>
 <20191023092718.GA23274@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023092718.GA23274@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNGCf-000JHl-Hs
Subject: Re: [f2fs-dev] [PATCH 1/3] fscrypt: add support for
 inline-encryption-optimized policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Dave Chinner <david@fromorbit.com>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 23, 2019 at 02:27:18AM -0700, Christoph Hellwig wrote:
> On Tue, Oct 22, 2019 at 09:30:01AM -0400, Theodore Y. Ts'o wrote:
> > If and when we actually get inline crypto support for server-class
> > systems, hopefully they will support 128-bit DUN's, and/or they will
> > have sufficiently fast key load times such that we can use per-file
> > keying.
> 
> NVMe is working on a key per I/O feature.  So at very least the naming
> of this option should be "crappy_underwhelming_embedded_inline_crypto"

If and when the vaporware shows up in real hardware, and assuming that
fscrypt is useful for this hardware, we can name it
"super_duper_fancy_inline_crypto".  :-)

Remember that fscrypt only encrypts the data and the file name.  It
doesn't encrypt the metadata.  It has very specific use cases for
Android and ChromeOS where you have multiple users that need to use
different keys, and in the case of ChromeOS, we want to be able to
efficiently use the space so that while user A is logged in, we can
delete files in user B's cache directory without user B's keys being
present.  (This is why we can't use fixed per-user partitions with
dm-crypt; that solution was considered and rejected before we started
work on fscrypt.)

If you aren't working under tight space and cost constraints, it's
actually better to encrypt the whole partition, so that all of the
metadata can be protected.  fscrypt is deployed in millions and
millions of devices, and is solving real world problems.  However, it
never claimed to be the only way to address encryption in the storage
stack --- and it's not at all clear fscrypt is the way that makes the
most amount of sense for NVMe devices.  So let's cross that bridge
when we get to it.

Cheers,

	       	   	      	       	      - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
