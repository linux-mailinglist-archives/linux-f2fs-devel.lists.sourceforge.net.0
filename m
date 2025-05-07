Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55739AADF36
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 14:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDPDbaF9/RfDY6fUxvuzOusOXkJ97x+BXTF3jc85PCU=; b=lNwMy+s1FQxbqBEyejfM/Dn7oN
	XkdalF+gS4iUlUzAT97Eb1Z+AU6cQ2L3gdND0VP5ToAeN4s/tdcJu11OEgIzjHTG2zpiAhf+Xeec+
	HRJba5wNuQJTjuUiC05MacJuQyGFszELNC/MdlIXyL3dauVYRZ0tiMN7Rxz0hi6JUBAU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCdwC-0004FX-HL;
	Wed, 07 May 2025 12:31:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCdw8-0004FO-2T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 12:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYtdEZFWKmpC8xSomua+Eb/tpZI4qDTrOenLKiGUZTY=; b=R3KQLQPqmfp59l1g/fUvQJP6KJ
 keKlQ5MJzAUGvwwUhqoqbPPMLYqsMZTpaYWD93XBg7b3DOpXDrPPBFdZ8k0EHJRuAagjRSLu/5u9S
 aeS/49Tz4UWNhxbdBh5CvnKIxMMVC/kyfDe53hnUnEkzNfReS6lEuAxsyqNRpvdGQOwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lYtdEZFWKmpC8xSomua+Eb/tpZI4qDTrOenLKiGUZTY=; b=jsEK3XEwv7jmdn9SeOqQ6Nw1HP
 55Akk55QtRfux5QOxNbhEWSsDz/2fsT+0oeHmuDD7YE4DmnJuDsLnBW0J5JUUCqhj34IAECThRSVX
 ph6yW6MdMnB/pmrB43kDj7laMRo78CtVx0THpgsV0racklpeoB4o4/UT4O/k1e9w6Stw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCdvs-0005MA-E6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 12:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746621077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYtdEZFWKmpC8xSomua+Eb/tpZI4qDTrOenLKiGUZTY=;
 b=D1uhdeD7kyAIDE+m+B3Z2M6pAqMvMo25IeNf+mC5j8Qn9yQ2Xl9qbA2eAyZbG3TRRdyApW
 NaPo+ze+tI+5YdmHXdnPk4Gm7ZoRMJTP9oZGvfde74CzXc89CClbTgPbZC0aDwU9yn9Dmq
 MKCBAESfz6+Hoyy2HKwjO8TeB1xdcrA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-rSeN8ixQNxuzFpSQNeccQA-1; Wed, 07 May 2025 08:31:15 -0400
X-MC-Unique: rSeN8ixQNxuzFpSQNeccQA-1
X-Mimecast-MFC-AGG-ID: rSeN8ixQNxuzFpSQNeccQA_1746621075
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3da779063a3so1926555ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 May 2025 05:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746621075; x=1747225875;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYtdEZFWKmpC8xSomua+Eb/tpZI4qDTrOenLKiGUZTY=;
 b=Lk3XXCdEuIyKJFtMtdbEBjFmNv3JX3Wkmp/XE6QaDDrWdY1tNlcJpVFxzcKDvdasrd
 Op4Ue3JNsOBhhtNf75b7xp3/fNB8jqRZNQoAy/VveIZAE3CW0zRfB1TcaTMmhkEZSr0Y
 36yWjonvaFAYKpi8lRMA3fwJWyu5b2fryNtpdVJR4/Kr+l6AYYYwv9oDdhVOaIHWPZ83
 7dJ6AAmq6e8u/MsZ7RiOT5iPjulJiVthAr/KijDZ8nNZ43dFWM8b4EW7uoGIh2DO7gmn
 FoLZJ4phgLF7qzmgvrUw0fUi8uzXu1LbgPN1FUYfeFRUz+HSa+UEOKJ0k3C6+HhfTxyq
 HRRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAS0m49jdro7MwtBgojnMN622TrH//UHNniExj6dnTntYYjygmmKuMqCFD3gC8tHmFKCEupsA5uBshzvshozMf@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzwJe6t7jBMJjRyPwRLZf3GWVmkDe/FF0pOBuVYZ7H+UJW/HA0D
 Hdij+J5QxA9fFWLiTBH9Q/3l68onVLWIozPHQaTxAKikBo6RSDfX8gV/gkKEGaDvm/2DUm6tw0H
 bC327A+hD0J5o2wi63ceT8ebHKDJvHBiIr+TN6zrMjFpmQoOM4bIxCJK3sT0tD7uZIJnzXi4dfv
 Y=
X-Gm-Gg: ASbGncvmgZVcV0u5f35fvIt3iojOkUqR3lbuQsx/0DVX492P96BZd02D09cqeznGwhC
 D/t3hO3GdU3Y4NbrqSHIM4Nm/l5E94MFSxq5JDzsM+fW57043UqyoYzFeCZR4a2x96TPuWY5Crq
 aqC22p+Mholj4DZ9beGwYnYxlLJgpXUp8acR/u1Iggy3Mlx16051aU8baonoQFDXdICbOyFNqsM
 bQfJRPYxrL5KM9gD1xrdeLCBLb8GfnEeHjLJoO304CPVvGNAAWZoCrNpEkPh1saU9HGNBdG0g5y
 k7OOyMmbFDiENR5U8H0rqkGpTpQjnBPVn1SDJkB7cwaUMkc1Anyd
X-Received: by 2002:a05:6e02:3709:b0:3d8:975:b808 with SMTP id
 e9e14a558f8ab-3da738d8a98mr34022465ab.5.1746621074965; 
 Wed, 07 May 2025 05:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQAiNI9kfVQqBa8xVioYNC5IOk9jOeCgJeTdIQHIoZgNy+sJuKSFYSQWdauJCP5LwEyafPSw==
X-Received: by 2002:a05:6e02:3709:b0:3d8:975:b808 with SMTP id
 e9e14a558f8ab-3da738d8a98mr34022095ab.5.1746621074663; 
 Wed, 07 May 2025 05:31:14 -0700 (PDT)
Received: from [10.0.0.82] (75-168-235-180.mpls.qwest.net. [75.168.235.180])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f8a0c3df0bsm2372652173.73.2025.05.07.05.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 05:31:14 -0700 (PDT)
Message-ID: <db0c33f2-9fa0-4ee7-b5c9-e055fcc4d538@redhat.com>
Date: Wed, 7 May 2025 07:31:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250420154647.1233033-1-sandeen@redhat.com>
 <20250420154647.1233033-3-sandeen@redhat.com>
 <2e354373-9f00-4499-8812-bcb7f00a6dbc@kernel.org>
In-Reply-To: <2e354373-9f00-4499-8812-bcb7f00a6dbc@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9scR-BsaxIZLyn3QG6aH7aTIUxkvnl4TahbHf-EB91Q_1746621075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 6:26 AM, Chao Yu wrote: > On 4/20/25 23:25, Eric
 Sandeen wrote: >> From: Hongbo Li <lihongbo22@huawei.com> >> >> In
 handle_mount_opt, 
 we use fs_parameter to parse each option. >> However we' [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [170.10.133.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCdvs-0005MA-E6
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: move the option parser into
 handle_mount_opt
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

On 5/7/25 6:26 AM, Chao Yu wrote:
> On 4/20/25 23:25, Eric Sandeen wrote:
>> From: Hongbo Li <lihongbo22@huawei.com>
>>
>> In handle_mount_opt, we use fs_parameter to parse each option.
>> However we're still using the old API to get the options string.
>> Using fsparams parse_options allows us to remove many of the Opt_
>> enums, so remove them.
>>
>> The checkpoint disable cap (or percent) involves rather complex
>> parsing; we retain the old match_table mechanism for this, which
>> handles it well.
>>
>> There are some changes about parsing options:
>>   1. For `active_logs`, `inline_xattr_size` and `fault_injection`,
>>      we use s32 type according the internal structure to record the
>>      option's value.
> 
> We'd better to use u32 type for these options, as they should never
> be negative.
> 
> Can you please update based on below patch?
> 
> https://lore.kernel.org/linux-f2fs-devel/20250507112425.939246-1-chao@kernel.org

Hi Chao - I agree that that patch makes sense, but maybe there is a timing
issue now? At the moment, there is a mix of signed and unsigned handling
for these options. I agree that the conversion series probably should have
left the parsing type as unsigned, but it was a mix internally, so it was
difficult to know for sure.

For your patch above, if it is to stand alone or be merged first, it 
should probably also change the current parsing to match_uint. (this would
also make it backportable to -stable kernels, if you want to).

Otherwise, I would suggest that if it is merged after the mount API series,
then your patch to clean up internal types could fix the (new mount API)
parsing from %s to %u at the same time?

Happy to do it either way but your patch should probably be internally
consistent, changing the parsing types at the same time.

(I suppose we could incorporate your patch into the mount API series too,
though it'd be a little strange to have a minor bugfix like this buried
in the series.)

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
