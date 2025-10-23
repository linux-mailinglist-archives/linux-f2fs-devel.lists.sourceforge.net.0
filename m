Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B93C00D1D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Oct 2025 13:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:From:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFruS8oBE5mH6LYvzuVLCEOBYK8oy+g1K7iGCEzU5a8=; b=IjZdpwsVknCKyMTt16zFQsHn/u
	GAr7cOkkW5vwaYmaU7zk3ER/QYlzhx28z2XckZqfh4BUqbvXko/uohSTBukSOKF51j78LPl6NVt5Y
	7Kxv5ZdSAy0TlXeObl4xLBS9h/O8WoimyuR/c5YexYCy+IWpr16V0OXfqQol2rncnXAA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBthc-0004Kz-UX;
	Thu, 23 Oct 2025 11:41:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vBthZ-0004Kr-29
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Oct 2025 11:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+oN6QIkhg+yxG+jofXiwToGHW0SdPwLgjc3KiwgdQg=; b=akskxZ43JGnubEGzZtwU0vOFWK
 2P3wUMHO8hntj4LwHJeTyT/tXvorDugfubgzcQ1AQ17oIIt+ZBoW2gA32rCb6TywWT81Cvxz2k8xj
 +FS2n/n8C4Xi3AYovst8NBaespMNbdrGeds6KzwMBwqj/FfjQ6OFld7HE43jHm26GtTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N+oN6QIkhg+yxG+jofXiwToGHW0SdPwLgjc3KiwgdQg=; b=X/b2fWZbRkJ9/kWLClqu1+6ot7
 4ujNRBIIJ2RAXV3THoIWJP24OBSgbDQyL3XZLmv9KrvgkI6I/Q89ud16KIqDkmmAWdiumt/4/NZqW
 w7hcOJmc7+PAsEqqSgZt6sz98DSzNKUxzsPPMFVdU1y8CWc8besAOqX2waa+22TIhPyg=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vBthY-00064p-LX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Oct 2025 11:41:53 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20251023114145epoutp02f7070d1d0d9aeebf79ccdbe9d113abdf~xG-2iDWNS1530715307epoutp02Q
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Oct 2025 11:41:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20251023114145epoutp02f7070d1d0d9aeebf79ccdbe9d113abdf~xG-2iDWNS1530715307epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1761219705;
 bh=N+oN6QIkhg+yxG+jofXiwToGHW0SdPwLgjc3KiwgdQg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=CQZ66iSYqNmHIJkk+0ZfYZ6mI08ULjkdlQ2Gb9uroSSh4A/ksYaZoznFo38EuldpN
 Pmev3HPm6H3BdGroe6RJS8mWtP3FGeyhi9EH8wCaMFqggcHAjUosc196egoDvoXfOW
 1d/8tMTtEuQQIK5VON5bdvQ9G1SER5CLfXjMrlvI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20251023114144epcas5p4915a81068b8c2110682c4ce6ea36272e~xG-157QXg0607706077epcas5p41;
 Thu, 23 Oct 2025 11:41:44 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cskdg5VR5z2SSKZ; Thu, 23 Oct
 2025 11:41:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20251023114142epcas5p10a1abeff9e1326fc9c846001906c9986~xG-0B0nat0254002540epcas5p1U;
 Thu, 23 Oct 2025 11:41:42 +0000 (GMT)
Received: from [107.111.86.57] (unknown [107.111.86.57]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251023114136epsmtip1a3b96a88ae62950abac3f8a8a7dd3abc~xG-uRBGdX1343713437epsmtip1Q;
 Thu, 23 Oct 2025 11:41:36 +0000 (GMT)
Message-ID: <81330754-1aee-4807-a982-1fed37c016af@samsung.com>
Date: Thu, 23 Oct 2025 17:11:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jan Kara <jack@suse.cz>
From: Kundan Kumar <kundan.kumar@samsung.com>
In-Reply-To: <bfpv6jrjo4avzk76ex77dwpzaejglu5gsf2pqpmmgwrmqdkkk3@imsbtnrcelee>
X-CMS-MailID: 20251023114142epcas5p10a1abeff9e1326fc9c846001906c9986
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area>
 <6fe26b74-beb9-4a6a-93af-86edcbde7b68@samsung.com>
 <bfpv6jrjo4avzk76ex77dwpzaejglu5gsf2pqpmmgwrmqdkkk3@imsbtnrcelee>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/21/2025 5:41 PM,
 Jan Kara wrote: > On Tue 21-10-25 16:06:22, 
 Kundan Kumar wrote: >> Previous results of fragmentation were taken with
 randwrite. I took >> fresh data for sequential IO and here a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vBthY-00064p-LX
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
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, djwong@kernel.org,
 amir73il@gmail.com, Dave Chinner <david@fromorbit.com>, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, hch@lst.de, dave@stgolabs.net,
 agruenba@redhat.com, miklos@szeredi.hu, gost.dev@samsung.com,
 willy@infradead.org, anuj20.g@samsung.com, linux-nfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/21/2025 5:41 PM, Jan Kara wrote:
> On Tue 21-10-25 16:06:22, Kundan Kumar wrote:
>> Previous results of fragmentation were taken with randwrite. I took
>> fresh data for sequential IO and here are the results.
>> number of extents reduces a lot for seq IO:
>>     A) Workload 6 files each 1G in single directory(AG)   - numjobs = 1
>>           Base XFS                : 1
>>           Parallel Writeback XFS  : 1
>>
>>     B) Workload 12 files each of 1G to 12 directories(AGs)- numjobs = 12
>>           Base XFS                : 4
>>           Parallel Writeback XFS  : 3
>>
>>     C) Workload 6 files each of 20G to 6 directories(AGs) - numjobs = 6
>>           Base XFS                : 4
>>           Parallel Writeback XFS  : 4
> 
> Thanks for sharing details! I'm curious: how big differences in throughput
> did you see between normal and parallel writeback with sequential writes?
> 
> 								Honza

Thank you for the review, Jan.

I found that the IOPS for sequential writes on NVMe SSD were similar
for both normal and parallel writeback. This is because the normal
writeback already maxes out the device's capacity. To observe the
impact of parallel writeback on IOPS with sequential writes, I
conducted additional tests using a PMEM device. The results, including
IOPS and fragmentation data, are as follows:

A) Workload 6 files each 1G in single directory(AG)      - numjobs = 1
     Base XFS           : num extents : 1 : 6606 MiB/s
     Parallel writeback : num extents : 1 : 6729 MiB/s - No change

B) Workload 12 directories(AGs) each with 12 files of 1G - numjobs = 12
     Base XFS           : num extents : 4 : 4486 MiB/s
     Parallel writeback : num extents : 5 : 12.9 GiB/s - +187%

C) Workload 6 directories(AGs) each with one 20G file    - numjobs = 6
     Base XFS           : num extents : 7 : 3518 MiB/s
     Parallel writeback : num extents : 6 : 6448 MiB/s - +83%

Number of CPUs = 128
System RAM = 128G
PMEM device size = 170G


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
