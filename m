Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD2986A4B1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 02:01:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf8Jg-0006dY-Ly;
	Wed, 28 Feb 2024 01:01:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rf8Je-0006dO-Dj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 01:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hjXEhuh0YtyIbM5bguMeiWD8HgiRpdwUBVGzKxGhXgI=; b=gYwQZFoCQ0EVRLbz3Gl7SHMJ8N
 R4dk0u1VtQKdhec8HrYfy6oPmBYEPOqprjv5cCTK0GfdYUb7t0ejizWPsqJxLeBUT1aAlAVRPssMD
 Tz46rWIM2vOOPxHCwdqwxDOUrCzS85V8II5AVHplgzbGWwS1TmrnONd9VAloJ8hNX9B0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hjXEhuh0YtyIbM5bguMeiWD8HgiRpdwUBVGzKxGhXgI=; b=YEJsk5raZmr95upi5ItEsU5wrO
 umDeM2vVS+g6c0LBIVaTDSP4Cu0ykwb0WwPs9pol/qyb1ie8dSC5W5dG0xt/l6PazVPOZnOjtaBC6
 YyQsMWpUYot27yOICGVNj8x7jwU/EogbMWLubFJ120K3pDtGA8YEswO5GPTmvbWv1y5s=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rf8Jb-0006cf-TT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 01:00:57 +0000
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so6488581a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 17:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709082049; x=1709686849; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hjXEhuh0YtyIbM5bguMeiWD8HgiRpdwUBVGzKxGhXgI=;
 b=IhXxLKw+dxzEBMx7U5SLDfA67dIc8gcDSiU3O0VI6H19Vyr+hENYiiCk1r8oNEEgir
 XZvNGhs9J8OgMs9COuX0HNtXqbgq0axXRScCC26QVdzdzU7Ix98sZB849nnCfJKu0NgR
 1t24TxifMS0aVgNZHqtGgrqNB1F7dzggh/Xw9mZVT0YOuSVm7ygLRcrHZGIk1FmoqmtB
 BgXTvAIfZXkQwYaPh9d7Sa1S3LdjKgTVl517NH6CYHhoT1gJs0FtyMOwM+By52hmGp9g
 UNwu2DpcrvKmaGz5zDZ1h7ag5JmuBkT3mfbPVh88fwy7CHmI3j39GHePaHUFkp36qnra
 BW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709082049; x=1709686849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjXEhuh0YtyIbM5bguMeiWD8HgiRpdwUBVGzKxGhXgI=;
 b=IxnpcD5OxZrHMadhJ9IUryo6gs/Wkb7+O27IUP1vEte7vbVaRg5CBo++0U43uVkEdx
 H3PeST2bbFelBfPWjSONJS8vVsyMOvJZqceIUjmwgV+6UXv1HerBCjDyDVtQplghxKz3
 QleypbsT8Vs8UXpN92FRpEFKWrQKcNAtaKyDlw7fzUHBbqFt6dtGpTMb3d46ZvnfFcK0
 en6KQ740es+0ywMk2FSznEd9CAQUNSeSbektYHfGjGvmU4FVn2HbJeVXtOpuLEG+AYlK
 f0YhqEQGxMQ56Lg7jlHOFtGpB5qM547d3qy6ZLKBTSihT+BXQD5UCIhEShJ3cvg8LLW9
 h29A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5r81Vd1LOO2ebjg64n94QyQbMeaFqEo+kgB7S6A8rteAc3kMYfZhDqcFJYWvSjOjZ5M0K10ElbSV+JuF8JifB15x9dGc2ZOS/dwMFm0mBbp/Q6qgXPg==
X-Gm-Message-State: AOJu0Yw6KNl9DJBT27YEzgardluQClgU2e1xZK95mDaCK2ejVzk9dNeq
 55cOdh/tYPkQzFrDnpyGJOzvlFuv+AuoB9mWFLWhcreU29hPG1Lbr36fSdCEkx/XK7H7rJ96/UO
 +LXlUUyHwtt+5RazMx9b6cYaqPpY=
X-Google-Smtp-Source: AGHT+IF0ZgQXFJn7ExsYap7so0xX0djl5COXxTIClpDONqOxfAL+1QaaCPT06+J5sB14oAuEHMbrMXsA9+k5CY5oTP8=
X-Received: by 2002:aa7:d6cf:0:b0:564:a4e9:3683 with SMTP id
 x15-20020aa7d6cf000000b00564a4e93683mr8898548edr.16.1709082049151; Tue, 27
 Feb 2024 17:00:49 -0800 (PST)
MIME-Version: 1.0
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
 <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
 <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
 <Zd03RHMKBqv1f6GF@google.com>
 <CAHJ8P3Lj_1pa=npkAsMfeStEY3nWgf591tFndKTT_skFYLv+GQ@mail.gmail.com>
 <Zd4ZTokbVPkj5gy4@google.com>
In-Reply-To: <Zd4ZTokbVPkj5gy4@google.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 28 Feb 2024 09:00:37 +0800
Message-ID: <CAHJ8P3+bpRyghkcOoDaJ_2r1Wh69jF1W-8Rm881y6d3rif8xhQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Feb 28, 2024 at 1:18 AM Jaegeuk Kim wrote: > > On
    02/27, Zhiguo Niu wrote: > > On Tue, Feb 27, 2024 at 9:13 AM Jaegeuk Kim
    wrote: > > > > > > On 02/26, Zhiguo Niu wrote: > > > > Dear C [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.52 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rf8Jb-0006cf-TT
Subject: Re: [f2fs-dev] [PATCH v2 0/4] f2fs: fix panic issue in small
 capacity device
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
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMToxOOKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDIvMjcsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBPbiBU
dWUsIEZlYiAyNywgMjAyNCBhdCA5OjEz4oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDAyLzI2LCBaaGlndW8gTml1IHdyb3RlOgo+ID4g
PiA+IERlYXIgQ2hhbywKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgRmViIDIzLCAyMDI0IGF0IDEw
OjM44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiAyMDI0LzIvMjMgMTA6MDEsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDg6MzDigK9QTSBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmcgPG1haWx0bzpjaGFvQGtlcm5lbC5vcmc+PiB3cm90ZToK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICAgIE9uIDIwMjQvMi83IDEwOjAxLCBaaGlndW8gTml1
IHdyb3RlOgo+ID4gPiA+ID4gPiAgICAgID4gQSBwYW5pYyBpc3N1ZSBoYXBwZW5lZCBpbiBhIHJl
Ym9vdCB0ZXN0IGluIHNtYWxsIGNhcGFjaXR5IGRldmljZQo+ID4gPiA+ID4gPiAgICAgID4gYXMg
Zm9sbG93aW5nOgo+ID4gPiA+ID4gPiAgICAgID4gMS5UaGUgZGV2aWNlIHNpemUgaXMgNjRNQiwg
YW5kIG1haW4gYXJlYSBoYXMgMjQgc2VnbWVudHMsIGFuZAo+ID4gPiA+ID4gPiAgICAgID4gQ09O
RklHX0YyRlNfQ0hFQ0tfRlMgaXMgbm90IGVuYWJsZWQuCj4gPiA+ID4gPiA+ICAgICAgPiAyLlRo
ZXJlIGlzIG5vIGFueSBmcmVlIHNlZ21lbnRzIGxlZnQgc2hvd24gaW4gZnJlZV9zZWdtYXBfaW5m
bywKPiA+ID4gPiA+ID4gICAgICA+IHRoZW4gYW5vdGhlciB3cml0ZSByZXF1ZXN0IGNhdXNlIGdl
dF9uZXdfc2VnbWVudCBnZXQgYSBvdXQtb2YtYm91bmQKPiA+ID4gPiA+ID4gICAgICA+IHNlZ21l
bnQgd2l0aCBzZWdubyAyNC4KPiA+ID4gPiA+ID4gICAgICA+IDMucGFuaWMgaGFwcGVuIGluIHVw
ZGF0ZV9zaXRfZW50cnkgYmVjYXVzZSBhY2Nlc3MgaW52YWxpZCBiaXRtYXAKPiA+ID4gPiA+ID4g
ICAgICA+IHBvaW50ZXIuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICBaaGlndW8sCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICBDYW4geW91IHBsZWFzZSB0cnkgYmVsb3cgcGF0Y2ggdG8g
c2VlIHdoZXRoZXIgaXQgY2FuIGZpeCB5b3VyIHByb2JsZW0/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwMjIy
MTIxODUxLjg4MzE0MS0zLWNoYW9Aa2VybmVsLm9yZyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZjJmcy1kZXZlbC8yMDI0MDIyMjEyMTg1MS44ODMxNDEtMy1jaGFvQGtlcm5lbC5vcmc+
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICBUaGFua3MsCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IERlYXIgQ2hhbywKPiA+ID4gPiA+ID4gSSBuZWVkIHRvIGNvb3JkaW5h
dGUgdGhlIHRlc3RpbmcgcmVzb3VyY2VzLiBUaGUgcHJldmlvdXMgdGVzdGluZyBoYXMgYmVlbiBz
dG9wcGVkIGJlY2F1c2UgaXQgd2FzIGZpeGVkIHdpdGggdGhlIGN1cnJlbnQgcGF0Y2guIEluIGFk
ZGl0aW9uLCB0aGlzIHJlcXVpcmVzIHN0YWJpbGl0eSB0ZXN0aW5nIHRvIHJlcHJvZHVjZSwgc28g
aXQgd2lsbCB0YWtlIGEgY2VydGFpbiBhbW91bnQgb2YgdGltZS4gSWYgdGhlcmUgaXMgYW55IHNp
dHVhdGlvbiwgSSB3aWxsIHRlbGwgeW91IGluIHRpbWUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gWmhp
Z3VvLCB0aGFuayB5b3UhCj4gPiA+ID4KPiA+ID4gPiBXZSB0ZXN0ZWQgdGhpcyBwYXRjaCAgdGhp
cyB3ZWVrZW5kIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHdpdGgKPiA+ID4gPiBwcm9ibGVtLCBh
bmQgaXQgY2FuIG5vdCByZXByb2R1Y2UgcGFuaWMgaXNzdWVzLAo+ID4gPiA+IHNvIHRoaXMgcGF0
Y2ggc2hvdWxkIGZpeCB0aGUgb3JpZ2luYWwgaXNzdWUuCj4gPiA+ID4gdGhhbmtz77yBCj4gPiA+
Cj4gPiBEZWFyIEphZWdldWssCj4gPiA+IEhleSwgZG8geW91IGd1eXMgcGxlYXNlIHBvaW50IG91
dCB3aGljaCBwYXRjaGVzIHdlcmUgdGVzdGVkIHdpdGhvdXQgd2hhdD8KPiA+IFRoaXMgcHJvYmxl
bSBvY2N1cnJlZCBkdXJpbmcgb3VyIHBsYXRmb3JtIHN0YWJpbGl0eSB0ZXN0aW5nLgo+ID4gaXQg
Y2FuIGJlIGZpeGVkIGJ5IG15ICB0aGlzIHBhdGNoIHNldCwgbWFpbmx5IGJlIGZpeGVkIGJ5Ogo+
ID4gZjJmczogZml4IHBhbmljIGlzc3VlIGluIHVwZGF0ZV9zaXRfZW50cnkgJiBmMmZzOiBlbmhh
bmNlIGp1ZGdtZW50Cj4gPiBjb25kaXRpb25zIG9mIEdFVF9TRUdOTwo+ID4gYW5kIENoYW8ncyBw
YXRjaCBjYW4gYWxzbyBmaXggdGhpcyBwcm9ibGVtcyB0ZXN0aW5nIHdpdGhvdXQgbXkgcGF0Y2gK
PiA+ID4gSU9Xcywgd2hpY2ggcGF0Y2hlcyBzaG91bGQgSSByZW1vdmUgYW5kIGtlZXAgQ2hhbydz
IHBhdGNoPwo+ID4gSSB0aGluayBjaGFvJ3MgcGF0Y2ggaXMgbW9yZSByZWFzb25hYmxlLCBpdCBk
b2VzIGVycm9yIGhhbmRsaW5nIG1vcmUgY29tcGxldGUuCj4gPiBidXQgbXkgcGF0Y2gganVzdCBk
byBzb21lIHNhbml0eSBjaGVjayBmb3IgcmV0dXJuIHZhbHVlIG9mIEdFVF9TRUdOTwo+ID4gU2Ft
ZSBhcyBvdGhlciBjb2Rlcyh1cGRhdGVfc2VnbWVudF9tdGltZSkKPiA+IGFuZCBpIHRoaW5rIGl0
IGFsc28gbmVlZGVkIGV4Y2VwdCB0aGlzIHBhcnQ6Cj4KPiBUaGFua3MgZm9yIGNvbmZpcm1hdGlv
bi4gSXQgc2VlbXMgaXQnZCBiZSBiZXR0ZXIgdG8gcmV2ZXJ0IHlvdXJzIGFuZCBhcHBseQo+IENo
YW8ncyBwYXRjaCBmaXJzdC4gSWYgeW91IHRoaW5rIHRoZXJlJ3Mgc29tZXRoaW5nIHRvIGltcHJv
dmUgb24gdG9wIG9mIGl0LAo+IGNvdWxkIHlvdSBwbGVhc2Ugc2VuZCBhbm90aGVyIHBhdGNoIGFm
dGVyd2FyZHM/CgpPSywgSSB0aGluayB0aGlzIHR3byBwYXRjaGVzIHN0aWxsIG5lZWRlZAogIGYy
ZnM6IGNvcnJlY3QgY291bnRpbmcgbWV0aG9kcyBvZiBmcmVlX3NlZ21lbnRzIGluIF9fc2V0X2lu
dXNlCiAgZjJmczogZml4IHBhbmljIGlzc3VlIGluIHVwZGF0ZV9zaXRfZW50cnkKYW5kIEknbGwg
cmVvcmdhbml6ZSBpdAp0aGFua3MKPgo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21l
bnQuaCBiL2ZzL2YyZnMvc2VnbWVudC5oCj4gPiBpbmRleCAzYmYyY2U0NmZhMDkwNy4uYmIyMmZl
ZWFlMWNmY2IgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuaAo+ID4gKysrIGIvZnMv
ZjJmcy9zZWdtZW50LmgKPiA+IEBAIC05Niw3ICs5Niw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
YW5pdHlfY2hlY2tfc2VnX3R5cGUoc3RydWN0Cj4gPiBmMmZzX3NiX2luZm8gKnNiaSwKPiA+IChH
RVRfU0VHT0ZGX0ZST01fU0VHMChzYmksIGJsa19hZGRyKSAmIChCTEtTX1BFUl9TRUcoc2JpKSAt
IDEpKQo+ID4gI2RlZmluZSBHRVRfU0VHTk8oc2JpLCBibGtfYWRkcikgXAo+ID4gLSAoKCFfX2lz
X3ZhbGlkX2RhdGFfYmxrYWRkcihibGtfYWRkcikpID8gXAo+ID4gKyAoKCFfX2lzX3ZhbGlkX2Rh
dGFfYmxrYWRkcihibGtfYWRkcikgfHwgXAo+ID4gKyAhZjJmc19pc192YWxpZF9ibGthZGRyKHNi
aSwgYmxrX2FkZHIsIERBVEFfR0VORVJJQykpID8gXAo+ID4gTlVMTF9TRUdOTyA6IEdFVF9MMlJf
U0VHTk8oRlJFRV9JKHNiaSksIFwKPiA+IEdFVF9TRUdOT19GUk9NX1NFRzAoc2JpLCBibGtfYWRk
cikpKQo+ID4gI2RlZmluZSBDQVBfQkxLU19QRVJfU0VDKHNiaSkKPiA+IGJlY2F1c2UgQ2hhbydz
IHBhdGNoIGxldCBuZXdfYWRkcj1udWxsX2FkZHIgd2hlbiAgZ2V0X25ld19zZWdtZW50Cj4gPiBy
ZXR1cm5zIE5PU1BBQ0UsCj4gPiBzbyBJIHRoaW5rIHRoaXMgY2FuIGJlIHJldmVydGVkIGFuZCBp
dCBhbHNvIHNhdmVzIGNvZGUgcnVubmluZyB0aW1lLgo+ID4gSG93IGFib3V0IENoYW8ncyBvcGlu
aW9ucz8KPiA+IHRoYW5rcyEKPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJUVywg
SSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCBmb3IgYSB3aGlsZSwgYW5kIGl0IGxvb2tzIHRoZXJlIGlz
IG5vIGlzc3VlIHcvCj4gPiA+ID4gPiBGQVVMVF9OT19TRUdNRU5UIGZhdWx0IGluamVjdGlvbiBp
cyBvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGJ0dywgV2h5IGNhbuKAmXQgSSBzZWUgdGhpcyBw
YXRjaCBvbiB5b3VyIGJyYW5jaF5ePwo+ID4gPiA+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9sb2cvP2g9ZGV2LXRlc3Qg
PGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NoYW8vbGlu
dXguZ2l0L2xvZy8/aD1kZXYtdGVzdD4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUb28gbGF6eSB0byBw
dXNoIHBhdGNoZXMgaW4gdGltZSwgd2lsbCBkbyBpdCBpbiB0aGlzIHdlZWtlbmQuIDpQCj4gPiA+
ID4gPgo+ID4gPiA+ID4gPiB0aGFua3PvvIEKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gICAgICA+Cj4gPiA+ID4gPiA+ICAgICAgPiBNb3JlIGRldGFpbCBzaG93biBpbiBmb2xs
b3dpbmcgcGF0Y2ggc2V0cy4KPiA+ID4gPiA+ID4gICAgICA+IFRoZSB0aHJlZSBwYXRjaGVzIGFy
ZSBzcGxpdGVkIGhlcmUgYmVjYXVzZSB0aGUgbW9kaWZpY2F0aW9ucyBhcmUKPiA+ID4gPiA+ID4g
ICAgICA+IHJlbGF0aXZlbHkgaW5kZXBlbmRlbnQgYW5kIG1vcmUgcmVhZGFibGUuCj4gPiA+ID4g
PiA+ICAgICAgPgo+ID4gPiA+ID4gPiAgICAgID4gLS0tCj4gPiA+ID4gPiA+ICAgICAgPiBDaGFu
Z2VzIG9mIHYyOiBzdG9wIGNoZWNrcG9pbnQgd2hlbiBnZXQgYSBvdXQtb2YtYm91bmQgc2VnbWVu
dAo+ID4gPiA+ID4gPiAgICAgID4gLS0tCj4gPiA+ID4gPiA+ICAgICAgPgo+ID4gPiA+ID4gPiAg
ICAgID4gWmhpZ3VvIE5pdSAoNCk6Cj4gPiA+ID4gPiA+ICAgICAgPiAgICBmMmZzOiBjb3JyZWN0
IGNvdW50aW5nIG1ldGhvZHMgb2YgZnJlZV9zZWdtZW50cyBpbiBfX3NldF9pbnVzZQo+ID4gPiA+
ID4gPiAgICAgID4gICAgZjJmczogZml4IHBhbmljIGlzc3VlIGluIHVwZGF0ZV9zaXRfZW50cnkK
PiA+ID4gPiA+ID4gICAgICA+ICAgIGYyZnM6IGVuaGFuY2UganVkZ21lbnQgY29uZGl0aW9ucyBv
ZiBHRVRfU0VHTk8KPiA+ID4gPiA+ID4gICAgICA+ICAgIGYyZnM6IHN0b3AgY2hlY2twb2ludCB3
aGVuIGdldCBhIG91dC1vZi1ib3VuZHMgc2VnbWVudAo+ID4gPiA+ID4gPiAgICAgID4KPiA+ID4g
PiA+ID4gICAgICA+ICAgZnMvZjJmcy9maWxlLmMgICAgICAgICAgfCAgNyArKysrKystCj4gPiA+
ID4gPiA+ICAgICAgPiAgIGZzL2YyZnMvc2VnbWVudC5jICAgICAgIHwgMjEgKysrKysrKysrKysr
KysrKy0tLS0tCj4gPiA+ID4gPiA+ICAgICAgPiAgIGZzL2YyZnMvc2VnbWVudC5oICAgICAgIHwg
IDcgKysrKy0tLQo+ID4gPiA+ID4gPiAgICAgID4gICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8
ICAxICsKPiA+ID4gPiA+ID4gICAgICA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiAgICAgID4KPiA+ID4gPiA+ID4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
