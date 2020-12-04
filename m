Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7598B2CE716
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 05:48:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl31W-0006kh-ID; Fri, 04 Dec 2020 04:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kl31S-0006k9-DS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w5FwqvJ/2TbkgG2DOxuzIJIYSm5j8vEtl6T3++ATpdc=; b=BwO3eFqXUqZkFcV3TXQv/R5bPY
 yTc6TbBUzELeoBqIrqoS+UwF3dWrd2D///XCcoBJiBCSnMGFKlttjqa+SvMN1P6N48FzRv0BXgyys
 Uh1NmsgaRZpgVWAaLajndMf6oTgjiW3rgdjtwUymfi9raV7PfGlzNNiggLsooL1QzaWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w5FwqvJ/2TbkgG2DOxuzIJIYSm5j8vEtl6T3++ATpdc=; b=YbZslIiBjctxZqAI+aoVfPQhtn
 qywODDTgNJZfI6fgpjuxX1Fb/FNC7WAanDPFNnsUOJ+loDHu4wCIA71gxXyuctc1LJljxe1F5w2XK
 X2f1ChEdWZIBaJgh5B+VAjVHIF9H2o359Ax++/xoFRa/yU4d6hksXKRBjH+cdN7/ZkEQ=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kl31N-0014sU-VR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:48:46 +0000
Received: by mail-lf1-f42.google.com with SMTP id v14so5968781lfo.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 20:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w5FwqvJ/2TbkgG2DOxuzIJIYSm5j8vEtl6T3++ATpdc=;
 b=jB0EDdD5538iWidqdjfnmAOKeJPsYGv13SGqZaDzAI7gQstu3EzEZJJg/d/MrFdK4p
 dfHSudm9uELbTVor9xqDCEIHmqecLsP/Sd6ETimLNKL/VL0gG5/dwK+hrHYw1S1X3+eO
 tPlZTLkBthEPI28jeXKgnOcwPrwlQMfk7ovXCh049oMFkNeFb1oBZHyn8W1r27727CHH
 t2fRQ3R4HxvBw1MA4dz37Vfm+wbTLUuPRr4zZaRrPUbXgIFLXw03TljSmoMh24gdmw6d
 grkHoJOREMR8HAnsPuSmfb/VoCe3DDZfS0R+d5YoUpMknphuoDhdX5ZVienl365CHbSF
 HDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w5FwqvJ/2TbkgG2DOxuzIJIYSm5j8vEtl6T3++ATpdc=;
 b=CR07ppyLhpRVz/qVNFcccS9H6tdMh5QLvuUZl6MHh7xmsZHe3ZRyyMHLNJelc9pxSO
 iZ9m1g/0Af1XjOW31ORiD+e3P/PqTJNtn6EvgKZYpMmnFPK13jZIwHDOhwHM932RjP4J
 9jb+Fyf5Jc/RXGOb4CRh69xGUAB48rtSiytv/DBOjxkOKBLT2zenG233jz7XV46+TfHX
 Or9FmZXwHAfb33evyoN4y1oNq7taM3+q9nuZytkpMpERwOpWfSB9wN/rKYDSv9k0JrgT
 WcjKu8f1BdpMDjz+3DrYC52ol+sczja6vxUPD8JplSwEb4sf9l9qi1P120XHzhROxpPx
 ZJAg==
X-Gm-Message-State: AOAM5314zw09qNmAcpjI/3r16VYjZjjJWtPhB84siMNKqjoY51fYzsXe
 j2PWtkaF/QiIM17iGC7YBALCZROLx8qcxmYDN7g=
X-Google-Smtp-Source: ABdhPJxqT/2umaD4/aHu85/MWv3TrsuUpe9Hy8GaC1bYpsgxw0TUYbQq4oA0fCCEsLK/Ld61/NNH+k6Qq2uTq/6mSl0=
X-Received: by 2002:a05:6512:3a6:: with SMTP id
 v6mr2440496lfp.90.1607057315322; 
 Thu, 03 Dec 2020 20:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
 <X8m0qbd7rvQyiwOt@sol.localdomain>
 <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
In-Reply-To: <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 4 Dec 2020 13:48:24 +0900
Message-ID: <CACOAw_xzKjZcpVTo3aj5sJUQ_BjLr=5ZhnfuyFwYerpyzZu+aw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kl31N-0014sU-VR
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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

RXJpYywKCkkgaGF2ZSBhbm90aGVyIHF1ZXN0aW9uLgpJIHVuZGVyc3RhbmQgZW5hYmxpbmcgdGhl
IHZlcml0eSBjYW4gYmUgcG9zc2libGUgaW4gdGhlIG1pZGRsZSBvZiBJL08uCklzIHRoZSBvcHBv
c2l0ZSB3YXkgYWxzbyBwb3NzaWJsZT8gQWN0dWFsbHksIEkgY291bGRuJ3QgZmluZCBhbnkKZGlz
YWJsaW5nIGZ1bmN0aW9uIG9mIGl0LCB0aG91Z2guCgoyMDIw64WEIDEy7JuUIDTsnbwgKOq4iCkg
7Jik7ZuEIDE6MzEsIERhZWhvIEplb25nIDxkYWVobzQzQGdtYWlsLmNvbT7ri5jsnbQg7J6R7ISx
Ogo+Cj4gPiBBcmUgeW91IHN1cmU/ICBJIHRob3VnaHQgdGhhdCBjb21wcmVzc2lvbiAoYW5kIGVu
Y3J5cHRpb24pIGFwcGx5IHRvIHRoZSB3aG9sZQo+ID4gZmlsZSwgaW5jbHVkaW5nIGFueSBNZXJr
bGUgdHJlZSBibG9ja3MgcGFzdCBpX3NpemUuCj4KPiBUaGlzICJkaWMiIHN0cnVjdHVyZSBpcyBv
bmx5IGZvciAiZGUiY29tcHJlc3Npb24sIHNvIHdlIGRvbid0IG5lZWQgdG8KPiB3b3JyeSBhYm91
dCBnb2luZyBiZXlvbmQgaV9zaXplIGNhc2UuCj4KPiA+IEFsc28sIGV2ZW4gaWYgeW91IGluY2x1
ZGUgdGhlIGlfc2l6ZSBjaGVjaywgaXQncyBzdGlsbCB3cm9uZyB0byBjaGVjawo+ID4gZnN2ZXJp
dHlfYWN0aXZlKCkgaW4gdGhlIG1pZGRsZSBvZiB0aGUgSS9PIGJlY2F1c2UgRlNfSU9DX0VOQUJM
RV9WRVJJVFkgY2FuCj4gPiBleGVjdXRlIGNvbmN1cnJlbnRseSwgY2F1c2luZyBmc3Zlcml0eV9h
Y3RpdmUoKSB0byByZXR1cm4gZmFsc2UgYXQgdGhlIGJlZ2lubmluZwo+ID4gb2YgdGhlIEkvTyBh
bmQgdHJ1ZSBsYXRlciBpbiB0aGUgSS9PLiAgSXQgbmVlZHMgdG8gYmUgY2hlY2tlZCBvbmx5IG9u
Y2UsIGF0IHRoZQo+ID4gYmVnaW5uaW5nLi4uCj4KPiBHb3QgaXQuIE91ciBwcmV2aW91cyBpbXBs
ZW1lbnRhdGlvbiBkaWRuJ3QgY29uc2lkZXIgdGhpcyBjYXNlLiBOZWVkIHRvIGZpeCB0aGlzLgo+
Cj4gVGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
