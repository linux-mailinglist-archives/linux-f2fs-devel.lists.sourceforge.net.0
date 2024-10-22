Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A39A95CE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 03:59:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t34Ay-0001Ew-JI;
	Tue, 22 Oct 2024 01:59:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t34Ax-0001Eo-2d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 01:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5w3ScoZWnmrWxKdZCS8wAF9QcHbQacKoaoMXUEx501c=; b=G8/1w3fa+f9nAIWkYm/2LV52WW
 dbXUltzGuWHk8spLuMuGqrjivECpZxnGnuW9IktYfCicght8xLPxJ/eJLNUg5mC8LOCT5T9s62xa9
 AVw6BQjPCc05ULUIG9+OukMhq9C/hqsFV59ey80NpBv5/B2SjbuCv1afYGEVYpkskfys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5w3ScoZWnmrWxKdZCS8wAF9QcHbQacKoaoMXUEx501c=; b=Qk4uueFmDOwfcnG+9KPYw1xWkZ
 aYZQ4pOMdg/x0xgYeMfT/4m55TxO6vLF7T5py9OqpfDaZm4sribU2Y2JYPbwJUnWDgoTHfFqor4fv
 nGsB66RHjzG9FVBma7E7ki7IywdnqaPuCUFUSRfcA63LdL2e26z2DL4f+XgLTgcVplr8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t34Ax-0005bh-3i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 01:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F2315C5C2D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Oct 2024 01:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B31C4CEC3;
 Tue, 22 Oct 2024 01:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729562340;
 bh=5JBcgBS0Caog8coGUL3oyDLpj9i7eIkov9z/5+mVrbs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=s0Jv4LiEo4Yn41QmFQj5x5mFJ8GOiIlnTChDcBDxvEk0Lb+g6uA3pLDBmd+RqAbPE
 UR5c47GJL8crC7ATtGo3xm/5P49M2YklXi0jwvwNTLo5yBO7BFOiyBfW8oT05miJhk
 spYmv9DRvOMzvQP7s5KKmgO+Oag1oz9ztuvBHK3MwvlHtgHfwpNTMHwuOvkN73ItBn
 TVoEqFL3HUaCSqkOc9VlRjXBDQl9maUp3axWgmEUFjFltCZnoxf4j0F2HQcL1j+r+J
 4IYtrFj0BrGR8TWqfz7RaKsnFpE8wMwxhTSIiOsLoRs4dMjfv1KSb5C2Kfqo1ce4tL
 +Cdo/Xoi9KWiQ==
Message-ID: <24535167-5f6f-48b9-a1c3-f59ec4af5944@kernel.org>
Date: Tue, 22 Oct 2024 09:58:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241018062638.2619214-1-chao@kernel.org>
 <20241018062638.2619214-2-chao@kernel.org> <ZxbhUUuKx_zaWAx4@google.com>
Content-Language: en-US
In-Reply-To: <ZxbhUUuKx_zaWAx4@google.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/22 7:18, Jaegeuk Kim wrote: > On 10/18, Chao Yu
 wrote: >> blkzoned feature enables lfs mode by default, for data updates
 from >> regular file, it only allow to use OPU, this patch changes t [...]
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t34Ax-0005bh-3i
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: zone: allow IPU for regular file
 in regular block device
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/22 7:18, Jaegeuk Kim wrote:
> On 10/18, Chao Yu wrote:
>> blkzoned feature enables lfs mode by default, for data updates from
>> regular file, it only allow to use OPU, this patch changes to allow
>> to use IPU if regular file's data block locates in regular block
>> device, if data block locates in zoned block device, it still uses
>> OPU.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 12 ++++++++++--
>>   fs/f2fs/f2fs.h |  5 +++++
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 949b6bb957c7..c6d0e4aa12e3 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2648,8 +2648,16 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>>   		return false;
>>   	if (fio && is_sbi_flag_set(sbi, SBI_NEED_FSCK))
>>   		return true;
>> -	if (f2fs_lfs_mode(sbi))
>> -		return true;
>> +	if (f2fs_lfs_mode(sbi)) {
>> +		/* no regular block device in mainarea */
>> +		if (!f2fs_blkzoned_has_regular_section(sbi))
>> +			return true;
>> +		/* blkaddr locates in sequential zone */
>> +		if (fio && __is_valid_data_blkaddr(fio->old_blkaddr) &&
>> +			GET_SEGNO(sbi, fio->old_blkaddr) >=
>> +					sbi->first_zoned_segno)
> 
> What if there's another regular device beyond zoned partition?

With above logic, it will trigger OPU if data locates in regular device
which is beyond zoned partition.

> I prefer to keep the entire area as lfs mode to simplify the performance.

Oh, what do you think of introducing another option mode=hybrid? so that
we can provide an option to allow LFS/IPU/SSR in regular device beside
we limit LFS mode in zoned device.

> Do we really need IPU on conventional partition? Why not asking to use
> file pinning, if someone needs IPU?

One concern is size of pinned file should be multiple of section, pined file
will cost too much space if section size is large. Another problem is flow of
third-party applications can not be controlled by us, so it's not possible
to execute pinfile & falloc after file creation.

Thanks,

> 
>> +			return true;
>> +	}
>>   	if (S_ISDIR(inode->i_mode))
>>   		return true;
>>   	if (IS_NOQUOTA(inode))
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 55bcd411257a..6781b4fab43f 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4790,6 +4790,11 @@ static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
>>   	f2fs_invalidate_compress_page(sbi, blkaddr);
>>   }
>>   
>> +static inline bool f2fs_blkzoned_has_regular_section(struct f2fs_sb_info *sbi)
>> +{
>> +	return f2fs_sb_has_blkzoned(sbi) && sbi->first_zoned_segno;
>> +}
>> +
>>   #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
>>   #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>>   
>> -- 
>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
