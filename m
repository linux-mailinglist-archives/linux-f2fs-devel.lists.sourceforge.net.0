Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5721CA4D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 09:10:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWx9c-0006Aw-7L; Fri, 08 May 2020 07:10:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jWx9b-0006Ap-30
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 07:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2yw+Oc8uchfFJIgIKd4NSe1RDuHB+KisGrKNv6yH5RA=; b=OzkeBeVxdSnNMXrVWMrNenRzQg
 oS2bCLhQaDbLfP5rZy32yDZTAu2fowhjtI1rfNfmEofEZJmNzuAalcW7HkqZlBI3IR0ajTtsNfWxC
 5NpODVhF8pZ8i87/YMb7DGKqVCyEauuRNj87YwbO56H49PNpw2lGbSEriabCcSHbC994=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2yw+Oc8uchfFJIgIKd4NSe1RDuHB+KisGrKNv6yH5RA=; b=kbYWN+/Ca4RWLSEtUnh4/xUg7e
 WwJrwAeF53aKxcpRBYLXtfGByKPdMnvLO4DimSWMW/OP1rfp09ulXSRkF23tfSgij1HL8ubI7HYMT
 99jczpfSBsc3GS6kr0eCPSsvl/NFkrsCXWXQNsZFzIZmPLB0oLggfxIpydVZt1vltr2M=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWx9Z-00FCHp-MV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 07:10:39 +0000
Received: by mail-lf1-f68.google.com with SMTP id 188so587421lfa.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 May 2020 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2yw+Oc8uchfFJIgIKd4NSe1RDuHB+KisGrKNv6yH5RA=;
 b=Z7Vt+fKTr9+acIVGvyZvH5CiGIc3MBcbp/A9lXQO2B9o8peUL7WB+eAOCKpnc/Hx7E
 U0TxWPRhtXjct847b/zjFZ1weI7CA+sLhL1sruoqTt3j7tDfgowAX6IbdyslzeAAX3YW
 zNJIJs6sNl84a+duqXIhg01qa3sOYIfM13ms7Yj32x8kgWhVhMoWDw/uFJswudwYGm+r
 UG5L9Tm4JW43U0F4dPZ2cbc2qVYw3Dvqx/DJW/bMVxQYP5T9D1swj7+eMZA53JwjyNOt
 alXgmT7Ldy0P8Dn9HyjThzu5wmsjrYPK7oWfd1tEODWraOlEexR7kxO/KnjrNULChLKe
 EqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2yw+Oc8uchfFJIgIKd4NSe1RDuHB+KisGrKNv6yH5RA=;
 b=gnE41kBszTW66bGpXijix95P9xCjv7NoW/vLedjsgCD5pmk4RXdZ9Cggl/laM5LoCT
 4VFPtfPAlIXaVVkgqx71VOCSi13DQtsXX4NfEYyxHAzteqA3KoTEI0/8apLW9S0ANWlj
 yFgjtkY5022jW3B+I8rkyhF4yg3trijE9qbmsKB5nTz4t4LPE0RRbxKXSqNVIFzyCuaF
 TzF3Hk6CCdY5k6EbsOhhEOek8jqYeguo5vnZKnM8bQFWxaJPJ7ta//XHZq4gjtklkuaI
 8sSJr1h8obgchlyLGnJIBBp81/t1cERKHDx9mA7u3tOOL84eSDl9XlSZHmtQ8IEVGD/i
 H1Wg==
X-Gm-Message-State: AOAM533cvg/5PxBwetY3P/1rTqoIquT6XmpIuNMsviqj/ekHcIo1C5Jf
 nT9Kd3CwZILrjBvSFHFbxErB7yv1jV8MRf+pxEs=
X-Google-Smtp-Source: ABdhPJxOcTrF/byKHU6n4YHPBzrVb4Xxz4SiDR92+jxZTyozhU/KXjsxPuhGTHTqKyEOSugpwjbyZGBxbyDISSmGGL8=
X-Received: by 2002:a05:6512:3b2:: with SMTP id
 v18mr912384lfp.140.1588921830813; 
 Fri, 08 May 2020 00:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200508042506.143395-1-daeho43@gmail.com>
 <4dfb73d9-03a0-bb2f-a112-1dd42db4d7bb@huawei.com>
 <CACOAw_z0BU3t7V+BN7TvaO96GckwNh2SRLreGxO60EDbMb_epw@mail.gmail.com>
 <cd08c824-c5d3-9603-7a81-a48cb191ac99@huawei.com>
In-Reply-To: <cd08c824-c5d3-9603-7a81-a48cb191ac99@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 8 May 2020 16:10:19 +0900
Message-ID: <CACOAw_xx-ZsVgEEb3D9Zu+2gWLZb9UjE3p8sDZbTNywcu2yBPA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWx9Z-00FCHp-MV
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing
 cblocks
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

T29wcywKCkkgd2lsbCByZS1jaGVjayBpdC4KClRoYW5rcywKCjIwMjDrhYQgNeyblCA47J28ICjq
uIgpIOyYpO2bhCA0OjA5LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyE
sToKPgo+IE9uIDIwMjAvNS84IDE0OjU4LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEkgbW92ZWQg
Y2hlY2tpbmcgaV9jb21wcl9ibG9ja3MgcGhyYXNlIGFmdGVyIGNhbGxpbmcgaW5vZGVfbG9jaygp
Cj4gPiBhbHJlYWR5LCBiZWNhdXNlIHdlIHNob3VsZCBjaGVjayB0aGlzIGFmdGVyIHdyaXRpbmcg
cGFnZXMuCj4gPgo+ID4gU28sIGlmIGl0IGZhaWxzIHRvIGNoZWNrIGlfY29tcHJfYmxvY2tzLCB3
ZSBuZWVkIHRvIGNhbGwgaW5vZGVfdW5sb2NrKCkuCj4gPgo+ID4gQW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8KPgo+IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIEkgZ2V0IHRoaXM6Cj4KPiAgICAg
ICAgIHJldCA9IG1udF93YW50X3dyaXRlX2ZpbGUoZmlscCk7Cj4gICAgICAgICBpZiAocmV0KQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Cj4gICAgICAgICBpZiAoIUYyRlNfSShpbm9k
ZSktPmlfY29tcHJfYmxvY2tzKQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPgo+ICAgICAg
ICAgZjJmc19iYWxhbmNlX2ZzKEYyRlNfSV9TQihpbm9kZSksIHRydWUpOwo+Cj4gICAgICAgICBp
bm9kZV9sb2NrKGlub2RlKTsKPgo+ID4KPiA+IDIwMjDrhYQgNeyblCA47J28ICjquIgpIOyYpO2b
hCAzOjUwLCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPiA+Pgo+
ID4+IE9uIDIwMjAvNS84IDEyOjI1LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+Pj4gRnJvbTogRGFl
aG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4KPiA+Pj4gTm93LCBpZiB3cml0
aW5nIHBhZ2VzIGFuZCByZWxlYXNpbmcgY29tcHJlc3MgYmxvY2tzIG9jY3VyCj4gPj4+IHNpbXVs
dGFuZW91c2x5LCBhbmQgcmVsZWFzaW5nIGNibG9ja3MgaXMgZXhlY3V0ZWQgbW9yZSB0aGFuIG9u
ZSB0aW1lCj4gPj4+IHRvIGEgZmlsZSwgdGhlbiB0b3RhbCBibG9jayBjb3VudCBvZiBmaWxlc3lz
dGVtIGFuZCBibG9jayBjb3VudCBvZiB0aGUKPiA+Pj4gZmlsZSBjb3VsZCBiZSBpbmNvcnJlY3Qg
YW5kIGRhbWFnZWQuCj4gPj4+Cj4gPj4+IFdlIGhhdmUgdG8gZXhlY3V0ZSByZWxlYXNpbmcgY29t
cHJlc3MgYmxvY2tzIG9ubHkgb25lIHRpbWUgZm9yIGEgZmlsZQo+ID4+PiB3aXRob3V0IGJlaW5n
IGludGVyZmVyZWQgYnkgd3JpdGVwYWdlcyBwYXRoLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIGZz
L2YyZnMvZmlsZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPj4+Cj4g
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPj4+IGlu
ZGV4IDRhYWI0YjQyZDhiYS4uYTkyYmM1MWI5YjI4IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZz
L2ZpbGUuYwo+ID4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+PiBAQCAtMzQ4OCw2ICszNDg4
LDcgQEAgc3RhdGljIGludCBmMmZzX3JlbGVhc2VfY29tcHJlc3NfYmxvY2tzKHN0cnVjdCBmaWxl
ICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4gICAgICAgcGdvZmZfdCBwYWdlX2lkeCA9
IDAsIGxhc3RfaWR4Owo+ID4+PiAgICAgICB1bnNpZ25lZCBpbnQgcmVsZWFzZWRfYmxvY2tzID0g
MDsKPiA+Pj4gICAgICAgaW50IHJldDsKPiA+Pj4gKyAgICAgaW50IHdyaXRlY291bnQ7Cj4gPj4+
Cj4gPj4+ICAgICAgIGlmICghZjJmc19zYl9oYXNfY29tcHJlc3Npb24oRjJGU19JX1NCKGlub2Rl
KSkpCj4gPj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4+Cj4gPj4gQmVm
b3JlIGlub2RlX2xvY2soKSwgdGhlcmUgaXMgb25lIGNhc2Ugd2UgbWF5IGp1bXAgdG8gb3V0IGxh
YmVsLCBpbgo+ID4+IHRoaXMgY2FzZSwgd2UgbWF5IHVubG9jayBpbm9kZSBpbmNvcnJlY3RseS4K
PiA+Pgo+ID4+ICAgICAgICAgaWYgKCFGMkZTX0koaW5vZGUpLT5pX2NvbXByX2Jsb2NrcykKPiA+
PiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPj4KPiA+Pj4gLQo+ID4+PiAtICAgICBpbm9k
ZV91bmxvY2soaW5vZGUpOwo+ID4+PiAgb3V0Ogo+ID4+PiArICAgICBpbm9kZV91bmxvY2soaW5v
ZGUpOwo+ID4+PiArCj4gPj4+ICAgICAgIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7Cj4gPj4K
PiA+PiBUaGFua3MsCj4gPiAuCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
