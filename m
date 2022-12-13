Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492B64B24B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 10:25:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p51Xm-00019a-IZ;
	Tue, 13 Dec 2022 09:25:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1p51XV-00019M-83
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 09:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/DtRmYtMNHKnkR6bi6ueuHO103FUFfPv8+meEwjdmbw=; b=E7vrLPOc8l96Q15cBWEk1kvjb5
 26x9Vnh6zdJTPciQ+JsWqLpTqBGVuzLFRpqMDms21fl7pjv5Z/HEjOJsXs2TWzgpW6hamRNb6DSse
 L/4c3sZvjVuRPTFeOzl4pLfD+WvqtQSClGkFoSw3HLtJ1n6qaokhYgzwFE25/OReBGwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/DtRmYtMNHKnkR6bi6ueuHO103FUFfPv8+meEwjdmbw=; b=K+NJ5TEY/4ggh8mphLG934TBPx
 u++KCogVyNr5plRlUSEp6SKSZQQiGsJwEVD4ioHZQ5KwCFWzHQW2eHI9ArJ8Ix8XyJXfyBu1nnmJF
 bZOBSw4b2TtvHdil5alkLyElzRsWnKiRyKQPF19GSL6tXrSoGr/uRHyvyi1B9pzffq/8=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p51XU-00FdkI-K1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 09:25:29 +0000
Received: by mail-lf1-f47.google.com with SMTP id q6so3894634lfm.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Dec 2022 01:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/DtRmYtMNHKnkR6bi6ueuHO103FUFfPv8+meEwjdmbw=;
 b=eHiyCsUJNyXUkeoYD3u3bIB6wPOea4+yX6vISQxfMqEP7D4H3VuNz1yTIcpAXnyX+D
 OVzu3VK7K+QbP4n2UyLQRmYFkN6TtRVZhLlJnojtCuEtiG8CwRI6ra9RKIL7I9x6NxXC
 uLk2R+dkVTSxlXOhKFJE7d768mbBOq3OpzQIE96QCaSDJhHQP5xy5JBg4abMqUh/jDin
 6PZxcdWgQPpwbwhdIL8iE+scdFyTH5sTZ9wIxQiAyXKLuLln4EAr64i4kfQyhQMzG6dS
 DO8lE5yKa6pLUWaFvEV/9pYshb6BmbqMjM13FTDKadzfS1pFz5uqI9SqoSnHqJVuOnqD
 /2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/DtRmYtMNHKnkR6bi6ueuHO103FUFfPv8+meEwjdmbw=;
 b=euAN5DgXEjtZBmfO3xlv5ytC1DHYPTwxu5guc2I8ZZbg6hnqK9kbEgqS1hmHomPAcl
 rprWC7m0EufCXAnpVoJ7B2Cm2UdmdRbG3rbd18uzLgcBVpqkScDWdthRb2gSfoCE+bzp
 mFOJnJ0EGWvUyEQ4niU8njb3pbwe6h3lh7FuAXqGCgRxXo8OkYdgePQFkz4PsQNnl6yS
 Sx/iBDZe4UYTmq44Kh4Z8F9B5FnmhAdubOm++sGnQ6TycJZF7CVvhG1f8rEOC0yZ9FZr
 0ixLHylbF/SbrmM1AEyPXfYMxVkn4+yBNOT6abovXdNUrGVTds9L14PI8bNntcbvDGJz
 2R3w==
X-Gm-Message-State: ANoB5plrEU562RPTVVFkrWY5yvngGN1YHe8ZX/vfswveiLZXhVghUINH
 8SFAJQ25oLWxbmMNMrwQGtoqMi3R8lAqFbn+Aps=
X-Google-Smtp-Source: AA0mqf42qnt1Sspgxd1CUIRY0s0hRKG3TTBrCD9Lac0deO3xWdNGTJXsxjpNFgrwMcjMAxXDRsp3c3P+CF/I0Uv1RI8=
X-Received: by 2002:ac2:5459:0:b0:4b5:6f84:ab9c with SMTP id
 d25-20020ac25459000000b004b56f84ab9cmr6939004lfn.201.1670923521844; Tue, 13
 Dec 2022 01:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20221211121852.112127-1-Yuwei.Guan@zeekrlife.com>
 <Y5XZAg6X8nK7/vBi@debian.me>
In-Reply-To: <Y5XZAg6X8nK7/vBi@debian.me>
From: Yuwei Guan <ssawgyw@gmail.com>
Date: Tue, 13 Dec 2022 17:24:46 +0800
Message-ID: <CALJQGLkZgjvk+ysvFKHx6gr=dMQwUa-jOae3F3AJSy1Syczkqw@mail.gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Bagas Sanjaya 于2022年12月11日周日 21:20写道： >
   > On Sun, Dec 11, 2022 at 08:18:52PM +0800, Yuwei Guan wrote: > > As the 'dcc->discard_granularity'
    and 'dcc->max_ordered_discard' can be se [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.47 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [ssawgyw[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.47 listed in wl.mailspike.net]
X-Headers-End: 1p51XU-00FdkI-K1
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: continuous counting for 'issued' in
 __issue_discard_cmd_orderly()
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

QmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+IOS6jjIwMjLlubQxMuaciDEx5pel
5ZGo5pelIDIxOjIw5YaZ6YGT77yaCj4KPiBPbiBTdW4sIERlYyAxMSwgMjAyMiBhdCAwODoxODo1
MlBNICswODAwLCBZdXdlaSBHdWFuIHdyb3RlOgo+ID4gQXMgdGhlICdkY2MtPmRpc2NhcmRfZ3Jh
bnVsYXJpdHknIGFuZCAnZGNjLT5tYXhfb3JkZXJlZF9kaXNjYXJkJyBjYW4gYmUgc2V0Cj4gPiBh
dCB0aGUgdXNlciBzcGFjZSwgYW5kIGlmIHRoZSAnZGNjLT5tYXhfb3JkZXJlZF9kaXNjYXJkJyBp
cyBzZXQgbGFyZ2VyIHRoYW4KPiA+ICdkY2MtPmRpc2NhcmRfZ3JhbnVsYXJpdHknIGluIERQT0xJ
Q1lfQkcgbW9kZSwgb3IgaXQncyBhIHZvbHVtZSBkZXZpY2UsCj4gPiBkaXNjYXJkX2dyYW51bGFy
aXR5IGNhbiBiZSB0dW5lZCB0byAxIGluIGYyZnNfdHVuaW5nX3BhcmFtZXRlcnMoKSwKPiA+IGl0
IHdpbGwgbWF5IHNlbmQgbW9yZSByZXF1ZXN0cyB0aGFuIHRoZSBudW1iZXIgb2YgJ2Rwb2xpY3kt
Pm1heF9yZXF1ZXN0cycKPiA+IGluIGlzc3VlX2Rpc2NhcmRfdGhyZWFkKCkuCj4gPgo+Cj4gWW91
IGRvbid0IGtub3cgaG93IHRvIHN0b3Agc2VudGVuY2VzIChha2EgImFidXNpbmciIGNvbW1hKSwg
c28gSSByZWFkCj4gYWJvdmUgYXMgdWJlci1sb25nIHNlbnRlbmNlLiBDYXJlIHRvIHJld29yZD8g
VGhlcmUgYXJlIG1hbnkgY2FzZXMgd2hlbiBJCj4gaGF2ZSB0byByZXBseSB3aXRoIHN1Y2ggcmV3
b3JkaW5nLCBidXQgdGhpcyB0aW1lIEkgY2hvb3NlIG5vdCB0byBkbwo+IGJlY2F1c2UgSSdtIGxh
enkgYXQgdGhlIHRpbWUgSSB3cml0ZSB0aGlzIHJlcGx5Lgo+CkhpIEJhZ2FzLApUaGFua3MgZm9y
IHlvdXIgcmV2aWV3LgpTb3JyeSBmb3Igc3VibWl0dGluZyBhIHBvb3JseSBkZXNjcmliZWQgcGF0
Y2gsCkkgd2lsbCB1cGRhdGUgYSB2MyBwYXRjaCB0byByZXdyaXRlIHRoZSBpc3N1ZSBkZXNjcmlw
dGlvbiBhbmQgc29sdXRpb24uCj4gPiBUaGlzIHBhdGNoIHdpbGwgZml4IHRoZSBpc3N1ZS4KPgo+
IEZpeCBieSB3aGF0PyBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGNvZGUuCj4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZdXdlaSBHdWFuIDxZdXdlaS5HdWFuQHplZWtybGlmZS5jb20+Cj4KPiBZb3Ug
c2VuZCBmcm9tIHlvdXIgR21haWwgYWRkcmVzcyBidXQgaGF2ZSBTb0IgZnJvbSBlaXRoZXIgcGVy
c29uYWwgZW1haWwKPiBkb21haW4gb3IgaXMgdGhpcyBhIHJhbmRvbSBjb21wYW55PyBJZiBpdCBp
cyB0aGUgbGF0dGVyLCBwbGVhc2UgdGFsawo+IHdpdGggeW91ciBjb21wYW55IHRvIGZpeCB0aGUg
bWFpbCBzeXN0ZW0gc28gdGhhdCB5b3UgY2FuIHNlbmQgZnJvbSBpdHMKPiBkb21haW4gKGFuZCBy
ZWNlaXZlIHRyYWZmaWMgZnJvbSBtYWlsaW5nIGxpc3RzKS4gSW4gYW55IGNhc2UsIHlvdXIgZW1h
aWwKPiBhZGRyZXNzIGluIEZyb20gaGVhZGVyIGFuZCBTb0IgbXVzdCBtYXRjaC4KPgpUaGUgZW1h
aWwgc3lzdGVtIGhhcyBiZWVuIGZpeGVkLAphbmQgdGhlIGVtYWlsIGFkZHJlc3NlcyB3aWxsIG1h
dGNoIGluIHRoZSBmdXR1cmUuCj4gVGhhbmtzLgo+Cj4gLS0KPiBBbiBvbGQgbWFuIGRvbGwuLi4g
anVzdCB3aGF0IEkgYWx3YXlzIHdhbnRlZCEgLSBDbGFyYQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
