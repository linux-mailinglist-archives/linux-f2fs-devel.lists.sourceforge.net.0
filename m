Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9815C86C456
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 09:56:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfcDQ-0004f0-P5;
	Thu, 29 Feb 2024 08:56:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1rfcDP-0004es-7M
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 08:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sFkr5JxwsV6XvZDodaeTLDSdT/zdoLo0VmIMVo/2cDw=; b=Jy6Ix5ZVwWAGZfYZbbcd2DLQnQ
 16qukrOZ258U1BuaKXpsOW5mFrjDBqOhmvNs7fWaCSLg25V3RbvqNqQ0bvn/LRBf5oveIwatzkfFJ
 9ubWCJlIemZ3ZU2PLe65kYedfFKV55zS/ZA4td30eGLOQBmiWBy+NsTMnwAY0vk3L8LI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sFkr5JxwsV6XvZDodaeTLDSdT/zdoLo0VmIMVo/2cDw=; b=Dfl6OZnunZ2OBHdLkIGz+cxMIx
 csoqtz5isunmDC0fwT3otxz43jjBdKMrEtl5ayqbFMqLhTa8E00AQaEd35FKYUPqPG4qzoyrNPSYe
 +UdfaPeJ03/WiLcKS/OVbWn0Top2ESeT9wApW2odBdv6cOMtaZAtQeEUUAK0HWaf6LJk=;
Received: from mail-yw1-f182.google.com ([209.85.128.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfcDM-0004IL-03 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 08:56:31 +0000
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-60925c4235eso6739207b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 00:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709196977; x=1709801777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFkr5JxwsV6XvZDodaeTLDSdT/zdoLo0VmIMVo/2cDw=;
 b=H87bLc7kYxfEAPj7lh+8S7ztB71oqn0SiNRUoQoGQSKnviIX/RscTWhEyqaOvxIKiD
 6IeA3b8c/na/Hnx//35jBb4b5UmQxmVH6cUMFDZhiHDtH2E2z0Bq6J27x59xkXXvjEfY
 q6fl5LgIRnoFkrHF0BV59vKYF599QL4KaGmA7339qiZHVEHFCIxU7eSz922XdNizNFYA
 HL3Nv1btF1Wz9ZzChrtzVaATtJPYi+xhsRII1D5jPsCrBrYlS7IpR7W9Hsjp4h5RHuYp
 dtXWnr6Qn0YWlAcJ51XjHxGW3tCox8Mg7g/Ko/6fm/66IOT9VqCmg8P9UBiaGvOaI8Na
 2m1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK+yEmPn+VSH90lNjzkf/pYh4K+aMXL60kHGJXVqoNPvjVYbvodQGCUHb8AyxOZ7y0o5vhTEEZPTgeAkfcS9jqO3Ndj/gLYjBsxbmG4Bn6nPdMRYH5Lg==
X-Gm-Message-State: AOJu0YwEPhRSRDTos40ZI3KEG1Sgn3PsYlQ42/4mA41BXofVYUovU/0J
 B0zO4QMmc7VFWXvAmbPk53qEFNVvCdss24h7VvLgw3RhOKllE5gQoblXXTH+hzk=
X-Google-Smtp-Source: AGHT+IHUChlEVFmpfmNozm4s8jaY+tFWODkytTm4KK/YIyG92q+l7rL8QWo+s3eqhUyFciZinXbmpw==
X-Received: by 2002:a81:7355:0:b0:609:23fd:a3b5 with SMTP id
 o82-20020a817355000000b0060923fda3b5mr1535598ywc.40.1709196976834; 
 Thu, 29 Feb 2024 00:56:16 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 e68-20020a81a747000000b0060499a24901sm254629ywh.92.2024.02.29.00.56.16
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 00:56:16 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso784409276.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 00:56:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ7HBf1DuKPZzgEQQ69xvTlUkOCLHkpx9MVJRj4TNr2+fXQpEO4KcmKZbIJB0Bl7yqtRhg1AHtZsZAkRy7Pf/t0wL3FIPZlXCT+p8FRBJ4VmOLu/Iezg==
X-Received: by 2002:a25:bb85:0:b0:dc6:bcd5:9503 with SMTP id
 y5-20020a25bb85000000b00dc6bcd59503mr1607791ybg.48.1709196975769; Thu, 29 Feb
 2024 00:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20240221092040.403629-1-chao@kernel.org>
In-Reply-To: <20240221092040.403629-1-chao@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Feb 2024 09:56:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRuiV8PEe6azKYLp+z_Sa8CbL8849bzu59J1_XXtyk1g@mail.gmail.com>
Message-ID: <CAMuHMdXRuiV8PEe6azKYLp+z_Sa8CbL8849bzu59J1_XXtyk1g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao, On Wed, Feb 21, 2024 at 10:20 AM Chao Yu <chao@kernel.org>
    wrote: > Just cleanup, no functional change. > > Signed-off-by: Chao Yu <chao@kernel.org>
    Thanks for your patch, which is now commit 5fa6a97d27842dab ("f2fs: introduce
    SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup") in next-20240229. 
 
 Content analysis details:   (0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.182 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.182 listed in wl.mailspike.net]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [geert.uytterhoeven[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
X-Headers-End: 1rfcDM-0004IL-03
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS
 for cleanup
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCk9uIFdlZCwgRmViIDIxLCAyMDI0IGF0IDEwOjIw4oCvQU0gQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPiB3cm90ZToKPiBKdXN0IGNsZWFudXAsIG5vIGZ1bmN0aW9uYWwgY2hhbmdl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDVmYTZhOTdkMjc4NDJkYWIgKCJmMmZz
OgppbnRyb2R1Y2UgU0VHU19UT19CTEtTL0JMS1NfVE9fU0VHUyBmb3IgY2xlYW51cCIpIGluIG5l
eHQtMjAyNDAyMjkuCgpub3JlcGx5QGVsbGVybWFuLmlkLmF1IHJlcG9ydHMgc2V2ZXJhbCBidWls
ZCBmYWlsdXJlcyBvbiBtNjhrLgpodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9o
ZWFkL2YzMDNhM2UyYmNmYmE5MDBlZmI1YWVlNTUyMzZkMTcwMzBlOWY4ODIvCgpFLmcuIG02OGsg
ZGVmY29uZmlnICsgQ09ORklHX0YyRlNfRlM9eToKCm02OGstbGludXgtZ251LWxkOiBmcy9mMmZz
L2ZpbGUubzogaW4gZnVuY3Rpb24KYGhhc19ub3RfZW5vdWdoX2ZyZWVfc2Vjcy5jb25zdHByb3Au
MCc6CmZpbGUuYzooLnRleHQrMHgxOWVlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19tb2Rk
aTMnCm02OGstbGludXgtZ251LWxkOiBmaWxlLmM6KC50ZXh0KzB4MWEyMik6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYF9fZGl2ZGkzJwptNjhrLWxpbnV4LWdudS1sZDogZnMvZjJmcy9maWxlLm86
IGluIGZ1bmN0aW9uIGBmMmZzX2lvY19kZWZyYWdtZW50JzoKZmlsZS5jOigudGV4dCsweDIwNWEp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2RpdmRpMycKbTY4ay1saW51eC1nbnUtbGQ6IGZz
L2YyZnMvaW5vZGUubzogaW4gZnVuY3Rpb24gYGYyZnNfd3JpdGVfaW5vZGUnOgppbm9kZS5jOigu
dGV4dCsweDE2OTIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX21vZGRpMycKbTY4ay1saW51
eC1nbnUtbGQ6IGlub2RlLmM6KC50ZXh0KzB4MTZjMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YF9fZGl2ZGkzJwptNjhrLWxpbnV4LWdudS1sZDogZnMvZjJmcy9uYW1laS5vOiBpbiBmdW5jdGlv
biBgZjJmc19pc19jaGVja3BvaW50X3JlYWR5JzoKbmFtZWkuYzooLnRleHQrMHhhNjQpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBfX21vZGRpMycKbTY4ay1saW51eC1nbnUtbGQ6IG5hbWVpLmM6
KC50ZXh0KzB4YTk4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19kaXZkaTMnCm02OGstbGlu
dXgtZ251LWxkOiBmcy9mMmZzL2djLm86IGluIGZ1bmN0aW9uCmBoYXNfbm90X2Vub3VnaF9mcmVl
X3NlY3MuY29uc3Rwcm9wLjAnOgpnYy5jOigudGV4dCsweGUyOCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYF9fbW9kZGkzJwptNjhrLWxpbnV4LWdudS1sZDogZ2MuYzooLnRleHQrMHhlNWMpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2RpdmRpMycKbTY4ay1saW51eC1nbnUtbGQ6IGZzL2Yy
ZnMvZ2MubzogaW4gZnVuY3Rpb24gYGYyZnNfZ2MnOgpnYy5jOigudGV4dCsweDJmMmMpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBfX2RpdmRpMycKbTY4ay1saW51eC1nbnUtbGQ6IGdjLmM6KC50
ZXh0KzB4MmY1OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZGl2ZGkzJwptNjhrLWxpbnV4
LWdudS1sZDogZ2MuYzooLnRleHQrMHgyZjY2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19t
b2RkaTMnCm02OGstbGludXgtZ251LWxkOiBnYy5jOigudGV4dCsweDJmOTYpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBfX21vZGRpMycKbTY4ay1saW51eC1nbnUtbGQ6IGZzL2YyZnMvZGF0YS5v
OiBpbiBmdW5jdGlvbgpgaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNzLmNvbnN0cHJvcC4wJzoKZGF0
YS5jOigudGV4dCsweGRlOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fbW9kZGkzJwptNjhr
LWxpbnV4LWdudS1sZDogZGF0YS5jOigudGV4dCsweGUxYyk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYF9fZGl2ZGkzJwptNjhrLWxpbnV4LWdudS1sZDogZnMvZjJmcy9zZWdtZW50Lm86IGluIGZ1
bmN0aW9uCmBoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3MuY29uc3Rwcm9wLjAnOgpzZWdtZW50LmM6
KC50ZXh0KzB4MTZlZSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fbW9kZGkzJwptNjhrLWxp
bnV4LWdudS1sZDogc2VnbWVudC5jOigudGV4dCsweDE3MjIpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBfX2RpdmRpMycKbTY4ay1saW51eC1nbnUtbGQ6IGZzL2YyZnMveGF0dHIubzogaW4gZnVu
Y3Rpb24gYGYyZnNfc2V0eGF0dHInOgp4YXR0ci5jOigudGV4dCsweGY1ZSk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYF9fbW9kZGkzJwptNjhrLWxpbnV4LWdudS1sZDogeGF0dHIuYzooLnRleHQr
MHhmOGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2RpdmRpMycKCk90aGVyIDMyLWJpdCBh
cmNoaXRlY3R1cmVzIGFyZSBhZmZlY3RlZCwgdG9vLCBlLmcuIGFybS9zaG1vYmlsZV9kZWZjb25m
aWcKKyBDT05GSUdfRjJGU19GUz15OgoKYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZnMvZjJmcy9m
aWxlLm86IGluIGZ1bmN0aW9uCmBoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3MuY29uc3Rwcm9wLjAn
OgpmaWxlLmM6KC50ZXh0KzB4MWQ0MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlf
bGRpdm1vZCcKYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZmlsZS5jOigudGV4dCsweDFkNWMpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvCmBfX2FlYWJpX2xkaXZtb2QnCmFybS1saW51eC1nbnVlYWJp
aGYtbGQ6IGZzL2YyZnMvZmlsZS5vOiBpbiBmdW5jdGlvbiBgZjJmc19kZWZyYWdtZW50X3Jhbmdl
JzoKZmlsZS5jOigudGV4dCsweDIwMTgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJp
X2xkaXZtb2QnCmFybS1saW51eC1nbnVlYWJpaGYtbGQ6IGZzL2YyZnMvaW5vZGUubzogaW4gZnVu
Y3Rpb24gYGYyZnNfd3JpdGVfaW5vZGUnOgppbm9kZS5jOigudGV4dCsweDE5ZDQpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2xkaXZtb2QnCmFybS1saW51eC1nbnVlYWJpaGYtbGQ6
IGlub2RlLmM6KC50ZXh0KzB4MTlmMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8KYF9fYWVhYmlf
bGRpdm1vZCcKYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZnMvZjJmcy9uYW1laS5vOm5hbWVpLmM6
KC50ZXh0KzB4MTJiYyk6IG1vcmUKdW5kZWZpbmVkIHJlZmVyZW5jZXMgdG8gYF9fYWVhYmlfbGRp
dm1vZCcgZm9sbG93CgpNYW51YWxseSByZXZlcnRpbmcgNWZhNmE5N2QyNzg0MmRhYiBmaXhlcyB0
aGUgaXNzdWUuCgo2NC1iaXQgZGl2aXNpb25zIChpZmYgbmVlZGVkIGF0IGFsbCkgbXVzdCBub3Qg
YmUgb3Blbi1jb2RlZCwgYnV0IHVzZQp0aGUgaGVscGVycyBmcm9tIDxsaW51eC9tYXRoNjQuaD4g
aW5zdGVhZC4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
