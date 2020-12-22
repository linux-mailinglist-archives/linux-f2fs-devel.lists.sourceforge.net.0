Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 654102E09D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 12:48:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krg9F-0008ID-94; Tue, 22 Dec 2020 11:48:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1krg9D-0008Hw-Fe
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 11:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9sOIEOD15QdZzb22yjHQHc1gw6Sl4/6vSb1vNZWe31s=; b=bXNABlavC3AdRP1e4Mc6WOxMls
 dHzKG5J5XJu67hYkwKKXo7OTpgTNl7jysdJJuu4Sbk9K4id0/+JdhXhpVB39bgTaCfW18OKn3d+j/
 7uZrUmuYvF9QBXbvbwdYmQMdFsNb1vP/pVXQndKeai0RNKr05F9HOz9fij1N+trATE00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9sOIEOD15QdZzb22yjHQHc1gw6Sl4/6vSb1vNZWe31s=; b=E///3Tk9LvZmJSYqCnEwpsviRk
 lglO1y1rqWxlilCmB4175nfWSq18o1xtvEKhcDisVcll7nzhRkZdjYDppdbNs6IC0Sl2ywG8QdPgE
 utq2z8zHtyXwFfcYXa4S85YzL/XU7ZIH8nZ4DYb7YUO+v497sijOueDQ/qsGHJ9ecj/0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krg93-0060wQ-Am
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 11:48:11 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D0ZLn0qGZzktNS;
 Tue, 22 Dec 2020 19:46:57 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 22 Dec
 2020 19:47:46 +0800
To: Satya Tangirala <satyat@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
 <X9t8y3rElyAPCLoD@google.com>
 <9a8d3ae2-a09f-f199-5cb1-48b1317b3d37@huawei.com>
 <X9yYVuuLt3/hL17J@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c08aadef-47a7-f6fc-c2fa-11393ca938e8@huawei.com>
Date: Tue, 22 Dec 2020 19:47:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X9yYVuuLt3/hL17J@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krg93-0060wQ-Am
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/18 19:53, Satya Tangirala wrote:
> On Fri, Dec 18, 2020 at 05:02:23PM +0800, Chao Yu wrote:
>> On 2020/12/17 23:44, Satya Tangirala wrote:
>>> On Sat, Oct 10, 2020 at 05:53:06PM +0800, Chao Yu wrote:
>>>> Why not using nid as DUN, then GC could migrate encrypted node block directly via
>>>> meta inode's address space like we do for encrypted data block, rather than
>>>> decrypting node block to node page and then encrypting node page with DUN of new
>>>> blkaddr it migrates to.
>>>>
>>> The issue is, the bi_crypt_context in a bio holds a single DUN value,
>>> which is the DUN for the first data unit in the bio. blk-crypto assumes
>>> that the DUN of each subsequent data unit can be computed by simply
>>> incrementing the DUN. So physically contiguous data units can only be put
>>> into the same bio if they also have contiguous DUNs. I don't know much
>>> about nids, but if the nid is invariant w.r.t the physical block location,
>>> then there might be more fragmentation of bios in regular read/writes
>>
>> Correct, considering performance of in batch node flush, it will be better to
>> use pba as IV value.
>>
>> But, what's the plan about supporting software encryption for metadata? Current
>> f2fs write flow will handle all operations which may encounter failure before
>> allocating block address for node, if we do allocation first, and then use pba
>> as IV to encrypt node block, it will be a little complicated to revert allocation
>> if we fail to encrypt node block.
>>
> Software encryption for metadata is supported through the blk-crypto

blk-crypto will encrypt all data in filesystem, if FBE is enabled, data may
be encrypted twice?

And why not supporting hardware encryption for metadata in blk-crypto? then
both f2fs and ext4 can use inline-encryption based blk-crypto?

Thanks,

> framework - so encryption will happen in the block layer, not the
> filesystem layer. So there's nothing extra/special we need to do if
> there's an encryption failure - an encryption failure is no different
> from a read/write failure in a lower layer from f2fs' perspective.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
