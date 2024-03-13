Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B987AAA1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 16:46:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkQoT-00049i-5o;
	Wed, 13 Mar 2024 15:46:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rkQoQ-00049Z-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 15:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+WwWvBD5JICifAC4LRXMA04LWk4FKdSKpZw2yIN4sdE=; b=UcmCNR5KwL57EXXUhDmFKHeDTn
 /oFzVcCBQJvGxn2OXu2wAVXX8+c/siqkiTCM97s3InoO8x6kD3BPcz/QU40UAXEDv8/zAS11bwA8G
 0J/uzxk67VelS9OGlszhlVbESxdCr7HsO7+fkuzmKGKH0jTqSFzwWL27FJuGYTsw8u54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+WwWvBD5JICifAC4LRXMA04LWk4FKdSKpZw2yIN4sdE=; b=KCieNu01B+a7tUXsaPcMv0XAIj
 R5K78a7qU6XIs7cuXnpHqAs9ktsjmiA5GpLCqwFUXIIiZSBE/tJiVPbzlfcOVX4r0IJYWXVARuWid
 oR2C3n28CiBpt3ou21pyBNW0+MDS0Yp1ojhsUFQbDlEgKlbWjT8c7QygKQZBi4aOAZeI=;
Received: from mail-vs1-f54.google.com ([209.85.217.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkQoG-00042O-GR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 15:46:38 +0000
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-47268928105so1860516137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710344784; x=1710949584; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WwWvBD5JICifAC4LRXMA04LWk4FKdSKpZw2yIN4sdE=;
 b=Mn2cc/6U+BdIqzBukDWB2JUu3LO1WuRdWZGx+EP7YB+XHQ5rGL7On5L9hVkOYx5mWQ
 TIoj/EVaBTfF3Ej27CmATYT1BAkyTAt812bGmVqAchE8ERIxIjRcXJVtWjjW7T/Ha9Ij
 G6hVRzZ2Zn/+zRW1uy98tkksNm3A4o72AHhOFWAtxGGF3Yatom8EUfHdoNTORo/1Rdx2
 vswyhbry3M92N25O/qKVavgKsdrScPivNwl/0ar9yBByYtKFFqJoiJSAVVwF9y9q3Zqe
 sbKSLrFuJfnTwLao7oIlYpd+IcwVt2k88UIDbNQ5DDsMr0Fk+obEqCHoIRZ8iOS+dy+C
 yZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710344784; x=1710949584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+WwWvBD5JICifAC4LRXMA04LWk4FKdSKpZw2yIN4sdE=;
 b=dimIMO0p2zg/HQ/ha6b8pfcI22fK4bnyjPlXnNZKD0+2Uh3ILn0UDMvhhqI8uKPpjU
 n37oRpUVXBcPo2S1zO1qxQe3P/TrDeeX+fhMxsiDRaO42cY7KgzrCkgslgCISWF7LRnU
 GdS6lWFBK8h1q1X+JFKjDAvgYQhDHUT/RrXI7LV/GHUH0X4/BLre2RcLkL/c6ipfOH36
 nT1K6d65kvM5knLrtCgRg1NSf/3GkgYApOIjhNvbw40EqhTnx/wCoZ49nK8hw/k3TD5n
 /tNGBbsipatYsxwHDYI3xHQnCrdeWG1mDx2D2rbTHqxcY8UKQm7OXeT7uzFygky4xG4L
 1s0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAa0FChMdLj5gIM97obI/c/wIXGrNeJ0E1CEkYHMhMJ20nYKa33P5oAqqpNvbV/ONjG5njjn6kizxhkH5Ki/g58Pt3fTDtY0JlBlMXyyi2BDBCzVr6Vw==
X-Gm-Message-State: AOJu0YxSXsooeG85HtetKI4ZHxzkunhSoE0sxkeuBT0zE76XZi0znBqS
 kfbHLf3Z6aVqq5yPHs6BBPhT5bTr06aqUAwd61zUAoT21/1KwmkFJ5qYQSx4NydzgYYH6gwySKs
 FsnaQA1qM2/MVgugxLy1hb8Ho6M0=
X-Google-Smtp-Source: AGHT+IFGHRcrxRbJ7IkrOHJ9dEOBwd36JeW/1VRvpXj3t1+JiaWxKzxiSsLNwmCzWmgYo/CJd3XJFKFJb2MzqgPNSmE=
X-Received: by 2002:a05:6102:227a:b0:472:e8a6:ad0 with SMTP id
 v26-20020a056102227a00b00472e8a60ad0mr251000vsd.18.1710344783671; Wed, 13 Mar
 2024 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240313112706epcas1p2ee50d07f603422b0193f0b71bf1a75e6@epcas1p2.samsung.com>
 <20240313112620.1061463-1-s_min.jeong@samsung.com>
 <20240313112620.1061463-2-s_min.jeong@samsung.com>
In-Reply-To: <20240313112620.1061463-2-s_min.jeong@samsung.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 13 Mar 2024 08:46:12 -0700
Message-ID: <CACOAw_wvVbJD0cCHXsToQmda7oHm5dLG89e_PeWU4_Hy5ivKCw@mail.gmail.com>
To: Sunmin Jeong <s_min.jeong@samsung.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Wed, Mar 13, 2024 at 4:29 AM
    Sunmin Jeong wrote: > > In f2fs_do_write_data_page, FI_ATOMIC_FILE flag selects
    the target inode > between the original inode and COW inode. When aborting
    atomic wr [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkQoG-00042O-GR
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: truncate page cache before
 clearing flags when aborting atomic write
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBXZWQs
IE1hciAxMywgMjAyNCBhdCA0OjI54oCvQU0gU3VubWluIEplb25nIDxzX21pbi5qZW9uZ0BzYW1z
dW5nLmNvbT4gd3JvdGU6Cj4KPiBJbiBmMmZzX2RvX3dyaXRlX2RhdGFfcGFnZSwgRklfQVRPTUlD
X0ZJTEUgZmxhZyBzZWxlY3RzIHRoZSB0YXJnZXQgaW5vZGUKPiBiZXR3ZWVuIHRoZSBvcmlnaW5h
bCBpbm9kZSBhbmQgQ09XIGlub2RlLiBXaGVuIGFib3J0aW5nIGF0b21pYyB3cml0ZSBhbmQKPiB3
cml0ZWJhY2sgb2NjdXIgc2ltdWx0YW5lb3VzbHksIGludmFsaWQgZGF0YSBjYW4gYmUgd3JpdHRl
biB0byBvcmlnaW5hbAo+IGlub2RlIGlmIHRoZSBGSV9BVE9NSUNfRklMRSBmbGFnIGlzIGNsZWFy
ZWQgbWVhbndoaWxlLgo+Cj4gVG8gcHJldmVudCB0aGUgcHJvYmxlbSwgbGV0J3MgdHJ1bmNhdGUg
YWxsIHBhZ2VzIGJlZm9yZSBjbGVhcmluZyB0aGUgZmxhZwo+Cj4gQXRvbWljIHdyaXRlIHRocmVh
ZCAgICAgICAgICAgICAgV3JpdGViYWNrIHRocmVhZAo+ICAgZjJmc19hYm9ydF9hdG9taWNfd3Jp
dGUKPiAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0ZJTEUpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvX3dyaXRlcGFnZXMKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gdXNlIGRuIG9mIG9yaWdp
bmFsIGlub2RlCj4gICAgIHRydW5jYXRlX2lub2RlX3BhZ2VzX2ZpbmFsCj4KPiBGaXhlczogM2Ri
MWRlMGU1ODJjICgiZjJmczogY2hhbmdlIHRoZSBjdXJyZW50IGF0b21pYyB3cml0ZSB3YXkiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICN2NS4xOSsKPiBSZXZpZXdlZC1ieTogU3VuZ2pv
bmcgU2VvIDxzajE1NTcuc2VvQHNhbXN1bmcuY29tPgo+IFJldmlld2VkLWJ5OiBZZW9uZ2ppbiBH
aWwgPHlvdW5namluLmdpbEBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTdW5taW4gSmVv
bmcgPHNfbWluLmplb25nQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBmcy9mMmZzL3NlZ21lbnQuYyB8
IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
IGluZGV4IDc5MDFlZGU1ODExMy4uN2U0N2I4MDU0NDEzIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
c2VnbWVudC5jCj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtMTkyLDYgKzE5Miw5IEBA
IHZvaWQgZjJmc19hYm9ydF9hdG9taWNfd3JpdGUoc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBj
bGVhbikKPiAgICAgICAgIGlmICghZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybjsKPgo+ICsgICAgICAgaWYgKGNsZWFuKQo+ICsgICAgICAgICAgICAg
ICB0cnVuY2F0ZV9pbm9kZV9wYWdlc19maW5hbChpbm9kZS0+aV9tYXBwaW5nKTsKPiArCj4gICAg
ICAgICByZWxlYXNlX2F0b21pY193cml0ZV9jbnQoaW5vZGUpOwo+ICAgICAgICAgY2xlYXJfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCk7Cj4gICAgICAgICBjbGVhcl9pbm9k
ZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfUkVQTEFDRSk7Cj4gQEAgLTIwMSw3ICsyMDQsNiBAQCB2
b2lkIGYyZnNfYWJvcnRfYXRvbWljX3dyaXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgY2xl
YW4pCj4gICAgICAgICBGMkZTX0koaW5vZGUpLT5hdG9taWNfd3JpdGVfdGFzayA9IE5VTEw7Cj4K
PiAgICAgICAgIGlmIChjbGVhbikgewo+IC0gICAgICAgICAgICAgICB0cnVuY2F0ZV9pbm9kZV9w
YWdlc19maW5hbChpbm9kZS0+aV9tYXBwaW5nKTsKPiAgICAgICAgICAgICAgICAgZjJmc19pX3Np
emVfd3JpdGUoaW5vZGUsIGZpLT5vcmlnaW5hbF9pX3NpemUpOwo+ICAgICAgICAgICAgICAgICBm
aS0+b3JpZ2luYWxfaV9zaXplID0gMDsKPiAgICAgICAgIH0KPiAtLQo+IDIuMjUuMQo+Cj4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
