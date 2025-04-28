Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B47A9E62C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Apr 2025 04:16:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9E2Y-0004pI-Hd;
	Mon, 28 Apr 2025 02:16:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryncsn@gmail.com>) id 1u9E2X-0004pB-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 02:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQ3SWGn27BCwgTlwVuWoagqo48udMIdPe40yMeKOuL0=; b=HPmB2W2pfI5hqKiYuCqyh206dP
 RIBZOBeTV027nmg1DXXSk0bzc3bMRpC8RR0p6N8m9jwVHs/5AZhJJsU7Wy3Hr1koYI1yZWJADwnI1
 UPltgDH1/byLoteKniZ0UX1lHLI53gPfeq4I7VZi9C6KKLyts18lfqE83SGZ3fvvthiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQ3SWGn27BCwgTlwVuWoagqo48udMIdPe40yMeKOuL0=; b=fZoV9WvIEGkpMlMiH0YfX8uqjZ
 aqgUyiKyB4x7316ql+cY9cBe0KBreapzN9Mtt0pMHzj1G7QHVaKmme2d2Zxc4H4Hsb1lzCFzqhC8o
 ueBiJs964yQ0gWnQVScNYoSGhAu8k4EnS/ae7zpohzCTxmb45RrEdYF6IHRXnSdz9t9c=;
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u9E2H-00025I-7p for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 02:16:14 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-310447fe59aso48927551fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 27 Apr 2025 19:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745806545; x=1746411345; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQ3SWGn27BCwgTlwVuWoagqo48udMIdPe40yMeKOuL0=;
 b=mBN64xIQ7aF5VQCz946sYoPSv4sybXCXxP3XLPYHFGz6Umf9jR/a6BijuOKRklT21a
 LTDim5l2/WspD5aH0Lr+9ntLpiqBx8Tt9JvPJsE3UukMhmwn2FkLuyMH27+yWg2fT3Xz
 +dxAC6od6k9eOnnJgnb3u7HeTHpCVqPD8w6uQWQ4hT9X8d4tjUu5FY8082CUymjS/LJd
 phoqmDRh6zEjF2hnBZn9cKOxGSQeEKdUauLzXA/IuBEGdk/f7pABKR7g8eQfFpr9rCUG
 CzJBAO4f/cStStdEu9qzXGy6EL40yrEfI3JqrgHaJvQ3310BpjsAfwzJDQ9yl2Ny5ibf
 cjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745806545; x=1746411345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQ3SWGn27BCwgTlwVuWoagqo48udMIdPe40yMeKOuL0=;
 b=t7dvz8lJR9c8gGOzjzXYMXHkN0FGUH7BT7GtWFKLFn4UuFyDjj85m/5Y7kN6dh7fGv
 00RS+6om444l2ULvGr79vCjCP6QAuEcrXPq1jqjwa5UNXs6/761y47oAxq2PVPm70KZN
 RPXf+zPN8tGe4qAoWLg3xCq1zSOv8/6oo+GPXB0uBKowS+jvI953Jemd8xn7P3Wh9JjQ
 2RVcEo9QDM8a4mR9ZBkMxoYBv1kzMX5pM8Yi3EFqaRSEojQa74pR7rITzgR0vAIXXwZ2
 LIegV3tPopobDAxBgyMUGOcmwcKlVjchWLsYiA0E7FfBaGP6PuWehbenVcbbScaUD6NU
 /+Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmTgGh1Ktxn7imIWdozim8vbU+TVhXJ9hzRpxkyph20u4qxeNaDjTRXlmz7MjLuoROORj5gqgyF6TaJliB9jRV@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzUDQpPDG8M8z2ALF+n7hSQJ+0VckmZf/xkWTj7DtuJjpsu2Uc3
 oQAyWLwM3mFj8gUxjHGL4pNdPumY8znCgR2Cd/UlEwAd30NJmTcfgxWSqF1oG0oRQsD1ETFG2Z9
 Gfc1tDDSkSt4ep4NHqCz/lDl+r8w=
X-Gm-Gg: ASbGncsFj225UmWC3VFXK4LnErwLh4l4WEYukdsZgjy6ZZdb+GVS7BaXtegKuQedPWe
 gVsSPw4w+P32CGIer0izHhzKah8f2MyTEyjTYnW0FkrA7dAZ/fcfBvkqK9r4y+iZ1Brbodrze8y
 AG4TFT4hYJSZ+dgyrwRqmS/Q==
X-Google-Smtp-Source: AGHT+IG7UEnKhmPX+T19gOKipnSGym71p6ZlEfKrJBpXtksc/IGjLyEnGyNHwrp/yB99kgRbdAkVwlfdHrJjXVhJiuw=
X-Received: by 2002:a2e:a362:0:b0:31a:ba1:2387 with SMTP id
 38308e7fff4ca-31a0ba1259dmr13521411fa.31.1745806545244; Sun, 27 Apr 2025
 19:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250427185908.90450-1-ryncsn@gmail.com>
 <20250427185908.90450-4-ryncsn@gmail.com>
 <aA7OuBS___7N4o8f@casper.infradead.org>
In-Reply-To: <aA7OuBS___7N4o8f@casper.infradead.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 28 Apr 2025 10:15:28 +0800
X-Gm-Features: ATxdqUHA3mEQSXKaITqXynHJs1t56sCX-IGuXPrMu1ZBnnGmrsOauHofJ02bpR8
Message-ID: <CAMgjq7A-mO0vs3ZX1m9i+dPSuSURwJUWL-03dMzGbbwkj_mHjA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 28, 2025 at 8:41 AM Matthew Wilcox wrote: >
   > On Mon, Apr 28, 2025 at 02:59:05AM +0800, Kairui Song wrote: > > folio_index
    is only needed for mixed usage of page cache and swap > > cac [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.178 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [ryncsn[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.208.178 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1u9E2H-00025I-7p
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: drop usage of folio_index
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
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Li <chrisl@kernel.org>,
 David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, "Huang,
 Ying" <ying.huang@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgODo0MeKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXByIDI4LCAyMDI1IGF0IDAyOjU5OjA1
QU0gKzA4MDAsIEthaXJ1aSBTb25nIHdyb3RlOgo+ID4gZm9saW9faW5kZXggaXMgb25seSBuZWVk
ZWQgZm9yIG1peGVkIHVzYWdlIG9mIHBhZ2UgY2FjaGUgYW5kIHN3YXAKPiA+IGNhY2hlLCBmb3Ig
cHVyZSBwYWdlIGNhY2hlIHVzYWdlLCB0aGUgY2FsbGVyIGNhbiBqdXN0IHVzZQo+ID4gZm9saW8t
PmluZGV4IGluc3RlYWQuCj4gPgo+ID4gSXQgY2FuJ3QgYmUgYSBzd2FwIGNhY2hlIGZvbGlvIGhl
cmUuICBTd2FwIG1hcHBpbmcgbWF5IG9ubHkgY2FsbCBpbnRvIGZzCj4gPiB0aHJvdWdoIGBzd2Fw
X3J3YCBhbmQgdGhhdCBpcyBub3Qgc3VwcG9ydGVkIGZvciBmMmZzLiAgU28ganVzdCBkcm9wIGl0
Cj4gPiBhbmQgdXNlIGZvbGlvLT5pbmRleCBpbnN0ZWFkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEthaXJ1aSBTb25nIDxrYXNvbmdAdGVuY2VudC5jb20+Cj4gPiBDYzogSmFlZ2V1ayBLaW0gPGph
ZWdldWtAa2VybmVsLm9yZz4gKG1haW50YWluZXI6RjJGUyBGSUxFIFNZU1RFTSkKPiA+IENjOiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IChtYWludGFpbmVyOkYyRlMgRklMRSBTWVNURU0pCj4g
PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQgKG9wZW4gbGlzdDpG
MkZTIEZJTEUgU1lTVEVNKQo+ID4gU2lnbmVkLW9mZi1ieTogS2FpcnVpIFNvbmcgPGthc29uZ0B0
ZW5jZW50LmNvbT4KPgo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2ls
bHlAaW5mcmFkZWFkLm9yZz4KPgo+ID4gQEAgLTEzMCw3ICsxMzAsNyBAQCBpbnQgZjJmc19yZWFk
X2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmb2xpbyAqZm9saW8pCj4g
PiAgICAgICAgICAgICAgIHJldHVybiAtRUFHQUlOOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAg
IGlmIChmb2xpb19pbmRleChmb2xpbykpCj4gPiArICAgICBpZiAoZm9saW8tPmluZGV4KQo+ID4g
ICAgICAgICAgICAgICBmb2xpb196ZXJvX3NlZ21lbnQoZm9saW8sIDAsIGZvbGlvX3NpemUoZm9s
aW8pKTsKPiA+ICAgICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgZjJmc19kb19yZWFkX2lubGlu
ZV9kYXRhKGZvbGlvLCBpcGFnZSk7Cj4KPiBUaGlzIGh1bmsgaXMgZ29pbmcgdG8gY29uZmxpY3Qg
d2l0aCBhIHBhaXIgb2YgcGF0Y2hlcyBJIHNlbnQgdG8gZjJmcy1kZXZlbAo+IGEgZmV3IHdlZWtz
IGFnby4gIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnkgZXNjYXBpbmcgaXQsIGp1c3QgYSBoZWFk
cy11cC4KPgoKVGhhbmtzIGZvciB0aGUgaW5mbywgdGhpcyBwYXRjaCBpcyBqdXN0IGNvbnZlcnRp
bmcgZm9saW9faW5kZXggdG8KZm9saW8tPmluZGV4IHNvIGNvbmZsaWN0IHNob3VsZCBiZSBlYXN5
IHRvIHJlc29sdmUgSSB0aGluaz8gSSBjYW4gZG8gYQpyZWJhc2UgbGF0ZXIgaWYgdGhhdCBzZXJp
ZXMgaXMgbWVyZ2VkIGZpcnN0LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
