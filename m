Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0F8025D6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Dec 2023 18:02:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9pqq-0002YJ-2H;
	Sun, 03 Dec 2023 17:01:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1r9pqo-0002YD-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 17:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzuNvt1M83C1nZ2ailqYr8YmM+HGUOe16GkYorpbLx0=; b=CdDzLIhV8ymEFUiqY1BQm+kwqo
 Ur5Mh8wfb00uA5iArrQ+rYeU+ZY13gOtR7CoN8+hugGxweQGvNgPsV+1BahibVzoNGu9IbiOdHWUt
 MyOEKX/Z7pGASd73GURt3PvLcPnLo9qVsaucTcfW8FcbcHcSlylR94mKBDjS5++/bJHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jzuNvt1M83C1nZ2ailqYr8YmM+HGUOe16GkYorpbLx0=; b=W/0nvhXFq2AFxc8hxTvrnPVWq5
 fPikVJj8L/HKH6Ckrw/Qgluvt8DJfTYBcncWfUcr9WhJf7/ArR3UnRGoRbtr66/e6RHRYkXzsRs83
 Ekb+HRsj29BKHSNRgIMf+Em41Zu3SEFfV2mkxrjdLHLR3tYqv+als0K1TmvnS8rs42QU=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r9pqk-0001vX-E7 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 17:01:50 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a1b68ae40efso46677766b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Dec 2023 09:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701622898; x=1702227698; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzuNvt1M83C1nZ2ailqYr8YmM+HGUOe16GkYorpbLx0=;
 b=h6d/yaZGE2SszWTFP874d3W+v/gHZLVLjp0nGLzyvcAFiXfbHTagT6yHYiGikM4uN2
 WfEOjn1RplrtBm2TZZ5euw6a0/srRXifvgtvoCtLTDsPMllemqM2YRf2uMWpdWnnP0bO
 EJDUjh2uO9OwEcxY8sXcQ28c5ocoAxdJl2sLaby3HydZWq+ERTmfu1b9H2jAYIULkIW5
 ogHJnI11s9o5z75urRhALmfHOE6Y1c8UFVDcDfUWzUpMxdMBKaXdUQMY33pBE+/NB4Xt
 u8ozOT5lgxQDq+BTln7YdKcWkvH6RCQOSaWsrblQYDf/KWs5yOUd88n6i0LpeeLMWMGF
 9Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701622898; x=1702227698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzuNvt1M83C1nZ2ailqYr8YmM+HGUOe16GkYorpbLx0=;
 b=m3qwAj+K1vvauZE/gIbRjluL5H4VO9JZ6f6W4tdOHl8MH0LdUdjoGcoHlun1xQ4fCF
 QWK2tL8ICEwYz7dJduoZVPRPPdQ8X6R/sRlx/tjHmjJ7osyl9/no6VwfpVkPnceO2J1o
 x/2fGL2pUM4cEZ+t2sPdZQvcuJCQz/Zy+sqCmSGYWJoJZDR7whuQ0CZvoA6cgeSeDG3i
 /oWptOfeCqVKPbZVIKvQTUgFLuitRXKm4EsbndQAXnX76cqaBJux7O1bl3RpH5xQ5cgx
 zts6BG1lL4kd7nG7Daw4g9XN7etzp71lNecSUXwF3OAdPLfY8dOllp/xUMfXJL+z6lWW
 3FiQ==
X-Gm-Message-State: AOJu0YxFagE3eFEpgWBCjjYs7LCif5bN5F7ySzWGm4lKaXME7kAgvmgF
 CXMtnt7WZUYn0XM4okOVHy5c4d6Zf6QIFLU00ECY1TDvxqSY4w==
X-Google-Smtp-Source: AGHT+IFGRfJA6vGF4av1eLxwU3W7g2Js190Id7mzSP/GKPFCqEGGZt4G5+O1IszyNsyfe9jADDoKeynZS4hp2WOF4Hc=
X-Received: by 2002:a17:907:12c6:b0:a19:a1ba:da55 with SMTP id
 vp6-20020a17090712c600b00a19a1bada55mr2035935ejb.124.1701622897981; Sun, 03
 Dec 2023 09:01:37 -0800 (PST)
MIME-Version: 1.0
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
 <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
In-Reply-To: <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Mon, 4 Dec 2023 02:01:27 +0900
Message-ID: <CAD14+f2G-buxTaWgb23DYW-HSd1sch6tJNKV2strt=toASZXQQ@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Gao, On Mon, Dec 4, 2023 at 1:52 AM Gao Xiang wrote:
   > > Hi Juhyung, > > On 2023/12/4 00:22, Juhyung Park wrote: > > (Cc'ing f2fs
    and crypto as I've noticed something similar with f2fs a > > while ago, [...]
    
 
 Content analysis details:   (2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  1.0 HK_RANDOM_FROM         From username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r9pqk-0001vX-E7
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgR2FvLAoKT24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxOjUy4oCvQU0gR2FvIFhpYW5nIDxoc2lh
bmdrYW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gSGkgSnVoeXVuZywKPgo+IE9uIDIw
MjMvMTIvNCAwMDoyMiwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+ID4gKENjJ2luZyBmMmZzIGFuZCBj
cnlwdG8gYXMgSSd2ZSBub3RpY2VkIHNvbWV0aGluZyBzaW1pbGFyIHdpdGggZjJmcyBhCj4gPiB3
aGlsZSBhZ28sIHdoaWNoIG1heSBtZWFuIHRoYXQgdGhpcyBpcyBub3Qgc3BlY2lmaWMgdG8gRVJP
RlM6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FEMTQrZjJuQlp0TGZMQzZDd05q
Z0NPdVJSUmp3enR0cDNEM2lLNE9mKzFFRWpLK2N3QG1haWwuZ21haWwuY29tLwo+ID4gKQo+ID4K
PiA+IEhpLgo+ID4KPiA+IEknbSBlbmNvdW50ZXJpbmcgYSB2ZXJ5IHdlaXJkIEVST0ZTIGRhdGEg
Y29ycnVwdGlvbi4KPiA+Cj4gPiBJIG5vdGljZWQgd2hlbiBJIGJ1aWxkIGFuIEVST0ZTIGltYWdl
IGZvciBBT1NQIGRldmVsb3BtZW50LCB0aGUgZGV2aWNlCj4gPiB3b3VsZCByYW5kb21seSBub3Qg
Ym9vdCBmcm9tIGEgY2VydGFpbiBidWlsZC4KPiA+IEFmdGVyIGluc3BlY3RpbmcgdGhlIGxvZywg
SSBub3RpY2VkIHRoYXQgYSBmaWxlIGdvdCBjb3JydXB0ZWQuCj4KPiBJcyBpdCBvYnNlcnZlZCBv
biB5b3VyIGxhcHRvcCAoaTctMTE4NUc3KSwgeWVzPyBvciBzb21lIG90aGVyIGFybTY0Cj4gZGV2
aWNlPwoKWWVzLCBvbmx5IG9uIG15IGxhcHRvcC4gVGhlIGFybTY0IGRldmljZSBzZWVtcyBmaW5l
LgpUaGUgcmVhc29uIHRoYXQgaXQgd291bGQgbm90IGJvb3Qgd2FzIHRoYXQgdGhlIGhvc3QgbWFj
aGluZSAobXkKbGFwdG9wKSB3YXMgcmVwYWNraW5nIHRoZSBFUk9GUyBpbWFnZSB3cm9uZ2Z1bGx5
LgoKVGhlIHdvcmtmbG93IGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6ClNlcnZlci1idWlsdCBFUk9G
UyBBT1NQIGltYWdlIC0+IEltYWdlIGNvcGllZCB0byBsYXB0b3AgLT4gTGFwdG9wCm1vdW50cyB0
aGUgRVJPRlMgaW1hZ2UgLT4gQ29waWVzIHRoZSBlbnRpcmUgY29udGVudCB0byBhIHNjcmF0Y2gK
ZGlyZWN0b3J5IChDT1JSVVBUISkgLT4gQ2hhbmdlcyBzb21lIGZpbGVzIC0+IG1rZnMuZXJvZnMK
ClNvIHRoZSBkZXZpY2UgaXMgbm90IHJlc3BvbnNpYmxlIGZvciB0aGUgY29ycnVwdGlvbiwgdGhl
IGxhcHRvcCBpcy4KCj4KPiA+Cj4gPiBBZnRlciBhZGRpbmcgYSBoYXNoIGNoZWNrIGR1cmluZyB0
aGUgYnVpbGQgZmxvdywgSSBub3RpY2VkIHRoYXQgRVJPRlMKPiA+IHdvdWxkIHJhbmRvbWx5IHJl
YWQgZGF0YSB3cm9uZy4KPiA+Cj4gPiBJIG5vdyBoYXZlIGEgcmVsaWFibGUgbWV0aG9kIG9mIHJl
cHJvZHVjaW5nIHRoZSBpc3N1ZSwgYnV0IGhlcmUncyB0aGUKPiA+IGZ1bm55L3dlaXJkIHBhcnQ6
IGl0J3Mgb25seSBoYXBwZW5pbmcgb24gbXkgbGFwdG9wIChpNy0xMTg1RzcpLiBUaGlzCj4gPiBp
cyBub3QgaGFwcGVuaW5nIHdpdGggbXkgMTI4IGNvcmVzIGJ1aWxkZmFybSBtYWNoaW5lIChUaHJl
YWRyaXBwZXIKPiA+IDM5OTBYKS4+Cj4gPiBJIGZpcnN0IHN1c3BlY3RlZCBhIGhhcmR3YXJlIGlz
c3VlLCBidXQ6Cj4gPiBhLiBUaGUgbGFwdG9wIGhhZCBpdHMgbW90aGVyYm9hcmQgcmVwbGFjZWQg
cmVjZW50bHkgKGR1ZSB0byBhIGZhaWxpbmcKPiA+IHBoeXNpY2FsIFR5cGUtQyBwb3J0KS4KPiA+
IGIuIFRoZSBsYXB0b3AgcGFzc2VzIG1lbW9yeSB0ZXN0IChtZW10ZXN0ODYpLgo+ID4gYy4gVGhp
cyBoYXBwZW5zIG9uIGFsbCBrZXJuZWwgdmVyc2lvbnMgZnJvbSB2NS40IHRvIHRoZSBsYXRlc3Qg
djYuNgo+ID4gaW5jbHVkaW5nIG15IHBlcnNvbmFsIGN1c3RvbSBidWlsZHMgYW5kIENhbm9uaWNh
bCdzIG9mZmljaWFsIFVidW50dQo+ID4ga2VybmVscy4KPiA+IGQuIFRoaXMgaGFwcGVucyBvbiBk
aWZmZXJlbnQgaG9zdCBTU0RzIGFuZCBmaWxlLXN5c3RlbSBjb21iaW5hdGlvbnMuCj4gPiBlLiBU
aGlzIG9ubHkgaGFwcGVucyBvbiBMWjQuIExaNEhDIGRvZXNuJ3QgdHJpZ2dlciB0aGUgaXNzdWUu
Cj4gPiBmLiBUaGlzIG9ubHkgaGFwcGVucyB3aGVuIG1vdW50aW5nIHRoZSBpbWFnZSBuYXRpdmVs
eSBieSB0aGUga2VybmVsLgo+ID4gVXNpbmcgZnVzZSB3aXRoIGVyb2ZzZnVzZSBpcyBmaW5lLgo+
Cj4gSSB0aGluayBpdCdzIGEgd2VpcmQgaXNzdWUgd2l0aCBpbnBsYWNlIGRlY29tcHJlc3Npb24g
YmVjYXVzZSB5b3Ugc2FpZAo+IGl0IGRlcGVuZHMgb24gdGhlIGhhcmR3YXJlLiAgSW4gYWRkaXRp
b24sIHdpdGggeW91ciBkYXRhc2V0IHNhZGx5IEkKPiBjYW5ub3QgcmVwcm9kdWNlIG9uIG15IGxv
Y2FsIHNlcnZlciAoWGVvbihSKSBDUFUgRTUtMjY4MiB2NCkuCgpBcyBJIGZlYXJlZC4gQnVtbWVy
IDooCgo+Cj4gV2hhdCBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZXNlIHR3byBtYWNoaW5l
cz8ganVzdCBkaWZmZXJlbnQgQ1BVIG9yCj4gdGhleSBoYXZlIHNvbWUgb3RoZXIgZGlmZmVyZW5j
ZSBsaWtlIGRpZmZlcmVudCBjb21wbGllcnM/CgpJIGZ1bGx5IGFuZCBleGNsdXNpdmVseSBjb250
cm9sIGJvdGggZGV2aWNlcywgYW5kIHRoZSBzZXR1cCBpcyBhbG1vc3QgdGhlIHNhbWUuClNhbWUg
VWJ1bnR1IHZlcnNpb24sIGtlcm5lbC9jb21waWxlciB2ZXJzaW9uLgoKQnV0IGFzIEkgc2FpZCwg
b24gbXkgbGFwdG9wLCB0aGUgaXNzdWUgaGFwcGVucyBvbiBrZXJuZWxzIHRoYXQgc29tZW9uZQpl
bHNlIChDYW5vbmljYWwpIGJ1aWx0LCBzbyBJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMuCgo+Cj4g
VGhhbmtzLAo+IEdhbyBYaWFuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
