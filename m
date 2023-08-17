Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C277F02D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Aug 2023 07:22:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWVSa-0004fI-2c;
	Thu, 17 Aug 2023 05:22:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qWVSY-0004fB-9L
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 05:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WbuJnX+0KGuM97V2HEA9ez/RUkblD5MX7iE3DImNbY=; b=kV2Uf2HoPxZsK/sFJCY4JOx8E7
 ojKSGBHgTju9YJMCtxemEQ/n8xikqHuFxEx2NsQcF8vdQZ03RkYRGbxP530gUrV5VJOlgi2z9d5Ag
 GKrwbPJ8y8Y02mppUnLKY64GRw3bSysmzzgeQe6CbeHb0RkY3bKSyU0pIiHYqeA4PKaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8WbuJnX+0KGuM97V2HEA9ez/RUkblD5MX7iE3DImNbY=; b=g76X3pZWWPAqBHyjKMR9XolZMc
 JCrZzx9BM1sIg1cYTG6hcVV2EnjtMPxzEvjK8W1BRtQSDm7V5z5Bq7wAKMsmn3absirG0+wq8+KQx
 8qlO51HeF/pc3ZTe58As8Izm/p9R8MlV1lWfxBeEyp4Y3iSvidflwz9GV5uh5zt56p3A=;
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qWVSU-007dIy-PP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 05:22:14 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-56c74961e0cso5291100eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 16 Aug 2023 22:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692249725; x=1692854525;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8WbuJnX+0KGuM97V2HEA9ez/RUkblD5MX7iE3DImNbY=;
 b=e/BGyNkOtFboIsiC+Upt01yHVL1VYha4yCYwuNQx4AIJvngkssyewvd4tnixva6F12
 f7ndYJVTGiO+PaofE3fDi3nYZFpmEKyFJkNEv65A8q4xefbeR6YO+gsvsh69BMpnCA/5
 eqdErnry5wjb0T4lWqxBdM7gWYjVzhfJw5AbGjmVyPTCY7mnUemdlQiYixmVHxBSvHpg
 FzFGXp0JZ6LpHnme7jv/mbpf1wiH80W1rDF3OXqd6u3DBhXImHUjM7Z5g4m68DA2FDJd
 ZFI80P2F+P7gTH0Jx28bE8n8jyO80VyORqskk955rSPLUYNwRoMrdQsZU1+/kFu01YLa
 xbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692249725; x=1692854525;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8WbuJnX+0KGuM97V2HEA9ez/RUkblD5MX7iE3DImNbY=;
 b=IQ5RHFzD5ebL+3IUBdEEHq1WXSmjM/FwXplKHGPxGWP9l4x/esRVBAAdY30kE31e45
 QE9Hu5mzd/IsJCpY2HUxn+K3vwgIFX2hCykfLyzHK1j5GICeGXIX2rCZQHpAYyQzgGAk
 6kLuPoSKEMDwaIWZwQRAUz1SScaNHOm8GWISbj+xUG6AzT/wYQ04sAgJDtg1mt0hbq6P
 ire9PulhKZ6Pq6nQc6rbxhRJxpm9u8nYi/5SavW4LTm1MWY8iCEKn1k6rnCwG+fQEiAv
 q4jSCJFjy7DqHVKDM6IxW8PkZEcfdW+DP6uEHHzwLZ2nyVr7cnruas5H/iL0isvnpMc2
 phbw==
X-Gm-Message-State: AOJu0Yx71DFD/drkTERGJw5Nz2TM2lcfB6gbr6PBXebIgoPft8IChB1g
 1p0e9ILVMjNxsGFnzqhcoqA=
X-Google-Smtp-Source: AGHT+IF+kBllvM4ydSvQ+gfH+YxMRjhQeDpGDEye0P1K7dpZd16TRETKiNusS4l6Rj8KTzsfx/pgeQ==
X-Received: by 2002:a05:6358:292a:b0:134:c37f:4b64 with SMTP id
 y42-20020a056358292a00b00134c37f4b64mr4760013rwb.30.1692249724876; 
 Wed, 16 Aug 2023 22:22:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a637404000000b0052c9d1533b6sm12991739pgc.56.2023.08.16.22.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 22:22:04 -0700 (PDT)
Date: Wed, 16 Aug 2023 22:22:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaegeuk Kim <jaegeuk.kim@gmail.com>
Message-ID: <feac4d74-ab2e-4135-a85c-40cb8d1dcc96@roeck-us.net>
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Aug 16, 2023 at 08:52:19PM -0700, Jaegeuk Kim wrote:
    > On Wed, Aug 16, 2023 at 7:11 PM Guenter Roeck <linux@roeck-us.net> wrote:
    > > > > On Wed, Aug 16, 2023 at 10:25:06AM -0700, Jaegeuk Kim [...] 
 
 Content analysis details:   (0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [groeck7[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [groeck7[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.161.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.161.42 listed in list.dnswl.org]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
X-Headers-End: 1qWVSU-007dIy-PP
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMDg6NTI6MTlQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgNzoxMeKAr1BNIEd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBBdWcgMTYsIDIwMjMgYXQg
MTA6MjU6MDZBTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPgo+ID4g
PiBPbiBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAxMDowOeKAr1BNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4
QHJvZWNrLXVzLm5ldD4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+
IHdoZW4gdHJ5aW5nIHRvIGJvb3QgZnJvbSBhbiBmMmZzIGZpbGUgc3lzdGVtIHdpdGggbG9jayBk
ZWJ1Z2dpbmcgZW5hYmxlZCwKPiA+ID4gPiBJIGdldCB0aGUgYXR0YWNoZWQgY2lyY3VsYXIgbG9j
a2luZyBkZXBlbmRlbmN5IHdhcm5pbmcuIElzIHRoaXMgYSBrbm93bgo+ID4gPiA+IHByb2JsZW0g
Pwo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+IEd1ZW50ZXIKPiA+ID4gPgo+ID4gPiA+
IC0tLQo+ID4gPiA+IFsgICAxMC4zMTU1MjJdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiA+IFsgICAxMC4zMTU2MjBdIFdBUk5JTkc6
IHBvc3NpYmxlIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSBkZXRlY3RlZAo+ID4gPiA+IFsg
ICAxMC4zMTU3NTNdIDYuNS4wLXJjNi0wMDAyNy1nOTFhYTZjNDEyZDdmICMxIFRhaW50ZWQ6IEcg
ICAgICAgICAgICAgICAgIE4KPiA+ID4gPiBbICAgMTAuMzE1ODQzXSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiBbICAgMTAuMzE1
OTIyXSBzZWVkcm5nLzcxNyBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOgo+ID4gPiA+IFsgICAx
MC4zMTYwMTBdIGZmZmY4ZTBlMDJjNmI4NjggKCZmaS0+aV9zZW0peysuKy59LXszOjN9LCBhdDog
ZjJmc19hZGRfaW5saW5lX2VudHJ5KzB4MTM0LzB4MmQwCj4gPiA+ID4gWyAgIDEwLjMxNjMxNV0K
PiA+ID4gPiBbICAgMTAuMzE2MzE1XSBidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoK
PiA+ID4gPiBbICAgMTAuMzE2MzkxXSBmZmZmOGUwZTAyYzZiMjc4ICgmZmktPmlfeGF0dHJfc2Vt
KXsuKy4rfS17MzozfSwgYXQ6IGYyZnNfYWRkX2RlbnRyeSsweDQxLzB4YzAKPiA+ID4gPiBbICAg
MTAuMzE2NTQzXQo+ID4gPiA+IFsgICAxMC4zMTY1NDNdIHdoaWNoIGxvY2sgYWxyZWFkeSBkZXBl
bmRzIG9uIHRoZSBuZXcgbG9jay4KPiA+ID4gPiBbICAgMTAuMzE2NTQzXQo+ID4gPiA+IFsgICAx
MC4zMTY2NDFdCj4gPiA+ID4gWyAgIDEwLjMxNjY0MV0gdGhlIGV4aXN0aW5nIGRlcGVuZGVuY3kg
Y2hhaW4gKGluIHJldmVyc2Ugb3JkZXIpIGlzOgo+ID4gPiA+IFsgICAxMC4zMTY3NDVdCj4gPiA+
ID4gWyAgIDEwLjMxNjc0NV0gLT4gIzEgKCZmaS0+aV94YXR0cl9zZW0pey4rLit9LXszOjN9Ogo+
ID4gPiA+IFsgICAxMC4zMTY4ODNdICAgICAgICBkb3duX3JlYWQrMHgzZC8weDE3MAo+ID4gPiA+
IFsgICAxMC4zMTY5NzNdICAgICAgICBmMmZzX2dldHhhdHRyKzB4MzcwLzB4NDQwCj4gPiA+ID4g
WyAgIDEwLjMxNzAzNl0gICAgICAgIF9fZjJmc19nZXRfYWNsKzB4MzgvMHgxZTAKPiA+ID4gPiBb
ICAgMTAuMzE3MDk0XSAgICAgICAgZjJmc19pbml0X2FjbCsweDY5LzB4NDIwCj4gPiA+ID4gWyAg
IDEwLjMxNzE1MV0gICAgICAgIGYyZnNfaW5pdF9pbm9kZV9tZXRhZGF0YSsweDcyLzB4NDUwCj4g
PiA+ID4gWyAgIDEwLjMxNzIxOF0gICAgICAgIGYyZnNfYWRkX3JlZ3VsYXJfZW50cnkrMHgzNzIv
MHg1MTAKPiA+ID4gPiBbICAgMTAuMzE3MjgzXSAgICAgICAgZjJmc19hZGRfZGVudHJ5KzB4Yjgv
MHhjMAo+ID4gPiA+IFsgICAxMC4zMTczNDBdICAgICAgICBmMmZzX2RvX2FkZF9saW5rKzB4ZDkv
MHgxMTAKPiA+ID4gPiBbICAgMTAuMzE3Mzk5XSAgICAgICAgZjJmc19ta2RpcisweGRmLzB4MTgw
Cj4gPiA+ID4gWyAgIDEwLjMxNzQ1M10gICAgICAgIHZmc19ta2RpcisweDE0Mi8weDIyMAo+ID4g
PiA+IFsgICAxMC4zMTc1MDhdICAgICAgICBkb19ta2RpcmF0KzB4N2MvMHgxMjAKPiA+ID4gPiBb
ICAgMTAuMzE3NTYxXSAgICAgICAgX194NjRfc3lzX21rZGlyKzB4NDcvMHg3MAo+ID4gPiA+IFsg
ICAxMC4zMTc2MTddICAgICAgICBkb19zeXNjYWxsXzY0KzB4M2YvMHg5MAo+ID4gPiA+IFsgICAx
MC4zMTc2NzNdICAgICAgICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3My8weGRk
Cj4gPiA+ID4gWyAgIDEwLjMxNzc1N10KPiA+ID4gPiBbICAgMTAuMzE3NzU3XSAtPiAjMCAoJmZp
LT5pX3NlbSl7Ky4rLn0tezM6M306Cj4gPiA+ID4gWyAgIDEwLjMxNzg0M10gICAgICAgIF9fbG9j
a19hY3F1aXJlKzB4MTZiZi8weDI4NjAKPiA+ID4gPiBbICAgMTAuMzE3OTA3XSAgICAgICAgbG9j
a19hY3F1aXJlKzB4Y2MvMHgyYzAKPiA+ID4gPiBbICAgMTAuMzE3OTYyXSAgICAgICAgZG93bl93
cml0ZSsweDNhLzB4YzAKPiA+ID4gPiBbICAgMTAuMzE4MDE0XSAgICAgICAgZjJmc19hZGRfaW5s
aW5lX2VudHJ5KzB4MTM0LzB4MmQwCj4gPiA+ID4gWyAgIDEwLjMxODA3N10gICAgICAgIGYyZnNf
YWRkX2RlbnRyeSsweDU1LzB4YzAKPiA+ID4gPiBbICAgMTAuMzE4MTQxXSAgICAgICAgZjJmc19k
b19hZGRfbGluaysweGQ5LzB4MTEwCj4gPiA+ID4gWyAgIDEwLjMxODIwMV0gICAgICAgIGYyZnNf
Y3JlYXRlKzB4ZTgvMHgxNzAKPiA+ID4gPiBbICAgMTAuMzE4MjU1XSAgICAgICAgbG9va3VwX29w
ZW4uaXNyYS4wKzB4NThlLzB4NmMwCj4gPiA+ID4gWyAgIDEwLjMxODMxN10gICAgICAgIHBhdGhf
b3BlbmF0KzB4MmFmLzB4YTQwCj4gPiA+ID4gWyAgIDEwLjMxODM3Ml0gICAgICAgIGRvX2ZpbHBf
b3BlbisweGIxLzB4MTYwCj4gPiA+ID4gWyAgIDEwLjMxODQyOF0gICAgICAgIGRvX3N5c19vcGVu
YXQyKzB4OTEvMHhjMAo+ID4gPiA+IFsgICAxMC4zMTg0ODVdICAgICAgICBfX3g2NF9zeXNfb3Bl
bisweDU0LzB4YTAKPiA+ID4gPiBbICAgMTAuMzE4NTQxXSAgICAgICAgZG9fc3lzY2FsbF82NCsw
eDNmLzB4OTAKPiA+ID4gPiBbICAgMTAuMzE4NTk3XSAgICAgICAgZW50cnlfU1lTQ0FMTF82NF9h
ZnRlcl9od2ZyYW1lKzB4NzMvMHhkZAo+ID4gPiA+IFsgICAxMC4zMTg2NzZdCj4gPiA+ID4gWyAg
IDEwLjMxODY3Nl0gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAgdXMgZGVidWcgdGhpczoKPiA+
ID4gPiBbICAgMTAuMzE4Njc2XQo+ID4gPiA+IFsgICAxMC4zMTg3OTldICBQb3NzaWJsZSB1bnNh
ZmUgbG9ja2luZyBzY2VuYXJpbzoKPiA+ID4gPiBbICAgMTAuMzE4Nzk5XQo+ID4gPiA+IFsgICAx
MC4zMTg4NzVdICAgICAgICBDUFUwICAgICAgICAgICAgICAgICAgICBDUFUxCj4gPiA+ID4gWyAg
IDEwLjMxODkzNV0gICAgICAgIC0tLS0gICAgICAgICAgICAgICAgICAgIC0tLS0KPiA+ID4gPiBb
ICAgMTAuMzE4OTk5XSAgIHJsb2NrKCZmaS0+aV94YXR0cl9zZW0pOwo+ID4gPiA+IFsgICAxMC4z
MTkwNjhdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZmaS0+aV9zZW0pOwo+
ID4gPiA+IFsgICAxMC4zMTkxNjZdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2Nr
KCZmaS0+aV94YXR0cl9zZW0pOwo+ID4gPiA+IFsgICAxMC4zMTkyNjRdICAgbG9jaygmZmktPmlf
c2VtKTsKPiA+ID4KPiA+ID4gSXQgbG9va3MgbGlrZSB0aGUgc2FtZSBvbmUgcmVwb3J0ZWQgYnkg
c3l6Ym90Lgo+ID4gPiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9YTQ5
NzZjZTk0OWRmNjZiMWRkZjEKPiA+ID4KPiA+ID4gSG93ZXZlciwgSSBzdXNwZWN0IGl0J3MgYSBm
YWxzZSBhbGFybSwgc2luY2UgSSdtIGludGVycHJldGluZyB0aGUgbG9vcCBhcyBiZWxvdy4KPiA+
ID4KPiA+ID4gQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BV
MQo+ID4gPiBsb2NrKG5ld19pbm9kZSMxLT5pX3hhdHRyX3NlbSkKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jayhuZXdfaW5vZGUjMi0+
aV9zZW0pCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxvY2soZGlyLT5pX3hhdHRyX3NlbSkKPiA+ID4gbG9jayhuZXdfaW5vZGUjMS0+aV9z
ZW0pCj4gPiA+Cj4gPiA+IFRoaXMgbG9va3MgZmluZSB0byBtZS4KPiA+ID4KPiA+Cj4gPiBCYXNl
ZCBvbiB5b3VyIGZlZWRiYWNrLCBhbSBJIGNvcnJlY3QgYXNzdW1pbmcgdGhhdCB5b3UgZG9uJ3Qg
cGxhbgo+ID4gdG8gZml4IHRoaXMgPwo+IAo+IEknbSBxdWl0ZSBvcGVuIHRvIHNvbWV0aGluZyB0
aGF0IEkgbWF5IG1pc3MuIENoYW8sIHdoYXQgZG8geW91IHRoaW5rPwo+IAoKSnVzdCB0byBnaXZl
IHlvdSBhIGJhY2tncm91bmQ6IFJlY2VudGx5IEkgc3RhcnRlZCBib290IHRlc3RpbmcgZnJvbSBm
MmZzLgpBcHBhcmVudGx5IG15IHRlc3QgYmVkIGlzIHRoZSBvbmx5IG9uZSB0ZXN0aW5nIGYyZnMs
IG1lYW5pbmcgSSB3YXMgdGhlCm9ubHkgb25lIHJlcG9ydGluZyB0aGF0IGYyZnMgY3Jhc2hlcyBp
biB2Ni4xLnkuIEkgdGhlbiBleHRlbmRlZCBteSBqMmZzCnRlc3QgY292ZXJhZ2UgdG8gbXVsdGlw
bGUgYXJjaGl0ZWN0dXJlcywgb25seSB0byBkaXNjb3ZlciB0aGF0IGEgcmVjZW50CmNvbW1pdCBp
bnRyb2R1Y2VkIHRoaXMgbG9ja2RlcCBzcGxhdGNoLgoKTXkgdGVzdHMgYWx3YXlzIHJ1biB3aXRo
IGxvY2tkZXAgZGVidWdnaW5nIGVuYWJsZWQuIEF0IHRoZSBzYW1lIHRpbWUsCkkgY2FuIG5vdCB0
b2xlcmF0ZSBwZXJzaXN0ZW50IHdhcm5pbmdzIGJlY2F1c2UgdGhvc2Ugd291bGQgaGlkZSByZWFs
CnByb2JsZW1zLiBBcyBjb25zZXF1ZW5jZSwgSSBkaXNhYmxlIGFueSBmZWF0dXJlIGdlbmVyYXRp
bmcgc3VjaCB3YXJuaW5ncwppZiB0aGUgcmVwb25zaWJsZSBtYWludGFpbmVyKHMpIHRlbGwgbWUg
dGhhdCB0aGV5IHdvbid0IGZpeCBpdC4gSW4gdGhpcwpjb250ZXh0LCBpdCBkb2Vzbid0IG1hdHRl
ciBpZiB0aGUgd2FybmluZyBpcyBhIGZhbHNlIHBvc2l0aXZlIG9yIG5vdC4KClVsdGltYXRlbHkg
SSBhbSBxdWl0ZSBuZXV0cmFsIGluIHRoaXMgcmVnYXJkOyBpdCBpcyB1cCB0byB5b3UgaWYgeW91
IGFyZQpnb2luZyB0byBhZGRyZXNzIHRoZSB3YXJuaW5nIG9yIG5vdC4gSSB3b3VsZCBqdXN0IGxp
a2UgdG8ga25vdyBpZiB0aGUKYWJvdmUgd2FybmluZyBpcyBnb2luZyB0byBiZSBmaXhlZCBzbyBJ
IGNhbiBhZGp1c3QgbXkgdGVzdCBjb3ZlcmFnZQphY2NvcmRpbmdseS4KClNpZGUgcXVlc3Rpb246
IERvZXMgdGhpcyBwb3NzaWJseSBuZWVkIGRvd25fcmVhZF9uZXN0ZWQoKSA/CgpUaGFua3MsCkd1
ZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
