Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C02A4F0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 19:39:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ka1Cm-0005QD-KN; Tue, 03 Nov 2020 18:38:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ka1Cl-0005Q5-DE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 18:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t47ZHoH/WiZrIOdyBf9JhmIWRdujT7t1PgwImejEP48=; b=DzOO2up7uhsQ7rwOWaFbn0uRGr
 vVKlDNfxWoPgZfvHBVMLR40xmOfd+v/U7FPHQ0GDqs2EmrmTGujK1NwG39nYxmvm4ELj1E3xPL8kH
 A5+nymi8qcJ3Y/Tv485DOw+m60sWnpAeyFkW4NKygThwWeNmH0AgKnxQSymx8rIMBlVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t47ZHoH/WiZrIOdyBf9JhmIWRdujT7t1PgwImejEP48=; b=KnStrpvdSowwqcLz8RM4diI97A
 R5LDMP4o1Z/6tFy0aAoayMvPCb4zQc7vK08PIU1BrjU3UJwX/tvDp73I5KadgykUTYldS8gKgnaQB
 sQO3xOeNLm9AWQny8Fm8V3fiS+pl6rCSwH2kLVbfMfprQDdcG48EBETEE5oXGKeUr9RQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ka1Cj-0086JD-9t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 18:38:51 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3299B2074B;
 Tue,  3 Nov 2020 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604428721;
 bh=YUU7O0xdkH9I0WPyXBZOk+F4aYmRrcXzu3VCC7u62jY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ke2jgXQEiYikomRounWe5La8GXGy6aMYfzYjBicVKTz0+2z3ePhwj2okspsy3x1Sj
 pR9Pi8/c5eQQnno2G9Cv+LNNr0OD0bmFRDuvSb3ZJlb7zJr8cqbpJbCx1RgT+O2n1u
 eVzeZ0z3pW60GVRwYuYpQu2lxvWaFAAVyBYadbAU=
Date: Tue, 3 Nov 2020 10:38:39 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201103183839.GA1273166@google.com>
References: <20201102062131.14205-1-yuchao0@huawei.com>
 <20201103032234.GB2875@sol.localdomain>
 <c7e47bac-16e6-2038-3eb3-0fdb787ce977@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7e47bac-16e6-2038-3eb3-0fdb787ce977@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: decadent.org.uk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ka1Cj-0086JD-9t
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: move ioctl interface definitions to
 separated file
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/03, Chao Yu wrote:
> On 2020/11/3 11:22, Eric Biggers wrote:
> > On Mon, Nov 02, 2020 at 02:21:31PM +0800, Chao Yu wrote:
> > > +#define F2FS_IOC_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
> > > +						struct f2fs_move_range)
> > [...]
> > > +#define F2FS_IOC_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,	\
> > > +						struct f2fs_gc_range)
> > [...]
> > > +
> > > +struct f2fs_gc_range {
> > > +	__u32 sync;
> > > +	__u64 start;
> > > +	__u64 len;
> > > +};
> > [...]
> > > +struct f2fs_move_range {
> > > +	__u32 dst_fd;		/* destination fd */
> > > +	__u64 pos_in;		/* start position in src_fd */
> > > +	__u64 pos_out;		/* start position in dst_fd */
> > > +	__u64 len;		/* size to move */
> > > +};
> > 
> > These two structs are weird because there is implicit padding between the __u32
> > field and the following __u64 field on some 32-bit architectures (e.g. x86_32)
> > but not others (e.g. arm32).
> > 
> > But f2fs_compat_ioctl() doesn't handle these two ioctls specially, but rather
> > just calls through to f2fs_ioctl().  That's wrong, and it means that
> > F2FS_IOC_MOVE_RANGE and F2FS_IOC_GARBAGE_COLLECT_RANGE won't work when called
> > from an x86_32 binary on an x86_64 kernel.
> 
> Nice catch!
> 
> > 
> > So something needs to be fixed.  I wonder if it's safe to just explicitly add
> > the padding field after the fact.  If no one is actually using these two ioctls
> > in a case where both userspace and the kernel lack the implicit padding (e.g.,
> > x86_32 userspace with x86_32 kernel), it should be fine...
> 
> IIRC, Jaegeuk added those interfaces, I hope it's not the requirement from other
> f2fs userspace developers...if it is, there may be users.
> 
> I found one patch in ext4 which fixes the similar issue, I guess we can fix this
> with the same way, thoughts?

Agreed. Please fix along with f2fs-tools/f2fs_io.

> 
> commit 4d92dc0f00a775dc2e1267b0e00befb783902fe7
> Author: Ben Hutchings <ben@decadent.org.uk>
> Date:   Mon May 17 06:00:00 2010 -0400
> 
>     ext4: Fix compat EXT4_IOC_ADD_GROUP
> 
>     struct ext4_new_group_input needs to be converted because u64 has
>     only 32-bit alignment on some 32-bit architectures, notably i386.
> 
> Thanks,
> 
> > 
> > - Eric
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
