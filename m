Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDD378FD0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 15:59:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg6RK-000325-0g; Mon, 10 May 2021 13:59:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ecree.xilinx@gmail.com>)
 id 1lg6RH-00031p-Pw; Mon, 10 May 2021 13:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=; b=X+VFuzinfsGrVKClnFo7mH7qne
 VoOLsHUHfyY+ZJXYrHeDJMerrmncYPRryikd0l4HkMuR5vlAVG9scU3kFgcbSOj+FeBm0rl/a+RAC
 9iP8mYXDI+0Bud4F8GmwHf7jLfJy9thmBk0AUpp8qWnnfadop5/xa1OMB3r0Ke6gvnpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=; b=A6RWCymE/jKH7uU8er9QHKaZgw
 qsCZxKLbPTpT3hf4RHbpaK+NQx93K0zA6R2J76uybrseme7yXfNrC9vQbEbCX79cypnb0/BbMSZ1p
 Zj3++qb3SxhtIqY+B1dp13f80HMQfKZLB/tIeMb38dWmKRApI5uaKZ/0RxZY6tFwQ+7k=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lg6R8-0006zR-Ru; Mon, 10 May 2021 13:59:16 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so2564492wmq.0; 
 Mon, 10 May 2021 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=;
 b=eI3N1Fpg9OGfxDYeN9CkM6JnUmUHl5WgQKsZJBAEe06N6eQIW+N/2eMqTIlrsyK/qM
 Xa35uzmXt4bi7Z5ExQmBDGcCmQr1UD910O1m2RozktwaOIV8OjhOXtuMqdS2t5KIlfV2
 /xSjuQtpNfwsgUMZT4YbuSWeEoVUpnkLWdYWx57GHC/JMnIbfeomB6X1EwhI6GqtNjJz
 5mS+m2iGgDDSAr7pACiBgtShvHO5CxZyag+ZmeEb/XAmakP22Iz1mAVAu5X4yPcneMls
 MNKS6aX+UYGYTiDpkPzh+zNyC5KsbwVbzbmTl9DNNLPJNUbSwFzwjXpWYoyfaT3bHk/5
 tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=;
 b=SpDOJL5j8cs43CPgCFSkFDI0m+g2xeGqmskqA2DUV/vIWXpYQEx7yZ6CjyyfRgUFao
 fUPF4pNG/z0rm7W83N5afIutYpQRYpaUFnTi3ysL+T5GPOz0ewKABMC1p5DaEZxBtF45
 bI0RUmMUmyRP9cJXWD8Ew78DPbZOLVtsCm2nbEO36ahCIssappBIDBYFrpTbyWI5OlBr
 WwPb9ehIF99NPPZAbBHnHvAGVlYiCXVQUuM7QXxPathpaI81SWLdrjqHNWTjTV16rUsr
 LgrE8nNkoAIxC0YGSUZYnUu0BqdJSkihrH82Mq0gZfKDvzu2BcFXg/dHbYLVOEcQXb1n
 Dtyg==
X-Gm-Message-State: AOAM530G1fdj6w7m+ks4f6fHZIpJhSLgiCwgeq2W1JYUEjvnERE26CYB
 IlUGvRGVFT5tTdxHisN4teWbdwreqWG3/w==
X-Google-Smtp-Source: ABdhPJxuRWxshXLY3D3BIGKPZC8k+BUcpGElfoLV7AagS8fiv45gCBBhTdzQWkysFh21R1ZatES2dQ==
X-Received: by 2002:a1c:e38a:: with SMTP id
 a132mr26226331wmh.135.1620655141215; 
 Mon, 10 May 2021 06:59:01 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id d127sm25703586wmd.14.2021.05.10.06.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:59:00 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <20210510153807.4405695e@coco.lan>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <b3366f65-35e1-8f1a-d8d8-ebd444c9499d@gmail.com>
Date: Mon, 10 May 2021 14:58:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210510153807.4405695e@coco.lan>
Content-Language: en-GB
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (ecree.xilinx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg6R8-0006zR-Ru
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMDUvMjAyMSAxNDozOCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IEVtIE1v
biwgMTAgTWF5IDIwMjEgMTQ6MTY6MTYgKzAxMDAKPiBFZHdhcmQgQ3JlZSA8ZWNyZWUueGlsaW54
QGdtYWlsLmNvbT4gZXNjcmV2ZXU6Cj4+IEJ1dCB3aGF0IGtpbmRzIG9mIHRoaW5ncyB3aXRoIMOX
IG9yIOKAlCBpbiBhcmUgZ29pbmcgdG8gYmUgZ3JlcHQgZm9yPwo+IAo+IEFjdHVhbGx5LCBvbiBh
bG1vc3QgYWxsIHBsYWNlcywgdGhvc2UgYXJlbid0IHVzZWQgaW5zaWRlIG1hdGggZm9ybXVsYWUs
IGJ1dAo+IGluc3RlYWQsIHRoZXkgZGVzY3JpYmUgdmlkZW8gc29tZSByZXNvbHV0aW9uczoKRWho
LCB0aG9zZSBhcmUgYWxzbyBwcm9wZXIgdXNlcyBvZiDDly4gIEl0J3Mgc3RpbGwgYSBtdWx0aXBs
aWNhdGlvbiwKIGFmdGVyIGFsbC4KCj4gaXQgaXMgYSB3YXkgbW9yZSBsaWtlbHkgdGhhdCwgaWYg
c29tZW9uZSB3YW50cyB0byBncmVwLCB0aGV5IHdvdWxkIGJlIAo+IGRvaW5nIHNvbWV0aGluZyBs
aWtlIHRoaXMsIGluIG9yZGVyIHRvIGdldCB2aWRlbyByZXNvbHV0aW9uczoKV2h5IHdvdWxkIHNv
bWVvbmUgYmUgZ3JlcHBpbmcgZm9yICJhbGwgdmlkZW8gcmVzb2x1dGlvbnMgbWVudGlvbmVkIGlu
CiB0aGUgZG9jdW1lbnRhdGlvbiI/ICBUaGF0IHNlZW1zIGNvbnRyaXZlZCB0byBtZS4KCi1lZAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
