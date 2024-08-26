Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D695F3B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 16:21:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1siaaO-0004hM-Kl;
	Mon, 26 Aug 2024 14:20:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1siaaN-0004hD-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 14:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LAvOeGF70b/tyNQvzVHIYtL85WLQSXPqWBdn9OCUIrQ=; b=Y1pGjCXOIQDi/qtZYQJRQ3dN+w
 cOUBbqMsfjMqtXAhIs/ogjpVaqpJcyxmxhBIPL1KZnruFS3xkzxM6ZpUmTejZ7s75fLXFcjlERiUY
 C66icKXt3GuI+qQOy+Ty/A8lljLXrAtEXN/F6U/rucX2I2CjB5+lK/ZFOVg87KXX2dj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LAvOeGF70b/tyNQvzVHIYtL85WLQSXPqWBdn9OCUIrQ=; b=GsofXW5KwoYiy6yJSMjCWeQVj6
 RyeAPFqCFhLVdGuIS6UN+KbAO//8eaOMCkOgmkhH5VSeEeExYLhf2huCAdaDjn+fWJzz1UssiOgk9
 0NILaS9I6rxRIb0UZVjJinWMNn7jFH0FosxYeDaOhxVBhXnrOuIdyfRB4ntYX8LydA6g=;
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1siaaN-000243-3y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 14:20:47 +0000
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6bf705959f1so36882506d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1724682036; x=1725286836;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LAvOeGF70b/tyNQvzVHIYtL85WLQSXPqWBdn9OCUIrQ=;
 b=zuEt0ozj1Zcdlc8DCA96K5AgPxXIKU5PffgDSjmh27G2hyG4EXHNmuFAzrK0+ngz6t
 4oDhpVowOLt1E6lhE107dMO7dC13lLwWxDklxhlbFepxY9MTv6a8my+ONB4gS7IdJbKm
 qq9cEsBfm1j8DVXor4/fIQRI82Ps8Wxdca/u2bCcNyP4e4DDvxvBuzyzBocrWGH7KRtZ
 6hn9inNU6Yu0sLlxNs4B8xzr2rEEQVPWXANJ4Y9un+h6lab5VrJo6CECUGBr6zIXg5hw
 RUPsVxyYcWcsCCCTDCdW4g7uUrwx6TUDdXBn1hGj8bosYwEZZ8jpjpPulf4G0qi+vSFL
 WoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724682036; x=1725286836;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LAvOeGF70b/tyNQvzVHIYtL85WLQSXPqWBdn9OCUIrQ=;
 b=T0fpJ6/9bO4OPz85LXml0IiNeUrLQ7zkZ0qtmAJJz1mSsFKOST//OGr2Ow3VSdEEJX
 O1Uo71N4zepQ9MP+dNpTAxDmbWz/RAxNrC0jD6d/uSiBXNgAsWNfrhatm/JQNDqnn4a9
 1d53EFnkxTKpPGRgf1Z53HBmYgS8bqkztC4lORwc34fKYAQ3++hlhfDkdgkcXxCkgqGk
 zl/JPgqxfN6TqeD7FCrdasPomJz0RatkYZAeM1d2kPDqIgZ1AS2HVYM17wBSGZBtASXc
 SBukAsOZ5/Kz/HBgRiZ3QWzVGVynanVPsgeRLlcwpVd8wrAoTy4tQStH1ND38odqacqO
 qMVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYIHxMg+Y84LNGzVgu4fFnBIsFlkNPnylakUCkjHVOMX8VGO8eUgH/ohjR/Ig1uDCiGXkFrbpJB5vu055Dk1BH@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy3s4l+LKuYTpWg6Df/hSrio8aspBPdBYWTSBOY/utrafbIZwcs
 5X5OEz5slgIKPb8/FTFcxQOlFfwO7F/FGBdExQ5X7rKaqyNyUTfU4ZtO0P1KkLlTHEABoCRbqm2
 U
X-Google-Smtp-Source: AGHT+IFju7ySUA3x2Z+qp7YrSg1R12K+A25Sxpx8ZwVX2aZ7NPHJcqfZDGHdJBnFyQUJpOVMD7R+sw==
X-Received: by 2002:a05:620a:462b:b0:79d:554d:731f with SMTP id
 af79cd13be357-7a67d4b1d4fmr2413233585a.29.1724681583196; 
 Mon, 26 Aug 2024 07:13:03 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f3f798esm456097485a.106.2024.08.26.07.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 07:13:02 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:13:01 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20240826141301.GB2393039@perftesting>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-3-lizetao1@huawei.com>
 <Zsaq_QkyQIhGsvTj@casper.infradead.org>
 <0f643b0f-f1c2-48b7-99d5-809b8b7f0aac@gmx.com>
 <ZscqGAMm1tofHSSG@casper.infradead.org>
 <38247c40-604b-443a-a600-0876b596a284@gmx.com>
 <7a04ac3b-e655-4a80-89dc-19962db50f05@gmx.com>
 <Zsis82IKSAq6Mgms@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zsis82IKSAq6Mgms@casper.infradead.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Aug 23, 2024 at 04:38:27PM +0100, Matthew Wilcox wrote:
    > On Fri, Aug 23, 2024 at 11:43:41AM +0930, Qu Wenruo wrote: > > 在 2024/8/23
    07:55, Qu Wenruo 写道: > > > 在 2024/8/22 21:37, Matth [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.219.54 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.54 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.54 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.54 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1siaaN-000243-3y
Subject: Re: [f2fs-dev] [PATCH 02/14] btrfs: convert
 get_next_extent_buffer() to take a folio
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
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 clm@fb.com, terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMDQ6Mzg6MjdQTSArMDEwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMTE6NDM6NDFBTSArMDkzMCwgUXUgV2Vu
cnVvIHdyb3RlOgo+ID4g5ZyoIDIwMjQvOC8yMyAwNzo1NSwgUXUgV2VucnVvIOWGmemBkzoKPiA+
ID4g5ZyoIDIwMjQvOC8yMiAyMTozNywgTWF0dGhldyBXaWxjb3gg5YaZ6YGTOgo+ID4gPiA+IE9u
IFRodSwgQXVnIDIyLCAyMDI0IGF0IDA4OjI4OjA5UE0gKzA5MzAsIFF1IFdlbnJ1byB3cm90ZToK
PiA+ID4gPiA+IEJ1dCB3aGF0IHdpbGwgaGFwcGVuIGlmIHNvbWUgd3JpdGVzIGhhcHBlbmVkIHRv
IHRoYXQgbGFyZ2VyIGZvbGlvPwo+ID4gPiA+ID4gRG8gTU0gbGF5ZXIgZGV0ZWN0cyB0aGF0IGFu
ZCBzcGxpdCB0aGUgZm9saW9zPyBPciB0aGUgZnMgaGFzIHRvIGdvIHRoZQo+ID4gPiA+ID4gc3Vi
cGFnZSByb3V0aW5lICh3aXRoIGFuIGV4dHJhIHN0cnVjdHVyZSByZWNvcmRpbmcgYWxsIHRoZSBz
dWJwYWdlIGZsYWdzCj4gPiA+ID4gPiBiaXRtYXApPwo+ID4gPiA+IAo+ID4gPiA+IEVudGlyZWx5
IHVwIHRvIHRoZSBmaWxlc3lzdGVtLsKgIEl0IHdvdWxkIGhlbHAgaWYgYnRyZnMgdXNlZCB0aGUg
c2FtZQo+ID4gPiA+IHRlcm1pbm9sb2d5IGFzIHRoZSByZXN0IG9mIHRoZSBmaWxlc3lzdGVtcyBp
bnN0ZWFkIG9mIGludmVudGluZyBpdHMgb3duCj4gPiA+ID4gInN1YnBhZ2UiIHRoaW5nLsKgIEFz
IGZhciBhcyBJIGNhbiB0ZWxsLCAic3VicGFnZSIgbWVhbnMgImZzIGJsb2NrIHNpemUiLAo+ID4g
PiA+IGJ1dCBtYXliZSBpdCBoYXMgYSBkaWZmZXJlbnQgbWVhbmluZyB0aGF0IEkgaGF2ZW4ndCBh
c2NlcnRhaW5lZC4KPiA+ID4gCj4gPiA+IFRoZW4gdGVsbCBtZSB0aGUgY29ycmVjdCB0ZXJtaW5v
bG9neSB0byBkZXNjcmliZSBmcyBibG9jayBzaXplIHNtYWxsZXIKPiA+ID4gdGhhbiBwYWdlIHNp
emUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gPiAKPiA+ID4gImZzIGJsb2NrIHNpemUiIGlzIG5v
dCBnb29kIGVub3VnaCwgd2Ugd2FudCBhIHRlcm1pbm9sb2d5IHRvIGRlc2NyaWJlCj4gPiA+ICJm
cyBibG9jayBzaXplIiBzbWFsbGVyIHRoYW4gcGFnZSBzaXplLgo+IAo+IE9oIGRlYXIuICBidHJm
cyByZWFsbHkgaGFzIGNvcnJ1cHRlZCB5b3VyIGJyYWluLiAgSGVyZSdzIHRoZSB0ZXJtaW5vbG9n
eQo+IHVzZWQgaW4gdGhlIHJlc3Qgb2YgTGludXg6CgpUaGlzIGlzbid0IG5lY2Vzc2FyeSBjb21t
ZW50YXJ5LCB0aGlzIGdpdmVzIHRoZSBpbXByZXNzaW9uIHRoYXQgd2UncmUKd3Jvbmcvc3R1cGlk
L2V0Yy4gIFdlJ3JlIGFsbCBpbiB0aGlzIGNvbW11bml0eSB0b2dldGhlciwgaGF2aW5nIHB1Ymxp
YywgbmVnYXRpdmUKY29tbWVudGFyeSBsaWtlIHRoaXMgaXMgdW5uZWNlc3NhcnksIGFuZCBmcmFu
a2x5IGNvbnRyaWJ1dGVzIHRvIG15IGdyb3dpbmcKZGVzaXJlL3ByaW9yaXRpZXMgdG8gc2hpZnQg
bW9zdCBvZiBteSBkZXZlbG9wbWVudCBvdXRzaWRlIG9mIHRoZSBrZXJuZWwKY29tbXVuaXR5LiAg
QW5kIGlmIHNvbWVib2R5IHdpdGggbXkgZXhwZXJpZW5jZSBhbmQgaGlzdG9yeSBpbiB0aGlzIGNv
bW11bml0eSBpcwpiZWNvbWluZyBtb3JlIGFuZCBtb3JlIGRpc2lsbHVzaW9uZWQgd2l0aCB0aGlz
IHdvcmsgYW5kIG1ha2luZyBzZXJpb3VzIGVmZm9ydHMKdG8gZXh0cmljYXRlIHRoZW1zZWx2ZXMg
ZnJvbSB0aGUgcHJvamVjdCwgdGhlbiB3aGF0IGRvZXMgdGhhdCBzYXkgYWJvdXQgb3VyCmFiaWxp
dHkgdG8gYnJpbmcgaW4gbmV3IGRldmVsb3BlcnM/ICBUaGFua3MsCgpKb3NlZgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
