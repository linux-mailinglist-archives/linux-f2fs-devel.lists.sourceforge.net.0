Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D23ACC78B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 15:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:From:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adpYjQPyYNFFN9Tb233jbcuZM+x7dn7gIfAM0GhECTk=; b=JN7ojzT9wD2+yZtjp35r+A83fn
	PRQYkVjw/8C246AwR3lHFaKi2rnfqNaJGIqr87IGW+3LM9qec8O/fFBJKqROXuhC3Z9CRx1jgvmuW
	q3GZzP4FVzxSkltloSpsDXdwHQQf+KLCSFOtKCelPJl9pglHtOjypllf5wptML6qz9rg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMRXt-0004sK-5f;
	Tue, 03 Jun 2025 13:19:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <anuj20.g@samsung.com>) id 1uMRXq-0004s4-Qm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 13:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lhg+yoxzmSUI95r9m4I7c09Wc8JZvBjC2Fu14XUQZiQ=; b=WYl7+/H7FJETygKxCKIeARDVwc
 7fZujTbwopk5OSkCOBMTiMphOP0sxDmpylKtgISyx5aHK5IZd9sFY4IviYAND7rAwRRVDp0KObTsu
 XhFJ3MlvQlPj2kcwsX7zN2bzAAdJtSD1oj8GDFb2CJmsTuFJRfuOAf59jPqiyUfEfe/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lhg+yoxzmSUI95r9m4I7c09Wc8JZvBjC2Fu14XUQZiQ=; b=KaBasYYLyevnkZDLBxeiflyjU1
 ZwgT5HLHeSlNDkhiQnkXas+VMGbxwa6l/FRSxqAS4NZLb9II2T9JZhguV7VetnxoWswPLx8bbTCcj
 rMz5U5p7fmAoJQJBKCOqDC4zZSruWSqUtmjsVZiXNpWJeNE2ClR2sNuNuKkJq68YpE8o=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMRXo-0001xm-SO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 13:19:10 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250603131900epoutp04541c7894e080ebf70f4ec7562ed66177~FiuOuiy2M3172531725epoutp04E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Jun 2025 13:19:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250603131900epoutp04541c7894e080ebf70f4ec7562ed66177~FiuOuiy2M3172531725epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748956740;
 bh=lhg+yoxzmSUI95r9m4I7c09Wc8JZvBjC2Fu14XUQZiQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=WBSQ6lK9EWDgjnVk2UCtHoWdiBqZlqtb8XsrOvFf6dvZb1mPriE1FWBFdCTIU+Omt
 sfXwfjHouTr1qc88PlriEG7dT8fdI458jv1zxM7KNQWgvhbWmx/vMIisreunoFO5cx
 LXs0VIUkGSuE72lyDrDiyTlCYGseOg1a61E2t5IQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250603131859epcas5p3adb125b08bbc9f901dde4353e77a8e0a~FiuNydMNP1272412724epcas5p3Q;
 Tue,  3 Jun 2025 13:18:59 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.178]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4bBWWQ3Z6rz6B9m9; Tue,  3 Jun
 2025 13:18:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250603091626epcas5p3c6680e3a112b654ee64a2a45ee05c29c~Ffab6u3oY3154931549epcas5p3V;
 Tue,  3 Jun 2025 09:16:26 +0000 (GMT)
Received: from [107.122.10.194] (unknown [107.122.10.194]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250603091621epsmtip1b17ae68149000f4e610433391a5ab9c2~FfaXdde6I1152711527epsmtip1N;
 Tue,  3 Jun 2025 09:16:21 +0000 (GMT)
Message-ID: <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
Date: Tue, 3 Jun 2025 14:46:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Kundan Kumar <kundan.kumar@samsung.com>
Content-Language: en-US
From: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>
In-Reply-To: <20250602141904.GA21996@lst.de>
X-CMS-MailID: 20250603091626epcas5p3c6680e3a112b654ee64a2a45ee05c29c
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113215epcas5p2edd67e7b129621f386be005fdba53378
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
X-Headers-End: 1uMRXo-0001xm-SO
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
Cc: ritesh.list@gmail.com, anuj1072538@gmail.com, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, david@fromorbit.com,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com, dave@stgolabs.net,
 agruenba@redhat.com, miklos@szeredi.hu, gost.dev@samsung.com,
 willy@infradead.org, p.raghav@samsung.com, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk, kundanthebest@gmail.com,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/2/2025 7:49 PM, Christoph Hellwig wrote:
> On Thu, May 29, 2025 at 04:44:51PM +0530, Kundan Kumar wrote:
> Well, the proper thing would be to figure out a good default and not
> just keep things as-is, no?

We observed that some filesystems, such as Btrfs, don't benefit from
this infra due to their distinct writeback architecture. To preserve
current behavior and avoid unintended changes for such filesystems,
we have kept nr_wb_ctx=1 as the default. Filesystems that can take
advantage of parallel writeback (xfs, ext4) can opt-in via a mount
option. Also we wanted to reduce risk during initial integration and
hence kept it as opt-in.

> 
>> IOPS and throughput
>> ===================
>> We see significant improvement in IOPS across several filesystem on both
>> PMEM and NVMe devices.
>>
>> Performance gains:
>>    - On PMEM:
>> 	Base XFS		: 544 MiB/s
>> 	Parallel Writeback XFS	: 1015 MiB/s  (+86%)
>> 	Base EXT4		: 536 MiB/s
>> 	Parallel Writeback EXT4	: 1047 MiB/s  (+95%)
>>
>>    - On NVMe:
>> 	Base XFS		: 651 MiB/s
>> 	Parallel Writeback XFS	: 808 MiB/s  (+24%)
>> 	Base EXT4		: 494 MiB/s
>> 	Parallel Writeback EXT4	: 797 MiB/s  (+61%)
> 
> What worksload was this?

Number of CPUs = 12
System RAM = 16G
For XFS number of AGs = 4
For EXT4 BG count = 28616
Used PMEM of 6G and NVMe SSD of 3.84 TB

fio command line :
fio --directory=/mnt --name=test --bs=4k --iodepth=1024 --rw=randwrite 
--ioengine=io_uring --time_based=1 -runtime=60 --numjobs=12 --size=450M 
--direct=0  --eta-interval=1 --eta-newline=1 --group_reporting

Will measure the write-amp and share.

> 
> How many CPU cores did the system have, how many AGs/BGs did the file
> systems have?   What SSD/Pmem was this?  Did this change the write
> amp as measure by the media writes on the NVMe SSD?
> 
> Also I'd be really curious to see numbers on hard drives.
> 
>> We also see that there is no increase in filesystem fragmentation
>> # of extents:
>>    - On XFS (on PMEM):
>> 	Base XFS		: 1964
>> 	Parallel Writeback XFS	: 1384
>>
>>    - On EXT4 (on PMEM):
>> 	Base EXT4		: 21
>> 	Parallel Writeback EXT4	: 11
> 
> How were the number of extents counts given that they look so wildly
> different?
> 
> 

Issued random write of 1G using fio with fallocate=none and then
measured the number of extents, after a delay of 30 secs :
fio --filename=/mnt/testfile --name=test --bs=4k --iodepth=1024 
--rw=randwrite --ioengine=io_uring  --fallocate=none --numjobs=1 
--size=1G --direct=0 --eta-interval=1 --eta-newline=1 --group_reporting

For xfs used this command:
xfs_io -c "stat" /mnt/testfile

And for ext4 used this:
filefrag /mnt/testfile


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
