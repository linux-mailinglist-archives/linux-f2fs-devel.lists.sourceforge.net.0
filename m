Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D882FDAE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jan 2024 00:12:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPsbs-0000vz-Hc;
	Tue, 16 Jan 2024 23:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rPsbq-0000vg-75
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 23:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JrCXnFeEnVjZwLJzqlTFvtVLNn2OtM0Ejf5cfJHCHUQ=; b=B6DMo+KTp8ULvnQWTaAcqWTta9
 WVmXT3RlqX4KX0UCH3gk1+zbsqGlp2BGRygTK6ALIgQgf/8a8IHJGM7eAN+9uApis9YtNJ44wGIFv
 jsuMBLWXpp+R31kn7mKEne/f94biM9T9GkezFjoUXYzD2A+hIfYO4TaFJqrzOH5blC6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JrCXnFeEnVjZwLJzqlTFvtVLNn2OtM0Ejf5cfJHCHUQ=; b=L1BlUw9+G7q93UJ8aU9w49n2+b
 JaEtWeKRINI9CwZ4foWi0omshpSY+XJt2AuXxI6AYcHi+oQiuVsF8PsxyxLSkbnCwWFBf1QYmenC6
 C2OBKL68UYv74j4TW5QZIzNCJQjUNNqLnKF0GoHJ2ZkH29IWU54h5acTyiU5kQRCV4do=;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPsbk-0004go-02 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 23:12:40 +0000
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-7d250629e25so608740241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 15:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705446751; x=1706051551; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrCXnFeEnVjZwLJzqlTFvtVLNn2OtM0Ejf5cfJHCHUQ=;
 b=DXlXMvdMdG6WutEevzwSAEa47SUcJC5LuccDnbXq9xys7y9dpgPLD3wm6HhYTL8JTS
 iXKvuz5ZAeEuq57C75rnzuJfraUUyQqCONEDw7YsWAPrm59G9RIzpM+LeCTbBPIjFriF
 yOoo+dCfEA9+1Waqb1q53tjraTC9pOwx8bd5LSssAgt+YBi1NWe9l6wVIULurfBhFvdR
 CvISZRyajpBmYC2aEhk0qpSfvJv/+fuLuei7qedlEw78je4QFcHNVPIOACBMv//4BsZ7
 PIXQXVjlVZTEVcOmkXLlrxbjdOYZYouDT10hyoyRhmFxSXu/WKAL37Lv6W+jxg4lt/5i
 lUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705446751; x=1706051551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrCXnFeEnVjZwLJzqlTFvtVLNn2OtM0Ejf5cfJHCHUQ=;
 b=xT3qv0mFl/5idnG3y4pRimsRxqE59Ecs7f0R8AD43FQK0sDGQ1kvIrOqD5E7p6LT7H
 7GWHw+YuRO2aTmta+i5ltbOdl1iFBbj2Lv+q+tn6IeKSl5opgj37kuLIXK6oaO+IhVaM
 NCo3baOfLkPmFwSVEVpsRnuay5Ks5OS6Cfza3UCDdcg03by8z5SaQ/qizTbGg7/soOIi
 NqfG+cBPZN4jhn3UHdKSAQXz9SkTs3E0qYdSByYI67FkDiImu7L8BBiCKuxIEOWB7Rsj
 lFEXm3v+pyxum4WHMF/5ucawdU14rcP0Pbr7ndio1PPrdRR6ZGTleHirb2kcSDWUu7gb
 82qA==
X-Gm-Message-State: AOJu0YwdPOfLZeTMsl1mHSDcB7KLGHHcVrDB+zwH0zwITnB/pLnIi9gB
 3byS5Ny5ROsfs/se9oCl0iMh8ghtOjFCV7XONLk=
X-Google-Smtp-Source: AGHT+IFRaNgz6iaC46k9haS6qg82l2Z4/p+B907lQqSOoENGP4rrmZeWvU15EJWfV2ri9niW77owN97EogZakc9Ht/I=
X-Received: by 2002:a67:ef89:0:b0:467:ed18:56e2 with SMTP id
 r9-20020a67ef89000000b00467ed1856e2mr5671510vsp.7.1705446751000; Tue, 16 Jan
 2024 15:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20240116143422.1268-1-qwjhust@gmail.com>
 <CACOAw_zP_=w21p__X5hD8Br8tARLHozn5REA5maW8OU2M=AAhg@mail.gmail.com>
In-Reply-To: <CACOAw_zP_=w21p__X5hD8Br8tARLHozn5REA5maW8OU2M=AAhg@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 16 Jan 2024 15:12:20 -0800
Message-ID: <CACOAw_wzP2emXE_Os-eutBp9L3QRCwsDWg+qt-pQEHto_BvFUw@mail.gmail.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jan 16, 2024 at 2:58 PM Daeho Jeong wrote: > > On
    Tue, Jan 16, 2024 at 6:36 AM Wenjie Qi wrote: > > > > We can get the number
    of remaining available zone > > resources by subtracting t [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.54 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPsbk-0004go-02
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix max open zone constraints
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgMjo1OOKAr1BNIERhZWhvIEplb25nIDxkYWVobzQzQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAxNiwgMjAyNCBhdCA2OjM24oCvQU0gV2Vu
amllIFFpIDxxd2podXN0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2UgY2FuIGdldCB0aGUg
bnVtYmVyIG9mIHJlbWFpbmluZyBhdmFpbGFibGUgem9uZQo+ID4gcmVzb3VyY2VzIGJ5IHN1YnRy
YWN0aW5nIHRoZSBudW1iZXIgb2YgYWN0aXZlIGxvZ3MgZnJvbQo+ID4gdGhlIG51bWJlciBvZiBt
YXggYWN0aXZlIHpvbmVzIG9mIHpvbmVkIGRldmljZXMuIFdlIGNhbgo+ID4gdXNlIHRoZXNlIGF2
YWlsYWJsZSB6b25lIHJlc291cmNlcyB0byByZWR1Y2UgdGhlIG51bWJlcgo+ID4gb2YgcGVuZGlu
ZyBiaW8gd2hlbiBzd2l0Y2hpbmcgem9uZXMuCj4gPiBJZiBtYXggYWN0aXZlIHpvbmVzIGlzIDAs
IHRoZXJlIGlzIG5vIGxpbWl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlbmppZSBRaSA8cXdq
aHVzdEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL2RhdGEuYyAgfCAzMiArKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIGZzL2YyZnMvZjJmcy5oICB8ICAyICsrCj4g
PiAgZnMvZjJmcy9zdXBlci5jIHwgMTEgKysrKysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4IGRjZThkZWZkZjRjNy4uMGI2
MmNhMjk2MDc0IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4gPiBAQCAtMzkyLDYgKzM5MiwxOSBAQCBzdGF0aWMgdm9pZCBmMmZzX3pvbmVf
d3JpdGVfZW5kX2lvKHN0cnVjdCBiaW8gKmJpbykKPiA+ICAgICAgICAgY29tcGxldGUoJmlvLT56
b25lX3dhaXQpOwo+ID4gICAgICAgICBmMmZzX3dyaXRlX2VuZF9pbyhiaW8pOwo+ID4gIH0KPiA+
ICsKPiA+ICtzdGF0aWMgdm9pZCBmMmZzX3pvbmVfd3JpdGVfZW5kX2lvX25vd2FpdChzdHJ1Y3Qg
YmlvICpiaW8pCj4gPiArewo+ID4gKyNpZmRlZiBDT05GSUdfRjJGU19JT1NUQVQKPiA+ICsgICAg
ICAgc3RydWN0IGJpb19pb3N0YXRfY3R4ICppb3N0YXRfY3R4ID0gYmlvLT5iaV9wcml2YXRlOwo+
ID4gKyAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBpb3N0YXRfY3R4LT5zYmk7Cj4g
PiArI2Vsc2UKPiA+ICsgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gKHN0cnVjdCBm
MmZzX3NiX2luZm8gKiliaW8tPmJpX3ByaXZhdGU7Cj4gPiArI2VuZGlmCj4gPiArCj4gPiArICAg
ICAgIGF0b21pY19pbmMoJnNiaS0+YXZhaWxhYmxlX2FjdGl2ZV96b25lcyk7Cj4gPiArICAgICAg
IGYyZnNfd3JpdGVfZW5kX2lvKGJpbyk7Cj4gPiArfQo+ID4gICNlbmRpZgo+Cj4gSSBkb24ndCB0
aGluayB0aGlzIHdvcmtzLiBMZXQncyBhc3N1bWUgd2Ugc3RhcnQgd2l0aCAyCj4gYXZhaWxhYmxl
X2FjdGl2ZV96b25lcyBhbmQgNCBhY3RpdmUgbG9ncy4KPiBIb3cgYWJvdXQgNCBhY3RpdmUgbG9n
cyByZWFjaCBhdCB0aGUgZW5kIG9mIHRoZSB6b25lcyBhdCB0aGUgc2FtZSB0aW1lPwoKU29ycnks
IEkgd2FzIGNvbmZ1c2VkLiBJdCB3b3VsZCB3b3JrLiBIb3dldmVyLCBpdCBtaWdodCBiZSBhIGxp
dHRsZSBjbHVtc3kuCkhvdyBhYm91dCB1c2luZyBhIGRhdGEgc3RydWN0dXJlIGxpa2UgYSBjb3Vu
dGluZyBzZW1hcGhvcmU/CldlIGNhbiBkZWNyZWFzZSBpdCBhcyB3ZSBvcGVuIGEgem9uZSBhbmQg
aW5jcmVhc2UgaXQgYXMgd2UgY2xvc2UgYSB6b25lLgoKPgo+ID4KPiA+ICBzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpmMmZzX3RhcmdldF9kZXZpY2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4g
QEAgLTEwODUsMTQgKzEwOTgsMTkgQEAgdm9pZCBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKHN0cnVj
dCBmMmZzX2lvX2luZm8gKmZpbykKPiA+ICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gPiAg
b3V0Ogo+ID4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ID4gLSAgICAgICBpZiAoZjJm
c19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBidHlwZSA8IE1FVEEgJiYKPiA+ICsgICAgICAgaWYg
KGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgc2JpLT5tYXhfYWN0aXZlX3pvbmVzICYmIGJ0
eXBlIDwgTUVUQSAmJgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaXNfZW5kX3pvbmVfYmxr
YWRkcihzYmksIGZpby0+bmV3X2Jsa2FkZHIpKSB7Cj4gPiAtICAgICAgICAgICAgICAgYmlvX2dl
dChpby0+YmlvKTsKPiA+IC0gICAgICAgICAgICAgICByZWluaXRfY29tcGxldGlvbigmaW8tPnpv
bmVfd2FpdCk7Cj4gPiAtICAgICAgICAgICAgICAgaW8tPmJpX3ByaXZhdGUgPSBpby0+YmlvLT5i
aV9wcml2YXRlOwo+ID4gLSAgICAgICAgICAgICAgIGlvLT5iaW8tPmJpX3ByaXZhdGUgPSBpbzsK
PiA+IC0gICAgICAgICAgICAgICBpby0+YmlvLT5iaV9lbmRfaW8gPSBmMmZzX3pvbmVfd3JpdGVf
ZW5kX2lvOwo+ID4gLSAgICAgICAgICAgICAgIGlvLT56b25lX3BlbmRpbmdfYmlvID0gaW8tPmJp
bzsKPiA+ICsgICAgICAgICAgICAgICBpZiAoIWF0b21pY19hZGRfbmVnYXRpdmUoLTEsICZzYmkt
PmF2YWlsYWJsZV9hY3RpdmVfem9uZXMpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBp
by0+YmlvLT5iaV9lbmRfaW8gPSBmMmZzX3pvbmVfd3JpdGVfZW5kX2lvX25vd2FpdDsKPiA+ICsg
ICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXRvbWlj
X2luYygmc2JpLT5hdmFpbGFibGVfYWN0aXZlX3pvbmVzKTsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGJpb19nZXQoaW8tPmJpbyk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWlu
aXRfY29tcGxldGlvbigmaW8tPnpvbmVfd2FpdCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBpby0+YmlfcHJpdmF0ZSA9IGlvLT5iaW8tPmJpX3ByaXZhdGU7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpby0+YmlvLT5iaV9wcml2YXRlID0gaW87Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBpby0+YmlvLT5iaV9lbmRfaW8gPSBmMmZzX3pvbmVfd3JpdGVfZW5kX2lvOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaW8tPnpvbmVfcGVuZGluZ19iaW8gPSBpby0+YmlvOwo+
ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgICBfX3N1Ym1pdF9tZXJnZWRf
YmlvKGlvKTsKPiA+ICAgICAgICAgfQo+ID4gICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+IGluZGV4IDY1Mjk0ZTNiMGJlZi4uMmFhZGUz
NjdhYzY2IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMv
ZjJmcy5oCj4gPiBAQCAtMTU1MSw2ICsxNTUxLDggQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4g
Pgo+ID4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ID4gICAgICAgICB1bnNpZ25lZCBp
bnQgYmxvY2tzX3Blcl9ibGt6OyAgICAgICAgICAgLyogRjJGUyBibG9ja3MgcGVyIHpvbmUgKi8K
PiA+ICsgICAgICAgdW5zaWduZWQgaW50IG1heF9hY3RpdmVfem9uZXM7ICAgICAgICAgIC8qIG1h
eCB6b25lIHJlc291cmNlcyBvZiB0aGUgem9uZWQgZGV2aWNlICovCj4gPiArICAgICAgIGF0b21p
Y190IGF2YWlsYWJsZV9hY3RpdmVfem9uZXM7ICAgICAgICAvKiByZW1haW5pbmcgem9uZSByZXNv
dXJjZXMgZm9yIHpvbmUgc3dpdGNoICovCj4gPiAgI2VuZGlmCj4gPgo+ID4gICAgICAgICAvKiBm
b3Igbm9kZS1yZWxhdGVkIG9wZXJhdGlvbnMgKi8KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1
cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+IGluZGV4IDIwNmQwM2M4MmQ5Ni4uNjcxMTI4M2Zm
MTg3IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gPiArKysgYi9mcy9mMmZzL3N1
cGVyLmMKPiA+IEBAIC0yMzg1LDYgKzIzODUsMTIgQEAgc3RhdGljIGludCBmMmZzX3JlbW91bnQo
c3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50ICpmbGFncywgY2hhciAqZGF0YSkKPiA+ICAgICAg
ICAgaWYgKGVycikKPiA+ICAgICAgICAgICAgICAgICBnb3RvIHJlc3RvcmVfb3B0czsKPiA+Cj4g
PiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4gPiArICAgICAgIGlmIChzYmktPm1heF9h
Y3RpdmVfem9uZXMpCj4gPiArICAgICAgICAgICAgICAgYXRvbWljX3NldCgmc2JpLT5hdmFpbGFi
bGVfYWN0aXZlX3pvbmVzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmkt
Pm1heF9hY3RpdmVfem9uZXMgLSBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsKPiA+ICsj
ZW5kaWYKPiA+ICsKPiA+ICAgICAgICAgLyogZmx1c2ggb3V0c3RhbmRpbmcgZXJyb3JzIGJlZm9y
ZSBjaGFuZ2luZyBmcyBzdGF0ZSAqLwo+ID4gICAgICAgICBmbHVzaF93b3JrKCZzYmktPnNfZXJy
b3Jfd29yayk7Cj4gPgo+ID4gQEAgLTM5MzIsNiArMzkzOCwxMSBAQCBzdGF0aWMgaW50IGluaXRf
Ymxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmkpCj4gPiAgICAgICAg
IGlmICghZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+Cj4gPiArICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96b25lcyA9IGJkZXZfbWF4X2Fj
dGl2ZV96b25lcyhiZGV2KTsKPiA+ICsgICAgICAgaWYgKHNiaS0+bWF4X2FjdGl2ZV96b25lcykK
PiA+ICsgICAgICAgICAgICAgICBhdG9taWNfc2V0KCZzYmktPmF2YWlsYWJsZV9hY3RpdmVfem9u
ZXMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96
b25lcyAtIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+ID4gKwo+Cj4gTmVlZCB0byBt
YWtlIGF2YWlsYWJsZV9hY3RpdmVfem9uZXMgbm90IGJlIG5lZ2F0aXZlLCByaWdodD8KPiBIbW0s
IG5lZWQgdG8gbWFrZSBzdXJlIGFjdGl2ZV9sb2dzIHNob3VsZCBiZSBlcXVhbCBvciBsZXNzIHRo
YW4KPiBtYXhfYWN0aXZlX3pvbmVzLgo+Cj4gPiAgICAgICAgIHpvbmVfc2VjdG9ycyA9IGJkZXZf
em9uZV9zZWN0b3JzKGJkZXYpOwo+ID4gICAgICAgICBpZiAoIWlzX3Bvd2VyX29mXzIoem9uZV9z
ZWN0b3JzKSkgewo+ID4gICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkYyRlMgZG9lcyBu
b3Qgc3VwcG9ydCBub24gcG93ZXIgb2YgMiB6b25lIHNpemVzXG4iKTsKPiA+IC0tCj4gPiAyLjM0
LjEKPiA+Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
