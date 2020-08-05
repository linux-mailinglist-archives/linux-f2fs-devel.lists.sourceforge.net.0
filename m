Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A186323D3BE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Aug 2020 00:00:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k3RS2-0004Gs-Vl; Wed, 05 Aug 2020 21:59:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nolange79@gmail.com>) id 1k3RS2-0004Gl-A8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Aug 2020 21:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wOkgI/Wz098YX1LR7UIkrlYUrECtvyThdMw2Xxwk6u8=; b=Itf348J8LLzoshSxYnIhwaswcy
 F2ifLq1Mpa0YC7Gmi0n79NW8/40vS8gZxA+AxXKpJUQ0P64/o65pR8YrO6yaZK9alkLrZ3U6yr1W8
 oDz78JStW85PDZnmlIN2lpgQzj066VouK61kAxp0YP1p4rcM5B9hRB9H1qNxesbu/FLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wOkgI/Wz098YX1LR7UIkrlYUrECtvyThdMw2Xxwk6u8=; b=GL1/sIjq033I+pVjBvmoE/s17F
 Bb30pt3Ny0D39U666go/2loNF35+oq5mrx2GIxBugQmUYo7OIPOEjQxa1fFRK4WWmVbanlTc1KlOa
 kifqx4Ms5A9fax65qMqHx7XybTCd1c9WI7/UliviN3SOLuZWHA8Q5aTRV0wk8qjmPQUE=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k3RS0-007YJi-4T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Aug 2020 21:59:58 +0000
Received: by mail-io1-f66.google.com with SMTP id q75so39400687iod.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Aug 2020 14:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wOkgI/Wz098YX1LR7UIkrlYUrECtvyThdMw2Xxwk6u8=;
 b=TiYiUmp1hzKuD8PssuZN3qxY27RIF0AId+Adcf2W5TCTCNdycu3uAuDvoKm7D3OZqg
 dsJvyea29Bhk+PesNSvkP3zhmBweL8vld/dMA6zu/qXLbqwBTHd7MNUgjzrOHqgBhFww
 Z3qEDp05YSHHTsiq7K2ycHx6LYaJetZ/rOL+YT+r2mPZ2KPAt/7fDEAqs+JC6DTVD2sD
 6swiVt4DBY53GZyg/puRuYCu8JZg45E7uuy141VY93zDOCqhIbGjvSN8ep+E6Sya5Pj2
 JMyEFdnMlxK7pObJIEAcdTIPRN0MYja7KDoiN8M5CEf1CuiYUyvZJ06LDdKGWO0DLhhG
 y2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wOkgI/Wz098YX1LR7UIkrlYUrECtvyThdMw2Xxwk6u8=;
 b=d30jhaAVC42Ck6P4w7gqMjJ0w8oiEuN+ePzeJlY/6Anzjg1Y3TeE5LkugKrPpKWkWG
 Ws0NoooN+NWyQ/oQPjSPGmrx3N3fP1YjrnI8KrwSBKj+e4niNwB7lFljsJRqwGa+n6lC
 7FiRjUPR4IgWTJT6qCarad6dDR58tfUFEX9J6poYDyEPNetG+uy8TgjyDNGRxJK6KR21
 lO7FlAP9Txuu84LNMrOhtnSA66wH90RMXcn11PmrmDySYgi7aPBfeu3IqoUebXy1xd0z
 0m8f0Uzl3hdEq/0oxt3FWog1Zo3tQTo3paI/V9ggStfeLxrHeLM76DMoACQStbKOAAch
 1Gvw==
X-Gm-Message-State: AOAM531RuXuNA2mZvWN0MjQgezPoecms57Rv8zWhI80ihvGntvYd1bck
 LWEOu/N6F8tzsmjcaeVssGtzb49ZJvQE131Is6dy5Z5N
X-Google-Smtp-Source: ABdhPJw8N7YTpk/HCjIqlb7ocqZNy8hod8d7I6EIZDLAZVzoDQWXLH1PF+PRJCDp5AFU8VxNI+B3A21Lk34GZBr58VU=
X-Received: by 2002:a05:6638:2689:: with SMTP id
 o9mr6915594jat.37.1596664790450; 
 Wed, 05 Aug 2020 14:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200805080913.48133-1-yuchao0@huawei.com>
In-Reply-To: <20200805080913.48133-1-yuchao0@huawei.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 5 Aug 2020 23:59:39 +0200
Message-ID: <CADYdroN4fFPZU4n1BNHi7v3QXV0SuQtPnWiLqbB0C3nsqZq4yQ@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nolange79[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (nolange79[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k3RS0-007YJi-4T
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: correct return value
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QW0gTWkuLCA1LiBBdWcuIDIwMjAgdW0gMTA6MTAgVWhyIHNjaHJpZWIgQ2hhbyBZdSA8eXVjaGFv
MEBodWF3ZWkuY29tPjoKPgo+IEFzIE5vcmJlcnQgTGFuZ2UgcmVwb3J0ZWQ6Cj4KPiAiCj4gJCBm
c2NrLmYyZnMgLWEgL2Rldi9tbWNibGswcDU7IGVjaG8gJD8KPiBJbmZvOiBGaXggdGhlIHJlcG9y
dGVkIGNvcnJ1cHRpb24uCj4gSW5mbzogTW91bnRlZCBkZXZpY2UhCj4gSW5mbzogQ2hlY2sgRlMg
b25seSBvbiBSTyBtb3VudGVkIGRldmljZQo+IEVycm9yOiBGYWlsZWQgdG8gb3BlbiB0aGUgZGV2
aWNlIQo+IDI1NQo+ICIKPgo+IE1pY2hhZWwgTGHDnyByZW1pbmRzOgo+Cj4gIgo+IEkgdGhpbmsg
dGhlIHJldHVybiB2YWx1ZSBpcyBleGFjdGx5IHRoZSBwcm9ibGVtIGhlcmUuIFNlZSBmc2NrKDgp
ICgKPiBodHRwczovL2xpbnV4LmRpZS5uZXQvbWFuLzgvZnNjaykgd2hpY2ggc3BlY2lmaWVzIHRo
ZSByZXR1cm4gdmFsdWVzLgo+IFN5c3RlbWQgbG9va3MgYXQgdGhlc2UgYW5kIGRlY2lkZXMgaG93
IHRvIHByb2NlZWQ6Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2Jsb2Iv
YTg1OWFiZjA2MmNlZjE1MTFlNDg3OWM0ZWUzOWM2MDM2ZWJlYWVjOC9zcmMvZnNjay9mc2NrLmMj
TDQwNwo+Cj4gVGhhdCBtZWFucywgaWYgZnNjay5mMmZzIHJldHVybnMgMjU1LCB0aGVuCj4gdGhl
IEZTQ0tfU1lTVEVNX1NIT1VMRF9SRUJPT1QgYml0IGlzIHNldCBhbmQgc3lzdGVtZCB3aWxsIHJl
Ym9vdC4KPiAiCj4KPiBTbyB0aGUgcHJvYmxlbSBoZXJlIGlzIGZzY2suZjJmcyBkaWRuJ3QgcmV0
dXJuIGNvcnJlY3QgdmFsdWUgdG8gdXNlcnNwYWNlCj4gYXBwcywgcmVzdWx0IGluIGxhdGVyIHVu
ZXhwZWN0ZWQgYmVoYXZpb3Igb2YgcmVib290aW5nLCBsZXQncyBmaXggdGhpcy4KPgo+IFJlcG9y
dGVkLWJ5OiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+IFJlcG9ydGVkLWJ5
OiBNaWNoYWVsIExhw58gPGJldmFuQGJpLWNvLm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1
IDx5dWNoYW8wQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGZzY2svZnNjay5oIHwgMTEgKysrKysrKysr
KysKPiAgZnNjay9tYWluLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2ZzY2svZnNjay5oIGIvZnNjay9mc2NrLmgKPiBpbmRleCBlODY3MzBjMzRmYzQuLmM1
ZTg1ZmVmYTA3YiAxMDA2NDQKPiAtLS0gYS9mc2NrL2ZzY2suaAo+ICsrKyBiL2ZzY2svZnNjay5o
Cj4gQEAgLTEzLDYgKzEzLDE3IEBACj4KPiAgI2luY2x1ZGUgImYyZnMuaCIKPgo+ICtlbnVtIHsK
PiArICAgICAgIEZTQ0tfU1VDQ0VTUyAgICAgICAgICAgICAgICAgPSAwLAo+ICsgICAgICAgRlND
S19FUlJPUl9DT1JSRUNURUQgICAgICAgICA9IDEgPDwgMCwKPiArICAgICAgIEZTQ0tfU1lTVEVN
X1NIT1VMRF9SRUJPT1QgICAgPSAxIDw8IDEsCj4gKyAgICAgICBGU0NLX0VSUk9SU19MRUZUX1VO
Q09SUkVDVEVEID0gMSA8PCAyLAo+ICsgICAgICAgRlNDS19PUEVSQVRJT05BTF9FUlJPUiAgICAg
ICA9IDEgPDwgMywKPiArICAgICAgIEZTQ0tfVVNBR0VfT1JfU1lOVEFYX0VSUk9SICAgPSAxIDw8
IDQsCj4gKyAgICAgICBGU0NLX1VTRVJfQ0FOQ0VMTEVEICAgICAgICAgID0gMSA8PCA1LAo+ICsg
ICAgICAgRlNDS19TSEFSRURfTElCX0VSUk9SICAgICAgICA9IDEgPDwgNywKPiArfTsKPiArCj4g
IHN0cnVjdCBxdW90YV9jdHg7Cj4KPiAgI2RlZmluZSBGU0NLX1VOTUFUQ0hFRF9FWFRFTlQgICAg
ICAgICAgMHgwMDAwMDAwMQo+IGRpZmYgLS1naXQgYS9mc2NrL21haW4uYyBiL2ZzY2svbWFpbi5j
Cj4gaW5kZXggOWExNTk2ZjM1ZTc5Li4xMWQ0NzJiOTk0MWMgMTAwNjQ0Cj4gLS0tIGEvZnNjay9t
YWluLmMKPiArKysgYi9mc2NrL21haW4uYwo+IEBAIC02MzAsNyArNjMwLDcgQEAgdm9pZCBmMmZz
X3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgICAgICAgIGVycm9yX291
dChwcm9nKTsKPiAgfQo+Cj4gLXN0YXRpYyB2b2lkIGRvX2ZzY2soc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKQo+ICtzdGF0aWMgaW50IGRvX2ZzY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgZjJmc19jaGVja3BvaW50ICpja3B0ID0gRjJGU19DS1BUKHNi
aSk7Cj4gICAgICAgICB1MzIgZmxhZyA9IGxlMzJfdG9fY3B1KGNrcHQtPmNrcHRfZmxhZ3MpOwo+
IEBAIC02NTUsNyArNjU1LDcgQEAgc3RhdGljIHZvaWQgZG9fZnNjayhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIE1TRygwLCAiW0ZTQ0tdIEYyRlMgbWV0YWRhdGEgICBbT2su
Ll0iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZzY2tfZnJlZShzYmkpOwo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIEZTQ0tfU1VDQ0VTUzsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWMucm8pCj4gQEAgLTY4
Nyw3ICs2ODcsNyBAQCBzdGF0aWMgdm9pZCBkb19mc2NrKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSkKPiAgICAgICAgICAgICAgICAgcmV0ID0gcXVvdGFfaW5pdF9jb250ZXh0KHNiaSk7Cj4gICAg
ICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBBU1NFUlRf
TVNHKCJxdW90YV9pbml0X2NvbnRleHQgZmFpbHVyZTogJWQiLCByZXQpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gRlND
S19PUEVSQVRJT05BTF9FUlJPUjsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+ICAg
ICAgICAgZnNja19jaGtfb3JwaGFuX25vZGUoc2JpKTsKPiBAQCAtNjk1LDggKzY5NSwxNCBAQCBz
dGF0aWMgdm9pZCBkb19mc2NrKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBGMkZTX0ZUX0RJUiwgVFlQRV9JTk9ERSwgJmJsa19jbnQsIE5VTEwpOwo+
ICAgICAgICAgZnNja19jaGtfcXVvdGFfZmlsZXMoc2JpKTsKPgo+IC0gICAgICAgZnNja192ZXJp
Znkoc2JpKTsKPiArICAgICAgIHJldCA9IGZzY2tfdmVyaWZ5KHNiaSk7Cj4gICAgICAgICBmc2Nr
X2ZyZWUoc2JpKTsKPiArCj4gKyAgICAgICBpZiAoIWMuYnVnX29uKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gRlNDS19TVUNDRVNTOwo+ICsgICAgICAgaWYgKCFyZXQpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiBGU0NLX0VSUk9SX0NPUlJFQ1RFRDsKPiArICAgICAgIHJldHVybiBGU0NLX0VS
Uk9SU19MRUZUX1VOQ09SUkVDVEVEOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgZG9fZHVtcChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gQEAgLTgzMywxMSArODM5LDE1IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKPiAgICAgICAgIGlmIChjLmZ1bmMgIT0gRFVNUCAmJiBmMmZz
X2RldnNfYXJlX3Vtb3VudGVkKCkgPCAwKSB7Cj4gICAgICAgICAgICAgICAgIGlmIChlcnJubyA9
PSBFQlVTWSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC0xOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChjLmZ1bmMgPT0gRlNDSykKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldCA9IEZTQ0tfT1BFUkFUSU9OQUxfRVJST1I7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBxdWlja19lcnI7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAg
ICAgICAgICAgaWYgKCFjLnJvIHx8IGMuZnVuYyA9PSBERUZSQUcpIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBNU0coMCwgIlx0RXJyb3I6IE5vdCBhdmFpbGFibGUgb24gbW91bnRlZCBkZXZp
Y2UhXG4iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtMTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoYy5mdW5jID09IEZTQ0spCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBGU0NLX09QRVJBVElPTkFMX0VSUk9SOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gcXVpY2tfZXJyOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiBAQCAtODU0
LDYgKzg2NCw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgICAgICAgIC8q
IEdldCBkZXZpY2UgKi8KPiAgICAgICAgIGlmIChmMmZzX2dldF9kZXZpY2VfaW5mbygpIDwgMCkg
ewo+ICAgICAgICAgICAgICAgICByZXQgPSAtMTsKPiArICAgICAgICAgICAgICAgaWYgKGMuZnVu
YyA9PSBGU0NLKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IEZTQ0tfT1BFUkFUSU9O
QUxfRVJST1I7Cj4gICAgICAgICAgICAgICAgIGdvdG8gcXVpY2tfZXJyOwo+ICAgICAgICAgfQo+
Cj4gQEAgLTg3Myw3ICs4ODUsNyBAQCBmc2NrX2FnYWluOgo+Cj4gICAgICAgICBzd2l0Y2ggKGMu
ZnVuYykgewo+ICAgICAgICAgY2FzZSBGU0NLOgo+IC0gICAgICAgICAgICAgICBkb19mc2NrKHNi
aSk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGRvX2ZzY2soc2JpKTsKClRoaXMgcmV0dXJuY29k
ZSB3aWxsIG5ldmVyIGJlIHVzZWQuCgo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgI2lmZGVm
IFdJVEhfRFVNUAo+ICAgICAgICAgY2FzZSBEVU1QOgo+IEBAIC05MzUsOCArOTQ3LDExIEBAIHJl
dHJ5Ogo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gICAgICAgICByZXQgPSBmMmZz
X2ZpbmFsaXplX2RldmljZSgpOwo+IC0gICAgICAgaWYgKHJldCA8IDApCj4gKyAgICAgICBpZiAo
cmV0KSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChjLmZ1bmMgPT0gRlNDSykKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gRlNDS19PUEVSQVRJT05BTF9FUlJPUjsKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcHJpbnRmKCJcbkRvbmU6
ICVsZiBzZWNzXG4iLCAoZ2V0X2Jvb3R0aW1lX25zKCkgLSBzdGFydCkgLyAxMDAwMDAwMDAwLjAp
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0KPiAyLjI2LjIKPgoKTm9yYmVydAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
