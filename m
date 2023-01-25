Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B267B911
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jan 2023 19:12:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKkGS-0000jp-3k;
	Wed, 25 Jan 2023 18:12:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pKkGL-0000jh-SU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 18:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EBS10aDrtkw821Xmyv6nEYRLJo+ZppQq9rENsQuh5Lo=; b=ix62EafBdIFvxP4sL0XgTSHFTa
 c6rQi+pVOKXsxDLTWI/b/eLuDSBKvdt8GqR0VBib7ops0y44NdjWhXhKujzF+cXQfaMsoOEfRT1iu
 cWtzQVCCeO0jPhiYixEto7MNbBPL0nrqh35LsZtFdMO+3murPv+WryMaDKqIWGod9AnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EBS10aDrtkw821Xmyv6nEYRLJo+ZppQq9rENsQuh5Lo=; b=kGsW3QGpOv8/t5rd8HU5cWB+B1
 ZBCmLR5m8H0OsBRI5uyih6IRLOWUgtehRg7U/g5/GA3SrhapbEVT3/dOVXg0V29+BXukquCCJ037W
 WMVcY/2S5bXwf/syN3jfAb89FPyEXyouBtCEA3MZ0+S9KIJMxrF/870YljEUC0zi0jBA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKkGG-0008BK-Ml for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 18:12:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21235B81B60;
 Wed, 25 Jan 2023 18:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C292C433EF;
 Wed, 25 Jan 2023 18:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674670352;
 bh=F0+KwPG8MCwYAmQMNO2Dkfq1GxfcBnu7RqgtyJ5Rt1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qdnzSCN8CDjbnB796I3wpMFxkId5shNmhXbKyYOTDqY86+dTy/nu/EMGDMVL9D1TW
 8bPogFWHZK4MDvcy4NWmESfgiL7cXbpG6hpKGGxgyRCPbZ12KU5tyllY/lpkwY9mKH
 0oQTr76F0wuO7KuePnGDRALqu3RTN780VmT2c5EyWYr+uF86UKNdbqzJzZbOrOGcfY
 kvxsViMdoDDOV1NVXgxjQ7bv8DkPiGdUzC+nLkLdxZBd+5Fzds7YQNadrOCXTcHKMH
 VJHCi+Nyjgn8xNfOPFNLpNQ0xaVLiH/h5y0WOfk1YHU/YB624gXfRDY7u0XITSCDco
 YLgP4Qn9zaRaw==
Date: Wed, 25 Jan 2023 10:12:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <Y9FxDqhdLe5RJ9Iq@sol.localdomain>
References: <20221214224304.145712-1-ebiggers@kernel.org>
 <20221214224304.145712-5-ebiggers@kernel.org>
 <20230125122227.lgwp2t5tdzten3dk@aalbersh.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125122227.lgwp2t5tdzten3dk@aalbersh.remote.csb>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [Added back Cc's. Please use Reply-All instead of Reply!]
 On Wed, Jan 25, 2023 at 01:22:27PM +0100, Andrey Albershteyn wrote: > On Wed, 
 Dec 14, 2022 at 02:43:04PM -0800, Eric Biggers wrote: > > From: Eric Biggers
 <ebiggers@google.com> > > > > fsverity_operat [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pKkGG-0008BK-Ml
Subject: Re: [f2fs-dev] [PATCH 4/4] fsverity: pass pos and size to
 ->write_merkle_tree_block
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
Cc: Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[Added back Cc's.  Please use Reply-All instead of Reply!]

On Wed, Jan 25, 2023 at 01:22:27PM +0100, Andrey Albershteyn wrote:
> On Wed, Dec 14, 2022 at 02:43:04PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > fsverity_operations::write_merkle_tree_block is passed the index of the
> > block to write and the log base 2 of the block size.  However, all
> > implementations of it use these parameters only to calculate the
> > position and the size of the block, in bytes.
> > 
> > Therefore, make ->write_merkle_tree_block take 'pos' and 'size'
> > parameters instead of 'index' and 'log_blocksize'.
> 
> Hi Eric,
> 
> Thanks for the quick responses with changes to fs-verity!
> 
> With this patch shouldn't the read_merkle_tree_block() also change
> to [pos, size] args? I see that ext4 uses index to read the page at
> that index + file size. But I suppose that when Merkle tree block
> size will vary (e.g. 8k) it will require position + size.

Not yet.  It's actually read_merkle_tree_page(), not read_merkle_tree_block().
The callees want a page index, and pages always have size PAGE_SIZE.  So the
current function prototype is appropriate for the current design.

> In XFS as we store the page under the xattr with "pos" as a name
> we also need a "pos" while reading the page. So, currently XFS can
> use index << log2(PAGE_SHIFT) or will need to get also log_blocksize
> from descriptor.

But you definitely need to think about what changes should be made to allow XFS
to do the Merkle tree caching the way the other XFS developers want it to do.
There will be significantly more to that than potentially changing a function
prototype.  There's been some discussion of this on the "fs-verity support for
XFS" thread, but there's not a detailed proposal yet.

Note: you should store Merkle tree blocks in the xattrs instead of "pages", so
that the on-disk format isn't tied to the page size.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
