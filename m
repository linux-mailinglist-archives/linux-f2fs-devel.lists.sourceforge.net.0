Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6D90C327
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 07:36:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJRVg-0007MG-Ab;
	Tue, 18 Jun 2024 05:36:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiuhong.wang.cn@gmail.com>) id 1sJRVZ-0007Lv-2t
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 05:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kupaMZjwHwGPpq8vmv6XFER+3ZzlHwvmLFCBqj1l2ZM=; b=ABeXUFCBp1kpAriuLuJZuKxE8W
 ndUyJ2WwS3JjA8qwk6GnlGgGtGiszuCpu1W2mq6kq5fKl6Xe1Ce00CD5BoWU+JQn6mTfyqS7IDHN2
 UWvszaxeQqNXGov3cC/Iz+g30SQJO84vW+ikt1SFZO7kxyRmCKLRjf26WNe0K1B2gB+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kupaMZjwHwGPpq8vmv6XFER+3ZzlHwvmLFCBqj1l2ZM=; b=QJrCkDSYdsOeok8Vl5deA1j3IH
 WiQnNSin6ykoc2g4N4Zlh/w4076T9f3JZdzc7ZBCa8Em+3BKNF1kS96O6orKngIFkHd1jnV7dlHO1
 UIU+Fw70bD288U2ZTkBH+Js5oZ2aB1rHiv5Y7+RXLFjOk4pFCmaarIsfsXcGIfAsRUOE=;
Received: from mail-yb1-f170.google.com ([209.85.219.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJRVa-0007ZE-9c for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 05:35:54 +0000
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e026a2238d8so375895276.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Jun 2024 22:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718688943; x=1719293743; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kupaMZjwHwGPpq8vmv6XFER+3ZzlHwvmLFCBqj1l2ZM=;
 b=ZmSiAQW0jXZ5BMB1Cxn/lwcNncPco+apep2Qzm1pyuLTzWFVuL2gjOrpkEqUgQJKYm
 byMETUhzoOSJzOnLNVHMBfdw8mQyml7wzPi+V4q4nyGfYATT2qZD3q/ikaGwkuaqyWNa
 vPpABEwQEg1ZXhdteotx4Gk+VJcbMFud8RZ5ytU0aNgV9X4ygc7dEXcE3l4XinZ1Q59o
 NvAprpwtjRsmdtYpLvT/bRsrBRVdc312SnqPY0t5ur6zxCeZ4HPmNliiEtmWxZU/+cgM
 nf7vrdpuhUxvbryRZoxcmPU7WIaTt3SMCbQUQ1my9H0ugTrizYFrsK3gH66dVghVRVGt
 y9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718688943; x=1719293743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kupaMZjwHwGPpq8vmv6XFER+3ZzlHwvmLFCBqj1l2ZM=;
 b=nW6HKOlBtMfLdbGlbC6E/C6Lo6deB0TitrnE95vh8+rFOV6G13Y/kwEYzT2yB9Q3/8
 UXrwfZ27uqpkSilD4YhzubG36grlj27ilBy/FbRbr97gx477Fk3sWknRyytuOiWiCGit
 4S+Z6oRK7CJdG88dA6KKXDqmKZXUpb3xSt7bOkOKUV3Rl3fEDfcq9vCv3T9pYDcHM5C8
 bYIyvwyN2S3mlqFyedRRkI8K7F1XetXYUT3rKRSM6C7glHt7rS7rdECuygQatWWgUWjE
 WPycDM3UmP0FvfiX4r92Rf7hEsxzwcGX52Rsl8SNxETxBoLCCFAsbf757w6Zou5rb3nl
 IuUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWjZyB5QqqYQzkyF5t7cH1Yg9Sd7OjHGeNdjLeNiotuksraPgQ0a0wIQYME2soh4GG7O2rb8fyrCDQMejy1GXVb+UoJ8PTedMi7A7XOTtBJdReyfNJZw==
X-Gm-Message-State: AOJu0YyV8fubNJttujf4FIXVEyYI4Sd0tX9TDRXuS6DjJ4SeM+lkZqle
 EpehqBJmhgrfQnA/AqXR1J4WMTP1U3LaNv+nbgthprymzBcebgMv1MJTG1C4s7nr+anXKdIZVN3
 cTSWIU/Tg457aXPVysuRgPautawk=
X-Google-Smtp-Source: AGHT+IGR2+/+J1O38YjXz0DDYDuNS80270P0x3dah6/HlKP2GDmZ2LbAoCJK7EF62lLQEFx8CVZaOixf8b3pphDxiQU=
X-Received: by 2002:a25:ce8c:0:b0:e02:b548:1f06 with SMTP id
 3f1490d57ef6-e02b54820a4mr255339276.22.1718688942645; Mon, 17 Jun 2024
 22:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240617071114.150721-1-xiuhong.wang@unisoc.com>
 <04825e07-04d4-4eef-8b06-1e2329880612@kernel.org>
In-Reply-To: <04825e07-04d4-4eef-8b06-1e2329880612@kernel.org>
From: Xiuhong Wang <xiuhong.wang.cn@gmail.com>
Date: Tue, 18 Jun 2024 13:35:31 +0800
Message-ID: <CAOsHCa0bUg3Kam_4G=aiWzQpisn7rAS3nQWMQEPWB04==Sftbw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年6月18日周二 11:04写道： > > On 2024/6/17
    15:11, Xiuhong Wang wrote: > > When using the f2fs_io tool to set_verity,
    it will fail as follows: > > unisc:/data # ./f2fs_io set_verity file > >
   FS_IOC_ENABLE_VERITY: Inappropriate [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.219.170 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.170 listed in sa-accredit.habeas.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [xiuhong.wang.cn[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.219.170 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJRVa-0007ZE-9c
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix do_set_verity ioctl fail
 issue
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0NuaciDE45pel5ZGo5LqMIDExOjA0
5YaZ6YGT77yaCgo+Cj4gT24gMjAyNC82LzE3IDE1OjExLCBYaXVob25nIFdhbmcgd3JvdGU6Cj4g
PiBXaGVuIHVzaW5nIHRoZSBmMmZzX2lvIHRvb2wgdG8gc2V0X3Zlcml0eSwgaXQgd2lsbCBmYWls
IGFzIGZvbGxvd3M6Cj4gPiB1bmlzYzovZGF0YSAjIC4vZjJmc19pbyBzZXRfdmVyaXR5IGZpbGUK
PiA+IEZTX0lPQ19FTkFCTEVfVkVSSVRZOiBJbmFwcHJvcHJpYXRlIGlvY3RsIGZvciBkZXZpY2UK
PiA+IHRoaXMgaXMgYmVjYXVzZSBjb21taXQ6IDk1YWUyNTFmZTgyOCAoImYyZnM6IGFkZCBmcy12
ZXJpdHkgc3VwcG9ydCIpLAo+ID4gdGhlIHBhc3NlZCBwYXJhbWV0ZXJzIGRvIG5vdCBtYXRjaCB0
aGUgbGF0ZXN0IGtlcm5lbCB2ZXJzaW9uLgo+ID4KPiA+IEFmdGVyIHBhdGNoOgo+ID4gdW5pc29j
Oi9kYXRhICMgLi9mMmZzX2lvIHNldF92ZXJpdHkgZmlsZQo+ID4gU2V0IGZzdmVyaXR5IGJpdCB0
byBmaWxlCj4gPiB1bmlzb2M6L2RhdGEgIyAuL2YyZnNfaW8gZ2V0ZmxhZ3MgZmlsZQo+ID4gZ2V0
IGEgZmxhZyBvbiBmaWxlIHJldD0wLCBmbGFncz12ZXJpdHkKPiA+Cj4gPiBGaXhlczogOTVhZTI1
MWZlODI4ICgiZjJmczogYWRkIGZzLXZlcml0eSBzdXBwb3J0IikKPiA+IFNpZ25lZC1vZmYtYnk6
IFhpdWhvbmcgV2FuZyA8eGl1aG9uZy53YW5nQHVuaXNvYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPiAtLS0KPiA+ICAgaW5jbHVk
ZS9hbmRyb2lkX2NvbmZpZy5oIHwgIDEgKwo+ID4gICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyAg
fCAgOSArKysrKystLS0KPiA+ICAgdG9vbHMvZjJmc19pby9mMmZzX2lvLmggIHwgMjAgKysrKysr
KysrKysrKysrKysrLS0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FuZHJvaWRfY29uZmln
LmggYi9pbmNsdWRlL2FuZHJvaWRfY29uZmlnLmgKPiA+IGluZGV4IDA1YjY4NmUuLjljOGIxNjMg
MTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2FuZHJvaWRfY29uZmlnLmgKPiA+ICsrKyBiL2luY2x1
ZGUvYW5kcm9pZF9jb25maWcuaAo+ID4gQEAgLTEzLDYgKzEzLDcgQEAKPiA+ICAgI2RlZmluZSBI
QVZFX0xJTlVYX1hBVFRSX0ggMQo+ID4gICAjZGVmaW5lIEhBVkVfTElOVVhfRlNfSCAxCj4gPiAg
ICNkZWZpbmUgSEFWRV9MSU5VWF9GSUVNQVBfSCAxCj4gPiArI2RlZmluZSBIQVZFX0xJTlVYX1ZF
UklUWV9IIDEKPiA+ICAgI2RlZmluZSBIQVZFX01OVEVOVF9IIDEKPiA+ICAgI2RlZmluZSBIQVZF
X1NURExJQl9IIDEKPiA+ICAgI2RlZmluZSBIQVZFX1NUUklOR19IIDEKPiA+IGRpZmYgLS1naXQg
YS90b29scy9mMmZzX2lvL2YyZnNfaW8uYyBiL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gPiBp
bmRleCBhN2I1OTNhLi4yNDQ3NDkwIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvZjJmc19pby9mMmZz
X2lvLmMKPiA+ICsrKyBiL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4gPiBAQCAtMTgyLDE2ICsx
ODIsMTkgQEAgc3RhdGljIHZvaWQgZG9fZnN5bmMoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25z
dCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiA+ICAgc3RhdGljIHZvaWQgZG9fc2V0X3Zlcml0eShp
bnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4gICB7
Cj4gPiAgICAgICBpbnQgcmV0LCBmZDsKPiA+ICsgICAgIHN0cnVjdCBmc3Zlcml0eV9lbmFibGVf
YXJnIGFyZ3MgPSB7LnZlcnNpb24gPSAxfTsKPiA+ICsKPiA+ICsgICAgIGFyZ3MuaGFzaF9hbGdv
cml0aG0gPSBGU19WRVJJVFlfSEFTSF9BTEdfU0hBMjU2Owo+ID4gKyAgICAgYXJncy5ibG9ja19z
aXplID0gNDA5NjsKPiA+Cj4gPiAgICAgICBpZiAoYXJnYyAhPSAyKSB7Cj4gPiAgICAgICAgICAg
ICAgIGZwdXRzKCJFeGNlc3MgYXJndW1lbnRzXG5cbiIsIHN0ZGVycik7Cj4gPiAgICAgICAgICAg
ICAgIGZwdXRzKGNtZC0+Y21kX2hlbHAsIHN0ZGVycik7Cj4gPiAgICAgICAgICAgICAgIGV4aXQo
MSk7Cj4gPiAgICAgICB9Cj4gPiArICAgICBmZCA9IG9wZW4oYXJndlsxXSwgT19SRE9OTFkpOwo+
ID4KPiA+IC0gICAgIGZkID0gb3Blbihhcmd2WzFdLCBPX1JEV1IpOwo+Cj4gSXQgbmVlZHMgd3Jp
dGUgcGVybWlzc2lvbj8KPgo+IFRoYW5rcywKPgpJZiB5b3Ugb3BlbiB0aGUgZmlsZSB3aXRoIE9f
UkRXUiwgdGhlIGZvbGxvd2luZyBlcnJvciB3aWxsIGJlIHJldHVybmVkOgp1bmlzb2M6L2RhdGEg
IyAuL2YyZnNfaW8gc2V0X3Zlcml0eSBmaWxlCkZTX0lPQ19FTkFCTEVfVkVSSVRZOiBUZXh0IGZp
bGUgYnVzeQoKL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZnN2ZXJpdHkucnN0IGhhcyB0aGUg
Zm9sbG93aW5nIGRlc2NyaXB0aW9uOgpGU19JT0NfRU5BQkxFX1ZFUklUWSBjaGVja3MgZm9yIHdy
aXRlIGFjY2VzcyB0byB0aGUgaW5vZGUuIEhvd2V2ZXIsIGl0Cm11c3QgYmUgZXhlY3V0ZWQgb24g
YW4gT19SRE9OTFkgZmlsZSBkZXNjcmlwdG9yIGFuZCBubyBwcm9jZXNzZXMgY2FuCmhhdmUgdGhl
IGZpbGUgb3BlbiBmb3Igd3JpdGluZy4gQXR0ZW1wdHMgdG8gb3BlbiB0aGUgZmlsZSBmb3Igd3Jp
dGluZwp3aGlsZSB0aGlzIGlvY3RsIGlzIGV4ZWN1dGluZyB3aWxsIGZhaWwgd2l0aCBFVFhUQlNZ
LiAoVGhpcyBpcwpuZWNlc3NhcnkgdG8gZ3VhcmFudGVlIHRoYXQgbm8gd3JpdGFibGUgZmlsZSBk
ZXNjcmlwdG9ycyB3aWxsIGV4aXN0CmFmdGVyIHZlcml0eSBpcyBlbmFibGVkLCBhbmQgdG8gZ3Vh
cmFudGVlIHRoYXQgdGhlIGZpbGUncyBjb250ZW50cyBhcmUKc3RhYmxlIHdoaWxlIHRoZSBNZXJr
bGUgdHJlZSBpcyBiZWluZyBidWlsdCBvdmVyIGl0LikKCj4gPiAtCj4gPiAtICAgICByZXQgPSBp
b2N0bChmZCwgRlNfSU9DX0VOQUJMRV9WRVJJVFkpOwo+ID4gKyAgICAgcmV0ID0gaW9jdGwoZmQs
IEZTX0lPQ19FTkFCTEVfVkVSSVRZLCAmYXJncyk7Cj4gPiAgICAgICBpZiAocmV0IDwgMCkgewo+
ID4gICAgICAgICAgICAgICBwZXJyb3IoIkZTX0lPQ19FTkFCTEVfVkVSSVRZIik7Cj4gPiAgICAg
ICAgICAgICAgIGV4aXQoMSk7Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lv
LmggYi90b29scy9mMmZzX2lvL2YyZnNfaW8uaAo+ID4gaW5kZXggYjVjODJmNS4uZTU1ZGI1ZiAx
MDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5oCj4gPiArKysgYi90b29scy9m
MmZzX2lvL2YyZnNfaW8uaAo+ID4gQEAgLTE2LDYgKzE2LDkgQEAKPiA+ICAgI2lmZGVmIEhBVkVf
TElOVVhfRlNfSAo+ID4gICAjaW5jbHVkZSA8bGludXgvZnMuaD4KPiA+ICAgI2VuZGlmCj4gPiAr
I2lmZGVmIEhBVkVfTElOVVhfVkVSSVRZX0gKPiA+ICsjaW5jbHVkZSA8bGludXgvZnN2ZXJpdHku
aD4KPiA+ICsjZW5kaWYKPiA+Cj4gPiAgICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPiA+Cj4gPiBA
QCAtMTM2LDggKzEzOSwyMSBAQCBzdHJ1Y3QgZnNjcnlwdF9nZXRfcG9saWN5X2V4X2FyZyB7Cj4g
PiAgICNkZWZpbmUgRjJGU19JT0NfR0VUX0VOQ1JZUFRJT05fUE9MSUNZICAgICAgRlNfSU9DX0dF
VF9FTkNSWVBUSU9OX1BPTElDWQo+ID4gICAjZGVmaW5lIEYyRlNfSU9DX0dFVF9FTkNSWVBUSU9O
X1BXU0FMVCAgICAgIEZTX0lPQ19HRVRfRU5DUllQVElPTl9QV1NBTFQKPiA+Cj4gPiAtI2RlZmlu
ZSBGU19JT0NfRU5BQkxFX1ZFUklUWSAgICAgICAgIF9JTygnZicsIDEzMykKPiA+IC0KPiA+ICsj
aWZuZGVmIEZTX0lPQ19FTkFCTEVfVkVSSVRZCj4gPiArI2RlZmluZSBGU19JT0NfRU5BQkxFX1ZF
UklUWSAgICBfSU9XKCdmJywgMTMzLCBzdHJ1Y3QgZnN2ZXJpdHlfZW5hYmxlX2FyZykKPiA+ICsj
ZGVmaW5lIEZTX1ZFUklUWV9IQVNIX0FMR19TSEEyNTYgICAgICAgMQo+ID4gK3N0cnVjdCBmc3Zl
cml0eV9lbmFibGVfYXJnIHsKPiA+ICsgICAgIF9fdTMyIHZlcnNpb247Cj4gPiArICAgICBfX3Uz
MiBoYXNoX2FsZ29yaXRobTsKPiA+ICsgICAgIF9fdTMyIGJsb2NrX3NpemU7Cj4gPiArICAgICBf
X3UzMiBzYWx0X3NpemU7Cj4gPiArICAgICBfX3U2NCBzYWx0X3B0cjsKPiA+ICsgICAgIF9fdTMy
IHNpZ19zaXplOwo+ID4gKyAgICAgX191MzIgX19yZXNlcnZlZDE7Cj4gPiArICAgICBfX3U2NCBz
aWdfcHRyOwo+ID4gKyAgICAgX191NjQgX19yZXNlcnZlZDJbMTFdOwo+ID4gK307Cj4gPiArI2Vu
ZGlmCj4gPiAgIC8qCj4gPiAgICAqIElub2RlIGZsYWdzCj4gPiAgICAqLwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
