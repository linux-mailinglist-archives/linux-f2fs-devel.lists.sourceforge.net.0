Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D21278B490B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Apr 2024 03:18:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0tBB-0008F4-Lr;
	Sun, 28 Apr 2024 01:18:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1s0tBA-0008Ey-RW
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 01:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BXxvAE4jb4NmLMDJCW8o/zRswMP75gqhLg59Zk222wk=; b=Gu40Qq18xCM95Q+QzVwGKFfWPM
 aqsqo2TINhNvXKabXNEWIXDDS8JvP3pG41yKAzFLpP7c7LSuNS9Ii6IdQe/bb3cLccCzqqYD0OYe8
 VgDAqJT2mhEZCa11+++3SN5bnU/27A6Olmf+g22eZLkgP3cmnSTQ18/HohwE7HfHR1Eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BXxvAE4jb4NmLMDJCW8o/zRswMP75gqhLg59Zk222wk=; b=ktnKwQiGXUD/Ip10jslIKUEhIg
 vDVAuFlAA6IkbjIX9DymVbgNJuWVRemIYO0+sOER9YYOhEznrtg1GjfawI0UwbuUrWvZSvvITOw+G
 GhamQL2t1Uu5wtLJDJYk/p9PyjFyqkqVGpLVVomNCXA3E3UPIf9O09r4jzis3TQcaBzY=;
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0tBA-0001d9-6C for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 01:18:09 +0000
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-47bfea1df1dso1099230137.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Apr 2024 18:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714267083; x=1714871883; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXxvAE4jb4NmLMDJCW8o/zRswMP75gqhLg59Zk222wk=;
 b=GqHTk8158ClFaw2i2F6efgZdrEd39b+BGvaggXlKkgr1NfBGZAAxykgF+ruOVIKuJp
 0B2mIb58EFKHIjF6CMs+kF95mUY8467tdRbf+a22C52nDL1C6vzKuw4APvG2uhgFgBeh
 LRifjAFaHVk7M6OfxFLEiqrQ8p9TelGeToFk+Eq62D6kii5FGhSuaD27GWujrbQ3FNUv
 QTR3E0Z2Da964e/OLlCR74BvhRjdkwWmTOlYXee0lsisP/I4/KkFuUiZkDV3vYY4Evob
 VcYj1M53hLW+QZpBuIoUCEJvRlL+9BHO5usKP3TxBrDbAxvhJWfd+EDQSOsTbT/xbz1q
 hBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714267083; x=1714871883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXxvAE4jb4NmLMDJCW8o/zRswMP75gqhLg59Zk222wk=;
 b=Os43t0ugSeU+Ga0727IQuu9Dway7bueNHBfWT3XDPyrUUbTr9rgKDyCa3eQsy3nRTi
 RIcMB6wxsWnwu23MZ+/aVTn9zt4siIfwN8QO4Ziw6gwm/29AR5qrq0I3I6V1u9RvPsaU
 km9hT1UEsPfzvDFtLlySt71qbInVNkg/1Dq9yRMQE8N/UKuXkS1Qk4IgXozxmePAF/4q
 Bx7aAZpozLJYBSfFi4Zlp89TPdKeUR7wfKPbu0bRCWN1pEZtupaLXk2zxlrcyp4kES9b
 VLtgT0BPnibx7PwO5cwab87W+UtG8ZZnr9l65xh+EcWnceT87iiyQH2bU8lrHyNpU46u
 SfnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRCCYhs4hp4/wcxy4RiEwaOQX7Pnq58BHLBfwLTN2il2dpRqBFa4E3565VLfqJkadRKuxMEelCb5vnFuiiruifFfLd259ejqT9xb5lxlGlmb+KqbBEA==
X-Gm-Message-State: AOJu0YynDp51HJBw37PlW3gLei+zfdG3QGNWwFr6cNrgdSgPSDrDWngd
 Zre3xJOEWMIEzhjTwEcjhRZmNRB8BGJuCWsuiesPBBYPMyXeGUOQhUAbdQEWy3NEOc4BGNDSmCZ
 yeEDEVfsMikWRsaFxA+yQqFNEQlY=
X-Google-Smtp-Source: AGHT+IHLLYNhELW9RrEUPbYDw5MUhQnnNGWG0z01OgzlPT+VWZzcw1VDRhtrI9kakICp237armhjrbq81XWhs1hUTec=
X-Received: by 2002:a05:6102:c8e:b0:47c:f0b:5347 with SMTP id
 f14-20020a0561020c8e00b0047c0f0b5347mr8739370vst.16.1714267082779; Sat, 27
 Apr 2024 18:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240428011236.1008917-1-chao@kernel.org>
In-Reply-To: <20240428011236.1008917-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 27 Apr 2024 18:17:51 -0700
Message-ID: <CACOAw_yY7A6c99p+df9aKf5ZznndfE3wbSVa6w0_41NkmEWO0A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Apr 27, 2024 at 6:12 PM Chao Yu wrote: > > Otherwise,
    it breaks pinfile's sematics. > > Cc: Daeho Jeong > Signed-off-by: Chao Yu
    > --- > v2: > - fix to disallow OPU on pinfile no matte [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.217.42 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.42 listed in wl.mailspike.net]
X-Headers-End: 1s0tBA-0001d9-6C
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: zone: fix to don't trigger OPU on
 pinfile for direct IO
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

T24gU2F0LCBBcHIgMjcsIDIwMjQgYXQgNjoxMuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPdGhlcndpc2UsIGl0IGJyZWFrcyBwaW5maWxlJ3Mgc2VtYXRpY3MuCj4K
PiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiB2MjoKPiAtIGZpeCB0byBkaXNhbGxvdyBP
UFUgb24gcGluZmlsZSBubyBtYXR0ZXIgd2hhdCBkZXZpY2UgdHlwZSBmMmZzIHVzZXMuCj4gIGZz
L2YyZnMvZGF0YS5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJm
cy9kYXRhLmMKPiBpbmRleCBkOGU0NDM0ZTg4MDEuLjU2NjAwZGQ0MzgzNCAxMDA2NDQKPiAtLS0g
YS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gQEAgLTE1OTUsOCArMTU5
NSw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYy
ZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPiAgICAgICAgIH0KPgo+ICAgICAgICAgLyog
dXNlIG91dC1wbGFjZS11cGRhdGUgZm9yIGRpcmVjdCBJTyB1bmRlciBMRlMgbW9kZSAqLwo+IC0g
ICAgICAgaWYgKG1hcC0+bV9tYXlfY3JlYXRlICYmCj4gLSAgICAgICAgICAgKGlzX2hvbGUgfHwg
KGYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTykpKSB7Cj4g
KyAgICAgICBpZiAobWFwLT5tX21heV9jcmVhdGUgJiYgKGlzX2hvbGUgfHwKPiArICAgICAgICAg
ICAgICAgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmIGYyZnNfbGZzX21vZGUoc2JpKSAm
Jgo+ICsgICAgICAgICAgICAgICAhZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkpKSkgewo+ICAg
ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGVyciA9IC1FSU87Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBzeW5jX291dDsKPiAtLQo+IDIuNDAuMQo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
