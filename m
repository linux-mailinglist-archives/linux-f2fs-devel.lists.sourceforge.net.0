Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A2962D43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2024 18:06:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjLBm-0006zs-Pn;
	Wed, 28 Aug 2024 16:06:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sjLBj-0006zk-UG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 16:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pcc2ywD3Ph5edpvvemDwE9pwJ5atBlosbGQO/CDOgmc=; b=AksfrrQSS4LuUnGDw9v5qXwNx9
 ByrvQyOpTQeI3uF5rQKfzOERHIKUOsph46NNwVv/HctmuBd5cGwBVOV5XNp2Yp2dggQ31r8nlbJaS
 8ZExB5YKSu9t6OsiLwmRFP/F0/zU8Zj9FHkVbETl2DHZ9xpsuR+RfxHCydqsA/tF29OY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pcc2ywD3Ph5edpvvemDwE9pwJ5atBlosbGQO/CDOgmc=; b=kp6tBMCT/Mb3JJuEH4c4/PLsxp
 aIXK9xQbAxO/OKeeS44uq+HxBE7molP9CSXg8c7JH/w9a4vmpz/Ui/Ox+0QoZBr7AAxqnNQ63ZH7P
 ilEJykudNTVbp+ThBjWWmYGAOdG5h2TsYmOhvxwqKg62RtZw8WNTFdEL+q/MW5Er2HqU=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjLBi-0002y0-Ie for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 16:06:27 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2023dd9b86aso55106515ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Aug 2024 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724861176; x=1725465976; darn=lists.sourceforge.net;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Pcc2ywD3Ph5edpvvemDwE9pwJ5atBlosbGQO/CDOgmc=;
 b=eaUUONhZP2uP4QLTFsZmc7LjmocjtxTkPmDZXVNRXr1DwFCc3jpzo2tI9YmZN2RoMJ
 u8mf4ySz6DegcM1OLWFL0COn9lE+zhXXN4BozRsFqAGHoOyGbaGBOyb0AwvcjuYbOKlC
 RQPkegFSfGBsDA7gkyYgiL2NGjsozoTKydl8Aim3HhnqGRXWo8+LMzhk7S0qkR+14Ka6
 +wySHMkudkYPBSBePhGjcrdN3xujcQ65mMEvT4z9aLDzuoVbkI7dK7tzQecVgiASdEAa
 p7jo9R0hW1GssR8G5+4flf6rF9NVHWWgums94pzNa5GuFZpRwd8/O9rtpBgyyNqJLS0o
 RfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861176; x=1725465976;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pcc2ywD3Ph5edpvvemDwE9pwJ5atBlosbGQO/CDOgmc=;
 b=MT5BJup3xBlduY/POo9T5MoQnP78mAGxlfW5PdeZ1OSsDi4pvga+WMUcaRs1oJNHrJ
 sxpOtO7n7m32+I2NyEbu2W9Drr+P3uOVyIJp8ld1JQVLEeSMAFJkzcJHfYDc/LF4ZLwU
 +QZdJh8m3z3nQqA+ZwlQ8zA/JyLxpxhC/YQLRYmy8wEM5kbKe1RhxQf74rS/dS+8SH2L
 RJMnsbHkWnw32zMKBNqt3JWanLUCZqdg9D9umI3QEO6ukjmCtfpaoEoQCMY1beR+0+vE
 4tcfdiVCUB8++BE11VIGpYQqg2a7fac3fPefs7oD/xIfnK6Cp80QxUuW4FueYIs7UehK
 AVUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGfdZ0zgy4VBwnfTa69Kg2K0MrcuROcas/01ZlamMfmFKKtfHExu/eFQgQgLsnRiQOu/cFpEkAoITcF6jSexT/@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx+3RSAaR3s+TM0C1NbWRuH1UfgtDPqeDS84GCG1/6hIj8hx6e2
 kxdTLKlbt9hFks5KTTIz7NG88ZcQaJ6RY1cSvcnBzQSJ1tBkHuHhprV0Qp11
X-Google-Smtp-Source: AGHT+IEJgTitc5j5MuB4aK+ZM8bcNpkkHTQk7StOQd6wdrMwd5G3xO/DVk+x+wtaNoY1TfJChdqveg==
X-Received: by 2002:a17:903:41ca:b0:1fd:672f:2b34 with SMTP id
 d9443c01a7336-2039e4b77eamr141094535ad.33.1724861175477; 
 Wed, 28 Aug 2024 09:06:15 -0700 (PDT)
Received: from [127.0.0.1] ([174.139.202.50]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385580810sm100329295ad.105.2024.08.28.09.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 09:06:14 -0700 (PDT)
Message-ID: <e09856753d986a810601e2e84261e783f30b0d04.camel@gmail.com>
From: Julian Sun <sunjunchao2870@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 29 Aug 2024 00:06:09 +0800
In-Reply-To: <Zs9BsP1UdFn4FoK5@google.com>
References: <000000000000b0231406204772a1@google.com>
 <20240827034324.339129-1-sunjunchao2870@gmail.com>
 <Zs9BsP1UdFn4FoK5@google.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2024-08-28 at 15:26 +0000, Jaegeuk Kim wrote: > On
 08/27, Julian Sun wrote: > > Hi, all. > > > > Recently syzbot reported a
 bug as following: > > > > kernel BUG at fs/f2fs/inode.c:896! > > CPU [...]
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.214.177 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.177 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.177 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sjLBi-0002y0-Ie
Subject: Re: [f2fs-dev] [PATCH] f2fs: Do not check the FI_DIRTY_INODE flag
 when umounting a ro fs.
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
Cc: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAyMDI0LTA4LTI4IGF0IDE1OjI2ICswMDAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBP
biAwOC8yNywgSnVsaWFuIFN1biB3cm90ZToKPiA+IEhpLCBhbGwuCj4gPiAKPiA+IFJlY2VudGx5
IHN5emJvdCByZXBvcnRlZCBhIGJ1ZyBhcyBmb2xsb3dpbmc6Cj4gPiAKPiA+IGtlcm5lbCBCVUcg
YXQgZnMvZjJmcy9pbm9kZS5jOjg5NiEKPiA+IENQVTogMSBVSUQ6IDAgUElEOiA1MjE3IENvbW06
IHN5ei1leGVjdXRvcjYwNSBOb3QgdGFpbnRlZCA2LjExLjAtCj4gPiByYzQtc3l6a2FsbGVyLTAw
MDMzLWc4NzJjZjI4YjhkZjkgIzAKPiA+IFJJUDogMDAxMDpmMmZzX2V2aWN0X2lub2RlKzB4MTU5
OC8weDE1YzAgZnMvZjJmcy9pbm9kZS5jOjg5Ngo+ID4gQ2FsbCBUcmFjZToKPiA+IMKgPFRBU0s+
Cj4gPiDCoGV2aWN0KzB4NTMyLzB4OTUwIGZzL2lub2RlLmM6NzA0Cj4gPiDCoGRpc3Bvc2VfbGlz
dCBmcy9pbm9kZS5jOjc0NyBbaW5saW5lXQo+ID4gwqBldmljdF9pbm9kZXMrMHg1ZjkvMHg2OTAg
ZnMvaW5vZGUuYzo3OTcKPiA+IMKgZ2VuZXJpY19zaHV0ZG93bl9zdXBlcisweDlkLzB4MmQwIGZz
L3N1cGVyLmM6NjI3Cj4gPiDCoGtpbGxfYmxvY2tfc3VwZXIrMHg0NC8weDkwIGZzL3N1cGVyLmM6
MTY5Ngo+ID4gwqBraWxsX2YyZnNfc3VwZXIrMHgzNDQvMHg2OTAgZnMvZjJmcy9zdXBlci5jOjQ4
OTgKPiA+IMKgZGVhY3RpdmF0ZV9sb2NrZWRfc3VwZXIrMHhjNC8weDEzMCBmcy9zdXBlci5jOjQ3
Mwo+ID4gwqBjbGVhbnVwX21udCsweDQxZi8weDRiMCBmcy9uYW1lc3BhY2UuYzoxMzczCj4gPiDC
oHRhc2tfd29ya19ydW4rMHgyNGYvMHgzMTAga2VybmVsL3Rhc2tfd29yay5jOjIyOAo+ID4gwqBw
dHJhY2Vfbm90aWZ5KzB4MmQyLzB4MzgwIGtlcm5lbC9zaWduYWwuYzoyNDAyCj4gPiDCoHB0cmFj
ZV9yZXBvcnRfc3lzY2FsbCBpbmNsdWRlL2xpbnV4L3B0cmFjZS5oOjQxNSBbaW5saW5lXQo+ID4g
wqBwdHJhY2VfcmVwb3J0X3N5c2NhbGxfZXhpdCBpbmNsdWRlL2xpbnV4L3B0cmFjZS5oOjQ3NyBb
aW5saW5lXQo+ID4gwqBzeXNjYWxsX2V4aXRfd29yaysweGM2LzB4MTkwIGtlcm5lbC9lbnRyeS9j
b21tb24uYzoxNzMKPiA+IMKgc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlIGtlcm5l
bC9lbnRyeS9jb21tb24uYzoyMDAKPiA+IFtpbmxpbmVdCj4gPiDCoF9fc3lzY2FsbF9leGl0X3Rv
X3VzZXJfbW9kZV93b3JrIGtlcm5lbC9lbnRyeS9jb21tb24uYzoyMDUKPiA+IFtpbmxpbmVdCj4g
PiDCoHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHgyNzkvMHgzNzAga2VybmVsL2VudHJ5L2Nv
bW1vbi5jOjIxOAo+ID4gwqBkb19zeXNjYWxsXzY0KzB4MTAwLzB4MjMwIGFyY2gveDg2L2VudHJ5
L2NvbW1vbi5jOjg5Cj4gPiDCoGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4
N2YKPiA+IAo+ID4gVGhlIHN5emJvdCBjb25zdHJ1Y3RlZCB0aGUgZm9sbG93aW5nIHNjZW5hcmlv
OiBjb25jdXJyZW50bHkKPiA+IGNyZWF0aW5nIGRpcmVjdG9yaWVzIGFuZCBzZXR0aW5nIHRoZSBm
aWxlIHN5c3RlbSB0byByZWFkLW9ubHkuCj4gPiBJbiB0aGlzIGNhc2UsIHdoaWxlIGYyZnMgd2Fz
IG1ha2luZyBkaXIsIHRoZSBmaWxlc3lzdGVtIHN3aXRjaGVkIHRvCj4gPiByZWFkb25seSwgYW5k
IHdoZW4gaXQgdHJpZWQgdG8gY2xlYXIgdGhlIGRpcnR5IGZsYWcsIGl0IHRyaWdnZXJlZAo+ID4g
dGhpcwo+ID4gY29kZSBwYXRoOiBmMmZzX21rZGlyKCktPiBmMmZzX3N5bmNfZnMoKS0+ZjJmc193
cml0ZV9jaGVja3BvaW50KCkKPiA+IC0+ZjJmc19yZWFkb25seSgpLiBUaGlzIHJlc3VsdGVkIEZJ
X0RJUlRZX0lOT0RFIGZsYWcgbm90IGJlaW5nCj4gPiBjbGVhcmVkLAo+ID4gd2hpY2ggZXZlbnR1
YWxseSBsZWQgdG8gYSBidWcgYmVpbmcgdHJpZ2dlcmVkIGR1cmluZyB0aGUKPiA+IEZJX0RJUlRZ
X0lOT0RFCj4gPiBjaGVjayBpbiBmMmZzX2V2aWN0X2lub2RlKCkuCj4gPiAKPiA+IEluIHRoaXMg
Y2FzZSwgd2UgY2Fubm90IGRvIGFueXRoaW5nIGZ1cnRoZXIsIHNvIGlmIGZpbGVzeXN0ZW0gaXMK
PiA+IHJlYWRvbmx5LAo+ID4gZG8gbm90IHRyaWdnZXIgdGhlIEJVRy4gSW5zdGVhZCwgY2xlYW4g
dXAgcmVzb3VyY2VzIHRvIHRoZSBiZXN0IG9mCj4gPiBvdXIKPiA+IGFiaWxpdHkgdG8gcHJldmVu
dCB0cmlnZ2VyaW5nIHN1YnNlcXVlbnQgcmVzb3VyY2UgbGVhayBjaGVja3MuCj4gPiAKPiA+IElm
IHRoZXJlIGlzIGFueXRoaW5nIGltcG9ydGFudCBJJ20gbWlzc2luZywgcGxlYXNlIGxldCBtZSBr
bm93LAo+ID4gdGhhbmtzLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTogc3l6Ym90K2ViZWEyNzkwOTA0
NjczZDdjNjE4QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiA+IENsb3NlczoKPiA+IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1lYmVhMjc5MDkwNDY3M2Q3YzYxOAo+
ID4gRml4ZXM6IGNhN2Q4MDJhN2Q4ZSAoImYyZnM6IGRldGVjdCBkaXJ0eSBpbm9kZSBpbiBldmlj
dF9pbm9kZSIpCj4gPiBDQzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1i
eTogSnVsaWFuIFN1biA8c3VuanVuY2hhbzI4NzBAZ21haWwuY29tPgo+ID4gLS0tCj4gPiDCoGZz
L2YyZnMvaW5vZGUuYyB8IDggKysrKysrLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5v
ZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4gaW5kZXggYWVmNTcxNzIwMTRmLi41MmQyNzMzODNl
YzIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPiA+ICsrKyBiL2ZzL2YyZnMvaW5v
ZGUuYwo+ID4gQEAgLTg5Miw4ICs4OTIsMTIgQEAgdm9pZCBmMmZzX2V2aWN0X2lub2RlKHN0cnVj
dCBpbm9kZSAqaW5vZGUpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBhdG9taWNfcmVhZCgmZmktPmlfY29tcHJfYmxvY2tzKSk7Cj4gPiDCoAo+ID4g
wqDCoMKgwqDCoMKgwqDCoGlmIChsaWtlbHkoIWYyZnNfY3BfZXJyb3Ioc2JpKSAmJgo+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIWlzX3NiaV9mbGFnX3NldChzYmksCj4gPiBTQklfQ1BfRElTQUJMRUQpKSkKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmMmZzX2J1Z19vbihzYmksIGlzX2lub2RlX2ZsYWdf
c2V0KGlub2RlLAo+ID4gRklfRElSVFlfSU5PREUpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCFpc19zYmlfZmxhZ19z
ZXQoc2JpLAo+ID4gU0JJX0NQX0RJU0FCTEVEKSkpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoIWYyZnNfcmVhZG9ubHkoc2JpLT5zYikpCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGYyZnNfYnVnX29uKHNiaSwgaXNfaW5v
ZGVfZmxhZ19zZXQoaW5vZGUsCj4gPiBGSV9ESVJUWV9JTk9ERSkpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZjJmc19pbm9kZV9zeW5jZWQoaW5vZGUpOwo+ID4gK8KgwqDCoMKg
wqDCoMKgfQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZjJmc19pbm9kZV9zeW5jZWQoaW5vZGUpOwo+IAo+IFdoYXQgYWJvdXQ6Cj4g
Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChsaWtlbHkoIWYyZnNfY3BfZXJyb3Ioc2JpKSAmJgo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhaXNfc2JpX2ZsYWdfc2V0KHNiaSwg
U0JJX0NQX0RJU0FCTEVEKSkgJiYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgIWYyZnNfcmVhZG9ubHkoc2JpLT5zYikpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZjJmc19idWdfb24oc2JpLCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwKPiBGSV9ESVJU
WV9JTk9ERSkpOwo+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBmMmZzX2lub2RlX3N5bmNlZChpbm9kZSk7CgpIaSwgSmFlZ2V1aywgdGhhbmtz
IGZvciB5b3VyIHJldmlldy4KClllYWgsIGl0IGlzIHNlbWFudGljYWxseSBpZGVudGljYWwsIGFu
ZCB0aGUgY29kZSBpcyBjbGVhcmVyLgpJIHdpbGwgZml4IGl0IGluIHBhdGNoIHYyLgo+IAo+ID4g
Cj4gCj4gPiDCoAo+ID4gLS0gCj4gPiAyLjM5LjIKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
