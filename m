Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570E6D5639
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 03:44:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjVj7-0007Eb-FH;
	Tue, 04 Apr 2023 01:44:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjVj4-0007EV-U7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 01:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M8o/nm6EdQLwbh92XM6WjwAuVlYp69Bu2tplHYa3p5A=; b=l+dMxGaU91Vlv3Tj6PzNgNYCNC
 nrmYE0gmB5P3nwC4AVDpol5AMCq0xC04uRHuzaQgWNiEZpRATSm+LqCZlnqrGQAyZg077OvOCMspj
 h7koccN+VqOiIGe68+N/MwAA/ulr8ISezYSYWvzbSPWI5JU5cFYnSxrRYPRUQ9aLykJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8o/nm6EdQLwbh92XM6WjwAuVlYp69Bu2tplHYa3p5A=; b=P1TOWnDAkS8i/v47FuyLPTXHpZ
 8d5uiQIVUVjQ80KNSDX1rE+MDQH1+JqAAEz3ECixV8Ay681iJADznmi5b2mrHfMpuSUt9p4MJVFg/
 3zlUqyoxXcoPUm8vywtpWw6Y6eN5WnEh/x+POibfSqTnUAKfd0fKt1GDqiljj6/CZ1a0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjVj5-00EBDm-34 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 01:44:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB4FD61F8D;
 Tue,  4 Apr 2023 01:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F47AC433EF;
 Tue,  4 Apr 2023 01:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680572681;
 bh=exwk2t7snWJmtT+uSVR7FwHn+JnLEMsJrmvzsUtNEWQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HHYYZ+MbOXgUJTKi7BtmUnpbJtRT5xsu6uRLk/uT6g6htCwCWG2r4f3iR1RwIWofg
 sLtEUuoU1bEjbzNOtraMo/pKj0zmGdRlIDFe9YqWrw6i55ptIruH4C5xGZxp+EM27S
 9pMWiOv9Jp57PRD/klLIptmf6ACEq1UUKQr/OVq1o7n3grvRYCzzC4VcybfLwtPZG9
 cd0PIuQUn7IQdXwnTU/uJluODwjBWFglpfM0HViscDR36J0f6xZyWhOBHQjhywUMrP
 RUKP4KhHULcXZow78Em2+LtwO615BNX0B2bDd2GRgvhsUg5xyZqeu6BnyYTvPk51ih
 /0daR/x4F400A==
Message-ID: <79aec97f-e49f-63c8-13a6-85e1207250d3@kernel.org>
Date: Tue, 4 Apr 2023 09:44:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230330173127.46900-1-frank.li@vivo.com>
 <ZCsPfukvFHhiI6vN@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCsPfukvFHhiI6vN@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 1:40, Jaegeuk Kim wrote: > On 03/31, Yangtao Li
 wrote: >> This patch support noage_extent_cache mount option. >> >>
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> >> --- >> Documentation/fi [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjVj5-00EBDm-34
Subject: Re: [f2fs-dev] [PATCH] f2fs: support to show noage_extent_cache
 mount option
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

On 2023/4/4 1:40, Jaegeuk Kim wrote:
> On 03/31, Yangtao Li wrote:
>> This patch support noage_extent_cache mount option.
>>
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>> ---
>>   Documentation/filesystems/f2fs.rst | 2 ++
>>   fs/f2fs/super.c                    | 7 +++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>> index a81c896464ff..75505ab88de8 100644
>> --- a/Documentation/filesystems/f2fs.rst
>> +++ b/Documentation/filesystems/f2fs.rst
>> @@ -352,6 +352,8 @@ age_extent_cache	 Enable an age extent cache based on rb-tree. It records
>>   			 data block update frequency of the extent per inode, in
>>   			 order to provide better temperature hints for data block
>>   			 allocation.
>> +noage_extent_cache		 Disable an age extent cache based on rb-tree, see
>> +			 the above age_extent_cache mount option.
> 
> Hmm, why do we need?

Hi Yangtao,

Please check the reason why we need to add no{inline_data, extent_cache, ...} mount
option as below:

commit 75342797988a0f9ebec400a2dde8d4de581c4079
Author: Wanpeng Li <wanpeng.li@linux.intel.com>
Date:   Tue Mar 24 10:20:27 2015 +0800

     f2fs: enable inline data by default

     Enable inline_data feature by default since it brings us better
     performance and space utilization and now has already stable.
     Add another option noinline_data to disable it during mount.

Thanks,

> 
>>   ======================== ============================================================
>>   
>>   Debugfs Entries
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index b5828a67f7c1..8bd9953ea7e3 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -165,6 +165,7 @@ enum {
>>   	Opt_discard_unit,
>>   	Opt_memory_mode,
>>   	Opt_age_extent_cache,
>> +	Opt_noage_extent_cache,
>>   	Opt_err,
>>   };
>>   
>> @@ -244,6 +245,7 @@ static match_table_t f2fs_tokens = {
>>   	{Opt_discard_unit, "discard_unit=%s"},
>>   	{Opt_memory_mode, "memory=%s"},
>>   	{Opt_age_extent_cache, "age_extent_cache"},
>> +	{Opt_noage_extent_cache, "noage_extent_cache"},
>>   	{Opt_err, NULL},
>>   };
>>   
>> @@ -1269,6 +1271,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   		case Opt_age_extent_cache:
>>   			set_opt(sbi, AGE_EXTENT_CACHE);
>>   			break;
>> +		case Opt_noage_extent_cache:
>> +			clear_opt(sbi, AGE_EXTENT_CACHE);
>> +			break;
>>   		default:
>>   			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>>   				 p);
>> @@ -1974,6 +1979,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>>   		seq_puts(seq, ",noextent_cache");
>>   	if (test_opt(sbi, AGE_EXTENT_CACHE))
>>   		seq_puts(seq, ",age_extent_cache");
>> +	else
>> +		seq_puts(seq, ",noage_extent_cache");
>>   	if (test_opt(sbi, DATA_FLUSH))
>>   		seq_puts(seq, ",data_flush");
>>   
>> -- 
>> 2.35.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
