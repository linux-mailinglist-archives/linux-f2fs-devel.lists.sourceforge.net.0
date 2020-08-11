Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAEA2418F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 11:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5QfD-00051R-MY; Tue, 11 Aug 2020 09:33:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k5QfB-000518-Il
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 09:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vr+YAPUn6N4dSx2qVc2bEJB62Hk13xcs0NQkMDb0a3E=; b=BX9DEhr3pFdrGo5BgytWfP9dcm
 34Y/hyWCJGalnQdgCmJvWvO087iOQ5zbZu25kOA71tEAkclONbL7McJ87b0QkcLIXyjxBwa6YilPK
 VNXvgzthu+gjZP2/p4kknd9fxVorid4eZwqpSjidKjg8TyQI2I4wg1HkFUeSBLWtUI/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vr+YAPUn6N4dSx2qVc2bEJB62Hk13xcs0NQkMDb0a3E=; b=LeyW25Cgfl2tBSW5w6k6kx0o3c
 N7kx4GTYWTwWgpQcqrNVXicr4i5A7ahxvwxELOQZPquWc1/7NwCK7VHHaxV7L/hDWZkS/KktGnbLm
 anbLmfDvaNm5Vtzm0IvYT0qMUtccRFP/6B6nnM8H7cgXyb0/tLgS7ZuHvBTIDrpgnh6c=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5QfA-000JeV-3l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 09:33:45 +0000
Received: by mail-lf1-f66.google.com with SMTP id m15so6285734lfp.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vr+YAPUn6N4dSx2qVc2bEJB62Hk13xcs0NQkMDb0a3E=;
 b=Omj1hGSjKXZRe1OLMx57+tZ3KgMo68eDvuhMeeQj/DYbyY/7bi2vWawvkV4mlze3mN
 qnEHESnfoW5DC939GmMhwMZsoas8HUIUdt6AgPVB9vGCloiAQ++qW02yvHB6IQttb4zh
 T1E92N6m6cfdtDB6dVgLB1ILze8LIHAxDY+fn33rQXxQDxlyIrlcMlCg46v+BcyAig0r
 xHyFvYV+bAYFN7qxJKVnQ7aaOyzO+1i7VgS0KIxrf0jyFMI9wvFz91qcyTigQB3FgENs
 sJCl9sJmfxR+PmP2lpxG9KqqSDYWZhUqiH5aV9j3fTZdCM61iGBszPRB7+Jqma+kIzum
 25Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vr+YAPUn6N4dSx2qVc2bEJB62Hk13xcs0NQkMDb0a3E=;
 b=kHNIppu9gX9eonnrYB9ZfX3jkyWEV8NHu3+7prVBm//8m/RMhl7OtAuJIfq5MSbPLL
 uo8fm3tvIyyIkFshR/HnjhCXe9EkC3bAdXqHb2iunjTJeQ1LD1FQ84QCFGCGDgJ3NG1r
 nN7fd5wPV615HUeY6YXnNZdaz5qz5MFHj4X7htCl6AzBypowypI7JALqS5EmdVghQ/45
 iT5UQkG4PxvrGrRQSPthWtTGIomqNAPb5/fwpeVYIbQH5d+KuwJFoCybWFmglPaxR11e
 pTY6TmecpLygbyMGf/bUMRwkOu7jB27WQ6nclHs30tcUOzE31SENKY0gNPc56HUlVMzD
 yp2w==
X-Gm-Message-State: AOAM532BKyKG+bmZjOMCCr0uCxU1Yx1a/9MFT9d+5Ty8dq7MwYJEOMln
 sxA9FJy+bfFEQK0UsTV2MHe5zeUZei/1Cxu5McQ=
X-Google-Smtp-Source: ABdhPJzDIV6ej2CnAWTam+6M7DMCu/58gN3ERRhWB631uDglP2D16ZpLlMoWSMKJRFK7bmUEmYTGXH9gxP4r2GV6ePI=
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr2783256lfc.100.1597138417413; 
 Tue, 11 Aug 2020 02:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
 <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
In-Reply-To: <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 11 Aug 2020 18:33:26 +0900
Message-ID: <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5QfA-000JeV-3l
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net,
 Gao Xiang <hsiangkao@redhat.com>, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGx1cywgd2hlbiB3ZSB1c2Ugdm1hcCgpLCB2bWFwKCkgbm9ybWFsbHkgZXhlY3V0ZXMgaW4gYSBz
aG9ydCB0aW1lCmxpa2Ugdm1fbWFwX3JhbSgpLgpCdXQsIHNvbWV0aW1lcywgaXQgaGFzIGEgdmVy
eSBsb25nIGRlbGF5LgoKMjAyMOuFhCA47JuUIDEx7J28ICjtmZQpIOyYpO2bhCA2OjI4LCBEYWVo
byBKZW9uZyA8ZGFlaG80M0BnbWFpbC5jb20+64uY7J20IOyekeyEsToKPgo+IEFjdHVhbGx5LCBh
cyB5b3UgY2FuIHNlZSwgSSB1c2UgdGhlIHdob2xlIHplcm8gZGF0YSBibG9ja3MgaW4gdGhlIHRl
c3QgZmlsZS4KPiBJdCBjYW4gbWF4aW1pemUgdGhlIGVmZmVjdCBvZiBjaGFuZ2luZyB2aXJ0dWFs
IG1hcHBpbmcuCj4gV2hlbiBJIHVzZSBub3JtYWwgZmlsZXMgd2hpY2ggY2FuIGJlIGNvbXByZXNz
ZWQgYWJvdXQgNzAlIGZyb20gdGhlCj4gb3JpZ2luYWwgZmlsZSwKPiBUaGUgdm1fbWFwX3JhbSgp
IHZlcnNpb24gaXMgYWJvdXQgMnggZmFzdGVyIHRoYW4gdm1hcCgpIHZlcnNpb24uCj4KPiAyMDIw
64WEIDjsm5QgMTHsnbwgKO2ZlCkg7Jik7ZuEIDQ6NTUsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2Vp
LmNvbT7ri5jsnbQg7J6R7ISxOgo+ID4KPiA+IE9uIDIwMjAvOC8xMSAxNToxNSwgR2FvIFhpYW5n
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAxMjozNzo1M1BNICswOTAwLCBE
YWVobyBKZW9uZyB3cm90ZToKPiA+ID4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdv
b2dsZS5jb20+Cj4gPiA+Pgo+ID4gPj4gQnkgcHJvZmlsaW5nIGYyZnMgY29tcHJlc3Npb24gd29y
a3MsIEkndmUgZm91bmQgdm1hcCgpIGNhbGxpbmdzIGFyZQo+ID4gPj4gYm90dGxlbmVja3Mgb2Yg
ZjJmcyBkZWNvbXByZXNzaW9uIHBhdGguIENoYW5naW5nIHRoZXNlIHdpdGgKPiA+ID4+IHZtX21h
cF9yYW0oKSwgd2UgY2FuIGVuaGFuY2UgZjJmcyBkZWNvbXByZXNzaW9uIHNwZWVkIHByZXR0eSBt
dWNoLgo+ID4gPj4KPiA+ID4+IFtWZXJpZmljYXRpb25dCj4gPiA+PiBkZCBpZj0vZGV2L3plcm8g
b2Y9ZHVtbXkgYnM9MW0gY291bnQ9MTAwMAo+ID4gPj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ry
b3BfY2FjaGVzCj4gPiA+PiBkZCBpZj1kdW1teSBvZj0vZGV2L3plcm8gYnM9NTEyawo+ID4gPj4K
PiA+ID4+IC0gdy9vIGNvbXByZXNzaW9uIC0KPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBH
KSBjb3BpZWQsIDEuOTk5Mzg0IHMsIDUwMCBNL3MKPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAu
OSBHKSBjb3BpZWQsIDIuMDM1OTg4IHMsIDQ5MSBNL3MKPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMg
KDAuOSBHKSBjb3BpZWQsIDIuMDM5NDU3IHMsIDQ5MCBNL3MKPiA+ID4+Cj4gPiA+PiAtIGJlZm9y
ZSBwYXRjaCAtCj4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5LjE0NjIx
NyBzLCAxMDkgTS9zCj4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5Ljk5
NzU0MiBzLCAxMDAgTS9zCj4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAx
MC4xMDk3MjcgcywgOTkgTS9zCj4gPiA+Pgo+ID4gPj4gLSBhZnRlciBwYXRjaCAtCj4gPiA+PiAx
MDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjI1MzQ0MSBzLCA0NDQgTS9zCj4gPiA+
PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjczOTc2NCBzLCAzNjUgTS9zCj4g
PiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjE4NTY0OSBzLCA0NTggTS9z
Cj4gPiA+Cj4gPiA+IEluZGVlZCwgdm1hcCgpIGFwcHJvYWNoIGhhcyBzb21lIGltcGFjdCBvbiB0
aGUgd2hvbGUKPiA+ID4gd29ya2Zsb3cuIEJ1dCBJIGRvbid0IHRoaW5rIHRoZSBnYXAgaXMgc3Vj
aCBzaWduaWZpY2FudCwKPiA+ID4gbWF5YmUgaXQgcmVsYXRlcyB0byB1bmxvY2tlZCBjcHVmcmVx
IChhbmQgYmlnIGxpdHRsZQo+ID4gPiBjb3JlIGRpZmZlcmVuY2UgaWYgaXQncyBvbiBzb21lIGFy
bTY0IGJvYXJkKS4KPiA+Cj4gPiBBZ3JlZWQsCj4gPgo+ID4gSSBndWVzcyB0aGVyZSBzaG91bGQg
YmUgb3RoZXIgcmVhc29uIGNhdXNpbmcgdGhlIGxhcmdlIHBlcmZvcm1hbmNlCj4gPiBnYXAsIHNj
aGVkdWxpbmcsIGZyZXF1ZW5jeSwgb3Igc29tZXRoaW5nIGVsc2UuCj4gPgo+ID4gPgo+ID4gPgo+
ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gPiA+IC4KPiA+ID4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
