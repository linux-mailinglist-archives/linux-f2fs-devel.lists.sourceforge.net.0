Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2777E787
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 19:25:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWKGq-0006dn-9v;
	Wed, 16 Aug 2023 17:25:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk.kim@gmail.com>) id 1qWKGp-0006dh-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 17:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lcg8Ni+CYqpE9pw23y2BhEPCgIJMCZ+tDRHEWzIvQQU=; b=cWHSQPvRWpQ/5+OdlS5ZgUm/Fi
 8phZBxcMKXOrPzfl4szVlW9Egvv0PKfD1h8uaCIzTQJBywuGwobrXtGB0ZU9VkQ8rnk1fk+jFvZF1
 cUVyfSj/T5XwOG3nhwKKOkO84vxvzFQNkT5NWbSdKmaPhsTH0g9rvsZiMQSwlBMlDh1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lcg8Ni+CYqpE9pw23y2BhEPCgIJMCZ+tDRHEWzIvQQU=; b=Dn3J5oX7gZS+cn/3DMJ847GQdt
 Te5q4b4NavlLNlx9HSHCsqIn4e94RtTdcZYja1HnAFmg+Rxain05trEAnNhjBIR3gDuV2ZXQH0I+L
 lwsDL+XwDfEz3QwpS77jRdjG36mnDjNp+9YYYpHIY+f7Py088CxaaDW2t4i9bSjvWJ2A=;
Received: from mail-vk1-f175.google.com ([209.85.221.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qWKGp-007FvA-R8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 17:25:24 +0000
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-48b8623f34dso59069e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 16 Aug 2023 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692206718; x=1692811518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcg8Ni+CYqpE9pw23y2BhEPCgIJMCZ+tDRHEWzIvQQU=;
 b=PsTHbP89pwGlUNDPhkHt+pFsa7l4rkQVPKnLXraYaq62Id297CB5LYPphNhsSpsZr7
 WHS/lgiYzc7mB2MYmQKVSoIQd3rcdiLxYoOVpl5DlBaIprQSgpJ3wnIx/ZXuzmIBfIkl
 6UoM4lSlx59k+Z1PPqTNqUaHv1MvJ8NTpMsuo34/jt4A42SzcfA5+KpeJgNL1bg5qjIJ
 vj+8BNHXBfNwdeTJEwQoqyHyyKhzQ1p7Ok+4hDlnmFxpXRBFEaSSj0f2td+dg/xiKGvU
 6mwyTHfJJ7qRtd4spWLhfqYxJwLEF1GaTi/2L1EvPi7QsEpGE0P4V4f1mYleB69PxmB1
 jN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692206718; x=1692811518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcg8Ni+CYqpE9pw23y2BhEPCgIJMCZ+tDRHEWzIvQQU=;
 b=OTWwRlTxqSE531wq/QcNhu5SInzrSyhHuxDLn2zXbZzfW7FCN+40ZyhgYczilxP8o+
 ta68RZtJqVvR6X5ErY6OjawZIGaV7JnvpanYxRHHtZ9CaCyvjBNUrbwhK/ef6gZTa3O0
 cfvIkgKsPZmJ//LB6m71w7cffujV5yrL3m94eBmm46KUU6KPKf67MLOR8csWIlIWQWp8
 icyVYcpl7/1z/kjbCeDLjc8XQdhs14rs2s6TkP/T/oFWBioPFbQjgc68E8tDHM4GWY+y
 S2L4nNbpdo+eXgy295a3w82k9YVenPXLhCMEXBZgiMh4HHlRfimlsQQwlRwVWe8d+QBD
 NUcw==
X-Gm-Message-State: AOJu0Yzu5O+bcYjnNbjYiZP/6kV12muE2dwMb6f39RD+rWMcADXP34zC
 wqAnmt8MDFQnP3Ubr3UFrODiJFL8zcljtqEEDCPRuWEPSDc=
X-Google-Smtp-Source: AGHT+IG1eDqw+bEitga5LptUzZ9sI2iwQN8klkhVXS51A1Jla7y3lzg9FGE1aiCvp053BMR5MXXEHgk89vwDlkto7fU=
X-Received: by 2002:a1f:ccc6:0:b0:486:3e05:da14 with SMTP id
 c189-20020a1fccc6000000b004863e05da14mr2319420vkg.12.1692206717802; Wed, 16
 Aug 2023 10:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
In-Reply-To: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
From: Jaegeuk Kim <jaegeuk.kim@gmail.com>
Date: Wed, 16 Aug 2023 10:25:06 -0700
Message-ID: <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Aug 15, 2023 at 10:09 PM Guenter Roeck wrote:
    > > Hi, > > when trying to boot from an f2fs file system with lock debugging
    enabled, > I get the attached circular locking dependency warning [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [jaegeuk.kim[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1qWKGp-007FvA-R8
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAxMDowOeKAr1BNIEd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4KPiBIaSwKPgo+IHdoZW4gdHJ5aW5nIHRvIGJvb3Qg
ZnJvbSBhbiBmMmZzIGZpbGUgc3lzdGVtIHdpdGggbG9jayBkZWJ1Z2dpbmcgZW5hYmxlZCwKPiBJ
IGdldCB0aGUgYXR0YWNoZWQgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IHdhcm5pbmcuIElz
IHRoaXMgYSBrbm93bgo+IHByb2JsZW0gPwo+Cj4gVGhhbmtzLAo+IEd1ZW50ZXIKPgo+IC0tLQo+
IFsgICAxMC4zMTU1MjJdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+IFsgICAxMC4zMTU2MjBdIFdBUk5JTkc6IHBvc3NpYmxlIGNpcmN1bGFy
IGxvY2tpbmcgZGVwZW5kZW5jeSBkZXRlY3RlZAo+IFsgICAxMC4zMTU3NTNdIDYuNS4wLXJjNi0w
MDAyNy1nOTFhYTZjNDEyZDdmICMxIFRhaW50ZWQ6IEcgICAgICAgICAgICAgICAgIE4KPiBbICAg
MTAuMzE1ODQzXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBbICAgMTAuMzE1OTIyXSBzZWVkcm5nLzcxNyBpcyB0cnlpbmcgdG8gYWNxdWly
ZSBsb2NrOgo+IFsgICAxMC4zMTYwMTBdIGZmZmY4ZTBlMDJjNmI4NjggKCZmaS0+aV9zZW0peysu
Ky59LXszOjN9LCBhdDogZjJmc19hZGRfaW5saW5lX2VudHJ5KzB4MTM0LzB4MmQwCj4gWyAgIDEw
LjMxNjMxNV0KPiBbICAgMTAuMzE2MzE1XSBidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9j
azoKPiBbICAgMTAuMzE2MzkxXSBmZmZmOGUwZTAyYzZiMjc4ICgmZmktPmlfeGF0dHJfc2VtKXsu
Ky4rfS17MzozfSwgYXQ6IGYyZnNfYWRkX2RlbnRyeSsweDQxLzB4YzAKPiBbICAgMTAuMzE2NTQz
XQo+IFsgICAxMC4zMTY1NDNdIHdoaWNoIGxvY2sgYWxyZWFkeSBkZXBlbmRzIG9uIHRoZSBuZXcg
bG9jay4KPiBbICAgMTAuMzE2NTQzXQo+IFsgICAxMC4zMTY2NDFdCj4gWyAgIDEwLjMxNjY0MV0g
dGhlIGV4aXN0aW5nIGRlcGVuZGVuY3kgY2hhaW4gKGluIHJldmVyc2Ugb3JkZXIpIGlzOgo+IFsg
ICAxMC4zMTY3NDVdCj4gWyAgIDEwLjMxNjc0NV0gLT4gIzEgKCZmaS0+aV94YXR0cl9zZW0pey4r
Lit9LXszOjN9Ogo+IFsgICAxMC4zMTY4ODNdICAgICAgICBkb3duX3JlYWQrMHgzZC8weDE3MAo+
IFsgICAxMC4zMTY5NzNdICAgICAgICBmMmZzX2dldHhhdHRyKzB4MzcwLzB4NDQwCj4gWyAgIDEw
LjMxNzAzNl0gICAgICAgIF9fZjJmc19nZXRfYWNsKzB4MzgvMHgxZTAKPiBbICAgMTAuMzE3MDk0
XSAgICAgICAgZjJmc19pbml0X2FjbCsweDY5LzB4NDIwCj4gWyAgIDEwLjMxNzE1MV0gICAgICAg
IGYyZnNfaW5pdF9pbm9kZV9tZXRhZGF0YSsweDcyLzB4NDUwCj4gWyAgIDEwLjMxNzIxOF0gICAg
ICAgIGYyZnNfYWRkX3JlZ3VsYXJfZW50cnkrMHgzNzIvMHg1MTAKPiBbICAgMTAuMzE3MjgzXSAg
ICAgICAgZjJmc19hZGRfZGVudHJ5KzB4YjgvMHhjMAo+IFsgICAxMC4zMTczNDBdICAgICAgICBm
MmZzX2RvX2FkZF9saW5rKzB4ZDkvMHgxMTAKPiBbICAgMTAuMzE3Mzk5XSAgICAgICAgZjJmc19t
a2RpcisweGRmLzB4MTgwCj4gWyAgIDEwLjMxNzQ1M10gICAgICAgIHZmc19ta2RpcisweDE0Mi8w
eDIyMAo+IFsgICAxMC4zMTc1MDhdICAgICAgICBkb19ta2RpcmF0KzB4N2MvMHgxMjAKPiBbICAg
MTAuMzE3NTYxXSAgICAgICAgX194NjRfc3lzX21rZGlyKzB4NDcvMHg3MAo+IFsgICAxMC4zMTc2
MTddICAgICAgICBkb19zeXNjYWxsXzY0KzB4M2YvMHg5MAo+IFsgICAxMC4zMTc2NzNdICAgICAg
ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3My8weGRkCj4gWyAgIDEwLjMxNzc1
N10KPiBbICAgMTAuMzE3NzU3XSAtPiAjMCAoJmZpLT5pX3NlbSl7Ky4rLn0tezM6M306Cj4gWyAg
IDEwLjMxNzg0M10gICAgICAgIF9fbG9ja19hY3F1aXJlKzB4MTZiZi8weDI4NjAKPiBbICAgMTAu
MzE3OTA3XSAgICAgICAgbG9ja19hY3F1aXJlKzB4Y2MvMHgyYzAKPiBbICAgMTAuMzE3OTYyXSAg
ICAgICAgZG93bl93cml0ZSsweDNhLzB4YzAKPiBbICAgMTAuMzE4MDE0XSAgICAgICAgZjJmc19h
ZGRfaW5saW5lX2VudHJ5KzB4MTM0LzB4MmQwCj4gWyAgIDEwLjMxODA3N10gICAgICAgIGYyZnNf
YWRkX2RlbnRyeSsweDU1LzB4YzAKPiBbICAgMTAuMzE4MTQxXSAgICAgICAgZjJmc19kb19hZGRf
bGluaysweGQ5LzB4MTEwCj4gWyAgIDEwLjMxODIwMV0gICAgICAgIGYyZnNfY3JlYXRlKzB4ZTgv
MHgxNzAKPiBbICAgMTAuMzE4MjU1XSAgICAgICAgbG9va3VwX29wZW4uaXNyYS4wKzB4NThlLzB4
NmMwCj4gWyAgIDEwLjMxODMxN10gICAgICAgIHBhdGhfb3BlbmF0KzB4MmFmLzB4YTQwCj4gWyAg
IDEwLjMxODM3Ml0gICAgICAgIGRvX2ZpbHBfb3BlbisweGIxLzB4MTYwCj4gWyAgIDEwLjMxODQy
OF0gICAgICAgIGRvX3N5c19vcGVuYXQyKzB4OTEvMHhjMAo+IFsgICAxMC4zMTg0ODVdICAgICAg
ICBfX3g2NF9zeXNfb3BlbisweDU0LzB4YTAKPiBbICAgMTAuMzE4NTQxXSAgICAgICAgZG9fc3lz
Y2FsbF82NCsweDNmLzB4OTAKPiBbICAgMTAuMzE4NTk3XSAgICAgICAgZW50cnlfU1lTQ0FMTF82
NF9hZnRlcl9od2ZyYW1lKzB4NzMvMHhkZAo+IFsgICAxMC4zMTg2NzZdCj4gWyAgIDEwLjMxODY3
Nl0gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAgdXMgZGVidWcgdGhpczoKPiBbICAgMTAuMzE4
Njc2XQo+IFsgICAxMC4zMTg3OTldICBQb3NzaWJsZSB1bnNhZmUgbG9ja2luZyBzY2VuYXJpbzoK
PiBbICAgMTAuMzE4Nzk5XQo+IFsgICAxMC4zMTg4NzVdICAgICAgICBDUFUwICAgICAgICAgICAg
ICAgICAgICBDUFUxCj4gWyAgIDEwLjMxODkzNV0gICAgICAgIC0tLS0gICAgICAgICAgICAgICAg
ICAgIC0tLS0KPiBbICAgMTAuMzE4OTk5XSAgIHJsb2NrKCZmaS0+aV94YXR0cl9zZW0pOwo+IFsg
ICAxMC4zMTkwNjhdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZmaS0+aV9z
ZW0pOwo+IFsgICAxMC4zMTkxNjZdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2Nr
KCZmaS0+aV94YXR0cl9zZW0pOwo+IFsgICAxMC4zMTkyNjRdICAgbG9jaygmZmktPmlfc2VtKTsK
Ckl0IGxvb2tzIGxpa2UgdGhlIHNhbWUgb25lIHJlcG9ydGVkIGJ5IHN5emJvdC4KaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWE0OTc2Y2U5NDlkZjY2YjFkZGYxCgpIb3dl
dmVyLCBJIHN1c3BlY3QgaXQncyBhIGZhbHNlIGFsYXJtLCBzaW5jZSBJJ20gaW50ZXJwcmV0aW5n
IHRoZSBsb29wIGFzIGJlbG93LgoKQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQ1BVMQpsb2NrKG5ld19pbm9kZSMxLT5pX3hhdHRyX3NlbSkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jayhuZXdfaW5vZGUjMi0+
aV9zZW0pCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxvY2soZGlyLT5pX3hhdHRyX3NlbSkKbG9jayhuZXdfaW5vZGUjMS0+aV9zZW0pCgpUaGlzIGxv
b2tzIGZpbmUgdG8gbWUuCgo+IFsgICAxMC4zMTkzMjVdCj4gWyAgIDEwLjMxOTMyNV0gICoqKiBE
RUFETE9DSyAqKioKPiBbICAgMTAuMzE5MzI1XQo+IFsgICAxMC4zMTk0MTNdIDQgbG9ja3MgaGVs
ZCBieSBzZWVkcm5nLzcxNzoKPiBbICAgMTAuMzE5NTAwXSAgIzA6IGZmZmY4ZTBlMDQ5NjkzZTgg
KHNiX3dyaXRlcnMjNCl7LisuK30tezA6MH0sIGF0OiBwYXRoX29wZW5hdCsweGEwOC8weGE0MAo+
IFsgICAxMC4zMTk2NDVdICAjMTogZmZmZjhlMGUwMmM2YWMyOCAoJnR5cGUtPmlfbXV0ZXhfZGly
X2tleSMzKXsrKysrfS17MzozfSwgYXQ6IHBhdGhfb3BlbmF0KzB4MjliLzB4YTQwCj4gWyAgIDEw
LjMxOTc4M10gICMyOiBmZmZmOGUwZTA1MDYyM2E4ICgmc2JpLT5jcF9yd3NlbSl7LisuK30tezM6
M30sIGF0OiBmMmZzX2NyZWF0ZSsweGNjLzB4MTcwCj4gWyAgIDEwLjMxOTg5OV0gICMzOiBmZmZm
OGUwZTAyYzZiMjc4ICgmZmktPmlfeGF0dHJfc2VtKXsuKy4rfS17MzozfSwgYXQ6IGYyZnNfYWRk
X2RlbnRyeSsweDQxLzB4YzAKPiBbICAgMTAuMzIwMDI5XQo+IFsgICAxMC4zMjAwMjldIHN0YWNr
IGJhY2t0cmFjZToKPiBbICAgMTAuMzIwMTY2XSBDUFU6IDcgUElEOiA3MTcgQ29tbTogc2VlZHJu
ZyBUYWludGVkOiBHICAgICAgICAgICAgICAgICBOIDYuNS4wLXJjNi0wMDAyNy1nOTFhYTZjNDEy
ZDdmICMxCj4gWyAgIDEwLjMyMDMwMl0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAo
UTM1ICsgSUNIOSwgMjAwOSksIEJJT1MgcmVsLTEuMTYuMi0wLWdlYTFiN2EwNzMzOTAtcHJlYnVp
bHQucWVtdS5vcmcgMDQvMDEvMjAxNAo+IFsgICAxMC4zMjA0OTldIENhbGwgVHJhY2U6Cj4gWyAg
IDEwLjMyMDU3OV0gIDxUQVNLPgo+IFsgICAxMC4zMjA2NjVdICBkdW1wX3N0YWNrX2x2bCsweDY0
LzB4YjAKPiBbICAgMTAuMzIwNzY2XSAgY2hlY2tfbm9uY2lyY3VsYXIrMHgxNTEvMHgxNzAKPiBb
ICAgMTAuMzIwODM0XSAgPyByZWdpc3Rlcl9sb2NrX2NsYXNzKzB4NDIvMHg3YTAKPiBbICAgMTAu
MzIwOTA2XSAgX19sb2NrX2FjcXVpcmUrMHgxNmJmLzB4Mjg2MAo+IFsgICAxMC4zMjA5NzRdICBs
b2NrX2FjcXVpcmUrMHhjYy8weDJjMAo+IFsgICAxMC4zMjEwMjZdICA/IGYyZnNfYWRkX2lubGlu
ZV9lbnRyeSsweDEzNC8weDJkMAo+IFsgICAxMC4zMjEwOThdICBkb3duX3dyaXRlKzB4M2EvMHhj
MAo+IFsgICAxMC4zMjExNTZdICA/IGYyZnNfYWRkX2lubGluZV9lbnRyeSsweDEzNC8weDJkMAo+
IFsgICAxMC4zMjEyMjBdICBmMmZzX2FkZF9pbmxpbmVfZW50cnkrMHgxMzQvMHgyZDAKPiBbICAg
MTAuMzIxMjkwXSAgZjJmc19hZGRfZGVudHJ5KzB4NTUvMHhjMAo+IFsgICAxMC4zMjEzNDhdICBm
MmZzX2RvX2FkZF9saW5rKzB4ZDkvMHgxMTAKPiBbICAgMTAuMzIxNDEwXSAgZjJmc19jcmVhdGUr
MHhlOC8weDE3MAo+IFsgICAxMC4zMjE0NjRdICBsb29rdXBfb3Blbi5pc3JhLjArMHg1OGUvMHg2
YzAKPiBbICAgMTAuMzIxNTM2XSAgPyB2ZXJpZnlfY3B1KzB4MjAvMHgxMDAKPiBbICAgMTAuMzIx
NjA1XSAgPyB2ZXJpZnlfY3B1KzB4MjAvMHgxMDAKPiBbICAgMTAuMzIxNjYyXSAgcGF0aF9vcGVu
YXQrMHgyYWYvMHhhNDAKPiBbICAgMTAuMzIxNzIyXSAgZG9fZmlscF9vcGVuKzB4YjEvMHgxNjAK
PiBbICAgMTAuMzIxNzc3XSAgPyBhbGxvY19mZCsweDNjLzB4MjIwCj4gWyAgIDEwLjMyMTgzOF0g
ID8gX3Jhd19zcGluX3VubG9jaysweDFlLzB4NDAKPiBbICAgMTAuMzIxOTAxXSAgZG9fc3lzX29w
ZW5hdDIrMHg5MS8weGMwCj4gWyAgIDEwLjMyMTk1OV0gIF9feDY0X3N5c19vcGVuKzB4NTQvMHhh
MAo+IFsgICAxMC4zMjIwMTRdICBkb19zeXNjYWxsXzY0KzB4M2YvMHg5MAo+IFsgICAxMC4zMjIw
NjZdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3My8weGRkCj4gWyAgIDEwLjMy
MjE4Ml0gUklQOiAwMDMzOjB4N2ZmYmU5NDUzMmRlCj4gWyAgIDEwLjMyMjM4NF0gQ29kZTogYzMg
OGIgMDcgODUgYzAgNzUgMjQgNDkgODkgZmIgNDggODkgZjAgNDggODkgZDcgNDggODkgY2UgNGMg
ODkgYzIgNGQgODkgY2EgNGMgOGIgNDQgMjQgMDggNGMgOGIgNGMgMjQgMTAgNGMgODkgNWMgMjQg
MDggMGYgMDUgPGMzPiBlOSA0YiBjZSBmZiBmZiA0MSA1NCA0Cj4gOSA4OSBmNCBiZSAwMCA4OCAw
OCAwMCA1NSA1MyA0OCA4MSBlYyBhMAo+IFsgICAxMC4zMjI2MTldIFJTUDogMDAyYjowMDAwN2Zm
YzBjZmM3ZWQ4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDIKPiBb
ICAgMTAuMzIyNzMwXSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2ZmYmU5NDk1YjQ4
IFJDWDogMDAwMDdmZmJlOTQ1MzJkZQo+IFsgICAxMC4zMjI4MjFdIFJEWDogMDAwMDAwMDAwMDAw
MDEwMCBSU0k6IDAwMDAwMDAwMDAwMDgyNDEgUkRJOiAwMDAwNTVmMmIwODE2MDAxCj4gWyAgIDEw
LjMyMjkxMF0gUkJQOiAwMDAwNTVmMmIwODE2MDAxIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6
IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgMTAuMzIyOTk5XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAg
UjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMgo+IFsgICAxMC4zMjMw
ODldIFIxMzogMDAwMDU1ZjJiMDgxNjAwMSBSMTQ6IDAwMDA1NWYyYjA4MTYwNTkgUjE1OiAwMDAw
N2ZmYzBjZmM4MTQ4Cj4gWyAgIDEwLjMyMzIyMV0gIDwvVEFTSz4KPiBbICAgMTAuMzgzMTc0XSBz
ZWVkcm5nICg3MTcpIHVzZWQgZ3JlYXRlc3Qgc3RhY2sgZGVwdGg6IDEyNjI0IGJ5dGVzIGxlZnQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
