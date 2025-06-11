Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0EDAD4AB2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 08:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cw40HXkUdXCgjQ+9DHBoKzgxP2lA7zyh0haeV0IkqxI=; b=VqG/rr6Jq3OH2bacxc23VpV84R
	k3J/3OvkdLBI+IbEvRQnfM29Kj//vLYmdiVF2U0JYRi7IbijFl7Xt9bpKULu/8RZjUoRHovACVoRh
	Q9XagqasQUvJsIvcTjCPKD+vLMOmz+QOUBKCVgXQT8cLo9i3J33bktMTJ/WSL4ddsFag=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPEcJ-0001nD-4t;
	Wed, 11 Jun 2025 06:07:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPEcG-0001n6-MR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dFmK9asXPHo+k0tm5aTQOuFL5aGNfg/PYZ6GGVI0DzA=; b=G4XGpI+l7lK2qj/ZuwvT/DXyRw
 M6coav+pjd2f9+NsW7vLtE9OjgxjU5P+pTSc3jQO7UA/pGOWhmATtu0Pf+xCV8UBgnOwYaBXXNUWD
 /53YIBJgyMRpJDgGKX5lOMETh5ozMQl7DLULnLOIIVDkS2j8sus+L8fvSQOBeRfhjJ2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dFmK9asXPHo+k0tm5aTQOuFL5aGNfg/PYZ6GGVI0DzA=; b=Wo1fejdSoc89yiWBtrAqd8vIIe
 e9v+PpHwgJ7LNL9F6uZFyplHR2Xg6Atdx/tzAbyv6Fdjm64h+ZHF0IeWB7FvEuuUvK44j8N3/UquQ
 3eiUQdDVqN2H/BuQiEYgBgEF7itFryf+jPBr1DYsk4mfuYMhuzSSJayw+IFFBFw0JzYI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPEcG-00073o-4V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50D93629DF;
 Wed, 11 Jun 2025 06:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9D5C4CEEE;
 Wed, 11 Jun 2025 06:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749622025;
 bh=XvaWqgGFHD8E8hWRNsclo9DOi2AH3hXAefuTklKXJ0Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vCQujmdeOR+5Aa5t8311gviiz/aJCqpq5LQI4Yi3NmRDsd0I9v5bVZimVid/PF3+q
 spIcQ37kz2xGU+ur+ZinkqxRCyh+2KFtrWICYo7e2zKUG/FhS77RqXKyOLVQntyRot
 fMiOujf3czYCIy8LICRdhYQ/2Rqpbf07J9U6SwVz1UB0S3134+5XT1ztflmcdiWFh+
 sjIfKUL0vc42o3QmmSpJpIYijaNcuS0xJK1kP+e3GQyLzAvxeYxKNtuxbncXi4EMqp
 10Da87xwNiQCqJ56I2sZs+7qMN2z6Lgv6v2p8Ph5p2EPYuTQRMLmQqnBQBzscbC1sp
 YeeaWHaP3diqA==
Message-ID: <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
Date: Wed, 11 Jun 2025 14:07:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com>
Content-Language: en-US
In-Reply-To: <aEhYfYrknbNzT8Or@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/11/25 00:08, Jaegeuk Kim wrote: > Hi Zhiguo, > > This
 patch causes CPU hang when running fsstress on compressed/non-compressed
 > files. Please check. Oh, seems it may cause below deadlock: CPU0 process
 A - spin_lock(i_lock) software IRQ - end_io - igrab - spin_lock(i_lock) 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPEcG-00073o-4V
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/11/25 00:08, Jaegeuk Kim wrote:
> Hi Zhiguo,
> 
> This patch causes CPU hang when running fsstress on compressed/non-compressed
> files. Please check.

Oh, seems it may cause below deadlock:

CPU0
process A
- spin_lock(i_lock)
software IRQ
- end_io
 - igrab
  - spin_lock(i_lock)

Thanks,

> 
> On 06/05, Zhiguo Niu wrote:
>> The decompress_io_ctx may be released asynchronously after
>> I/O completion. If this file is deleted immediately after read,
>> and the kworker of processing post_read_wq has not been executed yet
>> due to high workloads, It is possible that the inode(f2fs_inode_info)
>> is evicted and freed before it is used f2fs_free_dic.
>>
>>     The UAF case as below:
>>     Thread A                                      Thread B
>>     - f2fs_decompress_end_io
>>      - f2fs_put_dic
>>       - queue_work
>>         add free_dic work to post_read_wq
>>                                                    - do_unlink
>>                                                     - iput
>>                                                      - evict
>>                                                       - call_rcu
>>     This file is deleted after read.
>>
>>     Thread C                                 kworker to process post_read_wq
>>     - rcu_do_batch
>>      - f2fs_free_inode
>>       - kmem_cache_free
>>      inode is freed by rcu
>>                                              - process_scheduled_works
>>                                               - f2fs_late_free_dic
>>                                                - f2fs_free_dic
>>                                                 - f2fs_release_decomp_mem
>>                                       read (dic->inode)->i_compress_algorithm
>>
>> This patch use igrab before f2fs_free_dic and iput after free the dic when dic free
>> action is done by kworker.
>>
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
>> ---
>> v3: use igrab to replace __iget
>> v2: use __iget/iput function
>> ---
>>  fs/f2fs/compress.c | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index b3c1df9..729ad16 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>>  }
>>  
>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>> -		bool bypass_destroy_callback);
>> +		bool bypass_destroy_callback, bool late_free);
>>  
>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>  {
>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>  	return dic;
>>  
>>  out_free:
>> -	f2fs_free_dic(dic, true);
>> +	f2fs_free_dic(dic, true, false);
>>  	return ERR_PTR(ret);
>>  }
>>  
>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>> -		bool bypass_destroy_callback)
>> +		bool bypass_destroy_callback, bool late_free)
>>  {
>>  	int i;
>>  
>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>  	}
>>  
>>  	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
>> +	if (late_free)
>> +		iput(dic->inode);
>>  	kmem_cache_free(dic_entry_slab, dic);
>>  }
>>  
>> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_struct *work)
>>  	struct decompress_io_ctx *dic =
>>  		container_of(work, struct decompress_io_ctx, free_work);
>>  
>> -	f2fs_free_dic(dic, false);
>> +	f2fs_free_dic(dic, false, true);
>>  }
>>  
>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>>  {
>>  	if (refcount_dec_and_test(&dic->refcnt)) {
>>  		if (in_task) {
>> -			f2fs_free_dic(dic, false);
>> +			f2fs_free_dic(dic, false, false);
>>  		} else {
>>  			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
>> +			/* use igrab to avoid inode is evicted simultaneously */
>> +			f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->inode));
>>  			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>>  					&dic->free_work);
>>  		}
>> -- 
>> 1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
