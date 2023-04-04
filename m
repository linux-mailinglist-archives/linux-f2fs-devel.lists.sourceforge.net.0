Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 292456D5DE2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 12:47:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjeCI-0004U1-Pl;
	Tue, 04 Apr 2023 10:47:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjeCC-0004TO-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 10:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lO4PaH3AQXhXyeJD60YMR1fdW5vfNtqWS1pAzDVw5a4=; b=KRY8wCdnFRaA1Bkooo7QjVrv+q
 Ygl5RwYVM3OW4Fmh9V+IVzxJHEskhztaXDoAjgKwV5jUhpqsEHogptNCUg1Qvsg9R8JTHEStvfMns
 rR81a47tYXHwHJzVw3wvuTQ3eTDeiP+UWwNdBhGz50Q3GdAd4TgKMFZP2Ew2F2v0dH9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lO4PaH3AQXhXyeJD60YMR1fdW5vfNtqWS1pAzDVw5a4=; b=Pc9J+iUbya+BexBJjmfjgX7y5z
 GKdxotLzevMxVcL8YI1tI8WD/itgJl/jgr4Xj6WpnJndc1Q0U/YM65kR2Kjjlhy6i0jjsJ6YL/vcW
 D5/4wA6eTmOnDCvgy4hjniFYOcYe6jbQc/8oKhCFnkgSPzKx/XQw3LxPkw725Z9QayYw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjeBw-00062e-9O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 10:47:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E005262E51
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Apr 2023 10:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674D4C433EF;
 Tue,  4 Apr 2023 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680605222;
 bh=JPysGGnjPgbO37ueoLHh8BTscsjnrGxScIvFiCFfWmE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NFExaqm1mj5IDOgU1XgXIB2mUqyeogLfTPoTKFQX8GDMXSjqSwmCPNYh7vs+Jifut
 LsRpNfb7K/mP9UFHLTYdfeblz46J20zF/WNZ75tLCZjgaHOf0l17FUkSsLZByY3GvG
 8Tz5WQK7wpYcJGW3LUunkp+5flwTYD49AhFBxcS17c2INK07AmkiOTCk45kV6PtXMd
 HMbGF+w67fFW7enkVzTnu5Mg/i15gtEZ2AcRG3NPAZPzdBn5Pyt+I4P2SEp210BKsD
 AtVt7ql2/9fOX1njdXsw/7w5NuHLg2Xk+sbwm//L6WDhRODKAkWjmgT2A64cIlCfLE
 jB9eB2oiufEOw==
Message-ID: <08259184-d3c1-cb46-9751-e32e1bc6eb87@kernel.org>
Date: Tue, 4 Apr 2023 18:46:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230324071028.336982-1-chao@kernel.org>
 <ZCsXRin7symPxIrn@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCsXRin7symPxIrn@google.com>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 2:13, Jaegeuk Kim wrote: > On 03/24,
 Chao Yu wrote:
 >> In order to reclaim free blocks in prefree sections before latter use.
 > > We were supposed to do checkpoint as is? It seems commit 6f8d4455060d
 ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc") changed that logic?
 It caused that if has_not_enough_free_secs() returns false, it missed to
 call f2fs_write_checkpoi [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjeBw-00062e-9O
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end
 of foreground garbage collection
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

On 2023/4/4 2:13, Jaegeuk Kim wrote:
> On 03/24, Chao Yu wrote:
>> In order to reclaim free blocks in prefree sections before latter use.
> 
> We were supposed to do checkpoint as is?

It seems commit 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
changed that logic? It caused that if has_not_enough_free_secs() returns false,
it missed to call f2fs_write_checkpoint() before exit f2fs_gc()?

@@ -1110,15 +1116,23 @@ gc_more:
  	if (gc_type == FG_GC)
  		sbi->cur_victim_sec = NULL_SEGNO;

-	if (!sync) {
-		if (has_not_enough_free_secs(sbi, sec_freed, 0)) {
-			if (skipped_round > MAX_SKIP_ATOMIC_COUNT &&
-				skipped_round * 2 >= round)
-				f2fs_drop_inmem_pages_all(sbi, true);
+	if (sync)
+		goto stop;
+
+	if (has_not_enough_free_secs(sbi, sec_freed, 0)) {
+		if (skipped_round <= MAX_SKIP_GC_COUNT ||
+					skipped_round * 2 < round) {
  			segno = NULL_SEGNO;
  			goto gc_more;
  		}

+		if (first_skipped < last_skipped &&
+				(last_skipped - first_skipped) >
+						sbi->skipped_gc_rwsem) {
+			f2fs_drop_inmem_pages_all(sbi, true);
+			segno = NULL_SEGNO;
+			goto gc_more;
+		}
  		if (gc_type == FG_GC)
  			ret = f2fs_write_checkpoint(sbi, &cpc);
  	}

> 
>>
>> Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/f2fs.h    | 1 +
>>   fs/f2fs/gc.c      | 8 ++++++++
>>   fs/f2fs/segment.c | 1 +
>>   3 files changed, 10 insertions(+)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 53a005b420cf..b1515375cb4c 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1269,6 +1269,7 @@ struct f2fs_gc_control {
>>   	unsigned int victim_segno;	/* target victim segment number */
>>   	int init_gc_type;		/* FG_GC or BG_GC */
>>   	bool no_bg_gc;			/* check the space and stop bg_gc */
>> +	bool reclaim_space;		/* trigger checkpoint to reclaim space */
>>   	bool should_migrate_blocks;	/* should migrate blocks */
>>   	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
>>   	unsigned int nr_free_secs;	/* # of free sections to do GC */
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 2996d38aa89c..5a451d3d512d 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -132,6 +132,7 @@ static int gc_thread_func(void *data)
>>   
>>   		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
>>   		gc_control.no_bg_gc = foreground;
>> +		gc_control.reclaim_space = foreground;
>>   		gc_control.nr_free_secs = foreground ? 1 : 0;
>>   
>>   		/* if return value is not zero, no victim was selected */
>> @@ -1880,6 +1881,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>   				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
>>   		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
>>   			goto go_gc_more;
>> +
>> +		/*
>> +		 * trigger a checkpoint in the end of foreground garbage
>> +		 * collection.
>> +		 */
>> +		if (gc_control->reclaim_space)
>> +			ret = f2fs_write_checkpoint(sbi, &cpc);
>>   		goto stop;
>>   	}
>>   
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 6c11789da884..b62af2ae1685 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -421,6 +421,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>>   				.victim_segno = NULL_SEGNO,
>>   				.init_gc_type = BG_GC,
>>   				.no_bg_gc = true,
>> +				.reclaim_space = true,
>>   				.should_migrate_blocks = false,
>>   				.err_gc_skipped = false,
>>   				.nr_free_secs = 1 };
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
