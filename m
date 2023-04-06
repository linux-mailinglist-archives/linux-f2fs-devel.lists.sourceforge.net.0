Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F26D8C1F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 02:44:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkDk5-0000oQ-7E;
	Thu, 06 Apr 2023 00:44:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pkDk4-0000oJ-An
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 00:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8gbq9A+CVL6lExX2DdX2+SHU8p7UjFjmZ1IdBn1rhg=; b=Lp7bUZbqdv4mKeOcfbREerMO0f
 yy8o0Ob9X+ssWUs2AaSRkhgx1JBsMa8x6ZQ2lk1UXWkbBt2WOmE3Zc9YymMtxxbZFzw8qcAs2k197
 Y8gXe8Oh265pLIRswnT/cr/Q7w9TOjwP8aL5fTeXZ3r2oZ0XCoYjThcKp1z9nHqTzIKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8gbq9A+CVL6lExX2DdX2+SHU8p7UjFjmZ1IdBn1rhg=; b=SxrS7wVELymuGhEJmpZHmwiWvU
 DW41o6/n2V8y0kTkPoVjQFWcKAmdcfclgwlWadWc6EEsOsV/B9ct6WInBVFfWASkpzwF9dETLfwP3
 aPy5hlQr6te364RXXkZ8PdeiP3KdObBR/hTnQUhEG2b8aNwosdwLofzEjy7INt7Gkm4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkDk2-00GPjE-Kp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 00:44:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 422DD62A45;
 Thu,  6 Apr 2023 00:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21089C433D2;
 Thu,  6 Apr 2023 00:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680741876;
 bh=zN0uoPG2wy3vEMLhzgjqbmHAqYYQld3AbN2XunzMIoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bo8p3D+S8WueWIQeyXVhF9VsXJIkX3mi7lCuHYZ7OixWNIVgwe52hWCGQTCpabGiY
 6mT1eHjUq2EedAyyBTpNdvhDNGB7ja0pxmv+2hAT4IOl/D6gtx0cKQGX4OsM8OaIJL
 qJbARzdhdEgqxF6P1iYB779hRD2iIfLqS229fGaWr23fMFpB+goPahUZxXr2Z0B7Lo
 U2dQSQsuy/cHfeInl7U1BHZohgOtSGQJM5WZTpux93iA31XE6NFlO2xoLtnQbmkcjC
 vNwntPVZYgHRIbIIfX+e89u8Evn868NI0UF/wcOyIkteZXz1d3WIzEoABhr37UZz1i
 A4vZrijh7VmiQ==
Date: Wed, 5 Apr 2023 17:44:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20230406004434.GA879@sol.localdomain>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
 <ZC38DkQVPZBuZCZN@gmail.com>
 <20230405233753.GU3223426@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405233753.GU3223426@dread.disaster.area>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 06, 2023 at 09:37:53AM +1000, Dave Chinner wrote:
 > On Wed, Apr 05, 2023 at 10:54:06PM +0000, Eric Biggers wrote: > > On Thu,
 Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote: > > > > [...] 
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
X-Headers-End: 1pkDk2-00GPjE-Kp
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
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Apr 06, 2023 at 09:37:53AM +1000, Dave Chinner wrote:
> On Wed, Apr 05, 2023 at 10:54:06PM +0000, Eric Biggers wrote:
> > On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote:
> > > > We could certainly think about moving to a design where fs/verity/ asks the
> > > > filesystem to just *read* a Merkle tree block, without adding it to a cache, and
> > > > then fs/verity/ implements the caching itself.  That would require some large
> > > > changes to each filesystem, though, unless we were to double-cache the Merkle
> > > > tree blocks which would be inefficient.
> > > 
> > > No, that's unnecessary.
> > > 
> > > All we need if for fsverity to require filesystems to pass it byte
> > > addressable data buffers that are externally reference counted. The
> > > filesystem can take a page reference before mapping the page and
> > > passing the kaddr to fsverity, then unmap and drop the reference
> > > when the merkle tree walk is done as per Andrey's new drop callout.
> > > 
> > > fsverity doesn't need to care what the buffer is made from, how it
> > > is cached, what it's life cycle is, etc. The caching mechanism and
> > > reference counting is entirely controlled by the filesystem callout
> > > implementations, and fsverity only needs to deal with memory buffers
> > > that are guaranteed to live for the entire walk of the merkle
> > > tree....
> > 
> > Sure.  Just a couple notes:
> > 
> > First, fs/verity/ does still need to be able to tell whether the buffer is newly
> > instantiated or not.
> 
> Boolean flag from the caller.
> 
> > Second, fs/verity/ uses the ahash API to do the hashing.  ahash is a
> > scatterlist-based API.  Virtual addresses can still be used (see sg_set_buf()),
> > but the memory cannot be vmalloc'ed memory, since virt_to_page() needs to work.
> > Does XFS use vmalloc'ed memory for these buffers?
> 
> Not vmalloc'ed, but vmapped. we allocate the pages individually, but
> then call vm_map_page() to present the higher level code with a
> single contiguous memory range if it is a multi-page buffer.
> 
> We do have the backing info held in the buffer, and that's what we
> use for IO. If fsverity needs a page based scatter/gather list
> for hardware offload, it could ask the filesystem to provide it
> for that given buffer...
> 
> > BTW, converting fs/verity/ from ahash to shash is an option; I've really never
> > been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
> > this, though, would be that it would remove support for all the hardware crypto
> > drivers.
> >
> > That *might* actually be okay, as that approach to crypto acceleration
> > has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
> > worry about e.g. someone coming out of the woodwork and saying they need to use
> > fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
> > they MUST use their crypto accelerator to get acceptable performance.
> 
> True, but we are very unlikely to be using XFS on such small
> systems and I don't think we really care about XFS performance on
> android sized systems, either.
> 

FYI, I've sent an RFC patch that converts fs/verity/ from ahash to shash:
https://lore.kernel.org/r/20230406003714.94580-1-ebiggers@kernel.org

It would be great if we could do that.  But I need to get a better sense for
whether anyone will complain...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
