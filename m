Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E9ECA9AB5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Dec 2025 01:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BWYazK3fXlGYUepZeAoXELYBxWsxwvoEjsv4p3anMM=; b=AAnSrsnTMutFOyN6t2X1XEkpMu
	fs1xoULmOtcZadAlY6N0+xt1DK1VrdqOmXCw7ZIdPLhqYedIJo/7ticbJiyEEPJ55SGE84ZoLMJ32
	BT2m+LpBxfd83fPfxt7MLG5ykOuCMXiiuG3lYFlv0v4cva9G78WJtPJXzg9kdo6Ex5Y4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRfjm-0003yo-1U;
	Sat, 06 Dec 2025 00:01:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vRfji-0003yf-Ew
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Dec 2025 00:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ur2Zm0oLnVan60eiWMLaRoqQQ8zrdffC+Nx2k6WvR2g=; b=Q/+vOWcXbxfqGSXVF/z6yztVoZ
 R9S6jlIxYCqHHJyjs1bxBG2QnmS/iYJokIT5fBhBjdmlAEj/ip+W+FpJLYfskUgzFKIk15PI65AKr
 a6fwW9u/bD1ANnC/y+3nDbF/15Wv1mcyXIJYf7Ge3QfqAS/lZ2A3yr7BgyZLz/VtyDq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ur2Zm0oLnVan60eiWMLaRoqQQ8zrdffC+Nx2k6WvR2g=; b=i9HoVGOI7ojNt/UzATGpIOLVTD
 In8ayOkVE3uD38Qh3Isjb9Fyj8/55J64Fq88e1tzZ+o+aKQgEexSMWxMTMtgcUq94r12nVAqFG6xx
 3IycrngroDH7e+ccg6YrtOYzDB7kuAt51ImXDS6UTRwhBOrHWzXTFBjuCbTT5i8L6e0A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vRfjh-0003W9-Te for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Dec 2025 00:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CE9943B6E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  6 Dec 2025 00:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D20C4CEF1;
 Sat,  6 Dec 2025 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764979272;
 bh=+lN5wIwhDaDg72YXfRpNBVd+nbvyZo6XT1Ms4UmxTZk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=WH3qo2grGzGNdZQpazdi/fiZ18tg3i97518c9uOJQbKqFgwe9GRpDMo0ibjAAZxR+
 4z02JwmlXiqUjgwCyOVlQPepLi9wWd3Rt/D1ZpMTNxmWeYeYNEnAtLQC7vcYt59qzZ
 dby3iDf1kAHIxXrz9uu1SR9ALqWYxnYy94jRHnLpa6YcdHQfOxqEs975yQoXOl+xGv
 dI/XU4t6Yg2tkCRRE7isJ9BQrB/QX14Fx8BfFBIo01pDZIXeHstEQQkjiMVTh5YgNE
 hGjYoMwXWdP7HSLvbq3FaJ7fubiwz1DQXPndEPro8P4W8RmQnkPFz0bmW/P+vk7rJH
 WfxEmGTzMvJdA==
Message-ID: <aaee103e-c511-40a3-868f-6139df6e9c92@kernel.org>
Date: Fri, 5 Dec 2025 16:01:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <20251203193147.3320893-1-chao@kernel.org>
 <20251204215941.GF89454@frogsfrogsfrogs>
Content-Language: en-US
In-Reply-To: <20251204215941.GF89454@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/5 05:59, Darrick J. Wong wrote: > On Thu, Dec 04, 
 2025 at 03:31:47AM +0800,
 Chao Yu wrote: >> generic/233 3s ... - output mismatch
 (see /share/git/fstests/results//generic/233.out.bad) >> - [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vRfjh-0003W9-Te
Subject: Re: [f2fs-dev] [PATCH] common/quota: fix to wait for all inodes
 been evicted in _check_quota_usage()
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/5 05:59, Darrick J. Wong wrote:
> On Thu, Dec 04, 2025 at 03:31:47AM +0800, Chao Yu wrote:
>> generic/233  3s ... - output mismatch (see /share/git/fstests/results//generic/233.out.bad)
>>      --- tests/generic/233.out   2025-01-12 21:57:40.259440359 +0800
>>      +++ /share/git/fstests/results//generic/233.out.bad 2025-12-04 03:02:26.000000000 +0800
>>      @@ -4,4 +4,12 @@
>>
>>       seed = S
>>       Comparing user usage
>>      +4c4
>>      +< #1000     --   31476   32000   32000            994  1000  1000
>>      +---
>>      +> #1000     --   31476   32000   32000            944  1000  1000
>>      ...
>>      (Run 'diff -u /share/git/fstests/tests/generic/233.out /share/git/fstests/results//generic/233.out.bad'  to see the entire diff)
>> Ran: generic/233
>> Failures: generic/233
>> Failed 1 of 1 tests
>>
>> Sometimes, generic/233 will fail due to it founds inode count is mismatched
>> in between in-memory one and on-disk one.
>>
>> The reason is cgroup v2 implementation requires to increase inode reference,
>> and then attach it to thread related cgroup writeback structure, once it
>> needs to switch once write owner changes of target inode, a kernel thread
>> will process it and then release inode reference via evict_inode().
>>
>> So, sync & drop_cache may not guarantee all inodes being evicted, as cgroup
>> has one more refernece on inodes during the time.
>>
>> If inode has not been evicted, dquot inode reference will not be release, it
>> will lead to inode quota mismatch.
>>
>> Let's add a delay to wait for cgroup switching completion before quota check.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   common/quota | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/common/quota b/common/quota
>> index a51386b1..de7e84e8 100644
>> --- a/common/quota
>> +++ b/common/quota
>> @@ -333,6 +333,9 @@ _check_quota_usage()
>>   	# XXX: really need an ioctl instead of this big hammer
>>   	echo 3 > /proc/sys/vm/drop_caches
>>   
>> +	# wait for inode_switch_wbs_wor_fn() to release inodes
>> +	sleep 3
> 
> Odd -- I've never seen this problem crop up on ext4 or XFS.  What's
> different about f2fs such that writeback is still in progress?
> 
> Oh, XFS cycles the mount and ext4 does ... quotaoff???

f2fs does quotaoff like ext4 as well, but the difference ext4_quota_off() will call
sync_filesystem() before turning off quota, f2fs doesn't, not sure this is the key
to wait/speedup inode_switch_wbs_wor_fn() or not.

 > > Perhaps the sleep 3 thing should only be done for f2fs?

Yes, I think so, let me revise the patch.

> Or do you see it on other filesystems as well?

I tested ext4, it doesn't fail.

Thanks,

> 
> --D
> 
>> +
>>   	VFS_QUOTA=0
>>   	case $FSTYP in
>>   	ext2|ext3|ext4|f2fs|gfs2|bcachefs)
>> -- 
>> 2.49.0
>>
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
