Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA4220334
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 06:07:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvYhY-0007Uw-9g; Wed, 15 Jul 2020 04:07:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jvYhX-0007Uk-5G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 04:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XculN1N44Fa+jOc1RfTadTGol/qQarf597qWYxyeyDo=; b=R1jysKhfOPsBeQIlo/6f8HlFTF
 Tf7potBnMdjkHl80UVHMeUlb6JmCj/SkD6HV4i5xcvSxeTpUlfo96JvxAaHPQnoiG9zHTcOmB5rlu
 d64i2w02z6hWWGDS13BqKEoiN4iuse3q+D9PQ9nQfL61yspsLJ0UUisIaX7vO14l57VQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XculN1N44Fa+jOc1RfTadTGol/qQarf597qWYxyeyDo=; b=UfrYceFWt6z147SBadv+21CWwg
 x0aDPqycwan9DA0RszmbVWG8XwCyCKbLW+QDnNb5x81xv9gamf4jMecEmpF1OV+nTj1XEltqDyGPI
 F4XrcEMetD3HzpNBAK+Nl9Ue2PZl4Od+bnlrlUI+LmIcf+YAPM13EnFIDY8lDcDRt3e4=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvYhV-008COz-Mv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 04:07:23 +0000
Received: by mail-lj1-f193.google.com with SMTP id b25so992105ljp.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jul 2020 21:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XculN1N44Fa+jOc1RfTadTGol/qQarf597qWYxyeyDo=;
 b=qJtoShZnOkain8+1JMHD56VTyN8dkAQ1B1KWI1k68Aq/6YJprxm4zSNyHIGoh9FNv7
 WnLAEssl7f1WNS2ZdnQtrAY3Ei+btc3GpSYpCnJ1/BbwoN4FA5LbgNDspCJ7MFhSuNc3
 Uf7FjVKCdoACWL03epHUxPqDQSQB6iMwzsie8HUz+Q6LyiULWn/54wPrttkps2lbfPjR
 vz3qcQb5BHgal0a2ch+OpsdZHi5N3Dj4Ux8CpRucZKhn5whjZ1tZM71e60/buMV6GbFf
 7s4VQM/1QrtCoNtsZQnwDx4+Ux3ZYM7DRoXyVCFbnA3U4RLjJhqjD7GI9HtfabMhXtxK
 o60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XculN1N44Fa+jOc1RfTadTGol/qQarf597qWYxyeyDo=;
 b=Q3Eck47kwrlzGjLllXLlLGDOnL9vbMvpbEJCfs8Oyg3lMsPYjsW9jgYv5yvHaA4BZl
 vjwBulOJnx5kKwB/792GUMwGjG0Ubvcxh9nzVyoJFm1xDMfq8/BbpXsBCkGBRxBlumi5
 URYSZxifDiHop44DZ9MzU/z+Hy38IFuStJqwE6Kn6gfJ9RNyD07CprDFZRaJvu5TrG+i
 sC1DPLEdnW7I5qyVc+zOfHgtzzg/MPqE+iUQRPvIXiw5tydotPQd/Kbsufp3i802tbt3
 5wLfHFGA16yk2ov5QI+bD+TLFhoqFuL5D/tHQRaYcmgGzZFsZw970EGRR3DXwFmrM9ra
 mAbA==
X-Gm-Message-State: AOAM530IMQ1YtHiECkrk6RBHyKnwigBG+fr3P9pme3kTjZcSEcl6rhiB
 cXxP2tjsRL5Arwg3b+I5GTUPomn8ydOTZbgw84M=
X-Google-Smtp-Source: ABdhPJw823tPINXmultV+mPN9c1KKxUKc93Tc/K6297nyUADoVUrqv4A2KSnLF2f/XNnQyEZGTMFphn3bL2JIBNHWZQ=
X-Received: by 2002:a2e:b0ed:: with SMTP id h13mr3566466ljl.250.1594786027862; 
 Tue, 14 Jul 2020 21:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
In-Reply-To: <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 15 Jul 2020 13:06:56 +0900
Message-ID: <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jvYhV-008COz-Mv
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

V2UgY291bGQgdXNlIGZzY3J5cHRfemVyb291dF9yYW5nZSgpIGZvciBhbiBlbmNyeXB0ZWQgZmls
ZS4KQnV0LCBvbmUgcHJvYmxlbSBpcyBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBhc3N1bWVzIHRo
YXQgZmlsZXN5c3RlbXMKb25seSB1c2UgYSBzaW5nbGUgYmxvY2sgZGV2aWNlLgpJdCBtZWFucyBp
dCBkb2Vzbid0IHJlY2VpdmUgYmRldiBhcyBhIHBhcmFtZXRlci4KSG93IGFib3V0IGNoYW5naW5n
IHRoZSBpbnRlcmZhY2Ugb2YgZnNjcnlwdF96ZXJvb3V0X3JhbmdlKCkgZmlyc3QgYW5kIHVzaW5n
IGl0PwoKMjAyMOuFhCA37JuUIDE07J28ICjtmZQpIOyYpO2bhCA5OjM2LCBDaGFvIFl1IDx5dWNo
YW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPgo+IE9uIDIwMjAvNy8xNCAyOjExLCBKYWVn
ZXVrIEtpbSB3cm90ZToKPiA+IEhpIERhZWhvLAo+ID4KPiA+IFBsZWFzZSB0YWtlIGEgbG9vayBh
dCB0aGlzLgo+ID4KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2phZWdldWsvZjJmcy5naXQvY29tbWl0Lz9oPWRldiZpZD0zNTI0NTE4MDQ1OWFlYmY2
ZDcwZmRlODhhNTM4ZjA0MDBhNzk0YWE2Cj4KPiBJJ20gY3VyaW91cyBhYm91dCB3aGF0IHdpbGwg
aGFwcGVuIGlmIHdlIGNhbGwKPiBzZWNfdHJpbV9maWxlKEYyRlNfVFJJTV9GSUxFX1pFUk9PVVQp
IG9uIGFuIGVuY3J5cHRlZCBmaWxlLCB3aWxsCj4gaXQgdXNlIHplcm8gYml0cyBjb3ZlcmluZyBl
bmNyeXB0ZWQgZGF0YSBvbiBkaXNrPwo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4K
PiA+IE9uIDA3LzEzLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+PiBGcm9tOiBEYWVobyBKZW9uZyA8
ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+Cj4gPj4gQ2hhbmdlZCB0aGUgd2F5IG9mIGhhbmRs
aW5nIHJhbmdlLmxlbiBvZiBGMkZTX0lPQ19TRUNfVFJJTV9GSUxFLgo+ID4+ICAxLiBBZGRlZCAt
MSB2YWx1ZSBzdXBwb3J0IGZvciByYW5nZS5sZW4gdG8gc2VjdXJlIHRyaW0gdGhlIHdob2xlIGJs
b2Nrcwo+ID4+ICAgICBzdGFydGluZyBmcm9tIHJhbmdlLnN0YXJ0IHJlZ2FyZGxlc3Mgb2YgaV9z
aXplLgo+ID4+ICAyLiBJZiB0aGUgZW5kIG9mIHRoZSByYW5nZSBwYXNzZXMgb3ZlciB0aGUgZW5k
IG9mIGZpbGUsIGl0IG1lYW5zIHVudGlsCj4gPj4gICAgIHRoZSBlbmQgb2YgZmlsZSAoaV9zaXpl
KS4KPiA+PiAgMy4gaWdub3JlZCB0aGUgY2FzZSBvZiB0aGF0IHJhbmdlLmxlbiBpcyB6ZXJvIHRv
IHByZXZlbnQgdGhlIGZ1bmN0aW9uCj4gPj4gICAgIGZyb20gbWFraW5nIGVuZF9hZGRyIHplcm8g
YW5kIHRyaWdnZXJpbmcgZGlmZmVyZW50IGJlaGF2aW91ciBvZgo+ID4+ICAgICB0aGUgZnVuY3Rp
b24uCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+ID4+IC0tLQo+ID4+IENoYW5nZXMgaW4gdjI6Cj4gPj4gIC0gQ2hhbmdlZCAtMSBy
YW5nZS5sZW4gb3B0aW9uIHRvIG1lYW4gdGhlIHdob2xlIGJsb2NrcyBzdGFydGluZyBmcm9tCj4g
Pj4gICAgcmFuZ2Uuc3RhcnQgcmVnYXJkbGVzcyBvZiBpX3NpemUKPiA+PiAtLS0KPiA+PiAgZnMv
ZjJmcy9maWxlLmMgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+IGluZGV4IDM2OGM4MGY4
ZTJhMS4uMjQ4NTg0MWUzYjJkIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gPj4g
KysrIGIvZnMvZjJmcy9maWxlLmMKPiA+PiBAQCAtMzc5Miw3ICszNzkyLDcgQEAgc3RhdGljIGlu
dCBmMmZzX3NlY190cmltX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJn
KQo+ID4+ICAgICAgcGdvZmZfdCBpbmRleCwgcGdfZW5kOwo+ID4+ICAgICAgYmxvY2tfdCBwcmV2
X2Jsb2NrID0gMCwgbGVuID0gMDsKPiA+PiAgICAgIGxvZmZfdCBlbmRfYWRkcjsKPiA+PiAtICAg
IGJvb2wgdG9fZW5kOwo+ID4+ICsgICAgYm9vbCB0b19lbmQgPSBmYWxzZTsKPiA+PiAgICAgIGlu
dCByZXQgPSAwOwo+ID4+Cj4gPj4gICAgICBpZiAoIShmaWxwLT5mX21vZGUgJiBGTU9ERV9XUklU
RSkpCj4gPj4gQEAgLTM4MTMsMjMgKzM4MTMsMjMgQEAgc3RhdGljIGludCBmMmZzX3NlY190cmlt
X2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4+ICAgICAgZmls
ZV9zdGFydF93cml0ZShmaWxwKTsKPiA+PiAgICAgIGlub2RlX2xvY2soaW5vZGUpOwo+ID4+Cj4g
Pj4gLSAgICBpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkgfHwgZjJmc19jb21wcmVzc2Vk
X2ZpbGUoaW5vZGUpKSB7Cj4gPj4gKyAgICBpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkg
fHwgZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpIHx8Cj4gPj4gKyAgICAgICAgICAgICAgICAg
ICAgcmFuZ2Uuc3RhcnQgPj0gaW5vZGUtPmlfc2l6ZSkgewo+ID4+ICAgICAgICAgICAgICByZXQg
PSAtRUlOVkFMOwo+ID4+ICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+PiAgICAgIH0KPiA+Pgo+
ID4+IC0gICAgaWYgKHJhbmdlLnN0YXJ0ID49IGlub2RlLT5pX3NpemUpIHsKPiA+PiAtICAgICAg
ICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+PiArICAgIGlmIChyYW5nZS5sZW4gPT0gMCkKPiA+PiAg
ICAgICAgICAgICAgZ290byBlcnI7Cj4gPj4gLSAgICB9Cj4gPj4KPiA+PiAtICAgIGlmIChpbm9k
ZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQgPCByYW5nZS5sZW4pIHsKPiA+PiAtICAgICAgICAgICAg
cmV0ID0gLUUyQklHOwo+ID4+IC0gICAgICAgICAgICBnb3RvIGVycjsKPiA+PiArICAgIGlmIChp
bm9kZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQgPiByYW5nZS5sZW4pIHsKPiA+PiArICAgICAgICAg
ICAgZW5kX2FkZHIgPSByYW5nZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+PiArICAgIH0gZWxzZSB7
Cj4gPj4gKyAgICAgICAgICAgIGVuZF9hZGRyID0gcmFuZ2UubGVuID09ICh1NjQpLTEgPwo+ID4+
ICsgICAgICAgICAgICAgICAgICAgIHNiaS0+c2ItPnNfbWF4Ynl0ZXMgOiBpbm9kZS0+aV9zaXpl
Owo+ID4+ICsgICAgICAgICAgICB0b19lbmQgPSB0cnVlOwo+ID4+ICAgICAgfQo+ID4+IC0gICAg
ZW5kX2FkZHIgPSByYW5nZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+Pgo+ID4+IC0gICAgdG9fZW5k
ID0gKGVuZF9hZGRyID09IGlub2RlLT5pX3NpemUpOwo+ID4+ICAgICAgaWYgKCFJU19BTElHTkVE
KHJhbmdlLnN0YXJ0LCBGMkZTX0JMS1NJWkUpIHx8Cj4gPj4gICAgICAgICAgICAgICAgICAgICAg
KCF0b19lbmQgJiYgIUlTX0FMSUdORUQoZW5kX2FkZHIsIEYyRlNfQkxLU0laRSkpKSB7Cj4gPj4g
ICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gPj4gQEAgLTM4NDYsNyArMzg0Niw4IEBAIHN0
YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxlKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBs
b25nIGFyZykKPiA+PiAgICAgIGRvd25fd3JpdGUoJkYyRlNfSShpbm9kZSktPmlfZ2NfcndzZW1b
V1JJVEVdKTsKPiA+PiAgICAgIGRvd25fd3JpdGUoJkYyRlNfSShpbm9kZSktPmlfbW1hcF9zZW0p
Owo+ID4+Cj4gPj4gLSAgICByZXQgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0X3JhbmdlKG1hcHBp
bmcsIHJhbmdlLnN0YXJ0LCBlbmRfYWRkciAtIDEpOwo+ID4+ICsgICAgcmV0ID0gZmlsZW1hcF93
cml0ZV9hbmRfd2FpdF9yYW5nZShtYXBwaW5nLCByYW5nZS5zdGFydCwKPiA+PiArICAgICAgICAg
ICAgICAgICAgICB0b19lbmQgPyBMTE9OR19NQVggOiBlbmRfYWRkciAtIDEpOwo+ID4+ICAgICAg
aWYgKHJldCkKPiA+PiAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPj4KPiA+PiAtLQo+ID4+IDIu
MjcuMC4zODMuZzA1MDMxOWMyYWUtZ29vZwo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cj4gPiAuCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
