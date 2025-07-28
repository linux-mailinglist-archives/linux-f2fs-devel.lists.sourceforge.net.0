Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE448B132B8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 03:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q95Iv4naYPNZPEZ9BIlT4fGUEYt44/n3c8JtO5PPbqQ=; b=Klzg272K2GdfznAvv1VJy8vMPg
	96Vgfht7PJv4okFyjN/0D6kvq9VdoQ1B1qF8ttrrp1+jNAuEYJc5wuI8MCiGnmnhghKL9EGstkp9Q
	aLmLTZ8M3oLrTSifNKYN+bL/ZMMLcpbu/btpRIcEQy8hx1BGIGP7xZrX1TJkTk7qdq0c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugCIv-0002m6-U9;
	Mon, 28 Jul 2025 01:05:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1ugCIu-0002lu-Rg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 01:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b0yAlgRTz5Zd4GgIGI64fD+hC9AH6yPyVqGHu8QQlgU=; b=EBGpPWsxZXr9jwuzGR/fQ05gXv
 gyIhPVvNLVD8/zTncj+299ibv90gQ19FQD2ceJ3X9LZO1jTa7WRDwdlqVwNiUdP2nvMhDpZCJMULV
 oxm5SQnuIp7PhiWZTrmjytz4nHkwdx1/lwaEUiWadVGPr5r2GnmJ/HbIoKMtVELp0JEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b0yAlgRTz5Zd4GgIGI64fD+hC9AH6yPyVqGHu8QQlgU=; b=ZOvO/zfvnYnPLNF2WW1B2+hR9K
 aTXIK5eLisykmWxtXI2uPsHTRRKLe+/p74L4FF4HktbysvOuw2eS/NomM6FpvkdzCbex0p8/yW1IH
 ws0LUzYAGNI9h/PUZwV3oRHY02wD5uiXwcCW/1KqvJ5XYk69EXaJWl1yzoIaKLelZxeQ=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ugCIv-0003K0-2h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 01:05:25 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b788e02084so40556f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 27 Jul 2025 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753664718; x=1754269518; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0yAlgRTz5Zd4GgIGI64fD+hC9AH6yPyVqGHu8QQlgU=;
 b=VGW42nmjZsohw01NLymPgleeXhSJGEe0lcUJYnPaR8p3/VsCXeifP1k5UXwruR+l4J
 6/PXT38bkRV3g6WS6eOleIf7OvJYEa6Q7lmw7JvvK9l9+E8rwr511xy35cnmS+/KJmMY
 x0KVdbdEo0WmFgAdAMM07nQd5JdTvVj2mSSOjh24j7e+QABUvGooudHUq1JYfqMhE5+N
 UiZkXTshwslIsL5K0iVgKgGTJpS2uR/UMRZ/kEmM8SRAUjwgzCG121L6JYnmOJBnSsbs
 OFy9Cjncwt9lvG8UbEQTJLoBZdqCvpL1fuo+gsEO524Db7qstdVpLbsHmXP38IXCijE/
 +6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753664718; x=1754269518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0yAlgRTz5Zd4GgIGI64fD+hC9AH6yPyVqGHu8QQlgU=;
 b=eg1FsWaERUMyXwA4pLzzMx3bTd7Cik3ryvez9xEp+8WsY8VLIM1U+Mnn2UYJTyS32l
 1+jMlNvBvkAnGK+vTU+rivtFG5IVuQOXuLYAtM5cLiUwO6psYq+w5QjTpf1VXuUsWuj0
 rgxEnwiMP5QsAGBQb85txpH7Uz/VXbbH5p/nP3r/ysJ0o8nk9cx6CFjoDcHDTpQ4JCSz
 xfm2jXTUvVRbNlcw2PB7jnOIhuiTNaAsYUgJO8EBmUWI9/R5I6E/Uaael+E6/Gb1bXD1
 eJ7H5aMhzUmtsD4okeMwM2uyTzdmyL0yp7/hm0SN6hKXEVCfwAhgFHkkze0WTWH7m7YP
 3mNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvah6QZZYYy1ugQGmAujqYegnXgnBlTy1mMjM1olf3WIsPS486Agjl16TypSviAvkvfYFm/Yo4Hj+XChB1iQs8@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz+N+lgJGjknj8mFrSkOWLgW2TiPZ2Mh9oqK3k+9fCWTG7h3jjs
 O/HLfsVn5WKf77Ug3O5LA3JBiWSC7dGh90D3BJhCBRabe1YI8QwT9lTlDavbD6m0bFO5+ecTcyu
 sWb9ghoWa3xmyMDmuFKneBePt5J/LAhU=
X-Gm-Gg: ASbGnct0TQmVXZ4hcxcRFWsQCOZQZP+FI1Ylz1+mwQMPcueRzzHgkvhED0MgM+QrU3w
 gFhZg/lN6WCaCfOyYHZXIgSOdjAZrrchG/kXR/P3ZYZShPxceGokuXpvcOXPzpFGXlQYLn5yNSx
 OYaEi0BKFHW/Ll1lyMVD9Kh0aomF/O+ZL5jyLQIVkwq1+ER1eeZjrMTBIl8ztWSkqMDg141nLpI
 T5ir2EV
X-Google-Smtp-Source: AGHT+IHHPvKIQsAP7dKGmzcWQefQFtVx4hPoMsQ+HsUVNN2PtYMWl1O2eUcAaOYoGpDyCWUsu1OYi155hpT0nzDF2WE=
X-Received: by 2002:a5d:5f92:0:b0:3a5:3369:391c with SMTP id
 ffacd0b85a97d-3b7766d2d43mr2200021f8f.1.1753664718266; Sun, 27 Jul 2025
 18:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250725054922.3972265-1-chao@kernel.org>
In-Reply-To: <20250725054922.3972265-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 28 Jul 2025 09:05:07 +0800
X-Gm-Features: Ac12FXwqkE8fSsJO0UoEegMdGTPOgVJV_tO03QHQWvLDuYYVwkDYM45AqoWUDuQ
Message-ID: <CAHJ8P3LBH7oxV8nOiwU3yfQSr+LmK58EvFtyF8YLPQ=usZpqFA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao Chao Yu via Linux-f2fs-devel 于2025年7月25日周五
    13:51写道： > > It provides a way to disable linear lookup fallback during
    mkfs. > > Behavior summary: > Android Distro > By default disable [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.43 listed in wl.mailspike.net]
X-Headers-End: 1ugCIv-0003K0-2h
Subject: Re: [f2fs-dev] [PATCH v3] mkfs.f2fs: support -C [no]hashonly to
 control linear lookup fallback
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbwoKQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ35pyIMjXml6XlkajkupQgMTM6NTHlhpnp
gZPvvJoKPgo+IEl0IHByb3ZpZGVzIGEgd2F5IHRvIGRpc2FibGUgbGluZWFyIGxvb2t1cCBmYWxs
YmFjayBkdXJpbmcgbWtmcy4KPgo+IEJlaGF2aW9yIHN1bW1hcnk6Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgQW5kcm9pZCAgICAgICAgIERpc3Rybwo+IEJ5IGRlZmF1bHQgICAgICAgICAgICAg
IGRpc2FibGVkICAgICAgICBlbmFibGVkCj4KPiBBbmRyb2lkIGNhc2U6Cj4KPiAxLjEpIERpc2Fi
bGUgbGluZWFyIGxvb2t1cDoKPiAtIG1rZnMuZjJmcyAtZiAtZyBhbmRyb2lkIC1PIGNhc2Vmb2xk
IC1DIHV0Zjg6aGFzaG9ubHkgL2Rldi92ZGIKPiAtIGR1bXAuZjJmcyAtZDMgL2Rldi92ZGIgfGdy
ZXAgc19lbmNvZGluZ19mbGFncwo+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAg
ICAgICBbMHggICAgICAgMiA6IDJdCj4KPiAxLjIpIEVuYWJsZSBsaW5lYXIgbG9va3VwOgo+IC0g
bWtmcy5mMmZzIC1mIC1nIGFuZHJvaWQgLU8gY2FzZWZvbGQgLUMgdXRmODpub2hhc2hvbmx5IC9k
ZXYvdmRiCj4gLSBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MK
PiBzX2VuY29kaW5nX2ZsYWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDAgOiAw
XQo+Cj4gMS4zKSBCeSBkZWZhdWx0Ogo+IC0gbWtmcy5mMmZzIC1mIC1nIGFuZHJvaWQgLU8gY2Fz
ZWZvbGQgLUMgdXRmOCAvZGV2L3ZkYgo+IEluZm86IHNldCBkZWZhdWx0IGxpbmVhcl9sb29rdXAg
b3B0aW9uOiBkaXNhYmxlCj4gLSBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2Rp
bmdfZmxhZ3MKPiBzX2VuY29kaW5nX2ZsYWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAg
ICAgIDIgOiAyXQo+Cj4gRGlzdHJvIGNhc2U6Cj4KPiAyLjEpIERpc2FibGUgbGluZWFyIGxvb2t1
cDoKPiAtIG1rZnMuZjJmcyAtZiAtTyBjYXNlZm9sZCAtQyB1dGY4Omhhc2hvbmx5IC9kZXYvdmRi
Cj4gLSBkdW1wLmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPiBzX2Vu
Y29kaW5nX2ZsYWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAyXQo+Cj4g
Mi4yKSBFbmFibGUgbGluZWFyIGxvb2t1cDoKPiAtIG1rZnMuZjJmcyAtZiAtTyBjYXNlZm9sZCAt
QyB1dGY4Om5vaGFzaG9ubHkgL2Rldi92ZGIKPiAtIGR1bXAuZjJmcyAtZDMgL2Rldi92ZGIgfGdy
ZXAgc19lbmNvZGluZ19mbGFncwo+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAg
ICAgICBbMHggICAgICAgMCA6IDBdCj4KPiAyLjMpIEJ5IGRlZmF1bHQ6Cj4gLSBta2ZzLmYyZnMg
LWYgLU8gY2FzZWZvbGQgLUMgdXRmOCAvZGV2L3ZkYgo+IC0gZHVtcC5mMmZzIC1kMyAvZGV2L3Zk
YiB8Z3JlcCBzX2VuY29kaW5nX2ZsYWdzCj4gc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAg
ICAgICAgICAgIFsweCAgICAgICAwIDogMF0KPgpJdCBpcyB2ZXJ5IGNsZWFyIGFuZCBlYXN5IHRv
IHVuZGVyc3RhbmQuCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+
IC0tLQo+IHYzOgo+IC0gaG9ub3IgW25vXWhhc2hvbmx5IGZsYWcgZm9yIEFuZHJvaWQgY2FzZQo+
IC0gdXBkYXRlIHRlc3RjYXNlIGFuZCBvdXRwdXQKPiAgaW5jbHVkZS9mMmZzX2ZzLmggICAgICAg
fCAgMyArKy0KPiAgbGliL2xpYmYyZnMuYyAgICAgICAgICAgfCAgNiArKysrKysKPiAgbWFuL21r
ZnMuZjJmcy44ICAgICAgICAgfCAgOSArKysrKysrKy0KPiAgbWtmcy9mMmZzX2Zvcm1hdC5jICAg
ICAgfCAxMSArKysrKysrKysrKwo+ICBta2ZzL2YyZnNfZm9ybWF0X21haW4uYyB8ICAzICsrLQo+
ICA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9mMmZzX2ZzLmggYi9pbmNsdWRlL2YyZnNfZnMuaAo+IGluZGV4
IGY3MjY4ZDEuLmE4ZGE4ZmEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9mMmZzX2ZzLmgKPiArKysg
Yi9pbmNsdWRlL2YyZnNfZnMuaAo+IEBAIC0xNDc4LDcgKzE0NzgsOCBAQCBlbnVtIHsKPgo+ICAv
KiBmZWF0dXJlIGxpc3QgaW4gQW5kcm9pZCAqLwo+ICBlbnVtIHsKPiAtICAgICAgIEYyRlNfRkVB
VFVSRV9OQVRfQklUUyA9IDB4MDAwMSwKPiArICAgICAgIEYyRlNfRkVBVFVSRV9OQVRfQklUUyAg
ICAgICAgICAgPSAweDAwMDEsCj4gKyAgICAgICBGMkZTX0ZFQVRVUkVfTElORUFSX0xPT0tVUCAg
ICAgID0gMHgwMDAyLAo+ICB9Owo+Cj4gIC8qIG5vbGluZWFyIGxvb2t1cCB0dW5lICovCj4gZGlm
ZiAtLWdpdCBhL2xpYi9saWJmMmZzLmMgYi9saWIvbGliZjJmcy5jCj4gaW5kZXggMmYwMTJjOC4u
MWE0OTZiNyAxMDA2NDQKPiAtLS0gYS9saWIvbGliZjJmcy5jCj4gKysrIGIvbGliL2xpYmYyZnMu
Ywo+IEBAIC0xNDI0LDYgKzE0MjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVuY19mbGFncyB7
Cj4gICAgICAgICBjaGFyICpwYXJhbTsKPiAgfSBlbmNvZGluZ19mbGFnc1tdID0gewo+ICAgICAg
ICAgeyBGMkZTX0VOQ19TVFJJQ1RfTU9ERV9GTCwgInN0cmljdCIgfSwKPiArICAgICAgIHsgRjJG
U19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMLCAiaGFzaG9ubHkifQo+ICB9Owo+Cj4gIC8qIFJl
dHVybiBhIHBvc2l0aXZlIG51bWJlciA8IDB4ZmYgaW5kaWNhdGluZyB0aGUgZW5jb2RpbmcgbWFn
aWMgbnVtYmVyCj4gQEAgLTE0ODUsNiArMTQ4NiwxMSBAQCBpbnQgZjJmc19zdHIyZW5jb2Rpbmdf
ZmxhZ3MoY2hhciAqKnBhcmFtLCBfX3UxNiAqZmxhZ3MpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICpmbGFncyB8PSBmbC0+ZmxhZzsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0KPgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGZsLT5mbGFnID09IEYyRlNfRU5DX05PX0NPTVBBVF9GQUxMQkFDS19GTCkKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5ub2xpbmVhcl9sb29rdXAgPSBuZWcgPwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExJTkVBUl9M
T09LVVBfRU5BQkxFIDoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBMSU5FQVJfTE9PS1VQX0RJU0FCTEU7Cj4gKwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBuZXh0X2ZsYWc7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+
ICAgICAgICAgICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL21hbi9ta2ZzLmYyZnMuOCBiL21hbi9t
a2ZzLmYyZnMuOAo+IGluZGV4IDhiM2IwY2MuLmZjYjIyN2MgMTAwNjQ0Cj4gLS0tIGEvbWFuL21r
ZnMuZjJmcy44Cj4gKysrIGIvbWFuL21rZnMuZjJmcy44Cj4gQEAgLTIzMiwxMCArMjMyLDE3IEBA
IFVzZSBVVEYtOCBmb3IgY2FzZWZvbGRpbmcuCj4gIC5JIGZsYWdzOgo+ICAuUlMgMS4yaQo+ICAu
VFAgMS4yaQo+IC0uQiBzdHJpY3QKPiArLkIgW25vXXN0cmljdAo+ICBUaGlzIGZsYWcgc3BlY2lm
aWVzIHRoYXQgaW52YWxpZCBzdHJpbmdzIHNob3VsZCBiZSByZWplY3RlZCBieSB0aGUgZmlsZXN5
c3RlbS4KPiAgRGVmYXVsdCBpcyBkaXNhYmxlZC4KPiAgLlJFCj4gKy5SUyAxLjJpCj4gKy5UUCAx
LjJpCj4gKy5CIFtub11oYXNob25seQo+ICtUaGlzIGZsYWcgc3BlY2lmaWVzIHRoYXQgbGluZWFy
IGxvb2t1cCBmYWxsYmFjayBpcyBvZmYgZHVyaW5nIGxvb2t1cCwgdG8gdHVybgo+ICtvZmYgbGlu
ZWFyIGxvb2t1cCBmYWxsYmFjaywgdXNlIG5vaGFzaG9ubHkgZmxhZy4KaGVyZSBzaG91bGQgInRv
IHR1cm4gb2ZmIGxpbmVhciBsb29rdXAgZmFsbGJhY2ssIHVzZSBoYXNob25seSBmbGFnIj8Kb3Ig
InRvIHR1cm4gb24gbGluZWFyIGxvb2t1cCBmYWxsYmFjaywgdXNlIG5vaGFzaG9ubHkgZmxhZyIK
MS4xKSBEaXNhYmxlIGxpbmVhciBsb29rdXA6Ci0gbWtmcy5mMmZzIC1mIC1nIGFuZHJvaWQgLU8g
Y2FzZWZvbGQgLUMgdXRmODpoYXNob25seSAvZGV2L3ZkYgoKPiArRm9yIGFuZHJvaWQgY2FzZSwg
aXQgd2lsbCBkaXNhYmxlIGxpbmVhciBsb29rdXAgYnkgZGVmYXVsdC4KPiArLlJFCj4gIC5SRQo+
ICAuVFAKPiAgLkJJIFwtcQo+IGRpZmYgLS1naXQgYS9ta2ZzL2YyZnNfZm9ybWF0LmMgYi9ta2Zz
L2YyZnNfZm9ybWF0LmMKPiBpbmRleCAyNjgwYmQzLi4wNGRmYzIwIDEwMDY0NAo+IC0tLSBhL21r
ZnMvZjJmc19mb3JtYXQuYwo+ICsrKyBiL21rZnMvZjJmc19mb3JtYXQuYwo+IEBAIC02NzEsNiAr
NjcxLDE3IEBAIHN0YXRpYyBpbnQgZjJmc19wcmVwYXJlX3N1cGVyX2Jsb2NrKHZvaWQpCj4gICAg
ICAgICBtZW1jcHkoc2ItPmluaXRfdmVyc2lvbiwgYy52ZXJzaW9uLCBWRVJTSU9OX0xFTik7Cj4K
PiAgICAgICAgIGlmIChjLmZlYXR1cmUgJiBGMkZTX0ZFQVRVUkVfQ0FTRUZPTEQpIHsKPiArICAg
ICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogaWYgW25vXWhhc2hvbmx5IG9wdGlv
biBpcyBub3QgYXNzaWduZWQsIGxldCdzIGRpc2FibGUKPiArICAgICAgICAgICAgICAgICogbGlu
ZWFyIGxvb2t1cCBmYWxsYmFjayBieSBkZWZhdWx0IGZvciBBbmRyb2lkIGNhc2UuCj4gKyAgICAg
ICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBpZiAoKGMubm9saW5lYXJfbG9va3VwID09
IExJTkVBUl9MT09LVVBfREVGQVVMVCkgJiYKPiArICAgICAgICAgICAgICAgICAgICAgICAoYy5k
aXNhYmxlZF9mZWF0dXJlICYgRjJGU19GRUFUVVJFX0xJTkVBUl9MT09LVVApKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYy5zX2VuY29kaW5nX2ZsYWdzIHw9IEYyRlNfRU5DX05PX0NPTVBB
VF9GQUxMQkFDS19GTDsKPiArICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IHNl
dCBkZWZhdWx0IGxpbmVhcl9sb29rdXAgb3B0aW9uOiAlc1xuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMuc19lbmNvZGluZ19mbGFncyAmIEYyRlNfRU5DX05PX0NPTVBBVF9G
QUxMQkFDS19GTCA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZGlzYWJsZSIg
OiAiZW5hYmxlIik7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgc2V0X3Ni
KHNfZW5jb2RpbmcsIGMuc19lbmNvZGluZyk7Cj4gICAgICAgICAgICAgICAgIHNldF9zYihzX2Vu
Y29kaW5nX2ZsYWdzLCBjLnNfZW5jb2RpbmdfZmxhZ3MpOwo+ICAgICAgICAgfQo+IGRpZmYgLS1n
aXQgYS9ta2ZzL2YyZnNfZm9ybWF0X21haW4uYyBiL21rZnMvZjJmc19mb3JtYXRfbWFpbi5jCj4g
aW5kZXggZjBiZWM0Zi4uOGY4ZTk3NSAxMDA2NDQKPiAtLS0gYS9ta2ZzL2YyZnNfZm9ybWF0X21h
aW4uYwo+ICsrKyBiL21rZnMvZjJmc19mb3JtYXRfbWFpbi5jCj4gQEAgLTE0Myw3ICsxNDMsOCBA
QCBzdGF0aWMgdm9pZCBhZGRfZGVmYXVsdF9vcHRpb25zKHZvaWQpCj4gICAgICAgICAgICAgICAg
IGZvcmNlX292ZXJ3cml0ZSA9IDE7Cj4gICAgICAgICAgICAgICAgIGMud2FudGVkX3NlY3Rvcl9z
aXplID0gRjJGU19CTEtTSVpFOwo+ICAgICAgICAgICAgICAgICBjLnJvb3RfdWlkID0gYy5yb290
X2dpZCA9IDA7Cj4gLSAgICAgICAgICAgICAgIGMuZGlzYWJsZWRfZmVhdHVyZSB8PSBGMkZTX0ZF
QVRVUkVfTkFUX0JJVFM7Cj4gKyAgICAgICAgICAgICAgIGMuZGlzYWJsZWRfZmVhdHVyZSB8PSBG
MkZTX0ZFQVRVUkVfTkFUX0JJVFMgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBGMkZTX0ZFQVRVUkVfTElORUFSX0xPT0tVUDsKPgo+ICAgICAgICAgICAgICAgICAv
KiBSTyBkb2Vzbid0IG5lZWQgYW55IG90aGVyIGZlYXR1cmVzICovCj4gICAgICAgICAgICAgICAg
IGlmIChjLmZlYXR1cmUgJiBGMkZTX0ZFQVRVUkVfUk8pCm90aGVycyBsb29rIE9LIHRvIG1lLHNv
ClJldmlld2VkLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gLS0KPiAy
LjQ5LjAKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
