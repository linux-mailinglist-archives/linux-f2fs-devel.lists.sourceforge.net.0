Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38F20005F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 04:43:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jm70F-0004IP-CI; Fri, 19 Jun 2020 02:43:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jm70E-0004IJ-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 02:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=37Z/hSotBTm2TwWrr94WVvMu6zdqSdjB3lwH39Oe3U8=; b=EsWbx1Uf9EvmsrFa9Abqz/880W
 0E0eoNxX7faH7xrRMWiJWyBNw4TClCOGcBWIf0QmSqBKN8TvILc0eh/mJ0FZYpxlFsI36o7YXb3vk
 Skkf0FKX7I7mObY/5PwKqZoskIQhuGl+lkVgA+fL2E5XOOqoqVcOVp8M14oPQPPJJ1eI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=37Z/hSotBTm2TwWrr94WVvMu6zdqSdjB3lwH39Oe3U8=; b=Kn2BbLEyex3gfaurTvCaKGKCIn
 NRX0+i8QGbHyjdumkidwLSlJlqsB862qmcWE1YXXL9B92coCZ+VUGKTFRHJV2nzcDdW8wviVz3ZVZ
 jdhbf3E7Mwzm2AZeplg/HxvD7SLDETs3s0GlBdPj39EJXT6gP1KNEmwu3Kdaa4JymvqM=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jm70C-008Usc-T7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 02:43:38 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5629A3848E085825E87F;
 Fri, 19 Jun 2020 10:43:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 19 Jun
 2020 10:43:16 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-4-satyat@google.com>
 <5e78e1be-f948-d54c-d28e-50f1f0a92ab3@huawei.com>
 <20200618181357.GC2957@sol.localdomain> <20200618192804.GA139436@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f49534bf-f119-2fa5-81a3-5e169d6c5f61@huawei.com>
Date: Fri, 19 Jun 2020 10:43:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200618192804.GA139436@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jm70C-008Usc-T7
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: add inline encryption support
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/19 3:28, Jaegeuk Kim wrote:
> On 06/18, Eric Biggers wrote:
>> Hi Chao,
>>
>> On Thu, Jun 18, 2020 at 06:06:02PM +0800, Chao Yu wrote:
>>>> @@ -936,8 +972,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>>>  
>>>>  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
>>>>  
>>>> -	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
>>>> -			io->last_block_in_bio, fio->new_blkaddr))
>>>> +	if (io->bio &&
>>>> +	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
>>>> +			      fio->new_blkaddr) ||
>>>> +	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
>>>> +				       fio->page->index, fio)))
>>>
>>> bio_page->index, fio)))
>>>
>>>>  		__submit_merged_bio(io);
>>>>  alloc_new:
>>>>  	if (io->bio == NULL) {
>>>> @@ -949,6 +988,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>>>  			goto skip;
>>>>  		}
>>>>  		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
>>>> +		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
>>>> +				       fio->page->index, fio, GFP_NOIO);
>>>
>>> bio_page->index, fio, GFP_NOIO);
>>>
>>
>> We're using ->mapping->host and ->index.  Ordinarily that would mean the page
>> needs to be a pagecache page.  But bio_page can also be a compressed page or a
>> bounce page containing fs-layer encrypted contents.
>>
>> Is your suggestion to keep using fio->page->mapping->host (since encrypted pages
>> don't have a mapping), but start using bio_page->index (since f2fs apparently
>> *does* set ->index for compressed pages, and if the file uses fs-layer
>> encryption then f2fs_set_bio_crypt_ctx() won't use the index anyway)?
>>
>> Does this mean the code is currently broken for compression + inline encryption
>> because it's using the wrong ->index?  I think the answer is no, since
>> f2fs_write_compressed_pages() will still pass the first 'nr_cpages' pagecache
>> pages along with the compressed pages.  In that case, your suggestion would be a
>> cleanup rather than a fix?
>>
>> It would be helpful if there was an f2fs mount option to auto-enable compression
>> on all files (similar to how test_dummy_encryption auto-enables encryption on
>> all files) so that it could be tested more easily.
> 
> Eric, you can use "-o compress_extension=*".

Cool, we should update documentation when merge that patch...

> 
>>
>> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
