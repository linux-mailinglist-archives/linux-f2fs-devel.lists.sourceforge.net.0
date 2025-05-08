Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC5AAFF9B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 17:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIMKSaAdPsgsK7QltBM2/5MBcbYk90E8CGyWfB5R0+0=; b=ePxAdOLoon6YmVB7j+YLNTQjW/
	+BuqVxo7RFVTgnyxuaWpeHA9P/5bD28hseoW8Wf7u5R7duo0oSTgzX0Vl0d2tEodDy9/4SyruVZBV
	n7QK1o7PJ/W5I0xrxKpE2lEU9DeD5LaqTYVkGr+9aaBYkQBYUrb1MQ2vdOBargeOtYLA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD3Yi-0004Qs-9b;
	Thu, 08 May 2025 15:53:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uD3Yg-0004Qk-FG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 15:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cqHE1wVlzBEjIT1tkHqJbdWcqFR55QD5dBEYaUNTC8w=; b=Z8un2YtglfL1DdhwDRjLsPr9B0
 jdbvtEddqYnLq72Lm5f7WzKvAocIzaSIk5rLWhH0lgx36wxmXafSSmd8gxJjbkjvwjPQCq2Q+Hqgn
 NRYb8s+//uuspVV12ghPUTslJLBWl1FNaxMw10Q51OxXIWAMM2d20yVYNALMSLwMR5S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cqHE1wVlzBEjIT1tkHqJbdWcqFR55QD5dBEYaUNTC8w=; b=YsdtewE0HduleHt+gDEGnyjNLC
 07heVMpQBz0o/VL3teP1BfyKcRGoWbHBCnATymrX6ISYl8ZwS2WIPYqifMuooCk55c4I+ICvE4Xpt
 rpXuQeysyeZYkGGiZ9/NNlvzqfEgiLQuPe2yG91QQdBGoaoapdTRuozERA2htJFH0ouw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uD3Yf-0004ob-QI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 15:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746719582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqHE1wVlzBEjIT1tkHqJbdWcqFR55QD5dBEYaUNTC8w=;
 b=CntjSvC5+TJ0+BHNmKBPPtjyHIphBrBba93sbHXYL0c+SU08krfaEGNdozV9DWqn+uHsGS
 6mP5lDLlexvIuqnRiPaHwnDjlLpBNuey2dSKKNEY2YiJ1EfhLK7uBUvmrjnXKYHMl7ZZz8
 PsJhUfaLP9uJWKbzdt15PaWkrTpghEc=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-QDRg1UZdPm2umTni9_f0ig-1; Thu, 08 May 2025 11:53:01 -0400
X-MC-Unique: QDRg1UZdPm2umTni9_f0ig-1
X-Mimecast-MFC-AGG-ID: QDRg1UZdPm2umTni9_f0ig_1746719580
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85dad58e80fso298599339f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 May 2025 08:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746719580; x=1747324380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cqHE1wVlzBEjIT1tkHqJbdWcqFR55QD5dBEYaUNTC8w=;
 b=ueQn8pKZimWNw6ilg8Akul2PeCyCtptoVIKBHqzP0920F2DeOADpDt1K0HjOu4w9ut
 tR18wZ0N26SqY0tnll0ML4BhGncrzUB82a7LjrvrjQvcc/4TwmiA9jHrAF1PzxlHVNg/
 chHcV3Cl0wtcOGeWO3WS7Mv58y6NMsLG1+0alNzrAHSlG1fOsRCZwwTlNF30ZYqnciGA
 gk41lFSVuRvdQg8ztrHvxL07MSWSdBFygNCoED86i/SwoYh/hUp8aBhlHBp/AU4ybRNb
 JYtJO91zBIKJgXLLhUWhToJeZddQ3DJiuS0y9Bkl4x9J6C2FlAGDjrBn+6ONtqwizb1z
 8xHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS6g0HDWDHN1dA9BamB9eu4tRzhCl4XtT+2h+Md5aaMURj//mLkuBAEL8/ect6WtShJ/RfOVgHUJccKpDLvU6R@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwVI8GKB75FQcwYCxnVXxJG8Yt5mD1Ggqf/Oc9t2dg4Oqs8PJae
 lP7Z6UcQgojWQETYum+gqJxlqdQ+u/hxUe67sHJhpCKvtEqLbWSIXFBX0wC/IMmAiQ7D/sq0DEK
 ojnb3lvCCKJg26LfP7cjPskFmfPnRmpfGBPzeuFxA2xtRJx7vf+aZ6YfoZCVOBqwYmIhJWAWIx0
 A=
X-Gm-Gg: ASbGncsWK8KkBuwVhDF6Q3s0PSCM9nFYNta+ph8RQXmJYonjkZdewCvDdrOEs2vcHiS
 1lA2Za80OARUZEB8oT0jLHBu47ChkGvKq/eFH+LyNGHGrsrMdK0Y4MyqIomQAWObjkugNRl77LL
 omrA9I/3KjmODXIIprc3bcOQBY/CS9qXLAQ1EKZx42WZXeJ5hgisMFQUjFiIdCmTembq7xMqV7z
 Okxu91rLvET2iybge7QsDX/TcvUNvOKdljjoY0+ZhWy52wWuYxQ6m3cY/h6BqcUwXP/Owd6pCqL
 Wh9T+eq4bL8hSIYoczRRKA8cuz8OuhCTnTcIFQyhz3VDRmf7Ig==
X-Received: by 2002:a05:6602:2c08:b0:85b:3f06:1fd4 with SMTP id
 ca18e2360f4ac-86763606cb8mr24779939f.9.1746719580342; 
 Thu, 08 May 2025 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxJfZlvicAxlrpONM77R2Vd2izM8sSdfo59tv8nxUPrpakE2FaQQ2SxHE2KMbrtncMtJ8M2Q==
X-Received: by 2002:a05:6602:2c08:b0:85b:3f06:1fd4 with SMTP id
 ca18e2360f4ac-86763606cb8mr24776239f.9.1746719579980; 
 Thu, 08 May 2025 08:52:59 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2251c01bsm18934173.57.2025.05.08.08.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 08:52:59 -0700 (PDT)
Message-ID: <7a2d79f3-d524-4dd3-afff-b6f658935151@redhat.com>
Date: Thu, 8 May 2025 10:52:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-6-sandeen@redhat.com>
 <61cc47ec-787a-4cad-b7c1-3248dafbea79@kernel.org>
In-Reply-To: <61cc47ec-787a-4cad-b7c1-3248dafbea79@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s4nCvipsiGzEQRmZyNfhcOyrqHM4O_cKd5FhFsKLEQU_1746719580
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 3:13 AM, Chao Yu wrote: > On 4/24/25 01:08, Eric
 Sandeen wrote: >> From: Hongbo Li <lihongbo22@huawei.com> ... >> + if
 (ctx->qname_mask)
 { >> + for (i = 0; i < MAXQUOTAS; i++) { >> + if (!(ctx->qname_mask & (1
 << i))) >> + continue; >> + >> + old_qname = F2FS_OPTION(sbi).s_qf_names[i];
 >> + new_qname = F2FS_CT [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uD3Yf-0004ob-QI
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/8/25 3:13 AM, Chao Yu wrote:
> On 4/24/25 01:08, Eric Sandeen wrote:
>> From: Hongbo Li <lihongbo22@huawei.com>

...

>> +	if (ctx->qname_mask) {
>> +		for (i = 0; i < MAXQUOTAS; i++) {
>> +			if (!(ctx->qname_mask & (1 << i)))
>> +				continue;
>> +
>> +			old_qname = F2FS_OPTION(sbi).s_qf_names[i];
>> +			new_qname = F2FS_CTX_INFO(ctx).s_qf_names[i];
>> +			if (quota_turnon &&
>> +				!!old_qname != !!new_qname)
>> +				goto err_jquota_change;
>> +
>> +			if (old_qname) {
>> +				if (strcmp(old_qname, new_qname) == 0) {
>> +					ctx->qname_mask &= ~(1 << i);
> 
> Needs to free and nully F2FS_CTX_INFO(ctx).s_qf_names[i]?
> 

I will have to look into this. If s_qf_names are used/applied, they get
transferred to the sbi in f2fs_apply_quota_options and are freed in the
normal course of the fiesystem lifetime, i.e at unmount in f2fs_put_super.
That's the normal non-error lifecycle of the strings.

If they do not get transferred to the sbi in f2fs_apply_quota_options, they
remain on the ctx, and should get freed in f2fs_fc_free:

        for (i = 0; i < MAXQUOTAS; i++)
                kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);

It is possible to free them before f2fs_fc_free of course and that might
be an inconsistency in this function, because we do that in the other case
in the check_consistency function:

                        if (quota_feature) {
                                f2fs_info(sbi, "QUOTA feature is enabled, so ignore qf_name");
                                ctx->qname_mask &= ~(1 << i);
                                kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
                                F2FS_CTX_INFO(ctx).s_qf_names[i] = NULL;
                        }

I'll have to look at it a bit more. But this is modeled on ext4's
ext4_check_quota_consistency(), and it does not do any freeing in that
function; it leaves freeing in error cases to when the fc / ctx gets freed.

But tl;dr: I think we can remove the kfree and "= NULL" in this function,
and defer the freeing in the error case.

>> +
>> +static inline void clear_compression_spec(struct f2fs_fs_context *ctx)
>> +{
>> +	ctx->spec_mask &= ~(F2FS_SPEC_compress_algorithm
>> +						| F2FS_SPEC_compress_log_size
>> +						| F2FS_SPEC_compress_extension
>> +						| F2FS_SPEC_nocompress_extension
>> +						| F2FS_SPEC_compress_chksum
>> +						| F2FS_SPEC_compress_mode);
> 
> How about add a macro to include all compression macros, and use it to clean
> up above codes?

That's a good idea and probably easy enough to do without rebase pain.
 
>> +
>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>> +				F2FS_CTX_INFO(ctx).extensions,
>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
> 
> Can you please describe what is detailed confliction in the log? e.g. new
> noext conflicts w/ new ext...

Hmm, let me think about this. I had not noticed it was calling 
f2fs_test_compress_extension 3 times, I wonder if there is a better option.
I need to understand this approach better. Maybe Hongbo has thoughts.

>> +		return -EINVAL;
>> +	}
>> +	if (f2fs_test_compress_extension(F2FS_CTX_INFO(ctx).noextensions,
>> +				F2FS_CTX_INFO(ctx).nocompress_ext_cnt,
>> +				F2FS_OPTION(sbi).extensions,
>> +				F2FS_OPTION(sbi).compress_ext_cnt)) {
>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
> 
> Ditto,
> 
>> +		return -EINVAL;
>> +	}
>> +	if (f2fs_test_compress_extension(F2FS_OPTION(sbi).noextensions,
>> +				F2FS_OPTION(sbi).nocompress_ext_cnt,
>> +				F2FS_CTX_INFO(ctx).extensions,
>> +				F2FS_CTX_INFO(ctx).compress_ext_cnt)) {
>> +		f2fs_err(sbi, "invalid compress or nocompress extension");
> 
> Ditto,

thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
