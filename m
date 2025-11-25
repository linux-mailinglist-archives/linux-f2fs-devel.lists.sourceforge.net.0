Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DFC83A47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 08:12:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik4F/NGdAttTv/dVz2nNiKhSIg4AHwDmgZi4wuadcY4=; b=cw0YW2BBeSSalwpM/oGJTsNrMa
	8w+l74wkD3ZEVqIIpVk8CNHPlrNxYK3mluRSQygyBdJwLQE3rfuGfgvY9mPhkvy+AC3O+1VNIyozr
	F1unyIvS9KpEbSMouUEGs0T3VpdvvR0J6hBW4WzXTUgWMuRRASQ3ehn3vvJAwFtKnx4g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNnDb-0004cY-IZ;
	Tue, 25 Nov 2025 07:12:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vNnDa-0004cI-9w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 07:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WxdTAcDi8BFNwUdUY79Wn3lg/8EsLPR9j3YzOfVB9nE=; b=fZmwNfz8aPO3boYgt3hiWbOMI1
 AYwSSX9mDgC4b3KXksgms0JaOaiVLivtkvdcHqo89P1te1h/wdliCte9ngJhK1MwvEM//gWUb2j/N
 jy8d9ooFYLr16P5l9auUJQLNiJUhCzO9/IzHF4VGMnjvJLkkdXZoyBCQ7j1F8rxcv5EM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WxdTAcDi8BFNwUdUY79Wn3lg/8EsLPR9j3YzOfVB9nE=; b=TWL07eBI2Yrff3eLSLMgeiJ55O
 5nfr4xEfBb57qPmjPSkHYQ4XD7vkyON01p7SfhIATsTCKMm/m9iIe8sGvj1X5Q9xYV6GtyPB0gpQ4
 Y0ZjeKjmgsPOCq0Q51OxYCPvKurAMvzLFYMQL/v9LmzCf7BwTikGs8eqBPPCGcv1ZZis=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNnDa-00022L-7q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 07:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C77360195;
 Tue, 25 Nov 2025 07:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CDCC4CEF1;
 Tue, 25 Nov 2025 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764054715;
 bh=xflNeMqf7k1tQ8p2f9Vf/KT0VAo9WTDVCCFoPk6I900=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vRW5r56jcgqXMxVPd0wuo6Asj/WFwwlD1sbbJn+TM5uvyv+LFWmulSpnq8gsEcoDB
 9xM6Mo7+lurS8TbEynkUIWlNAssF1pYUcO0AklxAJ+AAiZl5seSlhrDuq68Kq/O2cn
 cHh+bXZftIVMPHCe7c9IY57WuTMskj05VfhK5sKqpFNxgsSia9lA6h97quJQs3MzpF
 T7eu7PHpjPa3mU7joudmxeoqPhsF+fvS6NPNj3DVzheWD1k8VSZpn7yTtlVBZCuOvs
 aF8wrighi/0KfXj8IFm/XZmSEbiYeHktZXuy5rGJEVPsAvPHwmWoCB41m7uEAJI68x
 uy5QFKvIGSBwQ==
Message-ID: <8e98a473-7991-43ae-a758-8ad324bb9393@kernel.org>
Date: Tue, 25 Nov 2025 15:11:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, jaegeuk@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
 <9c8a6b5f-74c8-4e9f-ae46-24e1df5fe4e0@kernel.org>
 <20251125063358.GA14801@lst.de>
Content-Language: en-US
In-Reply-To: <20251125063358.GA14801@lst.de>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/2025 2:33 PM, Christoph Hellwig wrote: > On Tue,
 Nov 25, 2025 at 09:10:00AM +0800,
 Chao Yu wrote: >> Reviewed-by: Chao Yu <chao@kernel.org>
 > > Sending these all as a series might be confusin [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNnDa-00022L-7q
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev, kch@nvidia.com, sagi@grimberg.me,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, cem@kernel.org,
 snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, song@kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, mpatocka@redhat.com,
 linux-raid@vger.kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com,
 linux-xfs@vger.kernel.org, agk@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/2025 2:33 PM, Christoph Hellwig wrote:
> On Tue, Nov 25, 2025 at 09:10:00AM +0800, Chao Yu wrote:
>> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Sending these all as a series might be confusing - it would be good
> if the individual patches get picked through the subsystem trees
> so that the function signature can be cleaned up after -rc1.
> 
> Can we get this queued up in the f2fs tree?

Yes, I think it's clean to queue this patch into f2fs tree.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
