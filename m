Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1A89BA1A9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 18:22:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7Hp3-0007h7-MB;
	Sat, 02 Nov 2024 17:22:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gmazyland@gmail.com>) id 1t7Hp2-0007gu-0I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 17:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=; b=fZe9nwABV1X/II/pQdKGO19ZbX
 u1/osFEjWwqX18OrWx50UPyh8SY0uqX35ZYeofKaO8kFJYFJ7curAE1nr2OcWM4QzUHTHckk2Z+6d
 Va16nA8TCa3cLKypDCfB9VCclzTSi5A5Ry+al5Ag8ns8GhrGOrmUSNVOZImhBswAwW94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=; b=Wnz+S7E0MTIch96noqi54FGHuJ
 KzB9XmHTgiS1NavvdEv5VSA4LHMdUGDDXP2DscRA9ll0zs9FZnG9am7BBY4gb0yG1txCvkGhFMCEm
 fIij15k0rfZoAuEZga1vcGXMWSRJUU2cmNmdzasUpvNbHrY/l044uAIxTqOqUzavxdR4=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t7Hp0-0007zr-8w for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 17:21:59 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so1950421f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 Nov 2024 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730568112; x=1731172912; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
 b=Bi/GYt9pMopUGgP1fhQ1rJaoNulb2xSzAKzXelHCKV+GdLx3w7QW1uvkTdOIFexqOj
 aMnIPzoBQw87hNBmJXLtyiK/W1K7LmKsR2M/FKAajo4u8De1iZ0INwBQBP3/U1Y/BEvy
 PhirxmN6/66Nut+bvdZI1CUiJinxom9sp5R9D/gFeoJDObu9QGIIBcbTqPwTlVtMotwD
 KVn4lj04K6ep/tV6/SrZNrixcsCUsqSX2gNyv4m7CWCGCfbLJ0u2uDgzYBAhrrdv/JTZ
 EM9dvAdU5mueuJJ9BJIa3Txf2EFHvzZk+dDxKY7WC2BdX0SPpnljFryareyyI+dIDaCH
 kywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730568112; x=1731172912;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8t9oRS8jqFz7JqVHrKzcZwls154V3gx6wMcbOAYsmHY=;
 b=xB+prFSmCArzWRvijpJa1X31LkubFmGttBP61nUP2nXppB2MgUh4qVVOYGjLFqGYvd
 SB7fgbAYQCDA5OvNFfKBxXw3ohy92AmYWEFw6yn4fjfiV6amDNLLIOfaRrmjvcb6SwPG
 PtmEfHJTX7GiCx9OHPaIDJSYjWTSpdy4iQxoHVPpcEfXDhUJBXbJO0f5XUOBPpFLE1J8
 9355y3WtPWsoNhSled1Uhjbg+zHRaMjBhlPcvODy3GqBAxIkNM0dOZlFjP8nBr9EG43K
 wsRgiMglOD8UP0D+P7eNLRFxeJWqv2t6jDEqGFSb/U0GcTMYT1qMTsYUhVjJ4S9CGH2E
 vPjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPNd4JhqJ/umFajnB77eojUpxnIAulwMGWJewEoSBBnxNmR1ZXvutUV7bF1+Og7elU1bzsTnnFp2Hu/vP5vbDm@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywes3WwhnGCzDeV7eCFLJSHm8hY8XTuI2df/1WghBcoZqe1HgmG
 fZz4t4uFCiy+YOaP1zmmjhxUr5nsqZY18VXQ9Ugmz9kKIhNxcZXK
X-Google-Smtp-Source: AGHT+IGi2uIS+syMjf4Zb3uVjiFcNrb793MRtp10AmIBh8gU8g/TTGAjyc3KAIibvpjiJFec6IflZQ==
X-Received: by 2002:a5d:5f96:0:b0:37d:324f:d3a9 with SMTP id
 ffacd0b85a97d-381be7add20mr8712682f8f.9.1730568111468; 
 Sat, 02 Nov 2024 10:21:51 -0700 (PDT)
Received: from [192.168.8.100] (89-24-32-122.nat.epc.tmcz.cz. [89.24.32.122])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b80sm8686121f8f.10.2024.11.02.10.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Nov 2024 10:21:50 -0700 (PDT)
Message-ID: <8784622f-ccdc-4086-83f7-50462d6369df@gmail.com>
Date: Sat, 2 Nov 2024 18:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
To: Eric Biggers <ebiggers@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
 <20241102163605.GA28213@sol.localdomain>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20241102163605.GA28213@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/2/24 5:36 PM, Eric Biggers wrote: > On Sat, Nov 02,
 2024 at 07:08:43PM +0800, Herbert Xu wrote: >> On Sat, Nov 02,
 2024 at 12:05:01PM
 +0100, Ard Biesheuvel wrote: >>> >>> The only issue resultin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.41 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [gmazyland[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t7Hp0-0007zr-8w
Subject: Re: [f2fs-dev] [PATCH v2 04/18] crypto: crc32 - don't unnecessarily
 register arch algorithms
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/2/24 5:36 PM, Eric Biggers wrote:
> On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
>> On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
>>>
>>> The only issue resulting from *not* taking this patch is that btrfs
>>> may misidentify the CRC32 implementation as being 'slow' and take an
>>> alternative code path, which does not necessarily result in worse
>>> performance.
>>
>> If we were removing crc32* (or at least crc32*-arch) from the Crypto
>> API then these patches would be redundant.  But if we're keeping them
>> because btrfs uses them then we should definitely make crc32*-arch
>> do the right thing.  IOW they should not be registered if they're
>> the same as crc32*-generic.
>>
>> Thanks,
> 
> I would like to eventually remove crc32 and crc32c from the crypto API, but it
> will take some time to get all the users converted.  If there are AF_ALG users
> it could even be impossible, though the usual culprit, iwd, doesn't appear to
> use any CRCs, so hopefully we are fine there.

Hi,

Please do not forget about dm-integrity, it can use crc32/crc32c for non-cryptographic
integrity through crypto API.
To test it, cryptsetup testsuite should cover these variants (integrity-compat-test).

Also, libcryptsetup can be compiled with userspace kernel crypto (AF_ALG) as a crypto backend.
At least, I think we never used CRC32 though AF_ALG from userspace there...

Thanks,
Milan



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
