Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB8830B171
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 21:12:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6fYC-0007Od-34; Mon, 01 Feb 2021 20:11:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l6fY5-0007OJ-9F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 20:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUEArQaWdL0oHA6H68N45B+1vQ/HAMovW/vTIbqQLZg=; b=kYhklLkRJcZOhPT160TaHotjgM
 TI3djHHulV1OATYDKHLn9meMg4DitwpskFni0kBwrO6Z+Fq1fbqdKcJuWcI/Fs7SRUF08mNrI5wLa
 CmHvN3UyT8tqOmQ97qaAVdII70j1cgQY/oko3RNFgJWJXI4NJAR6lcbXYOoujOgwL01Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WUEArQaWdL0oHA6H68N45B+1vQ/HAMovW/vTIbqQLZg=; b=bymmiPcvM9L9zid4hkfZiMiOCy
 mbGz15Pwhh/m4aMd/vWggdaYMFN2kQusRkOk1IaNOL8pTORNNMyDoNT1vczRZZ2vusyn+tmFmL1/H
 lTDqhWdfxYB0GWEIA8ZRB3pCsTvJlAhqSnYkhE/SpM8Dk0fKnTibbLWPdt87AQiX+BRE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l6fXr-00Bu6O-Kr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 20:11:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8EC464DDB;
 Mon,  1 Feb 2021 20:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612210285;
 bh=SVk6wZfqxxsHCXT7WOr31/Z4hljLQRXiUCLq5W0mmSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AkukJlKbzFq/tYjOL1ZqZSLmh7lX2Thorgufxc0WYAbW3R7aZTGNe+Vpb/NfFchlH
 owWBvBmQlPdbZ/aO5GFvwp3WpSu7yMg0aZ7WMQr1Kwj75fyybr32V/kbj5zbBaBmWB
 TyBhDGD0MgMkxZhylgIFozuGIOCZHnnq270cl7i1o7ghQFTNospWZzls7twhCeMcuw
 Vdqgu6uoUrgcG7EbOseFXJSYx3jLiIi/YcyTk8+6vcSO+GeDCBDQnqJYLpkhDQ2MZP
 zP1D7vOBDeKOQm09LMEelEWgwE3yEbaQo+EIwd0HXnpppwv1veocvfQI9FGiH5X8EB
 xGNCbxodaqP0w==
Date: Mon, 1 Feb 2021 12:11:23 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YBhga9OJPcRa7ntk@google.com>
References: <20210201000606.2206740-1-daeho43@gmail.com>
 <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
 <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6fXr-00Bu6O-Kr
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix checkpoint mount option wrong
 combination
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDIvMDEsIERhZWhvIEplb25nIHdyb3RlOgo+IEFjdHVhbGx5LCBJIHRoaW5rIHdlIG5lZWQg
dG8gc2VsZWN0IG9uZSBhbW9uZyB0aGVtLCBkaXNhYmxlLCBlbmFibGUKPiBhbmQgbWVyZ2UuIEkg
cmVhbGl6ZWQgbXkgcHJldmlvdXMgdW5kZXJzdGFuZGluZyBhYm91dCB0aGF0IHdhcyB3cm9uZy4K
PiBJbiB0aGF0IGNhc2Ugb2YgImNoZWNrcG9pbnQ9bWVyZ2UsY2hlY2twb2ludD1lbmFibGUiLCB0
aGUgbGFzdCBvcHRpb24KPiB3aWxsIG92ZXJyaWRlIHRoZSBvbmVzIGJlZm9yZSB0aGF0Lgo+IFRo
aXMgaXMgaG93IHRoZSBvdGhlciBtb3VudCBvcHRpb25zIGxpa2UgZnN5bmNfbW9kZSwgd2hpbnRf
bW9kZSBhbmQgZXRjLgo+IFNvLCB0aGUgYW5zd2VyIHdpbGwgYmUgImNoZWNrcG9pbnQ9ZW5hYmxl
Ii4gV2hhdCBkbyB5b3UgdGhpbms/CgpXZSBuZWVkIHRvIGNsYXJpZnkgYSBiaXQgbW9yZS4gOikK
Cm1vdW50IGNoZWNrcG9pbnQ9ZGlzYWJsZSxjaGVja3BvaW50PW1lcmdlCnJlbW91bnQgY2hlY2tw
b2ludD1lbmFibGUsY2hlY2twb2ludD1tZXJnZQoKVGhlbiwgaXMgaXQgZ29pbmcgdG8gZW5hYmxl
IGNoZWNrcG9pbnQgd2l0aCBhIHRocmVhZD8KCj4gCj4gCj4gCj4gMjAyMeuFhCAy7JuUIDHsnbwg
KOyblCkg7Jik7ZuEIDk6NDAsIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISx
Ogo+ID4KPiA+IE9uIDIwMjEvMi8xIDg6MDYsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPiBGcm9t
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gPgo+ID4gPiBBcyBjaGVj
a3BvaW50PW1lcmdlIGNvbWVzIGluLCBtb3VudCBvcHRpb24gc2V0dGluZyByZWxhdGVkIHRvCj4g
PiA+IGNoZWNrcG9pbnQgaGFkIGJlZW4gbWl4ZWQgdXAuIEZpeGVkIGl0Lgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gPiAt
LS0KPiA+ID4gICBmcy9mMmZzL3N1cGVyLmMgfCAxMSArKysrKy0tLS0tLQo+ID4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gaW5kZXgg
NTY2OTZmNmNmYTg2Li44MjMxYzg4OGM3NzIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2YyZnMvc3Vw
ZXIuYwo+ID4gPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gQEAgLTkzMCwyMCArOTMwLDI1
IEBAIHN0YXRpYyBpbnQgcGFyc2Vfb3B0aW9ucyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBjaGFy
ICpvcHRpb25zLCBib29sIGlzX3JlbW91bnQpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgRjJGU19P
UFRJT04oc2JpKS51bnVzYWJsZV9jYXBfcGVyYyA9IGFyZzsKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgIHNldF9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgY2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gICAgICAgICAgICAgICBjYXNlIE9wdF9jaGVj
a3BvaW50X2Rpc2FibGVfY2FwOgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFyZ3Mt
PmZyb20gJiYgbWF0Y2hfaW50KGFyZ3MsICZhcmcpKQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIEYy
RlNfT1BUSU9OKHNiaSkudW51c2FibGVfY2FwID0gYXJnOwo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgc2V0X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBNRVJHRV9DSEVDS1BPSU5UKTsKPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgICAgICAgICAgIGNhc2UgT3B0X2NoZWNr
cG9pbnRfZGlzYWJsZToKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHNldF9vcHQoc2JpLCBE
SVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY2xlYXJfb3B0
KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ID4gICAgICAgICAgICAgICBjYXNlIE9wdF9jaGVja3BvaW50X2VuYWJsZToKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGNsZWFyX29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBNRVJHRV9DSEVDS1BP
SU5UKTsKPiA+Cj4gPiBXaGF0IGlmOiAtbyBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9ZW5h
YmxlCj4gPgo+ID4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB0aGUgcnVsZSBvZiBtZXJnZS9kaXNh
YmxlL2VuYWJsZSBjb21iaW5hdGlvbiBhbmQgdGhlaXIKPiA+IHJlc3VsdD8gZS5nLgo+ID4gY2hl
Y2twb2ludD1tZXJnZSxjaGVja3BvaW50PWVuYWJsZQo+ID4gY2hlY2twb2ludD1lbmFibGUsY2hl
Y2twb2ludD1tZXJnZQo+ID4gY2hlY2twb2ludD1tZXJnZSxjaGVja3BvaW50PWRpc2FibGUKPiA+
IGNoZWNrcG9pbnQ9ZGlzYWJsZSxjaGVja3BvaW50PW1lcmdlCj4gPgo+ID4gSWYgdGhlIHJ1bGUv
cmVzdWx0IGlzIGNsZWFyLCBpdCBzaG91bGQgYmUgZG9jdW1lbnRlZC4KPiA+Cj4gPiBUaGFua3Ms
Cj4gPgo+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgICAg
ICAgICAgIGNhc2UgT3B0X2NoZWNrcG9pbnRfbWVyZ2U6Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBjbGVhcl9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgc2V0X29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBS
RVNTSU9OCj4gPiA+IEBAIC0xMTQyLDEyICsxMTQ3LDYgQEAgc3RhdGljIGludCBwYXJzZV9vcHRp
b25zKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGNoYXIgKm9wdGlvbnMsIGJvb2wgaXNfcmVtb3Vu
dCkKPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gICAgICAgfQo+ID4g
Pgo+ID4gPiAtICAgICBpZiAodGVzdF9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpICYmCj4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICB0ZXN0X29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQp
KSB7Cj4gPiA+IC0gICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiY2hlY2twb2ludD1tZXJnZSBj
YW5ub3QgYmUgdXNlZCB3aXRoIGNoZWNrcG9pbnQ9ZGlzYWJsZVxuIik7Cj4gPiA+IC0gICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+IC0gICAgIH0KPiA+ID4gLQo+ID4gPiAgICAgICAv
KiBOb3QgcGFzcyBkb3duIHdyaXRlIGhpbnRzIGlmIHRoZSBudW1iZXIgb2YgYWN0aXZlIGxvZ3Mg
aXMgbGVzc2VyCj4gPiA+ICAgICAgICAqIHRoYW4gTlJfQ1VSU0VHX1BFUlNJU1RfVFlQRS4KPiA+
ID4gICAgICAgICovCj4gPiA+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
