Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C585A2D1FDB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 02:19:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRee-00068Y-2F; Tue, 08 Dec 2020 01:19:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmRec-00068R-As
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ubRYQaYwX5g5vXJVeVvZXC9OcM+iaBXBPlmEko6i8KM=; b=cCBPaHKFnisUIZQnTGg8wY69bo
 UzT0EteTcisryouz4ovy0oJV9xJ2OD+KXO/6dk5T7hZKanhb+asReEcq3Qg2/oiIEY+Ikh/YmAMpS
 ljzDnbxa9uWZ6KajZWwEqCYoPuoVrUb7V4qX3WZclmbdqxG4bMKqS0/d6EY6r0Sr6fkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ubRYQaYwX5g5vXJVeVvZXC9OcM+iaBXBPlmEko6i8KM=; b=R0+kvYnoZhn7BDm2f+ba5ezdPo
 RfYuBbE0ltWGOuD/lhKzFtk6w9LgY1Sg/MLtZriMMQrMsAf/B+DVaJc8m5K0Y5xeLbxz2Doz3oERX
 wwLgAxEE0OB5wXwISlpDAdGJmG7W8AK7+mc5pL6C0kGIFnMtGTkeuyItEcGJaZJx+EiM=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmReV-002lzl-B6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:18:58 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cqj3Z6RjnzM20k;
 Tue,  8 Dec 2020 09:18:02 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 8 Dec 2020
 09:18:37 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201126103209.67985-1-yuchao0@huawei.com>
 <X86Sb2pvD53MzO5+@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e6bc842d-90a2-d4ce-56be-594bcebaea37@huawei.com>
Date: Tue, 8 Dec 2020 09:18:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X86Sb2pvD53MzO5+@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmReV-002lzl-B6
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: support chksum
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 4:37, Eric Biggers wrote:
> On Thu, Nov 26, 2020 at 06:32:09PM +0800, Chao Yu wrote:
>> +	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {
> 
> This really could use some parentheses.  People shouldn't have to look up a
> C operator precedence table to understand the code.

Will add parentheses to avoid misread.

> 
>> +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
>> +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
>> +
>> +		if (provided != calculated) {
>> +			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
>> +				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
>> +				printk_ratelimited(
>> +					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
>> +					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
>> +					provided, calculated);
>> +			}
>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +			WARN_ON_ONCE(1);
> 
> WARN, WARN_ON_ONCE, BUG, BUG_ON, etc. are only for kernel bugs, not for invalid
> inputs from disk or userspace.
> 
> There is already a log message printed just above, so it seems this WARN_ON_ONCE
> should just be removed.

Jaegeuk wants to give WARN_ON and marking a FSCK flag without returning EFSCORRUPTED,

Jaegeuk, thoughts?

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
