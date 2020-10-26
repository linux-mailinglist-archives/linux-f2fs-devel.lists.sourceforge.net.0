Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CE299A76
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 00:31:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXBxm-0004lz-8z; Mon, 26 Oct 2020 23:31:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kXBxg-0004lI-9C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJqtnZ8asq4bny750fVTQgJnYnxKe9lnoylCtFpur88=; b=EhCVv5OH57cUFQbfV3JNYi8KYe
 qHzVALFPz8Yoi6NjI+qsNtSy5UW5yAwMg/B53fVCQadsju4pEUDkssV0vETXZvug8Xglf3BsMDhSc
 6ZOYQTXOTbe9qmoEQ6DIdqQAFFEpsnS+4JfcDzjoBk5d4bV9NU7jb4HskM0YdyPf1SP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cJqtnZ8asq4bny750fVTQgJnYnxKe9lnoylCtFpur88=; b=Oqf2H8bJiZQvqgw7WSNmDVyQu9
 y40x5RIGyoKmpGh4Jm40/mn1DbII0KxFTguPG59TyYR276jdhmNIFLSG1Eu9jhER6+U/ijW2BDWDP
 hL+z/7tg/ezuimlEYzmJaWXXQQPwxqj+7ePeDh2pvTJSru6uMM0boLUFHpfKBWmh4zYI=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kXBxe-00Et9k-02
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 23:31:36 +0000
Received: by mail-lf1-f68.google.com with SMTP id a7so14592473lfk.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Oct 2020 16:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cJqtnZ8asq4bny750fVTQgJnYnxKe9lnoylCtFpur88=;
 b=RqM+nxRCebPhd7s1uKaV6vz/hsqV7luhwvkGZt4aL6WxyWg4vSdi+IGsr3XWhD/qT3
 eR27XfcEHxeUlkkc14UyZz5R9QL73pdKw0ZqC5KELHimaVyinTp4jKET8EwFTeX9ZUTl
 h3WEnYUOhvVUudj96KxPwCj4ckNBSmADYDaBHlEGykjLTxqVGPIR+x2cQ0+KJJgpCEXh
 QVh/LvZXIkcPi4y+xP6cXpFUumcDYuQbVt5kQlS0zwPcmKIdl92dQT+gqEtgp9/oO2kF
 pLQaDhV8jXvZFKphgTnhEEkRKZw3B8xeG3fUe267N6GrN53TnPn+lOeJQ3mtu9+vlVC/
 jMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cJqtnZ8asq4bny750fVTQgJnYnxKe9lnoylCtFpur88=;
 b=NMOlyY9LgUZSGGkfSsU+kk2fzP48xltWH/s/5sJg1xaFGwepqzKcoqRDU9ScRAXYOL
 JEU2YFOjjeupXyTziWSIfK//KgYun74Zk53a8+Lx//itFhlCeVr/5+7QayPQZaGZA89G
 NsQU0GLa7OphaUOKyutLDQrSElHqToNeFFnZNyO6xCnV/kAtofjGOkywOy1rX7Ppiu0Q
 fsPIl6jHnXWnXz8O8Q7CC1Q5YbQpBIXDlucO7lfZjrYNF1khfpWA9PeN0NA0wtTFeEaM
 F7OLqnMJ/5OIENSKoZztNB8YP2WvJLGwcgDCjX/mL8kQ5JTy1o8wAszn069Ko5wfg0hI
 1Yrw==
X-Gm-Message-State: AOAM533DG7Dq3eE3cKkvGUZjgHjMfWOIz/+dhFQJQrbh1Ald1zeuc4l0
 +s0CjWN4xQynBtm/sfp0GBwQ4lBFEp62jfnrDlzEVMFXX4WRQw==
X-Google-Smtp-Source: ABdhPJzsleTazzH4s3ND9aMfT4WQrWA1iR79yBLH0tok4g5DotVCnirrIOAuRnOuDqANgg0ROdaFf4VqrJeKwiQ1ElY=
X-Received: by 2002:a05:651c:130d:: with SMTP id
 u13mr7705266lja.265.1603754335662; 
 Mon, 26 Oct 2020 16:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201026041656.2785980-1-daeho43@gmail.com>
 <20201026190406.GL858@sol.localdomain>
 <CACOAw_xFijZOokM4R1XYKoFvRthk-ZfC+hNz0c-HqQuurjp87g@mail.gmail.com>
 <20201026230555.GB1947033@gmail.com>
In-Reply-To: <20201026230555.GB1947033@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 27 Oct 2020 08:18:44 +0900
Message-ID: <CACOAw_wLE_om3YChs_jsBTORrOsp2M6SZ+t2arP9tHQeojsgKQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kXBxe-00Et9k-02
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: add
 F2FS_IOC_GET_COMPRESS_OPTION ioctl
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

SSBjaGVja2VkIHRoYXQuIFdlIHNlZW0gdG8gbmVlZCB0byBjb21wbGVtZW50IG1pc3NpbmcgcGFy
dHMgaW5jbHVkaW5nCm90aGVyIGlvY3RscyBpbiBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2Zz
Y3J5cHQucnN0LgoKVGhhbmtzfgoKMjAyMOuFhCAxMOyblCAyN+ydvCAo7ZmUKSDsmKTsoIQgODow
NSwgRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBP
biBUdWUsIE9jdCAyNywgMjAyMCBhdCAwODowMjoxOEFNICswOTAwLCBEYWVobyBKZW9uZyB3cm90
ZToKPiA+IEkgdGhvdWdodCBJIGdhdmUgdGhlIGluZm9ybWF0aW9uIGFib3V0IHRoYXQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLiBJcwo+ID4gdGhpcyBub3QgZW5vdWdoIGZvciB5b3U/Cj4gPiBBY3R1
YWxseSwgdGhlcmUgaXMgbm8gc3BhY2UgZm9yIEYyRlMgaW9jdGwgZG9jdW1lbnRhdGlvbiBub3cu
IDooCj4gPgo+Cj4gVGhlIGNvbW1pdCBtZXNzYWdlIGRvZXNuJ3QgcmVhbGx5IG1hdHRlci4gIFdo
YXQgSSBhbSBhc2tpbmcgZm9yIGFyZSBhY3R1YWwKPiBkb2N1bWVudGF0aW9uIGFuZCB0ZXN0cy4K
Pgo+IFRoZSBmc2NyeXB0IGlvY3RscywgZm9yIGV4YW1wbGUsIGFyZSBhbGwgZG9jdW1lbnRlZCBp
bgo+IERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZnNjcnlwdC5yc3QsIGFuZCB0aGV5IGhhdmUg
dGVzdHMgaW4geGZzdGVzdHMuCj4KPiAtIEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
