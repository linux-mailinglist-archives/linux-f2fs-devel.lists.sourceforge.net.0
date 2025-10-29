Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE98C1860D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 07:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:From:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxs2P61fx28g/rchKqebO/1Ffk2xtl0s64BUfd4ZPTc=; b=ajpyXPMn5DqU6SFyKDdJKM4kAp
	awHMK7fJw2pK1v2xtv1cQVECpakphwjeWba9W7hZBHjER62kETC+YLLDOq/Ztl9MH3rC+aJ8xjE1m
	YIPsBOhhnz7Dvbw0Qxvx2hYVnST3KqP/3i+ovmg70lRokC+/ouQa6ovWBHEmWhieyxSw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDzJs-0003JB-3b;
	Wed, 29 Oct 2025 06:06:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vDzJq-0003Ix-5R
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 06:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bBJQp7PbGMd1XdhUFl5A/6fLfmccB/IWy8yXpsj4CGc=; b=Usa850ploZp2s38na19hkNgvZD
 yYgyY/UU/uviHaa7eSdNX97ZrYGgYo7xl6hhk/cWwnPRCHX7TUCHGVoNJEXQ4rsM0PsdhbdbsUXqT
 Df0kfNqpR85tTeMdnGoO5fI9bU55DVBWvF1heK0L8QXlqbZCsD/lZCofFosLdpDIMNwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bBJQp7PbGMd1XdhUFl5A/6fLfmccB/IWy8yXpsj4CGc=; b=HApTu3vSs53h6bTn/Ye98V8uXc
 0jvXMnaMRLpaWbB30oFJX+aaTm9lqeN+Hj175VmeQ8DBmzD9JquJw5CFV9InTwXt+iQuqeBT0k0TH
 PJhfVydfGji36ioXhEaIp8SiCqcOdaSUsWAEBBqp6PrHPB8td9Hg+LyfIM04kVeLIM+c=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDzJo-0004TL-Sz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 06:06:02 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20251029060548epoutp03ad9b4f527f4cbecaf388c9c2e5445078~y4SPlwiBV2873628736epoutp03b
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 06:05:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20251029060548epoutp03ad9b4f527f4cbecaf388c9c2e5445078~y4SPlwiBV2873628736epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1761717948;
 bh=bBJQp7PbGMd1XdhUFl5A/6fLfmccB/IWy8yXpsj4CGc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=vbuEe17mTF2terd1TQ+gi3mkaNQ+gSv01pyxt704vlOpbeMh20OJKRtvhq38wKJpB
 EhIkFmb17+oJbYcYDLRELStbMI/9A8fc5xYMpoyix3uXeCtTFBV9Z8hbDh4jiRgzsx
 fbXRyG0udW3HlL/1jfZBTSVcOwcrY1cBEG0kndv0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20251029060547epcas5p3b81b402ebdb14361658a0a9d1625f9a1~y4SPBxYRj0475104751epcas5p3j;
 Wed, 29 Oct 2025 06:05:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cxGvG5lFcz3hhT3; Wed, 29 Oct
 2025 06:05:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20251029060545epcas5p491529ef7b75758f4d8bc82f4da1b9976~y4SM_VznG0334003340epcas5p4Y;
 Wed, 29 Oct 2025 06:05:45 +0000 (GMT)
Received: from [107.111.86.57] (unknown [107.111.86.57]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251029060524epsmtip1c2db16f0f541ef4f1bd12a548aa4a54d~y4R5nnv-B1497914979epsmtip18;
 Wed, 29 Oct 2025 06:05:24 +0000 (GMT)
Message-ID: <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
Date: Wed, 29 Oct 2025 11:35:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>
From: Kundan Kumar <kundan.kumar@samsung.com>
In-Reply-To: <20251022043930.GC2371@lst.de>
X-CMS-MailID: 20251029060545epcas5p491529ef7b75758f4d8bc82f4da1b9976
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area> <20251022043930.GC2371@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/22/2025 10:09 AM, Christoph Hellwig wrote: > On Tue,
 Oct 21, 2025 at 09:46:30AM +1100, Dave Chinner wrote: >> Not necessarily.
 The allocator can (and will) select different AGs >> for an inode a [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDzJo-0004TL-Sz
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
 linux-mm@kvack.org, clm@meta.com, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, gost.dev@samsung.com, willy@infradead.org,
 anuj20.g@samsung.com, linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/22/2025 10:09 AM, Christoph Hellwig wrote:
> On Tue, Oct 21, 2025 at 09:46:30AM +1100, Dave Chinner wrote:
>> Not necessarily. The allocator can (and will) select different AGs
>> for an inode as the file grows and the AGs run low on space. Once
>> they select a different AG for an inode, they don't tend to return
>> to the original AG because allocation targets are based on
>> contiguous allocation w.r.t. existing adjacent extents, not the AG
>> the inode is located in.
> 
> Also, as pointed out in the last discussion of this for the RT
> subvolume there is zero relation between the AG the inode is in
> and the data placement.
> 
> 
I evaluated the effect of parallel writeback on realtime inodes and
observed no improvement in IOPS. We can limit writes for realtime
inodes to utilize a single default (0) writeback context. Do you
see it differently?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
