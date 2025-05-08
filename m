Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC8AAFFC5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 17:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPFQY2UuoHycIt0lyxCPY6CI4HSeaNagWDRNiJR7J/4=; b=I1lxaxQ7vRpBzYfsLijSKem8q3
	pq4iXWRfmHCz8Kug0niowct2xrlDoxuYMGQyrm1kcRk/6b/teB9zd+GrxK+vpZAw/vFJJLe+EPeLS
	QDfKAIkNareb5lByv7d7B4yof14kYwH3orVCbqQFbz7zU83lmvWBFqFnTSX+m57H601E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uD3ea-0004q1-Bm;
	Thu, 08 May 2025 15:59:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uD3eY-0004pv-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 15:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cauju83yaqo1jWa3h/GqWUhPfOlx5r6qLpMTuNwXk4Y=; b=faFqxVLEtKgQz8Ka5mGKMh2lZ8
 AANtTtlf5Oa82BzNOBnz2RW46C+GmSvG+mJgKNVVDb0muG4KaFdFPEssO9kMOH9Jf15yqqLKhYSb9
 epKbuCKAJobrgC2pbtV1ppk8wWzx0BPQfstGpFCKJfRQjCiIwLqok9hqUStUKT6/r2R4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cauju83yaqo1jWa3h/GqWUhPfOlx5r6qLpMTuNwXk4Y=; b=mYdgcx7VGTkFpFfmdGp01Lsc6v
 e9+yYOVQNSNmy9I5vHVFBdnzp3wSGxUMCOBg/t6e+FAcYFJnrUcCuwDoGJNQYUcLzukfLUMDixb6Y
 XyuOKZqb9m9IcSHVvgbKjQkDYCSwB2Q6HFuEbhvGx6HoZUFpubcARhr/P1KEFxPFPS2k=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uD3eY-0005Rv-B6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 15:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746719952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cauju83yaqo1jWa3h/GqWUhPfOlx5r6qLpMTuNwXk4Y=;
 b=EmIO5YNLQLVlS1on4TNhmxAvI4CRDvlVdC9sEa8fMQBYHcel3aUP1VtIfbTBFnALmx/kT8
 LqQpVSX+2D40KvO6Vkj1IgiPvkQzSU6yOJHc5NVIawTHsjiO4HYKEg4Zy8W821KtneEmHx
 2Bm9yYHlwlaJEGYiEArXAHOofV0LyfE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-box73bieN3CWKP3qxMNm_A-1; Thu, 08 May 2025 11:59:11 -0400
X-MC-Unique: box73bieN3CWKP3qxMNm_A-1
X-Mimecast-MFC-AGG-ID: box73bieN3CWKP3qxMNm_A_1746719950
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85e310ba2f9so92524839f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 May 2025 08:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746719950; x=1747324750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cauju83yaqo1jWa3h/GqWUhPfOlx5r6qLpMTuNwXk4Y=;
 b=aSiss9Sc+O1wbGckOEvjBKR6tBCAvxv7vqIczjDuNq2nvCtxPuahgXyU+RWUknZrgR
 EBzBYNxnmVr1lDz/pFQ6njVkaZcwtEoJO8ejoV00jCDQqxnO47wHgg41ttk5rdX26sIo
 EYjctvtriruOqPm25qeoJc++LHi5hRFnqQjB8i+8K0BUZsGLMeh+OIOzuHOuQ/wXAkte
 vFgQigv7DgS7tft5wtowwb9hfNsWJvfphKkBZG6jEyVQ8eNvE1Zg/EX/zTpxxrY4i9bx
 EHmGjqrVGgfFIJLmkWPe7vwT/aMnNlZqBnwyK9HV4xppD7UvZ8GKYs9rm6Y9aGDEUqrQ
 jiKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj3PM3eBjQNN68yBbRGP/2BQ7UDLqN+98gF5MXvkv71jRS0F7SQNm68/+KmA1xlcUbDi6F2H6aHkMTotKURI60@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyBFyBpEF6Bi3c/u5qfZ8r0NRItIFIsp1rgUqJw7I/JhhktfLT+
 fO84Wnfkhaa16+6cOddnF3c/uGp0RD1i2bjtJ2ur9FSMiCTAgEiAaKPPwajoqG9rjyt46XfbVh5
 epY3HzaRCspNQwSo3qTimeBvw5ZTnLJD+VStZIj5jFP0pf/ZWQ7fdYFVwgt5wiBf9YZSmP2I2GW
 c=
X-Gm-Gg: ASbGncvC6qM2/ePlIjPjLXtfAPyqz6vfJKGA0wZhnb35Vv2MvYAWmN8SVpuDxksUsW6
 KkHtXPd6TyTguCeClpTAS1DDRmoOqnNS6GjPaAErV01kRsLBSUM/v2slTCQNxJnMwP8ORdsO8HT
 xPSYKkBDPB+5Jo6m3iIeBDgMIv3evE+eiVk3iKo7mFmogQEAs9urwXTo/Nd+OUowbeBVEpkBIOU
 yQ05pAhTuOEW14QqC6UPvomfXNAyZO70YqxKTtibSv2EcHbytdfoTkKMjzzfgZjrwtEZF2oE5lD
 BqCd8q8YRwsrJO7CpyR4CRM4CbTLY3VqF41qVHlSYONW2v5KnQ==
X-Received: by 2002:a05:6602:2c0d:b0:864:627a:3d85 with SMTP id
 ca18e2360f4ac-8676362d62emr22244139f.11.1746719949577; 
 Thu, 08 May 2025 08:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEuEA4Zeb23Xh5HTz0dqMYHj7Mfu1sLQt4nv8y0s2IO/n20C2Rw5OQGwnbJqAQFZo/nXe6Bg==
X-Received: by 2002:a05:6602:2c0d:b0:864:627a:3d85 with SMTP id
 ca18e2360f4ac-8676362d62emr22241739f.11.1746719949230; 
 Thu, 08 May 2025 08:59:09 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa226825c2sm15522173.132.2025.05.08.08.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 08:59:08 -0700 (PDT)
Message-ID: <763bed71-1f44-4622-a9a0-d200f0418183@redhat.com>
Date: Thu, 8 May 2025 10:59:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <b56964c2-ad30-4501-a7fd-1c0b41c407e9@kernel.org>
In-Reply-To: <b56964c2-ad30-4501-a7fd-1c0b41c407e9@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BXJBjRlgK9LnQ5z0g6ge3fCAjKvQU7comBf6gdfbecI_1746719950
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 4:19 AM, Chao Yu wrote: >> @@ -2645,21 +2603,11
 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 >> >> default_options(sbi, true); >> >> - memset(&fc, 0, sizeof(fc) [...]
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
 trust [170.10.129.124 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uD3eY-0005Rv-B6
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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

On 5/8/25 4:19 AM, Chao Yu wrote:
>> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>  
>>  	default_options(sbi, true);
>>  
>> -	memset(&fc, 0, sizeof(fc));
>> -	memset(&ctx, 0, sizeof(ctx));
>> -	fc.fs_private = &ctx;
>> -	fc.purpose = FS_CONTEXT_FOR_RECONFIGURE;
>> -
>> -	/* parse mount options */
>> -	err = parse_options(&fc, data);
>> -	if (err)
>> -		goto restore_opts;
> There is a retry flow during f2fs_fill_super(), I intenionally inject a
> fault into f2fs_fill_super() to trigger the retry flow, it turns out that
> mount option may be missed w/ below testcase:

I never did understand that retry logic (introduced in ed2e621a95d long
ago). What errors does it expect to be able to retry, with success?

Anyway ...

Can you show me (as a patch) exactly what you did to trigger the retry,
just so we are looking at the same thing?

> - mkfs.f2fs -f -O encrypt /dev/vdb
> - mount -o test_dummy_encryption /dev/vdb /mnt/f2fs/
> : return success
> - dmesg -c
> 
> [   83.619982] f2fs_fill_super, retry_cnt:1
> [   83.620914] F2FS-fs (vdb): Test dummy encryption mode enabled
> [   83.668380] f2fs_fill_super, retry_cnt:0
> [   83.671601] F2FS-fs (vdb): Mounted with checkpoint version = 7a8dfca5
> 
> - mount|grep f2fs
> /dev/vdb on /mnt/f2fs type f2fs (rw,relatime,lazytime,background_gc=on,nogc_merge,
> discard,discard_unit=block,user_xattr,inline_xattr,acl,inline_data,inline_dentry,
> flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=reuse,
> checkpoint_merge,fsync_mode=posix,memory=normal,errors=continue)
> 
> The reason may be it has cleared F2FS_CTX_INFO(ctx).dummy_enc_policy in
> f2fs_apply_test_dummy_encryption().
> 
> static void f2fs_apply_test_dummy_encryption(struct fs_context *fc,
> 					     struct super_block *sb)
> {
> 	struct f2fs_fs_context *ctx = fc->fs_private;
> 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> 
> 	if (!fscrypt_is_dummy_policy_set(&F2FS_CTX_INFO(ctx).dummy_enc_policy) ||
> 		/* if already set, it was already verified to be the same */
> 		fscrypt_is_dummy_policy_set(&F2FS_OPTION(sbi).dummy_enc_policy))
> 		return;
> 	F2FS_OPTION(sbi).dummy_enc_policy = F2FS_CTX_INFO(ctx).dummy_enc_policy;
> 	memset(&F2FS_CTX_INFO(ctx).dummy_enc_policy, 0,
> 		sizeof(F2FS_CTX_INFO(ctx).dummy_enc_policy));
> 	f2fs_warn(sbi, "Test dummy encryption mode enabled");
> }
> 
> Can we save old mount_info from sbi or ctx from fc, and try to recover it
> before we retry mount flow?

I'll have to take more time to understand this concern. But thanks for pointing
it out.

-Eric

> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
