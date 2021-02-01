Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5730B39B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 00:33:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6ihR-0007rt-VZ; Mon, 01 Feb 2021 23:33:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6ihR-0007rn-6z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 23:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yAFqh/lDI2QEzpZGleo/NCpCzManWthLMflN8iWmGMA=; b=gWPsa9aq8BLqUcQRlR80l3UStN
 fY6wgMqOIy14p7OlRD/5w3ungCe5detjzD1sepK3RiJmjgIhB/8kBVa9N/BrKjOEBeJgzUzwjKexu
 xTY6uHO+9fllAbNyb3I5TBMzodi7A5fbyecatFjpUBDw9QEIHMTf9y4DYR5es9HfO4C8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yAFqh/lDI2QEzpZGleo/NCpCzManWthLMflN8iWmGMA=; b=RThu2wvPg4uKcegkap0GFI7aR2
 sqyOw2IW31mSfWTVp5WluIdHpPe3yWksITz6rqLilHaN8ftTtuodLg7+fSMEOrm4rZ6AqgDNcekJm
 Igl8Q37aX5r0rzjh57HM8xn/T+CaCgO8DA8R6AXRWIteiHVlaYWmP9C6WrbR5nhoYyqo=;
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6ihH-00035D-FS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 23:33:40 +0000
Received: by mail-io1-f52.google.com with SMTP id y19so19385930iov.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 15:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yAFqh/lDI2QEzpZGleo/NCpCzManWthLMflN8iWmGMA=;
 b=inT9UQh+qT9gwrScoEp/qa0i07HM6L5O2pDIkBQhSQjrR2RmT5M0iL3djd4i8aq5Xf
 OvcVBl5oefL1G+0C4fXzKbg3Jt1n+UxFw+q8Au8yeXUgGU4BdzduzFBrDAHeRcJYqZsd
 O7M/hX0AgGivjgiqwCeldXZFYdp8IYDpUqdWlBhF7bXpCOFA9yL11XHGMv9ccspjh6YZ
 7fLGv0RIcNsTpls6d+UvvNNxoIqhUs0CVCTaL0hQfTDj2oRcLAEOK6g+ixYhyuJxyYhe
 tbGJ5aCZSrcL3Lcw+s/Qbs5G6luhlm4Cu0xPPxbfHt4DpMWPC9Qh+7hnDcuKIXejE4Ed
 waMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yAFqh/lDI2QEzpZGleo/NCpCzManWthLMflN8iWmGMA=;
 b=WqLZ3A/lkKFmwf9j/Urm7vsL5RT47RaD17dyINe62eD5xKHNujyb2ATP/RZmUs8ugH
 q9IfQfvDM9oaWYmTQnbJInkdbKU5CUoSohQLlDkCm7nrvnJ8M7hALFs7ZhKiH0Sya8N/
 mRdX5nDzvMcIH7Nu+N/EJhPMopHdDSBlOcsQ5IrhVEzGPDtE6rmG2eNWkN8gNBJ3z7WS
 3p5sEkpgHwT2JH2S06Lfcg3K1PeczFbKv1h0Ps9RtCd69yyS35I9YXFQf/Tw15PGxBfo
 GzmB7ISYvKcha/Ovnbfun1cOo6qi4K5gFIV7tYcx28ZUZSLQ0wLSBfRTDTeDZjApM1TH
 rq6w==
X-Gm-Message-State: AOAM533LizbNx/lbGFwLR0IXeTypPnHQ/PNnDrClhWmIMBetGrrPYUVA
 tG8e+GWjncBjkw1v7MwSYl3XCOX7vkmhS6QpZg0=
X-Google-Smtp-Source: ABdhPJyWQPyIk4/BbtnFvVjja6hU1GYdXYaoVbloXOz7rMPXQLLx0vBZ/CVhDLeIRzONWeL9XK2G5yDCq2H1OIjXQxM=
X-Received: by 2002:a6b:fb0f:: with SMTP id h15mr14339795iog.27.1612222406071; 
 Mon, 01 Feb 2021 15:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210201000606.2206740-1-daeho43@gmail.com>
 <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
 <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
 <YBhga9OJPcRa7ntk@google.com>
In-Reply-To: <YBhga9OJPcRa7ntk@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 2 Feb 2021 08:33:13 +0900
Message-ID: <CACOAw_xW1NM4bXdzkFi7ee-OuZJ093Kz+-Zbk0huwAFHafXvbw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l6ihH-00035D-FS
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

VGhlIHJpZ2h0bW9zdCBvbmUgaXMgdGhlIGZpbmFsIG9wdGlvbi4gQW5kIGNoZWNrcG9pbnQ9bWVy
Z2UgbWVhbnMKY2hlY2twb2ludCBpcyBlbmFibGVkIHdpdGggYSBjaGVja3BvaW50IHRocmVhZC4K
Cm1vdW50IGNoZWNrcG9pbnQ9ZGlzYWJsZSxjaGVja3BvaW50PW1lcmdlID0+IGNoZWNrcG9pbnQ9
bWVyZ2UKcmVtb3VudCBjaGVja3BvaW50PWVuYWJsZSxjaGVja3BvaW50PW1lcmdlID0+IGNoZWNr
cG9pbnQ9bWVyZ2UKcmVtb3VudCBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9ZGlzYWJsZSA9
PiBjaGVja3BvaW50PWRpc2FibGUKcmVtb3VudCBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9
ZW5hYmxlID0+IGNoZWNrcG9pbnQ9ZW5hYmxlCgpMaWtlCgptb3VudCBmc3luY19tb2RlPXBvc2l4
LCBmc3luY19tb2RlPXN0cmljdCwgZnN5bmNfbW9kZT1ub2JhcnJpZXIgPT4KZnN5bmNfbW9kZT1u
b2JhcnJpZXIKCjIwMjHrhYQgMuyblCAy7J28ICjtmZQpIOyYpOyghCA1OjExLCBKYWVnZXVrIEtp
bSA8amFlZ2V1a0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAwMi8wMSwgRGFlaG8g
SmVvbmcgd3JvdGU6Cj4gPiBBY3R1YWxseSwgSSB0aGluayB3ZSBuZWVkIHRvIHNlbGVjdCBvbmUg
YW1vbmcgdGhlbSwgZGlzYWJsZSwgZW5hYmxlCj4gPiBhbmQgbWVyZ2UuIEkgcmVhbGl6ZWQgbXkg
cHJldmlvdXMgdW5kZXJzdGFuZGluZyBhYm91dCB0aGF0IHdhcyB3cm9uZy4KPiA+IEluIHRoYXQg
Y2FzZSBvZiAiY2hlY2twb2ludD1tZXJnZSxjaGVja3BvaW50PWVuYWJsZSIsIHRoZSBsYXN0IG9w
dGlvbgo+ID4gd2lsbCBvdmVycmlkZSB0aGUgb25lcyBiZWZvcmUgdGhhdC4KPiA+IFRoaXMgaXMg
aG93IHRoZSBvdGhlciBtb3VudCBvcHRpb25zIGxpa2UgZnN5bmNfbW9kZSwgd2hpbnRfbW9kZSBh
bmQgZXRjLgo+ID4gU28sIHRoZSBhbnN3ZXIgd2lsbCBiZSAiY2hlY2twb2ludD1lbmFibGUiLiBX
aGF0IGRvIHlvdSB0aGluaz8KPgo+IFdlIG5lZWQgdG8gY2xhcmlmeSBhIGJpdCBtb3JlLiA6KQo+
Cj4gbW91bnQgY2hlY2twb2ludD1kaXNhYmxlLGNoZWNrcG9pbnQ9bWVyZ2UKPiByZW1vdW50IGNo
ZWNrcG9pbnQ9ZW5hYmxlLGNoZWNrcG9pbnQ9bWVyZ2UKPgo+IFRoZW4sIGlzIGl0IGdvaW5nIHRv
IGVuYWJsZSBjaGVja3BvaW50IHdpdGggYSB0aHJlYWQ/Cj4KPiA+Cj4gPgo+ID4KPiA+IDIwMjHr
hYQgMuyblCAx7J28ICjsm5QpIOyYpO2bhCA5OjQwLCBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
64uY7J20IOyekeyEsToKPiA+ID4KPiA+ID4gT24gMjAyMS8yLzEgODowNiwgRGFlaG8gSmVvbmcg
d3JvdGU6Cj4gPiA+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4K
PiA+ID4gPgo+ID4gPiA+IEFzIGNoZWNrcG9pbnQ9bWVyZ2UgY29tZXMgaW4sIG1vdW50IG9wdGlv
biBzZXR0aW5nIHJlbGF0ZWQgdG8KPiA+ID4gPiBjaGVja3BvaW50IGhhZCBiZWVuIG1peGVkIHVw
LiBGaXhlZCBpdC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxk
YWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gICBmcy9mMmZzL3N1cGVy
LmMgfCAxMSArKysrKy0tLS0tLQo+ID4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gPiBpbmRleCA1NjY5NmY2Y2ZhODYuLjgy
MzFjODg4Yzc3MiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gPiAr
KysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gPiBAQCAtOTMwLDIwICs5MzAsMjUgQEAgc3RhdGlj
IGludCBwYXJzZV9vcHRpb25zKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGNoYXIgKm9wdGlvbnMs
IGJvb2wgaXNfcmVtb3VudCkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04o
c2JpKS51bnVzYWJsZV9jYXBfcGVyYyA9IGFyZzsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgc2V0X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGNsZWFyX29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiAgICAgICAgICAgICAgIGNhc2UgT3B0X2No
ZWNrcG9pbnRfZGlzYWJsZV9jYXA6Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChh
cmdzLT5mcm9tICYmIG1hdGNoX2ludChhcmdzLCAmYXJnKSkKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgRjJGU19PUFRJT04oc2JpKS51bnVzYWJsZV9jYXAgPSBhcmc7Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHNldF9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBNRVJHRV9DSEVDS1BPSU5UKTsK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gICAgICAgICAgICAg
ICBjYXNlIE9wdF9jaGVja3BvaW50X2Rpc2FibGU6Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgIHNldF9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBNRVJHRV9DSEVDS1BPSU5UKTsKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gICAgICAgICAgICAgICBjYXNlIE9wdF9j
aGVja3BvaW50X2VuYWJsZToKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfb3B0
KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
Y2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4gPiA+Cj4gPiA+IFdoYXQgaWY6IC1v
IGNoZWNrcG9pbnQ9bWVyZ2UsY2hlY2twb2ludD1lbmFibGUKPiA+ID4KPiA+ID4gQ2FuIHlvdSBw
bGVhc2UgZXhwbGFpbiB0aGUgcnVsZSBvZiBtZXJnZS9kaXNhYmxlL2VuYWJsZSBjb21iaW5hdGlv
biBhbmQgdGhlaXIKPiA+ID4gcmVzdWx0PyBlLmcuCj4gPiA+IGNoZWNrcG9pbnQ9bWVyZ2UsY2hl
Y2twb2ludD1lbmFibGUKPiA+ID4gY2hlY2twb2ludD1lbmFibGUsY2hlY2twb2ludD1tZXJnZQo+
ID4gPiBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9ZGlzYWJsZQo+ID4gPiBjaGVja3BvaW50
PWRpc2FibGUsY2hlY2twb2ludD1tZXJnZQo+ID4gPgo+ID4gPiBJZiB0aGUgcnVsZS9yZXN1bHQg
aXMgY2xlYXIsIGl0IHNob3VsZCBiZSBkb2N1bWVudGVkLgo+ID4gPgo+ID4gPiBUaGFua3MsCj4g
PiA+Cj4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ICAg
ICAgICAgICAgICAgY2FzZSBPcHRfY2hlY2twb2ludF9tZXJnZToKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgY2xlYXJfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKTsKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgc2V0X29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiAgICNpZmRlZiBDT05GSUdf
RjJGU19GU19DT01QUkVTU0lPTgo+ID4gPiA+IEBAIC0xMTQyLDEyICsxMTQ3LDYgQEAgc3RhdGlj
IGludCBwYXJzZV9vcHRpb25zKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGNoYXIgKm9wdGlvbnMs
IGJvb2wgaXNfcmVtb3VudCkKPiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4gPiA+ICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+IC0gICAgIGlmICh0ZXN0X29wdChzYmksIERJ
U0FCTEVfQ0hFQ0tQT0lOVCkgJiYKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgdGVzdF9v
cHQoc2JpLCBNRVJHRV9DSEVDS1BPSU5UKSkgewo+ID4gPiA+IC0gICAgICAgICAgICAgZjJmc19l
cnIoc2JpLCAiY2hlY2twb2ludD1tZXJnZSBjYW5ub3QgYmUgdXNlZCB3aXRoIGNoZWNrcG9pbnQ9
ZGlzYWJsZVxuIik7Cj4gPiA+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4g
PiAtICAgICB9Cj4gPiA+ID4gLQo+ID4gPiA+ICAgICAgIC8qIE5vdCBwYXNzIGRvd24gd3JpdGUg
aGludHMgaWYgdGhlIG51bWJlciBvZiBhY3RpdmUgbG9ncyBpcyBsZXNzZXIKPiA+ID4gPiAgICAg
ICAgKiB0aGFuIE5SX0NVUlNFR19QRVJTSVNUX1RZUEUuCj4gPiA+ID4gICAgICAgICovCj4gPiA+
ID4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
