Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A94C4B8F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 06:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:From:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKaOXbgfkvzyWlBX9hNz8qhlWPVPGCrndtJwS3hTUIU=; b=XByw991N7Xtb87FRhbXkJKIuar
	dHt/DNwWzQtjn05ZaaIXqZLF+FnMa9eR6a9CIC4Zd/q7kOhi4/CegWr0DrEMS2/zsD/JT782bqz/e
	Pvtfk4chXUhVJqkHSbop0+ASRMdkRU7sNcUuTqv1famQTogVvHFx3m2uc87Srnfz56nY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIh8a-0001dS-Cx;
	Tue, 11 Nov 2025 05:41:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vIh8X-0001dJ-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 05:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ef0RDZCWoK3lvtiD9fAfX9+MmhcguTfmbAAtnNupmPs=; b=AGAkzQoKnb9L6DpzJ9Bv8RTgit
 NI8XdFgzKvTmH7ifzfw+bXoikRLc6XIsTkQhbf3OUlj44YbyQvfaRIPrwkD74oY5eziZIQoZS7QAn
 p5/Eww/IoWp42pmB1pc5W2WEJcb6CKna0Woi/KJpi8JSVocikpHS/0S+iBhD3hnHNpdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ef0RDZCWoK3lvtiD9fAfX9+MmhcguTfmbAAtnNupmPs=; b=IHI5xvAOUrcQKNEw7MN7eSszxc
 Nfowb3aRVlJ2QDNC2utn3OkSsbjk4R1DO8NgaReEdlM7mW1PQI9SE/4/wD8mFu8Yo7DA0P03I8VIm
 NJB8xiwIr9VoR1dTfGuQrC/v8WWDLUU8C4fP1OJW+PFZKAftrU+g9uJ28sc2viFoqLbw=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIh8W-0006FA-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 05:41:49 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20251111054136epoutp037cf7d085b1f49a143303f4fc4134cfa8~23V04DnFg1573615736epoutp03X
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 05:41:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20251111054136epoutp037cf7d085b1f49a143303f4fc4134cfa8~23V04DnFg1573615736epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762839696;
 bh=ef0RDZCWoK3lvtiD9fAfX9+MmhcguTfmbAAtnNupmPs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=dzkz4SMGWoa+X2wPgIyjI16jRtOo/FcrxblhLH/gDESsRNTwlNoEdxA6USFbcFcuv
 O7w2sr+2TQuqXN9wpmZU2LIIGrFGxiAFBmtio9TgGknllbajhUARdXSkOozHkgSx8f
 ml85fpLcWwsJujGvI6FWUL/Z9iw7tdZuksYYUMGM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20251111054135epcas5p1d15ca46bbaf565fb7c66295f670d762c~23V0NCthE3166631666epcas5p1V;
 Tue, 11 Nov 2025 05:41:35 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4d5FlL51stz3hhTJ; Tue, 11 Nov
 2025 05:41:34 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20251111054133epcas5p20b40bd8e7a3f97b9291d974346022f8b~23VybX4aU0629806298epcas5p24;
 Tue, 11 Nov 2025 05:41:33 +0000 (GMT)
Received: from [107.111.86.57] (unknown [107.111.86.57]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251111054129epsmtip241c0542d0446455b092d644d9c07434f~23VukFjr81175011750epsmtip2P;
 Tue, 11 Nov 2025 05:41:29 +0000 (GMT)
Message-ID: <38aa0903-24e6-4c9c-987c-86f6e7634f87@samsung.com>
Date: Tue, 11 Nov 2025 11:11:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
From: Kundan Kumar <kundan.kumar@samsung.com>
In-Reply-To: <20251107133742.GA5596@lst.de>
X-CMS-MailID: 20251111054133epcas5p20b40bd8e7a3f97b9291d974346022f8b
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area> <20251022043930.GC2371@lst.de>
 <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
 <20251029060932.GS4015566@frogsfrogsfrogs> <20251029085526.GA32407@lst.de>
 <91367b76-e48b-46b4-b10b-43dfdd8472fa@samsung.com>
 <20251107133742.GA5596@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/7/2025 7:07 PM, Christoph Hellwig wrote: > On Fri, Nov
 07, 2025 at 02:54:42PM +0530, Kundan Kumar wrote: >> Predicting the Allocation
 Group (AG) for aged filesystems and passing >> this informat [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIh8W-0006FA-P4
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
 "Darrick J. Wong" <djwong@kernel.org>, amir73il@gmail.com,
 Dave Chinner <david@fromorbit.com>, gfs2@lists.linux.dev, linux-mm@kvack.org,
 clm@meta.com, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, anuj20.g@samsung.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/7/2025 7:07 PM, Christoph Hellwig wrote:
> On Fri, Nov 07, 2025 at 02:54:42PM +0530, Kundan Kumar wrote:
>> Predicting the Allocation Group (AG) for aged filesystems and passing
>> this information to per-AG writeback threads appears to be a complex
>> task.
> 
> Yes.  But in the end aged file systems are what will see most usage.
> Fresh file systems look nice in benchmarks, but they aren't what
> users will mostly deal with.
> 
>> To segregate these I/O requests by AG, it is necessary to associate
>> AG-specific information with the pages/folios in the page cache. Two
>> possible approaches are:
>> (1) storing AG information in the folio->private field, or
>> (2) introducing new markers in the xarray to track AG-specific data.
>>
>> The AG-affined writeback thread processes specific pages from the page
>> cache marked for its AG. Is this a viable approach, or are there
>> alternative solutions that could be more effective?
> 
> Or maybe the per-AG scheme isn't that great after all and we just
> need some other simple sharding scheme?  Of course lock contention
> will be nicer on a per-AG basis, but as you found out actually
> mapping high-level writeback to AGs is pretty hard.
> 
> 
Thank you for your insightful comments, Christoph. I'm considering using
folio private to incorporate IOMAP type and predicted AG information.
The prediction for DELALLOC, using pagf_freeblks etc., and for UNWRITTEN
and MAPPED, using the actual location of allocated blocks.

Subsequently, schedule all writeback threads for the inode. With all the
necessary information, these threads will be able to filter AG-specific
folios and focus on those marked for the corresponding AG. Although this
approach may seem complex, it should effectively address various use
cases, including aged filesystems, filesystem fragmentation, and locking
concerns.

We tried CPU and inode based sharding, CPU based sharding increases
filesystem fragmentation, and inode based sharding results in AG lock
contention. We adopted AG-based sharding to resolve these issues.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
