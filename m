Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D906C2001FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 08:38:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmAfF-0003rs-Mm; Fri, 19 Jun 2020 06:38:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jmAfD-0003rg-Ep
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 06:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wXvJbNmD6u8HIiDpPwymcnUpxnnDqujAt1QfttJQGU4=; b=egCn6GQHoiBhPtakuxuc+1Hq4w
 3WfTVBw6GQ0rp7wzW1LmzyJ5qb9YBFcOMGmPb38cV+8VCgKFQjEINHPlgM/JuW7qleCYUu0vG3EGn
 tAg/h6g+LwYLsYHCRkAGN8ov4/Vo1qkU5bEUzh8a24m/NyjbrKAzdVbHCG3di/ts1qvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wXvJbNmD6u8HIiDpPwymcnUpxnnDqujAt1QfttJQGU4=; b=G9VXrLUmM8atPnxphw1VZzHh2U
 4cwP6qYZyGVbRKdnJqrGv1gXNS/WtjHoa+m9vcHa55OG9hhwIAAgCY1Y50tpENboF2B5ct5fJXOKd
 zWs6LCs3hgunw/471EYZr6ifYVMCQdb5bOoOjQFld06JyphvOawpII19htfIfYfF7kwg=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmAfB-00Be2Y-99
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 06:38:11 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DBE6EBE6350EF092C04C;
 Fri, 19 Jun 2020 14:37:54 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 19 Jun
 2020 14:37:52 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-4-satyat@google.com>
 <5e78e1be-f948-d54c-d28e-50f1f0a92ab3@huawei.com>
 <20200618181357.GC2957@sol.localdomain>
 <c6f9d02d-623f-8b36-1f18-91c69bdd17c8@huawei.com>
 <20200619042048.GF2957@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f1013767-9099-5b38-e3cd-b8caa639f66c@huawei.com>
Date: Fri, 19 Jun 2020 14:37:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200619042048.GF2957@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmAfB-00Be2Y-99
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

On 2020/6/19 12:20, Eric Biggers wrote:
> On Fri, Jun 19, 2020 at 10:39:34AM +0800, Chao Yu wrote:
>> Hi Eric,
>>
>> On 2020/6/19 2:13, Eric Biggers wrote:
>>> Hi Chao,
>>>
>>> On Thu, Jun 18, 2020 at 06:06:02PM +0800, Chao Yu wrote:
>>>>> @@ -936,8 +972,11 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>>>>  
>>>>>  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
>>>>>  
>>>>> -	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
>>>>> -			io->last_block_in_bio, fio->new_blkaddr))
>>>>> +	if (io->bio &&
>>>>> +	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
>>>>> +			      fio->new_blkaddr) ||
>>>>> +	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
>>>>> +				       fio->page->index, fio)))
>>>>
>>>> bio_page->index, fio)))
>>>>
>>>>>  		__submit_merged_bio(io);
>>>>>  alloc_new:
>>>>>  	if (io->bio == NULL) {
>>>>> @@ -949,6 +988,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>>>>>  			goto skip;
>>>>>  		}
>>>>>  		io->bio = __bio_alloc(fio, BIO_MAX_PAGES);
>>>>> +		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
>>>>> +				       fio->page->index, fio, GFP_NOIO);
>>>>
>>>> bio_page->index, fio, GFP_NOIO);
>>>>
>>>
>>> We're using ->mapping->host and ->index.  Ordinarily that would mean the page
>>> needs to be a pagecache page.  But bio_page can also be a compressed page or a
>>> bounce page containing fs-layer encrypted contents.
>>
>> I'm concerning about compression + inlinecrypt case.
>>
>>>
>>> Is your suggestion to keep using fio->page->mapping->host (since encrypted pages
>>
>> Yup,
>>
>>> don't have a mapping), but start using bio_page->index (since f2fs apparently
>>
>> I meant that we need to use bio_page->index as tweak value in write path to
>> keep consistent as we did in read path, otherwise we may read the wrong
>> decrypted data later to incorrect tweak value.
>>
>> - f2fs_read_multi_pages (only comes from compression inode)
>>  - f2fs_alloc_dic
>>   - f2fs_set_compressed_page(page, cc->inode,
>> 					start_idx + i + 1, dic);
>>                                         ^^^^^^^^^^^^^^^^^
>>   - dic->cpages[i] = page;
>>  - for ()
>>      struct page *page = dic->cpages[i];
>>      if (!bio)
>>        - f2fs_grab_read_bio(..., page->index,..)
>>         - f2fs_set_bio_crypt_ctx(..., first_idx, ..)   /* first_idx == cpage->index */
>>
>> You can see that cpage->index was set to page->index + 1, that's why we need
>> to use one of cpage->index/page->index as tweak value all the time rather than
>> using both index mixed in read/write path.
>>
>> But note that for fs-layer encryption, we have used cpage->index as tweak value,
>> so here I suggest we can keep consistent to use cpage->index in inlinecrypt case.
> 
> Yes, inlinecrypt mustn't change the ciphertext that gets written to disk.
> 
>>
>>> *does* set ->index for compressed pages, and if the file uses fs-layer
>>> encryption then f2fs_set_bio_crypt_ctx() won't use the index anyway)?
>>>
>>> Does this mean the code is currently broken for compression + inline encryption
>>> because it's using the wrong ->index?  I think the answer is no, since
>>
>> I guess it's broken now for compression + inlinecrypt case.
>>
>>> f2fs_write_compressed_pages() will still pass the first 'nr_cpages' pagecache
>>> pages along with the compressed pages.  In that case, your suggestion would be a
>>> cleanup rather than a fix?
>>
>> That's a fix.
>>
> 
> FWIW, I tested this, and it actually works both before and after your suggested
> change.  The reason is that f2fs_write_compressed_pages() actually passes the
> pagecache pages sequentially starting at 'start_idx_of_cluster(cc) + 1' for the
> length of the compressed cluster.  That matches the '+ 1' adjustment elsewhere,
> so we have fio->page->index == bio_page->index.

I've checked the code, yes, that's correct.

> 
> I personally think the way the f2fs compression code works is really confusing.
> Compressed pages don't have a 1:1 correspondence to pagecache pages, so there
> should *not* be a pagecache page passed around when writing a compressed page.

The only place we always use fio->page is:
- f2fs_submit_page_write
 - trace_f2fs_submit_page_write(fio->page,..)
  - f2fs__submit_page_bio
   __entry->dev		= page_file_mapping(page)->host->i_sb->s_dev;
   __entry->ino		= page_file_mapping(page)->host->i_ino;

For compression case, we can get rid of using this parameter because bio_page
(fio->compressed_page) has correct mapping info, however for fs-layer encryption
case, bio_page (fio->encrypted_page, allocated by fscrypt_alloc_bounce_page())
has not correct mapping info.

> 
> Anyway, here's the test script I used in case anyone else wants to use it.  But
> we really need to write a proper f2fs compression + encryption test for xfstests
> which decrypts and decompresses a file in userspace and verifies we get back the
> original data.  (There are already ciphertext verification tests, but they don't
> cover compression.)  Note that this test is needed even for the filesystem-layer
> encryption which is currently supported.

Yes, let me check how to make this testcase a bit later.

> 
> #!/bin/bash
> 
> set -e
> 
> DEV=/dev/vdb
> 
> umount /mnt &> /dev/null || true
> mkfs.f2fs -f -O encrypt,compression,extra_attr $DEV
> head -c 1000000 /dev/zero > /tmp/testdata
> 
> for opt1 in '-o inlinecrypt' ''; do
>         mount $DEV /mnt $opt1
>         rm -rf /mnt/.fscrypt /mnt/dir
>         fscrypt setup /mnt
>         mkdir /mnt/dir
>         chattr +c /mnt/dir
>         echo hunter2 | fscrypt encrypt /mnt/dir --quiet --source=custom_passphrase --name=secret
>         cp /tmp/testdata /mnt/dir/file
>         umount /mnt
>         for opt2 in '-o inlinecrypt' ''; do
>                 mount $DEV /mnt $opt2
>                 echo hunter2 | fscrypt unlock /mnt/dir --quiet
>                 cmp /mnt/dir/file /tmp/testdata
>                 umount /mnt
>         done
> done
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
