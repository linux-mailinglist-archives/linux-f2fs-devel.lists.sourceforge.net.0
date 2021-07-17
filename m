Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5D3CC3A6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jul 2021 15:44:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4kbd-0005eq-QM; Sat, 17 Jul 2021 13:43:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1m4kbS-0005ec-3x
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 13:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LtvisgyOL6o8S6prWoa7+r/wo7a6rAned5lX/FaCHH8=; b=gi6hCZNwUaG0eBn93ODyV9/fK7
 IsnFdhu6BRhvGle8RhOy9poMdJmEQM17LSIwvUKKtjGdt4dEYcDn4E3+/I1n6mU12RV9Oq58+VT0w
 tSzP2ec9Qpqa2h4ElwH4m2tRplxRnKma7H1SQ4o+dPzbNWkcRSyyZZisFNaEEDe58Blw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LtvisgyOL6o8S6prWoa7+r/wo7a6rAned5lX/FaCHH8=; b=OsGRwOg1Mzmvwx7u4/louTSJfX
 pDjrWzU1Z/9JIIBhH1IK6Xub2IWuCvpt3vGpMsJR/sULuKLyFEf/IyPBBO1yusEf7ZE/X2m5/h0EL
 IvStH5xi9vNvrgISuLPVh5q/CSnLis6Elvnk17l0Gn96Ma76/8jPROripKMiBEXSjs0s=;
Received: from mail-m17652.qiye.163.com ([59.111.176.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4kbJ-0004MQ-SL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 13:43:33 +0000
DKIM-Signature: a=rsa-sha256;
 b=AZBJtlrH+ns0Wmc11Ad0TcE6gQ+l2pyhsXrfKTZjuiOANzdCXmsTXWv/DnzLWJiWtA1bkgrrrhWGIch6pCBvP9CUBTERAczfMZ+bQTDBaiAn0uF0e+2taxeESKfBOE/tSvKXqEoAxzztMAHZgQGl33oa/O4a6ap9Ssjm8f+kliM=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=LtvisgyOL6o8S6prWoa7+r/wo7a6rAned5lX/FaCHH8=;
 h=date:mime-version:subject:message-id:from;
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17652.qiye.163.com (Hmail) with ESMTP id 2A0653C014C;
 Sat, 17 Jul 2021 21:25:46 +0800 (CST)
Message-ID: <AAoAygBXD7UuY6twAU03JKpm.3.1626528346162.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <2d651236-40de-2e7b-d6c6-9a18ce9a25ff@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 17 Jul 2021 21:25:46 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Sat, 17 Jul 2021 21:25:46 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpITE1WGR0ZTEMeQhpPQx
 0dVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OSUtDTExNTkpPN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6OhQ6Ahw5Iz9MLg4iTQ8MOi5LSDEwCxZVSFVKTUlNTklDSE9NT01DVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFOTUxMNwY+
X-HM-Tid: 0a7ab4a4f03dd9fckuws2a0653c014c
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1m4kbJ-0004MQ-SL
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH=5D_f2fs=3A_fix_ctx-=3Epos_in_f2fs?=
 =?utf-8?b?X3JlYWRfaW5saW5lX2Rpcigp?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

HI Chao,

From: Chao Yu <chao@kernel.org>
Date: 2021-07-17 16:56:01
To:  Yangtao Li <frank.li@vivo.com>,jaegeuk@kernel.org
Cc:  linux-kernel@vger.kernel.org,linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ctx->pos in f2fs_read_inline_dir()>On 2021/7/17 11:49, Yangtao Li wrote:
>> I recently found a case where de->name_len is 0 in f2fs_fill_dentries() easily reproduced,
>> and finally set the fsck flag.
>> 
>> Thread A					Thread B
>> 
>> f2fs_readdir
>> 	f2fs_read_inline_dir
>> 		ctx->pos = d.max
>> 						f2fs_add_dentry
>> 							f2fs_add_inline_entry
>> 								do_convert_inline_dir
>> 							f2fs_add_regular_entry
>> f2fs_readdir
>> 	f2fs_fill_dentries
>> 		set_sbi_flag(sbi, SBI_NEED_FSCK)
>> 
>> Process A opens the folder, and has been reading without closing it. During this period,
>> Process B created a file under the folder (occupying multiple f2fs_dir_entry, exceeding
>> the d.max of the inline dir). After creation, process A uses the d.max of inline dir to
>> read it again, and it will read that de->name_len is 0.
>
>Nice catch!
>
>> 
>> And returning early in f2fs_read_inline_dir will cause the process to be unable to see
>> the changes before reopening the file.
>> 
>> So don't return early and remove the modification of ctx->pos in f2fs_read_inline_dir().
>> 
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>> ---
>>   fs/f2fs/inline.c | 5 -----
>>   1 file changed, 5 deletions(-)
>> 
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>> index 56a20d5c15da..fc6551139a3d 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -729,9 +729,6 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
>>   
>>   	make_dentry_ptr_inline(inode, &d, inline_dentry);
>>   
>> -	if (ctx->pos == d.max)
>> -		return 0;
>> -
>>   	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
>>   	if (IS_ERR(ipage))
>>   		return PTR_ERR(ipage);
>> @@ -747,8 +744,6 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
>>   	make_dentry_ptr_inline(inode, &d, inline_dentry);
>>   
>>   	err = f2fs_fill_dentries(ctx, &d, 0, fstr);
>
>After this function, ctx->pos will point to start position of first free slot after
>last dir_entry, we can't guarantee that the free slot won't be used in above race
>condition, right?
>
>Moreover, w/o inline conversion, the race condition still can happen as below, right?
>
>dir_entry1: A
>dir_entry2: B
>dir_entry3: C
>free slot: _
>
>Before:
>AAAABBBB___
>         ^
>Thread B delete dir_entry2, and create dir_entry3.
>
>After:
>AAAACCCCC__
>         ^

Taking into account the above situations, I think this case where de->name_len is 0 in f2fs_fill_dentries()
should be normal and there is no way to avoid it. Maybe we shouldn't set fsck flag at this time?
Because the file system is not damaged.

MBR / Yangtao



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
