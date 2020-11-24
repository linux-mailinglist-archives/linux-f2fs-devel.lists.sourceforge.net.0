Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 845942C1A75
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 02:04:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khMkR-0000gD-Fh; Tue, 24 Nov 2020 01:03:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1khMkO-0000g1-Gs
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 01:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vzXw+/uxksrYSQi7P32GugamvpCbRVeit1O2RKCjC8=; b=YPw3DbqqkqHFmE5ZFv4KvxpyWA
 c9pG0ClmXdjMUKOKA5tv55rTLxh/po63xXfMHETOOezzBs6YBI5HPS8Tb1/znzhbNUEeDwBnGEEka
 9/STj7PUCzkkFJevrvBdkCXpktHOQN14qx6X4TD2qrIi7icjgZKDgNhCgOuRgsiP/Y8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0vzXw+/uxksrYSQi7P32GugamvpCbRVeit1O2RKCjC8=; b=dKVCu6TrYFRWvNaIBNfTWP7iAq
 9xzLiZCiuvToPJFXmwXXnIiNXoyNnMaK3C+PUrE9NXxr8M1N6IPaUryKnI/9gjw76cCslE9biAQo7
 vA6Hc2eCTTsdle0NcpaRU4cM01eEZEJ2/sCblfBzE2uS9sZeZXyFDgXBYggxKiqMqG30=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1khMkI-001NiO-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 01:03:56 +0000
Received: by mail-lf1-f67.google.com with SMTP id a9so26488826lfh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Nov 2020 17:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0vzXw+/uxksrYSQi7P32GugamvpCbRVeit1O2RKCjC8=;
 b=EF1azQY4IzEj9jf33+wizwLb9UX45vSEYoFf2iwNgKTZGwbS+KxINRZEnRRocnfdlU
 IhSXD+t6wzk0HhlurTGK5mQiOlzilaiFOF8Fm5y4WtY1+k+JY0eWAIbLr0QA6y40h3zm
 1j5RdKHOzxe7to5SM0JgLz5hyvAHuC4cymOEPx9FyZ/da74tUA7dGWxl2UnSitL3/QDz
 QOnZLFk9m5byAiGhndXd02N+gSUNyI+6poo1I3NMfKhGRsK/BjCfnQxQKOCtsDjxkvDn
 kDDYwDExctxD2JhAH19FRFqc7jFh2VsJOG3m15c1h/I3CNrPX6omgb9PTy+UKVL1MOBB
 EgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0vzXw+/uxksrYSQi7P32GugamvpCbRVeit1O2RKCjC8=;
 b=Lo27wd9CYtH7xldHpqULKlesJ/7Ft/JxrJjX4YGkszS602DbV+RfMdpCk7S7S08dtk
 pOKrI80ktnltXgZpB35dm/2W5bvtoHssv6DeR4Ako2BTRq3uHCtgbKv3gKk8lzPA1JxB
 KMDf1POXc7yr57cNu9j5S8drr1/J/F9m9nwQPFl9ScczBKl4OnR9CMFCpCgN2KovPoBI
 reGm0DeBjHuYWPq9BCdMb+L/1c6K02pdAA3C6E/qBDJfHtziSvWvKzzy6uTYknGrP/JM
 NGE47xeZV1o11wQBHU2AUmsNPq+CKV5Z8D9UxjcFx6I933LeS6rhAaD6B0UBLS144Syo
 DkgQ==
X-Gm-Message-State: AOAM531Be4ux7JpdcRTxoo/5gdZ9gCy5j+Y+JLPMuM4Eg0kzimPoeu3I
 23+iXEDunWYKxc4+ZVdyvO/gP62RClFdbQ2xCto=
X-Google-Smtp-Source: ABdhPJwxi5ptN3FzIcuUewgPmFTiqPCpFHSxU/1rs3GHbeP2Zexr0ylqQwybqVY8YHntbJmqEze4c7lK7nOcT9grK0I=
X-Received: by 2002:ac2:51b4:: with SMTP id f20mr740123lfk.338.1606179824105; 
 Mon, 23 Nov 2020 17:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123031751.36811-2-daeho43@gmail.com>
 <20201123184821.GB3694916@gmail.com>
 <CACOAw_xEe=3H60njSfwJSToFnVbOHabUd2Nt=uZJLvCfxFgM4Q@mail.gmail.com>
 <X7xF8+jko5d71CKq@sol.localdomain>
In-Reply-To: <X7xF8+jko5d71CKq@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 24 Nov 2020 10:03:33 +0900
Message-ID: <CACOAw_xZCC3u08=ZB_Ugk-LJs1wJL3ByJhuxwNK9zOYqU46Jzg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1khMkI-001NiO-Q2
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

MjAyMOuFhCAxMeyblCAyNOydvCAo7ZmUKSDsmKTsoIQgODoyOSwgRXJpYyBCaWdnZXJzIDxlYmln
Z2Vyc0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiBUdWUsIE5vdiAyNCwgMjAyMCBh
dCAwODowMjoyMUFNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEphZWdldWssCj4gPgo+
ID4gTXkgbWlzdGFrZX4KPiA+Cj4gPiBFcmljLAo+ID4KPiA+IFdoYXQgSSB3YW50IGlzIGxpa2Ug
ZG9fcGFnZV9jYWNoZV9yYSgpLCBidXQgSSB1c2VkCj4gPiBwYWdlX2NhY2hlX3JhX3VuYm91bmRl
ZCgpIGRpcmVjdGx5LCBiZWNhdXNlIHdlIGFscmVhZHkgY2hlY2tlZCB0aGF0Cj4gPiByZWFkIGlz
IHdpdGhpbiBpX3NpemUuCj4gPgo+ID4gT3Igd2UgY291bGQgdXNlIGRvX3BhZ2VfY2FjaGVfcmEo
KSwgYnV0IGl0IG1pZ2h0IGRvIHRoZSBzYW1lIGNoZWNrIGluIGl0IGFnYWluLgo+ID4gV2hhdCBk
byB5b3UgdGhpbms/Cj4KPiBwYWdlX2NhY2hlX3JhX3VuYm91bmRlZCgpIGlzIGJhc2ljYWxseSBh
IHF1aXJrIGZvciBob3cgZnMtdmVyaXR5IGlzIGltcGxlbWVudGVkCj4gaW4gZXh0NCBhbmQgZjJm
cy4gIEkgZG9uJ3QgdGhpbmsgcGVvcGxlIHdvdWxkIGJlIGhhcHB5IGlmIGl0J3MgdXNlZCBpbiBv
dGhlcgo+IGNhc2VzLCB3aGVyZSBpdCdzIG5vdCBuZWVkZWQuICBDaGVja2luZyBhZ2FpbnN0IGlf
c2l6ZSBtdWx0aXBsZSB0aW1lcyBpcyBmaW5lLgo+CgpHb3QgeW91ciBwb2ludC4gVGhhbmtzLgoK
PiA+Cj4gPiBJIGNvdWxkIGFkZCBzb21lIGRlc2NyaXB0aW9uIGFib3V0IHRoZXNlIGluCj4gPiBE
b2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IGFuZCBJIGltcGxlbWVudGVkIHRlc3Rz
IGludGVybmFsbHkuCj4KPiBEb2N1bWVudGF0aW9uIGluIGYyZnMucnN0IHNvdW5kcyBnb29kLiAg
QWxsIHRoZSBmMmZzIGlvY3RscyBzaG91bGQgYmUKPiBkb2N1bWVudGVkIHRoZXJlLgo+Cj4gVGhl
IHRlc3RzIHNob3VsZCBiZSBydW5uYWJsZSBieSBhbnkga2VybmVsIGRldmVsb3BlcjsgImludGVy
bmFsIiB0ZXN0cyBhcmVuJ3QKPiB2ZXJ5IHVzZWZ1bC4gIENvdWxkIHlvdSBhZGQgdGVzdHMgdG8g
eGZzdGVzdHM/Cj4KClllcywgSSdsbCBhZGQgYWxsIHRoZSBpbnRlcm5hbCB0ZXN0IGNhc2VzIHRv
IHhmc3Rlc3RzIHNvb25+Cgo+IC0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
