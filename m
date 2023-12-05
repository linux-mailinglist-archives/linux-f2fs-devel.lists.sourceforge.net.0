Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D51578057A3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 15:43:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAWe7-0001G0-0r;
	Tue, 05 Dec 2023 14:43:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1rAWe4-0001Fr-UH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 14:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pjdtv/qvcvmV2FJZ6UPMjLsxM4qKAp4v+YD1JDpGKIs=; b=eL68ZtQlaZkjZJbUvfpdjkTqsJ
 Ptg8k/5y+nacR3c0azvh9HdvgW2ZWjSD/0/CBRDjOCDljkNsbsAbPdK9ZhdBnePVTexE/HQwY3VG6
 QX9p1M3zVyYPMdshsGTQOGIHuNYT3ek88nF0YAMXwa0/MHLEHMde3PakxtomYXpCJ4yA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pjdtv/qvcvmV2FJZ6UPMjLsxM4qKAp4v+YD1JDpGKIs=; b=Ge+ENmehoa2IE8TAlU4ir1AmBH
 3HhGJIAzzVZENzKc9QNM3eOFBb/wczOK1Kk1FBXmsKuU2CcCUnd6KB5R+3pHQwrwxYow9Sw24f3a7
 NuYoSjWFGTO3BF8WfWhzDXONsEsyVgggTCUVIfA7POvJDuGt8Za8+ljvGw/2X/u3JKVY=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAWe4-00076C-7K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 14:43:32 +0000
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a195e0145acso666757766b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Dec 2023 06:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701787401; x=1702392201; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pjdtv/qvcvmV2FJZ6UPMjLsxM4qKAp4v+YD1JDpGKIs=;
 b=fUbDxiDhLz0o5esG//d2lKOm0CHiYJVRiICTcfhbfcRBhTQS5wHuMelZ4NjQ6Lkkx6
 8K70fNF2BkGCVFwOqloYuWNmtxMyMRRdrAZjAWfBMTQilKNUWGOs+f5oBRCy7/k9/xES
 OAjQowAarg1YMYMDkFMCzk/vkvX3/C755ILpXSGgJ+IQaXAuPwqARJZPfKxKa9S37TUM
 nmdaKNBm7uFSfN7zEq+mhxWR1XgQEgcIybjnBT4RQ52jjWdYGXINT0r+c3pF+aNW3guM
 PzhwdsFXEDy4NknSfeiiUtoBNTAYf/jdF85mJe689DGB4mn7xCkyZeow9naZxvvJ43vH
 vZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701787401; x=1702392201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pjdtv/qvcvmV2FJZ6UPMjLsxM4qKAp4v+YD1JDpGKIs=;
 b=RYmolMM7ylXH7f3TGKCIXcj+A1uET08A5r8sVmnL69VQTQ8g0PpiAt4erQGOxVbqTh
 uzssM/Jp4VmurNQjphuO5oGIqoIhVv/lHh74rD/hdXeuDg7mSoMLDcO28q/YUMKfUJZd
 e3nm4axym2fidzuBfeue2hlALd/BTRfn6sDqc3bUiSB3WIsbHEFIUeOoul+KGVovEdbM
 5J8zKov9goMQtVS4j7lefR0zYu6DtTanqufEYXwsbQ6vyvjC0bdYcgJNFJlhC18ajMB7
 r63a2h8VIHWyaHbUl3Aq7tp7FRjDYiErz/nS2PsIUP8XrshzAhX7PxFhVRVytagSTKKK
 9VeQ==
X-Gm-Message-State: AOJu0YzJhURODlX+uKv2Tygjp3mJqR/o8mIMTpgXKgmpqzKqv2lJ4Vq4
 07ae5XJQC5jHhnL1p0cVEp5LJH4vsLX5vOcYsIGS/T7R2lN7xw==
X-Google-Smtp-Source: AGHT+IFZsX9IXLFnPNc9Rx54fslZziVSWrbY5/kOYJ57W0poZKWrP5UGdXe4yOR7qOdaDR+TPxV3/fo9PXmFNtXmlVM=
X-Received: by 2002:a17:906:3f4f:b0:a19:a19b:4264 with SMTP id
 f15-20020a1709063f4f00b00a19a19b4264mr306280ejj.207.1701787400500; Tue, 05
 Dec 2023 06:43:20 -0800 (PST)
MIME-Version: 1.0
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
 <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
 <649a3bc4-58bb-1dc8-85fb-a56e47b3d5c9@linux.alibaba.com>
 <CAD14+f1u6gnHLhGSoQxL9wLq9vDYse+Ac8zxep-O2E8hHreT2w@mail.gmail.com>
 <275f025d-e2f1-eaff-6af1-e909d370cee0@linux.alibaba.com>
 <CAD14+f3zgwgUugjnB7UGCYh4j3iXYsvv_DJ3yvwduA1xf3xn=A@mail.gmail.com>
 <d7c7ea8c-6e2f-e8d8-88c3-4952c506ed13@linux.alibaba.com>
 <CAD14+f2hPLv6RPZdYyi8q8SQGiBox2fYUaWwuBEjEbZKQdyU7g@mail.gmail.com>
 <8597c64c-d26a-8073-9d00-b629bbb0ee33@linux.alibaba.com>
In-Reply-To: <8597c64c-d26a-8073-9d00-b629bbb0ee33@linux.alibaba.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 5 Dec 2023 23:43:09 +0900
Message-ID: <CAD14+f0PJiKVToxH6oULL6KuKqbKN+j6rcdwh7dpH8dHNZz42A@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Dec 5, 2023 at 11:34 PM Gao Xiang wrote: > > > >
    On 2023/12/5 22:23, Juhyung Park wrote: > > Hi Gao, > > > > On Tue, Dec 5,
    2023 at 4:32 PM Gao Xiang wrote: > >> > >> Hi Juhyung, > >> [...] 
 
 Content analysis details:   (2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rAWe4-00076C-7K
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCAxMTozNOKAr1BNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDIzLzEyLzUgMjI6MjMsIEp1aHl1
bmcgUGFyayB3cm90ZToKPiA+IEhpIEdhbywKPiA+Cj4gPiBPbiBUdWUsIERlYyA1LCAyMDIzIGF0
IDQ6MzLigK9QTSBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6
Cj4gPj4KPiA+PiBIaSBKdWh5dW5nLAo+ID4+Cj4gPj4gT24gMjAyMy8xMi80IDExOjQxLCBKdWh5
dW5nIFBhcmsgd3JvdGU6Cj4gPj4KPiA+PiAuLi4KPiA+Pj4KPiA+Pj4+Cj4gPj4+PiAtIENvdWxk
IHlvdSBzaGFyZSB0aGUgZnVsbCBtZXNzYWdlIGFib3V0IHRoZSBvdXRwdXQgb2YgYGxzY3B1YD8K
PiA+Pj4KPiA+Pj4gU3VyZToKPiA+Pj4KPiA+Pj4gQXJjaGl0ZWN0dXJlOiAgICAgICAgICAgIHg4
Nl82NAo+ID4+PiAgICAgQ1BVIG9wLW1vZGUocyk6ICAgICAgICAzMi1iaXQsIDY0LWJpdAo+ID4+
PiAgICAgQWRkcmVzcyBzaXplczogICAgICAgICAzOSBiaXRzIHBoeXNpY2FsLCA0OCBiaXRzIHZp
cnR1YWwKPiA+Pj4gICAgIEJ5dGUgT3JkZXI6ICAgICAgICAgICAgTGl0dGxlIEVuZGlhbgo+ID4+
PiBDUFUocyk6ICAgICAgICAgICAgICAgICAgOAo+ID4+PiAgICAgT24tbGluZSBDUFUocykgbGlz
dDogICAwLTcKPiA+Pj4gVmVuZG9yIElEOiAgICAgICAgICAgICAgIEdlbnVpbmVJbnRlbAo+ID4+
PiAgICAgQklPUyBWZW5kb3IgSUQ6ICAgICAgICBJbnRlbChSKSBDb3Jwb3JhdGlvbgo+ID4+PiAg
ICAgTW9kZWwgbmFtZTogICAgICAgICAgICAxMXRoIEdlbiBJbnRlbChSKSBDb3JlKFRNKSBpNy0x
MTg1RzcgQCAzLjAwR0h6Cj4gPj4+ICAgICAgIEJJT1MgTW9kZWwgbmFtZTogICAgIDExdGggR2Vu
IEludGVsKFIpIENvcmUoVE0pIGk3LTExODVHNyBAIDMuMDBHSHogTm9uZSBDUFUKPiA+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEAgMy4wR0h6Cj4gPj4+ICAgICAgIEJJT1MgQ1BVIGZh
bWlseTogICAgIDE5OAo+ID4+PiAgICAgICBDUFUgZmFtaWx5OiAgICAgICAgICA2Cj4gPj4+ICAg
ICAgIE1vZGVsOiAgICAgICAgICAgICAgIDE0MAo+ID4+PiAgICAgICBUaHJlYWQocykgcGVyIGNv
cmU6ICAyCj4gPj4+ICAgICAgIENvcmUocykgcGVyIHNvY2tldDogIDQKPiA+Pj4gICAgICAgU29j
a2V0KHMpOiAgICAgICAgICAgMQo+ID4+PiAgICAgICBTdGVwcGluZzogICAgICAgICAgICAxCj4g
Pj4+ICAgICAgIENQVShzKSBzY2FsaW5nIE1IejogIDYwJQo+ID4+PiAgICAgICBDUFUgbWF4IE1I
ejogICAgICAgICA0ODAwLjAwMDAKPiA+Pj4gICAgICAgQ1BVIG1pbiBNSHo6ICAgICAgICAgNDAw
LjAwMDAKPiA+Pj4gICAgICAgQm9nb01JUFM6ICAgICAgICAgICAgNTk5MC40MAo+ID4+PiAgICAg
ICBGbGFnczogICAgICAgICAgICAgICBmcHUgdm1lIGRlIHBzZSB0c2MgbXNyIHBhZSBtY2UgY3g4
IGFwaWMgc2VwIG10cnIgcGdlIG1jCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEg
Y21vdiBwYXQgcHNlMzYgY2xmbHVzaCBkdHMgYWNwaSBtbXggZnhzciBzc2Ugc3NlMiBzcwo+ID4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBodCB0bSBwYmUgc3lzY2FsbCBueCBwZHBlMWdi
IHJkdHNjcCBsbSBjb25zdGFudF90c2MgYXJ0Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBhcmNoX3BlcmZtb24gcGVicyBidHMgcmVwX2dvb2Qgbm9wbCB4dG9wb2xvZ3kgbm9uc3Rv
cF8KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdHNjIGNwdWlkIGFwZXJmbXBlcmYg
dHNjX2tub3duX2ZyZXEgcG5pIHBjbG11bHFkcSBkdGVzNgo+ID4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA0IG1vbml0b3IgZHNfY3BsIHZteCBzbXggZXN0IHRtMiBzc3NlMyBzZGJnIGZt
YSBjeDE2IHh0Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByIHBkY20gcGNpZCBz
c2U0XzEgc3NlNF8yIHgyYXBpYyBtb3ZiZSBwb3BjbnQgdHNjX2RlYWQKPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGluZV90aW1lciBhZXMgeHNhdmUgYXZ4IGYxNmMgcmRyYW5kIGxh
aGZfbG0gYWJtIDNkbm93cAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWZldGNo
IGNwdWlkX2ZhdWx0IGVwYiBjYXRfbDIgY2RwX2wyIHNzYmQgaWJycyBpYnBiIHN0Cj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlicCBpYnJzX2VuaGFuY2VkIHRwcl9zaGFkb3cgZmxl
eHByaW9yaXR5IGVwdCB2cGlkIGVwdF8KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
YWQgZnNnc2Jhc2UgdHNjX2FkanVzdCBibWkxIGF2eDIgc21lcCBibWkyIGVybXMgaW52cGNpZAo+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmR0X2EgYXZ4NTEyZiBhdng1MTJkcSBy
ZHNlZWQgYWR4IHNtYXAgYXZ4NTEyaWZtYSBjbGZsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVzaG9wdCBjbHdiIGludGVsX3B0IGF2eDUxMmNkIHNoYV9uaSBhdng1MTJidyBhdng1
MTJ2bAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICB4c2F2ZW9wdCB4c2F2ZWMgeGdl
dGJ2MSB4c2F2ZXMgc3BsaXRfbG9ja19kZXRlY3QgZHRoZXJtCj4gPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZGEgYXJhdCBwbG4gcHRzIGh3cCBod3Bfbm90aWZ5IGh3cF9hY3Rfd2lu
ZG93IGh3cF9lcHAKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh3cF9wa2dfcmVx
IHZubWkgYXZ4NTEydmJtaSB1bWlwIHBrdSBvc3BrZSBhdng1MTJfdmJtaQo+ID4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAyIGdmbmkgdmFlcyB2cGNsbXVscWRxIGF2eDUxMl92bm5pIGF2
eDUxMl9iaXRhbGcgdG1lIGF2Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHg1MTJf
dnBvcGNudGRxIHJkcGlkIG1vdmRpcmkgbW92ZGlyNjRiIGZzcm0gYXZ4NTEyX3ZwMmkKPiA+Pgo+
ID4+IFNpZ2gsIEkndmUgYmVlbiB0aGlua2luZy4gIEhlcmUgRlNSTSBpcyB0aGUgbW9zdCBzaWdu
aWZpY2FudCBkaWZmZXJlbmNlIGJldHdlZW4KPiA+PiBvdXIgZW52aXJvbm1lbnRzLCBjb3VsZCB5
b3Ugb25seSB0cnkgdGhlIGZvbGxvd2luZyBkaWZmIHRvIHNlZSBpZiB0aGVyZSdzIGFueQo+ID4+
IGRpZmZlcmVuY2UgYW55bW9yZT8gKHdpdGhvdXQgdGhlIHByZXZpb3VzIGRpc2FibGUgcGF0Y2gu
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2xpYi9tZW1tb3ZlXzY0LlMgYi9hcmNo
L3g4Ni9saWIvbWVtbW92ZV82NC5TCj4gPj4gaW5kZXggMWI2MGFlODFlY2Q4Li4xYjUyYTkxMzIz
M2MgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC94ODYvbGliL21lbW1vdmVfNjQuUwo+ID4+ICsrKyBi
L2FyY2gveDg2L2xpYi9tZW1tb3ZlXzY0LlMKPiA+PiBAQCAtNDEsOSArNDEsNyBAQCBTWU1fRlVO
Q19TVEFSVChfX21lbW1vdmUpCj4gPj4gICAgI2RlZmluZSBDSEVDS19MRU4gICAgIGNtcCAkMHgy
MCwgJXJkeDsgamIgMWYKPiA+PiAgICAjZGVmaW5lIE1FTU1PVkVfQllURVMgbW92cSAlcmR4LCAl
cmN4OyByZXAgbW92c2I7IFJFVAo+ID4+ICAgIC5MbWVtbW92ZV9iZWdpbl9mb3J3YXJkOgo+ID4+
IC0gICAgICAgQUxURVJOQVRJVkVfMiBfX3N0cmluZ2lmeShDSEVDS19MRU4pLCBcCj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgIF9fc3RyaW5naWZ5KENIRUNLX0xFTjsgTUVNTU9WRV9CWVRFUyks
IFg4Nl9GRUFUVVJFX0VSTVMsIFwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgX19zdHJpbmdp
ZnkoTUVNTU9WRV9CWVRFUyksIFg4Nl9GRUFUVVJFX0ZTUk0KPiA+PiArICAgICAgIENIRUNLX0xF
Tgo+ID4+Cj4gPj4gICAgICAgICAgLyoKPiA+PiAgICAgICAgICAgKiBtb3ZzcSBpbnN0cnVjdGlv
biBoYXZlIG1hbnkgc3RhcnR1cCBsYXRlbmN5Cj4gPgo+ID4gWXVwLCB0aGF0IGFsc28gc2VlbXMg
dG8gZml4IGl0Lgo+ID4gQXJlIHdlIGxvb2tpbmcgYXQgYSBwb3RlbnRpYWwgbWVtbW92ZSBpc3N1
ZT8KPgo+IEknbSBzdGlsbCBhbmFseXppbmcgdGhpcyBiZWhhdmlvciBhcyB3ZWxsIGFzIHRoZSBy
b290IGNhdXNlIGFuZAo+IEkgd2lsbCBhbHNvIHRyeSB0byBnZXQgYSByZWNlbnQgY2xvdWQgc2Vy
dmVyIHdpdGggRlNSTSBteXNlbGYKPiB0byBmaW5kIG1vcmUgY2x1ZXMuCgpEb3duIHRoZSByYWJi
aXQgaG9sZSB3ZSBnby4uLgoKTGV0IG1lIGtub3cgaWYgeW91IGhhdmUgdHJvdWJsZSBnZXR0aW5n
IGFuIGluc3RhbmNlIHdpdGggRlNSTS4gSSdsbApzZWUgd2hhdCBJIGNhbiBkby4KCj4KPiBUaGFu
a3MsCj4gR2FvIFhpYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
