Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7499D333F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2024 06:45:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDdX5-0005p4-JT;
	Wed, 20 Nov 2024 05:45:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1tDdX4-0005oy-A6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 05:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tKkfR2xq8tOGKFIo0uBWNHo7cXRr2NkLQXqpwRPPoFA=; b=GB8vD2rpQ/MZNHypF+LeloDJcV
 r8Sa9P0Gi21t4YUwVVi2P52I0whxQBaTJKg4Fl3LEljWOvoG9NLumGldnLDgl+2Ug9d91s/CRJgmx
 koKVVa7FyOu9ul+QBQbWuirY6MlT+QBpVVAZezfH8whav+lpR38JaW1+F8p1OZ/3XLok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tKkfR2xq8tOGKFIo0uBWNHo7cXRr2NkLQXqpwRPPoFA=; b=FxDtSk4e/tiCoYnpGiJqhHk/TS
 jrYJr9pTszHjkosVaDUSOVA7WFyKxj6y8YCx5ruOSAT7CNRd0teJ3B7jKHG5K06Xo9hZQcLdE/Nag
 lHISA9JK9ubDFFXsUt/Ef9qxe0/3jTJZiMrmm7QYaKGs9j3bnrN1//i7A3Qm75BNvgKQ=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tDdX3-0008AD-U9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 05:45:42 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4315549c4d5so7322615e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Nov 2024 21:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732081535; x=1732686335; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKkfR2xq8tOGKFIo0uBWNHo7cXRr2NkLQXqpwRPPoFA=;
 b=NrRiHgR5O6vgZ8jbU+crPPI7lTn8j9ytc7nnBpA+tzNE6PPnPx+rxBwS5kNll4j3X0
 0XgOAlAXl2XsdoVGo4zLn5mXjQbsGO7DpNUBL8zE0xHlRaeIEJdEypSZEEXAbipkJMMn
 MqxOZT5yXeOumF25fm3wIK7P5nsT1B+c46YKwZyd98d2wcDfVN96AwxZWldt4X7NrXaN
 oo8whn+cQjHcZS/Wxx0S0uYKr0jq6OlOgLyxS0yULxFEqjFHxEtiWTE7yFRY7I6Sua99
 55vWslrLcMSgXaeGblBUWhcaHohaydEC3l1PSibtLbZWzBu62MIZ+fBIGDlchRisrpOK
 3ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732081535; x=1732686335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKkfR2xq8tOGKFIo0uBWNHo7cXRr2NkLQXqpwRPPoFA=;
 b=AuO2ue+ZoTFnUZFOscvya1AwHlzhgOJk6M4wPnNRXx+vlfBSHIku1w/kMuUTiMuWdz
 mQpJ5yq7YwP3qplsbYz6wokzqi2rHxh10tW0wrL7AJSx5zcoCr3Jj1JOTre3fMFWWTPQ
 8GKZD9+8eVOnn1sH6QxndJGilUu69IdLBkJ1YCna4Rn/nHHC0ADCyuK0Q0WpY+plPX0H
 M0Ih1BXGab4ZU2mJaecS4WCf3h3cJJr3MiVbvLrNMQNfBcScZ/9hi4ruTqc3D/L9LSje
 snB2dN1G9zvc1QTk+DeRll2j45iFdz1TUSmxamUI5q7MONVGlk3ppfRkvvv9J5XCQH8r
 /clQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqg7c0hTHvY/U53snA+diqtv700pnQMBl77xqSRZVxQmLQ2oVX9TiT4yrAoH6nbvJs2V/XgLKXjqTSJUv1o4mH@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzRLP2eWuRnpma+G04TTQeCrxuMp2V/YeTlZi0X+CY43sgt9A0z
 4lzrEOQ3XOhHmRzjkyiJoFzcNnnPm8Xfm1ZfdDqCUdKDWj505STA6BGZ2xTI0fbIqRxBV00+Q5N
 74paRQtldLegllZaPtoAEZY+xxa4=
X-Gm-Gg: ASbGncsdBYREEusc4LoauLD2cwPFfILOCKVfbtxLsL1r9xhEGmPr99udptxVerrwVV1
 /Bn1fU9vx+eECGF+/MkM2DuWzWZ4KM4g6
X-Google-Smtp-Source: AGHT+IE9+fNqB3SD6B9SB2D58HneDXUTUgLp0Tb82wQov+6QPMa5SWYo9vyiur1mNcuOmisug9kvv2GBX4byYbrmC5g=
X-Received: by 2002:a05:6000:2a5:b0:382:42c3:83f7 with SMTP id
 ffacd0b85a97d-38254b0f088mr359036f8f.10.1732081535048; Tue, 19 Nov 2024
 21:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
 <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
 <CAOsHCa1t+LeeAG2PDJ0BfYtoh_+CUmLjZcp1+dGZWR5PPfmFSQ@mail.gmail.com>
 <5b0c17da-f1e1-490d-a560-3312bc8c3247@kernel.org>
 <CAHJ8P3+dqhsNOy6-jvPaazSSOk7V9pEkQmamE48oLgGK1ORHfg@mail.gmail.com>
 <65b89566-1038-4422-9e2e-4d7da26dd1c7@kernel.org>
In-Reply-To: <65b89566-1038-4422-9e2e-4d7da26dd1c7@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 20 Nov 2024 13:45:23 +0800
Message-ID: <CAHJ8P3+SzZ-_8dsg7GkjLDqiWB6G6b+c8+EJku5eaMkxmf=ZVg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月20日周三 11:26写道： > > On 2024/11/19
    16:26, Zhiguo Niu wrote: > > Chao Yu 于2024年11月19日周二 15:50写道：
    > >> > >> On 2024/11/19 14:46, Xiuhong Wang wrote [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.128.52 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.52 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.52 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1tDdX3-0008AD-U9
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix to avoid long time to shrink
 extent cache
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
Cc: Xiuhong Wang <xiuhong.wang@unisoc.com>, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Xiuhong Wang <xiuhong.wang.cn@gmail.com>, jaegeuk@kernel.org,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIgyMOaXpeWRqOS4iSAxMToy
NuWGmemBk++8mgo+Cj4gT24gMjAyNC8xMS8xOSAxNjoyNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyIMTnml6XlkajkuowgMTU6
NTDlhpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvMTkgMTQ6NDYsIFhpdWhvbmcgV2FuZyB3
cm90ZToKPiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIgxOeaX
peWRqOS6jCAxNDowNeWGmemBk++8mgo+ID4+Pj4KPiA+Pj4+IE9uIDIwMjQvMTEvMTIgMTk6MDYs
IFhpdWhvbmcgV2FuZyB3cm90ZToKPiA+Pj4+PiBXZSBlbmNvdW50ZXJlZCBhIHN5c3RlbSBoYW5n
IHByb2JsZW0gYmFzZWQgb24gdGhlIGZvbGxvd2luZwo+ID4+Pj4+IGV4cGVyaW1lbnQ6Cj4gPj4+
Pj4gVGhlcmUgYXJlIDE3IHByb2Nlc3NlcywgOCBvZiB3aGljaCBkbyA0ayBkYXRhIHJlYWQsIHdy
aXRlIGFuZAo+ID4+Pj4+IGNvbXBhcmUgdGVzdHMsIGFuZCA4IGRvIDY0ayByZWFkLCB3cml0ZSBh
bmQgY29tcGFyZSB0ZXN0cy4gRWFjaAo+ID4+Pj4+IHRocmVhZCB3cml0ZXMgYSAyNTZNIGZpbGUs
IGFuZCBhbm90aGVyIHRocmVhZCB3cml0ZXMgYSBsYXJnZSBmaWxlCj4gPj4+Pj4gdG8gODAlIG9m
IHRoZSBkaXNrLCBhbmQgdGhlbiBrZWVwcyBkb2luZyByZWFkIG9wZXJhdGlvbnMsIGFsbCBvZgo+
ID4+Pj4+IHdoaWNoIGFyZSBkaXJlY3Qgb3BlcmF0aW9ucy4gVGhpcyB3aWxsIGNhdXNlIHRoZSBs
YXJnZSBmaWxlIHRvIGJlCj4gPj4+Pj4gZmlsbGVkIHRvIDgwJSBvZiB0aGUgZGlzayB0byBiZSBz
ZXZlcmVseSBmcmFnbWVudGVkLiBPbiBhIDUxMkdCCj4gPj4+Pj4gZGV2aWNlLCB0aGlzIGxhcmdl
IGZpbGUgbWF5IGdlbmVyYXRlIGEgaHVnZSB6b21iaWUgZXh0ZW50IHRyZWUuCj4gPj4+Pj4KPiA+
Pj4+PiBXaGVuIHN5c3RlbSBzaHV0dGluZyBkb3duLCB0aGUgaW5pdCBwcm9jZXNzIG5lZWRzIHRv
IHdhaXQgZm9yIHRoZQo+ID4+Pj4+IHdyaXRlYmFjayBwcm9jZXNzLCBhbmQgdGhlIHdyaXRlYmFj
ayBwcm9jZXNzIG1heSBlbmNvdW50ZXIgdGhlCj4gPj4+Pj4gc2l0dWF0aW9uIHdoZXJlIHRoZSBS
RUFEX0VYVEVOVF9DQUNIRSBzcGFjZSBpcyBpbnN1ZmZpY2llbnQgYW5kCj4gPj4+Pj4gbmVlZHMg
dG8gZnJlZSB0aGUgem9tYmllIGV4dGVudCB0cmVlLiBUaGUgZXh0ZW50IHRyZWUgaGFzIGEgbGFy
Z2UKPiA+Pj4+PiBudW1iZXIgb2YgZXh0ZW50IG5vZGVzLCBpdCB3aWxsIGEgbG9uZyBmcmVlIHRp
bWUgdG8gZnJlZSwgd2hpY2gKPiA+Pj4+PiB0cmlnZ2VycyBzeXN0ZW0gaGFuZy4KPiA+Pj4+ICAg
ID4gPiBUaGUgc3RhY2sgd2hlbiB0aGUgcHJvYmxlbSBvY2N1cnMgaXMgYXMgZm9sbG93czoKPiA+
Pj4+PiBjcmFzaF9hcm02ND4gYnQgMQo+ID4+Pj4+IFBJRDogMSAgICAgICAgVEFTSzogZmZmZmZm
ODA4MDFhOTIwMCAgQ1BVOiAxICAgIENPTU1BTkQ6ICJpbml0Igo+ID4+Pj4+ICAgICAjMCBbZmZm
ZmZmYzAwODA2YjlhMF0gX19zd2l0Y2hfdG8gYXQgZmZmZmZmYzAwODEwNzExYwo+ID4+Pj4+ICAg
ICAjMSBbZmZmZmZmYzAwODA2YmEwMF0gX19zY2hlZHVsZSBhdCBmZmZmZmZjMDA5N2MxYzRjCj4g
Pj4+Pj4gICAgICMyIFtmZmZmZmZjMDA4MDZiYTYwXSBzY2hlZHVsZSBhdCBmZmZmZmZjMDA5N2My
MzA4Cj4gPj4+Pj4gICAgICMzIFtmZmZmZmZjMDA4MDZiYWIwXSB3Yl93YWl0X2Zvcl9jb21wbGV0
aW9uIGF0IGZmZmZmZmMwMDg2MzIwZDQKPiA+Pj4+PiAgICAgIzQgW2ZmZmZmZmMwMDgwNmJiMjBd
IHdyaXRlYmFja19pbm9kZXNfc2IgYXQgZmZmZmZmYzAwODYzNzE5Ywo+ID4+Pj4+ICAgICAjNSBb
ZmZmZmZmYzAwODA2YmJhMF0gc3luY19maWxlc3lzdGVtIGF0IGZmZmZmZmMwMDg2M2M5OGMKPiA+
Pj4+PiAgICAgIzYgW2ZmZmZmZmMwMDgwNmJiYzBdIGYyZnNfcXVvdGFfb2ZmX3Vtb3VudCBhdCBm
ZmZmZmZjMDA4ODZmYzYwCj4gPj4+Pj4gICAgICM3IFtmZmZmZmZjMDA4MDZiYzIwXSBmMmZzX3B1
dF9zdXBlciBhdCBmZmZmZmZjMDA4ODcxNWI0Cj4gPj4+Pj4gICAgICM4IFtmZmZmZmZjMDA4MDZi
YzYwXSBnZW5lcmljX3NodXRkb3duX3N1cGVyIGF0IGZmZmZmZmMwMDg1Y2Q2MWMKPiA+Pj4+PiAg
ICAgIzkgW2ZmZmZmZmMwMDgwNmJjZDBdIGtpbGxfZjJmc19zdXBlciBhdCBmZmZmZmZjMDA4ODZi
M2RjCj4gPj4+Pj4KPiA+Pj4+PiBjcmFzaF9hcm02ND4gYnQgMTQ5OTcKPiA+Pj4+PiBQSUQ6IDE0
OTk3ICAgIFRBU0s6IGZmZmZmZjgxMTlkODI0MDAgIENQVTogMyAgICBDT01NQU5EOiAia3dvcmtl
ci91MTY6MCIKPiA+Pj4+PiAgICAgIzAgW2ZmZmZmZmMwMTlmOGI3NjBdIF9fZGV0YWNoX2V4dGVu
dF9ub2RlIGF0IGZmZmZmZmMwMDg4ZDVhNTgKPiA+Pj4+PiAgICAgIzEgW2ZmZmZmZmMwMTlmOGI3
OTBdIF9fcmVsZWFzZV9leHRlbnRfbm9kZSBhdCBmZmZmZmZjMDA4OGQ1OTcwCj4gPj4+Pj4gICAg
ICMyIFtmZmZmZmZjMDE5ZjhiODEwXSBmMmZzX3Nocmlua19leHRlbnRfdHJlZSBhdCBmZmZmZmZj
MDA4OGQ1YzdjCj4gPj4+Pj4gICAgICMzIFtmZmZmZmZjMDE5ZjhiOGEwXSBmMmZzX2JhbGFuY2Vf
ZnNfYmcgYXQgZmZmZmZmYzAwODhjMTA5Ywo+ID4+Pj4+ICAgICAjNCBbZmZmZmZmYzAxOWY4Yjkx
MF0gZjJmc193cml0ZV9ub2RlX3BhZ2VzIGF0IGZmZmZmZmMwMDg4YmQ0ZDgKPiA+Pj4+PiAgICAg
IzUgW2ZmZmZmZmMwMTlmOGI5OTBdIGRvX3dyaXRlcGFnZXMgYXQgZmZmZmZmYzAwODRhMGI1Ywo+
ID4+Pj4+ICAgICAjNiBbZmZmZmZmYzAxOWY4YjlmMF0gX193cml0ZWJhY2tfc2luZ2xlX2lub2Rl
IGF0IGZmZmZmZmMwMDg2MmVlMjgKPiA+Pj4+PiAgICAgIzcgW2ZmZmZmZmMwMTlmOGJiMzBdIHdy
aXRlYmFja19zYl9pbm9kZXMgYXQgZmZmZmZmYzAwODYzNThjMAo+ID4+Pj4+ICAgICAjOCBbZmZm
ZmZmYzAxOWY4YmMxMF0gd2Jfd3JpdGViYWNrIGF0IGZmZmZmZmMwMDg2MzYyZGMKPiA+Pj4+PiAg
ICAgIzkgW2ZmZmZmZmMwMTlmOGJjYzBdIHdiX2RvX3dyaXRlYmFjayBhdCBmZmZmZmZjMDA4NjM0
OTEwCj4gPj4+Pj4KPiA+Pj4+PiBQcm9jZXNzIDE0OTk3IHJhbiBmb3IgdG9vIGxvbmcgYW5kIGNh
dXNlZCB0aGUgc3lzdGVtIGhhbmcuCj4gPj4+Pj4KPiA+Pj4+PiBBdCB0aGlzIHRpbWUsIHRoZXJl
IGFyZSBzdGlsbCAxMDg2OTExIGV4dGVudCBub2RlcyBpbiB0aGlzIHpvbWJpZQo+ID4+Pj4+IGV4
dGVudCB0cmVlIHRoYXQgbmVlZCB0byBiZSBjbGVhbmVkIHVwLgo+ID4+Pj4+Cj4gPj4+Pj4gY3Jh
c2hfYXJtNjRfc3ByZF92OC4wLjMrKz4gZXh0ZW50X3RyZWUubm9kZV9jbnQgZmZmZmZmODA4OTZj
YzUwMAo+ID4+Pj4+ICAgICAgbm9kZV9jbnQgPSB7Cj4gPj4+Pj4gICAgICAgIGNvdW50ZXIgPSAx
MDg2OTExCj4gPj4+Pj4gICAgICB9LAo+ID4+Pj4+Cj4gPj4+Pj4gVGhlIHJvb3QgY2F1c2Ugb2Yg
dGhpcyBwcm9ibGVtIGlzIHRoYXQgd2hlbiB0aGUgZjJmc19iYWxhbmNlX2ZzCj4gPj4+Pj4gZnVu
Y3Rpb24gaXMgY2FsbGVkIGluIHRoZSB3cml0ZSBwcm9jZXNzLCBpdCB3aWxsIGRldGVybWluZQo+
ID4+Pj4+IHdoZXRoZXIgdG8gY2FsbCBmMmZzX2JhbGFuY2VfZnNfYmcsIGJ1dCBpdCBpcyBkaWZm
aWN1bHQgdG8KPiA+Pj4+PiBtZWV0IHRoZSBjb25kaXRpb24gb2YgZXhjZXNzX2NhY2hlZF9uYXRz
LiBXaGVuIHRoZQo+ID4+Pj4+IGYyZnNfc2hyaW5rX2V4dGVudF90cmVlIGZ1bmN0aW9uIGlzIGNh
bGxlZCB0byBmcmVlIGR1cmluZwo+ID4+Pj4+IGYyZnNfd3JpdGVfbm9kZV9wYWdlcywgdGhlcmUg
YXJlIHRvbyBtYW55IGV4dGVudCBub2RlcyBvbiB0aGUKPiA+Pj4+PiBleHRlbnQgdHJlZSwgd2hp
Y2ggY2F1c2VzIGEgbG9vcCBhbmQgY2F1c2VzIGEgc3lzdGVtIGhhbmcuCj4gPj4+Pj4KPiA+Pj4+
PiBUbyBzb2x2ZSB0aGlzIHByb2JsZW0sIHdoZW4gY2FsbGluZyBmMmZzX2JhbGFuY2VfZnMsIGNo
ZWNrIHdoZXRoZXIKPiA+Pj4+PiB0aGUgZXh0ZW50IGNhY2hlIGlzIHN1ZmZpY2llbnQuIElmIG5v
dCwgcmVsZWFzZSB0aGUgem9tYmllIGV4dGVudAo+ID4+Pj4+IHRyZWUuCj4gPj4+Pj4KPiA+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBYaXVob25nIFdhbmcgPHhpdWhvbmcud2FuZ0B1bmlzb2MuY29tPgo+
ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4K
PiA+Pj4+PiAtLS0KPiA+Pj4+PiBUZXN0IHRoZSBwcm9ibGVtIHdpdGggdGhlIHRlbXBvcmFyeSB2
ZXJzaW9uczoKPiA+Pj4+PiBwYXRjaCBkaWQgbm90IHJlcHJvZHVjZSB0aGUgcHJvYmxlbSwgdGhl
IHBhdGNoIGlzIGFzIGZvbGxvd3M6Cj4gPj4+Pj4gQEAgLTQxNSw3ICs0MTUsNyBAQCB2b2lkIGYy
ZnNfYmFsYW5jZV9mcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgbmVlZCkKPiA+Pj4+
PiAgICAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgU1RP
UF9DUF9SRUFTT05fRkFVTFRfSU5KRUNUKTsKPiA+Pj4+Pgo+ID4+Pj4+ICAgICAgICAgICAgLyog
YmFsYW5jZV9mc19iZyBpcyBhYmxlIHRvIGJlIHBlbmRpbmcgKi8KPiA+Pj4+PiAtICAgICAgIGlm
IChuZWVkICYmIGV4Y2Vzc19jYWNoZWRfbmF0cyhzYmkpKQo+ID4+Pj4+ICsgICAgICAgaWYgKG5l
ZWQpCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgIGYyZnNfYmFsYW5jZV9mc19iZyhzYmksIGZh
bHNlKTsKPiA+Pj4+Pgo+ID4+Pj4+IC0tLQo+ID4+Pj4+ICAgICBmcy9mMmZzL3NlZ21lbnQuYyB8
IDQgKysrLQo+ID4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMg
Yi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+Pj4+IGluZGV4IDE3NjYyNTQyNzlkMi4uMzkwYmVjMTc3
NTY3IDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+Pj4gKysrIGIv
ZnMvZjJmcy9zZWdtZW50LmMKPiA+Pj4+PiBAQCAtNDE1LDcgKzQxNSw5IEBAIHZvaWQgZjJmc19i
YWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVkKQo+ID4+Pj4+ICAg
ICAgICAgICAgICAgICBmMmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLCBTVE9QX0NQX1JF
QVNPTl9GQVVMVF9JTkpFQ1QpOwo+ID4+Pj4+Cj4gPj4+Pj4gICAgICAgICAvKiBiYWxhbmNlX2Zz
X2JnIGlzIGFibGUgdG8gYmUgcGVuZGluZyAqLwo+ID4+Pj4+IC0gICAgIGlmIChuZWVkICYmIGV4
Y2Vzc19jYWNoZWRfbmF0cyhzYmkpKQo+ID4+Pj4+ICsgICAgIGlmIChuZWVkICYmIChleGNlc3Nf
Y2FjaGVkX25hdHMoc2JpKSB8fAo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAhZjJmc19h
dmFpbGFibGVfZnJlZV9tZW1vcnkoc2JpLCBSRUFEX0VYVEVOVF9DQUNIRSkgfHwKPiA+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgIWYyZnNfYXZhaWxhYmxlX2ZyZWVfbWVtb3J5KHNiaSwgQUdF
X0VYVEVOVF9DQUNIRSkpKQo+ID4+Pj4KPiA+Pj4+IEhpLAo+ID4+Pj4KPiA+Pj4+IEkgZG91YnQg
aWYgdGhlcmUgaXMgbm8gZW5vdWdoIG1lbW9yeSwgd2UgbWF5IHN0aWxsIHJ1biBpbnRvCj4gPj4+
PiBmMmZzX3Nocmlua19leHRlbnRfdHJlZSgpIGFuZCBzdWZmZXIgc3VjaCBsb25nIHRpbWUgZGVs
YXkuCj4gPj4+Pgo+ID4+Pj4gU28sIGNhbiB3ZSBqdXN0IGxldCBfX2ZyZWVfZXh0ZW50X3RyZWUo
KSBicmVhayB0aGUgbG9vcCBvbmNlIHdlIGhhdmUKPiA+Pj4+IHJlbGVhc2VkIGVudHJpZXMgdy8g
dGFyZ2V0IG51bWJlcj8gc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+Pj4+Cj4gPj4+PiAtLS0KPiA+
Pj4+ICAgICBmcy9mMmZzL2V4dGVudF9jYWNoZS5jIHwgMTUgKysrKysrKysrKy0tLS0tCj4gPj4+
PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
Pj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZz
L2V4dGVudF9jYWNoZS5jCj4gPj4+PiBpbmRleCAwMTljMWY3YjdmYTUuLjM4YzcxYzFjNGZiNyAx
MDA2NDQKPiA+Pj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+Pj4+ICsrKyBiL2Zz
L2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+Pj4+IEBAIC0zNzksMTEgKzM3OSwxMiBAQCBzdGF0aWMg
c3RydWN0IGV4dGVudF90cmVlICpfX2dyYWJfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9k
ZSwKPiA+Pj4+ICAgICB9Cj4gPj4+Pgo+ID4+Pj4gICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19m
cmVlX2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0KQo+
ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWUg
KmV0LCB1bnNpZ25lZCBpbnQgbnJfc2hyaW5rKQo+ID4+Pj4gICAgIHsKPiA+Pj4+ICAgICAgICAg
ICBzdHJ1Y3QgcmJfbm9kZSAqbm9kZSwgKm5leHQ7Cj4gPj4+PiAgICAgICAgICAgc3RydWN0IGV4
dGVudF9ub2RlICplbjsKPiA+Pj4+ICAgICAgICAgICB1bnNpZ25lZCBpbnQgY291bnQgPSBhdG9t
aWNfcmVhZCgmZXQtPm5vZGVfY250KTsKPiA+Pj4+ICsgICAgICAgdW5zaWduZWQgaW50IGkgPSAw
Owo+ID4+Pj4KPiA+Pj4+ICAgICAgICAgICBub2RlID0gcmJfZmlyc3RfY2FjaGVkKCZldC0+cm9v
dCk7Cj4gPj4+PiAgICAgICAgICAgd2hpbGUgKG5vZGUpIHsKPiA+Pj4+IEBAIC0zOTEsNiArMzky
LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLAo+ID4+Pj4gICAgICAgICAgICAgICAgICAgZW4gPSByYl9lbnRyeShub2Rl
LCBzdHJ1Y3QgZXh0ZW50X25vZGUsIHJiX25vZGUpOwo+ID4+Pj4gICAgICAgICAgICAgICAgICAg
X19yZWxlYXNlX2V4dGVudF9ub2RlKHNiaSwgZXQsIGVuKTsKPiA+Pj4+ICAgICAgICAgICAgICAg
ICAgIG5vZGUgPSBuZXh0Owo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAgICAgICAgICAgIGlmIChucl9z
aHJpbmsgJiYgKytpID49IG5yX3NocmluaykKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4+Pj4gICAgICAgICAgIH0KPiA+Pj4+Cj4gPj4+PiAgICAgICAgICAgcmV0dXJu
IGNvdW50IC0gYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCk7Cj4gPj4+PiBAQCAtNzYxLDcgKzc2
NSw3IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsCj4gPj4+PiAgICAgICAgICAgfQo+ID4+Pj4KPiA+Pj4+ICAgICAgICAgICBpZiAo
aXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX05PX0VYVEVOVCkpCj4gPj4+PiAtICAgICAgICAg
ICAgICAgX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ID4+Pj4gKyAgICAgICAgICAgICAg
IF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0LCAwKTsKPiA+Pj4+Cj4gPj4+PiAgICAgICAgICAg
aWYgKGV0LT5sYXJnZXN0X3VwZGF0ZWQpIHsKPiA+Pj4+ICAgICAgICAgICAgICAgICAgIGV0LT5s
YXJnZXN0X3VwZGF0ZWQgPSBmYWxzZTsKPiA+Pj4+IEBAIC05NDIsNyArOTQ2LDggQEAgc3RhdGlj
IHVuc2lnbmVkIGludCBfX3Nocmlua19leHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksIGludCBucl9zaHJpbmsKPiA+Pj4+ICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUoZXQsIG5leHQsICZldGktPnpvbWJpZV9saXN0LCBsaXN0KSB7Cj4gPj4+PiAgICAgICAgICAg
ICAgICAgICBpZiAoYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkpIHsKPiA+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+ID4+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgbm9kZV9jbnQgKz0gX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+
ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbm9kZV9jbnQgKz0gX19mcmVlX2V4dGVudF90
cmVlKHNiaSwgZXQsCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbnJfc2hyaW5rIC0gbm9kZV9jbnQgLSB0cmVlX2NudCk7Cj4gPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+ID4+Pj4gICAgICAgICAgICAg
ICAgICAgfQo+ID4+Pj4gICAgICAgICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCBhdG9taWNf
cmVhZCgmZXQtPm5vZGVfY250KSk7Cj4gPj4+PiBAQCAtMTA5NSw3ICsxMTAwLDcgQEAgc3RhdGlj
IHVuc2lnbmVkIGludCBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoc3RydWN0IGlub2RlICppbm9kZSwK
PiA+Pj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4+Pj4KPiA+Pj4+ICAgICAgICAg
ICB3cml0ZV9sb2NrKCZldC0+bG9jayk7Cj4gPj4+PiAtICAgICAgIG5vZGVfY250ID0gX19mcmVl
X2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ID4+Pj4gKyAgICAgICBub2RlX2NudCA9IF9fZnJlZV9l
eHRlbnRfdHJlZShzYmksIGV0LCAwKTsKPiA+Pj4+ICAgICAgICAgICB3cml0ZV91bmxvY2soJmV0
LT5sb2NrKTsKPiA+Pj4+Cj4gPj4+PiAgICAgICAgICAgcmV0dXJuIG5vZGVfY250Owo+ID4+Pj4g
QEAgLTExMTcsNyArMTEyMiw3IEBAIHN0YXRpYyB2b2lkIF9fZHJvcF9leHRlbnRfdHJlZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBlbnVtIGV4dGVudF90eXBlIHR5cGUpCj4gPj4+PiAgICAgICAgICAg
ICAgICAgICByZXR1cm47Cj4gPj4+Pgo+ID4+Pj4gICAgICAgICAgIHdyaXRlX2xvY2soJmV0LT5s
b2NrKTsKPiA+Pj4+IC0gICAgICAgX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ID4+Pj4g
KyAgICAgICBfX2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBldCwgMCk7Cj4gPj4+PiAgICAgICAgICAg
aWYgKHR5cGUgPT0gRVhfUkVBRCkgewo+ID4+Pj4gICAgICAgICAgICAgICAgICAgc2V0X2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7Cj4gPj4+PiAgICAgICAgICAgICAgICAgICBpZiAo
ZXQtPmxhcmdlc3QubGVuKSB7Cj4gPj4+PiAtLQo+ID4+Pj4gMi40MC4xCj4gPj4+Pgo+ID4+Pj4g
VGhhbmtzLAo+ID4+Pj4KPiA+Pj4+PiAgICAgICAgICAgICAgICAgZjJmc19iYWxhbmNlX2ZzX2Jn
KHNiaSwgZmFsc2UpOwo+ID4+Pj4+Cj4gPj4+Pj4gICAgICAgICBpZiAoIWYyZnNfaXNfY2hlY2tw
b2ludF9yZWFkeShzYmkpKQo+ID4+Pj4KPiA+Pj4KPiA+Pj4KPiA+Pj4gSGkgY2hhbywKPiA+Pj4K
PiA+Pj4gV2UgaGF2ZSBhbHNvIGNvbnNpZGVyZWQgdGhpcyBhcHByb2FjaCwgYnV0IHRoZSBwcm9i
bGVtIHN0aWxsIG9jY3Vycwo+ID4+PiBhZnRlciByZXRlc3RpbmcuCj4gPj4+IDEuIFRoZSBwcm9i
bGVtIHN0aWxsIG9jY3VycyBpbiB0aGUgZm9sbG93aW5nIGNhbGwgb2YgdGhlIHVubW91bnQgZGF0
YSBwcm9jZXNzLgo+ID4+PiBmMmZzX3B1dF9zdXBlciAtPiBmMmZzX2xlYXZlX3Nocmlua2VyCj4g
Pj4KPiA+PiBZZXMsIEkgZ3Vlc3Mgd2UgbmVlZCB0byBmaXggdGhpcyBwYXRoIGFzIHdlbGwsIGhv
d2V2ZXIsIHlvdXIgcGF0Y2ggZGlkbid0Cj4gPj4gY292ZXIgdGhpcyBwYXRoIGFzIHdlbGwsIGFt
IEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gPiBEZWFyIENoYW8sCj4gPiBUaGlzIHBhdGNoIHZlcnNp
b24gYWltICB0byBzaHJpbmsgZXh0ZW50IGNhY2hlIGFzIGVhcmx5IGFzIHBvc3NpYmxlIG9uCj4g
PiB0aGUgICJhbGwgd3JpdGUgcGF0aCIKPiA+IGJ5ICJ3cml0ZSBhY3Rpb24iIC0+IGYyZnNfYmFs
YW5jZV9mcyAtPiBmMmZzX2JhbGFuY2VfZnNfYmcKPgo+IFpoaWd1bywgdGhhbmtzIGZvciBleHBs
YWluaW5nIGFnYWluLgo+CkRlYXIgQ2hhbywKPiBIb3dldmVyLCBJIGRvdWJ0IGNvdmVyaW5nIGFs
bCB3cml0ZSBwYXRocyBpcyBub3QgZW5vdWdoLCBiZWNhdXNlIGV4dGVudAo+IG5vZGUgY2FuIGlu
Y3JlYXNlIHdoZW4gZjJmc19wcmVjYWNoZV9leHRlbnRzKCkgd2FzIGNhbGxlZCBmcm9tIHBhdGhz
Cj4gaW5jbHVkaW5nIGZhZHZpc2UvZmllbWFwL3N3YXBvbi9pb2NfcHJlY2FjaGVfZXh0ZW50cywg
YW5kIHRoZXJlIG1heSBiZQo+IG5vIHdyaXRlYmFjaywgc28gd2UgbWF5IGdldCBubyBjaGFuY2Ug
dG8gY2FsbCBpbnRvIGYyZnNfYmFsYW5jZV9mc19iZygpLAo+IGUuZy4gdGhlcmUgaXMgbm8gZGF0
YSB1cGRhdGUgaW4gbW91bnRwb2ludCwgb3IgbW91bnRwb2ludCBpcyByZWFkb25seS4KeWVzLCBJ
bmRlZWQgaXQgaXMuCj4KPiA+IEFzIHRoZSBjb21tZW50ICwgdGhlICJleGNlc3NfY2FjaGVkX25h
dHMiIGlzIGRpZmZpY3VsdCB0byBhY2hpZXZlIGluCj4gPiB0aGlzIHNjZW5hcmlvLCBhbmQKPgo+
IEFub3RoZXIgY29uY2VybiBpcywgaW4gaGlnaC1lbmQgcHJvZHVjdHMgdy8gbW9yZSBtZW1vcnks
IGl0IG1heSBoYXMgbGVzcwo+IGNoYW5jZSB0byBoaXQgbmV3bHkgYWRkZWQgY29uZGl0aW9uIGlu
IGYyZnNfYmFsYW5jZV9mcygpPyBub3Qgc3VyZSB0aG91Z2guCkkgYWxzbyBhZ3JlZSB3aXRoIHRo
aXMuClRoZXJlIGlzIG5vIG90aGVyIGJldHRlciBpZGVhIGZvciBtZSheXikgZXhjcGV0aW9uIGZv
ciB0aGUgdHdvIG1ldGhvZHMKd2UgZGlzY3Vzc2VkIGFib3ZlLgphbnkgZ29vZCBzdWdnZXN0aW9u
cyA/IF5eCnRoYW5rc++8gQo+Cj4gKyAgICAgaWYgKG5lZWQgJiYgKGV4Y2Vzc19jYWNoZWRfbmF0
cyhzYmkpIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICFmMmZzX2F2YWlsYWJsZV9mcmVlX21l
bW9yeShzYmksIFJFQURfRVhURU5UX0NBQ0hFKSB8fAo+ICsgICAgICAgICAgICAgICAgICAgICAh
ZjJmc19hdmFpbGFibGVfZnJlZV9tZW1vcnkoc2JpLCBBR0VfRVhURU5UX0NBQ0hFKSkpCj4KPiBJ
IG1lYW4gd2lsbCBmMmZzX2F2YWlsYWJsZV9mcmVlX21lbW9yeShzYmksIHtSRUFELEFHRX1fRVhU
RU5UX0NBQ0hFKQo+IHJldHVybiB0cnVlIGlmIGF2YWlsYWJsZSBtZW1vcnkgaXMgc3VmZmljaWVu
dD8KPgo+IFRoYW5rcywKPgo+ID4gdHJpZ2dlciB0aGUgaXNzdWUgaW4gcGF0aCBmMmZzX3dyaXRl
X25vZGVfcGFnZXMtPmYyZnNfYmFsYW5jZV9mc19iZyhpcwo+ID4gY2FsbGVkIGRpcmVjdGx5IGhl
cmUpLgo+ID4gQXQgdGhhdCB0aW1lLCB0aGVyZSB3ZXJlIGFscmVhZHkgYSBsb3Qgb2YgZXh0ZW50
IG5vZGUgY250Lgo+ID4gVGhhbmtzIQo+ID4+Cj4gPj4+IDIuIFdyaXRpbmcgYmFjayB0aGUgaW5v
ZGUgaW4gdGhlIG5vcm1hbCB3cml0ZS1iYWNrIHByb2Nlc3Mgd2lsbAo+ID4+PiByZWxlYXNlIHRo
ZSBleHRlbnQgY2FjaGUsIGFuZCB0aGUgcHJvYmxlbSBzdGlsbCBvY2N1cnMuIFRoZSBzdGFjayBp
cwo+ID4+PiBhcyBmb2xsb3dzOgo+ID4+Cj4gPj4gRGl0dG8sCj4gPj4KPiA+PiBUaGFua3MsCj4g
Pj4KPiA+Pj4gW0ggMTAzMDk4Ljk3NDM1Nl0gYzIgWzxmZmZmZmZjMDA4YWVlOGE0Pl0gKHJiX2Vy
YXNlKzB4MjA0LzB4MzM0KQo+ID4+PiBbSCAxMDMwOTguOTc0Mzg5XSBjMiBbPGZmZmZmZmMwMDg4
ZjhmZDA+XSAoX19yZWxlYXNlX2V4dGVudF9ub2RlKzB4YzgvMHgxNjgpCj4gPj4+IFtIIDEwMzA5
OC45NzQ0MjVdIGMyIFs8ZmZmZmZmYzAwODhmYWQ3ND5dCj4gPj4+IChmMmZzX3VwZGF0ZV9leHRl
bnRfdHJlZV9yYW5nZSsweDRhMC8weDcyNCkKPiA+Pj4gW0ggMTAzMDk4Ljk3NDQ1OV0gYzIgWzxm
ZmZmZmZjMDA4OGZhOGMwPl0gKGYyZnNfdXBkYXRlX2V4dGVudF9jYWNoZSsweDE5Yy8weDFiMCkK
PiA+Pj4gW0ggMTAzMDk4Ljk3NDQ5NV0gYzIgWzxmZmZmZmZjMDA4OGVkYzcwPl0gKGYyZnNfb3V0
cGxhY2Vfd3JpdGVfZGF0YSsweDc0LzB4ZjApCj4gPj4+IFtIIDEwMzA5OC45NzQ1MjVdIGMyIFs8
ZmZmZmZmYzAwODhjYTgzND5dIChmMmZzX2RvX3dyaXRlX2RhdGFfcGFnZSsweDNlNC8weDZjOCkK
PiA+Pj4gW0ggMTAzMDk4Ljk3NDU1Ml0gYzIgWzxmZmZmZmZjMDA4OGNiMTUwPl0KPiA+Pj4gKGYy
ZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDQ3OC8weGFiMCkKPiA+Pj4gW0ggMTAzMDk4Ljk3
NDU3NF0gYzIgWzxmZmZmZmZjMDA4OGQwYmQwPl0gKGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMrMHg0
NTQvMHhhYWMpCj4gPj4+IFtIIDEwMzA5OC45NzQ1OTZdIGMyIFs8ZmZmZmZmYzAwODhkMDY5OD5d
IChfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcysweDQwYy8weDRmMCkKPiA+Pj4gW0ggMTAzMDk4Ljk3
NDYxN10gYzIgWzxmZmZmZmZjMDA4OGNjODYwPl0gKGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDMw
LzB4NDApCj4gPj4+IFtIIDEwMzA5OC45NzQ2NDVdIGMyIFs8ZmZmZmZmYzAwODRjMGUwMD5dIChk
b193cml0ZXBhZ2VzKzB4MThjLzB4M2U4KQo+ID4+PiBbSCAxMDMwOTguOTc0Njc4XSBjMiBbPGZm
ZmZmZmMwMDg2NTAzY2M+XSAoX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NDgvMHg0OTgpCj4g
Pj4+IFtIIDEwMzA5OC45NzQ3MjBdIGMyIFs8ZmZmZmZmYzAwODY1NjJjOD5dICh3cml0ZWJhY2tf
c2JfaW5vZGVzKzB4NDU0LzB4OWIwKQo+ID4+PiBbSCAxMDMwOTguOTc0NzU0XSBjMiBbPGZmZmZm
ZmMwMDg2NTVkZTg+XSAoX193cml0ZWJhY2tfaW5vZGVzX3diKzB4MTk4LzB4MjI0KQo+ID4+PiBb
SCAxMDMwOTguOTc0Nzg4XSBjMiBbPGZmZmZmZmMwMDg2NTZkMGM+XSAod2Jfd3JpdGViYWNrKzB4
MWMwLzB4Njk4KQo+ID4+PiBbSCAxMDMwOTguOTc0ODE5XSBjMiBbPGZmZmZmZmMwMDg2NTU2MTQ+
XSAod2JfZG9fd3JpdGViYWNrKzB4NDIwLzB4NTRjKQo+ID4+PiBbSCAxMDMwOTguOTc0ODUzXSBj
MiBbPGZmZmZmZmMwMDg2NTRmNTA+XSAod2Jfd29ya2ZuKzB4ZTQvMHgzODgpCj4gPj4KPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
