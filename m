Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B556CF31
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Jul 2022 14:40:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oAWEd-00017O-IX; Sun, 10 Jul 2022 12:40:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1oAWEc-00017I-4V
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Jul 2022 12:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PTQViyVNb/t4sj6FFy5fyxSR9MWqmShwvhUR/ent238=; b=TzeKsRvjAayk3Oeph1ypDe8lGX
 x+Gp36scYpkvOOPlu4cBem0l+ZYrO9rHkutELnDPggojRK0fJVE4+rBIPPHeGIOoeZzRTExQzlsH9
 oVmcNxLFZA4eU/Ci5MP9EtO8SQAXwQaXEdt5SHKuI2LG0pe18ia8syRWpGGFdWI8Manc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PTQViyVNb/t4sj6FFy5fyxSR9MWqmShwvhUR/ent238=; b=Yc5Be3605tRaeqPvTibUCgb5FS
 ECaMtWm4gLB3+yRZSpdckfYCFhFmAAYMqdef78Z3EBj5kYT1aH/Gng0oeWEtzqJfo47dPiN3dnNMR
 S0VBtSFpvCgtGGFhG2ml7ESxolGxrKW3E/9N87mndWQwZD0fUoQWD7VMeLfi1klMPc+c=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oAWEa-00CpRQ-UB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Jul 2022 12:40:26 +0000
Received: by mail-lf1-f53.google.com with SMTP id d12so4680756lfq.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Jul 2022 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PTQViyVNb/t4sj6FFy5fyxSR9MWqmShwvhUR/ent238=;
 b=af3U7q2obyJtyHmkoNx6WIyOLCmtacj1/OrNxbBj4h3QibeyVuStaCugizBpgonQYC
 2NunxGR43Uz2QAEP16vABc1vv/WQ8gKBNSzwq1JtR4Jm1+AZOLC+3kDrrDjOhKq74nkM
 sS53lu23YFnjLZBs4cMDRRLqCtszYthyRYfxx6alUb4G+vYdb/hm4b1M7Lr4iG7PHaJ0
 5eFfdoBiMJIu6xUjD51EgWv9qDv8WEttbwrk/v8s2+emsw/Lo4GPrYx0ed9hIWX7FCtU
 4DzrWTqvohHaWEybc5EJh/2piYnpmaPDQpuYMsQVPjD6M+6yaRnd628RfC3/oixlqg8Z
 TWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PTQViyVNb/t4sj6FFy5fyxSR9MWqmShwvhUR/ent238=;
 b=kScN7+P4XyMwprMBYe2Q02RdQnDH5zib1nyy4m9l9A3bl/43MNewIASBJIlp01+Btj
 +8Ol0EYa3vu6GEyOXy8sMjsV1oGOfzZCWxdFpPejArpa2vVadUf9uKqonDh0ae4bY6mH
 kAbnYUUiYQulzYYE3lllYHQRKvXFH3Pe7YAVzqwFVmgk+Z3+USppR9MwcD76xPibOZD9
 i5YVXYQWCqHIcDbmkc95rz+J2chzi+0bU+787+Gh4z23qxILy5eEe8hhTIMSOt2yflVM
 xBJpKrC8PuXS89hJBsEhtt/LcW5PuuepwpUYwz5o3HzZBW7gFg9wVSOYAwaC+B0juHbX
 Z1lg==
X-Gm-Message-State: AJIora+TLC/3WxMhQjN6F5cEf+BCoG/pn4zBZaTJUaC5hIOtcDbBCQ/m
 JfJWmuTmRcO77E68FbKrYm5ADnwp/zdBgsCYRTnKmOCw
X-Google-Smtp-Source: AGRyM1vuVrH3B9NrGYhyy/t78/OQxkO3ib/8FVTHBcdpiBHCkzEOI39u2Ggq2WD9nuWymN/XSN+K/4pTCvuG2nCrpi8=
X-Received: by 2002:a05:6512:3d92:b0:487:5cea:a68b with SMTP id
 k18-20020a0565123d9200b004875ceaa68bmr8357798lfv.21.1657456817326; Sun, 10
 Jul 2022 05:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220507081710.117162-1-changfengnan@vivo.com>
 <20220507081710.117162-4-changfengnan@vivo.com>
In-Reply-To: <20220507081710.117162-4-changfengnan@vivo.com>
From: fengnan chang <fengnanchang@gmail.com>
Date: Sun, 10 Jul 2022 20:40:05 +0800
Message-ID: <CALWNXx-5F0AJ3EsujvGbgT+P-5Y1zomYy5UJ+h6PWEy8thDp5w@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ping Fengnan Chang via Linux-f2fs-devel 于2022年5月7日周六
    16:18写道： > > Try to support compressed file write and amplifiction
   accounting. > > Signed-off-by: Fengnan Chang > --- > fs/f2fs/da [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.53 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oAWEa-00CpRQ-UB
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: support compressed file
 write/read amplifiction
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cGluZwoKRmVuZ25hbiBDaGFuZyB2aWEgTGludXgtZjJmcy1kZXZlbAo8bGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IOS6jjIwMjLlubQ15pyIN+aXpeWRqOWFrSAxNjoxOOWG
memBk++8mgo+Cj4gVHJ5IHRvIHN1cHBvcnQgY29tcHJlc3NlZCBmaWxlIHdyaXRlIGFuZCBhbXBs
aWZpY3Rpb24gYWNjb3VudGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNo
YW5nZmVuZ25hbkB2aXZvLmNvbT4KPiAtLS0KPiAgZnMvZjJmcy9kYXRhLmMgIHwgMTkgKysrKysr
KysrKysrKysrLS0tLQo+ICBmcy9mMmZzL2RlYnVnLmMgfCAgNyArKysrKy0tCj4gIGZzL2YyZnMv
ZjJmcy5oICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxl
cyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiBpbmRleCAwYWU3ODE5YjA4NWQu
Ljk4YzNkMDVjYWUxZCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4gQEAgLTIyMzQsNiArMjIzNCwxMSBAQCBpbnQgZjJmc19yZWFkX211bHRpX3Bh
Z2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgYmlvICoqYmlvX3JldCwKPiAgICAg
ICAgICAgICAgICAgKmxhc3RfYmxvY2tfaW5fYmlvID0gYmxrYWRkcjsKPiAgICAgICAgIH0KPgo+
ICsgICAgICAgaWYgKGNjLT5ucl9jcGFnZXMgPiBjYy0+bnJfcnBhZ2VzKQo+ICsgICAgICAgICAg
ICAgICBmMmZzX2lfY29tcHJfcmFfYmxvY2tzX3VwZGF0ZShpbm9kZSwgY2MtPm5yX2NwYWdlcyAt
IGNjLT5ucl9ycGFnZXMsIHRydWUpOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBm
MmZzX2lfY29tcHJfcmFfYmxvY2tzX3VwZGF0ZShpbm9kZSwgY2MtPm5yX3JwYWdlcyAtIGNjLT5u
cl9jcGFnZXMsIGZhbHNlKTsKPiArCj4gICAgICAgICBpZiAoZnJvbV9kbm9kZSkKPiAgICAgICAg
ICAgICAgICAgZjJmc19wdXRfZG5vZGUoJmRuKTsKPgo+IEBAIC0yOTAwLDExICsyOTA1LDExIEBA
IHN0YXRpYyBpbnQgZjJmc193cml0ZV9jYWNoZV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
bWFwcGluZywKPiAgICAgICAgIGludCByYW5nZV93aG9sZSA9IDA7Cj4gICAgICAgICB4YV9tYXJr
X3QgdGFnOwo+ICAgICAgICAgaW50IG53cml0dGVuID0gMDsKPiAtICAgICAgIGludCBzdWJtaXR0
ZWQgPSAwOwo+ICsgICAgICAgaW50IHN1Ym1pdHRlZCA9IDAsIHJhd19kaXJ0eV9wYWdlcyA9IDA7
Cj4gICAgICAgICBpbnQgaTsKPgo+IC0gICAgICAgaWYgKGdldF9kaXJ0eV9wYWdlcyhtYXBwaW5n
LT5ob3N0KSA8PQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU01fSShGMkZTX01f
U0IobWFwcGluZykpLT5taW5faG90X2Jsb2NrcykKPiArICAgICAgIHJhd19kaXJ0eV9wYWdlcyA9
IGdldF9kaXJ0eV9wYWdlcyhtYXBwaW5nLT5ob3N0KTsKPiArICAgICAgIGlmIChyYXdfZGlydHlf
cGFnZXMgPD0gU01fSShGMkZTX01fU0IobWFwcGluZykpLT5taW5faG90X2Jsb2NrcykKPiAgICAg
ICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcobWFwcGluZy0+aG9zdCwgRklfSE9UX0RBVEEpOwo+
ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKG1hcHBpbmct
Pmhvc3QsIEZJX0hPVF9EQVRBKTsKPiBAQCAtMzAzOSw3ICszMDQ0LDYgQEAgc3RhdGljIGludCBm
MmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAj
ZW5kaWYKPiAgICAgICAgICAgICAgICAgICAgICAgICBud3JpdHRlbiArPSBzdWJtaXR0ZWQ7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgd2JjLT5ucl90b193cml0ZSAtPSBzdWJtaXR0ZWQ7Cj4g
LQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShyZXQpKSB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICoga2VlcCBucl90b193cml0ZSwgc2luY2UgdmZzIHVzZXMgdGhpcyB0bwo+IEBAIC0z
MTA1LDYgKzMxMDksMTIgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVj
dCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgICAgICAgaWYgKGJpbykKPiAgICAgICAgICAg
ICAgICAgZjJmc19zdWJtaXRfbWVyZ2VkX2lwdV93cml0ZShzYmksICZiaW8sIE5VTEwpOwo+Cj4g
KyAgICAgICBpZiAoZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKSB7Cj4gKyAgICAgICAgICAg
ICAgIGlmIChud3JpdHRlbiA+IHJhd19kaXJ0eV9wYWdlcykKPiArICAgICAgICAgICAgICAgICAg
ICAgICBmMmZzX2lfY29tcHJfd2FfYmxvY2tzX3VwZGF0ZShpbm9kZSwgbndyaXR0ZW4gLSByYXdf
ZGlydHlfcGFnZXMsIHRydWUpOwo+ICsgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZjJmc19pX2NvbXByX3dhX2Jsb2Nrc191cGRhdGUoaW5vZGUsIHJhd19kaXJ0
eV9wYWdlcyAtIG53cml0dGVuLCBmYWxzZSk7Cj4gKyAgICAgICB9Cj4gICAgICAgICByZXR1cm4g
cmV0Owo+ICB9Cj4KPiBAQCAtMzM2OSw2ICszMzc5LDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRl
X2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywK
PiAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSByZXQ7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBmYWlsOwo+ICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKHJldCkgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaV9jb21wcl93YV9ibG9ja3NfdXBkYXRlKGlub2Rl
LCByZXQgLSAxLCB0cnVlKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAg
ICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RlYnVn
LmMgYi9mcy9mMmZzL2RlYnVnLmMKPiBpbmRleCBmY2RmMjUzY2QyMTEuLjMyZDA2OTkwYjFhNiAx
MDA2NDQKPiAtLS0gYS9mcy9mMmZzL2RlYnVnLmMKPiArKysgYi9mcy9mMmZzL2RlYnVnLmMKPiBA
QCAtMTM5LDYgKzEzOSw4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9nZW5lcmFsX3N0YXR1cyhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICAgICAgICBzaS0+aW5saW5lX2RpciA9IGF0b21pY19y
ZWFkKCZzYmktPmlubGluZV9kaXIpOwo+ICAgICAgICAgc2ktPmNvbXByX2lub2RlID0gYXRvbWlj
X3JlYWQoJnNiaS0+Y29tcHJfaW5vZGUpOwo+ICAgICAgICAgc2ktPmNvbXByX2Jsb2NrcyA9IGF0
b21pYzY0X3JlYWQoJnNiaS0+Y29tcHJfYmxvY2tzKTsKPiArICAgICAgIHNpLT5jb21wcl93YV9i
bG9ja3MgPSBhdG9taWM2NF9yZWFkKCZzYmktPmNvbXByX3dhX2Jsb2Nrcyk7Cj4gKyAgICAgICBz
aS0+Y29tcHJfcmFfYmxvY2tzID0gYXRvbWljNjRfcmVhZCgmc2JpLT5jb21wcl9yYV9ibG9ja3Mp
Owo+ICAgICAgICAgc2ktPmFwcGVuZCA9IHNiaS0+aW1bQVBQRU5EX0lOT10uaW5vX251bTsKPiAg
ICAgICAgIHNpLT51cGRhdGUgPSBzYmktPmltW1VQREFURV9JTk9dLmlub19udW07Cj4gICAgICAg
ICBzaS0+b3JwaGFucyA9IHNiaS0+aW1bT1JQSEFOX0lOT10uaW5vX251bTsKPiBAQCAtMzg5LDgg
KzM5MSw5IEBAIHN0YXRpYyBpbnQgc3RhdF9zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAq
dikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaS0+aW5saW5lX2lub2RlKTsKPiAgICAg
ICAgICAgICAgICAgc2VxX3ByaW50ZihzLCAiICAtIElubGluZV9kZW50cnkgSW5vZGU6ICV1XG4i
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpLT5pbmxpbmVfZGlyKTsKPiAtICAgICAg
ICAgICAgICAgc2VxX3ByaW50ZihzLCAiICAtIENvbXByZXNzZWQgSW5vZGU6ICV1LCBCbG9ja3M6
ICVsbHVcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgc2ktPmNvbXByX2lub2RlLCBz
aS0+Y29tcHJfYmxvY2tzKTsKPiArICAgICAgICAgICAgICAgc2VxX3ByaW50ZihzLCAiICAtIENv
bXByZXNzZWQgSW5vZGU6ICV1LCBCbG9ja3M6ICVsbHUsIFdBIEJsb2NrczogJWxsZCwgUkEgQmxv
Y2tzICVsbGRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc2ktPmNvbXByX2lub2Rl
LCBzaS0+Y29tcHJfYmxvY2tzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHNpLT5jb21w
cl93YV9ibG9ja3MsIHNpLT5jb21wcl9yYV9ibG9ja3MpOwo+ICAgICAgICAgICAgICAgICBzZXFf
cHJpbnRmKHMsICIgIC0gT3JwaGFuL0FwcGVuZC9VcGRhdGUgSW5vZGU6ICV1LCAldSwgJXVcbiIs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgc2ktPm9ycGhhbnMsIHNpLT5hcHBlbmQsIHNp
LT51cGRhdGUpOwo+ICAgICAgICAgICAgICAgICBzZXFfcHJpbnRmKHMsICJcbk1haW4gYXJlYTog
JWQgc2VncywgJWQgc2VjcyAlZCB6b25lc1xuIiwKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZz
LmggYi9mcy9mMmZzL2YyZnMuaAo+IGluZGV4IGQ5YzI3OTVkZDM0ZC4uYWIwOTI4MWMyOGJiIDEw
MDY0NAo+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAt
MTc1MSw2ICsxNzUxLDggQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4gICAgICAgICBhdG9taWNf
dCBpbmxpbmVfZGlyOyAgICAgICAgICAgICAgICAgICAgLyogIyBvZiBpbmxpbmVfZGVudHJ5IGlu
b2RlcyAqLwo+ICAgICAgICAgYXRvbWljX3QgY29tcHJfaW5vZGU7ICAgICAgICAgICAgICAgICAg
IC8qICMgb2YgY29tcHJlc3NlZCBpbm9kZXMgKi8KPiAgICAgICAgIGF0b21pYzY0X3QgY29tcHJf
YmxvY2tzOyAgICAgICAgICAgICAgICAvKiAjIG9mIGNvbXByZXNzZWQgYmxvY2tzICovCj4gKyAg
ICAgICBhdG9taWM2NF90IGNvbXByX3dhX2Jsb2NrczsgICAgICAgICAgICAgLyogIyBvZiBjb21w
cmVzc2VkIFdBIGJsb2NrcyAqLwo+ICsgICAgICAgYXRvbWljNjRfdCBjb21wcl9yYV9ibG9ja3M7
ICAgICAgICAgICAgIC8qICMgb2YgY29tcHJlc3NlZCBSQSBibG9ja3MgKi8KPiAgICAgICAgIGF0
b21pY190IHZ3X2NudDsgICAgICAgICAgICAgICAgICAgICAgICAvKiAjIG9mIHZvbGF0aWxlIHdy
aXRlcyAqLwo+ICAgICAgICAgYXRvbWljX3QgbWF4X2F3X2NudDsgICAgICAgICAgICAgICAgICAg
IC8qIG1heCAjIG9mIGF0b21pYyB3cml0ZXMgKi8KPiAgICAgICAgIGF0b21pY190IG1heF92d19j
bnQ7ICAgICAgICAgICAgICAgICAgICAvKiBtYXggIyBvZiB2b2xhdGlsZSB3cml0ZXMgKi8KPiBA
QCAtMzgyOSw2ICszODMxLDggQEAgc3RydWN0IGYyZnNfc3RhdF9pbmZvIHsKPiAgICAgICAgIGlu
dCBpbmxpbmVfeGF0dHIsIGlubGluZV9pbm9kZSwgaW5saW5lX2RpciwgYXBwZW5kLCB1cGRhdGUs
IG9ycGhhbnM7Cj4gICAgICAgICBpbnQgY29tcHJfaW5vZGU7Cj4gICAgICAgICB1bnNpZ25lZCBs
b25nIGxvbmcgY29tcHJfYmxvY2tzOwo+ICsgICAgICAgbG9uZyBsb25nIGNvbXByX3dhX2Jsb2Nr
czsKPiArICAgICAgIGxvbmcgbG9uZyBjb21wcl9yYV9ibG9ja3M7Cj4gICAgICAgICBpbnQgYXdf
Y250LCBtYXhfYXdfY250LCB2d19jbnQsIG1heF92d19jbnQ7Cj4gICAgICAgICB1bnNpZ25lZCBp
bnQgdmFsaWRfY291bnQsIHZhbGlkX25vZGVfY291bnQsIHZhbGlkX2lub2RlX2NvdW50LCBkaXNj
YXJkX2Jsa3M7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgYmltb2RhbCwgYXZnX3ZibG9ja3M7Cj4g
QEAgLTM5MTcsNiArMzkyMSwxNCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBmMmZzX3N0YXRfaW5m
byAqRjJGU19TVEFUKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgICAgICAgICAg
KGF0b21pYzY0X2FkZChibG9ja3MsICZGMkZTX0lfU0IoaW5vZGUpLT5jb21wcl9ibG9ja3MpKQo+
ICAjZGVmaW5lIHN0YXRfc3ViX2NvbXByX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgKGF0b21pYzY0X3N1YihibG9ja3Ms
ICZGMkZTX0lfU0IoaW5vZGUpLT5jb21wcl9ibG9ja3MpKQo+ICsjZGVmaW5lIHN0YXRfYWRkX2Nv
bXByX3dhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICsgICAgICAgKGF0b21pYzY0X2FkZChibG9ja3MsICZGMkZTX0lfU0IoaW5vZGUpLT5j
b21wcl93YV9ibG9ja3MpKQo+ICsjZGVmaW5lIHN0YXRfc3ViX2NvbXByX3dhX2Jsb2Nrcyhpbm9k
ZSwgYmxvY2tzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgKGF0
b21pYzY0X3N1YihibG9ja3MsICZGMkZTX0lfU0IoaW5vZGUpLT5jb21wcl93YV9ibG9ja3MpKQo+
ICsjZGVmaW5lIHN0YXRfYWRkX2NvbXByX3JhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgKGF0b21pYzY0X2FkZChibG9ja3Ms
ICZGMkZTX0lfU0IoaW5vZGUpLT5jb21wcl9yYV9ibG9ja3MpKQo+ICsjZGVmaW5lIHN0YXRfc3Vi
X2NvbXByX3JhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgICAgKGF0b21pYzY0X3N1YihibG9ja3MsICZGMkZTX0lfU0IoaW5vZGUp
LT5jb21wcl9yYV9ibG9ja3MpKQo+ICAjZGVmaW5lIHN0YXRfaW5jX21ldGFfY291bnQoc2JpLCBi
bGthZGRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGRvIHsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gICAgICAgICAgICAgICAgIGlmIChibGthZGRyIDwgU0lUX0koc2JpKS0+c2l0X2Jhc2VfYWRk
cikgICAgICAgICAgICAgICAgXAo+IEBAIC00MDEyLDYgKzQwMjQsMTAgQEAgdm9pZCBmMmZzX3Vw
ZGF0ZV9zaXRfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+ICAjZGVmaW5lIHN0YXRf
ZGVjX2NvbXByX2lub2RlKGlub2RlKSAgICAgICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgw
KQo+ICAjZGVmaW5lIHN0YXRfYWRkX2NvbXByX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAg
ICAgZG8geyB9IHdoaWxlICgwKQo+ICAjZGVmaW5lIHN0YXRfc3ViX2NvbXByX2Jsb2Nrcyhpbm9k
ZSwgYmxvY2tzKSAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHN0YXRfYWRk
X2NvbXByX3dhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+
ICsjZGVmaW5lIHN0YXRfc3ViX2NvbXByX3dhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAg
ZG8geyB9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHN0YXRfYWRkX2NvbXByX3JhX2Jsb2Nrcyhpbm9k
ZSwgYmxvY2tzKSAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHN0YXRfc3ViX2Nv
bXByX3JhX2Jsb2Nrcyhpbm9kZSwgYmxvY2tzKSAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ICAj
ZGVmaW5lIHN0YXRfdXBkYXRlX21heF9hdG9taWNfd3JpdGUoaW5vZGUpICAgICAgICAgICAgZG8g
eyB9IHdoaWxlICgwKQo+ICAjZGVmaW5lIHN0YXRfaW5jX3ZvbGF0aWxlX3dyaXRlKGlub2RlKSAg
ICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ICAjZGVmaW5lIHN0YXRfZGVjX3ZvbGF0
aWxlX3dyaXRlKGlub2RlKSAgICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+IEBAIC00
NDQ0LDYgKzQ0NjAsMjQgQEAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfaV9jb21wcl9ibG9ja3Nf
dXBkYXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGly
dHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19p
X2NvbXByX3dhX2Jsb2Nrc191cGRhdGUoc3RydWN0IGlub2RlICppbm9kZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgYmxvY2tzLCBib29sIGFk
ZCkKPiArewo+ICsgICAgICAgaWYgKGFkZCkKPiArICAgICAgICAgICAgICAgc3RhdF9hZGRfY29t
cHJfd2FfYmxvY2tzKGlub2RlLCBibG9ja3MpOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAg
ICAgICBzdGF0X3N1Yl9jb21wcl93YV9ibG9ja3MoaW5vZGUsIGJsb2Nrcyk7Cj4gK30KPiArCj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2lfY29tcHJfcmFfYmxvY2tzX3VwZGF0ZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU2NCBibG9ja3MsIGJvb2wgYWRkKQo+ICt7Cj4gKyAgICAgICBpZiAoYWRkKQo+ICsg
ICAgICAgICAgICAgICBzdGF0X2FkZF9jb21wcl9yYV9ibG9ja3MoaW5vZGUsIGJsb2Nrcyk7Cj4g
KyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHN0YXRfc3ViX2NvbXByX3JhX2Jsb2Nrcyhp
bm9kZSwgYmxvY2tzKTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSBpbnQgYmxvY2tfdW5hbGln
bmVkX0lPKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqaXRlcikKPiAgewo+IC0t
Cj4gMi4zNS4xCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
