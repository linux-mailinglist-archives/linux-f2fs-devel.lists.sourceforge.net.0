Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5817B6D858B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 20:03:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk7TD-0001lR-2X;
	Wed, 05 Apr 2023 18:02:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pk7TC-0001lA-7B
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 18:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dmAZmojKfIM/z2MtFjBGD6EJ+69KjhZ8tshJmiwlSl0=; b=JzWlu+eNJf2V4WbtSkRjfMtej2
 BfbkmIUNc/JcZcT0O/gZ2Z3+NjLvANgTX5U+ZLe3Oqn9geW891+OxhLJsP2NXGjJ3wt1HP38xY5iQ
 wD935XeHWXqtzVSEvBK5ERmH3qeqI+iWKjwuDOO2z+hEOv6miCqbWQGPSmGlpvm6CvVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dmAZmojKfIM/z2MtFjBGD6EJ+69KjhZ8tshJmiwlSl0=; b=f8i1MIl2fPqqMYc7/S3sHeFpdW
 JCEA+bkAhRf2AcCJhjJehuQ3AEn5+olHHXXGRhdkl/Q7lMi9ggO24qw+OYxsS/qL3t4LqScRSqFwQ
 azxxU02cDLGHyns4+Ac9cjJcKhqch9/oCOOkj+isMOsqYAHFVaj9qIwTqDXEmQjTP978=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk7TC-00GCF3-H2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 18:02:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 163C063D9B;
 Wed,  5 Apr 2023 18:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EE1C433D2;
 Wed,  5 Apr 2023 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680717768;
 bh=3aMW3YLQCtQtlrkIbSPGZmnQ0yHQUxiJ9ttklW4hHxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDpmWKsJVZ3ckZA2xplbSRbcINv1TpMxisrITW5MrlmHOMQ3fien87NPN4a9AJA/B
 x/QThFLx1SwGIWFo7Yx4Ag15CHnoj5bQhPU74Lr9NnQzQAppm4KDtyjgnjuKzJLhfa
 7HyOovstmSkofw3kQLFfw9x5/h+8yFRSKEbXd3TFBt1w7lWOvtRr56+nYgTgBGNR50
 Ljh42NAKmGC04mDXzBLfWEnfodDd6BPXzXQouL4wP0Gh16p95effEXjNlRYp8rj8tc
 QM6XfbnPOu9Rc95DaJV9yZ5Z6e/fRetGpCm+o4wsNTx7fpv6ZZEpQM7h1h3nHBzDie
 nZaAvfwaMjd3A==
Date: Wed, 5 Apr 2023 18:02:47 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZC23x22bxItnsANI@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
 <ZC2YsgYRsvBejGYY@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZC2YsgYRsvBejGYY@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 08:50:10AM -0700, Christoph Hellwig
 wrote: > On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong wrote:
 > > Thinking about this a little more -- I suppose we shouldn't ju [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk7TC-00GCF3-H2
Subject: Re: [f2fs-dev] [PATCH v2 19/23] xfs: disable direct read path for
 fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, agruenba@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 dchinner@redhat.com, rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, damien.lemoal@opensource.wdc.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 08:50:10AM -0700, Christoph Hellwig wrote:
> On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong wrote:
> > Thinking about this a little more -- I suppose we shouldn't just go
> > breaking directio reads from a verity file if we can help it.  Is there
> > a way to ask fsverity to perform its validation against some arbitrary
> > memory buffer that happens to be fs-block aligned?

You could certainly add such a function that wraps around verify_data_block().
The minimal function prototype needed (without supporting readahead or reusing
the ahash_request) would be something like the following, I think:

    bool fsverity_verify_blocks_dio(struct inode *inode, u64 pos,
                                    struct folio *folio,
                                    size_t len, size_t offset);

And I really hope that you don't want to do DIO to the *Merkle tree*, as that
would make the problem significantly harder.  I think DIO for the data, but
handling the Merkle tree in the usual way, would be okay?

> 
> That would be my preference as well.  But maybe Eric know a good reason
> why this hasn't been done yet.
> 

I believe it would be possible, especially if DIO to the Merkle tree is not in
scope.  There just hasn't been a reason to the work yet.  And ext4 and f2fs
already fall back to buffer I/O for other filesystem features, so there was
precedent for not bothering with DIO, at least in the initial version.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
