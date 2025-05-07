Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C1AAD43C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 05:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVO8brv8cvHm3mmbil/uyxaN7GD1mvUAxr8otlYA/KE=; b=hANDNr5+guTvYUCvvhyzTxd1A/
	yLs22vge4Epq31n/jsisSbsAFFSs726NtRiVmXfVgZvXZ3zh8dTnx9adecig3RLSm3nCu0WgomM4B
	l4MaYQsEgtcLrAXsS6sJQlWsUjLjrNfZDGdV9FlYDMfocQG6t44Ow2Lh21S+TBzFD/HI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCVix-00063n-Hy;
	Wed, 07 May 2025 03:45:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCViw-00063h-4f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 03:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iUptd6F4oG0VOYqO06dHpB/sMUUK+Y82o4gN6z00S3I=; b=XvLdAAqfV6xggo5gbw2SrdSmCz
 8Ecaf2GoZXVBjnRY6ZER0b/RN6HzxpCQHS5sIswpbY66s7Rb+QlAso3B+sUM9FB5cSSvxqOH/oUAJ
 zrzlTlkk0EfXDQYlZavp6dPB9pYu1IWK90AqjqPEXMbwvHO1RF7glJo7dNzruwu7Y5nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iUptd6F4oG0VOYqO06dHpB/sMUUK+Y82o4gN6z00S3I=; b=DyCmLSHcfOSLWa1KaUglBqHT3O
 E5/ofwmN6S4ckGhhADxu5ai3v8iuCb5YGueYr70GRdDUVaPjC6ga8wIoV+2Ya8Cl4mfNzHrq+sH/L
 Xv85smRA/mnxtkJyqKYiddZJFzvsgrPkwMvR5E+SJxu0b0PMmUewz9Umy0aG8fBR1PcQ=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCVig-0001Li-Ki for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 03:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746589507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUptd6F4oG0VOYqO06dHpB/sMUUK+Y82o4gN6z00S3I=;
 b=AVjQblnnafiJkXIfz8jlfFugmXi//rhXVmSfTer2bMJlMqUBbbLitqYmx125ybMpR6Lsvv
 cf8O3jXOP4ip7Q26w6Ppwh9NDqtxvh3cNGh0/W8W5vFlDJlRDhSs6NSrplDAPPeCbLBkA9
 hhUft8WVIPsd+MSBS/Qy5egxVeLLvYc=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-WaunraG6OtWHMo152zdzpA-1; Tue, 06 May 2025 23:45:06 -0400
X-MC-Unique: WaunraG6OtWHMo152zdzpA-1
X-Mimecast-MFC-AGG-ID: WaunraG6OtWHMo152zdzpA_1746589505
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-85dad58e80fso1773853039f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 20:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746589505; x=1747194305;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUptd6F4oG0VOYqO06dHpB/sMUUK+Y82o4gN6z00S3I=;
 b=lCjwchFCLE46frQR6+iy2W/VxCmleuAjenl/fBqIURITALtV896URBTzvVrMQO5Ly9
 zO4UUPHgIEhGx+RqsEuFyqj3mmBnOOLTpK0Q3fsfLK7MBPd95MKew5ZjYzlM3vbf+fZe
 +1VePyGbjchQNXElP0bCBswPTBTwhaAWiQK96be1P7FjI1ifI/3XvlBhvmh5R7BjbRWV
 OJmir+3u0YAffP5M62KTpbOo/hzeYtnRRs56T+6dwQOL9h3VJSa0/MvH8VGwBtm4Mdan
 e0qx/XzW5k+SllWokL19HYisC7JZiZhNY+VHJ7ohrduaFVPVcbDqtb/SMOTWAi0ka/P3
 Wv6A==
X-Gm-Message-State: AOJu0YwTLvjgcy25Q4tqZytXkPo7+NJYKRLuTBhY/5iWMMaa66tvqyGg
 DYDDNaLp1jsYRrt1DiEbrL3K2Ls2hGr9ju+OlpJk5+zLp/t6gSAA6FD0DekLwfi7BrDQ5LtohCT
 TIYTKHzSkKXIzL62GSwChD7luqm5aY7Z4jq/d0S66qhrOeUld2bayn3L9kL1pEV7SoWJjaQFwYE
 H5P3JHFAfdLg==
X-Gm-Gg: ASbGnctxm5x0M7a/UJ0CXFRVD7+jRxFJ1w67vEpi/xdkCweb8bfEXZ/RyTdHmJIBj1M
 LD6jl4zoHmsDgcRWAoOXBruUxASShrIydUUIpKi/ydyE6du3v1+ZzSg8NCyUSboa3WonFJZLbYK
 w9G1Mtn96mIJMZ3z4Uotj81Owrr0zdZJ2c4oxG1W+b2nQHKVhpGBFSGB8+0ysaVixYVk9XgbuHK
 mxQPWeJGNa9Y22ijaa38r5m5X/aq8CYi2zRL5eIOjzNJJPrZiMJKGBtT3U0OrmMew64+1y9qNlH
 CApIF79JNc3VPct5d3pnzkFH68TfXr2yq37KSL1zq9upTuEiKA==
X-Received: by 2002:a05:6e02:1549:b0:3d9:6dfe:5137 with SMTP id
 e9e14a558f8ab-3da738f962emr17763515ab.10.1746589505411; 
 Tue, 06 May 2025 20:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQx6RG9So6DDmRMAzVujY6px4pWLDRiLTL/2yLNLQkiwi7UZTvELyeKidJqYkoIMKlHB5f6A==
X-Received: by 2002:a05:6e02:1549:b0:3d9:6dfe:5137 with SMTP id
 e9e14a558f8ab-3da738f962emr17763345ab.10.1746589505056; 
 Tue, 06 May 2025 20:45:05 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975f73e68sm28266455ab.72.2025.05.06.20.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 20:45:04 -0700 (PDT)
Message-ID: <25cb13c8-3123-4ee6-b0bc-b44f3039b6c1@redhat.com>
Date: Tue, 6 May 2025 22:45:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
 <aBq2GrqV9hw5cTyJ@google.com>
 <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
In-Reply-To: <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yJXPlFo3yqwUAsBQ8y0cooKkJgfcD3hTngVLd_xVyUg_1746589505
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/6/25 9:56 PM, Eric Sandeen wrote: > On 5/6/25 8:23 PM, 
 Jaegeuk Kim wrote: ... >> What about: >> # mount -o loop,
 noextent_cache f2fsfile.img
 mnt >> >> In this case, 1) ctx_clear_opt(), 2) set_opt() in default_options,
 >> 3) clear_opt since mask is set? > > Not sure what I'm miss [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [170.10.129.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uCVig-0001Li-Ki
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/6/25 9:56 PM, Eric Sandeen wrote:
> On 5/6/25 8:23 PM, Jaegeuk Kim wrote:

...

>> What about:
>> # mount -o loop,noextent_cache f2fsfile.img mnt
>>
>> In this case, 1) ctx_clear_opt(), 2) set_opt() in default_options,
>> 3) clear_opt since mask is set?
> 
> Not sure what I'm missing, it seems to work properly here but I haven't
> pulled your (slightly) modified patches yet:
> 
> # mount -o loop,extent_cache f2fsfile.img mnt
> # mount | grep -wo extent_cache
> extent_cache
> # umount mnt
> 
> # mount -o loop,noextent_cache f2fsfile.img mnt
> # mount | grep -wo noextent_cache
> noextent_cache
> #
> 
> this looks right?
> 
> I'll check your tree tomorrow, though it doesn't sound like you made many
> changes.

Hmm, I checked tonight and I see the same (correct?) behavior in your tree.

>> And, device_aliasing check is still failing, since it does not understand
>> test_opt(). Probably it's the only case?

Again, in your tree (I had to use a git version of f2fs-tools to make device
aliasing work - maybe time for a release?) ;) 

# mkfs.ext4 /dev/vdc
# mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
# mount -o noextent_cache /dev/vdb mnt
# dmesg | tail -n 1
[  581.924604] F2FS-fs (vdb): device aliasing requires extent cache
# mount -o extent_cache /dev/vdb mnt
# mount | grep -wo extent_cache
extent_cache
# 

Maybe you can show me exactly what's not working for you?

-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
