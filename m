Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8991DB1AC89
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 04:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyjPvRlqfa7OcbndsIhxFmgOCSsgH5qQywiuqxhQZTA=; b=Opqxw3CrYbpXd3gY1azj+4CP+i
	n5rN6zbfLEEtUVhNnxwBlG99YroGVnmDPHGkD4dq6dK5bn3Ds1QNBLH/2mNCsf7Bl6rdoZxDFXft/
	4zuo83Y0wff3FLewgOqhE1XICPfAvi/Qmpb+I7vdpqkjtOkaAt5DRMi7carA92qaYNo0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uj7mX-0005sR-2a;
	Tue, 05 Aug 2025 02:52:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uj7mV-0005sL-PR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 02:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S9v3PsqmmpNP2wVerjYfT+hczWsT+CmB3AZhMOQy8eI=; b=deg2L2L0vStG1vQU7UxGzOCUBx
 lXWGi8isRvSQWpKXXMtEgOYIJSgzQgfSLpeGfn4qplFVdfSMyU8sOMqepJT/uhEd+6EgFps/lLdga
 qYOV/DZXwfOwRq8/22QYtVGNe7hFUFYxinTuR9mpFPLYXHAlm8XKBV/FWhv3ay6xdNR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S9v3PsqmmpNP2wVerjYfT+hczWsT+CmB3AZhMOQy8eI=; b=gBE/FdQX+I6F1nAsCwnCshyFk3
 Jgwi3Jk25/MZ6jVhjxrZrr3QMmeqoXod8FQRpcThV2BMrmVaUBwjMRr+gAU83SErK7xJbZTpxTf/D
 ckI9nJkeS+ffI6rCqGUVpvXSZg3JfGkmMdGS2jIi9UbT1RVb6vt6bXbO7K9vmZ/24ndk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uj7mV-0000L2-6R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 02:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC8005C5D5E;
 Tue,  5 Aug 2025 02:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C97AC4CEE7;
 Tue,  5 Aug 2025 02:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754362312;
 bh=hIYpjPGTOj1ZFCpNe9DNjh2U9NIYW7pnDQtucuxMe/o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=eBMr+Pxi93e1EErEztqbXyMumcZn8qQqiq75hvP9d7440nFgYWKbtTz6xWsB3j7Yx
 uLWuiHYEcUfYcQ8E/DxsrVpyCBaBGcR+wq+4HDHdBvPULqHqyoJRs+rgE4HHeXL9s+
 VVs2casHDyWArNgDeGep8hPfhUqk2tDi27oqz+AUW3uq+4rfzY3VOZb6DPqoyGWiG2
 XAD/NhX3GQ3ii/RfWf2OuAJat+fFVc7sXhRKjlLdYu3Fjb3uhdWata/qyu4wWIZCaY
 j7VG80C7F3O1uXV8/2W21By8bLW32MhJtud4X6WJ+p2DNtQrMyAS90JLVGKjjCa0jW
 /xCBvhlffKskA==
Message-ID: <1fa9d0c7-0d6f-4752-879b-f277682e82ae@kernel.org>
Date: Tue, 5 Aug 2025 10:51:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250804014340.2537172-1-chao@kernel.org>
 <20250804014340.2537172-3-chao@kernel.org> <aJFvjBQv8PzJeFNN@google.com>
Content-Language: en-US
In-Reply-To: <aJFvjBQv8PzJeFNN@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, sure, let me change the order. On 8/5/25 10:42,
 Jaegeuk
 Kim wrote: > Chao, it seems you made a clean up before this? Can you post
 it first? > > On 08/04, Chao Yu wrote: >> generic/091 may fail, then it bisects
 to the bad commit ba8 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uj7mV-0000L2-6R
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix to zero data after EOF for
 compressed file correctly
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, sure, let me change the order.

On 8/5/25 10:42, Jaegeuk Kim wrote:
> Chao, it seems you made a clean up before this? Can you post it first?
> 
> On 08/04, Chao Yu wrote:
>> generic/091 may fail, then it bisects to the bad commit ba8dac350faf
>> ("f2fs: fix to zero post-eof page").
>>
>> What will cause generic/091 to fail is something like below Testcase #1:
>> 1. write 16k as compressed blocks
>> 2. truncate to 12k
>> 3. truncate to 20k
>> 4. verify data in range of [12k, 16k], however data is not zero as
>> expected
>>
>> Script of Testcase #1
>> mkfs.f2fs -f -O extra_attr,compression /dev/vdb
>> mount -t f2fs -o compress_extension=* /dev/vdb /mnt/f2fs
>> dd if=/dev/zero of=/mnt/f2fs/file bs=12k count=1
>> dd if=/dev/random of=/mnt/f2fs/file bs=4k count=1 seek=3 conv=notrunc
>> sync
>> truncate -s $((12*1024)) /mnt/f2fs/file
>> truncate -s $((20*1024)) /mnt/f2fs/file
>> dd if=/mnt/f2fs/file of=/mnt/f2fs/data bs=4k count=1 skip=3
>> od /mnt/f2fs/data
>> umount /mnt/f2fs
>>
>> Analisys:
>> in step 2), we will redirty all data pages from #0 to #3 in compressed
>> cluster, and zero page #3,
>> in step 3), f2fs_setattr() will call f2fs_zero_post_eof_page() to drop
>> all page cache post eof, includeing dirtied page #3,
>> in step 4) when we read data from page #3, it will decompressed cluster
>> and extra random data to page #3, finally, we hit the non-zeroed data
>> post eof.
>>
>> However, the commit ba8dac350faf ("f2fs: fix to zero post-eof page") just
>> let the issue be reproduced easily, w/o the commit, it can reproduce this
>> bug w/ below Testcase #2:
>> 1. write 16k as compressed blocks
>> 2. truncate to 8k
>> 3. truncate to 12k
>> 4. truncate to 20k
>> 5. verify data in range of [12k, 16k], however data is not zero as
>> expected
>>
>> Script of Testcase #2
>> mkfs.f2fs -f -O extra_attr,compression /dev/vdb
>> mount -t f2fs -o compress_extension=* /dev/vdb /mnt/f2fs
>> dd if=/dev/zero of=/mnt/f2fs/file bs=12k count=1
>> dd if=/dev/random of=/mnt/f2fs/file bs=4k count=1 seek=3 conv=notrunc
>> sync
>> truncate -s $((8*1024)) /mnt/f2fs/file
>> truncate -s $((12*1024)) /mnt/f2fs/file
>> truncate -s $((20*1024)) /mnt/f2fs/file
>> echo 3 > /proc/sys/vm/drop_caches
>> dd if=/mnt/f2fs/file of=/mnt/f2fs/data bs=4k count=1 skip=3
>> od /mnt/f2fs/data
>> umount /mnt/f2fs
>>
>> Anlysis:
>> in step 2), we will redirty all data pages from #0 to #3 in compressed
>> cluster, and zero page #2 and #3,
>> in step 3), we will truncate page #3 in page cache,
>> in step 4), expand file size,
>> in step 5), hit random data post eof w/ the same reason in Testcase #1.
>>
>> Root Cause:
>> In f2fs_truncate_partial_cluster(), after we truncate partial data block
>> on compressed cluster, all pages in cluster including the one post eof
>> will be dirtied, after another tuncation, dirty page post eof will be
>> dropped, however on-disk compressed cluster is still valid, it includes
>> invalid data post eof, result in exposing previous data post eof while
>> reading.
>>
>> Fix:
>> In f2fs_truncate_partial_cluster(), let change as below to fix:
>> - call filemap_write_and_wait_range() to flush dirty page
>> - call truncate_pagecache() to drop pages or zero partial page post eof
>> - call f2fs_do_truncate_blocks() to truncate non-compress cluster to
>>   last vali block
>>
>> Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
>> Reported-by: Jan Prusakowski <jprusakowski@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - should dirty & flush all pages in cluster and truncate blocks post eof
>> later
>>  fs/f2fs/compress.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index e37a7ed801e5..6ad8d3bc6df7 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1245,17 +1245,25 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
>>  	for (i = (1 << log_cluster_size) - 1; i >= 0; i--) {
>>  		struct folio *folio = page_folio(rpages[i]);
>>  		loff_t start = (loff_t)folio->index << PAGE_SHIFT;
>> +		loff_t offset = from > start ? from - start : 0;
>>  
>> -		if (from > start) {
>> -			folio_zero_segment(folio, from - start,
>> -					folio_size(folio));
>> +		folio_zero_segment(folio, offset, folio_size(folio));
>> +
>> +		if (from >= start)
>>  			break;
>> -		}
>> -		folio_zero_segment(folio, 0, folio_size(folio));
>>  	}
>>  
>>  	f2fs_compress_write_end(inode, fsdata, start_idx, true);
>> -	return 0;
>> +
>> +	err = filemap_write_and_wait_range(inode->i_mapping,
>> +			round_down(from, 1 << log_cluster_size << PAGE_SHIFT),
>> +			LLONG_MAX);
>> +	if (err)
>> +		return err;
>> +
>> +	truncate_pagecache(inode, from);
>> +
>> +	return f2fs_do_truncate_blocks(inode, round_up(from, PAGE_SIZE), lock);
>>  }
>>  
>>  static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>> -- 
>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
