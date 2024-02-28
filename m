Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1686A4EA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 02:23:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf8fH-000391-GE;
	Wed, 28 Feb 2024 01:23:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rf8fF-00038v-DU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 01:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cchrrH2NrerhKGDeRBIzi8tDjpIF6Lr+FVmKyXsqyc0=; b=lwP/qJcIjKS6nEmSH9Nqzh4zxQ
 e8VlMDTdAQnYGmu5Y6DMElrnWToggJC49H/tWsXvaHk7hu/Zi2Xtkw8tHRewGZH+sZyd+oNBpnsk8
 E1CutXZxM7eoQkweY7mJArDqQfs1H+VoaOOSTAER9Tv7ulUY7Pea0HNCh3j8ZRNJr5jk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cchrrH2NrerhKGDeRBIzi8tDjpIF6Lr+FVmKyXsqyc0=; b=k+vw4uKFc4FoQO9ydS/zbws/2t
 LhQbaKGKxikPbnd39awKKOg6ojA1PcPzsI6g79LuCrKDlWmgKU29pmwes14HV9UQP4U+AbTi3YyD8
 cuNbDMBhFP34Rpw5ifX2AHnyclTvmZsE0cewf2AL9vAKuunXZiENp1cOPShmvl8f+23E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf8fF-0007dH-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 01:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F210260CFB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Feb 2024 01:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B199CC433C7;
 Wed, 28 Feb 2024 01:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709083386;
 bh=4RHgr8hwDvio26ZjrRIEjc1o1G4N6nvQ/z/qnal8zlo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hFf2d9Um1oLNPRpQKwnRWsQgSWfnZfclDq0mK6uTwtQon9JUl+0N2jeaceBhPe05M
 +vNnLXQX+wCmKoVURItJ/yK7HRp19OAihBvkFMe8jFpp1a1FCRuhh+hykv+OI25i/A
 de/BQ+qe6lWSR0IaGtrEME3ITZTIky0q/fBaDXjBmaB0zjcH2J4vEmKl0fFC1UFD8b
 sfbiirOm495Y+vaDUJ9XwIYvUiw6kin3Ou81XN8YGvgX61zUILXkQbjtieERJ5QJKB
 iC//ROnMNLxAaqwr801NkdP2V93BnnPpunLHarxr1USwTjfEw6HrgcfoNOhjO9esy1
 ch64RekLx9hmw==
Message-ID: <bdacbc3c-87c0-42b7-980b-9f9830ab994c@kernel.org>
Date: Wed, 28 Feb 2024 09:23:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240222121851.883141-1-chao@kernel.org>
 <20240222121851.883141-2-chao@kernel.org> <Zd4g2SgQn3v_ZJMj@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Zd4g2SgQn3v_ZJMj@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/28 1:50, Jaegeuk Kim wrote: > On 02/22, Chao Yu
 wrote: >> f2fs_stop_checkpoint(, false) is complex and it may sleep, so we
 should >> move it outside segmap_lock spinlock coverage in get_new_ [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rf8fF-0007dH-F2
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: fix to don't call
 f2fs_stop_checkpoint in spinlock coverage
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

On 2024/2/28 1:50, Jaegeuk Kim wrote:
> On 02/22, Chao Yu wrote:
>> f2fs_stop_checkpoint(, false) is complex and it may sleep, so we should
>> move it outside segmap_lock spinlock coverage in get_new_segment().
> 
> Chao, I merged this patch into
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=f3b576d209983b5d6e1cb130bfc8ca1f0bbcad6d

It's fine to me.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/segment.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index d0209ea77dd2..8edc42071e6f 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2646,6 +2646,7 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>>   	unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
>>   	bool init = true;
>>   	int i;
>> +	int ret = 0;
>>   
>>   	spin_lock(&free_i->segmap_lock);
>>   
>> @@ -2671,9 +2672,8 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>>   		secno = find_first_zero_bit(free_i->free_secmap,
>>   							MAIN_SECS(sbi));
>>   		if (secno >= MAIN_SECS(sbi)) {
>> -			f2fs_stop_checkpoint(sbi, false,
>> -				STOP_CP_REASON_NO_SEGMENT);
>> -			f2fs_bug_on(sbi, 1);
>> +			ret = -ENOSPC;
>> +			goto out_unlock;
>>   		}
>>   	}
>>   	segno = GET_SEG_FROM_SEC(sbi, secno);
>> @@ -2704,7 +2704,13 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>>   	f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
>>   	__set_inuse(sbi, segno);
>>   	*newseg = segno;
>> +out_unlock:
>>   	spin_unlock(&free_i->segmap_lock);
>> +
>> +	if (ret) {
>> +		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
>> +		f2fs_bug_on(sbi, 1);
>> +	}
>>   }
>>   
>>   static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
