Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 804689D206C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 07:47:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDI1A-0001oI-Qq;
	Tue, 19 Nov 2024 06:47:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiuhong.wang.cn@gmail.com>) id 1tDI18-0001o9-4B
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 06:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gzXLOfBKUgA5e9a3veTAkQSQWkYxhwy9U6F0HY2kLWA=; b=KubEQMUYCOI7PHa/ghci2YjgIb
 oHx1M4lEOsHfYQFj0o+8MH/VbiPpZLP+zqw+iqCPTtJe7v1pjIUOKyYfxK4eVndKArJ5mxuwpghVn
 W2FDAZ5lch+SiOzaA2+x6vf035XH5vRwpMdKfcOcRew9fYpaBu046AxbdVc7RveQgj4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gzXLOfBKUgA5e9a3veTAkQSQWkYxhwy9U6F0HY2kLWA=; b=BrHEG6PBM9uYdIOYD2cJgR6xUl
 qmEoC9isi7Qf8r9/Nym6MPy8VRZs4qs/W5otWcsKxoM2OPBdLmzYgknds9aRfSHUZwO516jBSDHAJ
 nP2SIDHmX8KOR2lVeBlY0zNsgwPvaE6uuEryGo1Xb5S7/Ass80kfJkXLtlJEwNF85O1E=;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tDI16-0004mP-J1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 06:47:17 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fb498a92f6so5897571fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 22:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731998825; x=1732603625; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzXLOfBKUgA5e9a3veTAkQSQWkYxhwy9U6F0HY2kLWA=;
 b=KOacbdUropEDfiyGpr+B61jBok4fGoYUSKHF629W3bZj0j3wDK75bnOyoegJg7BXLZ
 7MnJwpgPtUaLro/ynITkXnDaafvZ7UMRHH6UonmQOj5taf4zFp5bombjcQrb+uKKlBoK
 Dw8EJIc4Gcb/iLiSwFvnxTHV/opwHIzp7ugIBTX62kTP+zorRhN7/byLbw4k3uMB+yHg
 sJvpxG0e4MSM73b90ygXW9rZ++M44QnO1L+lOoIGqSYlUWSekHAjj+jXxKC+Fha10W7x
 YfLlu2ksAA2pXjtFlIeW6HAtOWg10en36SPCiNRVlqR73OaFqsKvB7zS+C1visPkq29p
 MQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731998825; x=1732603625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzXLOfBKUgA5e9a3veTAkQSQWkYxhwy9U6F0HY2kLWA=;
 b=sAu5/BpJ6y06JSp69LTaZd4L/m5wqhzhzqIjDFPGJt3g0+REaE/O1xVjNtl2LMB0RA
 jEBAjrEySlb2qYnN7ktBx9wLJRy6zf2FS6xXzblp6SqS+74lJgsWp/wfRCB7ykCeV39F
 xrkuECx1+1d2nG6txOZi5t9p+9ICL4jZSGT3u2XKgPB4jwXMSkoD7mlIw3TDUQPCmrU/
 QIkRNASlk2YAfo86iOgo/x/ij+h28aRbQUFXv4apZ130nvmjUBPlPSTIAiCvOpKVNP0F
 FUIs5sWzw1ShDHsZ42VLEyT8/RlaVj2Jat5zBvPwvyeFczTukLqQHS/+pIMUTW9pPbjY
 cmoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdiFmiotK8dDPLlvLF9cucXSOQUq0z5tDFCdV/gqZWDGIyq5wK9+LsTnBtz220u3uBTIrAm2XTZxfcWGw4rHNM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxiFQLqXaEIoM8oO7IBsP1zXRX19gwVibwe3d5Z+I8CEQdt7TlD
 s64jEoX2l3g3HOMGgT4ZJJuwnQDrlVyY80Mt8PN06LcrQL1zh0qCriJAl7+gSBl1InhM7d0oLfP
 fiIxDMdn82MGQUVJNQkuXbji936cuF/VT
X-Google-Smtp-Source: AGHT+IG3UO5Nof9cBem2DeXdD17KGguhYLNU97n/fIBZQRxQ5v8aTnGk1+lJLSKWUmGcxI5pCyZY5GLVghkNpKYaVug=
X-Received: by 2002:a2e:a5c7:0:b0:2fb:3c16:a44a with SMTP id
 38308e7fff4ca-2ff609258b4mr70633561fa.19.1731998824460; Mon, 18 Nov 2024
 22:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20241112110627.1314632-1-xiuhong.wang@unisoc.com>
 <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
In-Reply-To: <fb436fdb-a4eb-49cc-a730-354611e88b21@kernel.org>
From: Xiuhong Wang <xiuhong.wang.cn@gmail.com>
Date: Tue, 19 Nov 2024 14:46:53 +0800
Message-ID: <CAOsHCa1t+LeeAG2PDJ0BfYtoh_+CUmLjZcp1+dGZWR5PPfmFSQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月19日周二 14:05写道： > > On 2024/11/12
    19:06, Xiuhong Wang wrote: > > We encountered a system hang problem based
    on the following > > experiment: > > There are 17 proces [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.182 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [xiuhong.wang.cn[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.208.182 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.208.182 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tDI16-0004mP-J1
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
 jaegeuk@kernel.org, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIgxOeaXpeWRqOS6jCAxNDow
NeWGmemBk++8mgo+Cj4gT24gMjAyNC8xMS8xMiAxOTowNiwgWGl1aG9uZyBXYW5nIHdyb3RlOgo+
ID4gV2UgZW5jb3VudGVyZWQgYSBzeXN0ZW0gaGFuZyBwcm9ibGVtIGJhc2VkIG9uIHRoZSBmb2xs
b3dpbmcKPiA+IGV4cGVyaW1lbnQ6Cj4gPiBUaGVyZSBhcmUgMTcgcHJvY2Vzc2VzLCA4IG9mIHdo
aWNoIGRvIDRrIGRhdGEgcmVhZCwgd3JpdGUgYW5kCj4gPiBjb21wYXJlIHRlc3RzLCBhbmQgOCBk
byA2NGsgcmVhZCwgd3JpdGUgYW5kIGNvbXBhcmUgdGVzdHMuIEVhY2gKPiA+IHRocmVhZCB3cml0
ZXMgYSAyNTZNIGZpbGUsIGFuZCBhbm90aGVyIHRocmVhZCB3cml0ZXMgYSBsYXJnZSBmaWxlCj4g
PiB0byA4MCUgb2YgdGhlIGRpc2ssIGFuZCB0aGVuIGtlZXBzIGRvaW5nIHJlYWQgb3BlcmF0aW9u
cywgYWxsIG9mCj4gPiB3aGljaCBhcmUgZGlyZWN0IG9wZXJhdGlvbnMuIFRoaXMgd2lsbCBjYXVz
ZSB0aGUgbGFyZ2UgZmlsZSB0byBiZQo+ID4gZmlsbGVkIHRvIDgwJSBvZiB0aGUgZGlzayB0byBi
ZSBzZXZlcmVseSBmcmFnbWVudGVkLiBPbiBhIDUxMkdCCj4gPiBkZXZpY2UsIHRoaXMgbGFyZ2Ug
ZmlsZSBtYXkgZ2VuZXJhdGUgYSBodWdlIHpvbWJpZSBleHRlbnQgdHJlZS4KPiA+Cj4gPiBXaGVu
IHN5c3RlbSBzaHV0dGluZyBkb3duLCB0aGUgaW5pdCBwcm9jZXNzIG5lZWRzIHRvIHdhaXQgZm9y
IHRoZQo+ID4gd3JpdGViYWNrIHByb2Nlc3MsIGFuZCB0aGUgd3JpdGViYWNrIHByb2Nlc3MgbWF5
IGVuY291bnRlciB0aGUKPiA+IHNpdHVhdGlvbiB3aGVyZSB0aGUgUkVBRF9FWFRFTlRfQ0FDSEUg
c3BhY2UgaXMgaW5zdWZmaWNpZW50IGFuZAo+ID4gbmVlZHMgdG8gZnJlZSB0aGUgem9tYmllIGV4
dGVudCB0cmVlLiBUaGUgZXh0ZW50IHRyZWUgaGFzIGEgbGFyZ2UKPiA+IG51bWJlciBvZiBleHRl
bnQgbm9kZXMsIGl0IHdpbGwgYSBsb25nIGZyZWUgdGltZSB0byBmcmVlLCB3aGljaAo+ID4gdHJp
Z2dlcnMgc3lzdGVtIGhhbmcuCj4gID4gPiBUaGUgc3RhY2sgd2hlbiB0aGUgcHJvYmxlbSBvY2N1
cnMgaXMgYXMgZm9sbG93czoKPiA+IGNyYXNoX2FybTY0PiBidCAxCj4gPiBQSUQ6IDEgICAgICAg
IFRBU0s6IGZmZmZmZjgwODAxYTkyMDAgIENQVTogMSAgICBDT01NQU5EOiAiaW5pdCIKPiA+ICAg
IzAgW2ZmZmZmZmMwMDgwNmI5YTBdIF9fc3dpdGNoX3RvIGF0IGZmZmZmZmMwMDgxMDcxMWMKPiA+
ICAgIzEgW2ZmZmZmZmMwMDgwNmJhMDBdIF9fc2NoZWR1bGUgYXQgZmZmZmZmYzAwOTdjMWM0Ywo+
ID4gICAjMiBbZmZmZmZmYzAwODA2YmE2MF0gc2NoZWR1bGUgYXQgZmZmZmZmYzAwOTdjMjMwOAo+
ID4gICAjMyBbZmZmZmZmYzAwODA2YmFiMF0gd2Jfd2FpdF9mb3JfY29tcGxldGlvbiBhdCBmZmZm
ZmZjMDA4NjMyMGQ0Cj4gPiAgICM0IFtmZmZmZmZjMDA4MDZiYjIwXSB3cml0ZWJhY2tfaW5vZGVz
X3NiIGF0IGZmZmZmZmMwMDg2MzcxOWMKPiA+ICAgIzUgW2ZmZmZmZmMwMDgwNmJiYTBdIHN5bmNf
ZmlsZXN5c3RlbSBhdCBmZmZmZmZjMDA4NjNjOThjCj4gPiAgICM2IFtmZmZmZmZjMDA4MDZiYmMw
XSBmMmZzX3F1b3RhX29mZl91bW91bnQgYXQgZmZmZmZmYzAwODg2ZmM2MAo+ID4gICAjNyBbZmZm
ZmZmYzAwODA2YmMyMF0gZjJmc19wdXRfc3VwZXIgYXQgZmZmZmZmYzAwODg3MTViNAo+ID4gICAj
OCBbZmZmZmZmYzAwODA2YmM2MF0gZ2VuZXJpY19zaHV0ZG93bl9zdXBlciBhdCBmZmZmZmZjMDA4
NWNkNjFjCj4gPiAgICM5IFtmZmZmZmZjMDA4MDZiY2QwXSBraWxsX2YyZnNfc3VwZXIgYXQgZmZm
ZmZmYzAwODg2YjNkYwo+ID4KPiA+IGNyYXNoX2FybTY0PiBidCAxNDk5Nwo+ID4gUElEOiAxNDk5
NyAgICBUQVNLOiBmZmZmZmY4MTE5ZDgyNDAwICBDUFU6IDMgICAgQ09NTUFORDogImt3b3JrZXIv
dTE2OjAiCj4gPiAgICMwIFtmZmZmZmZjMDE5ZjhiNzYwXSBfX2RldGFjaF9leHRlbnRfbm9kZSBh
dCBmZmZmZmZjMDA4OGQ1YTU4Cj4gPiAgICMxIFtmZmZmZmZjMDE5ZjhiNzkwXSBfX3JlbGVhc2Vf
ZXh0ZW50X25vZGUgYXQgZmZmZmZmYzAwODhkNTk3MAo+ID4gICAjMiBbZmZmZmZmYzAxOWY4Yjgx
MF0gZjJmc19zaHJpbmtfZXh0ZW50X3RyZWUgYXQgZmZmZmZmYzAwODhkNWM3Ywo+ID4gICAjMyBb
ZmZmZmZmYzAxOWY4YjhhMF0gZjJmc19iYWxhbmNlX2ZzX2JnIGF0IGZmZmZmZmMwMDg4YzEwOWMK
PiA+ICAgIzQgW2ZmZmZmZmMwMTlmOGI5MTBdIGYyZnNfd3JpdGVfbm9kZV9wYWdlcyBhdCBmZmZm
ZmZjMDA4OGJkNGQ4Cj4gPiAgICM1IFtmZmZmZmZjMDE5ZjhiOTkwXSBkb193cml0ZXBhZ2VzIGF0
IGZmZmZmZmMwMDg0YTBiNWMKPiA+ICAgIzYgW2ZmZmZmZmMwMTlmOGI5ZjBdIF9fd3JpdGViYWNr
X3NpbmdsZV9pbm9kZSBhdCBmZmZmZmZjMDA4NjJlZTI4Cj4gPiAgICM3IFtmZmZmZmZjMDE5Zjhi
YjMwXSB3cml0ZWJhY2tfc2JfaW5vZGVzIGF0IGZmZmZmZmMwMDg2MzU4YzAKPiA+ICAgIzggW2Zm
ZmZmZmMwMTlmOGJjMTBdIHdiX3dyaXRlYmFjayBhdCBmZmZmZmZjMDA4NjM2MmRjCj4gPiAgICM5
IFtmZmZmZmZjMDE5ZjhiY2MwXSB3Yl9kb193cml0ZWJhY2sgYXQgZmZmZmZmYzAwODYzNDkxMAo+
ID4KPiA+IFByb2Nlc3MgMTQ5OTcgcmFuIGZvciB0b28gbG9uZyBhbmQgY2F1c2VkIHRoZSBzeXN0
ZW0gaGFuZy4KPiA+Cj4gPiBBdCB0aGlzIHRpbWUsIHRoZXJlIGFyZSBzdGlsbCAxMDg2OTExIGV4
dGVudCBub2RlcyBpbiB0aGlzIHpvbWJpZQo+ID4gZXh0ZW50IHRyZWUgdGhhdCBuZWVkIHRvIGJl
IGNsZWFuZWQgdXAuCj4gPgo+ID4gY3Jhc2hfYXJtNjRfc3ByZF92OC4wLjMrKz4gZXh0ZW50X3Ry
ZWUubm9kZV9jbnQgZmZmZmZmODA4OTZjYzUwMAo+ID4gICAgbm9kZV9jbnQgPSB7Cj4gPiAgICAg
IGNvdW50ZXIgPSAxMDg2OTExCj4gPiAgICB9LAo+ID4KPiA+IFRoZSByb290IGNhdXNlIG9mIHRo
aXMgcHJvYmxlbSBpcyB0aGF0IHdoZW4gdGhlIGYyZnNfYmFsYW5jZV9mcwo+ID4gZnVuY3Rpb24g
aXMgY2FsbGVkIGluIHRoZSB3cml0ZSBwcm9jZXNzLCBpdCB3aWxsIGRldGVybWluZQo+ID4gd2hl
dGhlciB0byBjYWxsIGYyZnNfYmFsYW5jZV9mc19iZywgYnV0IGl0IGlzIGRpZmZpY3VsdCB0bwo+
ID4gbWVldCB0aGUgY29uZGl0aW9uIG9mIGV4Y2Vzc19jYWNoZWRfbmF0cy4gV2hlbiB0aGUKPiA+
IGYyZnNfc2hyaW5rX2V4dGVudF90cmVlIGZ1bmN0aW9uIGlzIGNhbGxlZCB0byBmcmVlIGR1cmlu
Zwo+ID4gZjJmc193cml0ZV9ub2RlX3BhZ2VzLCB0aGVyZSBhcmUgdG9vIG1hbnkgZXh0ZW50IG5v
ZGVzIG9uIHRoZQo+ID4gZXh0ZW50IHRyZWUsIHdoaWNoIGNhdXNlcyBhIGxvb3AgYW5kIGNhdXNl
cyBhIHN5c3RlbSBoYW5nLgo+ID4KPiA+IFRvIHNvbHZlIHRoaXMgcHJvYmxlbSwgd2hlbiBjYWxs
aW5nIGYyZnNfYmFsYW5jZV9mcywgY2hlY2sgd2hldGhlcgo+ID4gdGhlIGV4dGVudCBjYWNoZSBp
cyBzdWZmaWNpZW50LiBJZiBub3QsIHJlbGVhc2UgdGhlIHpvbWJpZSBleHRlbnQKPiA+IHRyZWUu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWGl1aG9uZyBXYW5nIDx4aXVob25nLndhbmdAdW5pc29j
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNv
bT4KPiA+IC0tLQo+ID4gVGVzdCB0aGUgcHJvYmxlbSB3aXRoIHRoZSB0ZW1wb3JhcnkgdmVyc2lv
bnM6Cj4gPiBwYXRjaCBkaWQgbm90IHJlcHJvZHVjZSB0aGUgcHJvYmxlbSwgdGhlIHBhdGNoIGlz
IGFzIGZvbGxvd3M6Cj4gPiBAQCAtNDE1LDcgKzQxNSw3IEBAIHZvaWQgZjJmc19iYWxhbmNlX2Zz
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVkKQo+ID4gICAgICAgICAgICAgICAg
ICBmMmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLCBTVE9QX0NQX1JFQVNPTl9GQVVMVF9J
TkpFQ1QpOwo+ID4KPiA+ICAgICAgICAgIC8qIGJhbGFuY2VfZnNfYmcgaXMgYWJsZSB0byBiZSBw
ZW5kaW5nICovCj4gPiAtICAgICAgIGlmIChuZWVkICYmIGV4Y2Vzc19jYWNoZWRfbmF0cyhzYmkp
KQo+ID4gKyAgICAgICBpZiAobmVlZCkKPiA+ICAgICAgICAgICAgICAgICAgZjJmc19iYWxhbmNl
X2ZzX2JnKHNiaSwgZmFsc2UpOwo+ID4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL3NlZ21lbnQuYyB8
IDQgKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdt
ZW50LmMKPiA+IGluZGV4IDE3NjYyNTQyNzlkMi4uMzkwYmVjMTc3NTY3IDEwMDY0NAo+ID4gLS0t
IGEvZnMvZjJmcy9zZWdtZW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiBAQCAt
NDE1LDcgKzQxNSw5IEBAIHZvaWQgZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwgYm9vbCBuZWVkKQo+ID4gICAgICAgICAgICAgICBmMmZzX3N0b3BfY2hlY2twb2ludChz
YmksIGZhbHNlLCBTVE9QX0NQX1JFQVNPTl9GQVVMVF9JTkpFQ1QpOwo+ID4KPiA+ICAgICAgIC8q
IGJhbGFuY2VfZnNfYmcgaXMgYWJsZSB0byBiZSBwZW5kaW5nICovCj4gPiAtICAgICBpZiAobmVl
ZCAmJiBleGNlc3NfY2FjaGVkX25hdHMoc2JpKSkKPiA+ICsgICAgIGlmIChuZWVkICYmIChleGNl
c3NfY2FjaGVkX25hdHMoc2JpKSB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICFmMmZzX2F2
YWlsYWJsZV9mcmVlX21lbW9yeShzYmksIFJFQURfRVhURU5UX0NBQ0hFKSB8fAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICFmMmZzX2F2YWlsYWJsZV9mcmVlX21lbW9yeShzYmksIEFHRV9FWFRF
TlRfQ0FDSEUpKSkKPgo+IEhpLAo+Cj4gSSBkb3VidCBpZiB0aGVyZSBpcyBubyBlbm91Z2ggbWVt
b3J5LCB3ZSBtYXkgc3RpbGwgcnVuIGludG8KPiBmMmZzX3Nocmlua19leHRlbnRfdHJlZSgpIGFu
ZCBzdWZmZXIgc3VjaCBsb25nIHRpbWUgZGVsYXkuCj4KPiBTbywgY2FuIHdlIGp1c3QgbGV0IF9f
ZnJlZV9leHRlbnRfdHJlZSgpIGJyZWFrIHRoZSBsb29wIG9uY2Ugd2UgaGF2ZQo+IHJlbGVhc2Vk
IGVudHJpZXMgdy8gdGFyZ2V0IG51bWJlcj8gc29tZXRoaW5nIGxpa2UgdGhpczoKPgo+IC0tLQo+
ICAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDE1ICsrKysrKysrKystLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiBpbmRl
eCAwMTljMWY3YjdmYTUuLjM4YzcxYzFjNGZiNyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2V4dGVu
dF9jYWNoZS5jCj4gKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+IEBAIC0zNzksMTEgKzM3
OSwxMiBAQCBzdGF0aWMgc3RydWN0IGV4dGVudF90cmVlICpfX2dyYWJfZXh0ZW50X3RyZWUoc3Ry
dWN0IGlub2RlICppbm9kZSwKPiAgIH0KPgo+ICAgc3RhdGljIHVuc2lnbmVkIGludCBfX2ZyZWVf
ZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0KQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGV4dGVudF90cmVlICpldCwgdW5zaWduZWQg
aW50IG5yX3NocmluaykKPiAgIHsKPiAgICAgICAgIHN0cnVjdCByYl9ub2RlICpub2RlLCAqbmV4
dDsKPiAgICAgICAgIHN0cnVjdCBleHRlbnRfbm9kZSAqZW47Cj4gICAgICAgICB1bnNpZ25lZCBp
bnQgY291bnQgPSBhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KTsKPiArICAgICAgIHVuc2lnbmVk
IGludCBpID0gMDsKPgo+ICAgICAgICAgbm9kZSA9IHJiX2ZpcnN0X2NhY2hlZCgmZXQtPnJvb3Qp
Owo+ICAgICAgICAgd2hpbGUgKG5vZGUpIHsKPiBAQCAtMzkxLDYgKzM5Miw5IEBAIHN0YXRpYyB1
bnNpZ25lZCBpbnQgX19mcmVlX2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
PiAgICAgICAgICAgICAgICAgZW4gPSByYl9lbnRyeShub2RlLCBzdHJ1Y3QgZXh0ZW50X25vZGUs
IHJiX25vZGUpOwo+ICAgICAgICAgICAgICAgICBfX3JlbGVhc2VfZXh0ZW50X25vZGUoc2JpLCBl
dCwgZW4pOwo+ICAgICAgICAgICAgICAgICBub2RlID0gbmV4dDsKPiArCj4gKyAgICAgICAgICAg
ICAgIGlmIChucl9zaHJpbmsgJiYgKytpID49IG5yX3NocmluaykKPiArICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIGNvdW50IC0gYXRv
bWljX3JlYWQoJmV0LT5ub2RlX2NudCk7Cj4gQEAgLTc2MSw3ICs3NjUsNyBAQCBzdGF0aWMgdm9p
ZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ICAgICAg
ICAgfQo+Cj4gICAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX05PX0VYVEVO
VCkpCj4gLSAgICAgICAgICAgICAgIF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0KTsKPiArICAg
ICAgICAgICAgICAgX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQsIDApOwo+Cj4gICAgICAgICBp
ZiAoZXQtPmxhcmdlc3RfdXBkYXRlZCkgewo+ICAgICAgICAgICAgICAgICBldC0+bGFyZ2VzdF91
cGRhdGVkID0gZmFsc2U7Cj4gQEAgLTk0Miw3ICs5NDYsOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IF9fc2hyaW5rX2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IG5yX3No
cmluawo+ICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGV0LCBuZXh0LCAmZXRpLT56
b21iaWVfbGlzdCwgbGlzdCkgewo+ICAgICAgICAgICAgICAgICBpZiAoYXRvbWljX3JlYWQoJmV0
LT5ub2RlX2NudCkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICB3cml0ZV9sb2NrKCZldC0+
bG9jayk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgbm9kZV9jbnQgKz0gX19mcmVlX2V4dGVu
dF90cmVlKHNiaSwgZXQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5vZGVfY250ICs9IF9f
ZnJlZV9leHRlbnRfdHJlZShzYmksIGV0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBucl9zaHJpbmsgLSBub2RlX2NudCAtIHRyZWVfY250KTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB3cml0ZV91bmxvY2soJmV0LT5sb2NrKTsKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIGF0b21pY19yZWFkKCZldC0+bm9k
ZV9jbnQpKTsKPiBAQCAtMTA5NSw3ICsxMTAwLDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2Rl
c3Ryb3lfZXh0ZW50X25vZGUoc3RydWN0IGlub2RlICppbm9kZSwKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4KPiAgICAgICAgIHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPiAtICAgICAgIG5v
ZGVfY250ID0gX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ICsgICAgICAgbm9kZV9jbnQg
PSBfX2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBldCwgMCk7Cj4gICAgICAgICB3cml0ZV91bmxvY2so
JmV0LT5sb2NrKTsKPgo+ICAgICAgICAgcmV0dXJuIG5vZGVfY250Owo+IEBAIC0xMTE3LDcgKzEx
MjIsNyBAQCBzdGF0aWMgdm9pZCBfX2Ryb3BfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9k
ZSwgZW51bSBleHRlbnRfdHlwZSB0eXBlKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAg
ICAgICAgIHdyaXRlX2xvY2soJmV0LT5sb2NrKTsKPiAtICAgICAgIF9fZnJlZV9leHRlbnRfdHJl
ZShzYmksIGV0KTsKPiArICAgICAgIF9fZnJlZV9leHRlbnRfdHJlZShzYmksIGV0LCAwKTsKPiAg
ICAgICAgIGlmICh0eXBlID09IEVYX1JFQUQpIHsKPiAgICAgICAgICAgICAgICAgc2V0X2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7Cj4gICAgICAgICAgICAgICAgIGlmIChldC0+bGFy
Z2VzdC5sZW4pIHsKPiAtLQo+IDIuNDAuMQo+Cj4gVGhhbmtzLAo+Cj4gPiAgICAgICAgICAgICAg
IGYyZnNfYmFsYW5jZV9mc19iZyhzYmksIGZhbHNlKTsKPiA+Cj4gPiAgICAgICBpZiAoIWYyZnNf
aXNfY2hlY2twb2ludF9yZWFkeShzYmkpKQo+CgoKSGkgY2hhbywKCldlIGhhdmUgYWxzbyBjb25z
aWRlcmVkIHRoaXMgYXBwcm9hY2gsIGJ1dCB0aGUgcHJvYmxlbSBzdGlsbCBvY2N1cnMKYWZ0ZXIg
cmV0ZXN0aW5nLgoxLiBUaGUgcHJvYmxlbSBzdGlsbCBvY2N1cnMgaW4gdGhlIGZvbGxvd2luZyBj
YWxsIG9mIHRoZSB1bm1vdW50IGRhdGEgcHJvY2Vzcy4KZjJmc19wdXRfc3VwZXIgLT4gZjJmc19s
ZWF2ZV9zaHJpbmtlcgoyLiBXcml0aW5nIGJhY2sgdGhlIGlub2RlIGluIHRoZSBub3JtYWwgd3Jp
dGUtYmFjayBwcm9jZXNzIHdpbGwKcmVsZWFzZSB0aGUgZXh0ZW50IGNhY2hlLCBhbmQgdGhlIHBy
b2JsZW0gc3RpbGwgb2NjdXJzLiBUaGUgc3RhY2sgaXMKYXMgZm9sbG93czoKW0ggMTAzMDk4Ljk3
NDM1Nl0gYzIgWzxmZmZmZmZjMDA4YWVlOGE0Pl0gKHJiX2VyYXNlKzB4MjA0LzB4MzM0KQpbSCAx
MDMwOTguOTc0Mzg5XSBjMiBbPGZmZmZmZmMwMDg4ZjhmZDA+XSAoX19yZWxlYXNlX2V4dGVudF9u
b2RlKzB4YzgvMHgxNjgpCltIIDEwMzA5OC45NzQ0MjVdIGMyIFs8ZmZmZmZmYzAwODhmYWQ3ND5d
CihmMmZzX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSsweDRhMC8weDcyNCkKW0ggMTAzMDk4Ljk3
NDQ1OV0gYzIgWzxmZmZmZmZjMDA4OGZhOGMwPl0gKGYyZnNfdXBkYXRlX2V4dGVudF9jYWNoZSsw
eDE5Yy8weDFiMCkKW0ggMTAzMDk4Ljk3NDQ5NV0gYzIgWzxmZmZmZmZjMDA4OGVkYzcwPl0gKGYy
ZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSsweDc0LzB4ZjApCltIIDEwMzA5OC45NzQ1MjVdIGMyIFs8
ZmZmZmZmYzAwODhjYTgzND5dIChmMmZzX2RvX3dyaXRlX2RhdGFfcGFnZSsweDNlNC8weDZjOCkK
W0ggMTAzMDk4Ljk3NDU1Ml0gYzIgWzxmZmZmZmZjMDA4OGNiMTUwPl0KKGYyZnNfd3JpdGVfc2lu
Z2xlX2RhdGFfcGFnZSsweDQ3OC8weGFiMCkKW0ggMTAzMDk4Ljk3NDU3NF0gYzIgWzxmZmZmZmZj
MDA4OGQwYmQwPl0gKGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMrMHg0NTQvMHhhYWMpCltIIDEwMzA5
OC45NzQ1OTZdIGMyIFs8ZmZmZmZmYzAwODhkMDY5OD5dIChfX2YyZnNfd3JpdGVfZGF0YV9wYWdl
cysweDQwYy8weDRmMCkKW0ggMTAzMDk4Ljk3NDYxN10gYzIgWzxmZmZmZmZjMDA4OGNjODYwPl0g
KGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDMwLzB4NDApCltIIDEwMzA5OC45NzQ2NDVdIGMyIFs8
ZmZmZmZmYzAwODRjMGUwMD5dIChkb193cml0ZXBhZ2VzKzB4MThjLzB4M2U4KQpbSCAxMDMwOTgu
OTc0Njc4XSBjMiBbPGZmZmZmZmMwMDg2NTAzY2M+XSAoX193cml0ZWJhY2tfc2luZ2xlX2lub2Rl
KzB4NDgvMHg0OTgpCltIIDEwMzA5OC45NzQ3MjBdIGMyIFs8ZmZmZmZmYzAwODY1NjJjOD5dICh3
cml0ZWJhY2tfc2JfaW5vZGVzKzB4NDU0LzB4OWIwKQpbSCAxMDMwOTguOTc0NzU0XSBjMiBbPGZm
ZmZmZmMwMDg2NTVkZTg+XSAoX193cml0ZWJhY2tfaW5vZGVzX3diKzB4MTk4LzB4MjI0KQpbSCAx
MDMwOTguOTc0Nzg4XSBjMiBbPGZmZmZmZmMwMDg2NTZkMGM+XSAod2Jfd3JpdGViYWNrKzB4MWMw
LzB4Njk4KQpbSCAxMDMwOTguOTc0ODE5XSBjMiBbPGZmZmZmZmMwMDg2NTU2MTQ+XSAod2JfZG9f
d3JpdGViYWNrKzB4NDIwLzB4NTRjKQpbSCAxMDMwOTguOTc0ODUzXSBjMiBbPGZmZmZmZmMwMDg2
NTRmNTA+XSAod2Jfd29ya2ZuKzB4ZTQvMHgzODgpCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
