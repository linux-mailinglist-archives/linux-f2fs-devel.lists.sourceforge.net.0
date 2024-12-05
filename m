Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4A9E4CEB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2024 04:57:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tJ2zB-00056u-32;
	Thu, 05 Dec 2024 03:57:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1tJ2z9-00056m-MJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 03:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSGQ19+/2VqkXIFgOKWT8Lq8lxss152C49dNaHjoyeA=; b=hxqf8BGUNXtRZ+oHUWv2x3rkT5
 NDGa7ZgZJVoOPWO+wxQrosWri+y+RyB58F5OBSPZIhO+aaH/TwV8shekH7jaxhkhQFKCJ9DEI26yP
 vHdvjS2OpsfEYUzX+UH4gpeFwoRv7+ps5bVrRZ9WViIkDhsv4Owpd2fHoaxjDFl70h20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OSGQ19+/2VqkXIFgOKWT8Lq8lxss152C49dNaHjoyeA=; b=Dq1hhVaKHSfy5KWlRNkdCfAYB8
 ARZH1uj4ikH0hRQQlR8bC7Y0GT5rWIaTIT6rsap0kBQ9mS0TkZXYX5nnsUsR/OYmIVvpiLsD7rsdW
 WCKt4DV8fa/O7rGJRBqyJBvGRmZH5nPccDLwAKTYBWqBISO0IjF1h4NJsMX4GX5lEDCg=;
Received: from mta21.honor.com ([81.70.160.142] helo=mta21.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tJ2z8-0002AD-I1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 03:57:03 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4Y3gBv1WyKzYlGnT;
 Thu,  5 Dec 2024 11:40:23 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Dec
 2024 11:40:35 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Dec
 2024 11:40:35 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 5 Dec 2024 11:40:34 +0800
Message-ID: <20241205034035.3119810-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <502ae396-ae82-44d6-b08d-617e9e9c4092@oppo.com>
References: <502ae396-ae82-44d6-b08d-617e9e9c4092@oppo.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 2024/12/4 20:23, wangzijie wrote: >> When we check inode
 which just has inline xattr data, we copy >> inline xattr data from inode,
 check it(maybe fix it) and copy >> it again to inode. We can che [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.160.142 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.160.142 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tJ2z8-0002AD-I1
Subject: Re: [f2fs-dev] f2fs-tools: Check and fix inline xattr inplace
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 2024/12/4 20:23, wangzijie wrote:
>> When we check inode which just has inline xattr data, we copy
>> inline xattr data from inode, check it(maybe fix it) and copy
>> it again to inode. We can check and fix xattr inplace for this
>> kind of inode to reduce memcpy times.
>> 
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>>   fsck/fsck.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>> 
>> diff --git a/fsck/fsck.c b/fsck/fsck.c
>> index aa3fb97..fd8b082 100644
>> --- a/fsck/fsck.c
>> +++ b/fsck/fsck.c
>> @@ -840,11 +840,18 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
>>   	struct f2fs_xattr_entry *ent;
>>   	__u32 xattr_size = XATTR_SIZE(&inode->i);
>>   	bool need_fix = false;
>> +	bool has_xattr_node = false;
>> +	nid_t xnid = le32_to_cpu(inode->i.i_xattr_nid);
>>   
>>   	if (xattr_size == 0)
>>   		return 0;
>>   
>> -	xattr = read_all_xattrs(sbi, inode, false);
>> +	if (xattr_size <= inline_xattr_size(&inode->i) && !xnid)
>Hi, zijie,
>
>I propose to change the behavors of read_all_xattrs and write_all_xattrs, and to add a
>new free_xattrs.
>
>* read_all_xattrs checks whether xnid exist. If it's not, return inline_xattr directly
>   without alloc and memcpy.
>* write_all_xattrs checks whether inline_xattr and new txattr_addr have the same address
>   to avoid copying back.
>* free_xattrs checks whether inline_xattr and new txattr_addr have the same address to
>   free xattr buffer properly.
>
>In this way, all instances where {read|write}_all_xattrs are called can avoid unnecessary
>memory alloc and copy. free_xattrs(xattrs) should be used instead of free(xattrs).
>
>thanks,
>shengyong

Hi, yong
Thanks for sharing what you proposed to do. By the way, I noticed that 
when setattr, read_all_xattr will set xattr header's magic and refcount,
but it seems we don't check these values in header(kernel/fsck). Should we 
add check logic for it?

>> +		xattr = inline_xattr_addr(&inode->i);
>> +	else {
>> +		xattr = read_all_xattrs(sbi, inode, false);
>> +		has_xattr_node = true;
>> +	}
>>   	ASSERT(xattr);
>>   
>>   	last_base_addr = (void *)xattr + xattr_size;
>> @@ -867,12 +874,15 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
>>   	}
>>   	if (need_fix && c.fix_on) {
>>   		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
>> -		write_all_xattrs(sbi, inode, xattr_size, xattr);
>> +		if (has_xattr_node) {
>> +			write_all_xattrs(sbi, inode, xattr_size, xattr);
>> +			free(xattr);
>> +		}
>>   		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
>> -		free(xattr);
>>   		return 1;
>>   	}
>> -	free(xattr);
>> +	if (has_xattr_node)
>> +		free(xattr);
>>   	return 0;
>>   }
>>   
>
>
>
>_______________________________________________
>Linux-f2fs-devel mailing list
>Linux-f2fs-devel@lists.sourceforge.net
>https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
