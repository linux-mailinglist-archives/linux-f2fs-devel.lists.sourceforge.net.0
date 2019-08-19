Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4A91B73
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 05:25:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzYHv-0007qA-RQ; Mon, 19 Aug 2019 03:24:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hzYHu-0007q1-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 03:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:CC:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pwLsVYQColRKjjToNNdiFwcBAbrGJhZpm0VgAaAy6lk=; b=RqgwN+ldHhDlojjZUr+VUUeL4K
 hwWEhFPBw0A15bhkyVc/9lBr0it/vt6OAyFqWEn8IRGS6QoKdBWB6nCEhj2knx9eW0FQCgKsCHENO
 lC/FPoWHwH1zG5cuH5S0acv/9iRveQo3eAX1KqzjUj0GLcUMOe/SAF/cvjAY2xGo1ihc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:CC:From:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pwLsVYQColRKjjToNNdiFwcBAbrGJhZpm0VgAaAy6lk=; b=MYixJyyXrvFPDnPxcBLbpYDLc2
 oVg1L6jkAfwoDhR45VU+8asxt0XuDqcj9nDeKMaQT9ZUO/DY1gsSuoMKr+BZFDg5sY5/n+crvDY6i
 mHCaME0GFY1lul36FwlLhfWyJPJ1FcW9YJbw9aqWs8l3FfqQQHGlF1XI+78KSttr4CU0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzYHr-007pmE-HE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 03:24:54 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4D37C695DE7C59D35AA4;
 Mon, 19 Aug 2019 11:24:43 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 19 Aug
 2019 11:24:41 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20190816055539.30420-1-ebiggers@kernel.org>
 <20190816055539.30420-3-ebiggers@kernel.org>
 <d6022f8b-2d75-4e9d-882e-038551684c37@huawei.com>
 <20190818154138.GA1118@sol.localdomain>
 <3f3fa304-2ce0-7773-7335-30f8e3c5b5d5@huawei.com>
 <808dc7d9-01c3-7883-431a-8f3532adec09@huawei.com>
 <20190819025545.GA1223@zzz.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <02e2590d-a3f9-7d7b-c43a-e9bda1bee455@huawei.com>
Date: Mon, 19 Aug 2019 11:24:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190819025545.GA1223@zzz.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hzYHr-007pmE-HE
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: fix copying too many bytes in
 FS_IOC_SETFSLABEL
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/19 10:55, Eric Biggers wrote:
> On Mon, Aug 19, 2019 at 09:58:30AM +0800, Chao Yu wrote:
>> On 2019/8/19 9:33, Chao Yu wrote:
>>> On 2019/8/18 23:41, Eric Biggers wrote:
>>>> On Fri, Aug 16, 2019 at 02:59:37PM +0800, Chao Yu wrote:
>>>>> On 2019/8/16 13:55, Eric Biggers wrote:
>>>>>> From: Eric Biggers <ebiggers@google.com>
>>>>>>
>>>>>> Userspace provides a null-terminated string, so don't assume that the
>>>>>> full FSLABEL_MAX bytes can always be copied.>
>>>>>> Fixes: 61a3da4d5ef8 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
>>>>>
>>>>> It may only copy redundant zero bytes, and will not hit security issue, it
>>>>> doesn't look like a bug fix?
>>>>>
>>>>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>>>>
>>>>> Anyway, it makes sense to me.
>>>>>
>>>>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>>>
>>>>
>>>> It's not clear that userspace is guaranteed to provide a full FSLABEL_MAX bytes
>>>> in the buffer.  E.g. it could provide "foo\0" followed by an unmapped page.
>>>
>>> You're right, thanks for your explanation.
>>
>> One more question, there is no validation check on length of user passed buffer,
>>
>> So in most ioctl interfaces, user can pass a buffer which has less size than we
>> defined intentionally/unintentionally.
>>
>> E.g.
>>
>> user space:
>>
>> struct f2fs_defragment_user {
>> 	unsigned long long start;
>> //	unsigned long long len;
>> };
>>
>> main()
>> {
>> 	struct f2fs_defragment_user *df;
>>
>> 	df = malloc();
>> 	
>> 	ioctl(fd, F2FS_IOC_DEFRAGMENT, df);
>> }
>>
>> kernel:
>>
>> f2fs_ioc_defragment()
>> {
>> ...
>> 	if (copy_from_user(&range, (struct f2fs_defragment __user *)arg,
>> 							sizeof(range)))
>> 		return -EFAULT;
>> }
>>
>> Is that a common issue?
>>
> 
> No, but that's different because that only involves a fixed-length struct.
> 
> My concern was that since FS_IOC_SETFSLABEL takes in a string, users might do:
> 
> 	ioctl(fd, FS_IOC_SETFSLABEL, "foo");

Yes, I can understand your concern, since in this case, user's behavior is normal.

But what I'm trying to say is, from the result aspect, when user pass a buffer
which has less size intentionally/unintentionally (even kernel defines a
fix-sized struture, but there is no rules that users can not reconstruct it or
change its size as their wish), kernel may access unmapped page follows to
user's buffer potentially. It needs to be fixed if that's a real problem.

Thanks,

> 
> Rather than:
> 
> 	char label[FSLABEL_MAX] = "foo";
> 
> 	ioctl(fd, FS_IOC_SETFSLABEL, label);
> 
> At least that's how I understand the ioctl; AFAICS it does not have a man page,
> so I'm not sure what was intended.  Assuming the buffer is always FSLABEL_MAX
> bytes seems like a really bad idea though, since if users pass a conventional
> string (as is the natural thing to do; open() doesn't require a buffer of length
> PATH_MAX, for example...) it will succeed/fail at random depending on whether
> the following page is mapped or not.
> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
