Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604E22E395
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 02:59:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jzrUE-0003TJ-L3; Mon, 27 Jul 2020 00:59:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jzrUD-0003TA-9c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 00:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AecOJBgKfbWpewVKyfOBgdwAX06XdKmGJLVXwSPxEM=; b=OqIZamtsbNZXtrRVCDlwLwzuU/
 TYiJa/JM67PZhmGpabdR6gJYJZX4a+g2KwyDRnF8FjjhDVQuYbKKkthi8ctk511AgkB989YAUmaEU
 UGdOgxbuE7CYdWkgEEBST82UhBgIC0XqybaiR+OXVp1/Jt1NcAFu24mbJ6N0NzAInrBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6AecOJBgKfbWpewVKyfOBgdwAX06XdKmGJLVXwSPxEM=; b=OTWWmw+rSyHj7Rwen+LFlSq1oK
 tOEJNtBpaq0rZroAAvdzx2bl5SWks8RfQPR8MaNtxkNjjNSGgGQc9IdnotsWSM0QsKm/7WfhMmeBJ
 DBolDVej/QEMtTpRrkE4k4jKoPzMy0QL23KnGFxycWRvZ5kG5U119E3h3OLXHGVqgtP0=;
Received: from mail108.syd.optusnet.com.au ([211.29.132.59])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jzrU9-003YWX-5V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 00:59:25 +0000
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
 [49.180.53.24])
 by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id 9E4AA1AB97C;
 Mon, 27 Jul 2020 10:58:50 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jzrTc-0001qC-3B; Mon, 27 Jul 2020 10:58:48 +1000
Date: Mon, 27 Jul 2020 10:58:48 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200727005848.GV2005@dread.disaster.area>
References: <20200724184501.1651378-1-satyat@google.com>
 <20200724184501.1651378-2-satyat@google.com>
 <20200725001441.GQ2005@dread.disaster.area>
 <20200726024920.GB14321@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726024920.GB14321@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
 a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
 a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=7-415B0cAAAA:8
 a=HhHiFS5hF6oLP9lHTOgA:9 a=NJy3QXZAm110Gvun:21 a=N6VXu3NYk34LK-xd:21
 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.59 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jzrU9-003YWX-5V
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fscrypt: Add functions for direct I/O
 support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 25, 2020 at 07:49:20PM -0700, Eric Biggers wrote:
> On Sat, Jul 25, 2020 at 10:14:41AM +1000, Dave Chinner wrote:
> > > +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> > > +{
> > > +	const struct inode *inode = file_inode(iocb->ki_filp);
> > > +	const unsigned int blocksize = i_blocksize(inode);
> > > +
> > > +	/* If the file is unencrypted, no veto from us. */
> > > +	if (!fscrypt_needs_contents_encryption(inode))
> > > +		return true;
> > > +
> > > +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> > > +	if (!fscrypt_inode_uses_inline_crypto(inode))
> > > +		return false;
> > > +
> > > +	/*
> > > +	 * Since the granularity of encryption is filesystem blocks, the I/O
> > > +	 * must be block aligned -- not just disk sector aligned.
> > > +	 */
> > > +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
> > > +		return false;
> > 
> > Doesn't this force user buffers to be filesystem block size aligned,
> > instead of 512 byte aligned as is typical for direct IO?
> > 
> > That's going to cause applications that work fine on normal
> > filesystems becaues the memalign() buffers to 512 bytes or logical
> > block device sector sizes (as per the open(2) man page) to fail on
> > encrypted volumes, and it's not going to be obvious to users as to
> > why this happens.
> 
> The status quo is that direct I/O on encrypted files falls back to buffered I/O.

Largely irrelevant.

You claimed in another thread that performance is a key feature that
inline encryption + DIO provides. Now you're implying that failing
to provide that performance doesn't really matter at all.

> So this patch is strictly an improvement; it's making direct I/O work in a case
> where previously it didn't work.

Improvements still need to follow longstanding conventions. And,
IMO, it's not an improvement if the feature results in 
unpredictable performance for userspace applications.

i.e. there is no point in enabling direct IO if it is unpredictably
going to fall back to the buffered IO path when applications are
coded to the guidelines the man page said they should use. Such
problems are an utter PITA to diagnose in the field, and on those
grounds alone the current implementation gets a NACK.

> Note that there are lots of other cases where ext4 and f2fs fall back to
> buffered I/O; see ext4_dio_supported() and f2fs_force_buffered_io().  So this
> isn't a new problem.

No shit, sherlock. But that's also irrelevant to the discussion at
hand - claiming "we can fall back to buffered IO" doesn't address
the problem I've raised. It's just an excuse for not fixing it.

Indeed, the problem is easy to fix - fscrypt only cares that the
user IO offset and length is DUN aligned.  fscrypt does not care
that the user memory buffer is filesystem block aligned - user
memory buffer alignment is an underlying hardware DMA constraint -
and so fscrypt_dio_supported() needs to relax or remove the user
memroy buffer alignment constraint so that it follows existing
conventions....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
