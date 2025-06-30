Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B98AED285
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 04:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXJg0+Pz6cigG/Q16j/OWJxnyEhm0tHtoW6iEnn9d/k=; b=NbAMLboHOLwne3rFWPtbSNcNuk
	HJz5TCEm9cUevcCkedOhvtGpqs+iM9drRWAO7P2XkWSthJ15fp8JLNkGsYs/CDJ4I1BXqv7n5iAlB
	XNR8QgleX7qp/jj5WhXeDlxB2Q60X074mxze3SpEQ8+LUkNMLcfHwlyoAnXFdb3FtEcE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uW4bo-0007t2-U4;
	Mon, 30 Jun 2025 02:51:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uW4bN-0007sQ-SD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 02:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b0F074ERF9er2R4vO2YDOE73cru7P5q+0hewu5bm6Cs=; b=BmFFY7C20SYQXralvZ1uUUtKPV
 1x7Sap3Ix26vUiC4DFAyDufmtvvyw5pfOWNCEg79ju1GCcHI9wkNKMByCozn7WaoyYx9sfUGlDgej
 RpcFScdknnx8ROYDfIdnhH6BRDz3HakSUFNz3v5TUOfJcxkFWYRFero2ORn7+Vitdvl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b0F074ERF9er2R4vO2YDOE73cru7P5q+0hewu5bm6Cs=; b=V/73l0s+kFaokCiIN8SBxa4JFU
 Z6SjQriqyuT/T+lXHrcJghzUr/HhnPh0WNPt0mvGNgxQ3vKSW/SlHZ8c72MZCIKXbZRQvymfKnuq9
 SN7QlHi6Ywmcl1TM1XxezeR20YyYEJ3vSE4GDm3hOixEY0Uvoe5LpOP1Q+GqghVKH9xo=;
Received: from mta21.hihonor.com ([81.70.160.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uW4bN-0000Xb-0y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 02:50:37 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bVrDz4gPyzYm65y;
 Mon, 30 Jun 2025 10:48:03 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 10:50:24 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 10:50:23 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 30 Jun 2025 10:50:23 +0800
Message-ID: <20250630025023.3876706-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
References: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 6/24/25 11:59, wangzijie wrote: >> To prevent scattered
 pin block generation, don't allow non-section aligned truncation >> to smaller
 or equal size on pinned file. But for truncation to larger si [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uW4bN-0000Xb-0y
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 6/24/25 11:59, wangzijie wrote:
>> To prevent scattered pin block generation, don't allow non-section aligned truncation
>> to smaller or equal size on pinned file. But for truncation to larger size, after
>> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
>> we only support overwrite IO to pinned file, so we don't need to consider
>> attr->ia_size > i_size case.
>
>Zijie, can you take a look generic/494? suspect that it is caused by this change.
>
>generic/494 3s ... - output mismatch (see /share/git/fstests/results//generic/494.out.bad)
>    --- tests/generic/494.out   2025-01-12 21:57:40.279440664 +0800
>    +++ /share/git/fstests/results//generic/494.out.bad 2025-06-30 10:01:37.000000000 +0800
>    @@ -2,7 +2,7 @@
>     Format and mount
>     Initialize file
>     Try to truncate
>    -ftruncate: Text file busy
>    +ftruncate: Invalid argument
>     Try to punch hole
>     fallocate: Text file busy
>    ...
>    (Run 'diff -u /share/git/fstests/tests/generic/494.out /share/git/fstests/results//generic/494.out.bad'  to see the entire diff)
>Ran: generic/494
>Failures: generic/494
>Failed 1 of 1 tests
>
>Thanks,

Hi, Chao
generic/494 swapon file and try to ftruncate.

Before this change
swap_acticate:
set_inode_flag(inode, FI_PIN_FILE)

ftruncate:
setattr_prepare
-inode_newsize_ok
--return -ETXTBSY for SWAPFILE

After this change:
swap_acticate:
set_inode_flag(inode, FI_PIN_FILE)

ftruncate: 
prevent unaligned truncation before setattr_prepare()
return -EINVAL

Sorry for this. Maybe I should apply this check after setattr_prepare()? Or do
you have some suggestions?


>> 
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>> v4:
>> - convert sbi first and apply change
>> ---
>>  fs/f2fs/file.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 209f43653..4809f0fd6 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>  			!IS_ALIGNED(attr->ia_size,
>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>  			return -EINVAL;
>> +		/*
>> +		 * To prevent scattered pin block generation, we don't allow
>> +		 * smaller/equal size unaligned truncation for pinned file.
>> +		 * We only support overwrite IO to pinned file, so don't
>> +		 * care about larger size truncation.
>> +		 */
>> +		if (f2fs_is_pinned_file(inode) &&
>> +			attr->ia_size <= i_size_read(inode) &&
>> +			!IS_ALIGNED(attr->ia_size,
>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>> +			return -EINVAL;
>>  	}
>>  
>>  	err = setattr_prepare(idmap, dentry, attr);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
