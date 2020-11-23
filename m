Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B3B2C1917
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 00:03:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khKrK-0003jw-F5; Mon, 23 Nov 2020 23:02:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1khKrC-0003jO-Up
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 23:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g091FaNOSxFZQQwxRMAWnvSLOv1Y43ybwdCbChtVCSY=; b=IDZUFPtT40kk9bbJm+7ELW7OAp
 FyvWHxlOaKCK/x2er5QDHFcE473pCzznJyiOaiEByvqfSvgt65mvURXwJwRWIChhUq7+8WPv4/gIM
 gyj246zFf1SzJjPVmGejUwAF9u3gB2mNxTJVQHtLbj/nSuGdNN/gThCsAn/YceC3sv2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g091FaNOSxFZQQwxRMAWnvSLOv1Y43ybwdCbChtVCSY=; b=Tm+V+FF7ldKNZfU7nPLZgUCaL8
 KQ0GqNcLafFRFOuxg2UV+xj0o2m4BEktTd9GWYxS81cEThSGDbYsPtDTe6diA+l5Ww96BGL/377wr
 cGEn9uqLZJbDG0L7tB3dROBj5LjfMW4CR4FyaBDNa9zq1NZIRYB+6PzUOA9UesCaRJ1Y=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1khKr8-001DMI-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 23:02:50 +0000
Received: by mail-il1-f193.google.com with SMTP id x15so1826290ilq.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Nov 2020 15:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g091FaNOSxFZQQwxRMAWnvSLOv1Y43ybwdCbChtVCSY=;
 b=VhphtZiPS5uIM9CyBYpJSbis1m2ju9qFsNxb3qnv/tJmrRTG+3+TRLTvzPqLwVPM10
 vIVy6Ubku+D0DejQz/Yya6Pi/7qdAFA4hzWdaIeecZBVhJUleWqH32sLgHA/cCASjz1v
 GfDWEURP7+fQhxI8X7tS3+hgtIRJkFUs/Xiz7fSidGQPrh+jH3CDJORF99CpBFW8vtj5
 YLJn/b49i4EixON5wt79Oke10yjhv+GUuidKh6H1dFe99mZGydzHIthwseWPh1Cki0Ay
 EwGN9k3KbXaMr+61Jw7oUP/FBwoqi3Ru88qsVrtLlfFzAPnsFIlQzio7KfAT+VPZrM/e
 aPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g091FaNOSxFZQQwxRMAWnvSLOv1Y43ybwdCbChtVCSY=;
 b=h7asC8pjw5h/h8D66s/8PuAYIhsZJvz72uQmGh8E9dUA4dEdESPHOFW4xnOHXmfFt7
 2rzIWeIAwCEbW8saGMR8gYOB271r0sxbnDOcAr5Bd1D4QvjevYvBbk4YZF353GGwgZwo
 wmhhb0Ir7JxU8+FKRAHS1xb9mTqb0RRvBuT1X09b36wW8fQHbwzid5FSyCLOonlpUQMD
 17EfMeDcqwW9jP7LrSdwb6//vU0LJooEeDVn8hYLeFwSVPJKy/+2KGTe9O82YCzmvnuV
 jLw4Uz+VjQIl2fmDyrPAnVbKBnxaUE4MNB1ESmnRBJ3yo3GBZy10VgbVkK1iAp3ADpCr
 pluQ==
X-Gm-Message-State: AOAM532Dp5/ETTcZ64LD6Wjr3g+oW5RrcXwxlhE1VnWh8hKeO2JlPBHP
 hP2kWDNibCcdruN1xvjFN5aFcXUhFF59BLofeS0=
X-Google-Smtp-Source: ABdhPJw0Vs1IksMBSb6srHXJX02eeoKM3MjgEMh0HLC1Rh5LHjrZpnYzpNxAUvf3Ey26edb2ngKCtMY/2X2rXrtnMOM=
X-Received: by 2002:a92:c941:: with SMTP id i1mr1820033ilq.158.1606172553905; 
 Mon, 23 Nov 2020 15:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123031751.36811-2-daeho43@gmail.com>
 <20201123184821.GB3694916@gmail.com>
In-Reply-To: <20201123184821.GB3694916@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 24 Nov 2020 08:02:21 +0900
Message-ID: <CACOAw_xEe=3H60njSfwJSToFnVbOHabUd2Nt=uZJLvCfxFgM4Q@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1khKr8-001DMI-Rt
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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

SmFlZ2V1aywKCk15IG1pc3Rha2V+CgpFcmljLAoKV2hhdCBJIHdhbnQgaXMgbGlrZSBkb19wYWdl
X2NhY2hlX3JhKCksIGJ1dCBJIHVzZWQKcGFnZV9jYWNoZV9yYV91bmJvdW5kZWQoKSBkaXJlY3Rs
eSwgYmVjYXVzZSB3ZSBhbHJlYWR5IGNoZWNrZWQgdGhhdApyZWFkIGlzIHdpdGhpbiBpX3NpemUu
Ck9yIHdlIGNvdWxkIHVzZSBkb19wYWdlX2NhY2hlX3JhKCksIGJ1dCBpdCBtaWdodCBkbyB0aGUg
c2FtZSBjaGVjayBpbiBpdCBhZ2Fpbi4KV2hhdCBkbyB5b3UgdGhpbms/CgpJIGNvdWxkIGFkZCBz
b21lIGRlc2NyaXB0aW9uIGFib3V0IHRoZXNlIGluCkRvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMv
ZjJmcy5yc3QgYW5kIEkgaW1wbGVtZW50ZWQgdGVzdHMgaW50ZXJuYWxseS4KCjIwMjDrhYQgMTHs
m5QgMjTsnbwgKO2ZlCkg7Jik7KCEIDM6NDgsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVs
Lm9yZz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgMTI6MTc6NTFQ
TSArMDkwMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEFkZGVkIHR3byBpb2N0bCB0byBkZWNvbXByZXNzL2Nv
bXByZXNzIGV4cGxpY2l0bHkgdGhlIGNvbXByZXNzaW9uCj4gPiBlbmFibGVkIGZpbGUgaW4gImNv
bXByZXNzX21vZGU9dXNlci1iYXNlZCIgbW91bnQgb3B0aW9uLgo+ID4KPiA+IFVzaW5nIHRoZXNl
IHR3byBpb2N0bHMsIHRoZSB1c2VycyBjYW4gbWFrZSBhIGNvbnRyb2wgb2YgY29tcHJlc3Npb24K
PiA+IGFuZCBkZWNvbXByZXNzaW9uIG9mIHRoZWlyIGZpbGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBmcy9m
MmZzL2ZpbGUuYyAgICAgICAgICAgIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L2YyZnMuaCB8ICAgMiArCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxODIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBpbmRleCBiZThk
YjA2YWNhMjcuLmU4ZjE0MjQ3MGU4NyAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4g
PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTQwMjYsNiArNDAyNiwxODAgQEAgc3RhdGlj
IGludCBmMmZzX2lvY19zZXRfY29tcHJlc3Nfb3B0aW9uKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNp
Z25lZCBsb25nIGFyZykKPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0
aWMgaW50IHJlZGlydHlfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgcGFnZV9p
ZHgsIGludCBsZW4pCj4gPiArewo+ID4gKyAgICAgREVGSU5FX1JFQURBSEVBRChyYWN0bCwgTlVM
TCwgaW5vZGUtPmlfbWFwcGluZywgcGFnZV9pZHgpOwo+ID4gKyAgICAgc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiA+ICsgICAgIHN0cnVjdCBhZGRyZXNzX3Nw
YWNlICptYXBwaW5nID0gaW5vZGUtPmlfbWFwcGluZzsKPiA+ICsgICAgIHN0cnVjdCBwYWdlICpw
YWdlOwo+ID4gKyAgICAgcGdvZmZfdCByZWRpcnR5X2lkeCA9IHBhZ2VfaWR4Owo+ID4gKyAgICAg
aW50IGksIHBhZ2VfbGVuID0gMCwgcmV0ID0gMDsKPiA+ICsKPiA+ICsgICAgIHBhZ2VfY2FjaGVf
cmFfdW5ib3VuZGVkKCZyYWN0bCwgbGVuLCAwKTsKPgo+IFVzaW5nIHBhZ2VfY2FjaGVfcmFfdW5i
b3VuZGVkKCkgaGVyZSBsb29rcyB3cm9uZy4gIFNlZSB0aGUgY29tbWVudCBhYm92ZQo+IHBhZ2Vf
Y2FjaGVfcmFfdW5ib3VuZGVkKCkuCj4KPiA+ICBzdGF0aWMgbG9uZyBfX2YyZnNfaW9jdGwoc3Ry
dWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4g
IHsKPiA+ICAgICAgIHN3aXRjaCAoY21kKSB7Cj4gPiBAQCAtNDExMyw2ICs0Mjg3LDEwIEBAIHN0
YXRpYyBsb25nIF9fZjJmc19pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNt
ZCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBmMmZzX2lvY19n
ZXRfY29tcHJlc3Nfb3B0aW9uKGZpbHAsIGFyZyk7Cj4gPiAgICAgICBjYXNlIEYyRlNfSU9DX1NF
VF9DT01QUkVTU19PUFRJT046Cj4gPiAgICAgICAgICAgICAgIHJldHVybiBmMmZzX2lvY19zZXRf
Y29tcHJlc3Nfb3B0aW9uKGZpbHAsIGFyZyk7Cj4gPiArICAgICBjYXNlIEYyRlNfSU9DX0RFQ09N
UFJFU1NfRklMRToKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGYyZnNfaW9jX2RlY29tcHJlc3Nf
ZmlsZShmaWxwLCBhcmcpOwo+ID4gKyAgICAgY2FzZSBGMkZTX0lPQ19DT01QUkVTU19GSUxFOgo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gZjJmc19pb2NfY29tcHJlc3NfZmlsZShmaWxwLCBhcmcp
Owo+ID4gICAgICAgZGVmYXVsdDoKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9UVFk7Cj4g
PiAgICAgICB9Cj4KPiBXaGVyZSBpcyB0aGUgZG9jdW1lbnRhdGlvbiBhbmQgdGVzdHMgZm9yIHRo
ZXNlIG5ldyBpb2N0bHM/Cj4KPiAtIEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
