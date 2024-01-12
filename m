Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BB82C71E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 23:20:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOPsk-0005k0-Ik;
	Fri, 12 Jan 2024 22:20:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rOPsi-0005ju-MX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 22:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6lFqZjkPZLgpWdQzQexGYvvvqn/GuOyoQcQUtJrcBd0=; b=BsQ6Kr9YyVGwwrN5G/jLOd45ID
 H2mzp+g9zNsACTOhabt6gXuYt5v0x7r8+xMTiqXJJ4AkjdZXP40QGU4gIc46/A+P3CfZABjfwcHfS
 2RF67X865/SqJpRzGjxc6VsqSmnU57bNy8cdeyBo/4x0XQH4Jk604qQU9udgHnl1TXsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6lFqZjkPZLgpWdQzQexGYvvvqn/GuOyoQcQUtJrcBd0=; b=MXwMOyv1caFuva3CFXZ3M2/ggf
 6SAgxkcqxW8StyPkkKhIbHNftFhUcHFq5p2kNgPAi4kGIJQ92BqlUI9i/p2Odi1QdBXG3SCq/XCRz
 mIZ3BP6Q4hG6Dy0GzsZWSxC6DdqBbucliHJ1yg9Xk2CKVvqxi51WQkJ0FrjuPACYictA=;
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOPsh-0008JW-5g for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 22:20:04 +0000
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-7cecc0a662dso330083241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 14:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705097998; x=1705702798; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lFqZjkPZLgpWdQzQexGYvvvqn/GuOyoQcQUtJrcBd0=;
 b=QueMiltRij7bkgsC+2Q52xOaRyAS5jhK6WPtagAVcsvZ31JTmAv9v3FEtam5C9eHUV
 HfVh20oJta4IXZkI4slDiGXbLpty0KqLQSim4tOppmQRYnc+2tuEvrbJTHThe2k04Bnp
 mi7X7dbwJinqLp9Kuf7ZZPdhkTnNueKXM7AWs68JlHSu9SoQCy0gLRNQ7n0iWmmmA96z
 A9NC1AdLJbCfdW5roIU+WMH6iDpHnBBHoPM6g0E9mN+CP689wNWDmQAASj/iCW0jSrEH
 3EXf9vBGCoewsd2uTEOBqK9hhonTAH5Ucu7r8dRrjse8FvyBaMsgGmBKQH2RoPvPSm1y
 rSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705097998; x=1705702798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lFqZjkPZLgpWdQzQexGYvvvqn/GuOyoQcQUtJrcBd0=;
 b=skN6A6WI8rwzg6VpzxFW3Ug7a6lUkdDNIO0bUV2OrJwkbRHeXYU+XBwnOTdYnjkIuc
 Y1RwE/ZNP/qjNjlFE2nt3PiIEM+pvvPewD041eYXs/vB6mZFywsvudJexC839lHaeYgi
 h21KsyB95SVKNZFO3t6QC8kab8WGC3AhJHriX3IEcAevAtNMriRJGc19TvWLPWJEydfk
 orjg5N4Z5KiLzKEmU23gCqz2N+nhANkBEKaAoLJrchXDprG1cgC3rPJZQDRulK5wQjU5
 cQC8dcAG7QAZpx0NQLfEKu2pqiUmMk/hTT61CX0AOGilL9RMzFE9dBS3o7TvdbaRRYX3
 7nkw==
X-Gm-Message-State: AOJu0Yx1E1QOZH+DnfiXDFlw5AAcmBy1of41otKUiwh7qTlB3FxluxYn
 GEJVKwgjA/BpK/eXc1DGEaUaANjPguJCTbbDm+NK8e2TzR4g0A==
X-Google-Smtp-Source: AGHT+IF92SkdZZTxt+ctl9b5km9Ne4xAZqZW7Ez9/O6g/iyL2onhoDLSjphK+u8uX4e99lZZXh2Tk/UtqExTS7i7Vm0=
X-Received: by 2002:a05:6102:3a6f:b0:468:7d:6e3c with SMTP id
 bf15-20020a0561023a6f00b00468007d6e3cmr2340436vsb.33.1705097997740; Fri, 12
 Jan 2024 14:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20240111064208.2969599-1-chao@kernel.org>
 <20240111064208.2969599-4-chao@kernel.org>
In-Reply-To: <20240111064208.2969599-4-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Jan 2024 14:19:44 -0800
Message-ID: <CACOAw_yzAWpHzHerTtm5vCkejt4Xiex5m_xKMTC_WHspOXFmRg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Wed, Jan 10, 2024 at 10:43 PM
    Chao Yu wrote: > > In reserve_compress_blocks(), we update blkaddrs of dnode
    in prior to > inc_valid_block_count(), it may cause inconsistent status bewteen
    > i_bl [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.53 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.53 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOPsh-0008JW-5g
Subject: Re: [f2fs-dev] [PATCH v4 4/6] f2fs: compress: fix to avoid
 inconsistence bewteen i_blocks and dnode
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBXZWQs
IEphbiAxMCwgMjAyNCBhdCAxMDo0M+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBJbiByZXNlcnZlX2NvbXByZXNzX2Jsb2NrcygpLCB3ZSB1cGRhdGUgYmxrYWRkcnMg
b2YgZG5vZGUgaW4gcHJpb3IgdG8KPiBpbmNfdmFsaWRfYmxvY2tfY291bnQoKSwgaXQgbWF5IGNh
dXNlIGluY29uc2lzdGVudCBzdGF0dXMgYmV3dGVlbgo+IGlfYmxvY2tzIGFuZCBibGthZGRycyBv
bmNlIGluY192YWxpZF9ibG9ja19jb3VudCgpIGZhaWxzLgo+Cj4gVG8gZml4IHRoaXMgaXNzdWUs
IGl0IG5lZWRzIHRvIHJldmVyc2UgdGhlaXIgaW52b2tpbmcgb3JkZXIuCj4KPiBGaXhlczogYzc1
NDg4ZmI0ZDgyICgiZjJmczogaW50cm9kdWNlIEYyRlNfSU9DX1JFU0VSVkVfQ09NUFJFU1NfQkxP
Q0tTIikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IGZzL2YyZnMvZGF0YS5jICAgIHwgIDUgKysrLS0KPiAgZnMvZjJmcy9mMmZzLmggICAgfCAgNyAr
KysrKystCj4gIGZzL2YyZnMvZmlsZS5jICAgIHwgMjYgKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KPiAgZnMvZjJmcy9zZWdtZW50LmMgfCAgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDI0IGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0
YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiBpbmRleCBiMTcxYTk5ODBmNmEuLjhkMmFjZTcyMzMxMCAx
MDA2NDQKPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gQEAg
LTEyMTksNyArMTIxOSw4IEBAIGludCBmMmZzX3Jlc2VydmVfbmV3X2Jsb2NrcyhzdHJ1Y3QgZG5v
ZGVfb2ZfZGF0YSAqZG4sIGJsa2NudF90IGNvdW50KQo+Cj4gICAgICAgICBpZiAodW5saWtlbHko
aXNfaW5vZGVfZmxhZ19zZXQoZG4tPmlub2RlLCBGSV9OT19BTExPQykpKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVQRVJNOwo+IC0gICAgICAgaWYgKHVubGlrZWx5KChlcnIgPSBpbmNfdmFs
aWRfYmxvY2tfY291bnQoc2JpLCBkbi0+aW5vZGUsICZjb3VudCkpKSkKPiArICAgICAgIGVyciA9
IGluY192YWxpZF9ibG9ja19jb3VudChzYmksIGRuLT5pbm9kZSwgJmNvdW50LCB0cnVlKTsKPiAr
ICAgICAgIGlmICh1bmxpa2VseShlcnIpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+
Cj4gICAgICAgICB0cmFjZV9mMmZzX3Jlc2VydmVfbmV3X2Jsb2Nrcyhkbi0+aW5vZGUsIGRuLT5u
aWQsCj4gQEAgLTE0NzYsNyArMTQ3Nyw3IEBAIHN0YXRpYyBpbnQgX19hbGxvY2F0ZV9kYXRhX2Js
b2NrKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IHNlZ190eXBlKQo+Cj4gICAgICAgICBk
bi0+ZGF0YV9ibGthZGRyID0gZjJmc19kYXRhX2Jsa2FkZHIoZG4pOwo+ICAgICAgICAgaWYgKGRu
LT5kYXRhX2Jsa2FkZHIgPT0gTlVMTF9BRERSKSB7Cj4gLSAgICAgICAgICAgICAgIGVyciA9IGlu
Y192YWxpZF9ibG9ja19jb3VudChzYmksIGRuLT5pbm9kZSwgJmNvdW50KTsKPiArICAgICAgICAg
ICAgICAgZXJyID0gaW5jX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgZG4tPmlub2RlLCAmY291bnQs
IHRydWUpOwo+ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZXJyKSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gaW5kZXggNTBmM2Q1NDZkZWQ4Li42OWU3MTQ2
MGE5NTAgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMu
aAo+IEBAIC0yMjUyLDcgKzIyNTIsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgX19hbGxvd19yZXNl
cnZlZF9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Cj4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBmMmZzX2lfYmxvY2tzX3dyaXRlKHN0cnVjdCBpbm9kZSAqLCBibG9ja190LCBib29sLCBi
b29sKTsKPiAgc3RhdGljIGlubGluZSBpbnQgaW5jX3ZhbGlkX2Jsb2NrX2NvdW50KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBibGtjbnRfdCAqY291bnQpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGlub2RlICppbm9kZSwgYmxrY250X3QgKmNvdW50LCBib29sIHBh
cnRpYWwpCj4gIHsKPiAgICAgICAgIGJsa2NudF90IGRpZmYgPSAwLCByZWxlYXNlID0gMDsKPiAg
ICAgICAgIGJsb2NrX3QgYXZhaWxfdXNlcl9ibG9ja19jb3VudDsKPiBAQCAtMjI5Miw2ICsyMjky
LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGluY192YWxpZF9ibG9ja19jb3VudChzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4gICAgICAgICAgICAgICAgICAgICAgICAgYXZhaWxfdXNlcl9ibG9j
a19jb3VudCA9IDA7Cj4gICAgICAgICB9Cj4gICAgICAgICBpZiAodW5saWtlbHkoc2JpLT50b3Rh
bF92YWxpZF9ibG9ja19jb3VudCA+IGF2YWlsX3VzZXJfYmxvY2tfY291bnQpKSB7Cj4gKyAgICAg
ICAgICAgICAgIGlmICghcGFydGlhbCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZzYmktPnN0YXRfbG9jayk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBl
bm9zcGM7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gICAgICAgICAgICAgICAgIGRpZmYgPSBz
YmktPnRvdGFsX3ZhbGlkX2Jsb2NrX2NvdW50IC0gYXZhaWxfdXNlcl9ibG9ja19jb3VudDsKPiAg
ICAgICAgICAgICAgICAgaWYgKGRpZmYgPiAqY291bnQpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgZGlmZiA9ICpjb3VudDsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYwo+IGluZGV4IDgwZDljNGMwOTZmMC4uNTNjNDk1NjUxNzg5IDEwMDY0NAo+IC0tLSBh
L2ZzL2YyZnMvZmlsZS5jCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtMzYxNCwxNCArMzYx
NCwxNiBAQCBzdGF0aWMgaW50IHJlc2VydmVfY29tcHJlc3NfYmxvY2tzKHN0cnVjdCBkbm9kZV9v
Zl9kYXRhICpkbiwgcGdvZmZfdCBjb3VudCkKPiAgICAgICAgICAgICAgICAgYmxrY250X3QgcmVz
ZXJ2ZWQ7Cj4gICAgICAgICAgICAgICAgIGludCByZXQ7Cj4KPiAtICAgICAgICAgICAgICAgZm9y
IChpID0gMDsgaSA8IGNsdXN0ZXJfc2l6ZTsgaSsrLCBkbi0+b2ZzX2luX25vZGUrKykgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgPSBmMmZzX2RhdGFfYmxrYWRkcihkbik7Cj4g
KyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjbHVzdGVyX3NpemU7IGkrKykgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgPSBkYXRhX2Jsa2FkZHIoZG4tPmlub2RlLCBk
bi0+bm9kZV9wYWdlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRuLT5vZnNfaW5fbm9kZSArIGkpOwo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGkgPT0gMCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGJsa2Fk
ZHIgPT0gQ09NUFJFU1NfQUREUikKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbi0+b2Zz
X2luX25vZGUgKz0gY2x1c3Rlcl9zaXplOwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBuZXh0Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGJsa2Fk
ZHIgIT0gQ09NUFJFU1NfQUREUikgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkbi0+b2ZzX2luX25vZGUgKz0gY2x1c3Rlcl9zaXplOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAvKgo+IEBAIC0zNjM0LDIwICszNjM2LDIwIEBAIHN0YXRpYyBpbnQgcmVzZXJ2ZV9jb21wcmVz
c19ibG9ja3Moc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBwZ29mZl90IGNvdW50KQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcHJfYmxvY2tzKys7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9
Cj4gLQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfc2V0X2RhdGFfYmxrYWRkcihkbiwg
TkVXX0FERFIpOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgcmVzZXJ2
ZWQgPSBjbHVzdGVyX3NpemUgLSBjb21wcl9ibG9ja3M7Cj4gICAgICAgICAgICAgICAgIGlmICgh
cmVzZXJ2ZWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Cj4gLSAgICAg
ICAgICAgICAgIHJldCA9IGluY192YWxpZF9ibG9ja19jb3VudChzYmksIGRuLT5pbm9kZSwgJnJl
c2VydmVkKTsKPiAtICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgcmV0
ID0gaW5jX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgZG4tPmlub2RlLCAmcmVzZXJ2ZWQsIGZhbHNl
KTsKPiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHJldCkpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPgo+IC0gICAgICAgICAgICAgICBpZiAocmVzZXJ2ZWQgIT0g
Y2x1c3Rlcl9zaXplIC0gY29tcHJfYmxvY2tzKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PU1BDOwo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgY2x1c3Rlcl9z
aXplOyBpKyssIGRuLT5vZnNfaW5fbm9kZSsrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGYyZnNfZGF0YV9ibGthZGRyKGRuKSA9PSBOVUxMX0FERFIpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmMmZzX3NldF9kYXRhX2Jsa2FkZHIoZG4sIE5FV19BRERSKTsKPiAr
ICAgICAgICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAgIGYyZnNfaV9jb21wcl9ibG9ja3Nf
dXBkYXRlKGRuLT5pbm9kZSwgY29tcHJfYmxvY2tzLCB0cnVlKTsKPgo+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gaW5kZXggNGM4ODM2ZGVkOTBm
Li5lZjViMzg0ODQyNmIgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuYwo+IEBAIC0yNDgsNyArMjQ4LDcgQEAgc3RhdGljIGludCBfX3JlcGxh
Y2VfYXRvbWljX3dyaXRlX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgaW5kZXgs
Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBibGtjbnRfdCBjb3VudCA9IDE7
Cj4KPiAtICAgICAgICAgICAgICAgZXJyID0gaW5jX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgaW5v
ZGUsICZjb3VudCk7Cj4gKyAgICAgICAgICAgICAgIGVyciA9IGluY192YWxpZF9ibG9ja19jb3Vu
dChzYmksIGlub2RlLCAmY291bnQsIHRydWUpOwo+ICAgICAgICAgICAgICAgICBpZiAoZXJyKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19wdXRfZG5vZGUoJmRuKTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+IC0tCj4gMi40MC4xCj4KPgo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
