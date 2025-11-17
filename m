Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29986C621EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Nov 2025 03:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdcQBdDX1VFUvZXjN1nt/FqpEB53y5QDSCFbJ3Dm1RY=; b=fKmTrXYLzEBEcxvfrc5TDhscoQ
	48dtJbWrF8kFeKnbDG1sR3qkpSHcAaNqsbEES+PVUtOz4KjIcwlPXiNdVNoUXzP5rsf4SjEYtdUU7
	Cm84L9VLWccXKbupCVs6uCSHYR35pATFrTH2K3ZW2sq8h1B2zRG2BYSIxZk8VG/VkPmk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKpAh-0003AD-RR;
	Mon, 17 Nov 2025 02:40:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akiyks@gmail.com>) id 1vKp9y-00039H-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 02:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOf1IO3iV9NFMRVLrNnp7+aRuUjv89KLH0/8+weZfzo=; b=hAazqhgcy6TPZQNprVBqEnHFI/
 mDk+70BNOWawv6cQrbKLOyI4W48i1NdkLaGh+kBLXAKXMNhxSW6Th1gRAxeZSW5eufAqsYg/JPDkf
 TQTVtOIMQcg696ag0zmYUJGow2ncpLhBu6NO3mUK9nP1j4FgGjG7VWC4DXx5kaeHuUsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eOf1IO3iV9NFMRVLrNnp7+aRuUjv89KLH0/8+weZfzo=; b=Wo7I2g4Uro+ciD9zMRNeNv95ma
 TXe2n/uLs+dYbc/gpj7daQR9Cl6fVH4sfLotGgzaJmw50JCY6j+mlP1ip9XsT40e9Rg7KhtzBUh74
 8cU+f/37DUHeZf4Yt/pQeCmLlFpwu3M5p7ljIKpRt9SqYDmU3w4NwHb1bsr/Re8Ea8U4=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vKp9y-000835-Cz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 02:40:06 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so4048001b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 16 Nov 2025 18:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763347196; x=1763951996; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eOf1IO3iV9NFMRVLrNnp7+aRuUjv89KLH0/8+weZfzo=;
 b=i7h+gYqdre4S2NzzOkwtcOmHZQfcchs/vsGYxTTM9O9iYUbaRSfTdaJblEFH2dwgc0
 vrorfC5uuhSGbv3shyVSsZZPRUGhapHS88qva9C+NjbmAsGY6j9cd0oneunt2o0h45HV
 PTOiE7PMzZxGqriri+aHNo/AqKBZr1Dpb4zwO2ZOZkLUy5CUJgPe7PJoTI8IigYLU6w2
 LRTES4+EyKB6z9ShRAGSQCs/sRwPp+7+he9+8DugRE1Vb3/oXf39ZBZ3znOAg9Xhdvw1
 by+OY+bCMKGSQ2V+JIaXx8FvlFbFO7ut1HgKTbdnUBT4cA2lrMA3+WosV9e2geEPsGHd
 +yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763347196; x=1763951996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eOf1IO3iV9NFMRVLrNnp7+aRuUjv89KLH0/8+weZfzo=;
 b=WKQ3fyCZPaj9Vcni0cBCPm+oyd0fHNJY3QZUND9m46mv28Wyffi7Ga1aaKwClTHYAf
 SB+4L84LNLmfjLgM9fwnf9uyuVwNG7ZVA78l2lgCv4mFr4xe/YWzDaEjDfj3UjhrOQpE
 A8bUrvlImGtGmCGpmkwnc5PEzOY98gpaSFbjyugh1aoMOYF91jIvcN6/IsuUf2z3HNj9
 rzvFeyEk5AgMlJocYz6Tcwxpi9GkVS2d8vwI9DIlmHdTyyQEJp9v6FH01Qadw8v+Buj0
 mNfqeezIOxONAtm14RZTjsx92CQBMDxt6dcOpwpHeaRqm3o4tnr65+heMWBuXHn5zir0
 F8yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSuHjhIffwx8/6ylgJibwvAD/Y2G+ZnzO48qlUA3irZNxFmYfM23NxS19y9BYjqNbsi04yZcErdtwoa1BKTGXj@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx88HmUwkzgqn6nWJRgPx0p2lnvLaolmuXCB7XiCj+w0VJVhVap
 tyMBwdNSyodDrMYI/bS6sOULqLRlr2D3uir/95IS993NRDoZJXr/FYPx
X-Gm-Gg: ASbGncuFNmef1nQWelXKLurjth4sKqiIzbRt7horGRVWOsxZe5a8rSbSBmbg9txrmaJ
 TzOoh8/sToc3QWA82cT8aN3tn6K9MauAY/dQS7P93An/7uVUGjLbV5LMUuJtqhD27BZWEFyTXYU
 duwzaY/mByNlMafXYp5bOK2+OzzIWL5SQorxPgPlpAy9m2GqxkqgOrKCX+utHUnZgmiBk6VZNWV
 WH8qz3pafMlhFSntbwNAgzjyKZS2nMVLZi0mTy6P6PlUaeuC6EU0n1x43jbqOaXf4GupBRqXJwr
 2dyfLRY0UFkSmuCq/JweLGWNoUN1SKkEjn8BUovl0QYAFzcFHnAE1W/ySWW6hY6uMbjqJLc3igV
 9k8g5/Q+aHDsmpohkGl9yd8lH+giSSrbebyICNOpey1F/UEmx5x+/upKXD65eTbC3QATwwy6Oz8
 n473qzfDsqYdRn9EfysAEaqgCemEEeDPyJDfPcpFE/p37uaZOHVStowZ+J
X-Google-Smtp-Source: AGHT+IH7X48eCGWixEiNwPlmpERSifoBu/b0ZTmcGSRhT4una/cpOnMf/79+MWXGYzANOF6NkR8O1A==
X-Received: by 2002:a05:6a20:72ab:b0:334:a784:3046 with SMTP id
 adf61e73a8af0-35ba17aa0e5mr13313300637.38.1763347195661; 
 Sun, 16 Nov 2025 18:39:55 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b92782ad04sm11347998b3a.61.2025.11.16.18.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 18:39:55 -0800 (PST)
Message-ID: <ca5ef73b-c394-4c63-b47d-40f2ff61ef42@gmail.com>
Date: Mon, 17 Nov 2025 11:39:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Masaharu Noguchi <nogunix@gmail.com>
References: <20251116102644.25400-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251116102644.25400-1-nogunix@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, 16 Nov 2025 19:26:44 +0900, Masaharu Noguchi wrote:
    > Sphinx LaTeX builder fails on nested tables in f2fs.rst, producing: > >
    “Markup is unsupported in LaTeX: longtable does not support nest [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was blocked.
                             See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URI: spinics.net]
                             [URI: checkpatch.pl]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [akiyks(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.179 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vKp9y-000835-Cz
Subject: Re: [f2fs-dev] [PATCH v4] docs: f2fs: wrap ASCII tables in literal
 blocks to fix LaTeX build
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
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCAxNiBOb3YgMjAyNSAxOToyNjo0NCArMDkwMCwgTWFzYWhhcnUgTm9ndWNoaSB3cm90
ZToKPiBTcGhpbnggTGFUZVggYnVpbGRlciBmYWlscyBvbiBuZXN0ZWQgdGFibGVzIGluIGYyZnMu
cnN0LCBwcm9kdWNpbmc6Cj4gCj4gICDigJxNYXJrdXAgaXMgdW5zdXBwb3J0ZWQgaW4gTGFUZVg6
IGxvbmd0YWJsZSBkb2VzIG5vdCBzdXBwb3J0IG5lc3RpbmcgYSB0YWJsZS7igJ0KPiAKPiBXcmFw
IHRoZSBhZmZlY3RlZCBBU0NJSSB0YWJsZXMgaW4gbGl0ZXJhbCBjb2RlIGJsb2NrcyBzbyBTcGhp
bnggcmVuZGVycyB0aGVtCj4gdmVyYmF0aW0uIFRoaXMgYXZvaWRzIG5lc3RlZCBsb25ndGFibGVz
IGFuZCBmaXhlcyB0aGUgTGFUZVggYnVpbGQgb24gU3BoaW54IDguMi54Lgo+IAo+IENoYW5nZXMg
aW4gdjQ6Cj4gIC0gUmViYXNlZCBvbiA2MjI0MmFjNTEwNjEKPiAgLSBDbGVhbmVkIHVwIENoYW5n
ZWxvZyBwbGFjZW1lbnQgKG1vdmUgdmVyc2lvbiBoaXN0b3J5IGFib3ZlICctLS0nKQoKVGhpcyBp
cyBub3Qgd2hhdCBJIGFza2VkIGJ5IHNheWluZzoKCiAgICBUaGVzZSBiYWNrZ3JvdW5kIGFuZCBj
aGFuZ2UgaGlzdG9yeSBzaG91bGQgZ28gb3V0IG9mIHRoZSBDaGFuZ2Vsb2cgYXJlYS4KCkNoYW5n
ZWxvZyBlbmRzIGF0ICctLS0nLiBTZWU6CgogICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNjb21tZW50YXJ5Cgo+
ICAtIFZlcmlmaWVkIGBtYWtlIGh0bWxkb2NzYCBhbmQgYG1ha2UgcGRmZG9jc2AgYnVpbGQgZmlu
ZQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gIC0gUmVwbGFjZSBUQUJzIGluc2lkZSBBU0NJSSB0YWJs
ZXMgd2l0aCBzcGFjZXMKPiAKPiBDaGFuZ2VzIGluIHYyOgo+ICAtIFdyYXAgbmVzdGVkIEFTQ0lJ
IHRhYmxlcyBpbiBsaXRlcmFsIGJsb2NrcyBhbmQgZml4IG1pc3NpbmcgYmxhbmsgbGluZXMKPiAK
PiBBY2tlZC1ieTogQmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEFraXJhIFlva29zYXdhIDxha2l5a3NAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IE1hc2FoYXJ1IE5vZ3VjaGkgPG5vZ3VuaXhAZ21haWwuY29tPgo+IAo+IExpbms6IGh0dHBzOi8v
d3d3LnNwaW5pY3MubmV0L2xpc3RzL2tlcm5lbC9tc2c1OTIxODQ4Lmh0bWwKPiBMaW5rOiBodHRw
czovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9rZXJuZWwvbXNnNTkxODI2NC5odG1sCj4gTGluazog
aHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva2VybmVsL21zZzU4NzU2NjIuaHRtbAo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IHwgMTMxICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCA2
MiBkZWxldGlvbnMoLSkKCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIGVtaXRzIHRoZSBmb2xsb3dp
bmc6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KV0FSTklORzogUHJlZmVyIGEgbWF4aW11bSA3NSBjaGFycyBw
ZXIgbGluZSAocG9zc2libGUgdW53cmFwcGVkIGNvbW1pdCBkZXNjcmlwdGlvbj8pCiMyNjogCiAg
4oCcTWFya3VwIGlzIHVuc3VwcG9ydGVkIGluIExhVGVYOiBsb25ndGFibGUgZG9lcyBub3Qgc3Vw
cG9ydCBuZXN0aW5nIGEgdGFibGUu4oCdCgpFUlJPUjogUGxlYXNlIHVzZSBnaXQgY29tbWl0IGRl
c2NyaXB0aW9uIHN0eWxlICdjb21taXQgPDEyKyBjaGFycyBvZiBzaGExPiAoIjx0aXRsZSBsaW5l
PiIpJyAtIGllOiAnY29tbWl0IDYyMjQyYWM1MTA2MSAoIkRvY3VtZW50YXRpb246IGYyZnM6IFJl
d29yZCB0aXRsZSIpJwojMzI6IAogLSBSZWJhc2VkIG9uIDYyMjQyYWM1MTA2MQoKV0FSTklORzog
VXNlIGxvcmUua2VybmVsLm9yZyBhcmNoaXZlIGxpbmtzIHdoZW4gcG9zc2libGUgLSBzZWUgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlzdHMuaHRtbAojNDY6IApMaW5rOiBodHRwczovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9rZXJuZWwvbXNnNTkyMTg0OC5odG1sCgpXQVJOSU5HOiBVc2UgbG9y
ZS5rZXJuZWwub3JnIGFyY2hpdmUgbGlua3Mgd2hlbiBwb3NzaWJsZSAtIHNlZSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saXN0cy5odG1sCiM0NzogCkxpbms6IGh0dHBzOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2tlcm5lbC9tc2c1OTE4MjY0Lmh0bWwKCldBUk5JTkc6IFVzZSBsb3JlLmtlcm5l
bC5vcmcgYXJjaGl2ZSBsaW5rcyB3aGVuIHBvc3NpYmxlIC0gc2VlIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpc3RzLmh0bWwKIzQ4OiAKTGluazogaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlz
dHMva2VybmVsL21zZzU4NzU2NjIuaHRtbAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkFsc28sIHBsZWFzZSBh
cHBseSB5b3VyIHBhdGNoIG9uIHlvdXIgb3duIGJlZm9yZSBzdWJtaXR0aW5nIGl0IGFuZApzZWUg
dGhlIENoYW5nZWxvZyBsb29rcyBnb29kIHRvIHlvdS4KClRoYW5rcywgQWtpcmEKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
