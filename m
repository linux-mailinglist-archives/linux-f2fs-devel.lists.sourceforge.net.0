Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FB79EE51
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Sep 2023 18:33:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qgSnv-00074c-Cj;
	Wed, 13 Sep 2023 16:33:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qgSnu-00074T-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Sep 2023 16:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6aPtxLCYed//nrPJlN0YolEEgZg0w4fKTNV4B0HzRo=; b=YvsGBnjXOXTFxNn3PC+m8uJIC9
 LMcDGa4B5CcVZd30vQ0jodr6bBs5DzbMsFsybk61YVp07c0Na2Ljb+9sGyjEVqbMeBNLVOv3j8n88
 2SENHkSH028PkGU7ZUbJ+ZeBqSMKdqu3t19aGywi4ZjM6KfapdwR+d+vnI52yryQPQgM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q6aPtxLCYed//nrPJlN0YolEEgZg0w4fKTNV4B0HzRo=; b=nNsAo8gmcM4tLhT9VVkWwUpJKn
 gDmfXxof05V3LWQXrzJjgwyheiKuC0IQ8mCYnjvp0GKlDDhRkNBVi702DffAj4qDyWWbBkbNv1Z9c
 pz6bvwMjvnmJPzIEtB7/Uf0CN6lwh4AkFyRUZw4L9uEqLdsGaFJujnCH3c46NMYr70qo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qgSnt-0004SA-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Sep 2023 16:33:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E1D5B8252A;
 Wed, 13 Sep 2023 16:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C43C433C8;
 Wed, 13 Sep 2023 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694622797;
 bh=/BE0SzPSHWJUDQnPrCfnTnaEO0Ee7ixrpqIiDWWi4pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEIWOoDeYw0Lf9hWj/zCyZ4x/rGCa/NQnygF+m0lMZeczRYWp/+IE53tvWyCKZsG+
 up2zc8mQP9OdLjIt3ieHpSW+DbqQjZbKoxHgYka+ox5B/duraDYwWYC2flCW6yQuBT
 cv0SrfJZcsbNKoo8+UUGobBcO+5vSh//zaB0oCO1AkX/JNOxsSLnUA74YuG8d2qy//
 xSekU6sH/2OHlD59lMaI3d2pMSviFkxZRQRw7TX7MfD7+om+CEtOj6/4xJ6+C+s9aW
 E5R98PPdfp9ZT0xmFjYnC4VDDVH+LzbtHDEh8winSlhdDUVsFOEtHvfQKUUr5vKlnV
 kky/flcyBX0+w==
Date: Wed, 13 Sep 2023 18:33:10 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230913-aufgreifen-fehlleiten-204b36f3069d@brauner>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de>
 <20230827194122.GA325446@ZenIV> <20230827214518.GU3390869@ZenIV>
 <20230913110010.GA31292@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913110010.GA31292@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 13, 2023 at 01:00:10PM +0200, Christoph Hellwig
 wrote: > > direct_write_fallback(): on error revert the ->ki_pos update from
 buffered write > > Al, Christian: can you send this fix on top [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qgSnt-0004SA-F2
Subject: Re: [f2fs-dev] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 13, 2023 at 01:00:10PM +0200, Christoph Hellwig wrote:
> > direct_write_fallback(): on error revert the ->ki_pos update from buffered write
> 
> Al, Christian: can you send this fix on top Linus?

Wasn't aware of this, sorry. I've picked it up and placed it with
another set of small fixes I already have.
I'm happy to have Al take it ofc.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
