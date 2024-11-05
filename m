Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC739BC42F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 05:03:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8Amd-0005lK-9d;
	Tue, 05 Nov 2024 04:03:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8Amb-0005l3-3o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 04:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eBEt5P6xYcA5S7b/BGrFed1Q52573hHqNiv7t7aKqrA=; b=Pj3iBZrBPl8/D42/0PdjDtKltF
 SBKH5X3NJ457RF0TuOPue5oCpiWnHPjJOkEPN5p8iUJ9eCzfXSaBnNjSynuFzDfgej+9v6Sz/w35B
 DXeSKiEsQlXIGRlM5sEitsXD1ANL2QZXv2TnAt6PcSQj+mASLc+GFfvgsubVfMkFJFCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eBEt5P6xYcA5S7b/BGrFed1Q52573hHqNiv7t7aKqrA=; b=T70nQ2lBgphlvJHvCPPDq+NCeJ
 o/P1VBhvog719Xccdv7o0SKMMk/vpcF50FaNo0khdLwdmARq9hEV0EMyoqwBiPtVCI6qbaQN2SmXv
 DqHVPwVTiFC088H8LSKVIV0gZAVoaICai+p4309lli1bge8GD2hRJgNbQbWi1xZA49Pc=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8Ama-0007sj-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 04:03:09 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43159469053so3973165e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Nov 2024 20:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730779377; x=1731384177; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBEt5P6xYcA5S7b/BGrFed1Q52573hHqNiv7t7aKqrA=;
 b=QnM4XUP2vZki5VFeuBJyh1nYxlkT/QqU+j9qxI+LjhGMZ8+NoW0B/aM7I3U4STYFQI
 z2zd7uiCfhRR6nYWRzkF1cH8DelmY2kyfIIMJ6bPSTB7FZHyi8Xpfn9PcdUFIHlT7aAj
 6qeNgoYnlYX/IyhslQiMN/KaQ2NkXqOexnVQ6khWrgpSoj56x1ishOcll6yZgNZVEqUw
 I280bafa3qunUieDKnsD8uhCmS0vjvB5bL3z6d/o0VzLCAV8Aof8rqGMf2bS2i1vDnyS
 gzE7BgI9GgLFqJLaaEBl8ah3+WgY8I2J/iqULx6QAOyTa/igqslLcmd6QpeSGiZLLfPS
 BQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730779377; x=1731384177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBEt5P6xYcA5S7b/BGrFed1Q52573hHqNiv7t7aKqrA=;
 b=hNnrO5gCQXo3oVtC32/nfQQx1rDHn6DAxMuQ6gTyE3TMBAEva4Se13tv+bKtb5M39G
 EYl65UGSFW0o3a3Y00dnpQiCXrhNjLFKaIwIR4WHAaVRODTJlwWMyQ07GIDzFCKmn1hB
 T8R1DgQAtiDhCTAHhwbNlT0F0YIf0lxBHJyFcbLOUBfKF5CXcrwyGkJUrmR+QvjgJAkx
 /0f00CnruXqLSe+b/KRE32e4uziVXoK1iz6kL45u58BnV7gchW7aZhA/CRShaKPh8Fui
 ggSMtciLrotOIzj2/iHrNyTkUy6672W84umEiryvbZjnorLamPDznxWx77cJQSVWkNXO
 vUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0DTrFRV1085zeQ5hlnQqJHHeGkeFhphK5CD8yeB1P9Y39I8BZzmqciypQtgn288g7vBiA1/Hj+Dto3s9KKpNb@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz+63smiPRRVfkGSAV8m540BETIj3NYKhMFR2wRkio1Iwie7DdR
 j4aAvL4AriTMLwdUyHpOPVldjHTbSt2OIJdmLnLnHQdkW7TOjJ4blVAqkQZsXbmmHOy1Kzyqm24
 pM9XlAxPcjdV1OLggtsV0gq9Miw0=
X-Google-Smtp-Source: AGHT+IHdfas4uEFFjdqoAU0U4KIzi90JMz11Re/gB8Fd0gv6iAzJDcc95SKB/4HlMNsGUFjBoR1ZPUVzk2NxL8At0X0=
X-Received: by 2002:a05:600c:19c7:b0:431:5632:448d with SMTP id
 5b1f17b1804b1-4319ad76115mr134201935e9.9.1730779376546; Mon, 04 Nov 2024
 20:02:56 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <888aaf87-1363-4c1f-bd95-d119c72d7b30@kernel.org>
In-Reply-To: <888aaf87-1363-4c1f-bd95-d119c72d7b30@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 5 Nov 2024 12:02:45 +0800
Message-ID: <CAHJ8P3J+8xEwNL3S6JoR=E0_RczgwvHAGp8jZs5GZESza6n9LQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月5日周二 11:15写道： > > On 2024/11/4
    9:56, Zhiguo Niu wrote: > > If user give a file size as "length" parameter
    for fiemap > > operations, but if this size is non-block [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.42 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8Ama-0007sj-D1
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDExOjE1
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IElm
IHVzZXIgZ2l2ZSBhIGZpbGUgc2l6ZSBhcyAibGVuZ3RoIiBwYXJhbWV0ZXIgZm9yIGZpZW1hcAo+
ID4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVk
LAo+ID4gaXQgd2lsbCBzaG93IDIgc2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdo
b2xlIGZpbGUKPiA+IGlzIGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5n
IHJlc3VsdHM6Cj4gPgo+ID4gICAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXpl
ci5weQo+ID4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPiAgICAgICAgICBsb2dp
Y2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4g
MCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAwMDAwMDAwMDAwNDAw
MCAwMDAwMTAwMAo+ID4gMSAgICAgICAwMDAwMDAwMDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAg
MDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+ID4KPiA+IGFmdGVyIHRoaXMgcGF0Y2g6Cj4gPiAu
L2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4gRmllbWFwOiBvZmZz
ZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPiAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRk
ci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4gPiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCj4KPiBIaSBaaGlndW8sCj4K
PiBBbnkgdGVzdGNhc2UgdG8gcmVwcm9kdWNlIHRoaXMgYnVnPyB3L28gdGhpcyBwYXRjaCwgaXQg
bG9va3Mgb3V0cHV0Cj4gZnJvbSBmaWVtYXAgbG9va3MgZmluZT8KPgo+IGYyZnNfaW8gZmllbWFw
IDAgMTkwMzQgZmlsZQo+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+ICAgICAgICAg
bG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MK
PiAwICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwNDQwMTAwMCAwMDAwMDAwMDAwMDA1
MDAwIDAwMDAxMDAxCj4KSGkgQ2hhbywKU29ycnkgSSBkaWRuJ3Qgd3JpdGUgY2xlYXJseSBlbm91
Z2ggYWJvdXQgdGhlIHRlc3QgY2FzZSwgYW5kIGkgcHV0IHRoZQpub3RlIGJlbG93IHRoZSAiIlNp
bmdlZC1vZmYiIHRhZy4KbGV0IG1lIGRlc2NyaWJlIGl0IGFnYWlu77yMIGYyZnNfaW8gZmllbWFw
IGhhcyBiZWVuIG1vZGlmaWVkIGJ5IG1lIGZvcgp0ZXN0aW5nIGluIG15IGxvY2FsLCBhbmQgIHRo
ZSBsZW5ndGggcGFyYW1ldGVyCmlzIHRoZSByZWFsIGZpbGUgc2l6ZSBvZiB0aGUgZmlsZSwgbm90
IHRoZSBibG9jayBudW1lci4gYmVjYXVzZSB1c2VyCmFsc28gcGFzcyB0aGUgcmVhbCBmaWxlIHNp
emUgdG8gZmllbWFwIGlvY3RsLgpzbyB3aXRoIHRoZSBuZXcgZjJmc19pbyBmaWVtYXAsIGEgY29u
dGlndW91cyBmaWxlIG9uIGRpc2sgbWF5IGJlIHNob3duCjIgc2VnbWVudHMgaWYgdGhlIGxlbmd0
aCBpcyBub3QgYmxvY2sgc2l6ZSBhbGluZ2VkLgpzdWNoIGFzOgoKdW1zOTYzMl8xaDEwOi9kYXRh
ICMgbHMgLWwgeWxvZy9hcC9hbmFseXplci5weQotcnctcnctcnctIDEgcm9vdCBzeXN0ZW0gMTkw
MDYgMjAwOC0wMS0wMSAwMDowMCB5bG9nL2FwL2FuYWx5emVyLnB5CnVtczk2MzJfMWgxMDovZGF0
YSAjIC4vZjJmc19pbyBmaWVtYXAgMCAxOTAwNiB5bG9nL2FwL2FuYWx5emVyLnB5CkZpZW1hcDog
b2Zmc2V0ID0gMCBsZW4gPSAxOTAwNgogICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwg
YWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCjAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDIwYmFhMDAwIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDEwMDAKMSAgICAgICAwMDAwMDAw
MDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQoKYnV0
IGlmIHdlIHBhc3MgYSBsZW5ndGggdGhhdCBpcyBibG9jayBzaXplIGFsaW5nZWQsIGl0IHdpbGwg
c2hvdyBvbmUKd2hvbGUgc2VnbWVudCBpbiBmaWVtYXAgbG9nLgp1bXM5NjMyXzFoMTA6L2RhdGEg
IyAuL2YyZnNfaW8gZmllbWFwIDAgMjA0ODAgeWxvZy9hcC9hbmFseXplci5weQpGaWVtYXA6IG9m
ZnNldCA9IDAgbGVuID0gMjA0ODAKICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2FsIGFk
ZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwowICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAyMGJhYTAwMCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxClRoYW5rcy4KPiBUaGFua3Ms
Cj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5j
b20+Cj4gPiAtLS0KPiA+IFYyOiBjb3JyZWN0IGNvbW1pdCBtc2cgYWNjb3JkaW5nIHRvIENoYW8n
cyBxdWVzdGlvbnMKPiA+IGYyZnNfaW8gaGFzIGJlZW4gbW9kaWZpZWQgZm9yIHRlc3RpbmcsIHRo
ZSBsZW5ndGggZm9yIGZpZW1hcCBpcwo+ID4gcmVhbCBmaWxlIHNpemUsIG5vdCBibG9jayBudW1i
ZXIKPiA+IC0tLQo+ID4gICBmcy9mMmZzL2RhdGEuYyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBpbmRleCAzMDZiODZiMC4uOWZj
MjI5ZCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2Rh
dGEuYwo+ID4gQEAgLTE5NjYsOCArMTk2Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIGlmIChi
eXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4gPiAtICAgICAgICAgICAgIGxlbiA9IGJs
a3NfdG9fYnl0ZXMoaW5vZGUsIDEpOwo+ID4gKyAgICAgaWYgKGxlbiAmIChibGtzX3RvX2J5dGVz
KGlub2RlLCAxKSAtIDEpKQo+ID4gKyAgICAgICAgICAgICBsZW4gPSByb3VuZF91cChsZW4sIGJs
a3NfdG9fYnl0ZXMoaW5vZGUsIDEpKTsKPiA+Cj4gPiAgICAgICBzdGFydF9ibGsgPSBieXRlc190
b19ibGtzKGlub2RlLCBzdGFydCk7Cj4gPiAgICAgICBsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3Mo
aW5vZGUsIHN0YXJ0ICsgbGVuIC0gMSk7Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
