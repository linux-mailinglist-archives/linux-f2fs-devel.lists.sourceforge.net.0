Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE24AB496E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 04:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypHEYYKZCN3VHosQwNO1uhxuD/j2xc30+13Mcv3Ji/4=; b=Yl0ugpvFdrti9Ko7UR1NgkiufL
	S6D0vH/HYBLDjhXF06x9WbyoHojd47oArK8ynNpiI20UxXHzY3Kvh5hKOwn4RirFb8BvfZL5uGB2k
	qqgP3mDqmOZ3nHJtBeMPXA0a3mRPw0mdMUGbvfnngMDUJQpq4TLGnFaln9KDNt8wkbsw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEfFW-0004o1-LV;
	Tue, 13 May 2025 02:20:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uEfFL-0004ms-LA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXGmZpUQhQHospK+s/uw2hzAi4UtWT9eQTqWYOLnjEg=; b=hT2/lMDimCG97vHlbwpKoUrg5P
 186a3fJOYt/pi/aapJFgqeUWETUZ+XqRGMY0O84H+aNDuASMzB39c0Dkk69rX6xLC4sAabsx6Mikb
 cDOe8/yakJ/Yh4Yb9MVl+xVAPwa5AYl+OZUO+hgtLI3pKesiH9U0wHY2GQxQBMGi5Qdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mXGmZpUQhQHospK+s/uw2hzAi4UtWT9eQTqWYOLnjEg=; b=OvLNQQujiqlxBQjqVX14p9EvZS
 zUXRq8UrJPbCQvCBi/yFKPSzq7YuPsbqk1JvoicEHkbInXwPxCLAKT4e3YRMh0r78gv+z/061sGLO
 ap/xitrAcGYcGkNkOomHkJ5GPqUhd8GWrboR7kosGnUhKvAMVToC/BofoKltuGTF9nIA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEfFL-0006kj-4E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747102784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXGmZpUQhQHospK+s/uw2hzAi4UtWT9eQTqWYOLnjEg=;
 b=iFode5ESz80+PlwBLqGUKEyJTFvFQFRglaMFWviUZk9Jya8FpBEGblVokkxK52/LeGkSkN
 6fcy1cKeFgvnS4ilflmhHAa8DR0YGKmlgxFIUdjfPB4DXQHM3SO8aVHCghkG9jJoHQf9JO
 GrAUpDTYGm5L33F2pjc3aZOpyHQE3kI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-5PTA2w_LOX6loIbolS0d7Q-1; Mon, 12 May 2025 22:19:42 -0400
X-MC-Unique: 5PTA2w_LOX6loIbolS0d7Q-1
X-Mimecast-MFC-AGG-ID: 5PTA2w_LOX6loIbolS0d7Q_1747102782
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-86184fa3d00so409802439f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 May 2025 19:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747102782; x=1747707582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mXGmZpUQhQHospK+s/uw2hzAi4UtWT9eQTqWYOLnjEg=;
 b=QhZzzs+5ATkvlMEeVE37vYydyUFd6NlsohKjM5pkGIr24TJ0ZwJgJUkLFNEpYrgbMs
 Ct1Y8zR84EcZFHv4AqiN5Z6vZhMJkm4Hj9+CcGcRcuAYJKhxXRQo+rHSku8mQ+JCHODT
 HjdcdLiy4nIKlEoEX3QTQoV/6NP44picHMM/nOd28NAIa8OG+O7VVyB2poD+zPBQ714q
 H2Q0n0p2vMK3v3MN4P0sUpq3pigoKBAZ6O2KduqTvDiKpyIog2rXIy4ENCvyY0WK7b9n
 8is/hLWY8/17bisHT0Qsg4L04+V9cpT0ckjolIcj2vE/yJZ0nbkFKnHdkh17yfOZB6Wh
 US6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKME8+h3SAL8Y4EaX4JF7rMWUi8juL6giR0ldlvKoFdKhEbEI57e+qkDPfE3Waf/9hwHnVIdUzEu72fZf6FvhU@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzJp6KduD2YeWf/xBrpm6BvXwWGNHSq3mTlQvGIj62sopMa8hsL
 FpqOcdqBh6nhJgPDTss6iEgMM/8/1FwlTgu2Qju8IFfeFvQ4aqLh8tZdKusW4Zcevpn+iQBa5sC
 CzGbNP4fC5zA4db8cn1BxrfTG9ewkzvtNXvrN+oUCuKCbe5uJetRvluCu3UvZe7gmyZ9ZuXVQ70
 k=
X-Gm-Gg: ASbGncs2nMN3QB/u9x4IqlT+Ck0M4YRRN31poWOqesBzPr8zekzEsKYkoP/hFtq96uW
 ur9fdaaG+yZ61Pi+1GovTHiveil6xqXpIstcytZXJJCCEvZ9+CKpyfGQjlUSy33J338pmLZnX7E
 +rDTHmL8emnxlFHqV+/K/YBLok3haIZawHjeeDfTXONl3O5VO5NmAZ8I5zD4dAHSZi85JPBuZXK
 8Hz7WoJqtrJvcLXFXsfN6oNpbDBM6+viZj+S8BBzIawwEHB71n2P1rBG2rDnNtas5ABn7MY4vRy
 bMg7ruyL6FuuM3ORRQZ0
X-Received: by 2002:a05:6602:6b8c:b0:85b:3763:9551 with SMTP id
 ca18e2360f4ac-867635af36amr1635756439f.7.1747102781988; 
 Mon, 12 May 2025 19:19:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOhcalIREkiZVkrSscfcuGDC4czbYcy+koD4S+Yaopmch1H+xJBMcd1eUDEPUJlDM+wTm8Xw==
X-Received: by 2002:a05:6602:6b8c:b0:85b:3763:9551 with SMTP id
 ca18e2360f4ac-867635af36amr1635755139f.7.1747102781629; 
 Mon, 12 May 2025 19:19:41 -0700 (PDT)
Received: from [10.0.0.82] ([75.168.230.114]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2249ff80sm1899160173.16.2025.05.12.19.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 19:19:41 -0700 (PDT)
Message-ID: <3fe6be01-b9bf-4e26-b3f6-32dafe0a8162@redhat.com>
Date: Mon, 12 May 2025 21:19:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <b56964c2-ad30-4501-a7fd-1c0b41c407e9@kernel.org>
 <763bed71-1f44-4622-a9a0-d200f0418183@redhat.com>
 <74704f7c-135e-4614-b805-404da6195930@kernel.org>
In-Reply-To: <74704f7c-135e-4614-b805-404da6195930@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nixdecw13fkI5UXNOeKyjTI_E08Qu4DcKs77U4OUeb0_1747102782
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/11/25 10:43 PM, Chao Yu wrote: > On 5/8/25 23:59, Eric
 Sandeen wrote: >> On 5/8/25 4:19 AM, Chao Yu wrote: >>>> @@ -2645, 21 +2603, 11
 @@ static int f2fs_remount(struct >>>> super_block *sb, int *f [...] 
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
X-Headers-End: 1uEfFL-0006kj-4E
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, jaegeuk@kernel.org,
 lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/11/25 10:43 PM, Chao Yu wrote:
> On 5/8/25 23:59, Eric Sandeen wrote:
>> On 5/8/25 4:19 AM, Chao Yu wrote:
>>>> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct
>>>> super_block *sb, int *flags, char *data)
>>>> 
>>>> default_options(sbi, true);
>>>> 
>>>> -	memset(&fc, 0, sizeof(fc)); -	memset(&ctx, 0, sizeof(ctx)); 
>>>> -	fc.fs_private = &ctx; -	fc.purpose =
>>>> FS_CONTEXT_FOR_RECONFIGURE; - -	/* parse mount options */ -
>>>> err = parse_options(&fc, data); -	if (err) -		goto
>>>> restore_opts;
>>> There is a retry flow during f2fs_fill_super(), I intenionally
>>> inject a fault into f2fs_fill_super() to trigger the retry flow,
>>> it turns out that mount option may be missed w/ below testcase:
>> 
>> I never did understand that retry logic (introduced in ed2e621a95d
>> long ago). What errors does it expect to be able to retry, with
>> success?
> 
> IIRC, it will retry mount if there is recovery failure due to
> inconsistent metadata.

Sure, I just wonder what would cause inconsistent metadata to become consistent
after 1 retry ...

>> 
>> Anyway ...
>> 
>> Can you show me (as a patch) exactly what you did to trigger the
>> retry, just so we are looking at the same thing?
> 
> You can try this?

Ok, thanks!
-Eric

> --- fs/f2fs/super.c | 6 ++++++ 1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
> 0ee783224953..10f0e66059f8 100644 --- a/fs/f2fs/super.c +++ b/fs/
> f2fs/super.c @@ -5066,6 +5066,12 @@ static int
> f2fs_fill_super(struct super_block *sb, struct fs_context *fc) goto
> reset_checkpoint; }
> 
> +	if (retry_cnt) { +		err = -EIO; +		skip_recovery = true; +		goto
> free_meta; +	} + /* recover fsynced data */ if (!test_opt(sbi,
> DISABLE_ROLL_FORWARD) && !test_opt(sbi, NORECOVERY)) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
