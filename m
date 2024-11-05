Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA49BCB2A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 12:02:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8HKj-0006z4-6b;
	Tue, 05 Nov 2024 11:02:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8HKi-0006yw-6M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 11:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r9Q2XSPdbWw/XHrk06jSmD1nKL1tt11T7tn+QZs5Wd8=; b=hcAzQdCIvawrCazVI39wOuvBN6
 Rl1QadLbPF2qn4SVnFJxqB9d1o/XuGNRWO8Veri+v7hjsM14UuTzywQNj9m0INxvEtF5XHeWrlapc
 zfspgeiIa6eGM/MJFbc6l6PEB3Td2jvwqKbt0swrLf2cfXAb1+0AMFdi5OSl3YX+DPQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r9Q2XSPdbWw/XHrk06jSmD1nKL1tt11T7tn+QZs5Wd8=; b=UkiY8fQKYcsMUafI8F4DXq7meK
 2rG/OTprNGUI8eAzjxjMmeSXc1WhbEQYL0Qv7dyphQkjSiXO2owQOsIjCDVVY5MWowHIFpfPXG7lK
 1yoKhUfCAIxe7Y+zmHPbZHVxTBw9o4gCMi5xDKboRWYbQ5hKjdI5VVB46e32CD2SC3A0=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8HKi-0004bQ-7j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 11:02:48 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43152fa76aaso4321785e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Nov 2024 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730804557; x=1731409357; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9Q2XSPdbWw/XHrk06jSmD1nKL1tt11T7tn+QZs5Wd8=;
 b=fhXIBDRqU1W1TL4hbKHoK1KkI10MmfeLHP4qng/9tkQXgVa8/jrRHNdmaWVaSjIIKb
 MT7svnNd8U0IY6ov+VXxxOhKGkKAaRmDnDttA/Ippa1uOQcYUnxfL/RvnRikIKsv4zN1
 w3nGhajilll+3Oqu68XHQF5uVSdKD39HccP7J9qeLic4noz5N5Yb92zUzagqR+d2qjDm
 DyjKWPw0nsC205a4MBpYQ8Hqm93X62i99wjMzxtNdtGiZUAWFNWzXFfE7S9uL1n73wYj
 87flEZvc6dKp98Pm1RSpgyed6PYyq+n8dsHlb50ikJ/W6stp/evVwACTlvajfnYlJDM6
 c4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730804557; x=1731409357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9Q2XSPdbWw/XHrk06jSmD1nKL1tt11T7tn+QZs5Wd8=;
 b=peUaYjYkmPhj/uPB4PjQWgzkcxUw62A7SxPNg1MeAHsbzJgevIcTiIYipnh9/tGuC6
 MFs9/9xUzxQOGpJD0iWRznqtHa1tJg+lSDrbeAr1JV4raPF03K9dT3+vyiqKARfewNvo
 /LvFOSAtRdDfB1eyLJ57u31vYz2gNB9lMHdlTVdCZWPj6O9BQ/0n0GTQYosYz71MzL8f
 ScLfq3l8Bb9pdbYvUnV8OoxfQghBBdh+qd3PZimaLv7CuhIX3Ef861m4SX5a0JRlrXGm
 fYytmm82xJM09evYrJzPi4YyT/iIS1BJZAf3r2bpy3UK1lVdx02XnqWbHy4xBHKsGInE
 ws0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVSLz4jQrQKnSD7nLe++zTag5BOwicu7qdxp6Cs+UsXyt2k9Vxe4YCOZr7LoGSHbeNxwV4KU5iEjRB8bgfJ9QP@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yysq790vdf/kDgze1xPPfvaCVW37N6GAsl8cfvDQOGbyQraU9d4
 oU4uIRBLdffMQ7zZw+57F8Bv6pP5R2LNIeLUVxmOAOlpLdCaBdhpu8GgozfpWAmg83Q8yYlxYFd
 iS9jXMaqVG6cZHvMrY4RJTSEK0kCrdXX5
X-Google-Smtp-Source: AGHT+IGEFiblHd/C5YPdchfjvzY1MXIM17YhPAHpNMi+UUqXIYyUgvOOf8MbfKIPAKVC2b3yCdq/4ZGszes65+uFhbg=
X-Received: by 2002:a05:6000:1fab:b0:37d:47a4:ec2b with SMTP id
 ffacd0b85a97d-3806121a2b6mr11543526f8f.11.1730804556375; Tue, 05 Nov 2024
 03:02:36 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
In-Reply-To: <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 5 Nov 2024 19:02:25 +0800
Message-ID: <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月5日周二 18:39写道： > > On 2024/11/5
    15:28, Zhiguo Niu wrote: > > Chao Yu 于2024年11月5日周二 15:04写道：
    > >> > >> On 2024/11/4 9:56, Zhiguo Niu wrote: > >>> [...] 
 
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
                             [209.85.128.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.44 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8HKi-0004bQ-7j
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDE4OjM5
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzUgMTU6MjgsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDXml6XlkajkuowgMTU6MDTl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNCA5OjU2LCBaaGlndW8gTml1IHdyb3RlOgo+
ID4+PiBJZiB1c2VyIGdpdmUgYSBmaWxlIHNpemUgYXMgImxlbmd0aCIgcGFyYW1ldGVyIGZvciBm
aWVtYXAKPiA+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6
ZSBhbGlnbmVkLAo+ID4+PiBpdCB3aWxsIHNob3cgMiBzZWdtZW50cyBmaWVtYXAgcmVzdWx0cyBl
dmVuIHRoaXMgd2hvbGUgZmlsZQo+ID4+PiBpcyBjb250aWd1b3VzIG9uIGRpc2ssIHN1Y2ggYXMg
dGhlIGZvbGxvd2luZyByZXN1bHRzOgo+ID4+Pgo+ID4+PiAgICAuL2YyZnNfaW8gZmllbWFwIDAg
MTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTkw
MzQKPiA+Pj4gICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5n
dGggICAgICAgICAgIGZsYWdzCj4gPj4+IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDIwYmFhMDAwIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDEwMDAKPiA+Pj4gMSAgICAgICAwMDAwMDAw
MDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+ID4+
Pgo+ID4+PiBhZnRlciB0aGlzIHBhdGNoOgo+ID4+PiAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQg
eWxvZy9hbmFseXplci5weQo+ID4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTkwMzQKPiA+
Pj4gICAgICAgbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAg
ICAgZmxhZ3MKPiA+Pj4gMCAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMzE1ZjMwMDAgMDAw
MDAwMDAwMDAwNTAwMCAwMDAwMTAwMQo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8g
Tml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPj4+IC0tLQo+ID4+PiBWMjogY29ycmVjdCBj
b21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4gPj4+IGYyZnNfaW8gaGFz
IGJlZW4gbW9kaWZpZWQgZm9yIHRlc3RpbmcsIHRoZSBsZW5ndGggZm9yIGZpZW1hcCBpcwo+ID4+
PiByZWFsIGZpbGUgc2l6ZSwgbm90IGJsb2NrIG51bWJlcgo+ID4+PiAtLS0KPiA+Pj4gICAgZnMv
ZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0
YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4gaW5kZXggMzA2Yjg2YjAuLjlmYzIyOWQgMTAwNjQ0
Cj4gPj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4g
Pj4+IEBAIC0xOTY2LDggKzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICpp
bm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4gICAgICAgIH0KPiA+Pj4KPiA+Pj4gLSAgICAg
aWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4gLSAgICAgICAgICAgICBs
ZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4gKyAgICAgaWYgKGxlbiAmIChibGtz
X3RvX2J5dGVzKGlub2RlLCAxKSAtIDEpKQo+ID4+PiArICAgICAgICAgICAgIGxlbiA9IHJvdW5k
X3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwgMSkpOwo+ID4+Cj4gPj4gSG93IGRvIHlvdSB0
aGluayBvZiBnZXR0aW5nIHJpZCBvZiBhYm92ZSBhbGlnbm1lbnQgZm9yIGxlbj8KPiA+Pgo+ID4+
Pgo+ID4+PiAgICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+
ID4+PiAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAt
IDEpOwo+ID4+Cj4gPj4gQW5kIHJvdW5kIHVwIGVuZCBwb3NpdGlvbiB3LzoKPiA+Pgo+ID4+IGxh
c3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgcm91bmRfdXAoc3RhcnQgKyBsZW4gLSAxLCBG
MkZTX0JMS1NJWkUpKTsKPiA+IEhpIENoYW8sCj4gPiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2Ug
dGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+ID4gLS0tLS0tLS0tLS0tLQo+ID4gaWYgKHN0YXJ0X2Js
ayA+IGxhc3RfYmxrKQo+ID4gICAgICBnb3RvIG91dDsKPiA+IC0tLS0tLS0tLS0tLS0KPiA+IGZv
ciBleGFtcGxlLCBhIGZpbGUgd2l0aCBzaXplIDE5MDA2LCBidXQgdGhlIGxlbmd0aCBmcm9tIHRo
ZSB1c2VyIGlzIDE2Mzg0Lgo+ID4gYmVmb3JlIHRoaXMgbW9kaWZpY2F0aW9uLCAgbGFzdF9ibGsg
PSAgYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQgKwo+ID4gbGVuIC0gMSkgPSAoaW5vZGUsIDE2
MzgzKSA9IDMKPiA+IGFmdGVyIHRoZSBmaXJzdCBmMmZzX21hcF9ibG9ja3MoKS4gc3RhcnRfYmxr
IGNoYW5nZSB0byBiZSA0LAo+ID4gYWZ0ZXIgdGhlIHNlY29uZCBmMmZzX21hcF9ibG9ja3MoKSwg
ZmllbWFwX2ZpbGxfbmV4X2V4dGVuIHdpbGwgYmUKPiA+IGNhbGxlZCB0byBmaWxsIHVzZXIgcGFy
YW1ldGVyIGFuZCB0aGVuCj4gPiB3aWxsIGdvdG8gb3V0IGJlY2F1c2Ugc3RhcnRfYmxrID4gbGFz
dF9ibGssIHRoZW4gZmllbWFwIGZsb3cgZmluaXNoZXMuCj4gPiBidXQgYWZ0ZXIgdGhpcyBtb2Rp
ZmljYXRpb24sIGxhc3RfYmxrIHdpbGwgYmUgNAo+ID4gd2lsbCBkbyBmMmZzX21hcF9ibG9ja3Mo
KSB1bnRpbCByZWFjaCB0aGUgbWF4X2ZpbGVfYmxvY2tzKGlub2RlKQo+Cj4gWWVzLCB5b3UncmUg
cmlnaHQsIGhvd2V2ZXIsIHcvIHRoaXMgcGF0Y2gsIGl0IG1heSBjaGFuZ2UgbGFzdF9ibGssIGUu
Zy4KPgo+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxOTAwNiIgdnMgeGZzX2lvIGZpbGUg
LWMgImZpZW1hcCAtdiAyIDE5MDA2Igo+IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTog
MCwgNCBhbmQgMCwgNS4KSGkgQ2hhbywKeWVzLCBidXQgdy9vIHRoaXMgcGF0Y2ggLCB0aGUgb3Jp
Z2luYWwgY29kZSBzdGlsbCBoYXMgdGhlIHNhbWUgc2l0dWF0aW9uPz8KZm9yIGV4YW1wbGUKeGZz
X2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg0IiB2cyB4ZnNfaW8gZmlsZSAtYyAiZmllbWFw
IC12IDIgMTYzODQiCnN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTogMCwgMyBhbmQgMCwg
NC4KYnV0IG92ZXJhbGwgbGFzdF9ibGsgd2lsbCBjaGFuZ2UgbG9vcCBjb3VudHMgYnV0IGhhcyBu
b3QgYWZmZWN0IG9uIHRoZSByZXN1bHRzLgo+Cj4gU2hvdWxkIHdlIHJvdW5kX3VwIGxlbiBhZnRl
ciBzdGFydF9ibGsgJiBsYXN0X2JsayBjYWxjdWxhdGlvbj8KSSB0aGlua3MgaXQgaXMgb2sgLGJ1
dCBqdXN0IGEgbGl0dGxlIGJpdCByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93aW5nCmhhbmRsaW5n
IGFib3V0IGxlbi4KCmlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCiAgIGxlbiA9
IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpOwoKQmFzZWQgb24gdGhlIGFib3ZlIHNpdHVhdGlvbiwK
ZG8geW91IGhhdmUgYW55IG90aGVyIGdvb2Qgc3VnZ2VzdGlvbnM/IF5eCnRoYW5rcyEKCj4KPiBU
aGFua3MsCj4KPiA+IHRoYW5rc++8gQo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
