Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE855BF9F67
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Oct 2025 06:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipwpUt35ldyDUGCz97Atp/nDl55j45OA9xHXHLHRnlQ=; b=i2lfv1XE10Ue0dCTWy6rhHyOhP
	GwRua8flxbbqjR0sbmNVsEN62ZUjly39hxD8DsJ/QpsvOOEIv6rasHu6QNlWVZZntP6r4weXLbJW1
	fGGr1r/Mgvb27i4rUM5O9SKa8uWy/Vpj0s777v9afDeoh/8ozs6Tz6etS9Lue4U5p43A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBQdZ-0004ef-Fq;
	Wed, 22 Oct 2025 04:39:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vBQdX-0004eW-A0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 04:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qatNIJci3WKhQ+0+JT0//JgJlcNnKbGMZhbGMbS1LLU=; b=P9QEnFvz86odGTI4l+1p9Yg0XW
 bd0A2wSTDxWhMJOp2HIo2WN8kFNrWF5T8cBRXxYc0I61FNR1Mcmlef0U6u6hcd18kbhlzOI31fEjU
 IMuzda1P+P2V/si5CYNtiyZTN3yvFj8Hus1ItBL+cNvMMJmVwUXpEt3YTpRTAnPtdFJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qatNIJci3WKhQ+0+JT0//JgJlcNnKbGMZhbGMbS1LLU=; b=ToLpUN3NB12PIbotjT0mdBGY+V
 cVYmEnyS/OeRCtIjEcDHPENs9sdYt6rN5StCbChKm3VGj1PSvjZE2hoqU4n/Ba3zIgJD/Sr9oOsJx
 3XDrPmseeaqChJ9n3KnbnWqm+9hpxaPcixZIY3iB/6F5y7Qt3uD/r7sfBvVB8DyWV7HA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vBQdW-0002Nz-LK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Oct 2025 04:39:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 79DC1227A88; Wed, 22 Oct 2025 06:39:30 +0200 (CEST)
Date: Wed, 22 Oct 2025 06:39:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20251022043930.GC2371@lst.de>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPa7xozr7YbZX0W4@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 21, 2025 at 09:46:30AM +1100, Dave Chinner wrote:
 > Not necessarily. The allocator can (and will) select different AGs > for
 an inode as the file grows and the AGs run low on space. Once > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vBQdW-0002Nz-LK
Subject: Re: [f2fs-dev] [PATCH v2 00/16] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, hch@lst.de, dave@stgolabs.net,
 agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 anuj20.g@samsung.com, linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 21, 2025 at 09:46:30AM +1100, Dave Chinner wrote:
> Not necessarily. The allocator can (and will) select different AGs
> for an inode as the file grows and the AGs run low on space. Once
> they select a different AG for an inode, they don't tend to return
> to the original AG because allocation targets are based on
> contiguous allocation w.r.t. existing adjacent extents, not the AG
> the inode is located in.

Also, as pointed out in the last discussion of this for the RT
subvolume there is zero relation between the AG the inode is in
and the data placement.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
