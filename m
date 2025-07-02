Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D5AF61BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jul 2025 20:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgAlOI0GdXNeEl8Ej2/wovVU+8MeA2dOAaydlY9tVdU=; b=G5E9W2jpaPZHoxbxKfXo9nluXU
	q/9PAKoGDb8cXWaNLDxrWI6DqgYmbR9mp+szy8d1Vagk+5BShlhhcwQMnPm97GXY1vJ3SeXk5sfXf
	PNVDNOxg6+yTgI4bkk5h2NHaKvM3c7fwXmpXT6NfFSJglN+raHyfkj9sn0v3iq5VTSSM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uX2QT-0001qh-Fo;
	Wed, 02 Jul 2025 18:43:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1uX2QR-0001qY-DI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 18:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=seEJWRuIusYWNgR82k0XihKcmi5tWLGETBTXp5wvQpM=; b=fpEr6FU85DrNrBVdjA+vHek8NP
 VFmgnwtI1Pqv03hnRnXPS17JTFkIJ1vZPPBwowXaQa3pIKvw2/7O6CmtUhyh+uhNevmI6di5u/Dgx
 SYRo7TbDELo8ZuI5XvQfw1BsyaO+6IzdxnI7EyTlUtk80i8b45I8SAKay4VGHPkWtjlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=seEJWRuIusYWNgR82k0XihKcmi5tWLGETBTXp5wvQpM=; b=glgvBJ+kGsnAJVVfR4bdKW5NwV
 RxVJZF/kMdbNZDxg+0AfSDrKvheZvELVv66cNrDaERwMcOdvgnyl507mLOI/POOCMp3Bfa0uYg78r
 niPdBhFuqEMu5sg2ct3aDeH3R1P+zkiPzFhAndueMJUcqYxx/y86snODR0M9NZKM5bUY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uX2QR-00035y-0T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 18:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5648E6111F;
 Wed,  2 Jul 2025 18:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BD3C4CEE7;
 Wed,  2 Jul 2025 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751481793;
 bh=vpOtYH6IkCc3Tvi53eKq06iBzA4VwoEL2AhoYmgnNLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mp9QE6jKoqnYehysrCVztxiyxSSHiGRnDH2Qhtx4fs8y0HsxQX6vvecQV5NOGuHd4
 dN2C6Jg3iGlANnZCYd4TlAb9AWyMUFxItiOlq14SkSb91ODq8+5/1l1z2B1I3OgjYW
 F0wVh5fyeadMA5Q1lsag3eS/QqfUasaa5xBk5yWNbHmtJKsxYOJKT2d2dv28g5FNoo
 WZ1cAUj7G/l+tnyaZvpQoZ6hGpnmRaPA9IGCEEQlaIW44anDrsRjt8iNgxeXLUpnQX
 3pwwQRHFlotk675GVhzntEDmVsQcndnhIRwdVp8CN2Kh9DCG3T+y4FCBorxXXeIfML
 gMcEnPfgASDQA==
Date: Wed, 2 Jul 2025 11:43:12 -0700
To: Kundan Kumar <kundanthebest@gmail.com>
Message-ID: <20250702184312.GC9991@frogsfrogsfrogs>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
 <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 25, 2025 at 09:14:51PM +0530, Kundan Kumar wrote:
 > > > > Makes sense. It would be good to test this on a non-SMP machine,
 if > > you can find one ;) > > > > Tested with kernel cmdline wit [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uX2QR-00035y-0T
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ritesh.list@gmail.com, jack@suse.cz, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 hch@lst.de, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, linux-nfs@vger.kernel.org, da.gomez@samsung.com,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, gost.dev@samsung.com, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 25, 2025 at 09:14:51PM +0530, Kundan Kumar wrote:
> >
> > Makes sense.  It would be good to test this on a non-SMP machine, if
> > you can find one ;)
> >
> 
> Tested with kernel cmdline with maxcpus=1. The parallel writeback falls
> back to 1 thread behavior, showing nochange in BW.
> 
>   - On PMEM:
>     Base XFS        : 70.7 MiB/s
>     Parallel Writeback XFS    : 70.5 MiB/s
>     Base EXT4        : 137 MiB/s
>     Parallel Writeback EXT4    : 138 MiB/s
> 
>   - On NVMe:
>     Base XFS        : 45.2 MiB/s
>     Parallel Writeback XFS    : 44.5 MiB/s
>     Base EXT4        : 81.2 MiB/s
>     Parallel Writeback EXT4    : 80.1 MiB/s
> 
> >
> > Please test the performance on spinning disks, and with more filesystems?
> >
> 
> On a spinning disk, random IO bandwidth remains unchanged, while sequential
> IO performance declines. However, setting nr_wb_ctx = 1 via configurable
> writeback(planned in next version) eliminates the decline.
> 
> echo 1 > /sys/class/bdi/8:16/nwritebacks
> 
> We can fetch the device queue's rotational property and allocate BDI with
> nr_wb_ctx = 1 for rotational disks. Hope this is a viable solution for
> spinning disks?

Sounds good to me, spinning rust isn't known for iops.

Though: What about a raid0 of spinning rust?  Do you see the same
declines for sequential IO?

--D

>   - Random IO
>     Base XFS        : 22.6 MiB/s
>     Parallel Writeback XFS    : 22.9 MiB/s
>     Base EXT4        : 22.5 MiB/s
>     Parallel Writeback EXT4    : 20.9 MiB/s
> 
>   - Sequential IO
>     Base XFS        : 156 MiB/s
>     Parallel Writeback XFS    : 133 MiB/s (-14.7%)
>     Base EXT4        : 147 MiB/s
>     Parallel Writeback EXT4    : 124 MiB/s (-15.6%)
> 
> -Kundan
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
