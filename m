Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26DB00B8F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 20:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmK5Abe7MwOM2NfrKU2s8mhcGfCUf2pg+wNc9UD3SC8=; b=drfIij5nRzNUun/dhqKqnhCg2v
	obDPoWmvRKpq5zN2dr+TMoQKNQdytzRQY45grMhxF/m7D6Lwetufbq30v2Nqe2xV2gh5u9PPY3+wv
	XaXi95TGUe8FfmgUDiH6EGbzIyWwa73iYb2D9uwPYZpzqXDpW2HAecge2waN4Zqktoqk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZwDB-0001tN-DX;
	Thu, 10 Jul 2025 18:41:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1uZwD9-0001tG-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 18:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4BIQ0YzbWgDLZuTNtQ8L6nBVEh6ENrzY2g79PLtP8UI=; b=hW1bXTyCONqayX0rH/t9h107WP
 CTeHhpTu7UEgyxhESsI6q8bGqW8uCsswG/RUa7IzrTqTHREL/g7ygG90FTpChojNZG2SsCAc6hhDx
 Xf0ZIk3uPmwVEs5ISc7zwpbrSj+wx91PIHHuJb8JlK6RXuPIpVBT3V1oLLN1OfdliHRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4BIQ0YzbWgDLZuTNtQ8L6nBVEh6ENrzY2g79PLtP8UI=; b=XQoeU843sma7PT/tGoX1qtLaZq
 18sQS4VrdbHohfXDB9j9sJ2yhZ5pSknTRVvtW9l9V36cyII+C+H9XwjGayX7OFnAedUCKHTVegk5m
 OUv1NzXbL1ePPKyV8K2WYM4IWak17JMUkr6FeEJDZXKwg0fdAe4Ay97IgkkqJhMQ8ric=;
Received: from out-172.mta0.migadu.com ([91.218.175.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZwD8-00072W-PL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 18:41:35 +0000
Date: Thu, 10 Jul 2025 14:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752172882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4BIQ0YzbWgDLZuTNtQ8L6nBVEh6ENrzY2g79PLtP8UI=;
 b=YR3JBw0dNQxWT8gbfOrQApQA3Dr/mncyvyWlhdULFlpmatye4WQWSGg+jo14ol4mS36JHY
 HHEptsY8mnK7lMtHhlgU9ZWw06YTXudIOiL3YY7WVl8TqHFp7dZrbySpEs9bEUWoszkMXv
 xx0hqlX1kXJ+NYMyOY8UTChQdDIsxs0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Jan Kara <jack@suse.cz>
Message-ID: <5xno4s25lsd2sqq6judn7moorgy2h3konejgassnzlccfa6jsf@ez6ciofy3bwp>
References: <343vlonfhw76mnbjnysejihoxsjyp2kzwvedhjjjml4ccaygbq@72m67s3e2ped>
 <y2rpp6u6pksjrzgxsn5rtcsl2vspffkcbtu6tfzgo7thn7g23p@7quhaixfx5yh>
 <kgolzhhd47x3iqkdrwyzh65ng4mm6cauxdjgiao2otztncyc3f@rskadwaph2l5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <kgolzhhd47x3iqkdrwyzh65ng4mm6cauxdjgiao2otztncyc3f@rskadwaph2l5>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 10, 2025 at 03:10:04PM +0200, Jan Kara wrote:
 > On Wed 09-07-25 13:49:12, Kent Overstreet wrote: > > On Wed, Jul 09, 2025
 at 07:23:07PM +0200, Jan Kara wrote: > > > > It also avoids the pr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZwD8-00072W-PL
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 10, 2025 at 03:10:04PM +0200, Jan Kara wrote:
> On Wed 09-07-25 13:49:12, Kent Overstreet wrote:
> > On Wed, Jul 09, 2025 at 07:23:07PM +0200, Jan Kara wrote:
> > > > It also avoids the problem of ->mark_dead events being generated
> > > > from a context that holds filesystem/vfs locks and then deadlocking
> > > > waiting for those locks to be released.
> > > > 
> > > > IOWs, a multi-device filesystem should really be implementing
> > > > ->mark_dead itself, and should not be depending on being able to
> > > > lock the superblock to take an active reference to it.
> > > > 
> > > > It should be pretty clear that these are not issues that the generic
> > > > filesystem ->mark_dead implementation should be trying to
> > > > handle.....
> > > 
> > > Well, IMO every fs implementation needs to do the bdev -> sb transition and
> > > make sb somehow stable. It may be that grabbing s_umount and active sb
> > > reference is not what everybody wants but AFAIU btrfs as the second
> > > multi-device filesystem would be fine with that and for bcachefs this
> > > doesn't work only because they have special superblock instantiation
> > > behavior on mount for independent reasons (i.e., not because active ref
> > > + s_umount would be problematic for them) if I understand Kent right.
> > > So I'm still not fully convinced each multi-device filesystem should be
> > > shipping their special method to get from device to stable sb reference.
> > 
> > Honestly, the sync_filesystem() call seems bogus.
> > 
> > If the block device is truly dead, what's it going to accomplish?
> 
> Notice that fs_bdev_mark_dead() calls sync_filesystem() only in case
> 'surprise' argument is false - meaning this is actually a notification
> *before* the device is going away. I.e., graceful device hot unplug when
> you can access the device to clean up as much as possible.

That doesn't seem to be hooked up to anything?

blk_mark_disk_dead() -> blk_report_disk_dead(), surprise is always true

disk_force_media_change(), same

The only call where it's falso is in s390 code. If we know that a disk
is going away, that would be a userspace thing, and they can just
unmount.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
