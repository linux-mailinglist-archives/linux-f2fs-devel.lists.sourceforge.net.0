Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11152AB6055
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 03:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwTRnE66CVLc+o7WkHtbw2GrA8LF7kEZIFEQRzm/iCk=; b=QbxfCOztwzxSqqZ2av8xLnIF0W
	HtK+pondUKt8TxS9tLHVFiJkIdh/JnUJ3CooDfGMwJQs16SiEnqs2IAUV008/IGc1GeDioSlG6puk
	w94mLYU5Z8IT0bnDGRABJr7iYBhirciQuRS5mqFbDOscG403gKAGHa2w859zcizNbia8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uF0XF-0003Dq-6x;
	Wed, 14 May 2025 01:03:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uF0XC-0003DX-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 01:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iRXASAtCB6y9zOc5x1eqRKVrxicw6OVaxLTQjQ9rhhU=; b=Y1PHTmZHm4zbVbJP2t+kSJ+7Hw
 253h7+0PGY8kf22OEL88q1YL4LjN4dscjYXFOSztggYz2VrzICvewUU+qbNrZocRegKj2KIytjXPy
 qlI31gsZ0633RZNM5QasW1ugSCJ3BeToSU2q4LmTW1lJdnOIDRPPoz3jzXvjwObZhCIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iRXASAtCB6y9zOc5x1eqRKVrxicw6OVaxLTQjQ9rhhU=; b=TMcNjEvFg3JfFasm5/zZfi42VQ
 q+VpymLyh/M046a3R+ef2E2ZkKs82g3B+d2s6buHS0sHRAnUMSyyKBaFW/BB6LjQ2QIBetu/xx0We
 2LZm52httJqwXMra4gtUsfBuoypXhaCqWxzZKqwfOOwjbPPcQp7TwLSw1JqKUscdR+MU=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uF0XB-0007lW-1S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 01:03:46 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Zxw6b4JLKztRc4;
 Wed, 14 May 2025 09:02:15 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 9AEF4180487;
 Wed, 14 May 2025 09:03:32 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 14 May 2025 09:03:32 +0800
Message-ID: <6e14ecbb-b65d-4a1e-a7f0-836284d098b6@huawei.com>
Date: Wed, 14 May 2025 09:03:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, Chao Yu <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-6-sandeen@redhat.com>
 <61cc47ec-787a-4cad-b7c1-3248dafbea79@kernel.org>
 <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
Content-Language: en-US
In-Reply-To: <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/5/8 23:52, Eric Sandeen wrote: > On 5/8/25 3:13 AM, 
 Chao Yu wrote: >> On 4/24/25 01:08, Eric Sandeen wrote: >>> From: Hongbo
 Li <lihongbo22@huawei.com> > > ... > >>> + if (ctx->qname_mask) { > [...] 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
X-Headers-End: 1uF0XB-0007lW-1S
Subject: Re: [f2fs-dev] [PATCH V3 5/7] f2fs: separate the options parsing
 and options checking
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2025/5/8 23:52, Eric Sandeen wrote:
> On 5/8/25 3:13 AM, Chao Yu wrote:
>> On 4/24/25 01:08, Eric Sandeen wrote:
>>> From: Hongbo Li <lihongbo22@huawei.com>
> 
> ...
> 
>>> +	if (ctx->qname_mask) {
>>> +		for (i = 0; i < MAXQUOTAS; i++) {
>>> +			if (!(ctx->qname_mask & (1 << i)))
>>> +				continue;
>>> +
>>> +			old_qname = F2FS_OPTION(sbi).s_qf_names[i];
>>> +			new_qname = F2FS_CTX_INFO(ctx).s_qf_names[i];
>>> +			if (quota_turnon &&
>>> +				!!old_qname != !!new_qname)
>>> +				goto err_jquota_change;
>>> +
>>> +			if (old_qname) {
>>> +				if (strcmp(old_qname, new_qname) == 0) {
>>> +					ctx->qname_mask &= ~(1 << i);
>>
>> Needs to free and nully F2FS_CTX_INFO(ctx).s_qf_names[i]?
>>
> 
> I will have to look into this. If s_qf_names are used/applied, they get
> transferred to the sbi in f2fs_apply_quota_options and are freed in the
> normal course of the fiesystem lifetime, i.e at unmount in f2fs_put_super.
> That's the normal non-error lifecycle of the strings.
> 
> If they do not get transferred to the sbi in f2fs_apply_quota_options, they
> remain on the ctx, and should get freed in f2fs_fc_free:
> 
>          for (i = 0; i < MAXQUOTAS; i++)
>                  kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
> 
> It is possible to free them before f2fs_fc_free of course and that might
> be an inconsistency in this function, because we do that in the other case
> in the check_consistency function:
> 
>                          if (quota_feature) {
>                                  f2fs_info(sbi, "QUOTA feature is enabled, so ignore qf_name");
>                                  ctx->qname_mask &= ~(1 << i);
>                                  kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
>                                  F2FS_CTX_INFO(ctx).s_qf_names[i] = NULL;
>                          }
> 
> I'll have to look at it a bit more. But this is modeled on ext4's
> ext4_check_quota_consistency(), and it does not do any freeing in that
> function; it leaves freeing in error cases to when the fc / ctx gets freed.
> 
> But tl;dr: I think we can remove the kfree and "= NULL" in this function,
> and defer the freeing in the error case.
> 
>>> +
>>> +static inline void clear_compression_spec(struct f2fs_fs_context *ctx)
>>> +{
>>> +	ctx->spec_mask &= ~(F2FS_SPEC_compress_algorithm
>>> +						| F2FS_SPEC_compress_log_size
>>> +						| F2FS_SPEC_compress_extension
>>> +						| F2FS_SPEC_nocompress_extension
>>> +						| F2FS_SPEC_compress_chksum
>>> +						| F2FS_SPEC_compress_mode);
>>
>> How about add a macro to include all compression macros, and use it to clean
>> up above codes?
> 
> That's a good idea and probably easy enough to do without rebase pain.
>   
>>> +
>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>> +				F2FS_CTX_INFO(ctx).extensions,
>>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>>
>> Can you please describe what is detailed confliction in the log? e.g. new
>> noext conflicts w/ new ext...
> 
> Hmm, let me think about this. I had not noticed it was calling
> f2fs_test_compress_extension 3 times, I wonder if there is a better option.
> I need to understand this approach better. Maybe Hongbo has thoughts.
> 
ah, I kept it with the older format. And they should check the unmatched 
conflict between ctx and sbi.

Thanks,
Hongbo

>>> +		return -EINVAL;
>>> +	}
>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>> +				F2FS_OPTION(sbi).extensions,
>>> +				F2FS_OPTION(sbi).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>>
>> Ditto,
>>
>>> +		return -EINVAL;
>>> +	}
>>> +	if (f2fs_test_compress_extension(F2FS_OPTION(sbi).noextensions,
>>> +				F2FS_OPTION(sbi).nocompress_ext_cnt,
>>> +				F2FS_CTX_INFO(ctx).extensions,
>>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
>>
>> Ditto,
> 
> thanks,
> -Eric
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
