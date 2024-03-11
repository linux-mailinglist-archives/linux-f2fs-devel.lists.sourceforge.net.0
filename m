Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40B877B50
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 08:26:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rja3P-0005JV-Ox;
	Mon, 11 Mar 2024 07:26:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rja3N-0005JH-CJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 07:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWkn4Jgv2vGWKej5ZM1NioOSMWReqWi9UHuS9WHYkl4=; b=Y3gYEhlsnIEu8/QBuQ+dqunWK4
 S9TR9INtUZNbOlmvQtqTx9J7+2DUxDJKY1TyCRrVmTEcmKdV2n5fEhUnGIgrYl87/zTZUKNpDwrE+
 7Uoq+0H39tfpKqmV1e6KXJOF+ewJHIC7C1dn263en9MR+hPwJhBChAguGjsJFREkkIyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWkn4Jgv2vGWKej5ZM1NioOSMWReqWi9UHuS9WHYkl4=; b=fTm1pzlYxXD7bcoNEdMHVVgZC4
 by5NcXGZhye+zi8wErv+2dd43zU0doIlKkSnaLokhWMyRbFXvkIgWZriVS5/TWmzHusNJIZltWEgR
 YwflBXGee7dhxSV3eEwZbnNleaVOuSfL2ftmvABrPcX3R44GYg2YN51kCcGCxQLdeTbo=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rja3D-0004Ys-Ib for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 07:26:34 +0000
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-56840d872aeso1783917a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710141978; x=1710746778; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWkn4Jgv2vGWKej5ZM1NioOSMWReqWi9UHuS9WHYkl4=;
 b=JqbfspgxZ0tVRpzLuG3Qy3B0DFc1sE3qgI4bvT46zxvgjvuiOJHJ2mMV+a7xO53aed
 L/0ZxyMYoLhbqkQhEPi+aEsEMETpvyZ1HGepHqopMH+5+5DxAd7n4ICeMCRLUmmk5Mj3
 2hsWar/7wVEU4RC/x1aI1wmRByX+UIoLr75wppdSTGx1k6V5h5wH7zj4DwYDKsBCN6hv
 L7cdy6hk0HleJIPYzCMGyUoTOJ10QlOj6WNznEDMwcqMMHLak2QcmpZIz8KXTmY+KRN8
 /xP8y6/Rz5FeeOkrRKjxdzmP+IpcpCtPXddGWllyfFbqdBDQ3Q0Z5sfL77dlGjOzrD8+
 bQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710141978; x=1710746778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWkn4Jgv2vGWKej5ZM1NioOSMWReqWi9UHuS9WHYkl4=;
 b=n80K3kqWUHQHx8QlXbwmGok4L5Er11BzM5kI3U0IDoJkyiVidJdf3kmyBucJJLxxrv
 8Dmc6sNfsrp4szyBNdnvvGabfInXJK7PRn84Wfu6XEnLX2ooFsOPMwoWAdpGQgW5PGNJ
 iPIHfqIzzt8zNqMOuQtaxQWDfAsnBZikKA8LS5iMAY8J7/SxWVxvmpofItEdQBtM+4Q/
 3xslI0C3q000C0OMFumPzWzXLvXTmvEtlkLDcMruuB10NDfdi9tmBN3N5k55kpjvmPkB
 DNGfrgJ8Hg+H02RUF3xFtNyAJAcDYZdP1mB9jVxS4PJgmT/wJ9lqt6hFLwISDcnH6xwj
 kusQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkrvOQvTqncA48WyedFY+Xuj1ZaD7+r5rSqmaxoItOjkVQhnPl7HUkAsKh0lyAva9NSfD1SwQv3IjO+Mpp28+l8U8y7PVGzrvoNKcT+o/XmMwLCMee7g==
X-Gm-Message-State: AOJu0YwNQLoPpI7bfcgquHlEM9k50otbf6ckmpDlXRCnZYsVtEMeptb+
 XjrdINp8KHQ2zef8uJ9SBwtoSBHyHPOXAhAhRp33jJC+svafKW7BqVo19JAbYghbpDAtLFUskrJ
 HXrHt9Z+207nW03KLt+a+Gatwuu5hFEOaFYxvrw==
X-Google-Smtp-Source: AGHT+IHlIrKxTq7vP0MeJ2GvPvVKvxoi93bl1RTM4o8dFr26YTt7kFx/WqKjoksumG4QiKtPySZp1LqDHt/GHwhn0II=
X-Received: by 2002:a50:bb4c:0:b0:566:49f4:c538 with SMTP id
 y70-20020a50bb4c000000b0056649f4c538mr3608881ede.34.1710141978051; Mon, 11
 Mar 2024 00:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <1709892753-27461-1-git-send-email-zhiguo.niu@unisoc.com>
 <67a7f35d-5cc3-4b5f-968a-e4151c63eb74@kernel.org>
In-Reply-To: <67a7f35d-5cc3-4b5f-968a-e4151c63eb74@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 11 Mar 2024 15:26:07 +0800
Message-ID: <CAHJ8P3KnG6OmjeCq2JE6z-xXVbqjVU=pR+3A9Fz6qgELkeq90Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 11, 2024 at 11:54 AM Chao Yu wrote: > > On 2024/3/8
    18:12, Zhiguo Niu wrote: > > add_bio_entry should not trigger system panic
    when bio_add_page fail, > > fix to remove it. > > > > Fix [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rja3D-0004Ys-Ib
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to remove f2fs_bug_on in
 add_bio_entry
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMTE6NTTigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyNC8zLzggMTg6MTIsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBh
ZGRfYmlvX2VudHJ5IHNob3VsZCBub3QgdHJpZ2dlciBzeXN0ZW0gcGFuaWMgd2hlbiBiaW9fYWRk
X3BhZ2UgZmFpbCwKPiA+IGZpeCB0byByZW1vdmUgaXQuCj4gPgo+ID4gRml4ZXM6IDBiMjBmY2Vj
ODY1MSAoImYyZnM6IGNhY2hlIGdsb2JhbCBJUFUgYmlvIikKPiA+IFNpZ25lZC1vZmYtYnk6IFpo
aWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2Rh
dGEuYyB8IDYgKysrKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJm
cy9kYXRhLmMKPiA+IGluZGV4IGQ5NDk0YjUuLmY4YWU2ODQgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9m
MmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC03NTksOCArNzU5LDEw
IEBAIHN0YXRpYyB2b2lkIGFkZF9iaW9fZW50cnkoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBz
dHJ1Y3QgYmlvICpiaW8sCj4gPiAgICAgICBiZS0+YmlvID0gYmlvOwo+ID4gICAgICAgYmlvX2dl
dChiaW8pOwo+ID4KPiA+IC0gICAgIGlmIChiaW9fYWRkX3BhZ2UoYmlvLCBwYWdlLCBQQUdFX1NJ
WkUsIDApICE9IFBBR0VfU0laRSkKPiA+IC0gICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCAx
KTsKPiA+ICsgICAgIGlmIChiaW9fYWRkX3BhZ2UoYmlvLCBwYWdlLCBQQUdFX1NJWkUsIDApICE9
IFBBR0VfU0laRSkgewo+ID4gKyAgICAgICAgICAgICBiaW9fcHV0KGJpbyk7Cj4KPiBJIGRpZG4n
dCBnZXQgaXQsIHdoeSBuZXcgY3JlYXRlZCBiaW8gaGFzIG5vIHNwYWNlIHRvIHN0b3JlIG9uZSBw
YWdlPwo+Cj4gVGhhbmtzLAoKRGVhciBDaGFvLApJIGdvdCB3aGF0IHlvdSBtZWFuLgoKV2UgYXJl
IGRvaW5nIGJpbyBtZXJnZSBvcHRpbWl6YXRpb24gaW4gYmlvX2FkZF9wYWdlLgpBZnRlciBsb29r
aW5nIGF0IGFsbCB0aGUgbG9jYXRpb25zIHdoZXJlIGJpb19hZGRfcGFnZSBpcyBjYWxsZWQsCmFu
ZCB0aGluayBpdCBpcyB1bnJlYXNvbmFibGUgdG8gcGFuaWMgdGhlIHN5c3RlbSBpZiBiaW9fYWRk
X3BhZ2UgZmFpbHMuCmJ1dCBpdCBpcyBub3QgaW1wb3NzaWJsZSB0byBwYW5pYyBpbiB0aGUgY3Vy
cmVudCBmbG93IGFib3V0IGJpb19hZGRfcGFnZS4Kc28ga2VlcGluZyBpdCBhcyBpcyBpcyBhIGdv
b2QgY2hvaWNlLgp0aGFua3MhCj4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgIH0K
PiA+Cj4gPiAgICAgICBmMmZzX2Rvd25fd3JpdGUoJmlvLT5iaW9fbGlzdF9sb2NrKTsKPiA+ICAg
ICAgIGxpc3RfYWRkX3RhaWwoJmJlLT5saXN0LCAmaW8tPmJpb19saXN0KTsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
