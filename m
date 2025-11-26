Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF10C8950F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 11:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ2uVkMoP/XEIm4qFwMrhqpU7chgRko/7OzBp7WlK00=; b=McuiUqy5BHrlfyy4B7eGBHcglM
	DdoF6kyw2LcBof2feWmUC+MdV7j7EDuLXnf74+bnsVIEJnREZ5ms+yMHxw2gN8GFVcaZW+fS6eGkx
	BONuedSc+FvHTtGAFDyNzcl5im08veR8t7ExkjDpxzkHUKMGDIzbhassz8bQhs69JfYs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOCq8-0000Xs-3b;
	Wed, 26 Nov 2025 10:33:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vOCq7-0000Xm-0x
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+7Z5fB60os7q6kICOUWfVrojZn8uG6QfVCWYuFSkjtA=; b=PCi1oF4SOxbttpOoQSw3HFsRBL
 biDak7dYEJDDx/qWnL82Y7PUGGVsd1gaqJClF/b4uXchzYv6m1UJeEl0+ErtqqGDn7YrHIfKGdCGI
 x/RnYmXMxTYQlWon+lbjN3qMHx3jXU2EoST5yuhOwV1wXuO+BGO/Dz91pSIDK79m6utU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+7Z5fB60os7q6kICOUWfVrojZn8uG6QfVCWYuFSkjtA=; b=GowzQDqRuOTQQCWMFO4U9EIGlk
 tm2ZPrAlOFxfcyIR9S8vMrGFAq3wjasZ2vzTUB3CgAaWETz8TOYK2lZYPYe6eqeXjSyZU2Xn/+90s
 N8v3s1i/Ee+ajSJofahNNmKa435mFz5epgemhe6gd7sDta1f2NxrJsqxsALSom3FJO98=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOCq6-0005vP-6Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:33:34 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3FC8868CFE; Wed, 26 Nov 2025 11:33:24 +0100 (CET)
Date: Wed, 26 Nov 2025 11:33:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
Message-ID: <20251126103323.GB26228@lst.de>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-7-ckulkarnilinux@gmail.com>
 <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 26, 2025 at 10:37:10AM +0800,
 Yongpeng Yang wrote:
 >> xfs_gbno_to_daddr(xg, busyp->bno), >> XFS_FSB_TO_BB(mp, busyp->length),
 >> GFP_KERNEL, &bio); > > If blk_alloc_discard_bio() fails to [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vOCq6-0005vP-6Z
Subject: Re: [f2fs-dev] [PATCH V3 6/6] xfs: ignore discard return value
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
Cc: cem@kernel.org, linux-nvme@lists.infradead.org, song@kernel.org, hch@lst.de,
 agk@redhat.com, sagi@grimberg.me, Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, dm-devel@lists.linux.dev,
 kch@nvidia.com, snitzer@kernel.org, linux-block@vger.kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, yukuai@fnnas.com, axboe@kernel.dk,
 linux-raid@vger.kernel.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 26, 2025 at 10:37:10AM +0800, Yongpeng Yang wrote:
>>   				xfs_gbno_to_daddr(xg, busyp->bno),
>>   				XFS_FSB_TO_BB(mp, busyp->length),
>>   				GFP_KERNEL, &bio);
>
> If blk_alloc_discard_bio() fails to allocate a bio inside
> __blkdev_issue_discard(),

It won't, because mempool allocations will not fail if they can
sleep as they can here.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
