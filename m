Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5302893CC3B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 03:07:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX9QE-00059d-Kz;
	Fri, 26 Jul 2024 01:07:03 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sX9QD-00059V-TL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rISMAt/C+JgnYoIEzQsKGS5s1UkGVph39uYtiV6iQRk=; b=jzKcZwINadXyKVkArlGR0GCc4z
 geUo3VIKS3JLHyqarwRvckWNLDrf3Ls/Wzz/l0hJjxEY6tp8jWEs7tmqEw2F4yQXhmC7+KcWm92So
 gbaQ9HzzpvsAqXR/QHomGiDVFuuueZ+T39MngKz7FcV8cC6EncyGakHd+0SQj2917K2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rISMAt/C+JgnYoIEzQsKGS5s1UkGVph39uYtiV6iQRk=; b=BpiPfQoWkISCObyF18s/wMSyFe
 vqpeBasv1V/6MQw48r781cl+2j4gT2ouKY1QvCNzOhSQNXgPB78TcGnaDbQpymhmtP4N4a2iTkE0+
 qiAcJz3T4id3T/M9D/WAAse9/2WlyAhzYsfLBhVDd36oUX45hIfDQfXAEihz5Of5An48=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX9QD-0002f4-R4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 757AB6059A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jul 2024 01:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C3EC116B1;
 Fri, 26 Jul 2024 01:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721956016;
 bh=IbKbKcOeVqGJZe9WNNAvQn9N7nJIqkoELDjo9ILDPzU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ofMW0sDdlBiiwD7C05wAaJT0Q/0uosF4Brk/XMN2/U4p9/TkfdS7SEuLJQxGmf9kB
 moqBh9jctQj+fdTYX2Bp+Y9viqUTrurFV3fZZLHewTzVEHOeiKWvMQJd+xhxVVbCNV
 bBamCEp5kAiJSeZZN7xevRDDDJqdg0IPHHrBXdEp8dBT2OT31lRtrdAmiHgr+aUSN4
 cS3UKgBqRdf45g0EHgVneb+SHmyqYO9ldK7tnUuKv7hN2qTKRZA6KOjP1JtUHnNguS
 MUeYz+TfGnfDzPLffjubDWgA05jeXfE3Zdq44dmkZ+fEjk2N6T7GfrUSswSaASDx61
 zSW4ZB8l1A//Q==
Message-ID: <ef08e1e5-94af-4944-aaed-37705360bcd6@kernel.org>
Date: Fri, 26 Jul 2024 09:06:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240625031351.3586955-1-chao@kernel.org>
 <20240625031351.3586955-3-chao@kernel.org> <ZqK7eC9W9HVweTOJ@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZqK7eC9W9HVweTOJ@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/26 4:54, Jaegeuk Kim wrote: > On 06/25, Chao Yu
 wrote: >> We should always truncate pagecache while truncating on-disk data.
 >> >> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX9QD-0002f4-R4
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: atomic: fix to truncate pagecache
 before on-disk metadata truncation
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

On 2024/7/26 4:54, Jaegeuk Kim wrote:
> On 06/25, Chao Yu wrote:
>> We should always truncate pagecache while truncating on-disk data.
>>
>> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/file.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 2203904383a6..0355cb054521 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2185,6 +2185,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>   		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>>   	} else {
>>   		/* Reuse the already created COW inode */
>> +		truncate_setsize(inode, 0);
> 
> 		fi->cow_inode?

Oh, yes, let me fix this.

Thanks,

> 
>>   		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>>   		if (ret) {
>>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
