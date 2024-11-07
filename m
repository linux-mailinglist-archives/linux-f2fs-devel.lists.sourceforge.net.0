Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 035169C0306
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 11:54:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9098-0000PI-5M;
	Thu, 07 Nov 2024 10:53:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t9093-0000PB-39
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 10:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YCCzbTLiQ2oDAtDgKSbCRGE6KntthruPRf1RcUas84=; b=P3BuZsklQ5P3MhvlWEQmn8RI9B
 +96zUALYgxoj7VbHdRN4GSyjtNRMWiw39oEv1dNhYJZEzdShdxUuQ+e3KOghF/XsJt1HL7tTXkYWn
 BsPLA4DnUxltJGqQ9KYG1PDlqzGKN34fpjdaxBxkFhv8GgjvfpWYrJOVEq7Vg1TzRgUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YCCzbTLiQ2oDAtDgKSbCRGE6KntthruPRf1RcUas84=; b=A+/A2rbIjYjVtunAAeC/wbK+Kd
 EYjvbtT8Z1/PtFyHrkxrQLKVOT+fcFQ13BaBzbSSH6HB7fi7kOBzKspgOkTpf6WhnbiMQ2EseaR2R
 CPIJduSy7kbSrBFenKJYP9n4NrZLdYbSFFEknXoBPyQP0SXAhp+FLtN2KiAA+hJnK0Cw=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9091-00030i-7R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 10:53:44 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d4eac48d8so93296f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Nov 2024 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730976812; x=1731581612; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YCCzbTLiQ2oDAtDgKSbCRGE6KntthruPRf1RcUas84=;
 b=FARxTIp42iyK+YMzoSwvjayqclIZfXOPW4WCciqyCbLIOmSaJEQ06H4N59JEoFizZU
 KXOf74Sgm5jWGiZ8Fra2qihzTv2LeirQilXoMwyrE0E7rVcyxcu3lwBml6DnOPI9KOzy
 3stOJwIQgJvMSQUe1ioyxjK5D4HSQ1quIML8AOXNHP8vC0lOVAkUxPKWM6Pz1+NIimfq
 EzVbzDG5wSO5+SglSY5sRWWc1KrMWyOS3eOrUdorKtnrNcvp3UzdEUWiP5xzsOsMXJ4K
 BfHncvxI6R+37l8j1fceIswIGsv2FUSD2lwgplRYl4wX7pZCipXDuNtT9/rpijkKBSAD
 WYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730976812; x=1731581612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YCCzbTLiQ2oDAtDgKSbCRGE6KntthruPRf1RcUas84=;
 b=YZ46sPAeECdLd+wmbuk8TvrZ+96Xyki5pMyj3YdF8TQJFBB2YfTpiiVu+zZiY4u/Y6
 7JzpC1Y3+ZWO2esnhw1lvTW3tx+l+/14x7BzY1CQtKDdxfaEbgp278epvzYcpSDzKaOR
 4RjEunXdW31H4eZQjJ9ChfFTF4e9CB5HM4OvShW8juOtlz8XK74yjY69aRrqBpDrvChx
 VhKQlIONSmLruovKbIN2VBikmdNGlFS/VRVBpvWK3u/481Wom2C9apRWjG/vB8Gxhdf/
 SL3ZgeKwxspwnX7RwyLy/GoM/7BIYh0K5WrToLc4KJwU0kVZr761FXU7wTiy8at5zMb/
 e9cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOU4SFUMXXBTnyv+RPZHpNOm0mtRIx8OThOPDxm2Ou55GPZGCR/v9a2/J8m2i/FmCQlHEIHs+S3F1s40qCru2k@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywb/6785TGMtLkJFgdsUyFc2CvqTKNtMKFedIUN471/bT1o5uRD
 v+oPFoHJ8gwt1AxgyIGmL+RoGJ3W84ykJhWaZgCU5VBG76wXm4dwMuG/nd/hei/N0wy8aCe4B9U
 omYYjeWO9TkLdFFYbPzxcqdDspN8=
X-Google-Smtp-Source: AGHT+IFqy1rLq0P1UFv19qytl34sWeWPtaPIuOZ1YvAjLNKCcc6U9e5AnlXKZCShY22YMNGR9F0t6qkV5huxCL0lLxc=
X-Received: by 2002:a5d:64c7:0:b0:37d:4864:397f with SMTP id
 ffacd0b85a97d-381ef6a634fmr284307f8f.3.1730976811360; Thu, 07 Nov 2024
 02:53:31 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
 <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
 <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
 <CAHJ8P3L4Q4Pia66o1RQGw5NnUOVxzNgFXUPO33jtqfQ-Oc=G_g@mail.gmail.com>
 <0a8f96da-302d-4d6c-9ab6-0b66a05cbcfd@kernel.org>
 <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
 <d5ef36a3-1bcb-40a0-a963-c6d1887c4e4e@kernel.org>
 <CAHJ8P3JARkFxkyz-FLWN2PSZb2AL3=dSqF1v-SR-oU9z6tm+Rg@mail.gmail.com>
 <45cec698-2679-435b-b62a-ebe22d361955@kernel.org>
In-Reply-To: <45cec698-2679-435b-b62a-ebe22d361955@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 7 Nov 2024 18:53:20 +0800
Message-ID: <CAHJ8P3LWwA=VzKcr3nXO1uZtkc1H9dmO+5dNy247A2fGn6JHDA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月7日周四 16:22写道： > > On 2024/11/7
    14:54, Zhiguo Niu wrote: > > Chao Yu 于2024年11月7日周四 14:18写道：
    > >> > >> On 2024/11/6 16:41, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t9091-00030i-7R
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropriate length
 for fiemap
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
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg35pel5ZGo5ZubIDE2OjIy
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzcgMTQ6NTQsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDfml6Xlkajlm5sgMTQ6MTjl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNiAxNjo0MSwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJ
IDE1OjQw5YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xMS82IDE0OjA4LCBaaGlndW8g
Tml1IHdyb3RlOgo+ID4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx
5pyINuaXpeWRqOS4iSAxMDo0MOWGmemBk++8mgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAyMDI0LzEx
LzYgMTA6MjYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTA6MTblhpnpgZPvvJoKPiA+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+IE9uIDIwMjQvMTEvNSAxOTowMiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+Pj4+
Pj4+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqM
IDE4OjM55YaZ6YGT77yaCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gT24gMjAyNC8xMS81IDE1
OjI4LCBaaGlndW8gTml1IHdyb3RlOgo+ID4+Pj4+Pj4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAxNTowNOWGmemBk++8mgo+ID4+Pj4+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+Pj4+PiBPbiAyMDI0LzExLzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4+Pj4+Pj4+Pj4+IElmIHVzZXIgZ2l2ZSBhIGZpbGUgc2l6ZSBhcyAibGVuZ3RoIiBwYXJh
bWV0ZXIgZm9yIGZpZW1hcAo+ID4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMg
c2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+ID4+Pj4+Pj4+Pj4+Pj4gaXQgd2lsbCBz
aG93IDIgc2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdob2xlIGZpbGUKPiA+Pj4+
Pj4+Pj4+Pj4+IGlzIGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5nIHJl
c3VsdHM6Cj4gPj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAuL2YyZnNfaW8g
ZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4+Pj4+Pj4gRmllbWFwOiBv
ZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICBsb2dp
Y2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4+
Pj4+Pj4+Pj4+Pj4gMCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAw
MDAwMDAwMDAwNDAwMCAwMDAwMTAwMAo+ID4+Pj4+Pj4+Pj4+Pj4gMSAgICAgICAwMDAwMDAwMDAw
MDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+ID4+Pj4+
Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+IGFmdGVyIHRoaXMgcGF0Y2g6Cj4gPj4+Pj4+Pj4+Pj4+
PiAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4+Pj4+
Pj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPj4+Pj4+Pj4+Pj4+PiAgICAgICAg
ICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZs
YWdzCj4gPj4+Pj4+Pj4+Pj4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAw
MCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCj4gPj4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4+
Pj4+Pj4+Pj4+Pj4gLS0tCj4gPj4+Pj4+Pj4+Pj4+PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFj
Y29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4gPj4+Pj4+Pj4+Pj4+PiBmMmZzX2lvIGhhcyBi
ZWVuIG1vZGlmaWVkIGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAgaXMKPiA+Pj4+
Pj4+Pj4+Pj4+IHJlYWwgZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4gPj4+Pj4+Pj4+Pj4+
PiAtLS0KPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgZnMvZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+
Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4+Pj4+Pj4+Pj4+Pj4gaW5kZXggMzA2
Yjg2YjAuLjlmYzIyOWQgMTAwNjQ0Cj4gPj4+Pj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEu
Ywo+ID4+Pj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+Pj4+Pj4+Pj4+IEBA
IC0xOTY2LDggKzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwg
c3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAg
ICAgIH0KPiA+Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+PiAtICAgICBpZiAoYnl0ZXNfdG9f
Ymxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+ID4+Pj4+Pj4+Pj4+Pj4gLSAgICAgICAgICAgICBsZW4g
PSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+Pj4+Pj4+ICsgICAgIGlmIChsZW4g
JiAoYmxrc190b19ieXRlcyhpbm9kZSwgMSkgLSAxKSkKPiA+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAg
ICAgICAgbGVuID0gcm91bmRfdXAobGVuLCBibGtzX3RvX2J5dGVzKGlub2RlLCAxKSk7Cj4gPj4+
Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+IEhvdyBkbyB5b3UgdGhpbmsgb2YgZ2V0dGluZyByaWQg
b2YgYWJvdmUgYWxpZ25tZW50IGZvciBsZW4/Cj4gPj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhp
bm9kZSwgc3RhcnQpOwo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgbGFzdF9ibGsgPSBieXRl
c190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+Pj4+PiBBbmQgcm91bmQgdXAgZW5kIHBvc2l0aW9uIHcvOgo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+
Pj4+Pj4+Pj4+PiBsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHJvdW5kX3VwKHN0YXJ0
ICsgbGVuIC0gMSwgRjJGU19CTEtTSVpFKSk7Cj4gPj4+Pj4+Pj4+Pj4gSGkgQ2hhbywKPiA+Pj4+
Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+
ID4+Pj4+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0KPiA+Pj4+Pj4+Pj4+PiBpZiAoc3RhcnRfYmxrID4g
bGFzdF9ibGspCj4gPj4+Pj4+Pj4+Pj4gICAgICAgICAgIGdvdG8gb3V0Owo+ID4+Pj4+Pj4+Pj4+
IC0tLS0tLS0tLS0tLS0KPiA+Pj4+Pj4+Pj4+PiBmb3IgZXhhbXBsZSwgYSBmaWxlIHdpdGggc2l6
ZSAxOTAwNiwgYnV0IHRoZSBsZW5ndGggZnJvbSB0aGUgdXNlciBpcyAxNjM4NC4KPiA+Pj4+Pj4+
Pj4+PiBiZWZvcmUgdGhpcyBtb2RpZmljYXRpb24sICBsYXN0X2JsayA9ICBieXRlc190b19ibGtz
KGlub2RlLCBzdGFydCArCj4gPj4+Pj4+Pj4+Pj4gbGVuIC0gMSkgPSAoaW5vZGUsIDE2MzgzKSA9
IDMKPiA+Pj4+Pj4+Pj4+PiBhZnRlciB0aGUgZmlyc3QgZjJmc19tYXBfYmxvY2tzKCkuIHN0YXJ0
X2JsayBjaGFuZ2UgdG8gYmUgNCwKPiA+Pj4+Pj4+Pj4+PiBhZnRlciB0aGUgc2Vjb25kIGYyZnNf
bWFwX2Jsb2NrcygpLCBmaWVtYXBfZmlsbF9uZXhfZXh0ZW4gd2lsbCBiZQo+ID4+Pj4+Pj4+Pj4+
IGNhbGxlZCB0byBmaWxsIHVzZXIgcGFyYW1ldGVyIGFuZCB0aGVuCj4gPj4+Pj4+Pj4+Pj4gd2ls
bCBnb3RvIG91dCBiZWNhdXNlIHN0YXJ0X2JsayA+IGxhc3RfYmxrLCB0aGVuIGZpZW1hcCBmbG93
IGZpbmlzaGVzLgo+ID4+Pj4+Pj4+Pj4+IGJ1dCBhZnRlciB0aGlzIG1vZGlmaWNhdGlvbiwgbGFz
dF9ibGsgd2lsbCBiZSA0Cj4gPj4+Pj4+Pj4+Pj4gd2lsbCBkbyBmMmZzX21hcF9ibG9ja3MoKSB1
bnRpbCByZWFjaCB0aGUgbWF4X2ZpbGVfYmxvY2tzKGlub2RlKQo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+
Pj4+Pj4+IFllcywgeW91J3JlIHJpZ2h0LCBob3dldmVyLCB3LyB0aGlzIHBhdGNoLCBpdCBtYXkg
Y2hhbmdlIGxhc3RfYmxrLCBlLmcuCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4geGZzX2lvIGZp
bGUgLWMgImZpZW1hcCAtdiAwIDE5MDA2IiB2cyB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDIg
MTkwMDYiCj4gPj4+Pj4+Pj4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6IDAsIDQg
YW5kIDAsIDUuCj4gPj4+Pj4+Pj4+IEhpIENoYW8sCj4gPj4+Pj4+Pj4+IHllcywgYnV0IHcvbyB0
aGlzIHBhdGNoICwgdGhlIG9yaWdpbmFsIGNvZGUgc3RpbGwgaGFzIHRoZSBzYW1lIHNpdHVhdGlv
bj8/Cj4gPj4+Pj4+Pj4+IGZvciBleGFtcGxlCj4gPj4+Pj4+Pj4+IHhmc19pbyBmaWxlIC1jICJm
aWVtYXAgLXYgMCAxNjM4NCIgdnMgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAyIDE2Mzg0Igo+
ID4+Pj4+Pj4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6IDAsIDMgYW5kIDAsIDQu
Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBGb3IgdGhlIGNhc2UgImZpZW1hcCAtdiAyIDE5MDA2Iiwg
b2Zmc2V0IGlzIDIsIGFuZCBsZW5ndGggaXMgMTkwMDYsIHNvIGxhc3Rfb2Zmc2V0Cj4gPj4+Pj4+
Pj4gaXMgMTkwMDgsIGFuZCBsYXN0X2JsayBzaG91bGQgYmUgNCByYXRoZXIgdGhhbiA1LCByaWdo
dD8KPiA+Pj4+Pj4+IGhpIENoYW8sCj4gPj4+Pj4+PiBpdCBpcyByaWdodCB3L28gbXkgcGF0Y2gu
Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBBbmQgZm9yIHlvdSBjYXNlLCBpdCBjYWxjdWxhdGVzIGxh
c3RfYmxrIGNvcnJlY3RseS4KPiA+Pj4+Pj4+IFNvIHlvdSBzdWdnZXN0IHRoYXQgIlNob3VsZCB3
ZSByb3VuZF91cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsKPiA+Pj4+Pj4+IGNhbGN1
bGF0aW9uPyIKPiA+Pj4+Pj4KPiA+Pj4+Pj4gWmhpZ3VvLAo+ID4+Pj4+Pgo+ID4+Pj4+PiBZZXMs
IEkgdGhpbmsgYWxpZ25tZW50IG9mIGxlbiBzaG91bGQgbm90IGFmZmVjdCBjYWxjdWxhdGlvbiBv
ZiBsYXN0X2Jsay4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSBtZWFuIHRoaXMsCj4gPj4+Pj4+Cj4gPj4+
Pj4+IC0tLQo+ID4+Pj4+PiAgICAgIGZzL2YyZnMvZGF0YS5jICAgICAgICAgIHwgNiArKystLS0K
PiA+Pj4+Pj4gICAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4gPj4+Pj4+ICAg
ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4+
Pj4+Cj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5j
Cj4gPj4+Pj4+IGluZGV4IDdkMWJiOTUxOGE0MC4uY2JiYjk1NmY0MjBkIDEwMDY0NAo+ID4+Pj4+
PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4+
Pj4+PiBAQCAtMTk2NywxMiArMTk2NywxMiBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPj4+Pj4+ICAgICAgICAgICAgfQo+
ID4+Pj4+Pgo+ID4+Pj4+PiAtICAgICAgIGlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09
IDApCj4gPj4+Pj4+IC0gICAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAx
KTsKPiA+Pj4+Pj4gLQo+ID4+Pj4+PiAgICAgICAgICAgIHN0YXJ0X2JsayA9IGJ5dGVzX3RvX2Js
a3MoaW5vZGUsIHN0YXJ0KTsKPiA+Pj4+Pj4gICAgICAgICAgICBsYXN0X2JsayA9IGJ5dGVzX3Rv
X2Jsa3MoaW5vZGUsIHN0YXJ0ICsgbGVuIC0gMSk7Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICsgICAgICAg
aWYgKGxlbiAmIEYyRlNfQkxLU0laRV9NQVNLKQo+ID4+Pj4+PiArICAgICAgICAgICAgICAgbGVu
ID0gcm91bmRfdXAobGVuLCBGMkZTX0JMS1NJWkUpOwo+ID4+Pj4+PiArCj4gPj4+Pj4gSGkgQ2hh
bywKPiA+Pj4+PiB0aGlzIHZlcmlvbiB2ZXJpZnkgcGFzcyB3aXRoIG15IHRlc3QgY2FzZS4KPiA+
Pj4+Pgo+ID4+Pj4+IGJ1dCB0aGVyZSBpcyBzdGlsbCBhbm90aGVyIGlzc3VlIGluIG9yZ2luYWwg
Y29kZToKPiA+Pj4+PiB5bG9nL2FuYWx5emVyLnB5ICBzaXplID0gMTkwMzQKPiA+Pj4+PiBpZiBJ
IGlucHV0IHRoZSBmb2xsb3dpbmcgY21kKHN0YXJ0L2xlbmd0aCBhcmUgYm90aCByZWFsIHNpemUs
IG5vdCBibG9jayBudW1iZXIpCj4gPj4+Pj4gL2YyZnNfaW8gZmllbWFwIDIgMTYzODQgeWxvZy9h
bmFseXplci5weQo+ID4+Pj4+IGFuZCB0aGUgcmVzdWx0cyBzaG93czoKPiA+Pj4+PiBGaWVtYXA6
IG9mZnNldCA9IDIgbGVuID0gMTYzODQKPiA+Pj4+PiAgICAgICAgbG9naWNhbCBhZGRyLiAgICBw
aHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPiA+Pj4+PiAwICAgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMGUyZWJjYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4g
Pj4+Pj4gMSAgICAwMDAwMDAwMDAwMDA0MDAwIDAwMDAwMDBlMmViY2UwMDAgMDAwMDAwMDAwMDAw
MTAwMCAwMDAwMTAwMQo+ID4+Pj4+IHNvIHN0YXJ0X2Jsay9sYXN0X2JsayBzaG91bGQgYmUgY2Fs
Y3VsYXRlIGl0IGluIHRoZSBmb2xsb3dpbmcgd2F5Pwo+ID4+Pj4KPiA+Pj4+IElJVUMsIHRoZSBy
b290IGNhdXNlIGlzIGYyZnNfbWFwX2Jsb2NrcygpIHdpbGwgdHJ1bmNhdGUgc2l6ZSBvZgo+ID4+
Pj4gcmV0dXJuZWQgZXh0ZW50IHRvIEYyRlNfQllURVNfVE9fQkxLKGxlbiksIHNvIHdoZW5ldmVy
IHBhcmFtZXRlcgo+ID4+Pj4gQGxlbiBkb2Vzbid0IGNvdmVyIGxhc3QgZXh0ZW50LCBpdCB0cmln
Z2VycyB0aGlzIGJ1Zy4KPiA+Pj4+Cj4gPj4+PiBuZXh0Ogo+ID4+Pj4gICAgICAgICAgIG1lbXNl
dCgmbWFwLCAwLCBzaXplb2YobWFwKSk7Cj4gPj4+PiAgICAgICAgICAgbWFwLm1fbGJsayA9IHN0
YXJ0X2JsazsKPiA+Pj4+ICAgICAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JMSyhs
ZW4pOyAgLS0tIGxpbWl0IG1heCBzaXplIG9mIGV4dGVudCBpdCBmb3VuZHMKPiA+Pj4geWVzLCBJ
IHRoaW5rIHNvIHRvby4KPiA+Pj4+ICAgICAgICAgICBtYXAubV9uZXh0X3Bnb2ZzID0gJm5leHRf
cGdvZnM7Cj4gPj4+PiAgICAgICAgICAgbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwo+
ID4+Pj4gLi4uCj4gPj4+PiAgICAgICAgICAgcmV0ID0gZjJmc19tYXBfYmxvY2tzKGlub2RlLCAm
bWFwLCBGMkZTX0dFVF9CTE9DS19GSUVNQVApOwo+ID4+Pj4KPiA+Pj4+IHhmc19pbyBmaWxlIC1j
ICJmaWVtYXAgLXYgMiAxNjM4NCIKPiA+Pj4+IGZpbGU6Cj4gPj4+PiAgICAgRVhUOiBGSUxFLU9G
RlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKPiA+Pj4+ICAgICAgIDA6IFsw
Li4zMV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEwMDAKPiA+Pj4+ICAgICAg
IDE6IFszMi4uMzldOiAgICAgICAgMTM5MzA0Li4xMzkzMTEgICAgICAgOCAweDEwMDEKPiA+Pj4+
IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIKPiA+Pj4+IGZpbGU6Cj4gPj4+PiAg
ICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKPiA+
Pj4+ICAgICAgIDA6IFswLi4zMV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEw
MDAKPiA+Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NSIKPiA+Pj4+IGZpbGU6
Cj4gPj4+PiAgICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwg
RkxBR1MKPiA+Pj4+ICAgICAgIDA6IFswLi4zOV06ICAgICAgICAgMTM5MjcyLi4xMzkzMTEgICAg
ICA0MCAweDEwMDEKPiA+Pj4KPiA+Pj4gQnV0ICBJZiB0aGUgY29ycmVjdCBsYXN0X2JsayBpcyBj
YWxjdWxhdGVkIGNvcnJlY3RseSwgZmllbWFwIGNhbiBiZQo+ID4+PiBlbmRlZCBhcyBzb29uIGFz
IHBvc3NpYmxlPyAgc28gdGhlIHJlc3VsdHMgc2hvd24gaXMgYWxzbyByaWdodD8KPiA+Pgo+ID4+
IFpoaWd1bywKPiA+Pgo+ID4+IElNTywgaXQncyBub3QsIGR1ZSB0byAxKSBpZiB0aGUgZXh0ZW50
IGlzIGxhc3Qgb25lLCBGSUVNQVBfRVhURU5UX0xBU1QKPiA+PiBtdXN0IGJlIHRhZ2dlZCB0byBu
b3RpY2UgdXNlciB0aGF0IGl0IGRvZXNuJ3QgbmVlZCBmdXJ0aGVyIGZpZW1hcCBvbgo+ID4+IGxh
dHRlciBMQkEsIDIpIG9uZSBjb250aW51b3VzIGV4dGVudCBzaG91bGQgbm90IGJlIHNwbGl0IHRv
IHR3by4KPiA+Pgo+ID4+IExldCBtZSBmaWd1cmUgb3V0IGEgZml4IGZvciB0aGF0Lgo+ID4gSGkg
Q2hhbywKPiA+IE9LLCB0aGFua3MgZm9yIHlvdXIgZXhwbGFpbmF0aW9uLgo+ID4gYnR3LCBEbyBJ
IG5lZWQgdG8gdXBkYXRlIGEgcGF0Y2ggYWJvdXQgdGhlIG9yaWdpbmFsIGlzc3VlIHdlIGRpc3Nj
dXNzZWQ/Cj4gPiBvciB5b3Ugd2lsbCBtb2RpZnkgaXQgdG9nZXRoZXI/Cj4KPiBaaGlndW8sIGxl
dCBtZSBzZW5kIGEgcGF0Y2hzZXQgaW5jbHVkaW5nIHlvdXIgcGF0Y2gsIG5vdywgSSdtIHRlc3Rp
bmcgdGhpczoKSGkgQ2hhbywKSXQncyBvayBeXgo+Cj4gIEZyb20gYzY3Y2I0NzgyYTNmMTg3NTg2
NWY5YWUyNGNjZTgwYTU5NzUyZDYwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gRGF0ZTogVGh1LCA3IE5vdiAyMDI0IDE0OjUyOjE3
ICswODAwCj4gU3ViamVjdDogW1BBVENIXSBmMmZzOiBmaXggdG8gcmVxdWVyeSBleHRlbnQgd2hp
Y2ggY3Jvc3MgYm91bmRhcnkgb2YgaW5xdWlyeQo+Cj4gZGQgaWY9L2Rldi96ZXJvIG9mPWZpbGUg
YnM9NGsgY291bnQ9NQo+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPiBmaWxl
Ogo+ICAgICBFWFQ6IEZJTEUtT0ZGU0VUICAgICAgQkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFH
Uwo+ICAgICAgIDA6IFswLi4zMV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEw
MDAKPiAgICAgICAxOiBbMzIuLjM5XTogICAgICAgIDEzOTMwNC4uMTM5MzExICAgICAgIDggMHgx
MDAxCj4geGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg0Igo+IGZpbGU6Cj4gICAgIEVY
VDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4gICAgICAg
MDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4MTAwMAo+IHhmc19p
byBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NSIKPiBmaWxlOgo+ICAgICBFWFQ6IEZJTEUtT0ZG
U0VUICAgICAgQkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFHUwo+ICAgICAgIDA6IFswLi4zOV06
ICAgICAgICAgMTM5MjcyLi4xMzkzMTEgICAgICA0MCAweDEwMDEKPgo+IFRoZXJlIGFyZSB0d28g
cHJvYmxlbXM6Cj4gLSBjb250aW51b3VzIGV4dGVudCBpcyBzcGxpdCB0byB0d28KPiAtIEZJRU1B
UF9FWFRFTlRfTEFTVCBpcyBtaXNzaW5nIGluIGxhc3QgZXh0ZW50Cj4KPiBUaGUgcm9vdCBjYXVz
ZSBpczogaWYgdXBwZXIgYm91bmRhcnkgb2YgaW5xdWlyeSBjcm9zc2VzIGV4dGVudCwKPiBmMmZz
X21hcF9ibG9ja3MoKSB3aWxsIHRydW5jYXRlIGxlbmd0aCBvZiByZXR1cm5lZCBleHRlbnQgdG8K
PiBGMkZTX0JZVEVTX1RPX0JMSyhsZW4pLCBhbmQgYWxzbywgaXQgd2lsbCBzdG9wIHRvIHF1ZXJ5
IGxhdHRlcgo+IGV4dGVudCBvciBob2xlIHRvIG1ha2Ugc3VyZSBjdXJyZW50IGV4dGVudCBpcyBs
YXN0IG9yIG5vdC4KPgo+IEluIG9yZGVyIHRvIGZpeCB0aGlzIGlzc3VlLCBvbmNlIHdlIGZvdW5k
IGFuIGV4dGVudCBsb2NhdGVzCj4gaW4gdGhlIGVuZCBvZiBpbnF1aXJ5IHJhbmdlIGJ5IGYyZnNf
bWFwX2Jsb2NrcygpLCB3ZSBuZWVkIHRvCj4gZXhwYW5kIGlucXVpcnkgcmFuZ2UgdG8gcmVxdWly
eS4KPgo+IFJlcG9ydGVkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICAgZnMvZjJm
cy9kYXRhLmMgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9k
YXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGluZGV4IDY5ZjFjYjA0OTBlZS4uZWU1NjE0MzI0ZGYw
IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBA
QCAtMTg5Niw3ICsxODk2LDcgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4gICAgICAgICAgICAgICAgIHU2
NCBzdGFydCwgdTY0IGxlbikKPiAgIHsKPiAgICAgICAgIHN0cnVjdCBmMmZzX21hcF9ibG9ja3Mg
bWFwOwo+IC0gICAgICAgc2VjdG9yX3Qgc3RhcnRfYmxrLCBsYXN0X2JsazsKPiArICAgICAgIHNl
Y3Rvcl90IHN0YXJ0X2JsaywgbGFzdF9ibGssIGJsa19sZW4sIG1heF9sZW47Cj4gICAgICAgICBw
Z29mZl90IG5leHRfcGdvZnM7Cj4gICAgICAgICB1NjQgbG9naWNhbCA9IDAsIHBoeXMgPSAwLCBz
aXplID0gMDsKPiAgICAgICAgIHUzMiBmbGFncyA9IDA7Cj4gQEAgLTE5NDAsMTQgKzE5NDAsMTMg
QEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0
ZW50X2luZm8gKmZpZWluZm8sCj4KPiAgICAgICAgIHN0YXJ0X2JsayA9IEYyRlNfQllURVNfVE9f
QkxLKHN0YXJ0KTsKPiAgICAgICAgIGxhc3RfYmxrID0gRjJGU19CWVRFU19UT19CTEsoc3RhcnQg
KyBsZW4gLSAxKTsKPiAtCj4gLSAgICAgICBpZiAobGVuICYgRjJGU19CTEtTSVpFX01BU0spCj4g
LSAgICAgICAgICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgRjJGU19CTEtTSVpFKTsKPiArICAg
ICAgIGJsa19sZW4gPSBsYXN0X2JsayAtIHN0YXJ0X2JsayArIDE7Cj4gKyAgICAgICBtYXhfbGVu
ID0gRjJGU19CWVRFU19UT19CTEsobWF4Ynl0ZXMpIC0gc3RhcnRfYmxrOwo+Cj4gICBuZXh0Ogo+
ICAgICAgICAgbWVtc2V0KCZtYXAsIDAsIHNpemVvZihtYXApKTsKPiAgICAgICAgIG1hcC5tX2xi
bGsgPSBzdGFydF9ibGs7Cj4gLSAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JMSyhs
ZW4pOwo+ICsgICAgICAgbWFwLm1fbGVuID0gYmxrX2xlbjsKPiAgICAgICAgIG1hcC5tX25leHRf
cGdvZnMgPSAmbmV4dF9wZ29mczsKPiAgICAgICAgIG1hcC5tX3NlZ190eXBlID0gTk9fQ0hFQ0tf
VFlQRTsKPgo+IEBAIC0xOTcwLDYgKzE5NjksMTcgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4gICAgICAg
ICAgICAgICAgIGZsYWdzIHw9IEZJRU1BUF9FWFRFTlRfTEFTVDsKPiAgICAgICAgIH0KPgo+ICsg
ICAgICAgLyoKPiArICAgICAgICAqIGN1cnJlbnQgZXh0ZW50IG1heSBjcm9zcyBib3VuZGFyeSBv
ZiBpbnF1aXJ5LCBpbmNyZWFzZSBsZW4gdG8KPiArICAgICAgICAqIHJlcXVlcnkuCj4gKyAgICAg
ICAgKi8KPiArICAgICAgIGlmICghY29tcHJfY2x1c3RlciAmJiAobWFwLm1fZmxhZ3MgJiBGMkZT
X01BUF9NQVBQRUQpICYmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAubV9s
YmxrICsgbWFwLm1fbGVuIC0gMSA9PSBsYXN0X2JsayAmJgo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxrX2xlbiAhPSBtYXhfbGVuKSB7Cj4gKyAgICAgICAgICAgICAgIGJsa19s
ZW4gPSBtYXhfbGVuOwo+ICsgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gKyAgICAgICB9Cj4g
KwppdCBzZWVtcyBpZiB1c2VyIGlucHV0IHRoZSBsZW5naHQgd2hpY2ggaXMgbGVzcyB0aGFuIHRo
ZSBmaWxlIHNpemUsCmJ1dCByZXR1cm4gdGhlIHdob2xlIGZpZW1hcD8Kc3VjaCBhczoKIGRkIGlm
PS9kZXYvemVybyBvZj1maWxlIGJzPTRrIGNvdW50PTUKIHhmc19pbyBmaWxlIC1jICJmaWVtYXAg
LXYgMCAxNjM4NCIKd2lsbCBnZXQgZXh0ZW50IHdpdGggbGVuZ2h0ID0gMHg1MDAwPyBJcyB0aGlz
IGV4cGVjdGVkPwpPciBkaWQgSSB1bmRlcnN0YW5kIGl0IHdyb25nPwp0aGFua3MhCj4gICAgICAg
ICBjb21wcl9hcHBlbmRlZCA9IGZhbHNlOwo+ICAgICAgICAgLyogSW4gYSBjYXNlIG9mIGNvbXBy
ZXNzZWQgY2x1c3RlciwgYXBwZW5kIHRoaXMgdG8gdGhlIGxhc3QgZXh0ZW50ICovCj4gICAgICAg
ICBpZiAoY29tcHJfY2x1c3RlciAmJiAoKG1hcC5tX2ZsYWdzICYgRjJGU19NQVBfREVMQUxMT0Mp
IHx8Cj4gLS0KPiAyLjQwLjEKPgo+ID4gdGhhbmtzIQo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4g
Pj4+IHN1Y2ggYXMgdGhpcyBzcGVjaWFsIGNhc2UgInhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYg
MiAxNjM4NCIgd2UgZGlzY3Vzc2VkLgo+ID4+PiBidXQgaXQgaXMgZmluZSBmb3IgbWUgdG8ga2Vl
cCB0aGUgY3VycmVudCBjb2Rlcy4KPiA+Pj4gdGhhbmtzIQo+ID4+Pj4KPiA+Pj4+IFRob3VnaHRz
Pwo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4+Cj4gPj4+Pj4gYmVmb3JlOgo+ID4+Pj4+IHN0
YXJ0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPiA+Pj4+PiBsYXN0X2JsayA9
IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0ICsgbGVuIC0gMSk7Cj4gPj4+Pj4gYWZ0ZXI6Cj4g
Pj4+Pj4KPiA+Pj4+PiBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4g
Pj4+Pj4gbGFzdF9ibGsgPSBzdGFydF9ibGsgKyBieXRlc190b19ibGtzKGlub2RlLCBsZW4gLSAx
KTsKPiA+Pj4+PiB0aGFua3MhCj4gPj4+Pj4+ICAgICAgbmV4dDoKPiA+Pj4+Pj4gICAgICAgICAg
ICBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+ID4+Pj4+PiAgICAgICAgICAgIG1hcC5t
X2xibGsgPSBzdGFydF9ibGs7Cj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Yy
ZnNfZnMuaCBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4gPj4+Pj4+IGluZGV4IGIwYjgyMWVk
ZmQ5Ny4uOTU0ZThlODM0NGI3IDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2Yy
ZnNfZnMuaAo+ID4+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+ID4+Pj4+PiBA
QCAtMjQsMTAgKzI0LDExIEBACj4gPj4+Pj4+ICAgICAgI2RlZmluZSBORVdfQUREUiAgICAgICAg
ICAgICAgKChibG9ja190KS0xKSAgIC8qIHVzZWQgYXMgYmxvY2tfdCBhZGRyZXNzZXMgKi8KPiA+
Pj4+Pj4gICAgICAjZGVmaW5lIENPTVBSRVNTX0FERFIgICAgICAgICAoKGJsb2NrX3QpLTIpICAg
LyogdXNlZCBhcyBjb21wcmVzc2VkIGRhdGEgZmxhZyAqLwo+ID4+Pj4+Pgo+ID4+Pj4+PiArI2Rl
ZmluZSBGMkZTX0JMS1NJWkVfTUFTSyAgICAgICAgICAgICAgKEYyRlNfQkxLU0laRSAtIDEpCj4g
Pj4+Pj4+ICAgICAgI2RlZmluZSBGMkZTX0JZVEVTX1RPX0JMSyhieXRlcykgICAgICAoKGJ5dGVz
KSA+PiBGMkZTX0JMS1NJWkVfQklUUykKPiA+Pj4+Pj4gICAgICAjZGVmaW5lIEYyRlNfQkxLX1RP
X0JZVEVTKGJsaykgICAgICAgICAgICAgICAgKChibGspIDw8IEYyRlNfQkxLU0laRV9CSVRTKQo+
ID4+Pj4+PiAgICAgICNkZWZpbmUgRjJGU19CTEtfRU5EX0JZVEVTKGJsaykgICAgICAgICAgICAg
ICAoRjJGU19CTEtfVE9fQllURVMoYmxrICsgMSkgLSAxKQo+ID4+Pj4+PiAtI2RlZmluZSBGMkZT
X0JMS19BTElHTih4KSAgICAgICAgICAgICAgICAgICAgICAoRjJGU19CWVRFU19UT19CTEsoKHgp
ICsgRjJGU19CTEtTSVpFIC0gMSkpCj4gPj4+Pj4+ICsjZGVmaW5lIEYyRlNfQkxLX0FMSUdOKHgp
ICAgICAgICAgICAgICAoRjJGU19CWVRFU19UT19CTEsoKHgpICsgRjJGU19CTEtTSVpFIC0gMSkp
Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICAgICAgLyogMCwgMShub2RlIG5pZCksIDIobWV0YSBuaWQpIGFy
ZSByZXNlcnZlZCBub2RlIGlkICovCj4gPj4+Pj4+ICAgICAgI2RlZmluZSBGMkZTX1JFU0VSVkVE
X05PREVfTlVNICAgICAgICAgICAgICAgIDMKPiA+Pj4+Pj4gLS0KPiA+Pj4+Pj4gMi40MC4xCj4g
Pj4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+PiBUaGFua3MKPiA+Pj4+Pj4+Pgo+ID4+
Pj4+Pj4+IFRoYW5rcywKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBidXQgb3ZlcmFsbCBsYXN0X2Js
ayB3aWxsIGNoYW5nZSBsb29wIGNvdW50cyBidXQgaGFzIG5vdCBhZmZlY3Qgb24gdGhlIHJlc3Vs
dHMuCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gU2hvdWxkIHdlIHJvdW5kX3VwIGxlbiBhZnRl
ciBzdGFydF9ibGsgJiBsYXN0X2JsayBjYWxjdWxhdGlvbj8KPiA+Pj4+Pj4+Pj4gSSB0aGlua3Mg
aXQgaXMgb2sgLGJ1dCBqdXN0IGEgbGl0dGxlIGJpdCByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93
aW5nCj4gPj4+Pj4+Pj4+IGhhbmRsaW5nIGFib3V0IGxlbi4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+
Pj4gaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4+Pj4+Pj4gICAgICAg
ICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4g
QmFzZWQgb24gdGhlIGFib3ZlIHNpdHVhdGlvbiwKPiA+Pj4+Pj4+Pj4gZG8geW91IGhhdmUgYW55
IG90aGVyIGdvb2Qgc3VnZ2VzdGlvbnM/IF5eCj4gPj4+Pj4+Pj4+IHRoYW5rcyEKPiA+Pj4+Pj4+
Pj4KPiA+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+PiBUaGFua3MsCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+Pj4+IHRoYW5rc++8gQo+ID4+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+PiBUaGFua3MsCj4g
Pj4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pgo+ID4+
Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
