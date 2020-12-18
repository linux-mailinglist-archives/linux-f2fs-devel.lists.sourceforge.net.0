Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66C2DE030
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 10:02:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kqBf2-0001vT-D8; Fri, 18 Dec 2020 09:02:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kqBf1-0001vM-1l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 09:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPibAugB7ve8hUrLmYX78IjTDR8lMiEj/XDDlWP+2ic=; b=Pfdf0Slndb/7e/ndTvcEFcbr2t
 Y0/86q/x1l+8+SJVxtVGu/+/bkiTaY3gJEHvHVhdpJ2eLEjZM+m2FqKqd6mK6cp5YShiuPJSrZnxc
 pC2lQi6IcbDUsImxXRumpKnS2nrX+rr6xNLeFc9W0TQ7kNuobNBv3cOpHMOvmyz17TF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yPibAugB7ve8hUrLmYX78IjTDR8lMiEj/XDDlWP+2ic=; b=APp4Apm6byT7d+67wfDIpFgML8
 IDHVwRIbrDEMbxRFSllDZSuMk6qDkaR203ZdYQlyZwsnXSVHsvmlZxrAcPgr+ar5oDrPKIBoWmXyh
 HmVkiXTfFWNcPX7V6f2NMzw8jx1XUW+Vv2yAppFc7wPRjFUD5ZYjbnhTCR6PF2O3YWp4=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kqBes-0017f4-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 09:02:51 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cy2t637T1z15fk4;
 Fri, 18 Dec 2020 17:01:50 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 18 Dec
 2020 17:02:24 +0800
To: Satya Tangirala <satyat@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
 <X9t8y3rElyAPCLoD@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9a8d3ae2-a09f-f199-5cb1-48b1317b3d37@huawei.com>
Date: Fri, 18 Dec 2020 17:02:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X9t8y3rElyAPCLoD@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kqBes-0017f4-Hh
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

On 2020/12/17 23:44, Satya Tangirala wrote:
> On Sat, Oct 10, 2020 at 05:53:06PM +0800, Chao Yu wrote:
>> On 2020/10/5 15:36, Satya Tangirala wrote:
>>> This patch series adds support for metadata encryption to F2FS using
>>> blk-crypto.
>>
>> It looks this implementation is based on hardware crypto engine, could you
>> please add this info into f2fs.rst as well like inlinecrypt...
>>
> To be precise, the implementation requires either a hardware crypto
> engine *or* blk-crypto-fallback. I tried to clarify this a little better
> in the commit messages and in fscrypt.rst, but thinking about it again
> now, I think I should add a section about metadata encryption at the end
> of f2fs.rst. I'll do that when I send out v3 of this patch series (I
> just sent out v2).
>>>
>>> Patch 3 wires up F2FS with the functions introduced in Patch 2. F2FS
>>> will encrypt every block (that's not being encrypted by some other
>>> encryption key, e.g. a per-file key) with the metadata encryption key
>>> except the superblock (and the redundant copy of the superblock). The DUN
>>> of a block is the offset of the block from the start of the F2FS
>>> filesystem.
>>
>> Why not using nid as DUN, then GC could migrate encrypted node block directly via
>> meta inode's address space like we do for encrypted data block, rather than
>> decrypting node block to node page and then encrypting node page with DUN of new
>> blkaddr it migrates to.
>>
> The issue is, the bi_crypt_context in a bio holds a single DUN value,
> which is the DUN for the first data unit in the bio. blk-crypto assumes
> that the DUN of each subsequent data unit can be computed by simply
> incrementing the DUN. So physically contiguous data units can only be put
> into the same bio if they also have contiguous DUNs. I don't know much
> about nids, but if the nid is invariant w.r.t the physical block location,
> then there might be more fragmentation of bios in regular read/writes

Correct, considering performance of in batch node flush, it will be better to
use pba as IV value.

But, what's the plan about supporting software encryption for metadata? Current
f2fs write flow will handle all operations which may encounter failure before
allocating block address for node, if we do allocation first, and then use pba
as IV to encrypt node block, it will be a little complicated to revert allocation
if we fail to encrypt node block.

Thanks,

> (because physical contiguity may have no relation to DUN contiguity). So I
> think we should continue using the fsblk number as the DUN.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
