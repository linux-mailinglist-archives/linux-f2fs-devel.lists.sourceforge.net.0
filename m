Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9795C8952D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 11:34:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV9GfO14sy+4eEEQBGJgqvO9NsTwjySm7frcrq297kk=; b=aZwEIWZVJYnsOfyrTA9hsX4x55
	1KMex3v/v+XNXpB3uM+rLcukU/6xGI5Iv4Xgu/6wbxZwZIRTJRXULG2dRPnChBLpJ2e3qztkKdk9i
	qMcc15AMrSHd52IZHa+2vMpIbg2ojUSaOp198wmGF6R+1oB8eKUsztyVlAq+uO8hkeB0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOCqo-0002Ap-45;
	Wed, 26 Nov 2025 10:34:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vOCqm-0002Ah-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9W8RR5MgbRhcY9m7aVnTAI9cwuy2bidR0rGohdFtOc=; b=MdyYoCeb016oWz/SnjxdGQMICK
 46Pa9KxleI28wQ3a37ajIU5l4+J/bYnsBkl5y0nlgGsjiTMGyIWJtL7H1xwdZ1kGtepP8MzajYumb
 bziULQmAuqVsVwnmkZSX2ioKpulf3MJNNxk38f0HoCoUCK22wjj6IKFcYkFZzHQVenV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t9W8RR5MgbRhcY9m7aVnTAI9cwuy2bidR0rGohdFtOc=; b=fUTd7rIj72CghbrwPRXUhApqRT
 e2UTDBe6tqNROEjmjT/kfMFbffILAby3Vy+h/ih3rEOOoBrncSqlAwNe0yPs/GRBy+K1ms/tfx9hh
 FYz7nJmEkDYORP3K1TNkbKNlkOtMWcekS9jjGVt0KyaO0x9bufYy3ffYz6LwDVJ//VPE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOCqm-0005xt-8M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:34:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9137668C7B; Wed, 26 Nov 2025 11:34:08 +0100 (CET)
Date: Wed, 26 Nov 2025 11:34:08 +0100
From: "hch@lst.de" <hch@lst.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Message-ID: <20251126103408.GC26228@lst.de>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-7-ckulkarnilinux@gmail.com>
 <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
 <218f0cd0-61bf-4afa-afb0-a559cd085d4a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <218f0cd0-61bf-4afa-afb0-a559cd085d4a@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 26, 2025 at 08:07:21AM +0000, Chaitanya Kulkarni
 wrote: > The retry for discard bio memory allocation is not desired I think,
 > since it's only a hint to the controller. Yes, it is. The command is defined
 as a hint, but it's required for a lot of workloads to work. It's not just
 a speculative readahead. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vOCqm-0005xt-8M
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
Cc: "cem@kernel.org" <cem@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "song@kernel.org" <song@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "agk@redhat.com" <agk@redhat.com>, "sagi@grimberg.me" <sagi@grimberg.me>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "yukuai@fnnas.com" <yukuai@fnnas.com>,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 26, 2025 at 08:07:21AM +0000, Chaitanya Kulkarni wrote:
> The retry for discard bio memory allocation is not desired I think,
> since it's only a hint to the controller.

Yes, it is.  The command is defined as a hint, but it's required for
a lot of workloads to work.  It's not just a speculative readahead.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
