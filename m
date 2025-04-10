Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39530A84C95
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 21:09:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2xGe-0005PO-AE;
	Thu, 10 Apr 2025 19:08:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u2xGc-0005P9-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 19:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Y0/uhXd2QUEZXh0fpsc6xLQ/uoMgPtkqDUVn/wDmnY=; b=lh2UWcM64Y9KZWsYke8YxhEwec
 aobUIEaD5JKsVReDAUWvXMFKHjKdIWbtmul45L2rwkKfF3xFflnqziIRC6h9gHthLp8gWMWH4NKvt
 aEBdJ7hLz4U3ZSj9DEo9hbUnsNnSARGW7Rz1vtXmkfWP1+Fy3ZusrQbQ80v/Lx7CGR94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Y0/uhXd2QUEZXh0fpsc6xLQ/uoMgPtkqDUVn/wDmnY=; b=PHNAXlinDwtao+8Lh/N+uPPJyj
 dcA/vZetVe7G+qt+evyBGiaqikwjlQPzVCJBxhTB3nZ67eHVfRjRFHWO14c1oJXv7Fc55Y+4650T8
 EaP+dNXFOLWrB8mqp4BRSB6J0VfLDvKKEI2mVwkAhMZr9hQtUgZXJfQhhs/iedMDwhrw=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u2xGN-0007Ff-QS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 19:08:51 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so155837266b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744312104; x=1744916904; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Y0/uhXd2QUEZXh0fpsc6xLQ/uoMgPtkqDUVn/wDmnY=;
 b=X1MHArRR4Cz+vJhw3/tbf8jsy/wNflwq6/bv5Yw7qcFyAvT51tE5z7GVVcgY4hmktO
 fz1gDK3bMV/bQtWZusRVOPiPyCECO/cLM0iRkmAcgNsQ4HlwkF6m/AE3BpwjPj/mc42B
 3yQwfeD92Ty6Y7jezU4MUPxNj5dOPY4BW2y9e74nli5fQHJs12eBKmITjJ7NBxI6fiMs
 OWijOPW7yIertSxSVKyq6WSHlDgRLD4fAf6He4ljI5pRdiXHvvIDaUAHMif0lmlNLveL
 ekPpxY0IXQdYwqm4C2ULvO4KaAXRS0NS8gll36IcCTcelVXsZ6ws/Rwuf2xemOjJEldX
 Wwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744312104; x=1744916904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Y0/uhXd2QUEZXh0fpsc6xLQ/uoMgPtkqDUVn/wDmnY=;
 b=NnuMuHmNPiBQ8QGpjIXhTwXazBU9RPdJlk8Rq5tUZDdG7n3gjP0IekJ59wBY+VhQM0
 d4T5TRv6dHn8W6M2OkGuxxPYZt0JNoy5EP8gZV+I0/rsnEPe8kl5q61L0KALIPVHGThq
 KyfCGjffrT1unZEmVhbKlof21zMji2z8Y3XfEJncYA068BBoAoVpWpoTnAB77W9zwxRy
 AoqGnUyURivSOkToS3WTRtS2GvXHQxpKH/33E8/ksbFQSdYDxZqlaXkArlOV+gGRme68
 Jb0d3XdFWkbSLM8TkM3+N+oqOmj3Vw4ENdu8bFze6+JxP2x9v6fBXQWAiZnWq8jICEPx
 HoaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqPF6zZcA/ZVVpNUjMNOeM4+fupZ9/EKDZyXbPzaTa7FSMO3mZT7LEoEBB5oJzQ2KKWGstRExYiH15JXMtmopO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YywWNJ460VOdTEz8vcJ4V6vVzcda9S6d4NP/hkQBUFoj8bhm8Cd
 q8g/9wki6i+fb/NVvjQaXQS1ALbuVuwXckzgvTJGS1qsSYJDfnBDp/FC47xH/fjJX+tZc+cWttD
 sxnz3JVNmqqVIvQgbwxSMLV5UTiU=
X-Gm-Gg: ASbGncubl01sJszi8QzIxqKjbNk2W0GFKhqn/BZzFrkcZY+4u5knUkro5AL7xP8t28G
 eyRt0m7qMDzHWUtmgZDrl6dc7yALwSMf+OojhqX5VDfcS7qOwjxu7XSHxM2Gwc64NwEOLUzFPsH
 3BQnCd6lFPBjoaDPPuczJEZUTmQdmshe6TqQ==
X-Google-Smtp-Source: AGHT+IFlpV1PZrgzrPZxjEmSPQbScBKiWJoVHVoJJCVU2Mezg0hRBRU15POZgpzfWRT7IU2CcPPsd41X2x1v+8eeQ0w=
X-Received: by 2002:a17:907:7202:b0:ac7:c59e:fc3e with SMTP id
 a640c23a62f3a-acabd25169amr307629466b.25.1744312103828; Thu, 10 Apr 2025
 12:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com>
 <b5a8a872-5d62-424d-8af4-fb9a4a29385e@kernel.org>
In-Reply-To: <b5a8a872-5d62-424d-8af4-fb9a4a29385e@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Thu, 10 Apr 2025 12:08:12 -0700
X-Gm-Features: ATxdqUESKb4Z1eCDAfovckJQQBqu3goNYrFSt_ztQKfOsfqhVcvbX1OGIuLU0WQ
Message-ID: <CAD14+f3D+rFDDLp4-Po_i85U7LyknUQwFSYgZkJq-6s-wuAhTg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao, On Thu, Apr 10, 2025 at 7:56 AM Chao Yu wrote:
   > > On 2025/4/10 16:32, Juhyung Park wrote: > > Hi everyone. > > > > Besides
    salvaging @uplinkr's data [1], I figured it's important for us > > to un
   [...] 
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: arter97.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.42 listed in sa-accredit.habeas.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.42 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.42 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u2xGN-0007Ff-QS
Subject: Re: [f2fs-dev] Reproducing resize corruption
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
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCk9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDc6NTbigK9BTSBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMjAyNS80LzEwIDE2OjMyLCBKdWh5dW5nIFBhcmsg
d3JvdGU6Cj4gPiBIaSBldmVyeW9uZS4KPiA+Cj4gPiBCZXNpZGVzIHNhbHZhZ2luZyBAdXBsaW5r
cidzIGRhdGEgWzFdLCBJIGZpZ3VyZWQgaXQncyBpbXBvcnRhbnQgZm9yIHVzCj4gPiB0byB1bmRl
cnN0YW5kIHdoeSByZXNpemUgY29ycnVwdHMgZGF0YSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPiBZ
ZXMsIEkgZmVlbCB0aGUgc2FtZSB3aXRoIHlvdS4KPgo+ID4KPiA+IEkgdG9vayBzb21lIHRpbWUg
dG9kYXkgdG8gaGF2ZSBteSBsYXB0b3AncyAxLjhUaUIgZjJmcyBwYXJ0aXRpb24KPiA+IHJlc2l6
ZWQgc2xpZ2h0bHkgYW5kIG1hbmFnZWQgdG8gcmVwcm9kdWNlIHRoZSBkYXRhIGNvcnJ1cHRpb24u
Cj4gPgo+ID4gSSdtIG5vdCBuZWNlc3NhcmlseSBzdXJlIHdoZXRoZXIgdGhpcyB3b3VsZCBiZSB0
aGUgc2FtZSBzeW1wdG9tcyBhcwo+ID4gQHVwbGlua3IncywgYnV0IGl0J3MgcHJvYmFibHkgbGlr
ZWx5Lgo+Cj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwcm9kdWNpbmcsIGFuZCBnb29kIGNhdGNo
IQo+Cj4gPgo+ID4gSGVyZSdzIHdoYXQgSSBkaWQ6Cj4gPiAxLiBSZW1vdW50ZWQgdG8gY2hlY2tw
b2ludD1kaXNhYmxlCj4gPiAyLiBDcmVhdGUgYSBkbS1zbmFwc2hvdCBvZiB0aGUgY3VycmVudCBy
b290IGRldmljZQo+ID4gMy4gTW91bnQgc25hcHNob3QgdG8gcmVwbGF5IHRoZSBsb2cKPiA+IDQu
IFVubW91bnQKPiA+IDUuIFJlc2l6ZSBzZWN0b3IgNDg3MjQ4ODk2IHRvIDQ4NjUzOTI2NAo+Cj4g
QHVwbGlua3IncyBjYXNlIGlzIGV4cGFuZGluZyBwYXJ0aXRpb24sIG5vdCB0aGUgc2FtZSB3LyBz
aHJpbmsgb25lLgoKSXQgbXVzdCBoYXZlIGdvbmUgdGhyb3VnaCBzaHJpbmsgYW5kIGV4cGFuZCwg
dGhhdCdzIGhvdyBncGFydGVkIHdvcmtzIGlpcmMuCgpUbyBiZSBzcGVjaWZpYywgaGlzIGNhc2Ug
d2FzIGV4cGFuZGluZyB0aGUgcGFydGl0aW9uIHRvIGEgZGlmZmVyZW50Cm9mZnNldC4gVG8gcmVk
dWNlIHRpbWUgcmVxdWlyZWQgZm9yIHRoaXMsIGdwYXJ0ZWQgZmlyc3Qgc2hyaW5rcyB0aGUKcGFy
dGl0aW9uIGFzIG11Y2ggYXMgaXQgY2FuIGlucGxhY2UsIGFuZCB0aGVuIG1vdmUgaXQgdG8gdGhl
IG5ldwpvZmZzZXQsIGFuZCB0aGVuIGV4cGFuZCBpdCBiYWNrIHRvIGZ1bGwgc2l6ZS4gTWF5YmUg
dGhpcyBzY2VuYXJpbwpwcm9kdWNlcyBzb21lIGJ1Zz8KCj4KPiA+ICMgLi9yZXNpemUuZjJmcyAt
ZCAzIC1zIC1pIC9kZXYvbWFwcGVyL3NuYXAgLXQgNDg2NTM5MjY0Cj4KPiBBbHNvLCBJIGRpZG4n
dCBzZWUgbGFyZ2VfbmF0X2JpdG1hcCBmbGFnIGluIGhpcyBmc2NrLmxvZy4KPgo+ID4KPiA+IExh
dGVzdCBmMmZzLXRvb2xzIHdhcyB1c2VkOgo+ID4gMzNjNWI5NTM5YWYyIGYyZnNfaW86IGFkZCBm
cmFncmVhZCBjb21tYW5kIHRvIGV2YWx1YXRlIGZyYWdtZW50ZWQKPiA+IGJ1ZmZlciBmb3IgcmVh
ZHMKPiA+Cj4gPiBUaGlzIHJlcHJvZHVjZWQgdGhlIG1vdW50IGFuZCBmc2NrIGZhaWx1cmUuCj4g
Pgo+ID4gTW91bnQgbG9nOgo+ID4gWzQ0MjQzMS4wMjA1OTRdIEYyRlMtZnMgKGRtLTIpOiBpbnZh
bGlkIGNyY19vZmZzZXQ6IDAKPiA+IFs0NDI0MzEuMTMwMDU1XSBGMkZTLWZzIChkbS0yKTogU0lU
IGlzIGNvcnJ1cHRlZCBub2RlIyAxMzYxNTIwMSB2cyAxMzYxNjI5MAo+ID4gWzQ0MjQzMS4xMzk2
ODRdIEYyRlMtZnMgKGRtLTIpOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBGMkZTIHNlZ21lbnQgbWFu
YWdlciAoLTExNykKPgo+IEkgdHJpZWQ6Cj4KPiBhKSByZXNpemUuZjJmcyAtZCAzIC1zIC1pIGlt
ZyAtdCAkc2VjdG9ycwo+IGIpIHJlc2l6ZS5mMmZzIC1kIDMgLXMgaW1nIC10ICRzZWN0b3JzCj4K
PiBPbmx5IGEpIGNhbiByZXByb2R1Y2UgdGhlIGJ1Zywgd2UgbmVlZCB0byByZXZlcnQgLWkgc3Vw
cG9ydCBmb3IgcmVzaXplCj4gZmlyc3QuCgpVZ2gsIEkgc3VzcGVjdGVkIHRoaXMgY291bGQgYmUg
dGhlIGRldGVybWluaW5nIGZhY3RvciA6KAoKU28gQHVwbGlua3IncyBjYXNlIGlzIGEgZGlmZmVy
ZW50IGN1bHByaXQgb25lLiBJJ2xsIHRyeSB0byByZXByb2R1Y2UKc29tZXRoaW5nIHdpdGggbXkg
cGhvbmUgd2hpY2ggZG9lc24ndCB1c2UgbGFyZ2VfbmF0X2JpdG1hcC4KCj4KPiBUaGFua3MsCj4K
PiA+Cj4gPiBkZWJ1Z2ZzICYgcmVzaXplIGxvZzoKPiA+IGh0dHBzOi8vYXJ0ZXI5Ny5jb20vLmYy
ZnMtMjAyNTA0MTAvCj4gPgo+ID4gVGhlIGZzY2sgbG9nIHdhcyB3YXkgdG9vIGxhcmdlLCA4LjIx
R2lCIHdpdGhvdXQgIi1kIiBmbGFnIGFuZCBpdAo+ID4gY29udGFpbmVkIG1hbnkgc2Vuc2l0aXZl
IGRhdGEsIHNvIEknbSBub3QgdXBsb2FkaW5nIGl0IGZvciBub3cuCj4gPgo+ID4gIEZyb20gbG9v
a2luZyBhdCB0aGUgZG0gc3RhdHMsIHRoZSBmc2NrIGFsc28gd3JvdGUgMjEzOCBNaUIgdG8gdGhl
Cj4gPiBzbmFwc2hvdCBkZXZpY2UuCj4gPgo+ID4gQ2hhbywgY2FuIHdlIHN0YXJ0IGZyb20gaGVy
ZT8KPiA+IFRoYW5rcy4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZjJmcy1kZXZlbC82MDhmMjNjZS01NmVmLTRmYWYtYmVlMS0zYWE4OTc4NmVkNDFAa2VybmVsLm9y
Zy9ULyNtYzYyOGY4ZjNjYTZjNzMxNzhmZmExNzE2ZjkyNzc1NTUyNzg1NmQ0Ygo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
