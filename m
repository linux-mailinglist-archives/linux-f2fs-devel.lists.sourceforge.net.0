Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A115D3D79DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 17:34:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8P5l-00065l-Ed; Tue, 27 Jul 2021 15:34:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1m8P5i-00060j-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 15:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3BqbVFxx32zjKdv3Wx39WMlXk/fz/M+3Nd/MCA4VRbM=; b=ISg6ahgMkODFnBLtplFQKij7Yo
 i+CxBOKe+97dkUmYH1jbrijWeaWdMalQkeQ/vzBxw9vFAXqCMmopDqhY6v4w5Fnk+YBs5ZJnJ/djd
 EtiWvclDVlbyX/QRAM5aEog/qkpRifCKzA6lYdiNrbwDdcyECw6/tKOBvL99zVLSRroM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3BqbVFxx32zjKdv3Wx39WMlXk/fz/M+3Nd/MCA4VRbM=; b=C46WezmNZjWmPM/F8avQ55xRic
 slZhWBKVDYc+jbrH/rfkzyuYGxzhxWb5Q0Qrw2MWxImVql74TxG2x9P9pjwYhG2FN6NsVuriea6Zw
 FRAfqI1n2dlisi3MoqqQs65OKsPKDUwxRZcsLaMCeo5KLmgcxYiN/MC1c4nfVcB68ThI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8P5X-0004gB-Lh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 15:33:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F65161B30;
 Tue, 27 Jul 2021 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627400016;
 bh=4PZARTzEx+NyszsOAu6lbi7w9h8FOGeHdmwe6pE+9NE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMfiwaUj6xWzdeDehxp1Kzifwu3wYRSTIGzv9URGKhVGQ7a5oKrqU5xwTPvM8rNx8
 pL33hpdBVSGbU0eDKRD5kdDDGpSsg07OudM+eVRisgp4MLTvCbY68gt6AFwrlEaWeL
 aopLejmyoFelH+9R0wF/F8FIhMojSeOMTZFJVWxqpP5Rgqa4t4zjqH2VX+AdH5XtWu
 uSZlHgfJSee0K/66CiOCohm2St51HvN8o1LX6E39pR4NUcaFuF7YLB9uTQuObrvHCe
 87yYD/bifuFjreteUYJGN6RMd5ynEbjBdzoY0CxjBKru8RyTZKG4/VRSpIqcus1Gg1
 6rq0L0f6sjiKQ==
Date: Tue, 27 Jul 2021 08:33:35 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20210727153335.GE559212@magnolia>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain> <YP9oou9sx4oJF1sc@google.com>
 <70f16fec-02f6-cb19-c407-856101cacc23@kernel.org>
 <YP+38QzXS6kpLGn0@sol.localdomain>
 <70d9c954-d7f0-bbe2-f078-62273229342f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70d9c954-d7f0-bbe2-f078-62273229342f@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8P5X-0004gB-Lh
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 27, 2021 at 04:30:16PM +0800, Chao Yu wrote:
> On 2021/7/27 15:38, Eric Biggers wrote:
> > That's somewhat helpful, but I've been doing some more investigation and now I'm
> > even more confused.  How can f2fs support non-overwrite DIO writes at all
> > (meaning DIO writes in LFS mode as well as DIO writes to holes in non-LFS mode),
> > given that it has no support for unwritten extents?  AFAICS, as-is users can
> 
> I'm trying to pick up DAX support patch created by Qiuyang from huawei, and it
> looks it faces the same issue, so it tries to fix this by calling sb_issue_zeroout()
> in f2fs_map_blocks() before it returns.

I really hope you don't, because zeroing the region before memcpy'ing it
is absurd.  I don't know if f2fs can do that (xfs can't really) without
pinning resources during a potentially lengthy memcpy operation, but you
/could/ allocate the space in ->iomap_begin, attach some record of that
to iomap->private, and only commit the mapping update in ->iomap_end.

--D

> > easily leak uninitialized disk contents on f2fs by issuing a DIO write that
> > won't complete fully (or might not complete fully), then reading back the blocks
> > that got allocated but not written to.
> > 
> > I think that f2fs will have to take the ext2 approach of not allowing
> > non-overwrite DIO writes at all...
> Yes,
> 
> Another option is to enhance f2fs metadata's scalability which needs to update layout
> of dnode block or SSA block, after that we can record the status of unwritten data block
> there... it's a big change though...
> 
> Thanks,
> 
> > 
> > - Eric
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
