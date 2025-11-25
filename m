Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A84C837DF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 07:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hv7qu/qjsYNJzdoULH/3NyO1my+aS1nQAv6VQNVv7k=; b=CnqI9yJpZxwqihqMg3jFzhzurA
	1RQ4Mf87UyxN8A9BUsPWQjsmqDMAAhP8XP0MQe0lBqCM2iB4yziCtCVUFdhHPEhNBmSHjYmiyy74G
	MuYYMX6I6Ypuzy/ldQei+joO9gbSVgAfAoNJ8BCrK2Qk4y/Yipt7vOzI2xW+QXjjZL9o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNmcx-0003DX-0r;
	Tue, 25 Nov 2025 06:34:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vNmcv-0003DR-1a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 06:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ja/dybNRZjiFc4BwhelBUXC1g5mym/a7FtVQoXLnDWM=; b=Wy7qGKrhJryOXYrpEkjRge6xQG
 HD6aw2fLCOrqFvTeEkZtHl/9Y15UImkiCeYdqPx1mb4mH+/LLSg51kpN50elAab/KCw/7gIgTctv+
 F/gx6lmYwirq58q7XbaMznfiRJyO4irA7h5+irgpRpQzNwLBQLm7FDAI5Yk3590kV4yQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ja/dybNRZjiFc4BwhelBUXC1g5mym/a7FtVQoXLnDWM=; b=BP352w7brFGO3kSfe6Kr++K8JT
 zbhVJhLoat/f4bPAtdxpcTty4DMzRZcs9r/BsCsANHPwDBe0GUYNHpo782eVxKvOBkiLSWCzelqGu
 hskNITg5sVaqAH6RmunLF0NUc6U8gcFpVIE33ZzmsYvkM7uLF4RrSNcZHtNGBKTOZrjI=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNmcu-0008BM-CA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 06:34:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id BA0A868B05; Tue, 25 Nov 2025 07:33:58 +0100 (CET)
Date: Tue, 25 Nov 2025 07:33:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20251125063358.GA14801@lst.de>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
 <9c8a6b5f-74c8-4e9f-ae46-24e1df5fe4e0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c8a6b5f-74c8-4e9f-ae46-24e1df5fe4e0@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 25, 2025 at 09:10:00AM +0800, Chao Yu wrote: >
 Reviewed-by: Chao Yu <chao@kernel.org> Sending these all as a series might
 be confusing - it would be good if the individual patches get picked through
 the subsystem trees so that the function signature can be cleaned up after
 -rc1. Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vNmcu-0008BM-CA
Subject: Re: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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
 kch@nvidia.com, snitzer@kernel.org, linux-raid@vger.kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, yukuai@fnnas.com, axboe@kernel.dk,
 linux-block@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 25, 2025 at 09:10:00AM +0800, Chao Yu wrote:
> Reviewed-by: Chao Yu <chao@kernel.org>

Sending these all as a series might be confusing - it would be good
if the individual patches get picked through the subsystem trees
so that the function signature can be cleaned up after -rc1.

Can we get this queued up in the f2fs tree?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
