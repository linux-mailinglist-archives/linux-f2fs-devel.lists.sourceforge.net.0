Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899BB9870D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 08:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3k8cnDysNZaBnINc5wfOAToY7fipfXdjKJ3FmlaRLs=; b=AyjCVJ5KD2Pv4uFTxY+Is2uD/G
	zFswIcyd3GkjMAotfTmXdaYs7/5+1wIC44jT941LufZP4CqWL6fEaRraOiRtNITh8viL+wFgfIQXw
	AiArkKsCaVpkD9gQtboG2m2QwZ8jrwvImjvkkflHVlglBkzKvTqzuaCz8EtiEwSO0SDo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1JOG-00032y-0y;
	Wed, 24 Sep 2025 06:54:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1v1JO9-00032m-Ke
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 06:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mrfs4D+7BhX3WoEytlZtQ5rDP+Xw/RLQ/pd96ijREXY=; b=nQ4MKqk3eHb/vS/RpJPsMRqwfU
 XmmJQcLCokAqrSsgjsExg8NRk7Zh/fFsYLkwg96yP2WKTDsxytb1NpMGQk4VsJFTY4PjRf4Wq3z8A
 8WDsundsqARGOAmW3RAIEjtHWavOrv6XaO+lIeAUGr+nES+1w9f/YCExP+sPvBGuYEJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mrfs4D+7BhX3WoEytlZtQ5rDP+Xw/RLQ/pd96ijREXY=; b=GXyg7pYVTVjcjhp//Lu3B8K2Jz
 vhXYH+TP+wosS8VFOYFeqwm1tl/QgoNDZNsS1DD5sLaB9es0B3X2qVLUC1/76d7tNKgl37X1oK+N/
 flu9gqcLl3RUD8LzDL8limusJY7YmYr7Pg5PFzIE/P2sdJIJlZB4rjoJ4yzaN8POtDxA=;
Received: from mta21.hihonor.com ([81.70.160.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1JO7-0001UN-Ue for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 06:54:05 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4cWnby6QJxzYlX32;
 Wed, 24 Sep 2025 14:53:02 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Sep
 2025 14:53:39 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Sep
 2025 14:53:39 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 24 Sep 2025 14:53:38 +0800
Message-ID: <20250924065338.1359558-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <dfc68656-1794-4e69-a222-9ba9c8bf3a20@kernel.org>
References: <dfc68656-1794-4e69-a222-9ba9c8bf3a20@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 9/24/25 13:58,
 Yunji Kang wrote: >> In f2fs_precache_extents(), 
 For large files, It requires reading many >> node blocks. Instead of reading
 each node block with synchronous I/O, >> this patch app [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.160.142 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v1JO7-0001UN-Ue
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 9/24/25 13:58, Yunji Kang wrote:
>> In f2fs_precache_extents(), For large files, It requires reading many
>> node blocks. Instead of reading each node block with synchronous I/O,
>> this patch applies readahead so that node blocks can be fetched in
>> advance.
>> 
>> It reduces the overhead of repeated sync reads and improves efficiency
>> when precaching extents of large files.
>> 
>> I created a file with the same largest extent and executed the test.
>> For this experiment, I set the file's largest extent with an offset of 0
>> and a size of 1GB. I configured the remaining area with 100MB extents.
>> 
>> 5GB test file:
>> dd if=/dev/urandom of=test1 bs=1m count=5120
>> cp test1 test2
>> fsync test1
>> dd if=test1 of=test2 bs=1m skip=1024 seek=1024 count=100 conv=notrunc
>> dd if=test1 of=test2 bs=1m skip=1224 seek=1224 count=100 conv=notrunc
>> ...
>> dd if=test1 of=test2 bs=1m skip=5024 seek=5024 count=100 conv=notrunc
>> reboot
>> 
>> I also created 10GB and 20GB files with large extents using the same
>> method.
>> 
>> ioctl(F2FS_IOC_PRECACHE_EXTENTS) test results are as follows:
>>   +-----------+---------+---------+-----------+
>>   | File size | Before  | After   | Reduction |
>>   +-----------+---------+---------+-----------+
>>   | 5GB       | 101.8ms | 37.0ms  | 72.1%     |
>>   | 10GB      | 222.9ms | 56.0ms  | 74.9%     |
>>   | 20GB      | 446.2ms | 116.4ms | 73.9%     |
>>   +-----------+---------+---------+-----------+
>> Tested on a 256GB mobile device with an SM8750 chipset.
>> 
>> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
>> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
>> Signed-off-by: Yunji Kang <yunji0.kang@samsung.com>
>> ---
>> v2:
>>  - Modify the readahead condition check routine for better code
>> readability.
>>  - Update the title from 'node block' to 'node blocks'.
>> 
>> v3:
>>  - Bug fix to allow more node pages to be readahead.
>>  - Updated with test results.
>> 
>>  fs/f2fs/data.c | 3 +++
>>  fs/f2fs/f2fs.h | 1 +
>>  fs/f2fs/node.c | 4 +++-
>>  3 files changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 7961e0ddfca3..ab3117e3b24a 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1572,6 +1572,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>  	pgofs =	(pgoff_t)map->m_lblk;
>>  	end = pgofs + maxblocks;
>>  
>> +	if (flag == F2FS_GET_BLOCK_PRECACHE)
>> +		mode = LOOKUP_NODE_PRECACHE;
>
>If trigger condition of LOOKUP_NODE_RA and LOOKUP_NODE_PRECACHE is the same,
>What about?
>
>	if (flag == F2FS_GET_BLOCK_PRECACHE)
>		mode = LOOKUP_NODE_RA;
>
>Thanks,

Hi Yunji and Chao,
I think so, we can directly use LOOKUP_NODE_RA for precache extents.
BTW, maybe there are more cases that LOOKUP_NODE_RA will be better? Like
defragment/compress(need to call __f2fs_cluster_blocks() ) ioctl..


>> +
>>  next_dnode:
>>  	if (map->m_may_create) {
>>  		if (f2fs_lfs_mode(sbi))
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 9d3bc9633c1d..3ce41528d48e 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -651,6 +651,7 @@ enum {
>>  					 * look up a node with readahead called
>>  					 * by get_data_block.
>>  					 */
>> +	LOOKUP_NODE_PRECACHE,		/* look up a node for F2FS_GET_BLOCK_PRECACHE */
>>  };
>>  
>>  #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 4254db453b2d..63e9ee7ab911 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -860,7 +860,9 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
>>  			set_nid(parent, offset[i - 1], nids[i], i == 1);
>>  			f2fs_alloc_nid_done(sbi, nids[i]);
>>  			done = true;
>> -		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1) {
>> +		} else if ((mode == LOOKUP_NODE_RA ||
>> +                (mode == LOOKUP_NODE_PRECACHE))
>> +                && i == level && level > 1) {
>>  			nfolio[i] = f2fs_get_node_folio_ra(parent, offset[i - 1]);
>>  			if (IS_ERR(nfolio[i])) {
>>  				err = PTR_ERR(nfolio[i]);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
