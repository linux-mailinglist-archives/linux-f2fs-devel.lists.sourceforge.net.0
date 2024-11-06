Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85B9BDC98
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 03:26:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8VkZ-0002Ee-Bu;
	Wed, 06 Nov 2024 02:26:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8VkT-0002ET-0Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5se4QhnYbGT+lQnc5UOmh4AtqYT5NiabNGuT0E7oDrw=; b=kvH1D5xjiH5BkxYxJj/TONZv6o
 khIUWm3+vtZI/y9x2kl1iJ+NG8rYq8kNELRq65u7CpbrzVwwcL/Zs8wqSH89FeqXbf6GkQhIHhHfJ
 gvuVDZMHW6z1jd6+fAzpmwbHOqLN1yIW5ojd9PW4LHkWU/Qlbv1hPGfXkY48/LUxaVHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5se4QhnYbGT+lQnc5UOmh4AtqYT5NiabNGuT0E7oDrw=; b=aLjs1X20Nbsc6V5Hm4bDIc5Kga
 HG8cGOA0ya4l0FnhRbl8alARdZvrHxc13+zVLw7yuihXsvdCCJl6FuNqYgwKNeEMI8G0QRcGEtfqJ
 vQXMWWv/C/DwlDTNJ+0bwjf2FiH5xrMWghpyfInJavqQREDcRrx0uuoTlbvzx1huBNJo=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8VkR-0001mJ-LT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:26:20 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37d5231f71cso716886f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Nov 2024 18:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730859973; x=1731464773; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5se4QhnYbGT+lQnc5UOmh4AtqYT5NiabNGuT0E7oDrw=;
 b=PkvgbXXjBeAKfWc1daajk2LHXXF+nPUw4XAlepDAXWcNOJW8ZVdpEeSoRR87jXXriP
 xLhIoU6+VtfY2aJTltg8YWzKzariK5kTg4fQZO5CgzxhUaNGZ9ewFUYM3JNy+bOFwy5l
 QHoHahd65WBEPstG+pk7bQAdZb9X2EgtYqrbT1HXelb0GNGV1TveUmOu+746E+cyeSAS
 w5LEq5XL53MFwFJHLZayKn42iffhhPZtfkVEumycHuHLefTnlkKrDsOjRdEj/imGUMqk
 NZME/mOj3wy9UBbOpde1F26LeW+cDHJ/yEujs27MzX2/pbUsCWA2L2Wbb3eMpsAbLUoY
 2Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730859973; x=1731464773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5se4QhnYbGT+lQnc5UOmh4AtqYT5NiabNGuT0E7oDrw=;
 b=GezKCjcdiSaQN+zPJR+K2yf50QfcVQCGJmYyJj/tcyJQN7qBCRcE/FsinxHtHUju39
 l5i7bTZcaQP6kIIk/s9qQTctLnGQByMGL5R+/CEIZgV7ahlzYBPo3EKG1ZDNBlQ7qPgW
 pxYd4UPPKz0xxx+vIDkZV7kw/bXgO65zO4h+DniG1gsEFfPoFy51zWP8RPNiUG74ipLo
 hfZy9fl+0VCYZtm9nILPwvj/YBsrvcfvumGdNq5eVL8dqsNsuL6HzimCmb4zWcf9ryQW
 omeORuHugBWtW8/HEiUe8iJRhD0KKLvWVNxDYpyrjvpmBrnOZ4LhORHMRjcMN4aTK9mw
 0Plw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr+HWFMlSMwlwN4VOmm3oGgjK4g+qG8hDAqN/xdRMF9k8umwqcwdgeAobZsGllbLDZCRxoSbdH/5qJJH8oe3LS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyKnWRKcfuKqdt3Xshnd0MaxB3KOdukJeqQnK+mX+L+7TLcciBq
 ZP1GqjXnOvs3oSJ5kfTQfBveJ0uoY3TW8oUED/Il45gGdA7DYMgeHolVQB+KIXiE6+2ui+yT5rD
 6chixhjuIi4CxHwk39xlz+d5U2A0=
X-Google-Smtp-Source: AGHT+IE8irJBBqeVJcjXIVeeBwwp3gZtLUQXloXKo9UsbZiAcxnB73J9iulXQ1NZInRc4XlNtwjedXd9iQpA7AQR+UE=
X-Received: by 2002:a5d:64ef:0:b0:37d:2e83:bc44 with SMTP id
 ffacd0b85a97d-3806124a914mr12800038f8f.9.1730859972825; Tue, 05 Nov 2024
 18:26:12 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
In-Reply-To: <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 6 Nov 2024 10:26:01 +0800
Message-ID: <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月6日周三 10:16写道： > > On 2024/11/5
    19:02, Zhiguo Niu wrote: > > Chao Yu 于2024年11月5日周二 18:39写道：
    > >> > >> On 2024/11/5 15:28, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.51 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t8VkR-0001mJ-LT
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJIDEwOjE2
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzUgMTk6MDIsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDXml6XlkajkuowgMTg6Mznl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNSAxNToyOCwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqM
IDE1OjA05YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xMS80IDk6NTYsIFpoaWd1byBO
aXUgd3JvdGU6Cj4gPj4+Pj4gSWYgdXNlciBnaXZlIGEgZmlsZSBzaXplIGFzICJsZW5ndGgiIHBh
cmFtZXRlciBmb3IgZmllbWFwCj4gPj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBp
cyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+ID4+Pj4+IGl0IHdpbGwgc2hvdyAyIHNlZ21lbnRz
IGZpZW1hcCByZXN1bHRzIGV2ZW4gdGhpcyB3aG9sZSBmaWxlCj4gPj4+Pj4gaXMgY29udGlndW91
cyBvbiBkaXNrLCBzdWNoIGFzIHRoZSBmb2xsb3dpbmcgcmVzdWx0czoKPiA+Pj4+Pgo+ID4+Pj4+
ICAgICAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+IEZp
ZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+ID4+Pj4+ICAgICAgICAgICAgbG9naWNhbCBh
ZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPiA+Pj4+PiAw
ICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAyMGJhYTAwMCAwMDAwMDAwMDAwMDA0MDAw
IDAwMDAxMDAwCj4gPj4+Pj4gMSAgICAgICAwMDAwMDAwMDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUw
MDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+ID4+Pj4+Cj4gPj4+Pj4gYWZ0ZXIgdGhpcyBw
YXRjaDoKPiA+Pj4+PiAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+
ID4+Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+ID4+Pj4+ICAgICAgICBsb2dp
Y2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4+
Pj4+IDAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDMxNWYzMDAwIDAwMDAwMDAwMDAwMDUw
MDAgMDAwMDEwMDEKPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpo
aWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4+PiAtLS0KPiA+Pj4+PiBWMjogY29ycmVjdCBjb21t
aXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4gPj4+Pj4gZjJmc19pbyBoYXMg
YmVlbiBtb2RpZmllZCBmb3IgdGVzdGluZywgdGhlIGxlbmd0aCBmb3IgZmllbWFwIGlzCj4gPj4+
Pj4gcmVhbCBmaWxlIHNpemUsIG5vdCBibG9jayBudW1iZXIKPiA+Pj4+PiAtLS0KPiA+Pj4+PiAg
ICAgZnMvZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Pgo+ID4+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4gaW5kZXggMzA2Yjg2YjAu
LjlmYzIyOWQgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+PiArKysg
Yi9mcy9mMmZzL2RhdGEuYwo+ID4+Pj4+IEBAIC0xOTY2LDggKzE5NjYsOCBAQCBpbnQgZjJmc19m
aWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmll
aW5mbywKPiA+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+PiAg
ICAgICAgIH0KPiA+Pj4+Pgo+ID4+Pj4+IC0gICAgIGlmIChieXRlc190b19ibGtzKGlub2RlLCBs
ZW4pID09IDApCj4gPj4+Pj4gLSAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2Rl
LCAxKTsKPiA+Pj4+PiArICAgICBpZiAobGVuICYgKGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpIC0g
MSkpCj4gPj4+Pj4gKyAgICAgICAgICAgICBsZW4gPSByb3VuZF91cChsZW4sIGJsa3NfdG9fYnl0
ZXMoaW5vZGUsIDEpKTsKPiA+Pj4+Cj4gPj4+PiBIb3cgZG8geW91IHRoaW5rIG9mIGdldHRpbmcg
cmlkIG9mIGFib3ZlIGFsaWdubWVudCBmb3IgbGVuPwo+ID4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+ICAg
ICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+ID4+Pj4+ICAg
ICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+
ID4+Pj4KPiA+Pj4+IEFuZCByb3VuZCB1cCBlbmQgcG9zaXRpb24gdy86Cj4gPj4+Pgo+ID4+Pj4g
bGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCByb3VuZF91cChzdGFydCArIGxlbiAtIDEs
IEYyRlNfQkxLU0laRSkpOwo+ID4+PiBIaSBDaGFvLAo+ID4+PiBJIHRoaW5rIHRoaXMgd2lsbCBj
aGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+ID4+PiAtLS0tLS0tLS0tLS0tCj4gPj4+IGlm
IChzdGFydF9ibGsgPiBsYXN0X2JsaykKPiA+Pj4gICAgICAgZ290byBvdXQ7Cj4gPj4+IC0tLS0t
LS0tLS0tLS0KPiA+Pj4gZm9yIGV4YW1wbGUsIGEgZmlsZSB3aXRoIHNpemUgMTkwMDYsIGJ1dCB0
aGUgbGVuZ3RoIGZyb20gdGhlIHVzZXIgaXMgMTYzODQuCj4gPj4+IGJlZm9yZSB0aGlzIG1vZGlm
aWNhdGlvbiwgIGxhc3RfYmxrID0gIGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0ICsKPiA+Pj4g
bGVuIC0gMSkgPSAoaW5vZGUsIDE2MzgzKSA9IDMKPiA+Pj4gYWZ0ZXIgdGhlIGZpcnN0IGYyZnNf
bWFwX2Jsb2NrcygpLiBzdGFydF9ibGsgY2hhbmdlIHRvIGJlIDQsCj4gPj4+IGFmdGVyIHRoZSBz
ZWNvbmQgZjJmc19tYXBfYmxvY2tzKCksIGZpZW1hcF9maWxsX25leF9leHRlbiB3aWxsIGJlCj4g
Pj4+IGNhbGxlZCB0byBmaWxsIHVzZXIgcGFyYW1ldGVyIGFuZCB0aGVuCj4gPj4+IHdpbGwgZ290
byBvdXQgYmVjYXVzZSBzdGFydF9ibGsgPiBsYXN0X2JsaywgdGhlbiBmaWVtYXAgZmxvdyBmaW5p
c2hlcy4KPiA+Pj4gYnV0IGFmdGVyIHRoaXMgbW9kaWZpY2F0aW9uLCBsYXN0X2JsayB3aWxsIGJl
IDQKPiA+Pj4gd2lsbCBkbyBmMmZzX21hcF9ibG9ja3MoKSB1bnRpbCByZWFjaCB0aGUgbWF4X2Zp
bGVfYmxvY2tzKGlub2RlKQo+ID4+Cj4gPj4gWWVzLCB5b3UncmUgcmlnaHQsIGhvd2V2ZXIsIHcv
IHRoaXMgcGF0Y2gsIGl0IG1heSBjaGFuZ2UgbGFzdF9ibGssIGUuZy4KPiA+Pgo+ID4+IHhmc19p
byBmaWxlIC1jICJmaWVtYXAgLXYgMCAxOTAwNiIgdnMgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAt
diAyIDE5MDA2Igo+ID4+IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTogMCwgNCBhbmQg
MCwgNS4KPiA+IEhpIENoYW8sCj4gPiB5ZXMsIGJ1dCB3L28gdGhpcyBwYXRjaCAsIHRoZSBvcmln
aW5hbCBjb2RlIHN0aWxsIGhhcyB0aGUgc2FtZSBzaXR1YXRpb24/Pwo+ID4gZm9yIGV4YW1wbGUK
PiA+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIgdnMgeGZzX2lvIGZpbGUgLWMg
ImZpZW1hcCAtdiAyIDE2Mzg0Igo+ID4gc3RhcnRfYmxrIGFuZCBsYXN0X2JsayB3aWxsIGJlOiAw
LCAzIGFuZCAwLCA0Lgo+Cj4gRm9yIHRoZSBjYXNlICJmaWVtYXAgLXYgMiAxOTAwNiIsIG9mZnNl
dCBpcyAyLCBhbmQgbGVuZ3RoIGlzIDE5MDA2LCBzbyBsYXN0X29mZnNldAo+IGlzIDE5MDA4LCBh
bmQgbGFzdF9ibGsgc2hvdWxkIGJlIDQgcmF0aGVyIHRoYW4gNSwgcmlnaHQ/CmhpIENoYW8sCml0
IGlzIHJpZ2h0IHcvbyBteSBwYXRjaC4KPgo+IEFuZCBmb3IgeW91IGNhc2UsIGl0IGNhbGN1bGF0
ZXMgbGFzdF9ibGsgY29ycmVjdGx5LgpTbyB5b3Ugc3VnZ2VzdCB0aGF0ICJTaG91bGQgd2Ugcm91
bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxrCmNhbGN1bGF0aW9uPyIKVGhhbmtz
Cj4KPiBUaGFua3MsCj4KPiA+IGJ1dCBvdmVyYWxsIGxhc3RfYmxrIHdpbGwgY2hhbmdlIGxvb3Ag
Y291bnRzIGJ1dCBoYXMgbm90IGFmZmVjdCBvbiB0aGUgcmVzdWx0cy4KPiA+Pgo+ID4+IFNob3Vs
ZCB3ZSByb3VuZF91cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsgY2FsY3VsYXRpb24/
Cj4gPiBJIHRoaW5rcyBpdCBpcyBvayAsYnV0IGp1c3QgYSBsaXR0bGUgYml0IHJlZHVuZGFudCB3
aXRoIHRoZSBmb2xsb3dpbmcKPiA+IGhhbmRsaW5nIGFib3V0IGxlbi4KPiA+Cj4gPiBpZiAoYnl0
ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+ID4gICAgIGxlbiA9IGJsa3NfdG9fYnl0ZXMo
aW5vZGUsIDEpOwo+ID4KPiA+IEJhc2VkIG9uIHRoZSBhYm92ZSBzaXR1YXRpb24sCj4gPiBkbyB5
b3UgaGF2ZSBhbnkgb3RoZXIgZ29vZCBzdWdnZXN0aW9ucz8gXl4KPiA+IHRoYW5rcyEKPiA+Cj4g
Pj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gdGhhbmtz77yBCj4gPj4+Pgo+ID4+Pj4gVGhhbmtz
LAo+ID4+Pj4KPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
