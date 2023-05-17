Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE4706B22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 16:31:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzIBq-0001KJ-6o;
	Wed, 17 May 2023 14:31:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1pzIBn-0001KD-TB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 14:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sWvt0pedQunu8y2B0dtBKUYcryiAQ5WtFEwu7jjInYQ=; b=TEM/yfJ1aaUkgkibkAoK1wFDAJ
 DfRyiqaQjkn82/skHlmt2Hf5WSo7/pi9USzRSF1WIKLyaersPzWw2Gk3g4eXkszj0CAl7LxD4OJLc
 p6sWCukn89pgSLnDJviCmTKcTBZ1O33LBlwsmra/1+PoQY4PANUfvhtAZIevqTtHaez4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sWvt0pedQunu8y2B0dtBKUYcryiAQ5WtFEwu7jjInYQ=; b=B99Q/d1SVj60F7c65edzZT1VlN
 lh/2dcChENtYs3SfHvFdPVFYgOrvdHGa3glB1x3fhsLXg5blgnTj8VWQpdq3+qpkO4dg7wZ72jSGA
 Yve9rhyc4HkowUgRaNvIu2B0o0z2LWJW2TtVS5eTswJ+9HNbHqRIXQDbJqoDQcW48LEY=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzIBn-00B9ld-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 14:31:39 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-64354231003so50219b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 May 2023 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684333894; x=1686925894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sWvt0pedQunu8y2B0dtBKUYcryiAQ5WtFEwu7jjInYQ=;
 b=MIV2fh6ELNK78jb9gvMfIOe2uEDfrKxtE2ojMULHIRLz4i4iXtzCLNratojT9TW1Ua
 b083dw3ij/fH38M2P57SwErE1GLSf7Nykqpp3IItLlbiuHL/b+hTuR/RtKTlEEax4TdT
 A6GQF1F/qzVJtLfNcuJxNQ16YErrIGoNCD51yBr6RM320MA6uYsn2HFmk8JpMj3n/gd8
 4VFUq+IRKpmxneADrWO88/f/TI7Jd4pbXRSxnbJRVXCv48fp/Ub3ltn7bflHguzEc1dk
 AefzsUiSKAPmCZJuZ+JL751v5Jtk8gZ348B+0ktLYVnVS8tlFD6yzSthWJoxREptkOAD
 3MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684333894; x=1686925894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sWvt0pedQunu8y2B0dtBKUYcryiAQ5WtFEwu7jjInYQ=;
 b=JbQnm53Ya4v0bCeHmu7ix6/24lmZDrV/g6a7gVdM92GpgjOdfhuIIzhVJ+sCTApYtM
 vdM7qii5N2MPz0WUVfwlpCm5iwaBVvxp+u8JUNyvFToSvnY24AUI1rBDW+CTc7LfgIhE
 HKGSyVehDhfBVSrh3y1NLaOCwAyqYFgX4jr+z9nc9zQ75B+bAjSMnC11Sl2zBOBsOvBF
 PexPUs4ifT3SmYDix90BHXNUrIm1gp4j0k1xREmTLXaY1gQcDGGGDOtTbBJeU/iJV3OK
 M6d4DuEzhuY8/jFr4OBZ1S5/pBarpuNxymDJo8AZX38chNtr9UxmaJVZoWnJ8QepGojE
 HRqA==
X-Gm-Message-State: AC+VfDyHzEusC3kHnj6WoqxmzHsF1WCKZSQhEdS/KDe6HTQKgvKQG5YB
 VMAnSHy/DIrWvXGHgFAox2E=
X-Google-Smtp-Source: ACHHUZ5ye1FEZZFsU4xlkJyo1mk/CmW5gKsew58ycKJPvNMps2pYFthAZO0QlSpEMEcJ4y0SPY4cBA==
X-Received: by 2002:a05:6a20:8e15:b0:101:281c:494 with SMTP id
 y21-20020a056a208e1500b00101281c0494mr3079789pzj.27.1684333893627; 
 Wed, 17 May 2023 07:31:33 -0700 (PDT)
Received: from [192.168.50.128] ([157.245.157.44])
 by smtp.gmail.com with ESMTPSA id
 c16-20020aa78810000000b0063b7b811ce8sm15232130pfo.205.2023.05.17.07.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 07:31:33 -0700 (PDT)
Message-ID: <4a512db8-cfca-80a5-ba62-780f56d014f6@gmail.com>
Date: Wed, 17 May 2023 22:31:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Chao Yu <chao@kernel.org>, Wu Bo <bo.wu@vivo.com>
References: <45eb63c6-a147-776a-99b5-7ac06848ede8@kernel.org>
 <20230517035953.47810-1-bo.wu@vivo.com>
 <94958409-f726-9da6-3b9f-76efa022ee9d@kernel.org>
Content-Language: en-US
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <94958409-f726-9da6-3b9f-76efa022ee9d@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/17 16:36, Chao Yu wrote: > On 2023/5/17 11:59, Wu
 Bo wrote: >> On 2023/5/17 10:44, Chao Yu wrote: >>> On 2023/5/16 20:07, Wu
 Bo wrote: >>>> Modify the order between 'trace_f2fs_iget' & 'unlo [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pzIBn-00B9ld-B7
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: pass I_NEW flag to trace event
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy81LzE3IDE2OjM2LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvNS8xNyAxMTo1OSwg
V3UgQm8gd3JvdGU6Cj4+IE9uIDIwMjMvNS8xNyAxMDo0NCwgQ2hhbyBZdSB3cm90ZToKPj4+IE9u
IDIwMjMvNS8xNiAyMDowNywgV3UgQm8gd3JvdGU6Cj4+Pj4gTW9kaWZ5IHRoZSBvcmRlciBiZXR3
ZWVuICd0cmFjZV9mMmZzX2lnZXQnICYgJ3VubG9ja19uZXdfaW5vZGUnLCBzbyAKPj4+PiB0aGUK
Pj4+PiBJX05FVyBjYW4gcGFzcyB0byB0aGUgdHJhY2UgZXZlbnQgd2hlbiB0aGUgaW5vZGUgaW5p
dGlhbGlzZWQuCj4+Pgo+Pj4gV2h5IGlzIGl0IG5lZWRlZD8gQW5kIHRyYWNlX2YyZnNfaWdldCgp
IHdvbid0IHByaW50IGlub2RlLT5pX3N0YXRlPwo+Pgo+PiBXaGVuIGNvbm5lY3QgYSB0cmFjZV9w
cm9iZSB0byBmMmZzX2lnZXQsIGl0IHdpbGwgYmUgYWJsZSB0byBkZXRlcm1pbmUgCj4+IHdoZXRo
ZXIKPj4gdGhlIGlub2RlIGlzIG5ldyBpbml0aWFsaXNlZCBpbiBvcmRlciB0byBkbyBkaWZmZXJl
bnQgcHJvY2Vzcy4KPgo+IEkgZGlkbid0IGdldCBpdCwgeW91IHdhbnQgdG8gaG9vayBfX3RyYWNl
cG9pbnRfZjJmc19pZ2V0KCkgdy8geW91ciBvd24gCj4gY2FsbGJhY2s/ClllcyzCoCB0byB1c2Ug
J3RyYWNlcG9pbnRfcHJvYmVfcmVnaXN0ZXIgJyB0byByZWdpc3RlciBhIHByb2JlIGF0IAp0cmFj
ZV9mMmZzX2lnZXQKPgo+IFRoYW5rcywKPgo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBXdSBCbyA8Ym8ud3VAdml2by5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDC
oCBmcy9mMmZzL2lub2RlLmMgfCAyICstCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lu
b2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4+PiBpbmRleCBjZjQzMjdhZDEwNmMuLmNhZjk1OTI4
OWZlNyAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+PiArKysgYi9mcy9mMmZz
L2lub2RlLmMKPj4+PiBAQCAtNTc3LDggKzU3Nyw4IEBAIHN0cnVjdCBpbm9kZSAqZjJmc19pZ2V0
KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsCj4+Pj4gdW5zaWduZWQgbG9uZyBpbm8pCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmlsZV9kb250X3RydW5jYXRlKGlub2RlKTsKPj4+PiDCoMKgwqDC
oMKgwqAgfQo+Pj4+IMKgwqAgLcKgwqDCoCB1bmxvY2tfbmV3X2lub2RlKGlub2RlKTsKPj4+PiDC
oMKgwqDCoMKgwqAgdHJhY2VfZjJmc19pZ2V0KGlub2RlKTsKPj4+PiArwqDCoMKgIHVubG9ja19u
ZXdfaW5vZGUoaW5vZGUpOwo+Pj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gaW5vZGU7Cj4+Pj4gwqDC
oMKgwqAgYmFkX2lub2RlOgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+PgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
