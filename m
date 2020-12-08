Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE02D1FB0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 01:59:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRM2-0001ch-Tp; Tue, 08 Dec 2020 00:59:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmRM1-0001ca-G8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 00:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2iWptE+BU2/vZ+HSPKFRndYrclZG/CkZ3z8wgvqJHYU=; b=V3iyHiDVLLaGdGvd/sD1Mhuvw1
 GQ+KuBC72EK8rJJPDRqdmFI4GGperja9xdiu6qZAvXhtdEDMZLDqxemfFq1Z3VLLWJ7O/GCfj16yP
 XryDR6Q0ghP5h5coUp9UcEFiCozREAVhlktS0v+ApysiylqhZFt9mnToEXf9NR5CzgUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2iWptE+BU2/vZ+HSPKFRndYrclZG/CkZ3z8wgvqJHYU=; b=k0L3DruUtLeHgb59EOvXJoNRCc
 b3zsJ+gvZK86eM43BM+91W3xeqHj17JqRMxEUNt/kMTJd0npLc1+qjObA1x803l//xPZq9C9rsBzB
 TwXpNyPVzSvtbUSJGrm8VCItyMow3bkanCtrZJJWwaDSiTRj0ZsrnS1vFqJSg+kcNnUA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmRLn-005zCV-9v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 00:59:45 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cqhd54FxVzM1N0;
 Tue,  8 Dec 2020 08:58:33 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 8 Dec 2020
 08:59:12 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201207095220.73093-1-yuchao0@huawei.com>
 <X85wshahXe4nR+N6@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8cccbe7f-94c0-ddd0-4da5-234d02839ae0@huawei.com>
Date: Tue, 8 Dec 2020 08:59:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X85wshahXe4nR+N6@gmail.com>
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
X-Headers-End: 1kmRLn-005zCV-9v
Subject: Re: [f2fs-dev] [PATCH v5 RESEND] f2fs: compress: add compress_inode
 to cache compressed blocks
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

On 2020/12/8 2:13, Eric Biggers wrote:
> On Mon, Dec 07, 2020 at 05:52:20PM +0800, Chao Yu wrote:
>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>> index dae15c96e659..fd413d319e93 100644
>> --- a/Documentation/filesystems/f2fs.rst
>> +++ b/Documentation/filesystems/f2fs.rst
>> @@ -268,6 +268,9 @@ compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
>>   			 choosing the target file and the timing. The user can do manual
>>   			 compression/decompression on the compression enabled files using
>>   			 ioctls.
>> +compress_cache		 Support to use address space of inner inode to cache
>> +			 compressed block, in order to improve cache hit ratio of
>> +			 random read.
> 
> What is an "inner inode"?  Mount options should be understandable without
> understanding filesystem implementation details.

I'd like to use "a filesystem managed inode" instead, if there is no further
comment.

> 
>> +const struct address_space_operations f2fs_compress_aops = {
>> +	.releasepage = f2fs_release_page,
>> +	.invalidatepage = f2fs_invalidate_page,
>> +};
>> +
>> +struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
>> +{
>> +	return sbi->compress_inode->i_mapping;
>> +}
>> +
>> +void invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr)
>> +{
>> +	if (!sbi->compress_inode)
>> +		return;
>> +	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr);
>> +}
> 
> Global functions should have the "f2fs_" prefix.

Yup,

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
