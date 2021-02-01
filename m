Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC330A85C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 14:11:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6Yzb-0005k5-Lz; Mon, 01 Feb 2021 13:11:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6Yza-0005jq-Gl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 13:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZBg5DGHXau4A2AR5uVxrHKMoYL9lpKJv6v+HASZfsoI=; b=UPp50rIdXwXkNkpMapn/7c/p26
 fb59uqwggsp1f74VwIcnujivAR1yDEjdvupTMMG8KFM19PolSdYGseOCOl3HzqW8PnayffgUy5tXB
 tofl385oZQ0LJGJbGDvwfyMo0+VVXEs5pxWZXff/Z4G6pZIQyHegremG5VJCWm1FnL6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZBg5DGHXau4A2AR5uVxrHKMoYL9lpKJv6v+HASZfsoI=; b=dDBnRmGpzew46wzbDtQc9uDeUO
 /w5c5VYp3twFCFfFoR9qiRWgFmLf68WgGhw7HVAn72TePWIFh5Lwi9pOCv5MzvisLGM7X4SWDYDiV
 sk5yGFuEh4xA84E/O+dA8ugmPx4omUgM6i/sM13C19LLkWr5sasIS9jyFLWpuzu5kf44=;
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6YzQ-0006ou-F3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 13:11:46 +0000
Received: by mail-lj1-f173.google.com with SMTP id f19so19496003ljn.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZBg5DGHXau4A2AR5uVxrHKMoYL9lpKJv6v+HASZfsoI=;
 b=dgVqUWYOmnLGptFmKmn3LgQnDrYUa2N/HlrTFBWCjoXAljYn3K9EeixcbTOFGc+6oj
 XuGGE/YFDzOpyW0q3ooJIRlQPz8MMumDSOjwvNCC4FuZRUudyQUJiiaYBarz1o/Lcs7y
 3x+StsdVrKB36dgoR4BKqr2THokj8Sj2/HSZ4d5rhtr83clGPj3puoe7E5zhIR1I9TuW
 eSa0VtMB9DAf3WOQnvJAe7pTdfeuW/FZxM3w/0IvuRFSRiYntxFdThcsCr1JT0Wt/zWF
 118LeJGhUtlBDYqeyyYoXLV/QkfhJopEXpBd9hQ1D8AqiLnkbd5fp4XkXqxPFa8aWxBV
 qT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZBg5DGHXau4A2AR5uVxrHKMoYL9lpKJv6v+HASZfsoI=;
 b=qRpvWZgVSrfSBG9BkqR/cqmVQCDPax+CpksZx8492KxAi81i5RcEm+hF1hn+6nX4Ya
 fuuHz7o/eyYAGopTTeAuO8+JDERlBm6qNWO9yIHpAaADCHQVcxe8og4VIng/Qo8lIaLq
 GZex19TmHktS1yVhbnMgICWbK0A6zeDSDBmC3RLUEaDfE5D8kR9Y5eKFfYKA0r8y1akE
 rYrn+I7oKlTzhwTdgZR/qBbe4PkNYqjqsZw1up7yatqe4y39my1Qg4aUPOmVvdxvc73h
 xyFNz0+PBjZFEiP8HeNNjzKNm5dOrvv8xhZIE0bv6x5Sie4iBuxaBNTs0Oq3JPnrtbOl
 Wcww==
X-Gm-Message-State: AOAM531uiPSSyPegF+5zXBdiQqN9FgBmj5HnY74HAOmBjf9x+EFVTYte
 g/elthsbrUxr+gpW6SJG2ioCmFOM1jXQcHxofYA=
X-Google-Smtp-Source: ABdhPJz6gAYFrEmDqDihjtfxmFigHRqoAecV4tJ0gMa4onzo4iLumtU/Yt6+A9HfVbvrv9fSJlWpwhgLgvhunptG3+c=
X-Received: by 2002:a2e:a366:: with SMTP id i6mr10208319ljn.21.1612185090071; 
 Mon, 01 Feb 2021 05:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20210201000606.2206740-1-daeho43@gmail.com>
 <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
In-Reply-To: <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 1 Feb 2021 22:11:18 +0900
Message-ID: <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.173 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l6YzQ-0006ou-F3
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QWN0dWFsbHksIEkgdGhpbmsgd2UgbmVlZCB0byBzZWxlY3Qgb25lIGFtb25nIHRoZW0sIGRpc2Fi
bGUsIGVuYWJsZQphbmQgbWVyZ2UuIEkgcmVhbGl6ZWQgbXkgcHJldmlvdXMgdW5kZXJzdGFuZGlu
ZyBhYm91dCB0aGF0IHdhcyB3cm9uZy4KSW4gdGhhdCBjYXNlIG9mICJjaGVja3BvaW50PW1lcmdl
LGNoZWNrcG9pbnQ9ZW5hYmxlIiwgdGhlIGxhc3Qgb3B0aW9uCndpbGwgb3ZlcnJpZGUgdGhlIG9u
ZXMgYmVmb3JlIHRoYXQuClRoaXMgaXMgaG93IHRoZSBvdGhlciBtb3VudCBvcHRpb25zIGxpa2Ug
ZnN5bmNfbW9kZSwgd2hpbnRfbW9kZSBhbmQgZXRjLgpTbywgdGhlIGFuc3dlciB3aWxsIGJlICJj
aGVja3BvaW50PWVuYWJsZSIuIFdoYXQgZG8geW91IHRoaW5rPwoKCgoyMDIx64WEIDLsm5QgMeyd
vCAo7JuUKSDsmKTtm4QgOTo0MCwgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPuuLmOydtCDsnpHs
hLE6Cj4KPiBPbiAyMDIxLzIvMSA4OjA2LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZyb206IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gQXMgY2hlY2twb2ludD1t
ZXJnZSBjb21lcyBpbiwgbW91bnQgb3B0aW9uIHNldHRpbmcgcmVsYXRlZCB0bwo+ID4gY2hlY2tw
b2ludCBoYWQgYmVlbiBtaXhlZCB1cC4gRml4ZWQgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZz
L3N1cGVyLmMgfCAxMSArKysrKy0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVy
LmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+IGluZGV4IDU2Njk2ZjZjZmE4Ni4uODIzMWM4ODhjNzcy
IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gPiArKysgYi9mcy9mMmZzL3N1cGVy
LmMKPiA+IEBAIC05MzAsMjAgKzkzMCwyNSBAQCBzdGF0aWMgaW50IHBhcnNlX29wdGlvbnMoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYiwgY2hhciAqb3B0aW9ucywgYm9vbCBpc19yZW1vdW50KQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS51bnVzYWJsZV9jYXBfcGVyYyA9IGFyZzsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICBzZXRfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5U
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBNRVJHRV9DSEVDS1BP
SU5UKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAg
Y2FzZSBPcHRfY2hlY2twb2ludF9kaXNhYmxlX2NhcDoKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoYXJncy0+ZnJvbSAmJiBtYXRjaF9pbnQoYXJncywgJmFyZykpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBGMkZTX09QVElPTihzYmkpLnVudXNhYmxlX2NhcCA9IGFyZzsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBzZXRfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBNRVJHRV9DSEVDS1BPSU5UKTsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAgICAgY2FzZSBPcHRfY2hlY2tw
b2ludF9kaXNhYmxlOgo+ID4gICAgICAgICAgICAgICAgICAgICAgIHNldF9vcHQoc2JpLCBESVNB
QkxFX0NIRUNLUE9JTlQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNsZWFyX29wdChzYmks
IE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4g
ICAgICAgICAgICAgICBjYXNlIE9wdF9jaGVja3BvaW50X2VuYWJsZToKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGNsZWFyX29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+Cj4gV2hh
dCBpZjogLW8gY2hlY2twb2ludD1tZXJnZSxjaGVja3BvaW50PWVuYWJsZQo+Cj4gQ2FuIHlvdSBw
bGVhc2UgZXhwbGFpbiB0aGUgcnVsZSBvZiBtZXJnZS9kaXNhYmxlL2VuYWJsZSBjb21iaW5hdGlv
biBhbmQgdGhlaXIKPiByZXN1bHQ/IGUuZy4KPiBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9
ZW5hYmxlCj4gY2hlY2twb2ludD1lbmFibGUsY2hlY2twb2ludD1tZXJnZQo+IGNoZWNrcG9pbnQ9
bWVyZ2UsY2hlY2twb2ludD1kaXNhYmxlCj4gY2hlY2twb2ludD1kaXNhYmxlLGNoZWNrcG9pbnQ9
bWVyZ2UKPgo+IElmIHRoZSBydWxlL3Jlc3VsdCBpcyBjbGVhciwgaXQgc2hvdWxkIGJlIGRvY3Vt
ZW50ZWQuCj4KPiBUaGFua3MsCj4KPgo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ID4gICAgICAgICAgICAgICBjYXNlIE9wdF9jaGVja3BvaW50X21lcmdlOgo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGNsZWFyX29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgc2V0X29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAjaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09N
UFJFU1NJT04KPiA+IEBAIC0xMTQyLDEyICsxMTQ3LDYgQEAgc3RhdGljIGludCBwYXJzZV9vcHRp
b25zKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGNoYXIgKm9wdGlvbnMsIGJvb2wgaXNfcmVtb3Vu
dCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAgICAgICB9Cj4gPgo+ID4g
LSAgICAgaWYgKHRlc3Rfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKSAmJgo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPiA+IC0g
ICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiY2hlY2twb2ludD1tZXJnZSBjYW5ub3QgYmUgdXNl
ZCB3aXRoIGNoZWNrcG9pbnQ9ZGlzYWJsZVxuIik7Cj4gPiAtICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ID4gLSAgICAgfQo+ID4gLQo+ID4gICAgICAgLyogTm90IHBhc3MgZG93biB3cml0
ZSBoaW50cyBpZiB0aGUgbnVtYmVyIG9mIGFjdGl2ZSBsb2dzIGlzIGxlc3Nlcgo+ID4gICAgICAg
ICogdGhhbiBOUl9DVVJTRUdfUEVSU0lTVF9UWVBFLgo+ID4gICAgICAgICovCj4gPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
