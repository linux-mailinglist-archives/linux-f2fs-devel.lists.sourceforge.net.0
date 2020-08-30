Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0D25710B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 01:37:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCWsz-0008KU-MT; Sun, 30 Aug 2020 23:37:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kCWsv-0008Jz-Qf
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 23:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EL8TFBMW/hIieihPeTsDrz8LXdOaui0bvelva2VBqDc=; b=hU47OpUOLZ/hpulkclEWLfqSYy
 uYP7uHtPGac4jeT8Kit25VOAEu1P69xZgSE6WZUjp44+jWy5oNoQFaUrbEmqQca7B80HMMjb8GT64
 dFDjXaNcXsVAZassE49Ks06kZN8unr6cXHZ+gR6h2/zD5pna8R6jmuHWwXg0LR+iTbpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EL8TFBMW/hIieihPeTsDrz8LXdOaui0bvelva2VBqDc=; b=m5RknNK2WywaND67U6Nx1iRJTj
 RiXkWB0/r+C4NjeAdeHHaugrXBqTkkaVNoENU105WB/cyRi29vPrxwkm7EGgagtmw9Id8+YJXe9Vr
 zJrR+Q0jZs5MRtVqTaKV+3fVORt0uZCZLHMPMcVFf6Ppw1CmVwhyxHDrucq7Q+zpYxA4=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kCWsu-00AEmG-F1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 23:37:17 +0000
Received: by mail-lj1-f196.google.com with SMTP id h19so4603620ljg.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Aug 2020 16:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EL8TFBMW/hIieihPeTsDrz8LXdOaui0bvelva2VBqDc=;
 b=E9sGCz0JrQnaGVrW8I6SnshIT6NkhKRTsNmuQmoK3U1uJOY0azs76dnK5wuqZ+wac1
 QY3E1upqQ0Gv/UPI1txoDL65O1AOTPBojxhH2UuRg4PAkFpVgCyDq3QO46wu52gYyfib
 9Ez3QwvpWE9xiiMPoApCuZULj/zQ28sB3ubqRUIQUdle6izL5920MnXHRgItGocDawvO
 XgreeiqyyYf+pGSXhug6YuFJeGHJcs+jMMPTPGC9oCp+7wjoy3LONZTQvG1bB9Z1LGbx
 WbqptCXOok6oZ8G0+5MFUYjF92rE/tcaQA76THXqdaEdBtMF3XUKeAVBtOkR0UYSBzmx
 vPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EL8TFBMW/hIieihPeTsDrz8LXdOaui0bvelva2VBqDc=;
 b=LBBghwQaHtFmcBtThdQ6t8rGCeacc+ESdXwDlW0ObQQQOwx2DsDJSUIVo51hDDPc/E
 KmPyqSBwdA53TlrmLdEZAvkvgeYj2ml31f6Xs/G+uodcS8iVnzdUXRUHP8qdAhRFsQfe
 Wou+Mudpfr1cD8jzMTCxkAVVnDl/H7mIufobuvW0Bkpbncw+bXGsJPk9DDwNMQGWwt0K
 ev7xf4T34S9POIYBjjjWhKywzsmO40597+f+AI5cCuTCEbGeT4ABCX4gqR9rToY1/ZAf
 EO0IGdhw+lgy/PgaGGY9lENSYSzWbN8whVZXIdTqdZIkA4T3c18Be4dSJDtpI8iugOnZ
 VI1A==
X-Gm-Message-State: AOAM530r13ZoNQqwQs7VAzRD+sbsvC1GCaRQTJPiT3ptxF+ouY70qGfU
 3NJE5tFGrVBx6F/Wb97FfBosgfj/5X/g5I/pQwI=
X-Google-Smtp-Source: ABdhPJzBa92dvLVxRWdcrxeGBAcFXYc3vacOio4U5BDw0wv/USO0vHZlTx3TOXlcqVzfCL4SJKAEReJ3AOsgtrANQ1E=
X-Received: by 2002:a2e:2c17:: with SMTP id s23mr4259213ljs.265.1598830622417; 
 Sun, 30 Aug 2020 16:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200828034953.354267-1-daeho43@gmail.com>
 <44f8d9f3-9438-fdfe-bbc3-f5347a9aaa29@kernel.org>
In-Reply-To: <44f8d9f3-9438-fdfe-bbc3-f5347a9aaa29@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2020 08:36:51 +0900
Message-ID: <CACOAw_xnTh9mVO7b+inK_Gsk+g+88W7p5GmLhJV3XY8UHssLzw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kCWsu-00AEmG-F1
Subject: Re: [f2fs-dev] [PATCH] f2fs: make fibmap consistent with fiemap for
 compression chunk
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

SSBnb3QgaXQuIFRoYW5rc34gOikKCjIwMjDrhYQgOOyblCAzMOydvCAo7J28KSDsmKTsoIQgODo0
NCwgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLTgt
MjggMTE6NDksIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBDdXJyZW50bHkgZmlibWFwIHJldHVybnMgemVybyBh
ZGRyZXNzIGZvciBjb21wcmVzc2lvbiBjaHVuay4gQnV0IGl0Cj4gPiBpcyBub3QgY29uc2lzdGVu
dCB3aXRoIHRoZSBvdXRwdXQgb2YgZmllbWFwLCBzaW5jZSBmaWVtYXAgcmV0dXJucwo+ID4gcmVh
bCBweXNpY2FsIGJsb2NrIGFkZHJlc3MgcmVsYXRlZCB0byB0aGUgY29tcHJlc3Npb24gY2h1bmsu
IFRoZXJlZm9yZQo+ID4gSSBzdWdnZXN0IGZpYm1hcCByZXR1cm5zIHRoZSBzYW1lIG91dHB1dCB3
aXRoIGZpZW1hcC4KPgo+IFdlIGNhbiByZXR1cm4gcmVhbCBwaHlzaWNhbCBibG9jayBhZGRyZXNz
IGluIGZpZW1hcCwgYmVjYXVzZSB3ZSBoYXZlIHNldAo+IEZJRU1BUF9FWFRFTlRfRU5DT0RFRCBm
bGFnIGluIGV4dGVudC5mZV9mbGFncywgdGhlbiB1c2VyIGNhbiBiZSBub3RpY2VkIHRoYXQgaGUK
PiBjYW4gbm90IGp1c3QgcmVhZC93cml0ZSB0aGF0IGJsb2NrIGFkZHJlc3MgZm9yIGFjY2Vzcy91
cGRhdGUgaW4tdGhlcmUgZGF0YS4KPgo+IFF1b3RlZCBmcm9tIERvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvZmllbWFwLnJzdAo+ICIKPiBGSUVNQVBfRVhURU5UX0VOQ09ERUQKPiAgICBUaGlzIGV4
dGVudCBkb2VzIG5vdCBjb25zaXN0IG9mIHBsYWluIGZpbGVzeXN0ZW0gYmxvY2tzIGJ1dCBpcwo+
ICAgIGVuY29kZWQgKGUuZy4gZW5jcnlwdGVkIG9yIGNvbXByZXNzZWQpLiAgUmVhZGluZyB0aGUg
ZGF0YSBpbiB0aGlzCj4gICAgZXh0ZW50IHZpYSBJL08gdG8gdGhlIGJsb2NrIGRldmljZSB3aWxs
IGhhdmUgdW5kZWZpbmVkIHJlc3VsdHMuCj4gIgo+Cj4gSG93ZXZlciwgdGhlcmUgaXMgbm8gc3Vj
aCBmbGFnIGluIGZpYm1hcCBpbnRlcmZhY2UsIHNvIEkganVzdCByZXR1cm4gYmxvY2sKPiBhZGRy
ZXNzIGZvciB0aG9zZSBsb2dpY2FsIHBhZ2VzIGluIG5vbi1jb21wcmVzc2VkIGNsdXN0ZXIuCj4K
PiBUaGFua3MsCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9kYXRhLmMgfCAzMyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzMgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMK
PiA+IGluZGV4IGMxYjY3NmJlNjdiOS4uOGMyNmM1ZDBjNzc4IDEwMDY0NAo+ID4gLS0tIGEvZnMv
ZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBAQCAtMzcwOCwzNiArMzcw
OCw2IEBAIHN0YXRpYyBpbnQgZjJmc19zZXRfZGF0YV9wYWdlX2RpcnR5KHN0cnVjdCBwYWdlICpw
YWdlKQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC0KPiA+IC1zdGF0aWMgc2Vj
dG9yX3QgZjJmc19ibWFwX2NvbXByZXNzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHNlY3Rvcl90IGJs
b2NrKQo+ID4gLXsKPiA+IC0jaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04KPiA+IC0g
ICAgIHN0cnVjdCBkbm9kZV9vZl9kYXRhIGRuOwo+ID4gLSAgICAgc2VjdG9yX3Qgc3RhcnRfaWR4
LCBibGtuciA9IDA7Cj4gPiAtICAgICBpbnQgcmV0Owo+ID4gLQo+ID4gLSAgICAgc3RhcnRfaWR4
ID0gcm91bmRfZG93bihibG9jaywgRjJGU19JKGlub2RlKS0+aV9jbHVzdGVyX3NpemUpOwo+ID4g
LQo+ID4gLSAgICAgc2V0X25ld19kbm9kZSgmZG4sIGlub2RlLCBOVUxMLCBOVUxMLCAwKTsKPiA+
IC0gICAgIHJldCA9IGYyZnNfZ2V0X2Rub2RlX29mX2RhdGEoJmRuLCBzdGFydF9pZHgsIExPT0tV
UF9OT0RFKTsKPiA+IC0gICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgIHJldHVybiAwOwo+
ID4gLQo+ID4gLSAgICAgaWYgKGRuLmRhdGFfYmxrYWRkciAhPSBDT01QUkVTU19BRERSKSB7Cj4g
PiAtICAgICAgICAgICAgIGRuLm9mc19pbl9ub2RlICs9IGJsb2NrIC0gc3RhcnRfaWR4Owo+ID4g
LSAgICAgICAgICAgICBibGtuciA9IGYyZnNfZGF0YV9ibGthZGRyKCZkbik7Cj4gPiAtICAgICAg
ICAgICAgIGlmICghX19pc192YWxpZF9kYXRhX2Jsa2FkZHIoYmxrbnIpKQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIGJsa25yID0gMDsKPiA+IC0gICAgIH0KPiA+IC0KPiA+IC0gICAgIGYyZnNf
cHV0X2Rub2RlKCZkbik7Cj4gPiAtICAgICByZXR1cm4gYmxrbnI7Cj4gPiAtI2Vsc2UKPiA+IC0g
ICAgIHJldHVybiAwOwo+ID4gLSNlbmRpZgo+ID4gLX0KPiA+IC0KPiA+IC0KPiA+ICBzdGF0aWMg
c2VjdG9yX3QgZjJmc19ibWFwKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzZWN0b3Jf
dCBibG9jaykKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gbWFwcGluZy0+
aG9zdDsKPiA+IEBAIC0zNzUzLDkgKzM3MjMsNiBAQCBzdGF0aWMgc2VjdG9yX3QgZjJmc19ibWFw
KHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzZWN0b3JfdCBibG9jaykKPiA+ICAgICAg
IGlmIChtYXBwaW5nX3RhZ2dlZChtYXBwaW5nLCBQQUdFQ0FDSEVfVEFHX0RJUlRZKSkKPiA+ICAg
ICAgICAgICAgICAgZmlsZW1hcF93cml0ZV9hbmRfd2FpdChtYXBwaW5nKTsKPiA+Cj4gPiAtICAg
ICBpZiAoZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKQo+ID4gLSAgICAgICAgICAgICBibGtu
ciA9IGYyZnNfYm1hcF9jb21wcmVzcyhpbm9kZSwgYmxvY2spOwo+ID4gLQo+ID4gICAgICAgaWYg
KCFnZXRfZGF0YV9ibG9ja19ibWFwKGlub2RlLCBibG9jaywgJnRtcCwgMCkpCj4gPiAgICAgICAg
ICAgICAgIGJsa25yID0gdG1wLmJfYmxvY2tucjsKPiA+ICBvdXQ6Cj4gPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
