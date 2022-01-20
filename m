Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 038DC4952ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 18:10:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAaxK-0000AM-Hf; Thu, 20 Jan 2022 17:10:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1nAaxJ-0000AB-Bf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 17:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gNktdXg+JN1j8MvcFmJ5hNCd4MLyU0iMR3T+IVlIzTw=; b=g+5DZTVo/+1uF/stHRJ2wBpthd
 1zpbZ3L/tp4CGHMWo9KC25jZ1+EnzsaGC/gPReaFc1JIsUxWu8iI8yLNo2URyz/I4C9t35Ah0ACdY
 YeaEpJqyisuJEBLwMdsvZGDuyCgh5UGu5l5aqCvZs0ILNV15qNKOnsZj2zKX+ReAUIQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gNktdXg+JN1j8MvcFmJ5hNCd4MLyU0iMR3T+IVlIzTw=; b=hIrJqP8IYrkkNpHQBrE7ulWlEF
 QZG5I0PHhTLEFv5vDe+SfaOPNf5K0iEQ19Bu8bwh6kYHG5l1wHxdVN6IYbLlNe/p5OPFLnZ5lDuFh
 5lTsbKlEMmff+Rpsx8YvR8vlH9fzpp/0duP/I0fgETLP3yyL9J9G4+WlU8vIcI/A6+9s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAaxH-005D4b-4c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 17:10:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5A66B81D46;
 Thu, 20 Jan 2022 17:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95112C340E3;
 Thu, 20 Jan 2022 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642698627;
 bh=9PrP2YPwXIw91H36sa+ARSocJ1Cu1ipD8VSQgbT6nsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bhOy/kkCPk22TFeoPt2RuBI8RgWYvZQ4Q+WFtZjvDyGcYQVZUpqdG5f0VUgm48K0h
 MAJ5Td5mQTsGy6R0nKSPKNAuHmiQRFPMWGOJK0pWRMbGTYMDpHnksDXZGhe+pFPQ2d
 2bRQbwL3T+pLDBMnj01EyoieNkhV45F1Lhh+r8UZIrzDKk3rGWTMRZ8eBzL1W/BOxs
 K4eeC/S6bq53oHhxE60pa3B/MiQmgmzr/9Z4AzvnfHWnNqy5BEjJG3IXdYfiP2Cr91
 RQPzfu7rc3eq7EC08CEIDJzpjFAiTI8wtD7IcmJ6LCNRyIcL3jl6mSk+xkPhQS/8FW
 ZcRex+d8Jee8A==
Date: Thu, 20 Jan 2022 09:10:27 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20220120171027.GL13540@magnolia>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YekdnxpeunTGfXqX@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig
 wrote: > On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote: >
 > > > Given the above, as far as I know the only remaining objectio [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nAaxH-005D4b-4c
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 20, 2022 at 12:30:23AM -0800, Christoph Hellwig wrote:
> On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
> > 
> > Given the above, as far as I know the only remaining objection to this
> > patchset would be that DIO constraints aren't sufficiently discoverable
> > by userspace.  Now, to put this in context, this is a longstanding issue
> > with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> > not specific to this feature, and it doesn't actually seem to be too
> > important in practice; many other filesystem features place constraints
> > on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> > (And for better or worse, many systems using fscrypt already have
> > out-of-tree patches that enable DIO support, and people don't seem to
> > have trouble with the FS block size alignment requirement.)
> 
> It might make sense to use this as an opportunity to implement
> XFS_IOC_DIOINFO for ext4 and f2fs.

Hmm.  A potential problem with DIOINFO is that it doesn't explicitly
list the /file/ position alignment requirement:

struct dioattr {
	__u32		d_mem;		/* data buffer memory alignment */
	__u32		d_miniosz;	/* min xfer size		*/
	__u32		d_maxiosz;	/* max xfer size		*/
};

Since I /think/ fscrypt requires that directio writes be aligned to file
block size, right?

> > I plan to propose a new generic ioctl to address the issue of DIO
> > constraints being insufficiently discoverable.  But until then, I'm

Which is what I suspect Eric meant by this sentence. :)

> > wondering if people are willing to consider this patchset again, or
> > whether it is considered blocked by this issue alone.  (And if this
> > patchset is still unacceptable, would it be acceptable with f2fs support
> > only, given that f2fs *already* only allows FS block size aligned DIO?)
> 
> I think the patchset looks fine, but I'd really love to have a way for
> the alignment restrictions to be discoverable from the start.

I agree.  The mechanics of the patchset look ok to me, but it's very
unfortunate that there's no way for userspace programs to ask the kernel
about the directio geometry for a file.

Ever since we added reflink to XFS I've wanted to add a way to tell
userspace that direct writes to a reflink(able) file will be much more
efficient if they can align the io request to 1 fs block instead of 1
sector.

How about something like this:

struct dioattr2 {
	__u32		d_mem;		/* data buffer memory alignment */
	__u32		d_miniosz;	/* min xfer size		*/
	__u32		d_maxiosz;	/* max xfer size		*/

	/* file range must be aligned to this value */
	__u32		d_min_fpos;

	/* for optimal performance, align file range to this */
	__u32		d_opt_fpos;

	__u32		d_padding[11];
};

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
