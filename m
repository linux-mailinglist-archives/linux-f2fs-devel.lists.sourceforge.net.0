Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C69D1E0C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 03:19:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDDpa-00052O-F3;
	Tue, 19 Nov 2024 02:19:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tDDpa-00052I-0p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 02:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2oY2mOhtqUJW45mzRstdhvtu1w2yJ/TdYMyKWZ3x+qk=; b=LDZpWgqjZmlMoyEqD8veQApKpu
 byC0K3aZlQNTX9OrcsKNu6djwcsrxX10BDaJO90PZMEN6jtld1L0UFu9bXYEj6PTaMF5EjWQug0S5
 q/5kHiiaiTO7gaKFUfUK3+delYs8b6HJzLtBt4MazRGQ7Tai4vQJ3I0QOM4ErVyN/1kU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2oY2mOhtqUJW45mzRstdhvtu1w2yJ/TdYMyKWZ3x+qk=; b=lEG1BE8GtYENqopt+zc3kMAkJ0
 cW0dtnvKfW7vCgOueC9SbAnIY6SSyG0DrS38XrxY5XoFYC7gJBr9wIW7IZvJuwq+V90x0wM/pOkL1
 rCaOGb+LhHcZuL4SFNZgRSqAYyxojIljDKWmFOhWPxpo9FnvHfAt6waC7Mb4PXGH6IIg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDDpY-0000kD-Mq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 02:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5030D5C58BA;
 Tue, 19 Nov 2024 02:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78951C4CECC;
 Tue, 19 Nov 2024 02:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731982734;
 bh=v5VMew2qGtig/6ECVnvo9mQpQhRggvGkbsg6KajwpFs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CeGKogOTaUYoeWfg7QGvH0GBbkFufN7EfenGNl83dus5KO4aauIJAnNzRNILSZwKH
 Hzljl4Lu21lNjy6ujgJEbWrWJLDXlkK5B9CEvd6mYZOwBRybyUffCZn8gf6KQJL42C
 R+zKId5UlnzTFCZoNkl/c8LZa9tasYMpeaTlbtNflzj+j/JevflOIaf2Wzb5Kjvi15
 NltG6VXTLF98Szz1XefbYTmHe/HDiXTvmeuWcZQEDQrJ66XfYiXHl/ZYtGJhRGCdl3
 gEFoKtl7LcDyAyAtqIBioC7sO9SZxvw+Ds7s4Vg3TAlREJc0nGvq71tmMjHwNhkvHg
 JQJjYVqAGer1g==
Message-ID: <2d26eeee-01f7-445b-a1d2-bc2de65b5599@kernel.org>
Date: Tue, 19 Nov 2024 10:18:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
 <ZzPLELITeOeBsYdi@google.com>
Content-Language: en-US
In-Reply-To: <ZzPLELITeOeBsYdi@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/13 5:39, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Hi Eric, > > Could you please check this revert as it breaks the mount()?
 > It seems F2FS needs to implement new mount support. Hi all, Actually, if
 we want to enable lazytime option, we can use mount syscall as: 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDDpY-0000kD-Mq
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove unreachable lazytime
 mount option parsing"
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
Cc: linux-f2fs-devel@lists.sourceforge.net, stable@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/13 5:39, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Hi Eric,
> 
> Could you please check this revert as it breaks the mount()?
> It seems F2FS needs to implement new mount support.

Hi all,

Actually, if we want to enable lazytime option, we can use mount
syscall as:

mount("/dev/vdb", "/mnt/test", "f2fs", MS_LAZYTIME, NULL);

or use shell script as:

mount -t f2fs -o lazytime /dev/vdb /mnt/test

IIUC, the reason why mount command can handle lazytime is, after
8c7f073aaeaa ("libmount: add support for MS_LAZYTIME"), mount command
supports to map "lazytime" to MS_LAZYTIME, and use MS_LAZYTIME in
parameter @mountflags of mount(2).

So, it looks we have alternative way to enable/disable lazytime feature
after removing Opt_{no,}lazytime parsing in f2fs, do we really need this
revert patch?

Thanks,

> 
> Thanks,
> 
> On 11/12, Jaegeuk Kim wrote:
>> This reverts commit 54f43a10fa257ad4af02a1d157fefef6ebcfa7dc.
>>
>> The above commit broke the lazytime mount, given
>>
>> mount("/dev/vdb", "/mnt/test", "f2fs", 0, "lazytime");
>>
>> CC: stable@vger.kernel.org # 6.11+
>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> ---
>>   fs/f2fs/super.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 49519439b770..35c4394e4fc6 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -150,6 +150,8 @@ enum {
>>   	Opt_mode,
>>   	Opt_fault_injection,
>>   	Opt_fault_type,
>> +	Opt_lazytime,
>> +	Opt_nolazytime,
>>   	Opt_quota,
>>   	Opt_noquota,
>>   	Opt_usrquota,
>> @@ -226,6 +228,8 @@ static match_table_t f2fs_tokens = {
>>   	{Opt_mode, "mode=%s"},
>>   	{Opt_fault_injection, "fault_injection=%u"},
>>   	{Opt_fault_type, "fault_type=%u"},
>> +	{Opt_lazytime, "lazytime"},
>> +	{Opt_nolazytime, "nolazytime"},
>>   	{Opt_quota, "quota"},
>>   	{Opt_noquota, "noquota"},
>>   	{Opt_usrquota, "usrquota"},
>> @@ -922,6 +926,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   			f2fs_info(sbi, "fault_type options not supported");
>>   			break;
>>   #endif
>> +		case Opt_lazytime:
>> +			sb->s_flags |= SB_LAZYTIME;
>> +			break;
>> +		case Opt_nolazytime:
>> +			sb->s_flags &= ~SB_LAZYTIME;
>> +			break;
>>   #ifdef CONFIG_QUOTA
>>   		case Opt_quota:
>>   		case Opt_usrquota:
>> -- 
>> 2.47.0.277.g8800431eea-goog
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
