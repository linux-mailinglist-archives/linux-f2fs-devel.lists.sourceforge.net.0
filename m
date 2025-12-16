Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01095CC11EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 07:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xovU2s2AbEtBt+cmv5HrAvFOKkujUy+JmiPvIpkXSxk=; b=exv0Iy3bf5Dyxxyd9rnmp9jTet
	jyc4sMjlay2eZ18nvmeXbOdPIBPFHtSC66y9jF3dwu7i5H0XXINrxfAd2OCUBw/CgykOhzl4N6zI4
	8F+LHUZnfUBG3YC2WGdHJ3yoTcJ0ydQk+BznXMFkc2B4XEE69RJ9ztuQ/VJYF4JhNfAQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVOdA-00089Z-EJ;
	Tue, 16 Dec 2025 06:33:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vVOd9-00089S-Cy
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 06:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TfKPhnx60akfNxyJ/aqeegiUIF2ZH2pRJ6QtxR19fZE=; b=eAJxUet97+PmoOk88MWhF5sPKU
 n2sKerH8iE70+bISyTsj7YioD91ULdf1/fRuV19oTHVyqusS/MO19zAmKcQQY7KsqWJ3qF0HrbwWm
 UMjwgRD20P9ikxBs8d+QQSCGI53G4nzswa3j3yijLJt5ZzcQeRxgsbjirsjrfYrLLaQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TfKPhnx60akfNxyJ/aqeegiUIF2ZH2pRJ6QtxR19fZE=; b=VKHKnT9e0Qwp0Qre2CehVfaHX1
 xxF4oZNcWeVtYBWSBopTJqujSR0HJ5vOExALdWklSCu+jy7k6/gGyg/ZsR1yNjlF7xPJHly98JCer
 O5DO4xa2TAy8QGRtJX5xP0vivuumzQP53GgoKUTV91uix65jQ7Eq9AIhjickqITZ1bpI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVOd8-0000AP-Rn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 06:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BFA4416F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 06:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3297DC4CEF1;
 Tue, 16 Dec 2025 06:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765866829;
 bh=GA+ogczR6iBkq9u32X3ZoZpJtKecUKn+5hUZDqfB4Oc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=C9Y2/hDEtCblSJroeWMf3DjZyghfVm4b83kN2rQ+kwEwF+GXTtn8WfhcNi/GRxMWQ
 yneGr/hiOH6VQMOsgr9tfyhl/Xtmn9glBodBuUS72D9xqtQXzjeVGS1OQ1Uh3mXLAN
 9edtdbaXIoY13WnRwkPPhsmwp3s0NS9S8MgMvwgCfW7f0Tyw7mI4i6grX5IFuZHQ8L
 gY6+dD3zmc5HFyKkKMHwlmzIcsAakKJLn22Hc9ta42WYfvUkdIjbuH5YQ74IJogPmj
 NjEirEWBMRZOBYsPazsknlqGFxbGH6KvQH8Um6KWmnsEkNdjLfSU3FRbMMQy4jBsdf
 8I1ANFJVU8MyQ==
Message-ID: <81f16443-c980-4834-b5ef-4f4c4a7f9f3e@kernel.org>
Date: Tue, 16 Dec 2025 14:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
 <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
 <aUCsvFUE0vF5ziX9@google.com>
Content-Language: en-US
In-Reply-To: <aUCsvFUE0vF5ziX9@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16/25 08:50, Jaegeuk Kim wrote: > On 12/15, Chao Yu
 wrote: >> On 12/12/25 08:55,
 Jaegeuk Kim via Linux-f2fs-devel wrote: >>> Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> >>> --- >>> tools/f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVOd8-0000AP-Rn
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: add mlock() option in the read
 test
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/16/25 08:50, Jaegeuk Kim wrote:
> On 12/15, Chao Yu wrote:
>> On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
>>> index 4429e0b0459c..08f3c9b79cdf 100644
>>> --- a/tools/f2fs_io/f2fs_io.c
>>> +++ b/tools/f2fs_io/f2fs_io.c
>>> @@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
>>>  "  dontcache: buffered IO + dontcache\n"		\
>>>  "  dio      : direct IO\n"				\
>>>  "  mmap     : mmap IO\n"				\
>>> +"  mlock    : mmap + mlock\n"				\
>>>  "  madvise  : mmap + mlock2 + madvise\n"		\
>>>  "  fadvise  : mmap + fadvise + mlock\n"			\
>>>  "advice can be\n"					\
>>> @@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>>>  	u64 mlock_time_start = 0, mlock_time_end = 0;
>>>  	int flags = 0;
>>>  	int do_mmap = 0;
>>> +	int do_mlock = 0;
>>>  	int do_fadvise = 0;
>>>  	int do_madvise = 0;
>>>  	int do_dontcache = 0;
>>> @@ -981,6 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>>>  		flags |= O_DIRECT;
>>>  	else if (!strcmp(argv[4], "mmap"))
>>>  		do_mmap = 1;
>>> +	else if (!strcmp(argv[4], "mlock"))
>>> +		do_mlock = 1;
>>>  	else if (!strcmp(argv[4], "madvise"))
>>>  		do_madvise = 1;
>>>  	else if (!strcmp(argv[4], "fadvise"))
>>> @@ -1027,6 +1031,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
>>>  		mlock_time_end = get_current_us();
>>>  		read_cnt = count * buf_size;
>>>  		memcpy(print_buf, data, print_bytes);
>>> +	} else if (do_mlock) {
>>> +		data = mmap(NULL, count * buf_size, PROT_READ,
>>> +				MAP_SHARED, fd, offset);
>>> +		if (data == MAP_FAILED)
>>> +			die("Mmap failed");
>>> +
>>> +		io_time_start = get_current_us();
>>
>> mlock_time_start = get_current_us();
> 
> This is when IO happens, so IO.

Okay, but it seems later we will print "mlock time = 0" which doesn't match the code?

Thanks,

> 
>>
>>> +		if (mlock(data, count * buf_size))
>>> +			die_errno("mlock failed");
>>> +		io_time_end = get_current_us();
>>
>> mlock_time_end = get_current_us();
>>
>> Thanks,
>>
>>> +		read_cnt = count * buf_size;
>>> +		memcpy(print_buf, data, print_bytes);
>>>  	} else if (do_madvise) {
>>>  		data = mmap(NULL, count * buf_size, PROT_READ,
>>>  				MAP_SHARED, fd, offset);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
