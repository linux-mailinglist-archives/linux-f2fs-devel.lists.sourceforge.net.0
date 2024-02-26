Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2F8668BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 04:26:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reRcz-00084f-K7;
	Mon, 26 Feb 2024 03:26:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1reRcw-00084Y-Te
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 03:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jv+mmadT0JQ+7Y3ValYOoMlPEhfNnmPZVmHayZdTOLM=; b=k+Dc4ivIVKwssm9h0xSCGGLIFA
 ZVcwmYopF56FwcG1ecKERyhFf3rGyi6gH1gnbEZPMzGEKja2JRuCU2BvRb3xeNVxxEcmI6Rrp+6xq
 ptF4Tqis20gutEbWG8h3z3g8x3m6bgkLVdX0byNz9Fz/jgMaRUIOsrlzI8OXUXCoTaSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jv+mmadT0JQ+7Y3ValYOoMlPEhfNnmPZVmHayZdTOLM=; b=S7k3+PG30FUwNaxvnEq9kOhE7f
 /03Ny9SwHPq/dM1IB2Dbh0ARjzC+NHFuw8vIp19f+lbHCKkJsIcW3nzkSOArqhU5Zr+XcT2lVyoMr
 4Y041w1uNthJCT7c61a9UmCMVX7Ptun7gBRJX1RhpGNOnPbj+XofFDJPnZep8Rc9drpw=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1reRcx-0003ZH-5n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 03:26:03 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so3698504a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Feb 2024 19:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708917952; x=1709522752; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jv+mmadT0JQ+7Y3ValYOoMlPEhfNnmPZVmHayZdTOLM=;
 b=hhasO/NigmNS/p27syxQ2/TMcsYWqjualn9cVtJRUKl43M8L5IXG16LlY4GN9/YCTN
 7K/o/VXTNXho06FHvmQAwksImTzV/8Cl7Gciws4DHHWcfL65UhnCwajDepoBeo1AvY8f
 qD1NUEeUya+Eh8MgdLQ0kSYmBARf8vfLG7tZohJO10UVfgcAnyH37vKWWqAqqKgERG6j
 AI2kuYwGDrP7eCpfkky61dxStEEiahBHi6wvPxqoS8FdpXmao3X6MfkNvbkX6EOUce5k
 IqlWKHNxancWpmtbmZ0sfMkt3hhnO+X0NuLJXt/IO0paQQIfTEukAD0OP+yOaskUlSEX
 JoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708917952; x=1709522752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jv+mmadT0JQ+7Y3ValYOoMlPEhfNnmPZVmHayZdTOLM=;
 b=FpsaX+qtVRx6BUIvDZYzDxHliaEZDXXQVw6oFVBhIju7R3/WNYe1VcT7IgNt+qDUba
 6Q33KQfb9TUtIHFcoSyYZxl2DWKbsyC55uYHPIB1ItxqtUA0QDPnAZR0PCbF1qwtS92A
 ZlVo400FWCC8qyA71RgHopbXy8Np0N4qmCT4v15QZ+o130k/4Va88VDSk446fngaQyu7
 Ec3VETKRfQhdnc0OxY4vnLeMdoM1Z+oFCW20vkyqq8E+sStsqjbRVxJUTlHs0gsInkD7
 Vq/oMTpTYUYUMp8wwFE9m99NkjJ52YDhQYJCUfDJTiB14nWl9HP6I3/hhigINYWo6GgF
 6R6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Y94omOK4Lrq9rfdlhLdm+4RiFREYfNJ2esl4+UcatHB4TbD9hWYag47xxFmuTQ1NhWj73NR4Or8pa+E8ya1uc9Bb9/7EVYro+yOkOHFMlr/Cx0gr7A==
X-Gm-Message-State: AOJu0Yyh1KgNsq/gjOrl0AE/WPQwTknSYiReALU1321ZHaawNl11u6D8
 yDHKBHwqnYJpWrtMssRCD2sNNDxoOuCHt3NRqGDY78aRgioUPN8FFhZNORQbkjnAX9VL7Qr784x
 79i+4rJ5XTOyXAqK4GPshFbhDbDtrkkFNvcQ=
X-Google-Smtp-Source: AGHT+IFi4b/hbrcnzky8HJU7iITztodUBp5pYxopxYUYWyt65hJ2g5BsxCmiTqKPPsnbj2h4HpymNMadRQbdybaRrPw=
X-Received: by 2002:aa7:d5d5:0:b0:564:3392:e9db with SMTP id
 d21-20020aa7d5d5000000b005643392e9dbmr3387824eds.33.1708917951542; Sun, 25
 Feb 2024 19:25:51 -0800 (PST)
MIME-Version: 1.0
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
 <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
In-Reply-To: <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 26 Feb 2024 11:25:40 +0800
Message-ID: <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Chao, On Fri, Feb 23, 2024 at 10:38 AM Chao Yu wrote:
    > > On 2024/2/23 10:01, Zhiguo Niu wrote: > > > > > > On Thu, Feb 22, 2024
    at 8:30 PM Chao Yu <chao@kernel.org <mailto:chao@kernel.org>> wrote: >
   [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.53 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1reRcx-0003ZH-5n
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
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBDaGFvLAoKT24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMTA6MzjigK9BTSBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMjAyNC8yLzIzIDEwOjAxLCBaaGlndW8gTml1
IHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiBUaHUsIEZlYiAyMiwgMjAyNCBhdCA4OjMw4oCvUE0gQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnIDxtYWlsdG86Y2hhb0BrZXJuZWwub3JnPj4gd3JvdGU6Cj4g
Pgo+ID4gICAgIE9uIDIwMjQvMi83IDEwOjAxLCBaaGlndW8gTml1IHdyb3RlOgo+ID4gICAgICA+
IEEgcGFuaWMgaXNzdWUgaGFwcGVuZWQgaW4gYSByZWJvb3QgdGVzdCBpbiBzbWFsbCBjYXBhY2l0
eSBkZXZpY2UKPiA+ICAgICAgPiBhcyBmb2xsb3dpbmc6Cj4gPiAgICAgID4gMS5UaGUgZGV2aWNl
IHNpemUgaXMgNjRNQiwgYW5kIG1haW4gYXJlYSBoYXMgMjQgc2VnbWVudHMsIGFuZAo+ID4gICAg
ICA+IENPTkZJR19GMkZTX0NIRUNLX0ZTIGlzIG5vdCBlbmFibGVkLgo+ID4gICAgICA+IDIuVGhl
cmUgaXMgbm8gYW55IGZyZWUgc2VnbWVudHMgbGVmdCBzaG93biBpbiBmcmVlX3NlZ21hcF9pbmZv
LAo+ID4gICAgICA+IHRoZW4gYW5vdGhlciB3cml0ZSByZXF1ZXN0IGNhdXNlIGdldF9uZXdfc2Vn
bWVudCBnZXQgYSBvdXQtb2YtYm91bmQKPiA+ICAgICAgPiBzZWdtZW50IHdpdGggc2Vnbm8gMjQu
Cj4gPiAgICAgID4gMy5wYW5pYyBoYXBwZW4gaW4gdXBkYXRlX3NpdF9lbnRyeSBiZWNhdXNlIGFj
Y2VzcyBpbnZhbGlkIGJpdG1hcAo+ID4gICAgICA+IHBvaW50ZXIuCj4gPgo+ID4gICAgIFpoaWd1
bywKPiA+Cj4gPiAgICAgQ2FuIHlvdSBwbGVhc2UgdHJ5IGJlbG93IHBhdGNoIHRvIHNlZSB3aGV0
aGVyIGl0IGNhbiBmaXggeW91ciBwcm9ibGVtPwo+ID4KPiA+ICAgICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwMjIyMTIxODUxLjg4MzE0MS0zLWNoYW9Aa2Vy
bmVsLm9yZyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MDIy
MjEyMTg1MS44ODMxNDEtMy1jaGFvQGtlcm5lbC5vcmc+Cj4gPgo+ID4gICAgIFRoYW5rcywKPiA+
Cj4gPgo+ID4gRGVhciBDaGFvLAo+ID4gSSBuZWVkIHRvIGNvb3JkaW5hdGUgdGhlIHRlc3Rpbmcg
cmVzb3VyY2VzLiBUaGUgcHJldmlvdXMgdGVzdGluZyBoYXMgYmVlbiBzdG9wcGVkIGJlY2F1c2Ug
aXQgd2FzIGZpeGVkIHdpdGggdGhlIGN1cnJlbnQgcGF0Y2guIEluIGFkZGl0aW9uLCB0aGlzIHJl
cXVpcmVzIHN0YWJpbGl0eSB0ZXN0aW5nIHRvIHJlcHJvZHVjZSwgc28gaXQgd2lsbCB0YWtlIGEg
Y2VydGFpbiBhbW91bnQgb2YgdGltZS4gSWYgdGhlcmUgaXMgYW55IHNpdHVhdGlvbiwgSSB3aWxs
IHRlbGwgeW91IGluIHRpbWUuCj4KPiBaaGlndW8sIHRoYW5rIHlvdSEKCldlIHRlc3RlZCB0aGlz
IHBhdGNoICB0aGlzIHdlZWtlbmQgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gd2l0aApwcm9ibGVt
LCBhbmQgaXQgY2FuIG5vdCByZXByb2R1Y2UgcGFuaWMgaXNzdWVzLApzbyB0aGlzIHBhdGNoIHNo
b3VsZCBmaXggdGhlIG9yaWdpbmFsIGlzc3VlLgp0aGFua3PvvIEKCj4KPiBCVFcsIEkndmUgdGVz
dGVkIHRoaXMgcGF0Y2ggZm9yIGEgd2hpbGUsIGFuZCBpdCBsb29rcyB0aGVyZSBpcyBubyBpc3N1
ZSB3Lwo+IEZBVUxUX05PX1NFR01FTlQgZmF1bHQgaW5qZWN0aW9uIGlzIG9uLgo+Cj4gPiBidHcs
IFdoeSBjYW7igJl0IEkgc2VlIHRoaXMgcGF0Y2ggb24geW91ciBicmFuY2heXj8KPiA+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NoYW8vbGludXguZ2l0
L2xvZy8/aD1kZXYtdGVzdCA8aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvY2hhby9saW51eC5naXQvbG9nLz9oPWRldi10ZXN0Pgo+Cj4gVG9vIGxhenkgdG8g
cHVzaCBwYXRjaGVzIGluIHRpbWUsIHdpbGwgZG8gaXQgaW4gdGhpcyB3ZWVrZW5kLiA6UAo+Cj4g
PiB0aGFua3PvvIEKPiA+Cj4gPgo+ID4gICAgICA+Cj4gPiAgICAgID4gTW9yZSBkZXRhaWwgc2hv
d24gaW4gZm9sbG93aW5nIHBhdGNoIHNldHMuCj4gPiAgICAgID4gVGhlIHRocmVlIHBhdGNoZXMg
YXJlIHNwbGl0ZWQgaGVyZSBiZWNhdXNlIHRoZSBtb2RpZmljYXRpb25zIGFyZQo+ID4gICAgICA+
IHJlbGF0aXZlbHkgaW5kZXBlbmRlbnQgYW5kIG1vcmUgcmVhZGFibGUuCj4gPiAgICAgID4KPiA+
ICAgICAgPiAtLS0KPiA+ICAgICAgPiBDaGFuZ2VzIG9mIHYyOiBzdG9wIGNoZWNrcG9pbnQgd2hl
biBnZXQgYSBvdXQtb2YtYm91bmQgc2VnbWVudAo+ID4gICAgICA+IC0tLQo+ID4gICAgICA+Cj4g
PiAgICAgID4gWmhpZ3VvIE5pdSAoNCk6Cj4gPiAgICAgID4gICAgZjJmczogY29ycmVjdCBjb3Vu
dGluZyBtZXRob2RzIG9mIGZyZWVfc2VnbWVudHMgaW4gX19zZXRfaW51c2UKPiA+ICAgICAgPiAg
ICBmMmZzOiBmaXggcGFuaWMgaXNzdWUgaW4gdXBkYXRlX3NpdF9lbnRyeQo+ID4gICAgICA+ICAg
IGYyZnM6IGVuaGFuY2UganVkZ21lbnQgY29uZGl0aW9ucyBvZiBHRVRfU0VHTk8KPiA+ICAgICAg
PiAgICBmMmZzOiBzdG9wIGNoZWNrcG9pbnQgd2hlbiBnZXQgYSBvdXQtb2YtYm91bmRzIHNlZ21l
bnQKPiA+ICAgICAgPgo+ID4gICAgICA+ICAgZnMvZjJmcy9maWxlLmMgICAgICAgICAgfCAgNyAr
KysrKystCj4gPiAgICAgID4gICBmcy9mMmZzL3NlZ21lbnQuYyAgICAgICB8IDIxICsrKysrKysr
KysrKysrKystLS0tLQo+ID4gICAgICA+ICAgZnMvZjJmcy9zZWdtZW50LmggICAgICAgfCAgNyAr
KysrLS0tCj4gPiAgICAgID4gICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8ICAxICsKPiA+ICAg
ICAgPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
PiA+ICAgICAgPgo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
