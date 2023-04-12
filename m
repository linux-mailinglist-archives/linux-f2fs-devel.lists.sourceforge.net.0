Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E286DE977
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 04:33:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmQIg-0006E1-Mt;
	Wed, 12 Apr 2023 02:33:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pmQIe-0006Ds-8r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 02:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7cvxi4mXz5zjzi4JIBZ0G/0ou83kWE466Fx7kWGv6I=; b=a1CWMjsOy6J7q1M8WfSCxuQ/oV
 2v/Dm1l83pGunMBw/lhkSiC9s6FdRN4PFjFRnDN6oOBUaHohzZ7L9mwH9B2CKjt/x6N+gxGTFclfg
 fMYAihGSDgxT1hF0SbmDfJ8ye/g6C6K3WkcNvCYs0RFcxG8Oqnf5XfjuhYiTa0JR9I+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7cvxi4mXz5zjzi4JIBZ0G/0ou83kWE466Fx7kWGv6I=; b=HinSHEUyhqbfMfwwR8qiZd26+5
 fFW0jo4X/cRPqKPYiBNJ3u67M9gfKzYWEmzFH+ZGiiLLR1zsdgZSrm3raPrYqArjGsK5qeZBDPUr0
 0BKLJpJZJSF4O9ZtUoXeJOYCcbbpRPskhAzEc5MCcfSkNg51cNqM4ezjyncmyUWYQPr8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmQIc-0007ia-N2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 02:33:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2265560FA2;
 Wed, 12 Apr 2023 02:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F370C433D2;
 Wed, 12 Apr 2023 02:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681266801;
 bh=uWYRkl4H5QxQQyKZRkipfJYb8JT+WBT0+Wf0sQwa8R4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICEWpWIHfCvZctrTa23zt5ow0V8NDHh2F1i00eVdXSsHwgqMLrkRT/XlEYlKmjHDc
 19nDnI8fLxzFqlz2xC7lWzBe/z+FLZQp9I6XnZMJNnBuVmGr4gIcbNqsErYoKb0m7p
 sxQgr5EWBTLQtP3m6ZbcVg4DVMLneqkbV0LUwwpej+ysbJ8GM6GOmxaIXmht+TVLM5
 8AoJUx4LJxeAkTKLmK+QxNTrCOzWSGGlTQai0S4osbYt1lIObyZ+GefEjAWZe5ts/v
 1DVrYg2TcXMS5rnXRentQX9hoIWFgOeiZNMnlongYGP1HyqIKramwdoHwdF+582obz
 FYYaJGFJaqEvg==
Date: Tue, 11 Apr 2023 19:33:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230412023319.GA5105@sol.localdomain>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZDTt8jSdG72/UnXi@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 10, 2023 at 10:19:46PM -0700, Christoph Hellwig
 wrote: > Dave is going to hate me for this, but.. > > I've been looking over
 some of the interfaces here, and I'm starting > to very serious [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmQIc-0007ia-N2
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 dchinner@redhat.com, rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, damien.lemoal@opensource.wdc.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 10, 2023 at 10:19:46PM -0700, Christoph Hellwig wrote:
> Dave is going to hate me for this, but..
> 
> I've been looking over some of the interfaces here, and I'm starting
> to very seriously questioning the design decisions of storing the
> fsverity hashes in xattrs.
> 
> Yes, storing them beyond i_size in the file is a bit of a hack, but
> it allows to reuse a lot of the existing infrastructure, and much
> of fsverity is based around it.  So storing them in an xattrs causes
> a lot of churn in the interface.  And the XFS side with special
> casing xattr indices also seems not exactly nice.

It seems it's really just the Merkle tree caching interface that is causing
problems, as it's currently too closely tied to the page cache?  That is just an
implementation detail that could be reworked along the lines of what is being
discussed.

But anyway, it is up to the XFS folks.  Keep in mind there is also the option of
doing what btrfs is doing, where it stores the Merkle tree separately from the
file data stream, but caches it past i_size in the page cache at runtime.

I guess there is also the issue of encryption, which hasn't come up yet since
we're talking about fsverity support only.  The Merkle tree (including the
fsverity_descriptor) is supposed to be encrypted, just like the file contents
are.  Having it be stored after the file contents accomplishes that easily...
Of course, it doesn't have to be that way; a separate key could be derived, or
the Merkle tree blocks could be encrypted with the file contents key using
indices past i_size, without them physically being stored in the data stream.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
