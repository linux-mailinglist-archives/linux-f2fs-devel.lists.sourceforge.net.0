Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA33AD4C12
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 08:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73dht6zGBkHJu+nKnrxRkEEKoELjk7nIrldAFmfxpKQ=; b=bUlByPdjKBynX/ga3lNPbJz0Yp
	/hCLeXTB3pSa79v5beYfeluz5Y0hOpVSF48gPBx+GGETJWiDj3L5qXI4YzVw9n4XhKqxord0WEFgg
	tKrqFFMdpw/4V3tY14+kJmvMdsyaj6B39aEMGYt5McpE6DM+sH6Na1qkL20XTt+PXOoo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPFKe-0000s9-I6;
	Wed, 11 Jun 2025 06:53:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uPFKd-0000ry-Lf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ZcoFkVAiTRFqiOiNNWpiZEngLNxlokcj95V82V3k6w=; b=hDpgJmA4KaTnxi2cooJwv5jU5L
 0Z5JtzrUabSPn5/4xtC/15f1WAfmDsqntqFNc0KFeb5ic0cHcgJw5jaZQsdQ9JDEgtfWNF2wBS70y
 /42ZEAtNgpy6I8PUUbfv7r1d1UgA03SZDd8HqdXqXmzkKEs1KI+JOm3G0s600LvGh0mI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ZcoFkVAiTRFqiOiNNWpiZEngLNxlokcj95V82V3k6w=; b=guoYvBoybZvtbdC2bA+SPj0VFd
 F/0Mqo8rQ7Dsw5UTeUaJk9b8why3f5f5r1uWHYqLT5c1pPyBNC/RCMlIfCTWmnBl+J+qxi2yh76AO
 VFG4+oVwXggaUcaOnl/rgcs0yOEIZJu+5DUucl6uMTJzAWdDA/nlxghO7LQXaVsJMJr4=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPFKd-0001EO-6b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:53:07 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a4e575db1aso33876f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 23:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749624776; x=1750229576; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZcoFkVAiTRFqiOiNNWpiZEngLNxlokcj95V82V3k6w=;
 b=UvtpsNCCH//ZXtQfVqONJUprLsyBF1qsJB1ENuUUabmcrTPF5v/+A4kXLZFXJpHhuo
 iue47EoNrdZ6iLTLvTqFh67szmoes+ngRlRV7tZhEePZEb+hvMxRZIo+HCDBRhhOiRt3
 fGSFsfnU+XdmfNwQC6Ff68llau1xdqhd7UuoIa3Jji6s7tyGSFT1q5MNOwaJIkidAtmK
 I70k0+JnhnbCalLKke9GxWiqMOEmpXqwTc7Yh8rrILLIG3exeeGNPKg5KkMGLrXE1SMB
 ZPN64+BPzxsc/8uaDlGZp70yphj+hV3S24Mz1eGIZGh9ITGssMovr5pl3Co1C+m1ivX2
 lIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749624776; x=1750229576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZcoFkVAiTRFqiOiNNWpiZEngLNxlokcj95V82V3k6w=;
 b=LFvTHLqW7ks71zRKmNvtEV6kcXRjndTkAFwiqAJDn7ecpwDud7/7lUzlM/Cw93Y7RE
 FRkjXJINS750ZJOuTxxwYxx6abM9aydLXi2EXrYPO4FePyTpDYGfJMVvby4TpGpTCdqH
 E5VeBrNDylZl0L14V+5QZlVIzNgZuXYC6fRO1+DDJEFZJkVdh9/1SsiZNnCPecSqcIbm
 FH2dxGlCuXnRtxta4KT9Qucb5LJ92ggBYqSsUw7kB2T+ENc2KOX/jubl0rEF1JWw8DqP
 e87tFQotdso5jITteaRwBbaqNNrxoqhrNFeLuITNQtWZooet9gAHBEyDLF5fby2DF6rg
 dzEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzkruPoxkJMwQJFQfmHNL999hRZgwcUDnlVf+yoVTwo7m9rKfQvSrqddGbSFB97dMXG5eD6dIvwrJeIAVvFe2+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzCW3Fg5KQTz+2QN/J6L4tc4bvoJrdF57z+WoGtlqYPW9ivhEw3
 EGfpxLYW3SoQCg2kM+BiYiCPGdXVvtTGR78kVcgYAYhjZwuMyFEDrR9TNRMDXrrrSW0iHzIvCLK
 RXXY0YmwoMgOGay7JIPG5qt0b81tAuwB2MQ==
X-Gm-Gg: ASbGncs0ioxOMLxRDvwYtimkuUNLAgsW64vztV8sCdSIpKXdoqbBoQd97WvST40eONq
 02tHHZKHTDAToK6hsIVH9I8Yi1pyMbcODFVJy+NT3+rsR3dQcl5XVSrMMYkY+0TqAnJ9Yb4b9/Z
 S0sYQ+yWQsXbO54QEk+jepZp8JkapL247rl3G9wXIo9p6W
X-Google-Smtp-Source: AGHT+IFZh6owmX7HkiRyf7we5O3Nj8AI3dd6DQRu2hcC5wXD5rSpVUk53mGX3UXq06FsnBnovOBbHjJ++ogCfyvGCfQ=
X-Received: by 2002:a05:6000:2082:b0:3a4:da29:d13f with SMTP id
 ffacd0b85a97d-3a5586b89d0mr531578f8f.3.1749624775564; Tue, 10 Jun 2025
 23:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com>
 <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
 <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
 <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
In-Reply-To: <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 11 Jun 2025 14:52:44 +0800
X-Gm-Features: AX0GCFsgQsBYEedhmjPxxYOEFa7Lezd6IZoo4NA3srqISU4K_ypR7qGlMdQgg-g
Message-ID: <CAHJ8P3+=LEbbj8bzh0N3HbPu=jVkRfkowbxqoT0PfCZtWbuRbg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年6月11日周三 14:47写道： > > On 6/11/25
    14:41, Zhiguo Niu wrote: > > Chao Yu 于2025年6月11日周三 14:07写道：
    > >> > >> On 6/11/25 00:08, Jaegeuk Kim wrote: > >>> H [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.44 listed in wl.mailspike.net]
X-Headers-End: 1uPFKd-0001EO-6b
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
 Jaegeuk Kim <jaegeuk@kernel.org>, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDEx5pel5ZGo5LiJIDE0OjQ3
5YaZ6YGT77yaCj4KPiBPbiA2LzExLzI1IDE0OjQxLCBaaGlndW8gTml1IHdyb3RlOgo+ID4gQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDEx5pel5ZGo5LiJIDE0OjA35YaZ
6YGT77yaCj4gPj4KPiA+PiBPbiA2LzExLzI1IDAwOjA4LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+
Pj4gSGkgWmhpZ3VvLAo+ID4+Pgo+ID4+PiBUaGlzIHBhdGNoIGNhdXNlcyBDUFUgaGFuZyB3aGVu
IHJ1bm5pbmcgZnNzdHJlc3Mgb24gY29tcHJlc3NlZC9ub24tY29tcHJlc3NlZAo+ID4+PiBmaWxl
cy4gUGxlYXNlIGNoZWNrLgo+ID4+Cj4gPj4gT2gsIHNlZW1zIGl0IG1heSBjYXVzZSBiZWxvdyBk
ZWFkbG9jazoKPiA+Pgo+ID4+IENQVTAKPiA+PiBwcm9jZXNzIEEKPiA+PiAtIHNwaW5fbG9jayhp
X2xvY2spCj4gPj4gc29mdHdhcmUgSVJRCj4gPj4gLSBlbmRfaW8KPiA+PiAgLSBpZ3JhYgo+ID4+
ICAgLSBzcGluX2xvY2soaV9sb2NrKQo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4gSGkgQ2hhbywKPiA+
IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCj4gPiBJIGhhdmUgdGVzdGVkIHRoaXMgcGF0
Y2ggbG9jYWxseSBhYm91dCBzb21lIGJhc2ljIGNhc2VzIGJlZm9yZSBzdWJtaXNzaW9uLgo+ID4g
U28gaXQgc2VlbXMgdGhhdCBzaG91bGQgdXNlIHRoZSBmb2xsb3dpbmcgbWV0aG9kICB0byBzb2x2
ZSB0aGlzIHByb2JsZW0/Cj4gPiAiIHN0b3JlIGlfY29tcHJlc3NfYWxnb3JpdGhtL3NiaSBpbiBk
aWMgdG8gYXZvaWQgaW5vZGUgYWNjZXNzPyIKPgo+IFpoaWd1bywKPgo+IFllYWgsIEkgZ3Vlc3Mg
c28uCkhpIENoYW8sCk9LLCBJIHdpbGwgcHJlcGFyZSBpdCAuClRoYW5rcyBhIGxvdC4KPgo+IFRo
YW5rcywKPgo+ID4gdGhhbmtz77yBCj4gPgo+ID4KPiA+Pgo+ID4+Pgo+ID4+PiBPbiAwNi8wNSwg
WmhpZ3VvIE5pdSB3cm90ZToKPiA+Pj4+IFRoZSBkZWNvbXByZXNzX2lvX2N0eCBtYXkgYmUgcmVs
ZWFzZWQgYXN5bmNocm9ub3VzbHkgYWZ0ZXIKPiA+Pj4+IEkvTyBjb21wbGV0aW9uLiBJZiB0aGlz
IGZpbGUgaXMgZGVsZXRlZCBpbW1lZGlhdGVseSBhZnRlciByZWFkLAo+ID4+Pj4gYW5kIHRoZSBr
d29ya2VyIG9mIHByb2Nlc3NpbmcgcG9zdF9yZWFkX3dxIGhhcyBub3QgYmVlbiBleGVjdXRlZCB5
ZXQKPiA+Pj4+IGR1ZSB0byBoaWdoIHdvcmtsb2FkcywgSXQgaXMgcG9zc2libGUgdGhhdCB0aGUg
aW5vZGUoZjJmc19pbm9kZV9pbmZvKQo+ID4+Pj4gaXMgZXZpY3RlZCBhbmQgZnJlZWQgYmVmb3Jl
IGl0IGlzIHVzZWQgZjJmc19mcmVlX2RpYy4KPiA+Pj4+Cj4gPj4+PiAgICAgVGhlIFVBRiBjYXNl
IGFzIGJlbG93Ogo+ID4+Pj4gICAgIFRocmVhZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBUaHJlYWQgQgo+ID4+Pj4gICAgIC0gZjJmc19kZWNvbXByZXNzX2VuZF9pbwo+
ID4+Pj4gICAgICAtIGYyZnNfcHV0X2RpYwo+ID4+Pj4gICAgICAgLSBxdWV1ZV93b3JrCj4gPj4+
PiAgICAgICAgIGFkZCBmcmVlX2RpYyB3b3JrIHRvIHBvc3RfcmVhZF93cQo+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBkb191bmxpbmsK
PiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIGlwdXQKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLSBldmljdAo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLSBjYWxsX3JjdQo+ID4+Pj4gICAgIFRoaXMgZmlsZSBp
cyBkZWxldGVkIGFmdGVyIHJlYWQuCj4gPj4+Pgo+ID4+Pj4gICAgIFRocmVhZCBDICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAga3dvcmtlciB0byBwcm9jZXNzIHBvc3RfcmVhZF93cQo+
ID4+Pj4gICAgIC0gcmN1X2RvX2JhdGNoCj4gPj4+PiAgICAgIC0gZjJmc19mcmVlX2lub2RlCj4g
Pj4+PiAgICAgICAtIGttZW1fY2FjaGVfZnJlZQo+ID4+Pj4gICAgICBpbm9kZSBpcyBmcmVlZCBi
eSByY3UKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0gcHJvY2Vzc19zY2hlZHVsZWRfd29ya3MKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbGF0ZV9mcmVlX2RpYwo+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfZnJlZV9kaWMK
PiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0g
ZjJmc19yZWxlYXNlX2RlY29tcF9tZW0KPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVhZCAoZGljLT5pbm9kZSktPmlfY29tcHJlc3NfYWxnb3JpdGhtCj4gPj4+
Pgo+ID4+Pj4gVGhpcyBwYXRjaCB1c2UgaWdyYWIgYmVmb3JlIGYyZnNfZnJlZV9kaWMgYW5kIGlw
dXQgYWZ0ZXIgZnJlZSB0aGUgZGljIHdoZW4gZGljIGZyZWUKPiA+Pj4+IGFjdGlvbiBpcyBkb25l
IGJ5IGt3b3JrZXIuCj4gPj4+Pgo+ID4+Pj4gQ2M6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdv
b2dsZS5jb20+Cj4gPj4+PiBGaXhlczogYmZmMTM5YjQ5ZDlmICgiZjJmczogaGFuZGxlIGRlY29t
cHJlc3Mgb25seSBwb3N0IHByb2Nlc3NpbmcgaW4gc29mdGlycSIpCj4gPj4+PiBTaWduZWQtb2Zm
LWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPj4+PiBTaWduZWQtb2Zm
LWJ5OiBCYW9jb25nIExpdSA8YmFvY29uZy5saXVAdW5pc29jLmNvbT4KPiA+Pj4+IC0tLQo+ID4+
Pj4gdjM6IHVzZSBpZ3JhYiB0byByZXBsYWNlIF9faWdldAo+ID4+Pj4gdjI6IHVzZSBfX2lnZXQv
aXB1dCBmdW5jdGlvbgo+ID4+Pj4gLS0tCj4gPj4+PiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgMTQg
KysrKysrKysrLS0tLS0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNz
LmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+Pj4+IGluZGV4IGIzYzFkZjkuLjcyOWFkMTYgMTAw
NjQ0Cj4gPj4+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPiA+Pj4+ICsrKyBiL2ZzL2YyZnMv
Y29tcHJlc3MuYwo+ID4+Pj4gQEAgLTE2ODcsNyArMTY4Nyw3IEBAIHN0YXRpYyB2b2lkIGYyZnNf
cmVsZWFzZV9kZWNvbXBfbWVtKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+ID4+Pj4g
IH0KPiA+Pj4+Cj4gPj4+PiAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhzdHJ1Y3QgZGVjb21w
cmVzc19pb19jdHggKmRpYywKPiA+Pj4+IC0gICAgICAgICAgICBib29sIGJ5cGFzc19kZXN0cm95
X2NhbGxiYWNrKTsKPiA+Pj4+ICsgICAgICAgICAgICBib29sIGJ5cGFzc19kZXN0cm95X2NhbGxi
YWNrLCBib29sIGxhdGVfZnJlZSk7Cj4gPj4+Pgo+ID4+Pj4gIHN0cnVjdCBkZWNvbXByZXNzX2lv
X2N0eCAqZjJmc19hbGxvY19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4gPj4+PiAgewo+
ID4+Pj4gQEAgLTE3NDMsMTIgKzE3NDMsMTIgQEAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpm
MmZzX2FsbG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPiA+Pj4+ICAgICAgcmV0dXJu
IGRpYzsKPiA+Pj4+Cj4gPj4+PiAgb3V0X2ZyZWU6Cj4gPj4+PiAtICAgIGYyZnNfZnJlZV9kaWMo
ZGljLCB0cnVlKTsKPiA+Pj4+ICsgICAgZjJmc19mcmVlX2RpYyhkaWMsIHRydWUsIGZhbHNlKTsK
PiA+Pj4+ICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsKPiA+Pj4+ICB9Cj4gPj4+Pgo+ID4+Pj4g
IHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMs
Cj4gPj4+PiAtICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJveV9jYWxsYmFjaykKPiA+Pj4+
ICsgICAgICAgICAgICBib29sIGJ5cGFzc19kZXN0cm95X2NhbGxiYWNrLCBib29sIGxhdGVfZnJl
ZSkKPiA+Pj4+ICB7Cj4gPj4+PiAgICAgIGludCBpOwo+ID4+Pj4KPiA+Pj4+IEBAIC0xNzc1LDYg
KzE3NzUsOCBAQCBzdGF0aWMgdm9pZCBmMmZzX2ZyZWVfZGljKHN0cnVjdCBkZWNvbXByZXNzX2lv
X2N0eCAqZGljLAo+ID4+Pj4gICAgICB9Cj4gPj4+Pgo+ID4+Pj4gICAgICBwYWdlX2FycmF5X2Zy
ZWUoZGljLT5pbm9kZSwgZGljLT5ycGFnZXMsIGRpYy0+bnJfcnBhZ2VzKTsKPiA+Pj4+ICsgICAg
aWYgKGxhdGVfZnJlZSkKPiA+Pj4+ICsgICAgICAgICAgICBpcHV0KGRpYy0+aW5vZGUpOwo+ID4+
Pj4gICAgICBrbWVtX2NhY2hlX2ZyZWUoZGljX2VudHJ5X3NsYWIsIGRpYyk7Cj4gPj4+PiAgfQo+
ID4+Pj4KPiA+Pj4+IEBAIC0xNzgzLDE2ICsxNzg1LDE4IEBAIHN0YXRpYyB2b2lkIGYyZnNfbGF0
ZV9mcmVlX2RpYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPj4+PiAgICAgIHN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZGljID0KPiA+Pj4+ICAgICAgICAgICAgICBjb250YWluZXJfb2Yo
d29yaywgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4LCBmcmVlX3dvcmspOwo+ID4+Pj4KPiA+Pj4+
IC0gICAgZjJmc19mcmVlX2RpYyhkaWMsIGZhbHNlKTsKPiA+Pj4+ICsgICAgZjJmc19mcmVlX2Rp
YyhkaWMsIGZhbHNlLCB0cnVlKTsKPiA+Pj4+ICB9Cj4gPj4+Pgo+ID4+Pj4gIHN0YXRpYyB2b2lk
IGYyZnNfcHV0X2RpYyhzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywgYm9vbCBpbl90YXNr
KQo+ID4+Pj4gIHsKPiA+Pj4+ICAgICAgaWYgKHJlZmNvdW50X2RlY19hbmRfdGVzdCgmZGljLT5y
ZWZjbnQpKSB7Cj4gPj4+PiAgICAgICAgICAgICAgaWYgKGluX3Rhc2spIHsKPiA+Pj4+IC0gICAg
ICAgICAgICAgICAgICAgIGYyZnNfZnJlZV9kaWMoZGljLCBmYWxzZSk7Cj4gPj4+PiArICAgICAg
ICAgICAgICAgICAgICBmMmZzX2ZyZWVfZGljKGRpYywgZmFsc2UsIGZhbHNlKTsKPiA+Pj4+ICAg
ICAgICAgICAgICB9IGVsc2Ugewo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgSU5JVF9XT1JL
KCZkaWMtPmZyZWVfd29yaywgZjJmc19sYXRlX2ZyZWVfZGljKTsKPiA+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgIC8qIHVzZSBpZ3JhYiB0byBhdm9pZCBpbm9kZSBpcyBldmljdGVkIHNpbXVsdGFu
ZW91c2x5ICovCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihGMkZTX0lf
U0IoZGljLT5pbm9kZSksICFpZ3JhYihkaWMtPmlub2RlKSk7Cj4gPj4+PiAgICAgICAgICAgICAg
ICAgICAgICBxdWV1ZV93b3JrKEYyRlNfSV9TQihkaWMtPmlub2RlKS0+cG9zdF9yZWFkX3dxLAo+
ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkaWMtPmZyZWVfd29y
ayk7Cj4gPj4+PiAgICAgICAgICAgICAgfQo+ID4+Pj4gLS0KPiA+Pj4+IDEuOS4xCj4gPj4KPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
