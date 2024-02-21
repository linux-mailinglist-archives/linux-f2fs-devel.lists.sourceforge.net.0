Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3585CD38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 02:04:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcb2R-00027s-TH;
	Wed, 21 Feb 2024 01:04:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcb2P-00027l-W4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 01:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Bi2/WK4U8qrB047yhVOFHvdBxG81qeilni47DjDlWg=; b=LFbb0D5EvKtbC83XeqmqZftNd5
 N0Ah+1mLnMSfZ0b1y++xFIqGuD2iRy6mgXeVuBnxF9NvkA+Qf9A7prcx2yXuMMV+rwMehqhyRE1BJ
 4wGA04IW/DGTBwgnHTxi5ppxJsCRZ5aQTtaroW3zz3K3ll2YfvDh1GB/QJfVau6QXQZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Bi2/WK4U8qrB047yhVOFHvdBxG81qeilni47DjDlWg=; b=mCcQCztbZzMdobMBru1KrDRR6B
 9/KbDvzunvE9uYngoJdaxxx8QbvnK+SgCryMgW7LH7N5W85XXVoih2NciTOTQ0UX33K84xhaWsf0O
 Pj6zUCutqkrmz9CrYYB6XyDfnMQpBFA4eq5dRnoykPrK/PXa2JG4IqvcNaNPvwoU38N0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcb2O-0004d4-CO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 01:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02DCECE19C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 01:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F45C433F1;
 Wed, 21 Feb 2024 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708477474;
 bh=lY1BvwYdkdPQgChfmKA+k2lduIGy+T+Lsl5kVFPtli8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T/5NAwCmZfaacxe9uGeGXDlgNRfGgHaGKYDpOIkYlAdhMz9Hd4baHZ2NIGTLWpD8S
 0xSPWBi9xNK2xExQ+aVoGv22dO7ael31gcQZCVQX5i6eIdVdnZADIqRe34sJNQVi5b
 PJdobMLdBlX/7ta6+L8URQdNBU+FSMkl0VfXxtrneA56bVWc+o2O23RlmjFUxn1kQK
 KGGVUYU42pyAIjHg4TAJFaFXdLnNQ/SYsAx6Kp6AEymrO8Udx171yNkSxh0PQoIohx
 FR2ZLXXR8NE4E/ryO8H6mPwdiVnZ1/vPYE9t2Qt50OO9PhsXsg1osjMP/l5P3xE9Ta
 BfsiV7v3gwZMg==
Message-ID: <73c8c2b1-b5c1-4cdc-b8c3-f64d7dfdb125@kernel.org>
Date: Wed, 21 Feb 2024 09:04:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
 <20240207005105.3744811-2-jaegeuk@kernel.org> <ZcpfF9UJz8bNW6ge@google.com>
 <bded9fde-9541-465d-86f8-292249226cc9@kernel.org>
 <ZdUMgrzpVHob6KvQ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZdUMgrzpVHob6KvQ@google.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/21 4:33, Jaegeuk Kim wrote: >> @@ -4723, 7 +4723, 7
 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 >> .reason = CP_DISCARD, >> .trim_start = 0, >> .trim_end = MA [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcb2O-0004d4-CO
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC,
 and SEGS_PER_SEC
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

On 2024/2/21 4:33, Jaegeuk Kim wrote:
>> @@ -4723,7 +4723,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>   			.reason = CP_DISCARD,
>>   			.trim_start = 0,
>>   			.trim_end = MAIN_SEGS(sbi) - 1,
>> -			.trim_minlen = sbi->blocks_per_seg,
>> +			.trim_minlen = BLKS_PER_SEG(sbi),
> 
> We don't have this.

Oh, it's due to my branch is not clean... I should rebase this diff to
last dev-test, sorry.

Thanks,

> 
>>   		};
>>   		f2fs_write_checkpoint(sbi, &cpc);
>>   	}
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
