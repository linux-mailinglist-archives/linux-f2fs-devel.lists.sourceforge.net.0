Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DDC6D85C8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 20:16:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk7g4-0001w1-Gp;
	Wed, 05 Apr 2023 18:16:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pk7g4-0001vv-2M
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 18:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nMGdYZVz88iNnPqnJrvWnqcw1Ql+5T1kzULIEIbApDk=; b=CqNWLylTfA6L+UMMnHLadGxJRg
 SFFZ15IOmOeOWMor/FhxeWaz9Av3Zxw45wZB4uIESlgM6YOiD7rYCRNl7RATr3Y1LyFRHMJul6QnZ
 yYPLeQokvM/tRcl7mGL103ivgyUD+4/DG0A27SergrPSRBKYvP//fA5iDu6KPOEkW2f4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nMGdYZVz88iNnPqnJrvWnqcw1Ql+5T1kzULIEIbApDk=; b=FFU+mjFMRKuanjZmPv1b2hbHv7
 LO7yT6u/IgwSUHTcFXLZ2hVxnxTJrsi+XaMs00Yq1C4BbO2E9OYAMZy04odxRaMjI9HJWVhk3c6Ch
 hxl7KQG7hkSyN9g6KCEgUN0DTB5B8dFJSedl7358jFhfnzILKCoswMGN4piF2ySt4Ebo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk7fz-00067m-PL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 18:16:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EC7B63D3A;
 Wed,  5 Apr 2023 18:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710CAC433EF;
 Wed,  5 Apr 2023 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680718561;
 bh=wiJeaBlTTUnHN5dRjU986tMd+hpSmAJjFn5myvsg4zA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=REOOWtLgQ9JDh9SSF6xoyg94oSouuHFnpL2v3YnQ3T2oBYSI6IMS8Hy8imtRKtDy1
 cU3K/Iy3e/I3Q2+TSdKRafqsRNXapecZukPc1WANLn9sTP01Li50nyZ7qlCS5TCVJ+
 3cW7AZM1K/82Q6rN89XufLRWJRxkvNpgVxn/rDB2tRQwEAn32VY0qtyYqIT5Mhljtf
 O5whuuDDjSKbQwdJKsF8Nl8Wr8dqY9vgtd1lUYNpjci7tFUD9wHH4/61yvdWJlTH+K
 DtIew2Dd7HkelryBLbZ5MioiFh7yAV2qMaWKrH/687VXslb1Q2GI4zSjEhOMaWMwe0
 NDlFE8RqYVveQ==
Date: Wed, 5 Apr 2023 18:16:00 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ZC264FSkDQidOQ4N@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405163847.GG303486@frogsfrogsfrogs>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 09:38:47AM -0700, Darrick J. Wong
 wrote: > > The merkle tree pages are dropped after verification. When page
 is > > dropped xfs_buf is marked as verified. If fs-verity wants to [...]
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
X-Headers-End: 1pk7fz-00067m-PL
Subject: Re: [f2fs-dev] [PATCH v2 21/23] xfs: handle merkle tree block size
 != fs blocksize != PAGE_SIZE
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 09:38:47AM -0700, Darrick J. Wong wrote:
> > The merkle tree pages are dropped after verification. When page is
> > dropped xfs_buf is marked as verified. If fs-verity wants to
> > verify again it will get the same verified buffer. If buffer is
> > evicted it won't have verified state.
> > 
> > So, with enough memory pressure buffers will be dropped and need to
> > be reverified.
> 
> Please excuse me if this was discussed and rejected long ago, but
> perhaps fsverity should try to hang on to the merkle tree pages that
> this function returns for as long as possible until reclaim comes for
> them?
> 
> With the merkle tree page lifetimes extended, you then don't need to
> attach the xfs_buf to page->private, nor does xfs have to extend the
> buffer cache to stash XBF_VERITY_CHECKED.

Well, all the other filesystems that support fsverity (ext4, f2fs, and btrfs)
just cache the Merkle tree pages in the inode's page cache.  It's an approach
that I know some people aren't a fan of, but it's efficient and it works.

We could certainly think about moving to a design where fs/verity/ asks the
filesystem to just *read* a Merkle tree block, without adding it to a cache, and
then fs/verity/ implements the caching itself.  That would require some large
changes to each filesystem, though, unless we were to double-cache the Merkle
tree blocks which would be inefficient.

So it feels like continuing to have the filesystem (not fs/verity/) be
responsible for the cache is the best way to allow XFS to do things a bit
differently, without regressing the other filesystems.

I'm interested in hearing any other proposals, though.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
