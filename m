Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7829C83C7D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 17:26:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT2YE-0000p5-SD;
	Thu, 25 Jan 2024 16:26:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rT2YC-0000oq-Ur
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 16:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GdnADLmcOXmpEJAODZvOFI1y6zXc0+rymvs+ALAMMQY=; b=DasIMiA+QPIiXTgAgL7L8orys8
 5yRFRVp7ov5BjH8t3FsXpKSlGWpZRSigJFQjib1/AJa7x8fe+gUi9QsMaCJVUcsqnb7Mp6kSOGsaS
 uNy5iUYv70bE/5y7oXgzjkCp62yX2GablGOOcM6rg74GmLwK/xcYYdnGwF4azvHef7W4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GdnADLmcOXmpEJAODZvOFI1y6zXc0+rymvs+ALAMMQY=; b=AuVGqjrdq+5DycHIvZ6AEjF1cw
 CCf4HG8uD0/YuMjho03wo5W/1wFfDt/5+Na0Tmq6WNl95lXr5IMNRIKv1wi7nCpK4wCxofgqAR5Jd
 KnOJnO01D6GtOUHOFclirvR+RWfaj478Ts1USLCdNQPNOk+5zWjjhr1PiMso8uXNxWgw=;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rT2YB-0004UW-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 16:26:01 +0000
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-7ce3c7566e0so1690702241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jan 2024 08:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706199954; x=1706804754; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdnADLmcOXmpEJAODZvOFI1y6zXc0+rymvs+ALAMMQY=;
 b=SZksewKfT7ggoklYZ/tg/+oCPA2C9/9kSkfgDMJa9NrM10Mg5c6LQ/HKiUbN1Wq8/h
 e4bcjGoe5vrC3KFV47JZjAGFTI0gBIz/+9tv17z3HxR9/bRgeNbVSKw0b8yO25Zw6NDn
 9gc/ayLKy9GLyr3OG5v7eCgLkE3e1gyHLa4b0YvW9FH6mlrNmvNczZJRI6ynTi9DehZa
 qWwMN4D4OcL8lPZbjhacDJZ51Hk6NsZwbamtDF+s9OjCeBGHqwG6vTjRfoGHlhDXdgtR
 wwNpMCQT5kHE/Dgxk9Imyc6AOB6Yv3vY76h8xMje3137WNQXDp0WV8HutkzWfooFeyOw
 buEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706199954; x=1706804754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdnADLmcOXmpEJAODZvOFI1y6zXc0+rymvs+ALAMMQY=;
 b=lrFYFk2X7zxtd6dHQwJxyQZeuNNWZtRjxy9fc1GTJEJyWZt4ZKWR/67vXSa9v365TT
 zl8SWu0Vm/ipDwy3XTF58HEdXUfvTkly7ZXyWAJ+WDKg4SyuG/lpYqi3h/8f6/9qlbDx
 8my3IHRR+YZ7NT1KWVW2zABYwU3gWcqyy3i7YkCyyzCr4BPltc0AQ5/RVuSwpdnFnGGp
 /XRUaq/VwExzYwQD8A2KDnKQrSHCJtn+BL2Z5jodrt4d+T63Okwta7MY9fh7+V74PX8x
 3Px2nmvL6rem9ZrSQvPsW2yBiSwf6UrOFqZVQW7fXevp0y60/mnc7oVVJgwviqekHOgx
 6rRQ==
X-Gm-Message-State: AOJu0Yx1TgPSkciljN7MyPk7nG54ff9nQfbyRR3lPO9TutAC8VOhNtLM
 k4TpGMHQoSUcGx16qyjOukO/9niB3BhByCKZxBIf82neUdynPqEJMqQCOXzl+OMxZ7sZgFqtbW9
 +ztAqYndOa+rD6DnGDVgv4pNAftg=
X-Google-Smtp-Source: AGHT+IHYY9AhsErrdnkftO4vih3ZADQcfj41ON3M50rR0196rOXouYA4O4QxHTwiei5yLas8BOFyhAV/i18LAz8ZDv8=
X-Received: by 2002:ac5:cd5c:0:b0:4bd:3398:61a3 with SMTP id
 n28-20020ac5cd5c000000b004bd339861a3mr470102vkm.31.1706199953984; Thu, 25 Jan
 2024 08:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
In-Reply-To: <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 25 Jan 2024 08:25:43 -0800
Message-ID: <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jan 24, 2024 at 7:34 PM Chao Yu wrote: > > +Cc Yongpeng
    Yang > > Daeho, > > Yongpeng reports a potential issue: if c.devices[0].total_segments
    is > larger than segments of mainarea, c.cur_ [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.41 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT2YB-0004UW-EZ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgNzozNOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiArQ2MgWW9uZ3BlbmcgWWFuZwo+Cj4gRGFlaG8sCj4KPiBZb25ncGVuZyBy
ZXBvcnRzIGEgcG90ZW50aWFsIGlzc3VlOiBpZiBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMg
aXMKPiBsYXJnZXIgdGhhbiBzZWdtZW50cyBvZiBtYWluYXJlYSwgYy5jdXJfc2VnW0NVUlNFR19I
T1RfTk9ERV0gd2lsbCBleGNlZWQKPiBlbmQgYm91bmRhcnkgb2YgbWFpbmFyZWEuIENvdWxkIHlv
dSBwbGVhc2UgY2hlY2sgdGhhdD8gdGhvdWdoIGl0J3MgYSBjb3JuZXIKPiBjYXNlLgoKQ2FuIHlv
dSBlbGFib3JhdGUgbW9yZT8KSW4gdGhlIGNhc2Ugb2YgRjJGU19aT05FRF9ITSwgd2UgaGF2ZSB0
aGUgZGV2aWNlc1sxXS4KRG8geW91IG1lYW4gdGhlIGNhc2Ugd2UgZm9ybWF0IHRoZSBmaWxlc3lz
dGVtIGludGVudGlvbmFsbHkgc21hbGxlcgp0aGFuIHdoYXQgZGV2aWNlcyBoYXZlPwoKPgo+IE9u
IDIwMjQvMS8xOCA3OjAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZyb206IERhZWhvIEplb25n
IDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gTWFrZSB0byBhbGxvY2F0ZSBsb2dzIGFm
dGVyIGNvbnZlbnRpb25hbCBhcmVhIGZvciBITSB6b25lZCBkZXZpY2VzIHRvCj4gPiBzcGFyZSB0
aGVtIGZvciBmaWxlIHBpbm5pbmcgc3VwcG9ydC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVo
byBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgIG1rZnMvZjJmc19m
b3JtYXQuYyB8IDMgKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtm
cy9mMmZzX2Zvcm1hdC5jCj4gPiBpbmRleCBmMjg0MGM4Li45MWE3ZjRiIDEwMDY0NAo+ID4gLS0t
IGEvbWtmcy9mMmZzX2Zvcm1hdC5jCj4gPiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPiA+IEBA
IC01NTcsNyArNTU3LDggQEAgc3RhdGljIGludCBmMmZzX3ByZXBhcmVfc3VwZXJfYmxvY2sodm9p
ZCkKPiA+ICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19DT0xEX0RBVEFdID0gMDsKPiA+
ICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19XQVJNX0RBVEFdID0gbmV4dF96b25lKENV
UlNFR19DT0xEX0RBVEEpOwo+ID4gICAgICAgfSBlbHNlIGlmIChjLnpvbmVkX21vZGUpIHsKPiA+
IC0gICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gPSAwOwo+ID4gKyAgICAg
ICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJG
U19aT05FRF9ITSA/Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYy5kZXZpY2VzWzBdLnRvdGFs
X3NlZ21lbnRzIDogMDsKPiA+ICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19XQVJNX05P
REVdID0gbmV4dF96b25lKENVUlNFR19IT1RfTk9ERSk7Cj4gPiAgICAgICAgICAgICAgIGMuY3Vy
X3NlZ1tDVVJTRUdfQ09MRF9OT0RFXSA9IG5leHRfem9uZShDVVJTRUdfV0FSTV9OT0RFKTsKPiA+
ICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19IT1RfREFUQV0gPSBuZXh0X3pvbmUoQ1VS
U0VHX0NPTERfTk9ERSk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
