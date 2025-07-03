Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2848AF74F4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jul 2025 15:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRy3AUFy3O78n7OwATkmpRmQD7Tw4UXcA//QX/N7R/M=; b=exo85M0wp4gvuLqiUYyfxIPUT9
	5lzxH4C83mtOhtcQrMdU82ongT6yIcCoeqJkrogrgEDFbsOF0PzyMHcAE529or7xFdT24sYxcEqNK
	MCYnmPFTvB8JR6LJUWXx6CX8qKkzYztHo8rSTq8PEmivhJfNLzTadg5P9yvWH+dT37qM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXJcr-0007mp-HM;
	Thu, 03 Jul 2025 13:05:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uXJcq-0007mj-Ji
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 13:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v+kiTNw6gsKn4FIH6q/9gpLZes6iK7KPLf4EnRpYFjU=; b=AJpl3NJvlLq3+77ley1W5VHZJS
 MpAz7j0uULb6JUxA6C37IOHyXPw6K4OsiL9947WGkkkPFI2YZCDvn7fwc+hvWVopka1KRxic822cS
 e/CzK8Gy+J8fYg58LR9p3Iyvu1aQpArVT/gl0NB/iqxkKGcCZnm4iVcdV6qtNpk5Vyt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v+kiTNw6gsKn4FIH6q/9gpLZes6iK7KPLf4EnRpYFjU=; b=G/OTu+/RUWxqvubXeM8qDjzfv5
 I69l+uIH5FHkBans2N676V1B9Q/hYS64OAbta3Gi7KCLHQgp+4mQPDW2eJK/RBSvG4eFpOj4QsWE9
 OzXJFuxezuUR7+r/Y7sSKgi8B/khX4LifnpzAJJ3wwjcyJyKXtFMHrk7Ydry/2tjMSuY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXJcp-00026S-Td for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 13:05:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5035468BFE; Thu,  3 Jul 2025 15:05:00 +0200 (CEST)
Date: Thu, 3 Jul 2025 15:05:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20250703130500.GA23864@lst.de>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
 <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
 <20250702184312.GC9991@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702184312.GC9991@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 02, 2025 at 11:43:12AM -0700, Darrick J. Wong
 wrote: > > On a spinning disk, random IO bandwidth remains unchanged, while
 sequential > > IO performance declines. However, setting nr_wb_ctx [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uXJcp-00026S-Td
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 hch@lst.de, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, linux-nfs@vger.kernel.org, da.gomez@samsung.com,
 viro@zeniv.linux.org.uk, Kundan Kumar <kundanthebest@gmail.com>,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 02, 2025 at 11:43:12AM -0700, Darrick J. Wong wrote:
> > On a spinning disk, random IO bandwidth remains unchanged, while sequential
> > IO performance declines. However, setting nr_wb_ctx = 1 via configurable
> > writeback(planned in next version) eliminates the decline.
> > 
> > echo 1 > /sys/class/bdi/8:16/nwritebacks
> > 
> > We can fetch the device queue's rotational property and allocate BDI with
> > nr_wb_ctx = 1 for rotational disks. Hope this is a viable solution for
> > spinning disks?
> 
> Sounds good to me, spinning rust isn't known for iops.
> 
> Though: What about a raid0 of spinning rust?  Do you see the same
> declines for sequential IO?

Well, even for a raid0 multiple I/O streams will degrade performance
on a disk.  Of course many real life workloads will have multiple
I/O streams anyway.

I think the important part is to have:

 a) sane defaults
 b) an easy way for the file system and/or user to override the default

For a) a single thread for rotational is a good default.  For file system
that driver multiple spindles independently or do compression multiple
threads might still make sense.

For b) one big issue is that right now the whole writeback handling is
per-bdi and not per superblock.  So maybe the first step needs to be
to move the writeback to the superblock instead of bdi?  If someone
uses partitions and multiple file systems on spinning rusts these
days reducing the number of writeback threads isn't really going to
save their day either.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
