Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C419D96C160
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 16:56:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slrQh-0001Vv-UB;
	Wed, 04 Sep 2024 14:56:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1slrQg-0001Vp-CI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mv1qCt8F474vafEhA0DGJJgZHiK7TpJKV1L+IiHKQb0=; b=djMaKeYDaX41XICZJ9IJCMtn5J
 MXevKdA8wOoesKLhfWCaBM2bAc2lE4cAwzbErZkYv/Ed0NKC1iCzwPoXDDgsdWnSMU+3iZ6t/9V5e
 3WTCtlePLjTWX6CrpYr4XmjiX/3d9MoG/Texji2VNADCb5KJmy3p5l7OViVltkVSxo58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mv1qCt8F474vafEhA0DGJJgZHiK7TpJKV1L+IiHKQb0=; b=iiUoMQWoYXVbMfVKXgYIff8Zc6
 l8Jc5bZqbMh52FpRFr04gocJIVZ1PRYB9NC1pMcs+tjgYALSOMl7NFWhmrELpGFrnUjxvEpFQSafX
 GAdTda0BcRw1uqDX+Ok7QOIPXRAXJ47FYMitGAi1ApEoVddYI2JyTllfeCpgXKITLrRE=;
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slrQf-0007qd-KB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:56:18 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-50108b373d2so96767e0c.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Sep 2024 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725461771; x=1726066571; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mv1qCt8F474vafEhA0DGJJgZHiK7TpJKV1L+IiHKQb0=;
 b=Ik3t3uvfsNBImtRhp6IRbL0fYvOsaugw0xo4f6wB3FIrFd9yB6G6/SkJ4MFPxAqFbu
 mKJHUuAgZ0pjFn9Kg364WaJ7tqc6m9g8zcrSrnm1VBdMvASBPCI/mWgx7xyaTJPSg7RT
 WzoHFEzddf5OouTJsm4OuIDj/ZMMpH0t7VteR6JfV7RTF6gbBTbzrKnkYcAK3ltenU+J
 rFXM06mLzezLS+bWJvUFe2b+Y+nublhV4OtH6UyNK4qCqKmABqg0Mno+jKrBRM77hNYk
 YlE8i3k+ynl1WdFC4ldhwg+NPHBCr0TmQeON0JZQxmHoKx8hq16dGBRWtPx/rNSPEwQm
 4Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725461772; x=1726066572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mv1qCt8F474vafEhA0DGJJgZHiK7TpJKV1L+IiHKQb0=;
 b=O27R7twLNBwulgFTtkfuMLTk4kpYzw5QzsYK5MqJaW1DM/dTdmZJDcD3cIm5VQF8ss
 nq8X/cQfRo34Im/FBR8BLBt6Q/35gfzQiASzP8IGpmIFNwjBC8z54mF/Ig3a60Q6h6if
 V7f8Rs81PurT3trbkRTcNGYhmZbrnuMttjSY2I5odPLc9j0BM7i9vuKwT3XxLYEp8LEX
 5o2nBjuG31KANUcr/MlAEBIhFJlqW+i2Koac20UE6wGO21IGDDb0hxj3YCsN5O/CKR0K
 sBsAn2ZJZyI2HXijE22A39BaXmnKYZIQYczfpXA6tr0aezors3f54RbhCkfIJI/oermQ
 UZiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9szzngv8IVCu9kpcQPiQeSLhJbIjQRu/gYbeqWfOG5ztD9FsfpN97tyu0OamMOqAXytDCwH1M88QYk+Brk9lX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxQKxi4FYVvWZWmTICdHhHwPWQ4qy5hhb7IolJjSkoMRrePGfRC
 tN4UTCta5J5teOxtasbKPq4Wc16nEcMYaRedmC9Mb7N64ytOlovAX3dXfrDi+dN8GmqxiIMbCxT
 KFc2E+/IMM709MAksBeSduRDXGRs=
X-Google-Smtp-Source: AGHT+IGrtjk+3mFhmj//ttltf2z4auKM9vgMxHZF/o7qDRBGmpDpvLudN+B5vKtAPNnc7fxZB1w5NFa4fwwp/upJ3mA=
X-Received: by 2002:a05:6122:2902:b0:500:daf1:4b05 with SMTP id
 71dfb90a1353d-500daf16bc1mr6270711e0c.1.1725461771469; Wed, 04 Sep 2024
 07:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
 <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
 <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
 <CACOAw_zvNyD3cmMpJsidEMyrtnZYU4kR4BmE_cygroPyYoiGvA@mail.gmail.com>
 <5c7b34d8-6efa-4716-ab89-a0b7b7583cb2@kernel.org>
In-Reply-To: <5c7b34d8-6efa-4716-ab89-a0b7b7583cb2@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 4 Sep 2024 07:56:00 -0700
Message-ID: <CACOAw_w3Tn6HL9hZXFgpjpgu9ySvE_0FbTWMMBuZKgRFBYXXLA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Sep 3, 2024 at 8:35 PM Chao Yu wrote: > > On 2024/9/4
    10:52, Daeho Jeong wrote: > > On Tue, Sep 3, 2024 at 7:26 PM Chao Yu wrote:
    > >> > >> On 2024/9/4 1:07, Daeho Jeong wrote: > >>> O [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.170 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slrQf-0007qd-KB
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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

T24gVHVlLCBTZXAgMywgMjAyNCBhdCA4OjM14oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvOS80IDEwOjUyLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IE9u
IFR1ZSwgU2VwIDMsIDIwMjQgYXQgNzoyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI0LzkvNCAxOjA3LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+
Pj4gT24gTW9uLCBTZXAgMiwgMjAyNCBhdCAzOjA44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiAyMDI0LzgvMjcgNDoyMywgRGFlaG8gSmVvbmcg
d3JvdGU6Cj4gPj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4K
PiA+Pj4+Pgo+ID4+Pj4+IEtlZXAgYXRvbWljIGZpbGUgY2xlYW4gd2hpbGUgdXBkYXRpbmcgYW5k
IG1ha2UgaXQgZGlydGllZCBkdXJpbmcgY29tbWl0Cj4gPj4+Pj4gaW4gb3JkZXIgdG8gYXZvaWQg
dW5uZWNlc3NhcnkgYW5kIGV4Y2Vzc2l2ZSBpbm9kZSB1cGRhdGVzIGluIHRoZSBwcmV2aW91cwo+
ID4+Pj4+IGZpeC4KPiA+Pj4+Pgo+ID4+Pj4+IEZpeGVzOiA0YmY3ODMyMjM0NmYgKCJmMmZzOiBt
YXJrIGlub2RlIGRpcnR5IGZvciBGSV9BVE9NSUNfQ09NTUlUVEVEIGZsYWciKQo+ID4+Pj4+IFNp
Z25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Pj4g
LS0tCj4gPj4+Pj4gICAgIGZzL2YyZnMvZjJmcy5oICAgIHwgIDMgKy0tCj4gPj4+Pj4gICAgIGZz
L2YyZnMvaW5vZGUuYyAgIHwgMTAgKysrKysrLS0tLQo+ID4+Pj4+ICAgICBmcy9mMmZzL3NlZ21l
bnQuYyB8IDEwICsrKysrKysrLS0KPiA+Pj4+PiAgICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+Pj4+PiBpbmRleCA0NjViMmZkNTBjNzAu
LjVhN2Y2ZmE4YjU4NSAxMDA2NDQKPiA+Pj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4+Pj4+
ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPj4+Pj4gQEAgLTgwMSw3ICs4MDEsNyBAQCBlbnVtIHsK
PiA+Pj4+PiAgICAgICAgIEZJX0NPTVBSRVNTX1JFTEVBU0VELCAgIC8qIGNvbXByZXNzZWQgYmxv
Y2tzIHdlcmUgcmVsZWFzZWQgKi8KPiA+Pj4+PiAgICAgICAgIEZJX0FMSUdORURfV1JJVEUsICAg
ICAgIC8qIGVuYWJsZSBhbGlnbmVkIHdyaXRlICovCj4gPj4+Pj4gICAgICAgICBGSV9DT1dfRklM
RSwgICAgICAgICAgICAvKiBpbmRpY2F0ZSBDT1cgZmlsZSAqLwo+ID4+Pj4+IC0gICAgIEZJX0FU
T01JQ19DT01NSVRURUQsICAgIC8qIGluZGljYXRlIGF0b21pYyBjb21taXQgY29tcGxldGVkIGV4
Y2VwdCBkaXNrIHN5bmMgKi8KPiA+Pj4+PiArICAgICBGSV9BVE9NSUNfRElSVElFRCwgICAgICAv
KiBpbmRpY2F0ZSBhdG9taWMgZmlsZSBpcyBkaXJ0aWVkICovCj4gPj4+Pj4gICAgICAgICBGSV9B
VE9NSUNfUkVQTEFDRSwgICAgICAvKiBpbmRpY2F0ZSBhdG9taWMgcmVwbGFjZSAqLwo+ID4+Pj4+
ICAgICAgICAgRklfT1BFTkVEX0ZJTEUsICAgICAgICAgLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVl
biBvcGVuZWQgKi8KPiA+Pj4+PiAgICAgICAgIEZJX01BWCwgICAgICAgICAgICAgICAgIC8qIG1h
eCBmbGFnLCBuZXZlciBiZSB1c2VkICovCj4gPj4+Pj4gQEAgLTMwNDIsNyArMzA0Miw2IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX21hcmtfaW5vZGVfZGlydHlfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLAo+ID4+Pj4+ICAgICAgICAgY2FzZSBGSV9JTkxJTkVfRE9UUzoKPiA+Pj4+PiAgICAgICAg
IGNhc2UgRklfUElOX0ZJTEU6Cj4gPj4+Pj4gICAgICAgICBjYXNlIEZJX0NPTVBSRVNTX1JFTEVB
U0VEOgo+ID4+Pj4+IC0gICAgIGNhc2UgRklfQVRPTUlDX0NPTU1JVFRFRDoKPiA+Pj4+PiAgICAg
ICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4+
Pj4+ICAgICAgICAgfQo+ID4+Pj4+ICAgICB9Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
aW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4+Pj4+IGluZGV4IDFlYjI1MGM2YjM5Mi4uNWRk
M2U1NWQyYmUyIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+ID4+Pj4+ICsr
KyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4+Pj4+IEBAIC0zNSw2ICszNSwxMSBAQCB2b2lkIGYyZnNf
bWFya19pbm9kZV9kaXJ0eV9zeW5jKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykKPiA+
Pj4+PiAgICAgICAgIGlmIChmMmZzX2lub2RlX2RpcnRpZWQoaW5vZGUsIHN5bmMpKQo+ID4+Pj4K
PiA+Pj4+IEl0IHdpbGwgcmV0dXJuIGRpcmVjdGx5IGhlcmUgaWYgaW5vZGUgd2FzIGRpcnRpZWQs
IHNvIGl0IG1heSBtaXNzZWQgdG8gc2V0Cj4gPj4+PiBGSV9BVE9NSUNfRElSVElFRCBmbGFnPwo+
ID4+Pgo+ID4+PiBJcyBpdCBwb3NzaWJsZSBmb3IgaXQgdG8gYmUgYWxyZWFkeSBkaXJ0eSwgc2lu
Y2Ugd2UgYWxyZWFkeSBtYWRlIGl0Cj4gPj4+IGNsZWFuIHdpdGggZjJmc193cml0ZV9pbm9kZSgp
IHdoZW4gd2Ugc3RhcnRlZCB0aGUgYXRvbWljIHdyaXRlPwo+ID4+Cj4gPj4gU29tZSBpb2N0bCBp
bnRlcmZhY2VzIG1heSByYWNlIHcvIGF0b21pYyB3cml0ZT8gZS5nLiBzZXRfcGluX2ZpbGUgd29u
J3QKPiA+PiBjaGVjayBhdG9taWNfZmlsZSBzdGF0dXMsIGFuZCBtYXkgZGlydHkgaW5vZGUgYWZ0
ZXIgd2Ugc3RhcnRlZCBhdG9taWMKPiA+PiB3cml0ZSwgc28gd2UnZCBiZXR0ZXIgZGV0ZWN0IHN1
Y2ggcmFjZSBjb25kaXRpb24gYW5kIGJyZWFrIGlvY3RsIHRvCj4gPj4gYXZvaWQgcnVpbiBhdG9t
aWMgd3JpdGU/IGFuZCBtYXliZSB3ZSBjYW4gYWRkIGYyZnNfYnVnX29uKCkgaW4KPiA+PiBmMmZz
X21hcmtfaW5vZGVfZGlydHlfc3luYygpIHRvIGRldGVjdCBhbnkgb3RoZXIgbWlzc2luZyBjYXNl
cz8KPiA+Pgo+ID4KPiA+IEhvdyBhYm91dCBleGNoYW5naW5nIHRoZSBwb3NpdGlvbnMgb2YgZjJm
c193cml0ZV9pbm9kZSgpIGFuZAo+ID4gc2V0X2lub2RlX2ZsYWcoKSBpbiBmMmZzX2lvY19zdGFy
dF9hdG9taWNfd3JpdGUoKT8KPiA+Cj4gPiAuLi4KPiA+ICAgICAgICAgIGYyZnNfd3JpdGVfaW5v
ZGUoaW5vZGUsIE5VTEwpOwo+ID4KPiA+ICAgICAgICAgIHN0YXRfaW5jX2F0b21pY19pbm9kZShp
bm9kZSk7Cj4gPgo+ID4gICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19G
SUxFKTsKPiA+IC4uLgo+Cj4gT2gsIEknbSBub3Qgc3VyZSBJJ3ZlIGdvdCB5b3VyIHBvaW50LCBh
ZnRlciBleGNoYW5naW5nIHdlIHN0aWxsIG1heSBzdWZmZXIKPiBiZWxvdyByYWNlIGNvbmRpdGlv
biwgcmlnaHQ/Cj4KPiAtIGYyZnNfaW9jX3N0YXJ0X2F0b21pY193cml0ZQo+ICAgLSBzZXRfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0ZJTEUpCj4gICAtIGYyZnNfd3JpdGVfaW5vZGUoaW5v
ZGUsIE5VTEwpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJm
c19pb2Nfc2V0X3Bpbl9maWxlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9QSU5fRklMRSkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIF9fbWFya19pbm9kZV9kaXJ0eV9mbGFnKCkK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0+IFRoaXMg
YXR0ZW1wdCB3aWxsCmJlIGJsb2NrZWQgYnkgdGhlIGJlbG93IGNvbmRpdGlvbi4KCisgICAgICAg
aWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSB7CisgICAgICAgICAgICAgICBzZXRfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOworICAgICAgICAgICAgICAgcmV0dXJu
OworICAgICAgIH0KClBseiwgcmVmZXIgdG8gdGhlIGFib3ZlIGNvbW1lbnQuCgo+IC0gZjJmc19p
b2NfY29tbWl0X2F0b21pY193cml0ZQo+Cj4gU28gdGhhdCBJIHByb3Bvc2VkIGEgZml4IGZvciB0
aGlzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDA5MDQw
MzIwNDcuMTI2NDcwNi0xLWNoYW9Aa2VybmVsLm9yZwo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4+IFRo
YW5rcywKPiA+Pgo+ID4+Pgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4+Cj4gPj4+Pj4gICAg
ICAgICAgICAgICAgIHJldHVybjsKPiA+Pj4+Pgo+ID4+Pj4+ICsgICAgIGlmIChmMmZzX2lzX2F0
b21pY19maWxlKGlub2RlKSkgewo+ID4+Pj4+ICsgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWco
aW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPiA+Pj4+PiArICAgICAgICAgICAgIHJldHVybjsK
PiA+Pj4+PiArICAgICB9Cj4gPj4+Pj4gKwo+ID4+Pj4+ICAgICAgICAgbWFya19pbm9kZV9kaXJ0
eV9zeW5jKGlub2RlKTsKPiA+Pj4+PiAgICAgfQo+ID4+Pj4+Cj4gPj4+Pj4gQEAgLTY1MywxMCAr
NjU4LDcgQEAgdm9pZCBmMmZzX3VwZGF0ZV9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgcGFnZSAqbm9kZV9wYWdlKQo+ID4+Pj4+ICAgICAgICAgcmktPmlfZ2lkID0gY3B1X3RvX2xl
MzIoaV9naWRfcmVhZChpbm9kZSkpOwo+ID4+Pj4+ICAgICAgICAgcmktPmlfbGlua3MgPSBjcHVf
dG9fbGUzMihpbm9kZS0+aV9ubGluayk7Cj4gPj4+Pj4gICAgICAgICByaS0+aV9ibG9ja3MgPSBj
cHVfdG9fbGU2NChTRUNUT1JfVE9fQkxPQ0soaW5vZGUtPmlfYmxvY2tzKSArIDEpOwo+ID4+Pj4+
IC0KPiA+Pj4+PiAtICAgICBpZiAoIWYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpIHx8Cj4gPj4+
Pj4gLSAgICAgICAgICAgICAgICAgICAgIGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9N
SUNfQ09NTUlUVEVEKSkKPiA+Pj4+PiAtICAgICAgICAgICAgIHJpLT5pX3NpemUgPSBjcHVfdG9f
bGU2NChpX3NpemVfcmVhZChpbm9kZSkpOwo+ID4+Pj4+ICsgICAgIHJpLT5pX3NpemUgPSBjcHVf
dG9fbGU2NChpX3NpemVfcmVhZChpbm9kZSkpOwo+ID4+Pj4+Cj4gPj4+Pj4gICAgICAgICBpZiAo
ZXQpIHsKPiA+Pj4+PiAgICAgICAgICAgICAgICAgcmVhZF9sb2NrKCZldC0+bG9jayk7Cj4gPj4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+
Pj4+PiBpbmRleCA3OGMzMTk4YTYzMDguLjJiNTM5MWIyMjlhOCAxMDA2NDQKPiA+Pj4+PiAtLS0g
YS9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+
Pj4gQEAgLTE5Niw5ICsxOTYsMTIgQEAgdm9pZCBmMmZzX2Fib3J0X2F0b21pY193cml0ZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBib29sIGNsZWFuKQo+ID4+Pj4+ICAgICAgICAgICAgICAgICB0cnVu
Y2F0ZV9pbm9kZV9wYWdlc19maW5hbChpbm9kZS0+aV9tYXBwaW5nKTsKPiA+Pj4+Pgo+ID4+Pj4+
ICAgICAgICAgcmVsZWFzZV9hdG9taWNfd3JpdGVfY250KGlub2RlKTsKPiA+Pj4+PiAtICAgICBj
bGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKTsKPiA+Pj4+PiAgICAg
ICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19SRVBMQUNFKTsKPiA+Pj4+PiAg
ICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19GSUxFKTsKPiA+Pj4+PiAr
ICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+
ID4+Pj4+ICsgICAgICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJ
UlRJRUQpOwo+ID4+Pj4+ICsgICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMo
aW5vZGUsIHRydWUpOwo+ID4+Pj4+ICsgICAgIH0KPiA+Pj4+PiAgICAgICAgIHN0YXRfZGVjX2F0
b21pY19pbm9kZShpbm9kZSk7Cj4gPj4+Pj4KPiA+Pj4+PiAgICAgICAgIEYyRlNfSShpbm9kZSkt
PmF0b21pY193cml0ZV90YXNrID0gTlVMTDsKPiA+Pj4+PiBAQCAtMzY1LDcgKzM2OCwxMCBAQCBz
dGF0aWMgaW50IF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUp
Cj4gPj4+Pj4gICAgICAgICAgICAgICAgIHNiaS0+cmV2b2tlZF9hdG9taWNfYmxvY2sgKz0gZmkt
PmF0b21pY193cml0ZV9jbnQ7Cj4gPj4+Pj4gICAgICAgICB9IGVsc2Ugewo+ID4+Pj4+ICAgICAg
ICAgICAgICAgICBzYmktPmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0
ZV9jbnQ7Cj4gPj4+Pj4gLSAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRP
TUlDX0NPTU1JVFRFRCk7Cj4gPj4+Pj4gKyAgICAgICAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19z
ZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+ID4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gPj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0
cnVlKTsKPiA+Pj4+PiArICAgICAgICAgICAgIH0KPiA+Pj4+PiAgICAgICAgIH0KPiA+Pj4+Pgo+
ID4+Pj4+ICAgICAgICAgX19jb21wbGV0ZV9yZXZva2VfbGlzdChpbm9kZSwgJnJldm9rZV9saXN0
LCByZXQgPyB0cnVlIDogZmFsc2UpOwo+ID4+Pj4KPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
