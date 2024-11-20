Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 501179D3D8B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2024 15:28:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDlgk-0006JW-Ph;
	Wed, 20 Nov 2024 14:28:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tDlgj-0006JO-T2
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 14:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k8FqI6bon1QS1nbiupJDYJ5P5cl8zCH5ATXfrWn/wQM=; b=AmHFhYoa8n8+mpOjN5nCKGr/FX
 4t7wzl8VJ+nU99AxYT7TQ9tabjxxAm8d312kL9DQGSto9pNbbz5x1+VzDMS1/Nf+kwnVP2tJCnP/L
 bTlhxLfE8m5/qKkGCxG8Mq2YuApW/DZnoSnLYjEeiJi1DQt3HmY7EI8Kzb4r1ciSOjiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k8FqI6bon1QS1nbiupJDYJ5P5cl8zCH5ATXfrWn/wQM=; b=GaVZ6qPh9ISeJ7gnhY8mp6ss4t
 fsxBruNMeKBa1UNP4Z+RdW6fsdTnqb+r58GFnBgdOW7JGW0Cma6eRJhPiqjPkzm0o7f36Mzr2GVby
 gkXFgFFlzxiuUclcvWxj8hsciEwnBahakpohoiuBz+oDGBWO3MWjM9CAf2CbiV8dEPjA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDlgi-0002Vy-1e for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 14:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732112880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k8FqI6bon1QS1nbiupJDYJ5P5cl8zCH5ATXfrWn/wQM=;
 b=AGibPK3E+CtvwAAX7dniWaaRKO/xDkl4P5rbqr1IopigIQoaPJ7Sbteujl4cMMJeh/Uv+5
 ca2IGEDIKyri5zaR3o/hqe52CCgBFafGFSf+3xXZSs99CW/IwMvOEA7NTUltTA8Trh+sFE
 cZ6AGh0oFtdwGngoL6FT1yJlDx7+Oo4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-aEcAY7Z9PzagU-8gTA0qfA-1; Wed, 20 Nov 2024 09:27:59 -0500
X-MC-Unique: aEcAY7Z9PzagU-8gTA0qfA-1
X-Mimecast-MFC-AGG-ID: aEcAY7Z9PzagU-8gTA0qfA
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a778ce76fbso26212745ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Nov 2024 06:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732112879; x=1732717679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k8FqI6bon1QS1nbiupJDYJ5P5cl8zCH5ATXfrWn/wQM=;
 b=kc4wlapKJmM4hUvgsd43nKjzP9NqGhfCw3jiuahfteMEPRFNVJb99O1bbexPsYEGZW
 7FXVRkBY7pMhLowT6FtPyRz6rz2lXNG7PB9+cEnv1VVMcO4pm3HACwaJyvd/KImP5zSo
 3UzalB9uMGY6cFLSn8k/HB6q4gPlt1m41WToTm3dpPxGlcpU86J4ZuC0Qhpbol5/BCYP
 /enSVI4XLxMYgtQECePKI59kw4YakqCNB55DSjQaBO/urLoMc5XsOA0W+6ViLY7709RM
 Sfw+rHrhph7RPlYODrs/6NYE03mWD99/3Rh5mNoyKXy3Un4/Mm3tDEuhtUM9k+tiuxZK
 +tsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4uljIbBilAHIiRo/1hVvDIEi7djFiSbTJl6MwsWKX0ywXDnaBLebW+8k8TLF1psM9hWHbZUMXkcj3rOE1oy5z@lists.sourceforge.net
X-Gm-Message-State: AOJu0YybAo/rGmtitmDDZ5Dc1//5b7IzA+F50pO1neVQ6hjtmI0CUeVs
 r9ig2HOd1mYOqZO7QJyucSUNFIPLdG6sHyLhjPddTK9bohzoPuU5qy1RACkgifCXYC41Tbwjq1S
 2nNWTLHW8D87ghiy5d0ugkpN83dw0B/vveH0hTRY+7kdIvgyqOSqpOwkYinqX8LkFVgdW2kDb1+
 0=
X-Received: by 2002:a05:6e02:b21:b0:3a7:6825:409d with SMTP id
 e9e14a558f8ab-3a7862bdeb2mr30647435ab.0.1732112878956; 
 Wed, 20 Nov 2024 06:27:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBqdKIPt9WPJWK5kvNRHw1ul4I/pgYBloYCTR7r3E0Kf9ycgztAK7c2iqmaxbfhxQuCnm+5A==
X-Received: by 2002:a05:6e02:b21:b0:3a7:6825:409d with SMTP id
 e9e14a558f8ab-3a7862bdeb2mr30647265ab.0.1732112878678; 
 Wed, 20 Nov 2024 06:27:58 -0800 (PST)
Received: from [10.0.0.71] ([65.128.99.169]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a74c2b477esm29631795ab.11.2024.11.20.06.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 06:27:58 -0800 (PST)
Message-ID: <493ce255-efcd-48af-ad7f-6e421cc04f1c@redhat.com>
Date: Wed, 20 Nov 2024 08:27:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
 <ZzPLELITeOeBsYdi@google.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <ZzPLELITeOeBsYdi@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7XOM3EhF_zjvRBYeZKBzsVpRAPyg-YO9_t4y-oYfboM_1732112879
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/12/24 3:39 PM, Jaegeuk Kim wrote: > Hi Eric, > > Could
 you please check this revert as it breaks the mount()? > It seems F2FS needs
 to implement new mount support. > > Thanks, I'm sorry, I missed this email.
 I will look into it more today. 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDlgi-0002Vy-1e
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/12/24 3:39 PM, Jaegeuk Kim wrote:
> Hi Eric,
> 
> Could you please check this revert as it breaks the mount()?
> It seems F2FS needs to implement new mount support.
> 
> Thanks,

I'm sorry, I missed this email. I will look into it more today.

As for f2fs new mount API support, I have been struggling with it for a
long time, f2fs has been uniquely complex. The assumption that the superblock
and on-disk features are known at option parsing time makes it much more
difficult than most other filesystems.

But if there's a problem/regression with this commit, I have no objection to
reverting the commit for now, and I'm sorry for the error.

-Eric

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
>>  fs/f2fs/super.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 49519439b770..35c4394e4fc6 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -150,6 +150,8 @@ enum {
>>  	Opt_mode,
>>  	Opt_fault_injection,
>>  	Opt_fault_type,
>> +	Opt_lazytime,
>> +	Opt_nolazytime,
>>  	Opt_quota,
>>  	Opt_noquota,
>>  	Opt_usrquota,
>> @@ -226,6 +228,8 @@ static match_table_t f2fs_tokens = {
>>  	{Opt_mode, "mode=%s"},
>>  	{Opt_fault_injection, "fault_injection=%u"},
>>  	{Opt_fault_type, "fault_type=%u"},
>> +	{Opt_lazytime, "lazytime"},
>> +	{Opt_nolazytime, "nolazytime"},
>>  	{Opt_quota, "quota"},
>>  	{Opt_noquota, "noquota"},
>>  	{Opt_usrquota, "usrquota"},
>> @@ -922,6 +926,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>  			f2fs_info(sbi, "fault_type options not supported");
>>  			break;
>>  #endif
>> +		case Opt_lazytime:
>> +			sb->s_flags |= SB_LAZYTIME;
>> +			break;
>> +		case Opt_nolazytime:
>> +			sb->s_flags &= ~SB_LAZYTIME;
>> +			break;
>>  #ifdef CONFIG_QUOTA
>>  		case Opt_quota:
>>  		case Opt_usrquota:
>> -- 
>> 2.47.0.277.g8800431eea-goog
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
