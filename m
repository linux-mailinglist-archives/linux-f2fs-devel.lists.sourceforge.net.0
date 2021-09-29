Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5A41BB8F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Sep 2021 02:05:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVN6J-00048p-Q0; Wed, 29 Sep 2021 00:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mVN6I-00048f-PP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Sep 2021 00:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f4ga4pG5YVNTn8jinlKH2Jfof239PU8fMemQf62X/kQ=; b=N86g61ShXxBlQ5bEa0KAxUDsX7
 DMEB3bjcEs3VKxnokcgt36gBPimCgvxlbCQU570P77KAfEV209Kr1pBW41a85EaGt0l+kP9l1bcg/
 FLrwNIkB8tVpGQGJn14aJci0JXTsAnKgdwmzs5dfYTFcjpPiC3w72FmWzmq8Cj0sS5RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f4ga4pG5YVNTn8jinlKH2Jfof239PU8fMemQf62X/kQ=; b=WHaz+JtHyi0Lc+km5Zv1HQ5QqB
 BdjtiihLjqV3jVsM6Q4mkuFMTbGROUARcRo0zlbrDdarT+pUGaPRGtTTH7t8Ox2D7sEobphBP0Fjj
 1mQ9ptanf7QPpx3gB6uEmW7YdHvAqSgdwsu/RSm4f9glp9MiGsgco4neT28HNFy7DCf0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mVN6G-0003cP-V2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Sep 2021 00:05:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F26561357;
 Wed, 29 Sep 2021 00:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632873913;
 bh=UR8mhaZAktczckqcX1PnjQA6DuF3fDOJXNa+Z/PJeFY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cj6LsqPDLb5dIheuh9WcdqaMEXOa+zisI1IQe4/8hW/reYkyOccUL2//w0XYiUve0
 NDHFxqj7/yDbmuKYHU4wYLrY8vW/oXOkpP1fGoFXqgtm4gPJL74wUmIAzazVPD+9aH
 A9jH6xIyqM3oYsr8t6mR+Di8lY+zzVJJPeRzwiV23g/j56Y/CHX8fTocrKANVF6Z1z
 wideb00Rcog3BgNJIEo7+7PKOjf9bdXTv2PnuduK07HBcwx+VrKn7JXQGc3HH2Nzyb
 l0M0EIbyW26dtRkpKCEYWtGJjPL31EtR88TaiaG1x9c1ro6xsRiiAyK5Pcw5lJrM4e
 PhU9xSxRqMA7Q==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
Date: Wed, 29 Sep 2021 08:05:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVNoHudG5c65X85G@google.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/29 3:08, Jaegeuk Kim wrote: > On 09/28, Chao Yu
 wrote: >> In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to >> check
 whethere it is overwrite case, for such case, we can skip >> f2 [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mVN6G-0003cP-V2
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/29 3:08, Jaegeuk Kim wrote:
> On 09/28, Chao Yu wrote:
>> In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to
>> check whethere it is overwrite case, for such case, we can skip
>> f2fs_preallocate_blocks() in order to avoid f2fs_do_map_lock(),
>> which may be blocked by checkpoint() potentially.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/file.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 13deae03df06..51fecb2f4db5 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4321,6 +4321,10 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>   		preallocated = true;
>>   		target_size = iocb->ki_pos + iov_iter_count(from);
>>   
>> +		if (f2fs_overwrite_io(inode, iocb->ki_pos,
>> +						iov_iter_count(from)))
>> +			goto write;
> 
> This calls f2fs_map_blocks() which can be duplicate, if it's not the overwirte
> case. Do we have other benefit?

f2fs_overwrite_io() will break for append write case w/ below check:

	if (pos + len > i_size_read(inode))
		return false;

I guess we may only suffer double f2fs_map_blocks() for write hole
case, e.g. truncate to large size & write inside the filesize. For
this case, how about adding a condition to allow double f2fs_map_blocks()
only if write size is smaller than a threshold?

Thanks,

> 
>> +
>>   		err = f2fs_preallocate_blocks(iocb, from);
>>   		if (err) {
>>   out_err:
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
