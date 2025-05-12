Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33240AB2E23
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 05:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pJz67Gk3uYHGq7+oOwRZvgBb9D0MkuHLRvPOUoqX1M=; b=FfabZKDkpxPqfqG+OL6x+Mv/UJ
	CF7qr3cbtNnjJfAtrJ2IMJO6rSS3c2oEAlpp9ufUnG2INL8jgOPo0a0epEZ/OxDiiJOhm3hixnsMC
	9OFM8d+rRNhQPFKJDiosdzLpa/XB4CFLKNCIQhmxcUeshmwEjjfFRcqr09DBq0/2x3Iw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEJtt-0000GS-US;
	Mon, 12 May 2025 03:32:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEJts-0000GL-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGSneBFQQ4Fjld3GKwWlOnIPPiEEq8P7uafPUVKA3FE=; b=mXIiDlvLuLpKMBmOL5FYX8NYJD
 7UguIRzEAipT6TWmtAyg4832tb6K44md0hwbUFfcAkRnYGi0wTR2OI1Elj/1S7scsES02boJFU1zk
 ctnIKIQ6QzgDqYh76AfMtc9CnN99sOEEvrsI3ZSx6YPTVRXDArlxYTce+mxXwl5JAJDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rGSneBFQQ4Fjld3GKwWlOnIPPiEEq8P7uafPUVKA3FE=; b=C1i+2npL88L+Lsc87IaqTn9cGT
 gSerC+ksj/5Ypxkfd6APS+PElJEs9qTMhTlSEwCN4lsc5/5WvRp/gis7UiYPfoPwV39TMTsyceCVg
 Jb5cKKTIZ/s1YZBfNhHSHva9JNTw0Y+yfXMgM1Tsr4zbfkeMsof1i7Ff/BCtqqYYtzyE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEJts-0007BT-7f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 03:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 832EDA4AFDD;
 Mon, 12 May 2025 03:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C893C4CEE4;
 Mon, 12 May 2025 03:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747020734;
 bh=JxOxpJ0i7h4ePB/814Pne03+XsTSBvsrKXA7Jf+vo4I=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OzmfymJ1nyKj5+2xI8DN8rVPTZWCr2As/Bg1NxifzqRuPggy7JTcQePzSZu7/j6sO
 C3XnYnj5M7pmHM/sTV5oHUYdCCIa6UkJlEbBxf+5XtNjkkBwlRUuEYG3Bqd1i0Jgo6
 offAzjyBnl2Z1b9VnUJXX54RnDQ+TuJV0M6E5PvKBUg4EAr6RQPmPCQkRTzXaVwmTc
 4olCLVfAVC3gfHWmxD+OMkJHR9pLn+FuBZXXP2URzwQyN3YLqbIfJuWNse5TJl1Lj3
 CyXQw8ldXL31mtnt+9mzMmtduDE5pJg0JePhVItDuWrKc2eK3jBmC0M+wMCa/ySS8U
 8djPsFQi3ExHg==
Message-ID: <44227298-bee2-4978-b785-715427c3cce5@kernel.org>
Date: Mon, 12 May 2025 11:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-6-sandeen@redhat.com>
 <61cc47ec-787a-4cad-b7c1-3248dafbea79@kernel.org>
 <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
Content-Language: en-US
In-Reply-To: <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 23:52, Eric Sandeen wrote: > On 5/8/25 3:13 AM,
 Chao Yu wrote: >> On 4/24/25 01:08, Eric Sandeen wrote: >>> From: Hongbo Li
 <lihongbo22@huawei.com> > > ... > >>> + if (ctx->qname_mask) { >>> [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEJts-0007BT-7f
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/8/25 23:52, Eric Sandeen wrote:
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
>         for (i = 0; i < MAXQUOTAS; i++)
>                 kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
> 
> It is possible to free them before f2fs_fc_free of course and that might
> be an inconsistency in this function, because we do that in the other case
> in the check_consistency function:
> 
>                         if (quota_feature) {
>                                 f2fs_info(sbi, "QUOTA feature is enabled, so ignore qf_name");
>                                 ctx->qname_mask &= ~(1 << i);
>                                 kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
>                                 F2FS_CTX_INFO(ctx).s_qf_names[i] = NULL;
>                         }

Yes, I noticed such inconsistency, and I'm wondering why we handle ctx.s_qf_names
w/ different ways.

			if (quota_feature) {
				f2fs_info(sbi, "QUOTA feature is enabled, so ignore qf_name");
				ctx->qname_mask &= ~(1 << i);
				kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
				F2FS_CTX_INFO(ctx).s_qf_names[i] = NULL;
			}

For "quota_feature is on" case, as opt.s_qf_names is NULL, so if it doesn't
nully ctx.s_qf_names, it will fail below check which is not as expected. So
I doubt it should be handled separately.

	/* Make sure we don't mix old and new quota format */
	usr_qf_name = F2FS_OPTION(sbi).s_qf_names[USRQUOTA] ||
			F2FS_CTX_INFO(ctx).s_qf_names[USRQUOTA];
	grp_qf_name = F2FS_OPTION(sbi).s_qf_names[GRPQUOTA] ||
			F2FS_CTX_INFO(ctx).s_qf_names[GRPQUOTA];
	prj_qf_name = F2FS_OPTION(sbi).s_qf_names[PRJQUOTA] ||
			F2FS_CTX_INFO(ctx).s_qf_names[PRJQUOTA];
	usrquota = test_opt(sbi, USRQUOTA) ||
			ctx_test_opt(ctx, F2FS_MOUNT_USRQUOTA);
	grpquota = test_opt(sbi, GRPQUOTA) ||
			ctx_test_opt(ctx, F2FS_MOUNT_GRPQUOTA);
	prjquota = test_opt(sbi, PRJQUOTA) ||
			ctx_test_opt(ctx, F2FS_MOUNT_PRJQUOTA);

	if (usr_qf_name) {
		ctx_clear_opt(ctx, F2FS_MOUNT_USRQUOTA);
		usrquota = false;
	}
	if (grp_qf_name) {
		ctx_clear_opt(ctx, F2FS_MOUNT_GRPQUOTA);
		grpquota = false;
	}
	if (prj_qf_name) {
		ctx_clear_opt(ctx, F2FS_MOUNT_PRJQUOTA);
		prjquota = false;
	}
	if (usr_qf_name || grp_qf_name || prj_qf_name) {
		if (grpquota || usrquota || prjquota) {
			f2fs_err(sbi, "old and new quota format mixing");
			return -EINVAL;
		}
		if (!(ctx->spec_mask & F2FS_SPEC_jqfmt ||
				F2FS_OPTION(sbi).s_jquota_fmt)) {
			f2fs_err(sbi, "journaled quota format not specified");
			return -EINVAL;
		}
	}

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

Maybe:

f2fs_err(sbi, "new noextensions conflicts w/ new extensions");

> 
>>> +		return -EINVAL;
>>> +	}
>>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>>> +				F2FS_OPTION(sbi).extensions,
>>> +				F2FS_OPTION(sbi).compress_ext_cnt)) {
>>> +		f2fs_err(sbi, "invalid compress or nocompress extension");

f2fs_err(sbi, "new noextensions conflicts w/ old extensions");

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

f2fs_err(sbi, "new extensions conflicts w/ old noextensions");

Then, user may get enough hint from log to update conflicted {no,}extensions
for mount.

Thanks,

>>
>> Ditto,
> 
> thanks,
> -Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
