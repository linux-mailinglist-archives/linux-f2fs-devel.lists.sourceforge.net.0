Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 343207130D4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 May 2023 02:16:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2hbk-0006BE-LC;
	Sat, 27 May 2023 00:16:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2hbi-0006B8-Oa
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 00:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=POWTz/mI8lYNPya8uxKZSPcyvZiSZmMXWss6jg3fhZI=; b=Qmum0pqVDDu/SkoNYqe4xmUFOF
 uJmmX3YnkLj0HlWpXBCQEhc2VpwmpxokuI53bZHE8gGUC9cuDM+nNGjW1grR3J2M51f2BILBVcYKb
 d/T9F5p7XpstEtWveWwOGRTUMY3Yw46pJmXbamwcXmlwuLWEgdh3oD7On56Jh9qqmAnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=POWTz/mI8lYNPya8uxKZSPcyvZiSZmMXWss6jg3fhZI=; b=LihpdDSGA+N7+wGvoLZ2vpQVa+
 S6yKGdgmfroruN+3xqAZclUXU0fUbM70lDxWReTbhKSQ08dhtsQ7LlQjWf3cN0LAoXUTPce9alSA5
 hSJal/moTzT6yLy3xSmOKsCm7keP/ceiBjEFh9gANoyrdDx9xHvMxrpWbQP0NjGg57/o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2hbj-003j3j-17 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 00:16:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DB96616E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 May 2023 00:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFCFC433EF;
 Sat, 27 May 2023 00:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685146585;
 bh=uXodg+c3MWiGRK02PSAnRVOXRm4oRfT1pXHIZJVJ+YQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FYk+F9+TuWHM4rZFehuwIX29NzUWcD0U2on3qFWAUeRR1fWHNbvdGFsfF+Nhs49z7
 f20gZxGYHv65j5LqrQ3zpR/75dWEjSCOXxGXRRED5bJPw16nTEt2ORsE2fyKGkcp/U
 MUsb/6u/N9dAV51tfCuU9TVDvNYyfvKzp6hrRmXqDwuh1w35BW38QDdoefNie+TOUO
 ixMYeJeEYZ4t6XKPeQaJQJvC7pND/lGVvw4BaO+EFyMTQXUSk2DAnCh7Cffth0vnP+
 GY4IAlnZ5ceYiUZPM62KnG7w3oodInwSbctiHmAnIaj8b8zvCZcfVig2n8w1jeQfrd
 sJraVXQKvyOUg==
Message-ID: <49d9db82-5400-48a6-e578-36567620332a@kernel.org>
Date: Sat, 27 May 2023 08:16:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230525082508.2320763-1-chao@kernel.org>
 <ZHDmv2hLR9WZ16Pl@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZHDmv2hLR9WZ16Pl@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/27 1:05, Jaegeuk Kim wrote: > On 05/25, Chao Yu
 wrote: >> We should set noatime bit for quota files, since no one cares about
 >> atime of quota file, and we should set immutalbe bit as well, [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2hbj-003j3j-17
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to set noatime and immutable
 flag for quota file
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

On 2023/5/27 1:05, Jaegeuk Kim wrote:
> On 05/25, Chao Yu wrote:
>> We should set noatime bit for quota files, since no one cares about
>> atime of quota file, and we should set immutalbe bit as well, due to
>> nobody should write to the file through exported interfaces.
>>
>> Meanwhile this patch use inode_lock to avoid race condition during
>> inode->i_flags, f2fs_inode->i_flags update.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - fix to detect i_flags status correctly.
>>   fs/f2fs/super.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 51812f459581..1cf84c993d7c 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2763,7 +2763,17 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
>>   	}
>>   
>>   	/* Don't account quota for quota files to avoid recursion */
>> +	inode_lock(qf_inode);
>>   	qf_inode->i_flags |= S_NOQUOTA;
>> +
>> +	if (!(F2FS_I(qf_inode)->i_flags & F2FS_NOATIME_FL) ||
>> +		!(F2FS_I(qf_inode)->i_flags & F2FS_IMMUTABLE_FL)) {
> 
> What about this?
> 
> if ((F2FS_I(qf_inode)->i_flags & qf_flag) != qf_flag)

Ah, better, and updated in v3.

Thanks,

> 
>> +		F2FS_I(qf_inode)->i_flags |=
>> +				F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
>> +		f2fs_set_inode_flags(qf_inode);
>> +	}
>> +	inode_unlock(qf_inode);
>> +
>>   	err = dquot_load_quota_inode(qf_inode, type, format_id, flags);
>>   	iput(qf_inode);
>>   	return err;
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
