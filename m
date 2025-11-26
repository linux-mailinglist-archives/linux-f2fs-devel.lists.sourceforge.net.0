Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DEC89563
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 11:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sN2ZRhcswcDOYTV56zjp4yJsbqOF2ROA+9KFuN+2+Ws=; b=fQeNoA9mM6uKzrJbEHQ1Y90b5j
	KPTYKibRq2mzs1E/YwUQGR0gQPzT+p0X1lWkYtrr+aVa+rn0uawmPLGNOLcIyesXmzRSvpB1Md9Lk
	76XAVrFoSMU4b//k2+U/ye2X87Cvy0hxcEPw0Ev859yD5z1ohaq9wxkB9kTR6325CUpQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOCtj-0002L3-3u;
	Wed, 26 Nov 2025 10:37:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vOCta-0002KP-Ft
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0bolAWAt1+CIoTAqV5rZAyXvVcZR5qoX5he4qL0mCh8=; b=gBWoT2hTO68Q24i2TVhiNB1goo
 wjhZ7rakhSYyIlWqPL9V8LmW6rrwYCpW5xleBWrfXsTymenPo6PXJQ2X3CEPndU4GOMyFdm+MXXS1
 Tjuf0e2k2dWmP0IGYzJjbO1oDWfeqoiq2jJsdXQrR25BwF5gO5uz27ynKPWwAZBSO7cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0bolAWAt1+CIoTAqV5rZAyXvVcZR5qoX5he4qL0mCh8=; b=h9loY0KHfkJpJh8bkEDy1QVk6K
 +1Sh0HQQQpN2Mr5A2X3zVIRndPp8bvgk2I+CTL5O3zzO5slZDOaL0uBJT7MpI9PyALo7JjzgOAxy0
 M1Cc0uiz8xZcvTKHEBF0kdZI5/DFk2WoUrzvJdJK24CGuRuYgJR9LznbXa8R8k9SGu7E=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOCta-0006Bb-1C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:37:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E56676732A; Wed, 26 Nov 2025 11:37:00 +0100 (CET)
Date: Wed, 26 Nov 2025 11:37:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
Message-ID: <20251126103700.GA28056@lst.de>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-5-ckulkarnilinux@gmail.com>
 <e40cb47c-9f92-4982-bf3f-45ec9f2a1681@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e40cb47c-9f92-4982-bf3f-45ec9f2a1681@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 26, 2025 at 06:14:32PM +0800,
 Yongpeng Yang wrote:
 > We also need to check for memory allocation errors in >
 __blkdev_issue_discard().
 No, we still don't. What is so hard to grasp about mempool allocations even
 after repeated explanations? 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vOCta-0006Bb-1C
Subject: Re: [f2fs-dev] [PATCH V3 4/6] nvmet: ignore discard return value
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
 agk@redhat.com, sagi@grimberg.me,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, dm-devel@lists.linux.dev,
 kch@nvidia.com, snitzer@kernel.org, linux-block@vger.kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, yukuai@fnnas.com, axboe@kernel.dk,
 linux-raid@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 26, 2025 at 06:14:32PM +0800, Yongpeng Yang wrote:
> We also need to check for memory allocation errors in
> __blkdev_issue_discard().

No, we still don't.  What is so hard to grasp about mempool allocations
even after repeated explanations?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
